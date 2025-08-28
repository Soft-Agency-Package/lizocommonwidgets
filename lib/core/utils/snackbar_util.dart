import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lizocommonwidgets/core/utils/global_context.dart';

class SnackNotifier {
  void show(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Attention"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Fermer"),
              ),
            ],
          );
        },
      );
    }
  }
}

final snackNotifierProvider = Provider<SnackNotifier>((ref) {
  return SnackNotifier();
});
