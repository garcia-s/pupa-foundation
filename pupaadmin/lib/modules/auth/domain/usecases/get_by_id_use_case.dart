import 'package:pupaadmin/core/usecases/interface.dart';
import 'package:pupaadmin/modules/auth/domain/contracts/auth_user_contract.dart';
import 'package:pupaadmin/modules/auth/domain/entities/session_entity.dart';

class GetSessionByIdUseCase extends UseCase<SessionEntity, SessionId> {
  AuthUserRepositoryContract repository;

  GetSessionByIdUseCase(this.repository);

  @override
  Future<SessionEntity?> call(SessionId params) async =>
      await repository.getSessionById(params.id);
}

class SessionId {
  final String id;
  SessionId(this.id);
}
