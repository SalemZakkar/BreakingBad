import 'package:breaking_bad/data/strings.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OptionService {
  late SharedPreferences sharedPreferences;
  Future<bool> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  void setTheme(String theme) {
    Messages.setSettingSharedPreference(APPStrings.theme, [theme]);
    sharedPreferences.setString(APPStrings.theme, theme);
  }

  String getTheme() {
    String? theme = sharedPreferences.getString(APPStrings.theme);
    Messages.getSettingSharedPreferences(APPStrings.theme, [theme ?? APPStrings.noData]);
    if (theme == null) {
      return APPStrings.lightTheme;
    }
    return theme;
  }
}
OptionService optionService = OptionService();