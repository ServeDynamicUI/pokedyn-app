import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:pokedyn_server/src/generated/protocol.dart';
import 'package:pokedyn_server/src/utils/util.dart';
import 'package:serverpod/serverpod.dart';
import 'package:pokedyn_server/src/generated/widget.dart' as gen;
import 'package:http/http.dart' as http;

import '../generated/page_uri_mapping.dart';
import '../generated/page_widget_mapping.dart';

class PokemonDetailPageEndpoint extends Endpoint {
  
  Map<String, dynamic>? pokemonDetail;
  
  Future<String> getPage(Session session) async {
    Map<String, dynamic> query = (session as MethodCallSession).queryParameters;
    if (!query.containsKey('pokemon')) {
      return '';
    }

    String pokemonId = query['pokemon'];
    pokemonDetail = await _fetchPokemonData(pokemonId);
    
    assert(pokemonDetail != null);

    PageUriMapping? page = await PageUriMapping.db.findFirstRow(session,
        where: (table) => table.pageUri.equals((session).endpointName));
    Map<String, dynamic> pageJsonData = jsonDecode(
      jsonDecode(page!.pageData
          .replaceAll("{POKEMON_ID}", _formatId(pokemonId))
          .replaceAll("{LINEAR_GRADIENT_AS_PER_POKEMON_MAIN_TYPE}", _getPokemonTypeGradient(pokemonDetail!['types'][0]))),
    );

    List<PageWidgetMapping>? pageWidgetMappingList = await PageWidgetMapping.db.find(session, where: (table) => table.pageId.equals(page.pageId));

    Set<int> parentWidgetIds = {};
    for (PageWidgetMapping pageWidgetMapping in pageWidgetMappingList) {
      parentWidgetIds.add(pageWidgetMapping.widgetId);
    }

    List<WidgetWidgetMapping>? widgetWidgetMappings = await WidgetWidgetMapping.db.find(session, where: (table) => table.parentWidget.inSet(parentWidgetIds));
    Set<int> widgetIds = {};
    for (WidgetWidgetMapping widgetWidgetMapping in widgetWidgetMappings) {
      widgetIds.add(widgetWidgetMapping.parentWidget);
      if(widgetWidgetMapping.childWidgetId != null){
        widgetIds.add(widgetWidgetMapping.childWidgetId!);
      }
    }
    
    List<gen.Widget>? widgets = await gen.Widget.db.find(session, where: (table) => table.widgetId.inSet(widgetIds));

    String carouselJsonString = "";
    String pokemonCarouselCardJsonString = "";
    String pokemonDetailPokemonNameJsonString = "";
    String pokemonDetailPokemonTypeRowJsonString = "";
    String pokemonDetailBaseStatsTextJsonString = "";
    String pokemonDetailStatsColumnJsonString = "";
    String pokemonDetailStatPercentIndicatorJsonString = "";

    for(gen.Widget widget in widgets){
      if(widget.widgetName == "pokemon_carousel"){
        carouselJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_carousel_card"){
        pokemonCarouselCardJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_detail_pokemon_name"){
        pokemonDetailPokemonNameJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_detail_pokemon_type_row"){
        pokemonDetailPokemonTypeRowJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_detail_base_stats_text"){
        pokemonDetailBaseStatsTextJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_detail_stats_column"){
        pokemonDetailStatsColumnJsonString = widget.widgetData;
      }
      else if(widget.widgetName == "pokemon_detail_stat_percent_indicator"){
        pokemonDetailStatPercentIndicatorJsonString = widget.widgetData;
      }
    }
    
    Map<String, dynamic> carouselJson = Util.getMapFromString(carouselJsonString.replaceAll('{KEY_1}', Util.generateRandomString(10)));

    _addCarouselCards(carouselJson, pokemonCarouselCardJsonString);

    pageJsonData['data']['children'] = [];
    (pageJsonData['data']['children'] as List).add(carouselJson);
    (pageJsonData['data']['children'] as List).add(_addPokemonNameCard(pokemonDetailPokemonNameJsonString));
    (pageJsonData['data']['children'] as List).add(_addPokemonTypeRow(pokemonDetailPokemonTypeRowJsonString));
    (pageJsonData['data']['children'] as List).add(_addPokemonBaseStatsText(pokemonDetailBaseStatsTextJsonString));
    (pageJsonData['data']['children'] as List).add(_addPokemonStatsColumn(pokemonDetailStatsColumnJsonString, pokemonDetailStatPercentIndicatorJsonString));

    return jsonEncode(pageJsonData);
  }

