
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedyn_server/src/generated/protocol.dart';
import 'package:pokedyn_server/src/utils/util.dart';
import 'package:serverpod/serverpod.dart';

import 'package:pokedyn_server/src/generated/widget.dart' as gen;

class PokedynHomepageEndpoint extends Endpoint {
  int offset = 0;
  final int limit = 10;
  int? totalCount;

  @override
  bool get requireLogin {
    return false;
  }

  Future<String> getPage(Session session) async {
    Map<String, dynamic> queryParams = (session as MethodCallSession).queryParameters;

    PageUriMapping? page = await PageUriMapping.db.findFirstRow(session, where: (table)=>table.pageUri.equals((session).endpointName));
    Map<String, dynamic> pageJsonData = jsonDecode(jsonDecode(page!.pageData));

    PageWidgetMapping? pageWidgetMapping = await PageWidgetMapping.db.findFirstRow(session, where: (table)=>table.pageId.equals(page.pageId));
    gen.Widget? widget = await gen.Widget.db.findFirstRow(session, where: (table)=>table.widgetId.equals(pageWidgetMapping!.widgetId));

    if(queryParams.containsKey('offset')){
      offset = int.parse(queryParams['offset']);

      List<Map<String, dynamic>> children = await _getPokemonListAndUpdateOffset(widget!.widgetData, limit, offset);

      return jsonEncode({
        "children": children,
        "nextUrl": offset < totalCount! ? "http://localhost:8080/pokedynHomepage/getPage?offset=$offset&limit=5" : ""
      });
    }
    else {
      offset = 0;
      List<Map<String, dynamic>> children = await _getPokemonListAndUpdateOffset(widget!.widgetData, limit, offset);
      pageJsonData['data']['children'] = children;
      pageJsonData['data']['nextUrl'] = offset < totalCount! ? "http://localhost:8080/pokedynHomepage/getPage?offset=$offset&limit=5" : "";
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
    final pokemonList = data['results'];
    totalCount ??= data['count'];
    List<Map<String, dynamic>> paginatedJsonList = [];

    for (var pokemon in pokemonList) {
      final Uri pokemonUri = Uri.parse(pokemon['url']);
      final pokemonDetailResponse = await http.get(pokemonUri);
      final pokemonDetail = jsonDecode(pokemonDetailResponse.body);

      Map<String, dynamic> pokemonData = {
        'name': pokemonDetail['name'],
        'type': pokemonDetail['types'][0]['type']['name'],
        'image': pokemonDetail['sprites']['other']['official-artwork']['front_default'],
        'id': _getPokemonId(pokemonUri)
      };

      paginatedJsonList.add(_getPokemonWidget(widgetJsonString, pokemonData));
    }

    return paginatedJsonList;
  }

  Map<String, dynamic> _getPokemonWidget(String jsonTemplate, Map<String, dynamic> pokemonData) {
    return Util.getMapFromString(jsonTemplate
        .replaceAll('{KEY_1}', Util.generateRandomString(15))
        .replaceAll('{KEY_2}', Util.generateRandomString(15))
        .replaceAll('{BACKEND_POKEMON_DETAIL_URL}', _getPokemonDetailPageUrl(pokemonData['id']))
        .replaceAll('{POKEMON_TYPE_BG_COLOR_AS_PER_TYPE}', Util.getColorForPokemonType(pokemonData['type']))
        .replaceAll('{KEY_3}', Util.generateRandomString(15))
        .replaceAll('{KEY_4}', Util.generateRandomString(15))
        .replaceAll('{KEY_5}', Util.generateRandomString(15))
        .replaceAll('{POKEMON_IMAGE}', pokemonData['image'])
        .replaceAll('{KEY_6}', Util.generateRandomString(15))
        .replaceAll('{POKEMON_NAME}', pokemonData['name'])
        .replaceAll('{KEY_7}', Util.generateRandomString(15))
        .replaceAll('{KEY_8}', Util.generateRandomString(15))
        .replaceAll('{KEY_9}', Util.generateRandomString(15))
        .replaceAll('{POKEMON_MAIN_TYPE}', pokemonData['type']));
  }

  String _getPokemonId(Uri uri){
    List<String> segments = uri.pathSegments;
    return segments.elementAt(segments.length-2);
  }

  String _getPokemonDetailPageUrl(String id){
    return "http://localhost:8080/pokemonDetailPage/getPage?pokemon=$id";
  }
}