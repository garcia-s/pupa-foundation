import 'package:pupaadmin/modules/auth/data/models/session_model.dart';

abstract class SessionRemoteSource {
  ///Throws [ServerException] for all error codes
  Future<SessionModel> getSessionbyLoginInfo(String username, String password);

  Future<SessionModel?> getSessionbyId(String id);
}
