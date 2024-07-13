import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/feature/view/home_page.dart';
import 'package:to_do_app/feature/view_model/home_view_model.dart';
import 'package:to_do_app/product/init/application_initialize.dart';
import 'package:to_do_app/product/init/flavor_config.dart';
import 'package:to_do_app/product/theme/custom_light_theme.dart';

void main() async {
  AppConfig.create(
    appName: "Prod Flavor Example",
    baseUrl: "https://dwirandyh.com",
    primaryColor: Colors.yellow,
    flavor: Flavor.prod,
  );
  await ApplicationInitialize().make();
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: CustomLightTheme().themeData,
      home: const HomePage(),
    );
  }
}
