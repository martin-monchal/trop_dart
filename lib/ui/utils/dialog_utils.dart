import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  const DialogUtils._();

  static Future showCustomDialog(
    BuildContext context, {
    @required Future<bool> Function() onPressed,
    @required String title,
    @required Widget content,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: DefaultTextStyle.merge(
              style: const TextStyle(fontWeight: FontWeight.bold),
              child: Text(title)),
          content: content,
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              onPressed: () async {
                if (onPressed != null) {
                  bool ok = await onPressed();
                  if (ok) {
                    Navigator.of(context).maybePop();
                  }
                } else {
                  Navigator.of(context).maybePop();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
