import User from "../../../models/user";

interface NewUser extends User {
    password: string
}


export default NewUser;