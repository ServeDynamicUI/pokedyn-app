
import 'dart:async';
import 'dart:convert';

import 'package:pokedyn_server/src/generated/page_uri_mapping.dart';
import 'package:pokedyn_server/src/utils/map_util.dart';
import 'package:pokedyn_server/src/utils/util.dart';
import 'package:serverpod/serverpod.dart';

class AuthPageEndpoint extends Endpoint {


  @override
  bool get requireLogin {
    return false;
  }

  Future<Map<String, dynamic>> getPage(Session session) async {
    PageUriMapping? page = await PageUriMapping.db.findFirstRow(session, where: (table)=>table.pageUri.equals((session as MethodCallSession).endpointName));
    Map<String, dynamic> pageMap = jsonDecode(jsonDecode(page!.pageData));
    return pageMap..assignKeyWithRandomValues();
  }
}
