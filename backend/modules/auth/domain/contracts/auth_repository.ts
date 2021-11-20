import { Either } from "fp-ts/lib/Either";
import UserEntity from "../../../../core/domain/entities/user_entity";
import IFailure from "../../../../core/errors/failures/interface";

interface IAuthRepository {
  loginWithUsernameAndPassword: (p: {
    username: string;
    password: string;
  }) => Promise<Either<IFailure, UserEntity>>;
}

export default IAuthRepository;
