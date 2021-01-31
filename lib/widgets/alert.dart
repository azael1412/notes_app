import 'package:flutter/material.dart';

class Alert {
  static Future<bool> showAlertDialog({
    BuildContext context,
    String text = "¿Esta seguro de salir?",
  }) async {
    final bool result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Text(text),
            actions: [
              FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.of(context).pop(false)),
              FlatButton(
                  child: Text("Si"),
                  onPressed: () => Navigator.of(context).pop(true))
            ],
          );
        });
    return result;
  }
}
