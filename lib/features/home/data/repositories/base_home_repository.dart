import 'package:goo_store_app/features/home/data/models/home_data.dart';

abstract class BaseHomeRepository{
  Future<HomeData>getHomeData();
}