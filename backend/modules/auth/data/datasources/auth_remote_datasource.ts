import UserEntity from "../../../../core/domain/entities/user_entity";
import { string } from "fp-ts";

export interface IAuthRemoteDataSource {
  loginWithUserNameAndPassword(p: {
    username: string;
    password: string;
  }): UserEntity;
}
