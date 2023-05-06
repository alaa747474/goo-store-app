import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/home/data/models/home_data.dart';
import 'package:goo_store_app/features/home/data/repositories/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final DioHelper _dioHelper;

  HomeRepository(this._dioHelper);
  @override
  Future<HomeData> getHomeData() async {
    Response response = await _dioHelper.getData(endPoint: AppEndPoints.home);
    return HomeData.fromJson(response.data);
  }
}
