// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../repository/auth_repository.dart';

// Bloc is the brain of the app. It takes events from the UI and maps them to states.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  // Constructor — starts with the initial state
  LoginBloc(this.authRepository) : super(LoginInitial()) {
    // Mapping events to states
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading()); // show loading state

      try {
        // Call the login method from AuthRepository
        final isSuccess = await authRepository.login(
          event.username,
          event.password,
        );

        if (isSuccess) {
          emit(LoginSuccess()); // success state
        } else {
          emit(LoginFailure('Invalid email or password'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString())); // error state
      }
    });
  }
}
