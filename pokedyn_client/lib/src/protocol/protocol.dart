/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'page_uri_mapping.dart' as _i3;
import 'page_widget_mapping.dart' as _i4;
import 'widget.dart' as _i5;
import 'widget_widget_mapping.dart' as _i6;
export 'example.dart';
export 'page_uri_mapping.dart';
export 'page_widget_mapping.dart';
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
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.PageUriMapping) {
      return _i3.PageUriMapping.fromJson(data) as T;
    }
    if (t == _i4.PageWidgetMapping) {
      return _i4.PageWidgetMapping.fromJson(data) as T;
    }
    if (t == _i5.Widget) {
      return _i5.Widget.fromJson(data) as T;
    }
    if (t == _i6.WidgetWidgetMapping) {
      return _i6.WidgetWidgetMapping.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PageUriMapping?>()) {
      return (data != null ? _i3.PageUriMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PageWidgetMapping?>()) {
      return (data != null ? _i4.PageWidgetMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Widget?>()) {
      return (data != null ? _i5.Widget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.WidgetWidgetMapping?>()) {
      return (data != null ? _i6.WidgetWidgetMapping.fromJson(data) : null)
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.PageUriMapping) {
      return 'PageUriMapping';
    }
    if (data is _i4.PageWidgetMapping) {
      return 'PageWidgetMapping';
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
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'PageUriMapping') {
      return deserialize<_i3.PageUriMapping>(data['data']);
    }
    if (data['className'] == 'PageWidgetMapping') {
      return deserialize<_i4.PageWidgetMapping>(data['data']);
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
