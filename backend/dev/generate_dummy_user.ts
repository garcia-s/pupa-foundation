import createUser from "../private/auth/repositories/create_user"
import {v4 as uuid} from 'uuid'
(async () => {
    createUser(
        {
            
            name: 'Dummy',
            username: 'dummy',
            id: uuid(),
            lastname: 'User',
            password: '123456',

        }
    )
})()