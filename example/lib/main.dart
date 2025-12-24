import 'package:internet_check_in_app/internet_check_in_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return ConnectivityListener(navigatorKey: navigatorKey, child: child!);
      },
      home: const InternetRestore(),
    );
  }
}
