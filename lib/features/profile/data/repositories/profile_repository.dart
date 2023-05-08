import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/profile/data/models/profile.dart';
import 'package:goo_store_app/features/profile/data/repositories/base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  final DioHelper _dioHelper;

  ProfileRepository(this._dioHelper);
  @override
  Future<Profile> getUserPtofile({required String token}) async {
    Response response =
        await _dioHelper.getData(token: token, endPoint: AppEndPoints.profile);
    return Profile.fromJson(response.data['data']);
  }

  @override
  Future<Profile> updateUserProfile(
      {required Profile profile, required String token}) async {
    Response response = await _dioHelper.putData(
        endPoint: AppEndPoints.profile, data: profile.toJson(), token: token);
    return Profile.fromJson(response.data['data']);
  }
}
