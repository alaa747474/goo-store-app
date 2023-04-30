part of 'cache_cubit.dart';

@immutable
abstract class CacheState {}

class CacheInitial extends CacheState {}
class CurrentUserTokenLoaded extends CacheState {
  final String token;

  CurrentUserTokenLoaded(this.token);
}
