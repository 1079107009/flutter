import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class GmLocalizations {
  static Future<GmLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return GmLocalizations();
    });
  }

  static GmLocalizations? of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get home {
    return Intl.message(
      'Flutter Client',
      name: 'home',
    );
  }

  String get login1 {
    return Intl.message(
      'Login',
      name: 'login1',
    );
  }

  String get login {
    return Intl.message(
      'login',
      name: 'login',
    );
  }

  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
    );
  }

  String get logoutTip {
    return Intl.message(
      'Are you sure logout?',
      name: 'logoutTip',
    );
  }

  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
    );
  }

  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
    );
  }

  String get noDescription {
    return Intl.message(
      'noDescription',
      name: 'noDescription',
    );
  }

  String get userName {
    return Intl.message(
      'userName',
      name: 'userName',
    );
  }

  String get userNameOrEmail {
    return Intl.message(
      'userNameOrEmail',
      name: 'userNameOrEmail',
    );
  }

  String get userNameRequired {
    return Intl.message(
      'userNameRequired',
      name: 'userNameRequired',
    );
  }

  String get passwordRequired {
    return Intl.message(
      'passwordRequired',
      name: 'passwordRequired',
    );
  }

  String get password {
    return Intl.message(
      'password',
      name: 'password',
    );
  }

}

class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    return GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
