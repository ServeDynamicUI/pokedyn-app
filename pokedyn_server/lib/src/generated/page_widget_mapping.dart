/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PageWidgetMapping extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PageWidgetMapping._({
    int? id,
    required this.pageId,
    required this.widgetId,
  }) : super(id);

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

  static final t = PageWidgetMappingTable();

  static const db = PageWidgetMappingRepository._();

  int pageId;

  int widgetId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pageId': pageId,
      'widgetId': widgetId,
    };
  }

  static PageWidgetMappingInclude include() {
    return PageWidgetMappingInclude._();
  }

  static PageWidgetMappingIncludeList includeList({
    _i1.WhereExpressionBuilder<PageWidgetMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageWidgetMappingTable>? orderByList,
    PageWidgetMappingInclude? include,
  }) {
    return PageWidgetMappingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PageWidgetMapping.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PageWidgetMapping.t),
      include: include,
    );
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

class PageWidgetMappingTable extends _i1.Table {
  PageWidgetMappingTable({super.tableRelation})
      : super(tableName: 'page_widget_mapping') {
    pageId = _i1.ColumnInt(
      'pageId',
      this,
    );
    widgetId = _i1.ColumnInt(
      'widgetId',
      this,
    );
  }

  late final _i1.ColumnInt pageId;

  late final _i1.ColumnInt widgetId;

  @override
  List<_i1.Column> get columns => [
        id,
        pageId,
        widgetId,
      ];
}

class PageWidgetMappingInclude extends _i1.IncludeObject {
  PageWidgetMappingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => PageWidgetMapping.t;
}

class PageWidgetMappingIncludeList extends _i1.IncludeList {
  PageWidgetMappingIncludeList._({
    _i1.WhereExpressionBuilder<PageWidgetMappingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PageWidgetMapping.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PageWidgetMapping.t;
}

class PageWidgetMappingRepository {
  const PageWidgetMappingRepository._();

  Future<List<PageWidgetMapping>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageWidgetMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageWidgetMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PageWidgetMapping>(
      where: where?.call(PageWidgetMapping.t),
      orderBy: orderBy?.call(PageWidgetMapping.t),
      orderByList: orderByList?.call(PageWidgetMapping.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PageWidgetMapping?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageWidgetMappingTable>? where,
    int? offset,
    _i1.OrderByBuilder<PageWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageWidgetMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PageWidgetMapping>(
      where: where?.call(PageWidgetMapping.t),
      orderBy: orderBy?.call(PageWidgetMapping.t),
      orderByList: orderByList?.call(PageWidgetMapping.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PageWidgetMapping?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PageWidgetMapping>(
      id,
      transaction: transaction,
    );
  }

  Future<List<PageWidgetMapping>> insert(
    _i1.Session session,
    List<PageWidgetMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PageWidgetMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<PageWidgetMapping> insertRow(
    _i1.Session session,
    PageWidgetMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PageWidgetMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PageWidgetMapping>> update(
    _i1.Session session,
    List<PageWidgetMapping> rows, {
    _i1.ColumnSelections<PageWidgetMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PageWidgetMapping>(
      rows,
      columns: columns?.call(PageWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<PageWidgetMapping> updateRow(
    _i1.Session session,
    PageWidgetMapping row, {
    _i1.ColumnSelections<PageWidgetMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PageWidgetMapping>(
      row,
      columns: columns?.call(PageWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<List<PageWidgetMapping>> delete(
    _i1.Session session,
    List<PageWidgetMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PageWidgetMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<PageWidgetMapping> deleteRow(
    _i1.Session session,
    PageWidgetMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PageWidgetMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PageWidgetMapping>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PageWidgetMappingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PageWidgetMapping>(
      where: where(PageWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PageWidgetMappingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PageWidgetMapping>(
      where: where?.call(PageWidgetMapping.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
