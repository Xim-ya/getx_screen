<h1 align="center">Getx Screen</h1>
<p align="center"><img src="https://github.com/Xim-ya/easy_isolate_mixin/assets/75591730/69759b8e-75c5-4232-b5ba-a63f4218a0c0"/></p>
<p align="center">The Getx Screen package is a superset of the GetView class provided by the Getx package. It aims to simplify the creation of screens in Flutter applications using the GetX state management solution. With this package, you can easily build screens with various features such as an app bar, safe area handling, floating action button, bottom navigation bar, and more.</p>
    
<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="">
    <img src="https://img.shields.io/pub/v/getx_screen"
      alt="Pub Package"/>
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
      alt="License: MIT" />
  </a>


</p><br>

# Key Features

* 🔑 Simplified screen creation with the BaseScreen class
* 🚀 Boost your productivity
* 📚 Enhance code readability
* 🛠 Easy customization for improved maintainability


# Installing

To use the Easy Isolate Mixin package in your Flutter project, follow these steps:

1. Depend on it

This package is based on `GetX state` management solution. To use it, you need to add both `get` and `getx_screen` to
your `pubspec.yaml` file:

```yaml
dependencies:
  get: ^4.6.5
  getx_screen: ^1.0.0
```

2. Install it

Run the following command in your terminal or command prompt:

```
$ flutter pub get
```

3. Import it

Add the following import statement to your Dart code:

```dart
import 'package:getx_screen/getx_screen.dart';
```

# Usage

1. Import the package:

```dart
import 'package:getx_screen/getx_screen.dart';
```

2. Prepare GetxController :

```dart
class CustomController with GetxController {
  final String userName = 'James';
}
```

3. Extend your screen with the `BaseScreen` class and provide a `GetxController` as the type

```dart
class CustomScreen extends BaseScreen<CustomController> {
  const CustomScreen({Key? key}) : super(key: key);
  
  @override
  Widget buildScreen(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(vm.userName), // just call `vm.something`
    );
  }
}
```

You can access the controller's properties and methods by using `vm` as a reference.


4. Customize your screen by overriding the optional methods and properties provided by the BaseScreen class

```dart
class CustomScreen extends BaseScreen<CustomController> {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // Custom app bar implementation
    return AppBar(
      title: const Text('Custom Screen'),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    // Custom screen layout
    return Container(
      padding: EdgeInsets.all(20),
      child: Text('Hello, GetX!'),
    );
  }

  @override
  bool get setBottomSafeArea => false;

  @override
  Color? get screenBackgroundColor => Colors.white;

  @override
  Widget? get buildFloatingActionButton => FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
        },
        child: const Icon(Icons.add),
      );

  // Override other optional methods and properties as needed
}
```

### AppBar
You can add an app bar to your screen by overriding the buildAppBar method.
<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/1f521c23-44ff-48e9-9283-fe9342696837"/></p>

```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Placeholder();
  }
}
```
| Parameter   | Default | Description                   |
|:------------|:-------:|:------------------------------|
| buildAppBar |  null   | customizes the app bar widget |

### SafeArea
To control the safe area behavior of your screen, you can override the following properties.

<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/95017367-6a3a-47d1-be9e-776c2fb3349c"/></p>

```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  bool get setBottomSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Placeholder();
  }
} 
```

| Parameter         | Type | Default | Description                       |
|:------------------|:----:|:-------:|-----------------------------------|
| wrapWithSafeArea  | bool |  true   | wrap screen content with SafeArea |
| setTopSafeArea    | bool |  true   | consider top safe area.           |
| setBottomSafeArea | bool |  true   | consider bottom safe area.        |

### Color

You can customize the screen's background color and unsafe area color by overriding the following properties
<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/e09ee1cb-b57b-4947-9232-88335da0cff3"/></p>

```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  bool get setBottomSafeArea => false;

  @override
  Color? get screenBackgroundColor => Colors.green;

  @override
  Color? get unSafeAreaColor => Colors.amber;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Placeholder();
  }
}
```

