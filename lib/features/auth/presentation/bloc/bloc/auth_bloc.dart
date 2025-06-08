import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartapi/features/auth/data/repositories/auth_repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories authRepositories;

  AuthBloc(this.authRepositories) : super(AuthInitial()) {
    // Register user
    on<RegisterEvent>((RegisterEvent event, emit) async {
      emit(RegisterLoadingState());
      final response = await authRepositories.registerUser(
        userData: event.userData,
      );
      response.fold(
        (error) => emit(RegisterErrorState(errorMessage: error.errorMessage)),
        (success) => emit(RegisterSuccessState(SuccessMessage: success)),
      );
    });
  }
}
