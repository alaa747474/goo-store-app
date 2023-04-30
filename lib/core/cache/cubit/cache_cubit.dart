import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:meta/meta.dart';

part 'cache_state.dart';

class CacheCubit extends Cubit<CacheState> {
  CacheCubit() : super(CacheInitial());
  void getCurrentUserToken() {
    AppSecureStorage.instance.getCurrentUserData(key:'TOKEN').then((value) {
      emit(CurrentUserTokenLoaded(value!));
    });
  }
}
