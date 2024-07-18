import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';

///[LoginActionHandler] : handler that logs in the user.
class LoginActionHandler extends ActionHandler {
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) async {
    if (context?.mounted ?? false) {
      ActionHandlersRepo.handle(
          ActionDTO("/form", extras), extras!['widget'], context!,
          (value) async {
        if (value is Map) {
          SessionManagerState.instance.sessionStreamController.sink.add(
            SessionOnAuthenticatedEvent(
              authInfo: {
                'email': value['textFieldData'][0],
                'userName': value['textFieldData'][1],
              },
            ),
          );
        }
      });
    }
  }
}
