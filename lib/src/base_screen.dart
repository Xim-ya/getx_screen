import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Abstract base class for screen modules
abstract class BaseScreen<T extends GetxController> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  // Optional: Color of the unsafe area (area behind system UI)
  @protected
  Color? get unSafeAreaColor => null;

  // Whether to resize the screen to avoid the bottom system inset (e.g., keyboard)
  @protected
  bool get resizeToAvoidBottomInset => true;

  // Optional: Build the floating action button
  @protected
  Widget? get buildFloatingActionButton => null;

  // Optional: Define the floating action button location
  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  // Whether to extend the body behind the app bar
  @protected
  bool get extendBodyBehindAppBar => false;

  // Optional: Color of the screen background
  @protected
  Color? get screenBackgroundColor => null;

  // Optional: Build the bottom navigation bar
  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  // Build the screen content
  @protected
  Widget buildScreen(BuildContext context);

  // Optional: Build the app bar
  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  // Whether to wrap the screen with a SafeArea widget
  @protected
  bool get wrapWithSafeArea => true;

  // Whether to set the bottom area as a safe area
  @protected
  bool get setBottomSafeArea => true;

  // Whether to set the top area as a safe area
  @protected
  bool get setTopSafeArea => true;

  // Optional: Define a callback for the system back button press
  @protected
  bool Function()? get onWillPopCallback => null;

  // Initialize the view model
  @protected
  void initViewModel() {
    // Access the view model through the 'vm' getter
    vm.initialized;
  }

  // Get the view model instance
  @protected
  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    // Initialize the view model if not already initialized
    if (!vm.initialized) {
      initViewModel();
    }

    // Wrap the screen with a WillPopScope widget if a back button callback is defined
    if (onWillPopCallback != null) {
      return WillPopScope(
        onWillPop: () async {
          if (onWillPopCallback != null) {
            return onWillPopCallback!();
          } else {
            return false;
          }
        },
        child: Container(
          color: unSafeAreaColor ?? Theme.of(context).unselectedWidgetColor,
          child: wrapWithSafeArea
              ? SafeArea(
                  top: setTopSafeArea,
                  bottom: setBottomSafeArea,
                  child: _buildScaffold(context),
                )
              : _buildScaffold(context),
        ),
      );
    } else {
      return Container(
        color: unSafeAreaColor ?? Theme.of(context).unselectedWidgetColor,
        child: wrapWithSafeArea
            ? SafeArea(
                top: setTopSafeArea,
                bottom: setBottomSafeArea,
                child: _buildScaffold(context),
              )
            : _buildScaffold(context),
      );
    }
  }

  // Build the main scaffold widget
  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      extendBody: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: buildScreen(context),
      backgroundColor:
          screenBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: buildFloatingActionButton,
    );
  }
}
