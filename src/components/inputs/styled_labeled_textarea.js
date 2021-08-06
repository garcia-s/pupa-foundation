import React from 'react';
import './styled_labeled_textarea.css';

const StyledLabeledTextarea = ({ label,onChange }) => {
    return <div className='styled-labeled-textarea'>
        <label>{label}</label>
        <textarea onChange={onChange}>

        </textarea>
    </div>
}

export default StyledLabeledTextarea