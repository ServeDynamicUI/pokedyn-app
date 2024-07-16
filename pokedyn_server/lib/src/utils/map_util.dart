import 'package:pokedyn_server/src/utils/util.dart';

extension MapUtil on Map<String,dynamic>{

  void assignKeyWithRandomValues(){
    forEach((key, value) {
      if (key == 'key') {
        this[key] = Util.generateRandomString(15);
      } else if (value is Map<String, dynamic>) {
        value.assignKeyWithRandomValues();
      } else if (value is List) {
        for (var item in value) {
          if (item is Map<String, dynamic>) {
            item.assignKeyWithRandomValues();
          }
        }
      }
    });
  }
}