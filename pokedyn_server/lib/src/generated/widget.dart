/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Widget extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Widget._({
    int? id,
    required this.widgetId,
    required this.widgetType,
    required this.widgetData,
    required this.widgetName,
  }) : super(id);

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

  static final t = WidgetTable();

  static const db = WidgetRepository._();

  int widgetId;

  String widgetType;

  String widgetData;

  String widgetName;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'widgetId': widgetId,
      'widgetType': widgetType,
      'widgetData': widgetData,
      'widgetName': widgetName,
    };
  }

  static WidgetInclude include() {
    return WidgetInclude._();
  }

  static WidgetIncludeList includeList({
    _i1.WhereExpressionBuilder<WidgetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetTable>? orderByList,
    WidgetInclude? include,
  }) {
    return WidgetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Widget.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Widget.t),
      include: include,
    );
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

class WidgetTable extends _i1.Table {
  WidgetTable({super.tableRelation}) : super(tableName: 'widget') {
    widgetId = _i1.ColumnInt(
      'widgetId',
      this,
    );
    widgetType = _i1.ColumnString(
      'widgetType',
      this,
    );
    widgetData = _i1.ColumnString(
      'widgetData',
      this,
    );
    widgetName = _i1.ColumnString(
      'widgetName',
      this,
    );
  }

  late final _i1.ColumnInt widgetId;

  late final _i1.ColumnString widgetType;

  late final _i1.ColumnString widgetData;

  late final _i1.ColumnString widgetName;

  @override
  List<_i1.Column> get columns => [
        id,
        widgetId,
        widgetType,
        widgetData,
        widgetName,
      ];
}

class WidgetInclude extends _i1.IncludeObject {
  WidgetInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Widget.t;
}

class WidgetIncludeList extends _i1.IncludeList {
  WidgetIncludeList._({
    _i1.WhereExpressionBuilder<WidgetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Widget.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Widget.t;
}

class WidgetRepository {
  const WidgetRepository._();

  Future<List<Widget>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Widget>(
      where: where?.call(Widget.t),
      orderBy: orderBy?.call(Widget.t),
      orderByList: orderByList?.call(Widget.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Widget?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetTable>? where,
    int? offset,
    _i1.OrderByBuilder<WidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WidgetTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Widget>(
      where: where?.call(Widget.t),
      orderBy: orderBy?.call(Widget.t),
      orderByList: orderByList?.call(Widget.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Widget?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Widget>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Widget>> insert(
    _i1.Session session,
    List<Widget> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Widget>(
      rows,
      transaction: transaction,
    );
  }

  Future<Widget> insertRow(
    _i1.Session session,
    Widget row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Widget>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Widget>> update(
    _i1.Session session,
    List<Widget> rows, {
    _i1.ColumnSelections<WidgetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Widget>(
      rows,
      columns: columns?.call(Widget.t),
      transaction: transaction,
    );
  }

  Future<Widget> updateRow(
    _i1.Session session,
    Widget row, {
    _i1.ColumnSelections<WidgetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Widget>(
      row,
      columns: columns?.call(Widget.t),
      transaction: transaction,
    );
  }

  Future<List<Widget>> delete(
    _i1.Session session,
    List<Widget> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Widget>(
      rows,
      transaction: transaction,
    );
  }

  Future<Widget> deleteRow(
    _i1.Session session,
    Widget row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Widget>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Widget>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WidgetTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Widget>(
      where: where(Widget.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WidgetTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Widget>(
      where: where?.call(Widget.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
