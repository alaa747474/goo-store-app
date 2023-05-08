import 'package:goo_store_app/features/profile/data/models/profile.dart';

abstract class BaseProfileRepository{
  Future<Profile>getUserPtofile({required String token});
  Future<Profile>updateUserProfile({required Profile profile,required String token});
}