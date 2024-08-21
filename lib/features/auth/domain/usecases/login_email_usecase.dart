import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_email_response.dart';
import '../repositories/auth_repo.dart';


class LoginEmailUseCase extends UseCase<LoginEmailResponse, LoginEmailParams> {
  final AuthRepository repository;

  LoginEmailUseCase({required this.repository});

  @override
  Future<Either<Failure, LoginEmailResponse>> call(LoginEmailParams params) async {
    return await repository.loginEmail(params: params);
  }
}


class LoginEmailParams extends Equatable {
  final String? email;
  final String? password;

  const LoginEmailParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  @override
  List<Object?> get props => <Object?>[
    email,
    password,
  ];

}



