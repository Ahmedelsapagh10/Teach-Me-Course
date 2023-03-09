import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitState());

  static bool isDart = false;
  setMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDart', isDart);
  }

  static Future<bool> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDart') ?? true;
  }

  void changeMode() async {
    emit(IChangeModeState());
    isDart = !isDart;
    await setMode();
    await getMode();
    emit(ChangeModeState());
  }
}
