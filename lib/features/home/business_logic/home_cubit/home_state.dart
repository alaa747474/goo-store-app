part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeBottomNavIndex extends HomeState {
  final int selectedIndex;
  ChangeBottomNavIndex(this.selectedIndex);
}
class ChangeAppThemec extends HomeState {
  
}
class HomeDataLoaded extends HomeState{
 final HomeData homeData;

  HomeDataLoaded(this.homeData); 
}
class HomeFailur extends HomeState {
  final String error;

  HomeFailur(this.error);
}