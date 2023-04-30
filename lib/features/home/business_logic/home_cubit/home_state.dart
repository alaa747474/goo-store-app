part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeBottomNavIndex extends HomeState {
  final int selectedIndex;
  ChangeBottomNavIndex(this.selectedIndex);
}