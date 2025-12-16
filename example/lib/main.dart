import 'package:internet_check_in_app/internet_check_in_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConnectivityListener(
        child: InternetRestore(),
      ),
    );
  }
}
