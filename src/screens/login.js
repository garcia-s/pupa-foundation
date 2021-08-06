import { Link } from "gatsby"
import React, { useState } from "react"
import StyledLabeledInput from "../components/inputs/styled_labeled_input"


export default function LoginScreen() {
    const [loading, setLoading] = useState()
    const [user, setUser] = useState()
    const [pass, setPass] = useState()

    if(loading) {return <div>Loading Placeholder</div>}
    return <div>
        <form onSubmit={(e) => {
            e.preventDefault()
            setLoading(true)
            setTimeout(() => setLoading(false), 1500)
        }}>
            <StyledLabeledInput type='email' label='Usuario' />
            <StyledLabeledInput type='password' label='Contraseña' />
            <button>Entrar</button>
            <Link to='./recovery'>Olvidé mi Contraseña</Link>
        </form>
    </div>
}

