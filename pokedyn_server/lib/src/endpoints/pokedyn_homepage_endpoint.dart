
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedyn_server/src/constants/string_constants.dart';
import 'package:pokedyn_server/src/generated/protocol.dart';
import 'package:pokedyn_server/src/utils/map_util.dart';
import 'package:pokedyn_server/src/utils/pokemon_util.dart';
import 'package:pokedyn_server/src/utils/util.dart';
import 'package:serverpod/serverpod.dart';
import 'package:pokedyn_server/src/generated/widget.dart' as gen;

class PokedynHomepageEndpoint extends Endpoint {
  int offset = 0;
  final int limit = 10;
  int? totalCount;
  late Session session;

  @override
  bool get requireLogin {
    return false;
  }

  Future<String> getPage(Session session) async {
    this.session = session;
    Map<String, dynamic> queryParams = (session as MethodCallSession).queryParameters;

    PageUriMapping? page = await PageUriMapping.db.findFirstRow(session, where: (table)=>table.pageUri.equals((session).endpointName));
    Map<String, dynamic> pageJsonData = jsonDecode(jsonDecode(page!.pageData));

    PageWidgetMapping? pageWidgetMapping = await PageWidgetMapping.db.findFirstRow(session, where: (table)=>table.pageId.equals(page.pageId));
    gen.Widget? widget = await gen.Widget.db.findFirstRow(session, where: (table)=>table.widgetId.equals(pageWidgetMapping!.widgetId));

    if(queryParams.containsKey(StringConstants.offset)){
      offset = int.parse(queryParams[StringConstants.offset]);

      List<Map<String, dynamic>> children = await _getPokemonListAndUpdateOffset(widget!.widgetData, limit, offset);

      Map<String, dynamic> paginatedMap = {
        StringConstants.children: children,
        StringConstants.nextUrl: offset < totalCount! ? "http://localhost:8080/pokedynHomepage/getPage?offset=$offset&limit=5" : ""
      };
      paginatedMap.assignKeyWithRandomValues();
      return jsonEncode(paginatedMap);
    }
    else {
      offset = 0;
      List<Map<String, dynamic>> children = await _getPokemonListAndUpdateOffset(widget!.widgetData, limit, offset);
      pageJsonData[StringConstants.data][StringConstants.children] = children;
      pageJsonData[StringConstants.data][StringConstants.nextUrl] = offset < totalCount! ? "http://localhost:8080/pokedynHomepage/getPage?offset=$offset&limit=5" : "";
      pageJsonData.assignKeyWithRandomValues();
      return jsonEncode(pageJsonData);
    }
  }

  Future<List<Map<String, dynamic>>> _getPokemonListAndUpdateOffset(String widgetJsonString,int limit, int offset) async {
    List<Map<String, dynamic>> children = await _getPaginatedPokemonJson(widgetJsonString, limit, offset);
    this.offset = offset + limit;
    return children;
  }

  Future<List<Map<String, dynamic>>> _getPaginatedPokemonJson(String widgetJsonString, int limit, int offset) async {
    print(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    final data = jsonDecode(response.body);
    final pokemonList = data[StringConstants.results];
    totalCount ??= data[StringConstants.count];
    List<Map<String, dynamic>> paginatedJsonList = [];

    for (var pokemon in pokemonList) {
      final Uri pokemonUri = Uri.parse(pokemon[StringConstants.url]);
      String pokemonId = PokemonUtil.getPokemonId(pokemonUri);

      late PokemonData pokemonData;
      PokemonData? pokemonDataModel = await session.caches.local.get<PokemonData>('pokemon$pokemonId');
      if(pokemonDataModel != null){
        pokemonData = pokemonDataModel;
      }
      else{
        pokemonData = await PokemonUtil.getPokemonData(pokemonId);
        session.caches.local.put('${StringConstants.pokemon}${pokemonData.id}', pokemonData, lifetime: Duration(minutes: 5));
      }
      paginatedJsonList.add(_getPokemonWidget(widgetJsonString, pokemonData));
    }

    return paginatedJsonList;
  }

  Map<String, dynamic> _getPokemonWidget(String jsonTemplate, PokemonData pokemonData) {
    return Util.getMapFromString(jsonTemplate
        .replaceAll(StringConstants.backendPokemonDetailUrlReplacer, _getPokemonDetailPageUrl(pokemonData.id))
        .replaceAll(StringConstants.pokemonTypeBgColorAsPerTypeReplacer, PokemonUtil.getColorForPokemonType(pokemonData.types[0]))
        .replaceAll(StringConstants.pokemonImageReplacer, pokemonData.images[0])
        .replaceAll(StringConstants.pokemonNameReplacer, pokemonData.name)
        .replaceAll(StringConstants.pokemonMainTypeReplacer, pokemonData.types[0]));
  }

  String _getPokemonDetailPageUrl(String id){
    return "http://localhost:8080/pokemonDetailPage/getPage?pokemon=$id";
  }
}