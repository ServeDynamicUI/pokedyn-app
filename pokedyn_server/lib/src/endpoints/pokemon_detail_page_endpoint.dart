import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:pokedyn_server/src/constants/string_constants.dart';
import 'package:pokedyn_server/src/generated/pokemon_data.dart';
import 'package:pokedyn_server/src/generated/protocol.dart';
import 'package:pokedyn_server/src/utils/map_util.dart';
import 'package:pokedyn_server/src/utils/util.dart';
import 'package:serverpod/serverpod.dart';
import 'package:pokedyn_server/src/generated/widget.dart' as gen;

import '../generated/page_uri_mapping.dart';
import '../generated/page_widget_mapping.dart';
import '../utils/pokemon_util.dart';

class PokemonDetailPageEndpoint extends Endpoint {
  
  PokemonData? pokemonDetail;
  late Session session;
  
  Future<String> getPage(Session session) async {
    this.session = session;
    Map<String, dynamic> query = (session as MethodCallSession).queryParameters;
    if (!query.containsKey(StringConstants.pokemon)) {
      return '';
    }

    String pokemonId = query[StringConstants.pokemon];
    PokemonData? pokemonDataModel = await session.caches.local.get<PokemonData>('${StringConstants.pokemon}$pokemonId');
    if(pokemonDataModel != null){
      pokemonDetail = pokemonDataModel;
    }
    else{
      pokemonDetail = await PokemonUtil.getPokemonData(pokemonId);
    }

    assert(pokemonDetail != null);

    PageUriMapping? page = await PageUriMapping.db.findFirstRow(session,
        where: (table) => table.pageUri.equals((session).endpointName));
    Map<String, dynamic> pageJsonData = jsonDecode(
      jsonDecode(page!.pageData
          .replaceAll(StringConstants.pokemonIdReplacer, PokemonUtil.formattedId(pokemonId))
          .replaceAll(StringConstants.linearGradientAsPerPokemonMainTypeReplacer, PokemonUtil.getPokemonTypeGradient(pokemonDetail!.types[0]))),
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
      switch(widget.widgetName){
        case StringConstants.pokemonCarousel:
          carouselJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonCarouselCard:
          pokemonCarouselCardJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonDetailPokemonName:
          pokemonDetailPokemonNameJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonDetailPokemonTypeRow:
          pokemonDetailPokemonTypeRowJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonDetailBaseStatsText:
          pokemonDetailBaseStatsTextJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonDetailStatsColumn:
          pokemonDetailStatsColumnJsonString = widget.widgetData;
          break;
        case StringConstants.pokemonDetailStatPercentIndicator:
          pokemonDetailStatPercentIndicatorJsonString = widget.widgetData;
          break;
      }
    }
    
    Map<String, dynamic> carouselJson = Util.getMapFromString(carouselJsonString.replaceAll('{KEY_1}', Util.generateRandomString(10)));

    _addCarouselCards(carouselJson, pokemonCarouselCardJsonString);

    pageJsonData[StringConstants.data][StringConstants.children] = [];
    (pageJsonData[StringConstants.data][StringConstants.children] as List)
        ..add(carouselJson)
        ..add(_addPokemonNameCard(pokemonDetailPokemonNameJsonString))
        ..add(_addPokemonTypeRow(pokemonDetailPokemonTypeRowJsonString))
        ..add(_addPokemonBaseStatsText(pokemonDetailBaseStatsTextJsonString))
        ..add(_addPokemonStatsColumn(pokemonDetailStatsColumnJsonString, pokemonDetailStatPercentIndicatorJsonString));

    pageJsonData.assignKeyWithRandomValues();
    return jsonEncode(pageJsonData);
  }

