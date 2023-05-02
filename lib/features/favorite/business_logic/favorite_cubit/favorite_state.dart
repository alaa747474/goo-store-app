part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final Favorite favorite;

  FavoriteLoaded(this.favorite);
}

class FavoriteLoading extends FavoriteState {}

class FavoriteProductAddedOrDeleted extends FavoriteState {}
