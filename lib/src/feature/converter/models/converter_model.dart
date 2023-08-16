import 'package:flutter/material.dart';

class Converter {
  final ValueNotifier<num> currency1Rate;
  final ValueNotifier<num> currency2Rate;
  final TextEditingController controller1;
  final TextEditingController controller2;

  Converter({
    required this.currency1Rate,
    required this.currency2Rate,
    required this.controller1,
    required this.controller2,
  });

  TextEditingController getById(int id) {
    return switch (id) {
      1 => controller1,
      2 => controller2,
      _ => TextEditingController(),
    };
  }

  void clear() {
    controller1.clear();
    controller2.clear();
  }
}
