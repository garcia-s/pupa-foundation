import React from 'react';
import './styled_labeled_input.css'
const StyledLabeledInput = ({ label, type, name, onChange }) => {
    return <div className='styled-labeled-input'>
        <label>{label}</label>
        <input type={type} name={name} onChange={onChange} />
    </div>
}

export default StyledLabeledInput