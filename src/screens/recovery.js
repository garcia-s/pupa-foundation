import { Link } from "gatsby"
import React from "react"
import StyledLabeledInput from "../components/inputs/styled_labeled_input"


export default function RecoveryScreen() {
    return <div>
        <form onSubmit={(e) => {
            e.preventDefault()}}>
            <StyledLabeledInput type='email' label='Correo' />
            <button>Recuperar</button>
        </form>
    </div>
}

