import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/index.dart';

import '../common/Global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    // 保存Profile变更
    Global.saveProfile();
    // 通知依赖的Widget更新
    super.notifyListeners();
  }
}
