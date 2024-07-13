
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:pokedyn_server/src/generated/protocol.dart';
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

  String _getPokemonTypeColor() {
    List<String> pokemonTypeColors = [
      '0xffA8A77A',
      '0xffEE8130',
      '0xff6390F0',
      '0xffF7D02C',
      '0xff7AC74C',
      '0xff96D9D6',
      '0xffC22E28',
      '0xffA33EA1',
      '0xffE2BF65',
      '0xffA98FF3',
      '0xffF95587',
      '0xffA6B91A',
      '0xffB6A136',
      '0xff735797',
      '0xff6F35FC',
      '0xff705746',
      '0xffB7B7CE',
      '0xffD685AD',
      '0xffA8A878',
      '0xffF0E68C',
      '0xffFF69B4',
      '0xff6495ED',
      '0xffFFD700',
      '0xff8A2BE2',
      '0xffFF6347',
      '0xff1E90FF',
      '0xff8B4513',
    ];

    return pokemonTypeColors[Random().nextInt(pokemonTypeColors.length)];
  }

  String _generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  Map<String, dynamic> _getPokemonWidget(String jsonTemplate, Map<String, dynamic> pokemonData) {
    return json.decode(json.decode(jsonTemplate
        .replaceAll('{KEY_1}', _generateRandomString(15))
        .replaceAll('{KEY_2}', _generateRandomString(15))
        .replaceAll('{BACKEND_POKEMON_DETAIL_URL}', _getPokemonDetailPageUrl(pokemonData['id']))
        .replaceAll('{POKEMON_TYPE_BG_COLOR_AS_PER_TYPE}', _getColorForPokemonType(pokemonData['type']))
        .replaceAll('{KEY_3}', _generateRandomString(15))
        .replaceAll('{KEY_4}', _generateRandomString(15))
        .replaceAll('{KEY_5}', _generateRandomString(15))
        .replaceAll('{POKEMON_IMAGE}', pokemonData['image'])
        .replaceAll('{KEY_6}', _generateRandomString(15))
        .replaceAll('{POKEMON_NAME}', pokemonData['name'])
        .replaceAll('{KEY_7}', _generateRandomString(15))
        .replaceAll('{KEY_8}', _generateRandomString(15))
        .replaceAll('{KEY_9}', _generateRandomString(15))
        .replaceAll('{POKEMON_MAIN_TYPE}', pokemonData['type'])));
  }

  String _getColorForPokemonType(String type) {
    switch (type) {
      case 'normal':
        return '0xffA8A77A'; // Khaki
      case 'fire':
        return '0xffEE8130'; // Orange
      case 'water':
        return '0xff6390F0'; // Light Blue
      case 'electric':
        return '0xffF7D02C'; // Yellow
      case 'grass':
        return '0xff7AC74C'; // Green
      case 'ice':
        return '0xff96D9D6'; // Light Cyan
      case 'fighting':
        return '0xffC22E28'; // Dark Red
      case 'poison':
        return '0xffA33EA1'; // Purple
      case 'ground':
        return '0xffE2BF65'; // Sandy Brown
      case 'flying':
        return '0xffA98FF3'; // Light Purple
      case 'psychic':
        return '0xffF95587'; // Magenta
      case 'bug':
        return '0xffA6B91A'; // Olive
      case 'rock':
        return '0xffB6A136'; // Dark Khaki
      case 'ghost':
        return '0xff735797'; // Medium Slate Blue
      case 'dragon':
        return '0xff6F35FC'; // Indigo
      case 'dark':
        return '0xff705746'; // Dark Brown
      case 'steel':
        return '0xffB7B7CE'; // Light Steel Blue
      case 'fairy':
        return '0xffD685AD'; // Light Pink
      case 'shadow':
        return '0xff2F4F4F'; // Dark Slate Gray
      default:
        return '0xffA8A878'; // Default Khaki
    }
  }

  String _getPokemonId(Uri uri){
    List<String> segments = uri.pathSegments;
    return segments.elementAt(segments.length-2);
  }

  String _getPokemonDetailPageUrl(String id){
    return "http://localhost:8080/pokemonDetailPage/getPage?pokemon=$id";
  }
}