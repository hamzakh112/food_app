import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/screens/cart_page.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/splash_screen.dart';
import 'package:food_app/widgets/my_password_textfield.dart';
import 'package:food_app/widgets/round_button.dart';
import 'package:provider/provider.dart';
import '';
import 'color/color.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food APP',
        theme: ThemeData(
          dividerColor: Colors.black,
          useMaterial3: true,
          primaryColor: Color(0xFFBCD438),
        ),
        home:SplashScreen(),
      ),
    );
  }
}

