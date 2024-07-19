import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedyn_server/src/generated/pokemon_data.dart';

class PokemonUtil {
  static String getColorForPokemonType(String type) {
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

  static String getPokemonTypeGradient(String type) {
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

  static Map<String, Map<String, String>> getStatValue(List<dynamic> statsList){
    Map<String, Map<String, String>> convertedStats = {};

    for (var stat in statsList) {
      String statName = stat['stat']['name'];
      int baseStatValue = (stat['base_stat'] as num).toDouble().round();

      switch (statName) {
        case 'hp':
          convertedStats['HP'] = {"value": baseStatValue.toString(), "maxValue": "250", "gradient": "-1.0,0.0;1.0,0.0;0xFF808000,0xFFFF0000"};
          break;
        case 'attack':
          convertedStats['ATK'] = {"value": baseStatValue.toString(), "maxValue": "190", "gradient": "-1.0,0.0;1.0,0.0;0xFF006400,0xfffda626"};
          break;
        case 'defense':
          convertedStats['DEF'] = {"value": baseStatValue.toString(), "maxValue": "230", "gradient": "-1.0,0.0;1.0,0.0;0xff0290e9,0xfffff000"};
          break;
        case 'speed':
          convertedStats['SPD'] = {"value": baseStatValue.toString(), "maxValue": "180", "gradient": "-1.0,0.0;1.0,0.0;0xff8eafc4,0xff6e7ac4"};
          break;
      }
    }

    return convertedStats;
  }

  static Future<PokemonData> getPokemonData(String pokemonId) async{
    //PokemonData? pokemonData = await session.caches.local.get<PokemonData>('pokemon$pokemonId');
    //if(pokemonData != null) return pokemonData;

    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> pokemonDetail = jsonDecode(response.body);
      Map<String, dynamic> pokemonData = {
        'name': pokemonDetail['name'],
        'types': getPokemonTypes(pokemonDetail['types'] as List<dynamic>),
        'images': <String>[
          (pokemonDetail['sprites']['other']['official-artwork']['front_default']).toString(),
          (pokemonDetail['sprites']['other']['official-artwork']['front_shiny']).toString(),
        ],
        'id': pokemonId,
        "weight":(pokemonDetail['weight'] as num).toDouble() / 10,
        "height": (pokemonDetail['height'] as num).toDouble() / 10,
        "stats": PokemonUtil.getStatValue(pokemonDetail['stats'] as List<dynamic>)
      };
      PokemonData pokemonDataModel = PokemonData.fromJson(pokemonData);
      //session.caches.local.put('pokemon${pokemonDataModel.id}', pokemonDataModel, lifetime: Duration(minutes: 5));
      return pokemonDataModel;
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }

  static List<String> getPokemonTypes(List<dynamic> pokemonTypes){
    List<String> types = pokemonTypes.map((value) => value['type']['name'] as String).toList();
    if(types.length == 1){
      types.add(getPokemonTypeAlternativeName(types[0]));
    }
    return types;
  }

  static String getPokemonId(Uri uri){
    List<String> segments = uri.pathSegments;
    return segments.elementAt(segments.length-2);
  }

  static String formattedId(String id) {
    return '#${id.padLeft(4, '0')}';
  }

  static String getPokemonTypeAlternativeName(String type) {
    switch (type) {
      case 'normal':
        return 'Norm'; // Normal
      case 'fire':
        return 'Blaze'; // Fire
      case 'water':
        return 'Aqua'; // Water
      case 'electric':
        return 'Volt'; // Electric
      case 'grass':
        return 'Leaf'; // Grass
      case 'ice':
        return 'Frost'; // Ice
      case 'fighting':
        return 'Brawl'; // Fighting
      case 'poison':
        return 'Toxic'; // Poison
      case 'ground':
        return 'Terra'; // Ground
      case 'flying':
        return 'Sky'; // Flying
      case 'psychic':
        return 'Mind'; // Psychic
      case 'bug':
        return 'Insect'; // Bug
      case 'rock':
        return 'Stone'; // Rock
      case 'ghost':
        return 'Specter'; // Ghost
      case 'dragon':
        return 'Drake'; // Dragon
      case 'dark':
        return 'Shade'; // Dark
      case 'steel':
        return 'Metal'; // Steel
      case 'fairy':
        return 'Charm'; // Fairy
      case 'shadow':
        return 'Phantom'; // Shadow
      default:
        return 'Unknown'; // Default
    }
  }
}