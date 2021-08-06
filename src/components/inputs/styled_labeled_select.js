import React from 'react';
import Select from "react-select";
import './styled_labeled_select.css';

const StyledLabeledSelect = ({ label, options, onChange }) => {
    return <div className='styled-labeled-select'>
        <label>{label}</label>
        <Select
            options={options}
            onChange={onChange} />
    </div>
}

export default StyledLabeledSelect