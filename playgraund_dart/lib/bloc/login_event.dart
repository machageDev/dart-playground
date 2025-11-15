// events rep user actions. it tells bloc what happned in the app,eg user clicked a button
abstract class LoginEvent {}

// this is event is triggered when the login button is pressed
class LoginButtonPressed extends LoginEvent {
  late final String username;
  late final String password;

  // constructor to recieve username and password
  LoginButtonPressed({required this.username, required this.password});
  }


  on<LoginEvent>((event, emit) async {
  emit(LoginLoading());
  try {
    final response = await repo.login(event.email, event.password);
    emit(LoginSuccess(response));
  } catch (e) {
    emit(LoginFailure("Login failed"));
  }
});
