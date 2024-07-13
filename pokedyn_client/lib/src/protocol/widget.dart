/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Widget implements _i1.SerializableModel {
  Widget._({
    this.id,
    required this.widgetId,
    required this.widgetType,
    required this.widgetData,
    required this.widgetName,
  });

  factory Widget({
    int? id,
    required int widgetId,
    required String widgetType,
    required String widgetData,
    required String widgetName,
  }) = _WidgetImpl;

  factory Widget.fromJson(Map<String, dynamic> jsonSerialization) {
    return Widget(
      id: jsonSerialization['id'] as int?,
      widgetId: jsonSerialization['widgetId'] as int,
      widgetType: jsonSerialization['widgetType'] as String,
      widgetData: jsonSerialization['widgetData'] as String,
      widgetName: jsonSerialization['widgetName'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int widgetId;

  String widgetType;

  String widgetData;

  String widgetName;

  Widget copyWith({
    int? id,
    int? widgetId,
    String? widgetType,
    String? widgetData,
    String? widgetName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'widgetId': widgetId,
      'widgetType': widgetType,
      'widgetData': widgetData,
      'widgetName': widgetName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WidgetImpl extends Widget {
  _WidgetImpl({
    int? id,
    required int widgetId,
    required String widgetType,
    required String widgetData,
    required String widgetName,
  }) : super._(
          id: id,
          widgetId: widgetId,
          widgetType: widgetType,
          widgetData: widgetData,
          widgetName: widgetName,
        );

  @override
  Widget copyWith({
    Object? id = _Undefined,
    int? widgetId,
    String? widgetType,
    String? widgetData,
    String? widgetName,
  }) {
    return Widget(
      id: id is int? ? id : this.id,
      widgetId: widgetId ?? this.widgetId,
      widgetType: widgetType ?? this.widgetType,
      widgetData: widgetData ?? this.widgetData,
      widgetName: widgetName ?? this.widgetName,
    );
  }
}
