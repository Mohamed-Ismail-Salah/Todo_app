import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService{
final GetStorage box =GetStorage();
final key ="isDarkMode";
saveThemeBox(bool isDarkMode){
  box.write(key, isDarkMode);
}
bool lodeThemeBox(){
  return  box.read(key)??false;

}
ThemeMode get theme =>lodeThemeBox()?ThemeMode.dark:ThemeMode.light;
void swithchTheme(){
  Get.changeThemeMode(lodeThemeBox()? ThemeMode.light:ThemeMode.dark);
  saveThemeBox(!lodeThemeBox());
}
}