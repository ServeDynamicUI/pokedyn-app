/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PageUriMapping extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PageUriMapping._({
    int? id,
    required this.pageUri,
    required this.pageId,
    required this.pageData,
  }) : super(id);

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

  static final t = PageUriMappingTable();

  static const db = PageUriMappingRepository._();

  String pageUri;

  int pageId;

  String pageData;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pageUri': pageUri,
      'pageId': pageId,
      'pageData': pageData,
    };
  }

  static PageUriMappingInclude include() {
    return PageUriMappingInclude._();
  }

  static PageUriMappingIncludeList includeList({
    _i1.WhereExpressionBuilder<PageUriMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageUriMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageUriMappingTable>? orderByList,
    PageUriMappingInclude? include,
  }) {
    return PageUriMappingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PageUriMapping.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PageUriMapping.t),
      include: include,
    );
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

class PageUriMappingTable extends _i1.Table {
  PageUriMappingTable({super.tableRelation})
      : super(tableName: 'page_uri_mapping') {
    pageUri = _i1.ColumnString(
      'pageUri',
      this,
    );
    pageId = _i1.ColumnInt(
      'pageId',
      this,
    );
    pageData = _i1.ColumnString(
      'pageData',
      this,
    );
  }

  late final _i1.ColumnString pageUri;

  late final _i1.ColumnInt pageId;

  late final _i1.ColumnString pageData;

  @override
  List<_i1.Column> get columns => [
        id,
        pageUri,
        pageId,
        pageData,
      ];
}

class PageUriMappingInclude extends _i1.IncludeObject {
  PageUriMappingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => PageUriMapping.t;
}

class PageUriMappingIncludeList extends _i1.IncludeList {
  PageUriMappingIncludeList._({
    _i1.WhereExpressionBuilder<PageUriMappingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PageUriMapping.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PageUriMapping.t;
}

class PageUriMappingRepository {
  const PageUriMappingRepository._();

  Future<List<PageUriMapping>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageUriMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageUriMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageUriMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PageUriMapping>(
      where: where?.call(PageUriMapping.t),
      orderBy: orderBy?.call(PageUriMapping.t),
      orderByList: orderByList?.call(PageUriMapping.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PageUriMapping?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageUriMappingTable>? where,
    int? offset,
    _i1.OrderByBuilder<PageUriMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageUriMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PageUriMapping>(
      where: where?.call(PageUriMapping.t),
      orderBy: orderBy?.call(PageUriMapping.t),
      orderByList: orderByList?.call(PageUriMapping.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PageUriMapping?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PageUriMapping>(
      id,
      transaction: transaction,
    );
  }

  Future<List<PageUriMapping>> insert(
    _i1.Session session,
    List<PageUriMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PageUriMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<PageUriMapping> insertRow(
    _i1.Session session,
    PageUriMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PageUriMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PageUriMapping>> update(
    _i1.Session session,
    List<PageUriMapping> rows, {
    _i1.ColumnSelections<PageUriMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PageUriMapping>(
      rows,
      columns: columns?.call(PageUriMapping.t),
      transaction: transaction,
    );
  }

  Future<PageUriMapping> updateRow(
    _i1.Session session,
    PageUriMapping row, {
    _i1.ColumnSelections<PageUriMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PageUriMapping>(
      row,
      columns: columns?.call(PageUriMapping.t),
      transaction: transaction,
    );
  }

  Future<List<PageUriMapping>> delete(
    _i1.Session session,
    List<PageUriMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PageUriMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<PageUriMapping> deleteRow(
    _i1.Session session,
    PageUriMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PageUriMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PageUriMapping>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PageUriMappingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PageUriMapping>(
      where: where(PageUriMapping.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageUriMappingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PageUriMapping>(
      where: where?.call(PageUriMapping.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
