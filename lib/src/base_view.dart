import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Abstract base class for view modules
abstract class BaseView<T extends GetxController> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  // Get the view model instance
  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    // Delegate building the view to the buildView method
    return buildView(context);
  }

  // Build the view content
  Widget buildView(BuildContext context);
}
