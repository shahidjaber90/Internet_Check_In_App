import 'package:internet_check_in_app/internet_check_in_app.dart';

class InternetRestore extends StatelessWidget {
  const InternetRestore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Internet Connected",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
