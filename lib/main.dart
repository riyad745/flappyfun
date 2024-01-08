// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Layouts/Pages/page_start_screen.dart';
import 'Resources/strings.dart'; 
import 'Routes/app_routes.dart';

void main() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: MaterialApp(
        home: StartScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: Str.home,
        onGenerateRoute: AppRoute().generateRoute,
      ),
    );
  }
}
