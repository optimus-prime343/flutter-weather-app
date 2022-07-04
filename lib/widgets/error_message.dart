import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String error;
  const ErrorMessage({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      content: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        )
      ],
    );
  }
}
