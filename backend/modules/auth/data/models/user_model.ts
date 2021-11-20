import UserEntity from "../../../../core/domain/entities/user_entity";

class UserModel implements UserEntity {
  id: string;
  name: string;
  lastname: string;
  username: string;

  constructor(params: {
    id: string;
    name: string;
    lastname: string;
    username: string;
  }) {
    this.id = params.id;
    this.username = params.username;
    this.name = params.name;
    this.lastname = params.lastname;
  }

  static isUser(data: any): data is UserModel {
    const d = data as UserModel;

    return (
      typeof d.id === "string" &&
      d.id !== "" &&
      typeof d.username === "string" &&
      d.username !== "" &&
      typeof d.name === "string" &&
      d.name !== "" &&
      typeof d.lastname === "string" &&
      d.lastname !== ""
    );
  }
}
