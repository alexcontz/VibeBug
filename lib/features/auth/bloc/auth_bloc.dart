import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<_LoginRequested>(_onLoginRequested);
    on<_LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(_LoginRequested event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      // Add authentication logic here
      emit(const AuthState.authenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(_LogoutRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.initial());
  }
}