  Map<String, dynamic> _addPokemonStatsColumn(String pokemonDetailStatsColumnJsonString, String pokemonDetailStatPercentIndicatorJsonString){
    Map<String, dynamic> pokemonDetailStatsColumnJson = Util.getMapFromString(pokemonDetailStatsColumnJsonString
        .replaceAll("{KEY_1}", Util.generateRandomString(15))
    );

    pokemonDetailStatsColumnJson['data']['children'] = [];

    Map<String, Map<String, dynamic>> stats = pokemonDetail!['stats'];

    for(MapEntry<String, Map<String, dynamic>> stat in stats.entries){
      String pokemonDetailStatJsonString = pokemonDetailStatPercentIndicatorJsonString;

      for(int i=1;i<=4;i++){
        String key = '{KEY_$i}';
        pokemonDetailStatJsonString = pokemonDetailStatJsonString.replaceAll(key, Util.generateRandomString(10));
      }

      pokemonDetailStatJsonString = pokemonDetailStatJsonString
        .replaceAll('{PERCENT_VALUE_IN_DOUBLE}', ((stat.value['value'] / stat.value['maxValue']) as num).toDouble().toString())
        .replaceAll('{GRADIENT_AS_PER_STAT}', stat.value['gradient'].toString())
        .replaceAll('{PERCENT_VALUE_TEXT}', ('${stat.value['value']} / ${stat.value['maxValue']}'))
        .replaceAll('{STAT_NAME}', stat.key);

      (pokemonDetailStatsColumnJson['data']['children'] as List).add(Util.getMapFromString(pokemonDetailStatJsonString));
    }

    return pokemonDetailStatsColumnJson;
  }

  Map<String, dynamic> _addPokemonBaseStatsText(String pokemonDetailBaseStatsTextJsonString){
    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonDetailBaseStatsTextJsonString
        .replaceAll("{KEY_1}", Util.generateRandomString(15))
        .replaceAll("{KEY_2}", Util.generateRandomString(15))
    );

