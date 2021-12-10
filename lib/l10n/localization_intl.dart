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

  String get login {
    return Intl.message(
      'login',
      name: 'login',
    );
  }

  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
    );
  }

  String get language {
    return Intl.message(
      'language',
      name: 'language',
    );
  }

  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
    );
  }

  String get logoutTip {
    return Intl.message(
      'logoutTip',
      name: 'logoutTip',
    );
  }

  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
    );
  }

  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
    );
  }

  String get noDescription {
    return Intl.message(
      'noDescription',
      name: 'noDescription',
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
