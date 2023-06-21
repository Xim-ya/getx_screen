library getx_screen;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScreen<T extends GetxController> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  @protected
  Color? get unSafeAreaColor => null;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  Widget? get buildFloatingActionButton => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  bool get extendBodyBehindAppBar => false;

  @protected
  Color? get screenBackgroundColor => null;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  bool get setBottomSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  bool Function()? get onWillPopCallback => null;

  @protected
  bool get allowBackButton => false;

  @protected
  bool get setWillPop => false;

  @protected
  void initViewModel() {
    vm.initialized;
  }

  @protected
  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    if (!vm.initialized) {
      initViewModel();
    }

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
          color: unSafeAreaColor ?? Theme.of(context).scaffoldBackgroundColor,
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
        color: unSafeAreaColor ?? Theme.of(context).scaffoldBackgroundColor,
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

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      extendBody: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: buildScreen(context),
      backgroundColor:
      screenBackgroundColor ?? Theme.of(context).unselectedWidgetColor,
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: buildFloatingActionButton,
    );
  }
}
