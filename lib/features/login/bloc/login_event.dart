part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.saveData(String email, String password) = _LoginSaveData;
}
