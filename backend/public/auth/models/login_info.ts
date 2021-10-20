export type LoginInformation = {
    username: string,
    password: string,
}


export const isLoginInformation = (data: Object): data is LoginInformation => {
    const object = data as LoginInformation
    return (typeof object.username === 'string' && object.password === 'string');
}