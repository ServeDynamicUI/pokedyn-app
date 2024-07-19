/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'page_uri_mapping.dart' as _i2;
import 'page_widget_mapping.dart' as _i3;
import 'pokemon_data.dart' as _i4;
import 'widget.dart' as _i5;
import 'widget_widget_mapping.dart' as _i6;
export 'page_uri_mapping.dart';
export 'page_widget_mapping.dart';
export 'pokemon_data.dart';
export 'widget.dart';
export 'widget_widget_mapping.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.PageUriMapping) {
      return _i2.PageUriMapping.fromJson(data) as T;
    }
    if (t == _i3.PageWidgetMapping) {
      return _i3.PageWidgetMapping.fromJson(data) as T;
    }
    if (t == _i4.PokemonData) {
      return _i4.PokemonData.fromJson(data) as T;
    }
    if (t == _i5.Widget) {
      return _i5.Widget.fromJson(data) as T;
    }
    if (t == _i6.WidgetWidgetMapping) {
      return _i6.WidgetWidgetMapping.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.PageUriMapping?>()) {
      return (data != null ? _i2.PageUriMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PageWidgetMapping?>()) {
      return (data != null ? _i3.PageWidgetMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PokemonData?>()) {
      return (data != null ? _i4.PokemonData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Widget?>()) {
      return (data != null ? _i5.Widget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.WidgetWidgetMapping?>()) {
      return (data != null ? _i6.WidgetWidgetMapping.fromJson(data) : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == Map<String, Map<String, String>>) {
      return (data as Map).map((k, v) => MapEntry(
              deserialize<String>(k), deserialize<Map<String, String>>(v)))
          as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.PageUriMapping) {
      return 'PageUriMapping';
    }
    if (data is _i3.PageWidgetMapping) {
      return 'PageWidgetMapping';
    }
    if (data is _i4.PokemonData) {
      return 'PokemonData';
    }
    if (data is _i5.Widget) {
      return 'Widget';
    }
    if (data is _i6.WidgetWidgetMapping) {
      return 'WidgetWidgetMapping';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'PageUriMapping') {
      return deserialize<_i2.PageUriMapping>(data['data']);
    }
    if (data['className'] == 'PageWidgetMapping') {
      return deserialize<_i3.PageWidgetMapping>(data['data']);
    }
    if (data['className'] == 'PokemonData') {
      return deserialize<_i4.PokemonData>(data['data']);
    }
    if (data['className'] == 'Widget') {
      return deserialize<_i5.Widget>(data['data']);
    }
    if (data['className'] == 'WidgetWidgetMapping') {
      return deserialize<_i6.WidgetWidgetMapping>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
