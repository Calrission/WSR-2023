import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Ошибка"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          ));
}

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(child: CircularProgressIndicator())
      ));
}
