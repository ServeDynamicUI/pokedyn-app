/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PokemonData implements _i1.SerializableModel {
  PokemonData._({
    required this.name,
    required this.id,
    required this.images,
    required this.types,
    required this.weight,
    required this.height,
    required this.stats,
  });

  factory PokemonData({
    required String name,
    required String id,
    required List<String> images,
    required List<String> types,
    required double weight,
    required double height,
    required Map<String, Map<String, String>> stats,
  }) = _PokemonDataImpl;

  factory PokemonData.fromJson(Map<String, dynamic> jsonSerialization) {
    return PokemonData(
      name: jsonSerialization['name'] as String,
      id: jsonSerialization['id'] as String,
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      types:
          (jsonSerialization['types'] as List).map((e) => e as String).toList(),
      weight: (jsonSerialization['weight'] as num).toDouble(),
      height: (jsonSerialization['height'] as num).toDouble(),
      stats: (jsonSerialization['stats'] as Map).map((k, v) => MapEntry(
            k as String,
            (v as Map).map((k, v) => MapEntry(
                  k as String,
                  v as String,
                )),
          )),
    );
  }

  String name;

  String id;

  List<String> images;

  List<String> types;

  double weight;

  double height;

  Map<String, Map<String, String>> stats;

  PokemonData copyWith({
    String? name,
    String? id,
    List<String>? images,
    List<String>? types,
    double? weight,
    double? height,
    Map<String, Map<String, String>>? stats,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'images': images.toJson(),
      'types': types.toJson(),
      'weight': weight,
      'height': height,
      'stats': stats.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PokemonDataImpl extends PokemonData {
  _PokemonDataImpl({
    required String name,
    required String id,
    required List<String> images,
    required List<String> types,
    required double weight,
    required double height,
    required Map<String, Map<String, String>> stats,
  }) : super._(
          name: name,
          id: id,
          images: images,
          types: types,
          weight: weight,
          height: height,
          stats: stats,
        );

  @override
  PokemonData copyWith({
    String? name,
    String? id,
    List<String>? images,
    List<String>? types,
    double? weight,
    double? height,
    Map<String, Map<String, String>>? stats,
  }) {
    return PokemonData(
      name: name ?? this.name,
      id: id ?? this.id,
      images: images ?? this.images.clone(),
      types: types ?? this.types.clone(),
      weight: weight ?? this.weight,
      height: height ?? this.height,
      stats: stats ?? this.stats.clone(),
    );
  }
}
