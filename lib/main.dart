
import 'package:flutter/material.dart';
import 'package:social_commerce_mobile/presentation/pages/home_page.dart';
import 'package:social_commerce_mobile/presentation/pages/login_page.dart';
import 'package:social_commerce_mobile/presentation/pages/registration_page.dart';
import '../../../../injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