  Map<String, dynamic> _addPokemonStatsColumn(String pokemonDetailStatsColumnJsonString, String pokemonDetailStatPercentIndicatorJsonString){
    Map<String, dynamic> pokemonDetailStatsColumnJson = Util.getMapFromString(pokemonDetailStatsColumnJsonString);

    pokemonDetailStatsColumnJson[StringConstants.data][StringConstants.children] = [];

    Map<String, Map<String, String>> stats = pokemonDetail!.stats;

    for(MapEntry<String, Map<String, String>> stat in stats.entries){
      String pokemonDetailStatJsonString = pokemonDetailStatPercentIndicatorJsonString;

      int value = int.parse(stat.value[StringConstants.value] as String);
      int maxValue = int.parse(stat.value[StringConstants.maxValue] as String);

      pokemonDetailStatJsonString = pokemonDetailStatJsonString
        .replaceAll(StringConstants.percentValueInDoubleReplacer, (( value / maxValue) as num).toDouble().toString())
        .replaceAll(StringConstants.gradientAsPerStateReplacer, stat.value[StringConstants.gradient].toString())
        .replaceAll(StringConstants.percentValueTextReplacer, ('$value / $maxValue'))
        .replaceAll(StringConstants.statNameReplacer, stat.key);

      (pokemonDetailStatsColumnJson[StringConstants.data][StringConstants.children] as List).add(Util.getMapFromString(pokemonDetailStatJsonString));
    }

    return pokemonDetailStatsColumnJson;
  }

  Map<String, dynamic> _addPokemonBaseStatsText(String pokemonDetailBaseStatsTextJsonString){
    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonDetailBaseStatsTextJsonString);
    return pokemonDetailPokemonNameJson;
  }

  Map<String, dynamic> _addPokemonNameCard(String pokemonDetailPokemonName){
    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonDetailPokemonName.replaceAll(StringConstants.pokemonNameReplacer, pokemonDetail!.name));
    return pokemonDetailPokemonNameJson;
  }

  Map<String, dynamic> _addPokemonTypeRow(String pokemonTypeDetailString){
    for(int i=1;i<=(pokemonDetail!.types as List).length;i++) {
      String key = "{POKEMON_TYPE$i}";
      String colorKey = "{POKEMON_TYPE${i}_COLOR}";
      pokemonTypeDetailString = pokemonTypeDetailString
          .replaceAll(key, pokemonDetail!.types[i-1])
          .replaceAll(colorKey, PokemonUtil.getColorForPokemonType(pokemonDetail!.types[i-1]));
    }

    Map<String, dynamic> pokemonDetailPokemonNameJson = Util.getMapFromString(pokemonTypeDetailString
        .replaceAll(StringConstants.pokemonWeightReplacer, pokemonDetail!.weight.toString())
        .replaceAll(StringConstants.pokemonHeightReplacer, pokemonDetail!.height.toString())
    );

    return pokemonDetailPokemonNameJson;
  }

  void _addCarouselCards(Map<String, dynamic> carouselJson, String pokemonCarouselCardJsonString){
    carouselJson[StringConstants.data][StringConstants.children] = [];
    
    List<String> images = pokemonDetail!.images;

    String pokemonCard1 = pokemonCarouselCardJsonString;
    String pokemonCard2 = pokemonCarouselCardJsonString;

    String mainType = PokemonUtil.getPokemonTypeGradient(pokemonDetail!.types[0]);

    Map<String, dynamic> pokemonCardJson1 = Util.getMapFromString(pokemonCard1
        .replaceAll(StringConstants.linearGradientAsPerTypeReplacer, mainType)
        .replaceAll(StringConstants.pokemonOfficialArtworkPngUrlReplacer, images[0])
    );

    Map<String, dynamic> pokemonCardJson2 = Util.getMapFromString(pokemonCard2
            .replaceAll(StringConstants.linearGradientAsPerTypeReplacer, mainType)
            .replaceAll(StringConstants.pokemonOfficialArtworkPngUrlReplacer, images[1])
    );


    (carouselJson[StringConstants.data][StringConstants.children] as List).add(pokemonCardJson1);
    (carouselJson[StringConstants.data][StringConstants.children] as List).add(pokemonCardJson2);
  }
}
