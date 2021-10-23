import 'package:pupaadmin/core/usecases/interface.dart';
import 'package:pupaadmin/modules/auth/domain/contracts/auth_user_contract.dart';
import 'package:pupaadmin/modules/auth/domain/entities/session_entity.dart';

class LoginUseCase extends UseCase<SessionEntity, AuthParams> {
  AuthUserRepositoryContract repository;
  LoginUseCase(this.repository);

  Future<SessionEntity?> call(AuthParams params) async => await repository
      .loginWithUsernameAndPassword(params.username, params.password);
}

class AuthParams {
  final String username;
  final String password;

  AuthParams({
    required this.username,
    required this.password,
  });
}
