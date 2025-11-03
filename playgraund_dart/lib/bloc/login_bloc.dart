// the file that connects events + repository+ states
import'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../repository/auth_repository.dart';

// bloc is the brain of the app it takes events from ui and map them to states
class LoginBloc extends Bloc<LoginEvent,LoginState> {
  final AuthRepository authRepository;
  // constructor
  //  start with initial state is LoginInitial
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    // mapping events to states
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        // call the login method from auth repository
        final isSuccess = await authRepository.login(
            username: event.username, password: event.password);
        if (isSuccess) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure('Invalid username or password'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }

}

