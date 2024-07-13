/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PageWidgetMapping implements _i1.SerializableModel {
  PageWidgetMapping._({
    this.id,
    required this.pageId,
    required this.widgetId,
  });

  factory PageWidgetMapping({
    int? id,
    required int pageId,
    required int widgetId,
  }) = _PageWidgetMappingImpl;

  factory PageWidgetMapping.fromJson(Map<String, dynamic> jsonSerialization) {
    return PageWidgetMapping(
      id: jsonSerialization['id'] as int?,
      pageId: jsonSerialization['pageId'] as int,
      widgetId: jsonSerialization['widgetId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pageId;

  int widgetId;

  PageWidgetMapping copyWith({
    int? id,
    int? pageId,
    int? widgetId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pageId': pageId,
      'widgetId': widgetId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PageWidgetMappingImpl extends PageWidgetMapping {
  _PageWidgetMappingImpl({
    int? id,
    required int pageId,
    required int widgetId,
  }) : super._(
          id: id,
          pageId: pageId,
          widgetId: widgetId,
        );

  @override
  PageWidgetMapping copyWith({
    Object? id = _Undefined,
    int? pageId,
    int? widgetId,
  }) {
    return PageWidgetMapping(
      id: id is int? ? id : this.id,
      pageId: pageId ?? this.pageId,
      widgetId: widgetId ?? this.widgetId,
    );
  }
}