To set a default color for `screenBackgroundColor` and `unSafeAreaColor` across your app, you can customize the theme in your MaterialApp widget:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // customize it
        scaffoldBackgroundColor: Colors.white,
        unselectedWidgetColor: Colors.blue,
      ),
      title: 'Getx Screen',
      initialBinding: CounterBinding(),
      home: const CounterScreen(),
    );
  }
}
```
By modifying the theme's `scaffoldBackgroundColor` and `unselectedWidgetColor`, you can set the default colors for screenBackgroundColor and unSafeAreaColor respectively.

| Parameter             |  Type  |                  Default                  | Description                             |
|:----------------------|:------:|:-----------------------------------------:|-----------------------------------------|
| screenBackgroundColor | Color? | Theme.of(context).scaffoldBackgroundColor | sets the background color of the screen |
| unSafeAreaColor       | Color? |  Theme.of(context).unselectedWidgetColor  | sets the color of the unsafe area.      |

### Floating Action Button

Create the Floating Action Button widget in your screen.
<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/a42b5dae-360b-462f-85d6-688c65fd2594"/></p>

```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  bool get setBottomSafeArea => false;

  @override
  Color? get screenBackgroundColor => Colors.green;

  @override
  Color? get unSafeAreaColor => Colors.amber;

  @override
  Widget? get buildFloatingActionButton =>
      FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation => FloatingActionButtonLocation.startFloat;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return const Placeholder();
  }
}
```

| Parameter                    |  Type   | Default | Description                                      |
|:-----------------------------|:-------:|:-------:|--------------------------------------------------|
| buildFloatingActionButton    | Widget? |  null   | customizes the floating action button widget     |
| floatingActionButtonLocation | Widget? |  null   | sets the position of the floating action button. |

### Connect ViewModel Resources to View(BaseScreen)


You can access the properties and methods of the controller by using `vm` as a reference. In this case, `vm` stands for "view model," which is an abbreviation commonly used to refer to the associated view model `GetxController.

<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/a7c17b16-6050-4495-b506-3097c79175fb"/></p>

```dart
class CounterViewModel extends GetxController {
  RxInt count = 0.obs;

  void increaseCount() {
    count(count.value + 1);
  }
}


class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  bool get setBottomSafeArea => false;

  @override
  Color? get screenBackgroundColor => Colors.green;

  @override
  Color? get unSafeAreaColor => Colors.amber;

  @override
  Widget? get buildFloatingActionButton =>
      FloatingActionButton(
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
  Widget buildScreen(BuildContext context) {
    return Center(
      child: Obx(
            () =>
            Text(
              '${vm.count.value}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,
            ),
      ),
    );
  }
}
```

### Nested View (BaseView)
If you want to build a simple widget without creating a complete app screen based on `Scaffold` and separate the controller and screen layout, you can use `BaseView`
```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  // Skipping previous code...

  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: CounterIndicator(),
    );
  }
}


 // Seperated class witch extends BaseView. 
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
```

### Bottom Navigation Bar
Customize the bottom navigation bar widget in your screen.

<p align="center"><img width="260px" src="https://github.com/Xim-ya/Plotz/assets/75591730/779b5ebe-3e5f-449d-a763-9e0a7daeec04"/></p>
 

```dart
class CounterScreen extends BaseScreen<CounterViewModel> {
  const CounterScreen({Key? key}) : super(key: key);

  // Skipping previous code...

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

  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: Obx(
            () => Text(
          '${vm.count.value}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
```
| Parameter                           |   Type   | Default | Description                                     |
|:------------------------------------|:--------:|:-------:|-------------------------------------------------|
| buildBottomNavigationBar            | Widget?  |  null   | customizes the bottom navigation bar widget.    |

### Other Options
Additionally, there are other available options that can be overridden in your screen class

| Parameter                            |       Type       | Default | Description                                             |
|:-------------------------------------|:----------------:|:-------:|---------------------------------------------------------|
| onWillPopCallback                    | bool Function()? |  null   | handles the back button press or pop action             |
| resizeToAvoidBottomInset             |       bool       |  true   | enables or disables screen resizing to avoid the bottom |
| extendBodyBehindAppBar               |       bool       |  false  | extends the body behind the app bar.                    |



    