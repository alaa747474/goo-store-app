import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/features/profile/data/models/profile.dart';
import 'package:goo_store_app/features/profile/data/repositories/profile_repository.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());
  final ProfileRepository _profileRepository;
  void getUserProfile()async{
     emit(ProfileLoading());
    String ?token= await AppSecureStorage.instance.getToken();
    _profileRepository.getUserPtofile(token: token!).then((value) {
      emit(ProfileLoaded(value));
    });
  }
}
