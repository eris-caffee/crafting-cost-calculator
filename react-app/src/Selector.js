import React, { useState } from 'react'
import { array, func, number, string } from 'prop-types';

const propTypes = {
    name: string.isRequired,
    data: array.isRequired,
    onValueChange: func.isRequired,
    initialValue: number,
}

const Selector = ({
    name,
    data,
    onValueChange,
    initialValue,
}) => {

    const [value, setValue] = useState(initialValue || 0);

    let selectOptions = null;

    if (data !== null) {
        selectOptions = data.map(
            (entry) =>
                <option value={entry.id} key={entry.id}>{entry.name}</option>
        );
    }

    const handleChange = ( e ) => {
        setValue(e.target.value);
        onValueChange(parseInt(e.target.value));
    }

    return (
        <div>
            <h6>{name}</h6>
            <select value={value}
                onChange={handleChange} >
                {selectOptions}
            </select>
        </div>
    );
};

Selector.propTypes = propTypes;
export default Selector;
