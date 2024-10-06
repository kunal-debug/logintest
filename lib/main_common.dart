import 'package:flutter/material.dart';
import 'package:logintest/presentation/screens/home/home_screen.dart';
import 'package:logintest/provider/auth/auth_provider.dart';
import 'package:logintest/provider/menuItem/menuitem_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/screens/auth/login_screen.dart';

GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuitemProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldKey,
        home: const LoginScreen(),
      ),
    );
  }

  
}
