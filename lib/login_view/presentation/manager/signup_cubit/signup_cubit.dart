import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:meta/meta.dart';

import '../../../../../core/errors/server_failure.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword({required String email,required String name,required String password}) async {
    emit(SignUpLoading());
    var result= await authRepo.createUserWithEmailAndPassword(email: email, password:  password,name: name);
    result.fold(
            (failure){
              emit(SignUpFailure(errorMessage: failure.errorMessage));
            },
            (userEntity){
              emit(SignUpSuccess(userEntity));
            });
  }



}
