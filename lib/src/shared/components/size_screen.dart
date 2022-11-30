import 'package:flutter/material.dart';

abstract class SizeScreen {
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;
}
