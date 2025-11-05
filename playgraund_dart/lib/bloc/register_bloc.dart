import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';
import '../repository/auth_repository.dart';

// RegisterBloc handles registration logic
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  // Constructor takes the repository as a dependency
  RegisterBloc(this.authRepository) : super(RegisterInitial()) {
    // Listen for RegisterButtonPressed event
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading()); // Show loading spinner

      try {
        // Call the register method from the repository
        final isSuccess = await authRepository.register(
          event.name,
          event.email,
          event.password,
        );

        if (isSuccess) {
          emit(RegisterSuccess()); // success state
        } else {
          emit(RegisterFailure(error: 'Registration failed'));
        }
      } catch (error) {
        // Emit failure state if something goes wrong
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}
