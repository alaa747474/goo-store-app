import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/shared_prefs.dart';
import 'package:meta/meta.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  bool isDark = false;
  void changeAppTheme() async{
    isDark = !isDark;
    AppSharedPreferences.instance.saveThemeBool(value: isDark);
    emit(AppThemeChanged());
  }

  void getSavedTheme() {
    AppSharedPreferences.instance.getThemeBool().then((value) {
      isDark=value!;
       emit(AppThemeChanged());
    }) ;
  }
}
