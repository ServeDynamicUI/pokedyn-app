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
}