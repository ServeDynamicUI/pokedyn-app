import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[LogoutActionHandler] : handler that logs out the user.
class LogoutActionHandler extends ActionHandler {
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (context?.mounted ?? false) {
      SessionManagerState.instance.sessionStreamController.sink.add(SessionDeAuthenticatedEvent());
    }
  }
}
