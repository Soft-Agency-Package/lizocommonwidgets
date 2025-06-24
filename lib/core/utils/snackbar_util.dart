import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lizocommonwidgets/config/themes/style_of_app.dart';
import 'package:lizocommonwidgets/core/utils/global_context.dart';

class SnackNotifier {
  void show(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 20.0),
                Text(
                  message,
                  style: StyleOfApp.custom(size: 15.0, color: Colors.red),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 214, 214, 214),
          padding: const EdgeInsets.all(0.0),
        ),
      );
    }
  }
}

final snackNotifierProvider = Provider<SnackNotifier>((ref) {
  return SnackNotifier();
});
