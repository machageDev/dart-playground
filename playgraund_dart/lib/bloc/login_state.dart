// base state class for login feature
abstract class LoginState {}

// initial state when nothing has happened yet
class LoginInitial extends LoginState {}
// state when login process is ongoing
class LoginLoading extends LoginState {}
// state when login is successful
class LoginSuccess extends LoginState {}
// state when login fails eg wrong password
class LoginFailure extends LoginState{
  late final String message;
// constructor to show error message
LoginFailure(this.message) {
  // TODO: implement loginFailure
  throw UnimplementedError();
}
}