import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';
import '../repository/auth_repository.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(AuthRepository authRepository, {required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        await authRepository.register(
            email: event.email, password: event.password);
        emit(RegisterSuccess());
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}