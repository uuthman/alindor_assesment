import 'package:alindor_assessment/core/firebase_service.dart';
import 'package:alindor_assessment/data/datasource/user_storage.dart';
import 'package:alindor_assessment/domain/model.dart';
import 'package:alindor_assessment/presentation/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {

  final FirebaseService _service;
  final UserStorage _storage;

  LoginCubit(this._service,this._storage)
      : super(const LoginStateInitial());

  Future<void> login() async {

    final user = await _service.handleGoogleSignIn();
    if(user != null) {
      _storage.storeUser(UserData(user.displayName ?? "", user.email ?? ""));
      emit(const LoginStateSuccess());
    } else {
      emit(const LoginStateFailure("Something went wrong"));
    }
  }
}