    return pokemonDetailPokemonNameJson;
  }

  Map<String, dynamic> _addPokemonNameCard(String pokemonDetailPokemonName){
    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonDetailPokemonName
        .replaceAll("{KEY_1}", Util.generateRandomString(15))
        .replaceAll("{KEY_2}", Util.generateRandomString(15))
        .replaceAll("{POKEMON_NAME}", pokemonDetail!['name'])
    );

    return pokemonDetailPokemonNameJson;
  }

  Map<String, dynamic> _addPokemonTypeRow(String pokemonTypeDetailString){

    for(int i=1;i<=16;i++){
      String key = "{KEY_$i}";
      pokemonTypeDetailString = pokemonTypeDetailString.replaceAll(key, Util.generateRandomString(15));
    }

    for(int i=1;i<=(pokemonDetail!['types'] as List).length;i++){
      String key = "{POKEMON_TYPE$i}";
      String colorKey = "{POKEMON_TYPE${i}_COLOR}";
      pokemonTypeDetailString = pokemonTypeDetailString
          .replaceAll(key, pokemonDetail!['types'][i-1])
          .replaceAll(colorKey, Util.getColorForPokemonType(pokemonDetail!['types'][i-1]));
    }

    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonTypeDetailString
        .replaceAll("{POKEMON_WEIGHT}", pokemonDetail!['weight'].toString())
        .replaceAll("{POKEMON_HEIGHT}", pokemonDetail!['height'].toString())
    );

    return pokemonDetailPokemonNameJson;
  }

  void _addCarouselCards(Map<String, dynamic> carouselJson, String pokemonCarouselCardJsonString){
    carouselJson['data']['children'] = [];
    
    List<String> images = pokemonDetail!['images'] as List<String>;

    String pokemonCard1 = pokemonCarouselCardJsonString;
    String pokemonCard2 = pokemonCarouselCardJsonString;

    String mainType = _getPokemonTypeGradient(pokemonDetail!['types'][0]);

    Map<String, dynamic> pokemonCardJson1 = Util.getMapFromString(pokemonCard1
        .replaceAll("{LINEAR_GRADIENT_AS_PER_TYPE}", mainType)
        .replaceAll('{POKEMON_OFFICIAL_ARTWORK_PNG_URL}', images[0])
        .replaceAll('{KEY_1}', Util.generateRandomString(15))
        .replaceAll('{KEY_2}', Util.generateRandomString(15)));

    Map<String, dynamic> pokemonCardJson2 = Util.getMapFromString(pokemonCard2
            .replaceAll("{LINEAR_GRADIENT_AS_PER_TYPE}", mainType)
            .replaceAll('{POKEMON_OFFICIAL_ARTWORK_PNG_URL}', images[1])
            .replaceAll('{KEY_1}', Util.generateRandomString(15))
            .replaceAll('{KEY_2}', Util.generateRandomString(15)),
    );


    (carouselJson['data']['children'] as List).add(pokemonCardJson1);
    (carouselJson['data']['children'] as List).add(pokemonCardJson2);
  }

  String _formatId(String id) {
    return '#${id.padLeft(4, '0')}';
  }

  String _getPokemonTypeGradient(String type) {
    switch (type) {
      case 'normal':
        return '-1.0,0.0;1.0,0.0;0xFF8E8E8E,0xFFC0C0C0'; // Grey to Silver
      case 'fire':
        return '-1.0,0.0;1.0,0.0;0xFFFF4500,0xFFFFA500'; // Orange Red to Orange
      case 'water':
        return '-1.0,0.0;1.0,0.0;0xFF1E90FF,0xFF00BFFF'; // Dodger Blue to Deep Sky Blue
      case 'electric':
        return '-1.0,0.0;1.0,0.0;0xFFFFD700,0xFFFFFF00'; // Gold to Yellow
      case 'grass':
        return '-1.0,0.0;1.0,0.0;0xFF32CD32,0xFF98FB98'; // Lime Green to Pale Green
      case 'ice':
        return '-1.0,0.0;1.0,0.0;0xFF00CED1,0xFFAFEEEE'; // Dark Turquoise to Pale Turquoise
      case 'fighting':
        return '-1.0,0.0;1.0,0.0;0xFF8B0000,0xFFFF6347'; // Dark Red to Tomato
      case 'poison':
        return '-1.0,0.0;1.0,0.0;0xFF800080,0xFFDDA0DD'; // Purple to Plum
      case 'ground':
        return '-1.0,0.0;1.0,0.0;0xFFD2B48C,0xFFF5DEB3'; // Tan to Wheat
      case 'flying':
        return '-1.0,0.0;1.0,0.0;0xFF87CEEB,0xFFB0E0E6'; // Sky Blue to Powder Blue
      case 'psychic':
        return '-1.0,0.0;1.0,0.0;0xFFFF69B4,0xFFFFB6C1'; // Hot Pink to Light Pink
      case 'bug':
        return '-1.0,0.0;1.0,0.0;0xFF6B8E23,0xFFADFF2F'; // Olive Drab to Green Yellow
      case 'rock':
        return '-1.0,0.0;1.0,0.0;0xFF8B4513,0xFFD2B48C'; // Saddle Brown to Tan
      case 'ghost':
        return '-1.0,0.0;1.0,0.0;0xFF4B0082,0xFF9370DB'; // Indigo to Medium Purple
      case 'dragon':
        return '-1.0,0.0;1.0,0.0;0xFF00008B,0xFF4169E1'; // Dark Blue to Royal Blue
      case 'dark':
        return '-1.0,0.0;1.0,0.0;0xFF000000,0xFF696969'; // Black to Dim Gray
      case 'steel':
        return '-1.0,0.0;1.0,0.0;0xFFB0C4DE,0xFF778899'; // Light Steel Blue to Slate Gray
      case 'fairy':
        return '-1.0,0.0;1.0,0.0;0xFFFFC0CB,0xFFFFB6C1'; // Pink to Light Pink
      case 'shadow':
        return '-1.0,0.0;1.0,0.0;0xFF2F4F4F,0xFF696969'; // Dark Slate Gray to Dim Gray
      default:
        return '-1.0,0.0;1.0,0.0;0xFFA8A878,0xFFD3D3D3'; // Default: Khaki to Light Gray
    }
  }

  Future<Map<String, dynamic>> _fetchPokemonData(String pokemonId) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> pokemonDetail = jsonDecode(response.body);
      Map<String, dynamic> pokemonData = {
        'name': pokemonDetail['name'],
        'types': _getPokemonTypes(pokemonDetail['types'] as List<dynamic>),
        'images': <String>[
          (pokemonDetail['sprites']['other']['official-artwork']['front_default']).toString(),
          (pokemonDetail['sprites']['other']['official-artwork']['front_shiny']).toString(),
        ],
        'id': pokemonId,
        "weight":(pokemonDetail['weight'] as num).toDouble() / 10,
        "height": (pokemonDetail['height'] as num).toDouble() / 10,
        "stats": _getStatValue(pokemonDetail['stats'] as List<dynamic>)
      };
      return pokemonData;
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }

  List<String> _getPokemonTypes(List<dynamic> pokemonTypes){
    List<String> types = pokemonTypes.map((value) => value['type']['name'] as String).toList();
    if(types.length == 1){
      types.add(types[0]);
    }
    return types;
  }

  Map<String, Map<String, dynamic>> _getStatValue(List<dynamic> statsList){
    Map<String, Map<String, dynamic>> convertedStats = {};

    for (var stat in statsList) {
      String statName = stat['stat']['name'];
      int baseStatValue = (stat['base_stat'] as num).toDouble().round();

      switch (statName) {
        case 'hp':
          convertedStats['HP'] = {"value": baseStatValue, "maxValue": 250, "gradient": "-1.0,0.0;1.0,0.0;0xFF808000,0xFFFF0000"};
          break;
        case 'attack':
          convertedStats['ATK'] = {"value": baseStatValue, "maxValue": 190, "gradient": "-1.0,0.0;1.0,0.0;0xFF006400,0xfffda626"};
          break;
        case 'defense':
          convertedStats['DEF'] = {"value": baseStatValue, "maxValue": 230, "gradient": "-1.0,0.0;1.0,0.0;0xff0290e9,0xfffff000"};
          break;
        case 'speed':
          convertedStats['SPD'] = {"value": baseStatValue, "maxValue": 180, "gradient": "-1.0,0.0;1.0,0.0;0xff8eafc4,0xff6e7ac4"};
          break;
      }
    }

    return convertedStats;
  }
}
