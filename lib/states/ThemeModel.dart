import 'package:flutter/material.dart';
import 'package:github_app/common/Global.dart';
import 'package:github_app/states/ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier {
  // 获取当前主题，如果为设置主题，则默认使用蓝色主题
  MaterialColor get theme => Global.themes
      .firstWhere((e) => e.value == profile.theme, orElse: () => Colors.blue);

  // 主题改变后，通知其依赖项，新主题会立即生效
  set theme(MaterialColor color) {
    if (color != theme) {
      profile.theme = color.value;
      notifyListeners();
    }
  }
}
