import IFailure from "../../../../core/errors/failures/interface";
import { Either } from "fp-ts/lib/Either";
import UserEntity from "../../../../core/domain/entities/user_entity";
import IAuthRepository from "../contracts/auth_repository";

const login: (
  repo: IAuthRepository,
  p: { username: string; password: string }
) => Promise<Either<IFailure, UserEntity>> = (repo, params) =>
  repo.loginWithUsernameAndPassword(params);

export default login;
