import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_screen/getx_screen.dart';

class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count'),
          CounterIndicator(),
        ],
      ),
    );
  }

  @override
  bool get setBottomSafeArea => false;

  @override
  Color? get screenBackgroundColor => Colors.green;

  @override
  Color? get unSafeAreaColor => Colors.amber;

  @override
  Widget? get buildFloatingActionButton => FloatingActionButton(
        onPressed: vm.increaseCount,
        child: const Icon(Icons.add),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      FloatingActionButtonLocation.startFloat;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'user',
        icon: Icon(Icons.account_circle),
      )
    ]);
  }
}

class CounterIndicator extends BaseView<CounterViewModel> {
  const CounterIndicator({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Text(
        '${vm.count.value}',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class CounterViewModel extends GetxController {
  RxInt count = 0.obs;

  void increaseCount() {
    count(count.value + 1);
  }
}
