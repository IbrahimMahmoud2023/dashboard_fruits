import 'package:flutter/material.dart';

void showError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Center(child: Text(text))));
}