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
}