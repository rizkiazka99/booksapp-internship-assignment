import 'package:booksapp_internship_assignment/app/utils/global.dart';
import 'package:flutter/material.dart';

extension RInt on int {
  double get w {
    final width = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.width;

    final precentage = width / screen;

    return precentage * screen;
  }

  double get h {
    final height = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.height;

    final precentage = height / screen;

    return precentage * screen;
  }

  double get r {
    final radius = this;
    final size = MediaQuery.of(globalNavKey.currentContext!).size;
    final screen = (size.height + size.width) / 2;

    final precentage = radius / screen;

    return precentage * screen;
  }
}

extension RDouble on double {
  double get w {
    final width = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.width;

    final precentage = width / screen;

    return precentage * screen;
  }

  double get h {
    final height = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.height;

    final precentage = height / screen;

    return precentage * screen;
  }

  double get r {
    final radius = this;
    final size = MediaQuery.of(globalNavKey.currentContext!).size;
    final screen = (size.height + size.width) / 2;

    final precentage = radius / screen;

    return precentage * screen;
  }
}

extension StringExtension on String {
    String capitalizeFirstLetter() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}