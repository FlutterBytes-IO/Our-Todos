import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  String? validateTitle(String? value) =>
      value?.isEmpty == true ? 'Please enter a valid title' : null;
}
