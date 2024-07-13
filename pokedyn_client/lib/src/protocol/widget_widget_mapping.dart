/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class WidgetWidgetMapping implements _i1.SerializableModel {
  WidgetWidgetMapping._({
    this.id,
    required this.parentWidget,
    this.childWidgetId,
  });

  factory WidgetWidgetMapping({
    int? id,
    required int parentWidget,
    int? childWidgetId,
  }) = _WidgetWidgetMappingImpl;

  factory WidgetWidgetMapping.fromJson(Map<String, dynamic> jsonSerialization) {
    return WidgetWidgetMapping(
      id: jsonSerialization['id'] as int?,
      parentWidget: jsonSerialization['parentWidget'] as int,
      childWidgetId: jsonSerialization['childWidgetId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int parentWidget;

  int? childWidgetId;

  WidgetWidgetMapping copyWith({
    int? id,
    int? parentWidget,
    int? childWidgetId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'parentWidget': parentWidget,
      if (childWidgetId != null) 'childWidgetId': childWidgetId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WidgetWidgetMappingImpl extends WidgetWidgetMapping {
  _WidgetWidgetMappingImpl({
    int? id,
    required int parentWidget,
    int? childWidgetId,
  }) : super._(
          id: id,
          parentWidget: parentWidget,
          childWidgetId: childWidgetId,
        );

  @override
  WidgetWidgetMapping copyWith({
    Object? id = _Undefined,
    int? parentWidget,
    Object? childWidgetId = _Undefined,
  }) {
    return WidgetWidgetMapping(
      id: id is int? ? id : this.id,
      parentWidget: parentWidget ?? this.parentWidget,
      childWidgetId: childWidgetId is int? ? childWidgetId : this.childWidgetId,
    );
  }
}
