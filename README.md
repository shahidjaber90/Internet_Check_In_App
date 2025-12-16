# Internet Check-In App

A comprehensive Flutter package for handling internet connectivity status in your application. It provides a simple, plug-and-play solution to monitor network changes and automatically display a "No Internet" screen when the connection is lost.

[![pub package](https://img.shields.io/pub/v/internet_check_in_app.svg)](https://pub.dev/packages/internet_check_in_app)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Features

*   **Real-time Monitoring**: Instantly detects when internet connectivity is lost or restored.
*   **Automatic UI Handling**: Automatically navigates to a "No Internet" screen when disconnected and returns to the previous screen when connected.
*   **Customizable**: Use the default "No Internet" screen or provide your own custom widget.
*   **Cross-Platform**: Supports Android, iOS, Windows, and Web.

### UI Examples

<div style="display: flex; gap: 20px;">
  <img src="assets/package_image/Screenshot_1765917572.png" width="200" alt="Connected State" />
  <img src="assets/package_image/Screenshot_1765917826.png" width="200" alt="No Internet State" />
</div>

## Getting Started

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  internet_check_in_app: ^0.0.1
```

Or install it via command line:

```bash
flutter pub add internet_check_in_app
```

## Usage

Wrap your application's home or main widget with `ConnectivityListener`. This widget handles the navigation logic based on connectivity status.

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:internet_check_in_app/internet_check_in_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectivity App',
      home: ConnectivityListener(
        child: HomePage(), // Your main app screen
      ),
    );
  }
}
```

### Custom "No Internet" Screen

You can provide a custom widget to be displayed when the internet connection is lost:

```dart
ConnectivityListener(
  noInternetWidget: MyCustomNoInternetPage(),
  child: HomePage(),
)
```

## Platform Support

| Platform | Support |
| :--- | :---: |
| Android | ✅ |
| iOS | ✅ |
| Windows | ✅ |
| Web | ✅ |
| macOS | ✅ |
| Linux | ✅ |

This package relies on [connectivity_plus](https://pub.dev/packages/connectivity_plus), so it supports all platforms supported by that plugin.

## Contributing

Contributions are welcome! If you find a bug or want to feature, please open an issue or submit a pull request on the [GitHub repository](https://github.com/shahidjaber90/Internet_Check_In_App).
