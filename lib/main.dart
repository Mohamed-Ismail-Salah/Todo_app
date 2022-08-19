import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/service/theme_service.dart';
import 'package:get/get.dart';
import 'widgets/themes.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await  GetStorage.init();
  runApp(const MyApp(
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode:ThemeService().theme ,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}



