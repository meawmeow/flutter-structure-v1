import 'package:flutter/material.dart';
import 'package:flutter_structure_v1/router/app_router.dart';
import 'package:flutter_structure_v1/router/router_name.dart';

void main() {
  runApp(MainApp(
    router: AppRouter(),
  ));
}

class MainApp extends StatelessWidget {
  final AppRouter router;

  const MainApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      initialRoute: RouterName.HOME,
      onGenerateRoute: router.generateRouter,
    );
  }
}
