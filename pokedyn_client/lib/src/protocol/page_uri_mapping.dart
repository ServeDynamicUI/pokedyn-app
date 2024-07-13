/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PageUriMapping implements _i1.SerializableModel {
  PageUriMapping._({
    this.id,
    required this.pageUri,
    required this.pageId,
    required this.pageData,
  });

  factory PageUriMapping({
    int? id,
    required String pageUri,
    required int pageId,
    required String pageData,
  }) = _PageUriMappingImpl;

  factory PageUriMapping.fromJson(Map<String, dynamic> jsonSerialization) {
    return PageUriMapping(
      id: jsonSerialization['id'] as int?,
      pageUri: jsonSerialization['pageUri'] as String,
      pageId: jsonSerialization['pageId'] as int,
      pageData: jsonSerialization['pageData'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String pageUri;

  int pageId;

  String pageData;

  PageUriMapping copyWith({
    int? id,
    String? pageUri,
    int? pageId,
    String? pageData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pageUri': pageUri,
      'pageId': pageId,
      'pageData': pageData,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PageUriMappingImpl extends PageUriMapping {
  _PageUriMappingImpl({
    int? id,
    required String pageUri,
    required int pageId,
    required String pageData,
  }) : super._(
          id: id,
          pageUri: pageUri,
          pageId: pageId,
          pageData: pageData,
        );

  @override
  PageUriMapping copyWith({
    Object? id = _Undefined,
    String? pageUri,
    int? pageId,
    String? pageData,
  }) {
    return PageUriMapping(
      id: id is int? ? id : this.id,
      pageUri: pageUri ?? this.pageUri,
      pageId: pageId ?? this.pageId,
      pageData: pageData ?? this.pageData,
    );
  }
}
