/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'example.dart' as _i3;
import 'page_uri_mapping.dart' as _i4;
import 'page_widget_mapping.dart' as _i5;
import 'widget.dart' as _i6;
import 'widget_widget_mapping.dart' as _i7;
export 'example.dart';
export 'page_uri_mapping.dart';
export 'page_widget_mapping.dart';
export 'widget.dart';
export 'widget_widget_mapping.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'page_uri_mapping',
      dartName: 'PageUriMapping',
      schema: 'public',
      module: 'pokedyn',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'page_uri_mapping_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pageUri',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'pageData',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'page_uri_mapping_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'page_widget_mapping',
      dartName: 'PageWidgetMapping',
      schema: 'public',
      module: 'pokedyn',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'page_widget_mapping_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'widgetId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'page_widget_mapping_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'widget',
      dartName: 'Widget',
      schema: 'public',
      module: 'pokedyn',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'widget_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'widgetId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'widgetType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'widgetData',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'widgetName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'widget_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'widget_widget_mapping',
      dartName: 'WidgetWidgetMapping',
      schema: 'public',
      module: 'pokedyn',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'widget_widget_mapping_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'parentWidget',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'childWidgetId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'widget_widget_mapping_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.PageUriMapping) {
      return _i4.PageUriMapping.fromJson(data) as T;
    }
    if (t == _i5.PageWidgetMapping) {
      return _i5.PageWidgetMapping.fromJson(data) as T;
    }
    if (t == _i6.Widget) {
      return _i6.Widget.fromJson(data) as T;
    }
    if (t == _i7.WidgetWidgetMapping) {
      return _i7.WidgetWidgetMapping.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PageUriMapping?>()) {
      return (data != null ? _i4.PageUriMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PageWidgetMapping?>()) {
      return (data != null ? _i5.PageWidgetMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Widget?>()) {
      return (data != null ? _i6.Widget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.WidgetWidgetMapping?>()) {
      return (data != null ? _i7.WidgetWidgetMapping.fromJson(data) : null)
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.PageUriMapping) {
      return 'PageUriMapping';
    }
    if (data is _i5.PageWidgetMapping) {
      return 'PageWidgetMapping';
    }
    if (data is _i6.Widget) {
      return 'Widget';
    }
    if (data is _i7.WidgetWidgetMapping) {
      return 'WidgetWidgetMapping';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'PageUriMapping') {
      return deserialize<_i4.PageUriMapping>(data['data']);
    }
    if (data['className'] == 'PageWidgetMapping') {
      return deserialize<_i5.PageWidgetMapping>(data['data']);
    }
    if (data['className'] == 'Widget') {
      return deserialize<_i6.Widget>(data['data']);
    }
    if (data['className'] == 'WidgetWidgetMapping') {
      return deserialize<_i7.WidgetWidgetMapping>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.PageUriMapping:
        return _i4.PageUriMapping.t;
      case _i5.PageWidgetMapping:
        return _i5.PageWidgetMapping.t;
      case _i6.Widget:
        return _i6.Widget.t;
      case _i7.WidgetWidgetMapping:
        return _i7.WidgetWidgetMapping.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'pokedyn';
}
