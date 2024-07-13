/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class WidgetWidgetMapping extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  WidgetWidgetMapping._({
    int? id,
    required this.parentWidget,
    this.childWidgetId,
  }) : super(id);

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

  static final t = WidgetWidgetMappingTable();

  static const db = WidgetWidgetMappingRepository._();

  int parentWidget;

  int? childWidgetId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'parentWidget': parentWidget,
      if (childWidgetId != null) 'childWidgetId': childWidgetId,
    };
  }

  static WidgetWidgetMappingInclude include() {
    return WidgetWidgetMappingInclude._();
  }

  static WidgetWidgetMappingIncludeList includeList({
    _i1.WhereExpressionBuilder<WidgetWidgetMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WidgetWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetWidgetMappingTable>? orderByList,
    WidgetWidgetMappingInclude? include,
  }) {
    return WidgetWidgetMappingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WidgetWidgetMapping.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WidgetWidgetMapping.t),
      include: include,
    );
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

class WidgetWidgetMappingTable extends _i1.Table {
  WidgetWidgetMappingTable({super.tableRelation})
      : super(tableName: 'widget_widget_mapping') {
    parentWidget = _i1.ColumnInt(
      'parentWidget',
      this,
    );
    childWidgetId = _i1.ColumnInt(
      'childWidgetId',
      this,
    );
  }

  late final _i1.ColumnInt parentWidget;

  late final _i1.ColumnInt childWidgetId;

  @override
  List<_i1.Column> get columns => [
        id,
        parentWidget,
        childWidgetId,
      ];
}

class WidgetWidgetMappingInclude extends _i1.IncludeObject {
  WidgetWidgetMappingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => WidgetWidgetMapping.t;
}

class WidgetWidgetMappingIncludeList extends _i1.IncludeList {
  WidgetWidgetMappingIncludeList._({
    _i1.WhereExpressionBuilder<WidgetWidgetMappingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WidgetWidgetMapping.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => WidgetWidgetMapping.t;
}

class WidgetWidgetMappingRepository {
  const WidgetWidgetMappingRepository._();

  Future<List<WidgetWidgetMapping>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetWidgetMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WidgetWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetWidgetMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WidgetWidgetMapping>(
      where: where?.call(WidgetWidgetMapping.t),
      orderBy: orderBy?.call(WidgetWidgetMapping.t),
      orderByList: orderByList?.call(WidgetWidgetMapping.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<WidgetWidgetMapping?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetWidgetMappingTable>? where,
    int? offset,
    _i1.OrderByBuilder<WidgetWidgetMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetWidgetMappingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<WidgetWidgetMapping>(
      where: where?.call(WidgetWidgetMapping.t),
      orderBy: orderBy?.call(WidgetWidgetMapping.t),
      orderByList: orderByList?.call(WidgetWidgetMapping.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<WidgetWidgetMapping?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<WidgetWidgetMapping>(
      id,
      transaction: transaction,
    );
  }

  Future<List<WidgetWidgetMapping>> insert(
    _i1.Session session,
    List<WidgetWidgetMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WidgetWidgetMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<WidgetWidgetMapping> insertRow(
    _i1.Session session,
    WidgetWidgetMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WidgetWidgetMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<WidgetWidgetMapping>> update(
    _i1.Session session,
    List<WidgetWidgetMapping> rows, {
    _i1.ColumnSelections<WidgetWidgetMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WidgetWidgetMapping>(
      rows,
      columns: columns?.call(WidgetWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<WidgetWidgetMapping> updateRow(
    _i1.Session session,
    WidgetWidgetMapping row, {
    _i1.ColumnSelections<WidgetWidgetMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WidgetWidgetMapping>(
      row,
      columns: columns?.call(WidgetWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<List<WidgetWidgetMapping>> delete(
    _i1.Session session,
    List<WidgetWidgetMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WidgetWidgetMapping>(
      rows,
      transaction: transaction,
    );
  }

  Future<WidgetWidgetMapping> deleteRow(
    _i1.Session session,
    WidgetWidgetMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WidgetWidgetMapping>(
      row,
      transaction: transaction,
    );
  }

  Future<List<WidgetWidgetMapping>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WidgetWidgetMappingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WidgetWidgetMapping>(
      where: where(WidgetWidgetMapping.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetWidgetMappingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WidgetWidgetMapping>(
      where: where?.call(WidgetWidgetMapping.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
