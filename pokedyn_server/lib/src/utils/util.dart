import 'dart:convert';
import 'dart:math';

class Util {

  static Map<String, dynamic> getMapFromString(String jsonString){
    return json.decode(json.decode(jsonString));
  }

  static String generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

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
}