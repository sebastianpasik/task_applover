part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = _LoginInitial;
  const factory LoginState.loading() = _LoginLoading;
}
