import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionService {
  late SharedPreferences sharedPreferences;

  Future<bool> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  void setTheme(int theme) {
    Messages.setSettingSharedPreference(APPStrings.theme, [theme.toString()]);
    sharedPreferences.setInt(APPStrings.theme, theme);
  }

  int getTheme() {
    int? theme = sharedPreferences.getInt(APPStrings.theme);
    Messages.getSettingSharedPreferences(APPStrings.theme,
        [(theme == null ? APPStrings.noData : theme.toString())]);
    if (theme == null) {
      return 0;
    }
    return theme;
  }
}

OptionService optionService = OptionService();
