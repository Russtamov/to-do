import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/feature/view/home_page.dart';
import 'package:to_do_app/feature/view_model/home_view_model.dart';
import 'package:to_do_app/product/init/flavor_config.dart';

void main() async {
  AppConfig.create(
    appName: "Dev Flavor Example",
    baseUrl: "https://dev.dwirandyh.com",
    primaryColor: Colors.red,
    flavor: Flavor.dev,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do App Dev',
        theme: ThemeData(
          primarySwatch: AppConfig.shared.primaryColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}
