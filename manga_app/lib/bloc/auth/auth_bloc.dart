import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/bloc/auth/auth_state.dart';
import 'package:manga_app/firebase/firebase_auth_service.dart';
import 'package:manga_app/providers/providers.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        final authenticatedUser = await getIt<FirebaseAuthService>()
            .registerWithEmail(
              username: event.username,
              email: event.email,
              password: event.password,
            );
        emit(AuthSuccess(user: authenticatedUser!));
      } catch (_) {
        emit(AuthFailure(error: "Errore durante la registrazione."));
      }
    });

    on<LoginRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        final authenticatedUser = await getIt<FirebaseAuthService>()
            .loginWithEmail(email: event.email, password: event.password);
        emit(AuthSuccess(user: authenticatedUser!));
      } catch (_) {
        emit(AuthFailure(error: "Errore durante il login."));
      }
    });

    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      final uid = getIt<FirebaseAuthService>().getCurrentUser();

      if (uid != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure());
      }
    });
  }
}
