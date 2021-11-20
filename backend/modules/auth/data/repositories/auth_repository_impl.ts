import UserEntity from "../../../../core/domain/entities/user_entity";
import IFailure from "../../../../core/errors/failures/interface";
import { Either } from "fp-ts/lib/Either";
import IAuthRepository from "../../domain/contracts/auth_repository";
import poolConnection from "../../../../core/database";

class AuthRepositoryImpl implements IAuthRepository {
  async loginWithUsernameAndPassword(params: {
    username: string;
    password: string;
  }): Promise<Either<IFailure, UserEntity>> {
    const client = await poolConnection.connect();
    try {
      const res = await client.query(
        "SELECT * FROM users Where username= $1 password= $2",
        [params.username, params.password]
      );
      
    } catch (e) {
      throw e;
    } finally {
      client.release();
    }
  }
}
