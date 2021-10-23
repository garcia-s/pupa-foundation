import 'package:pupaadmin/modules/auth/domain/entities/session_entity.dart';

abstract class AuthUserRepositoryContract {
  Future<SessionEntity?> loginWithUsernameAndPassword(
      String username, password);
      
  Future<SessionEntity?> getSessionById(String id);
}
