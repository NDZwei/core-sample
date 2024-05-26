import * as React from 'react';
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';

const AutoComplete = () => {
    const names = [
        "Duc",
        "Nam",
        "Huong",
        "Son",
        "Linh"
    ]
    return (
        <Autocomplete
            multiple
            disablePortal
            id="combo-box-demo"
            options={names}
            sx={{ width: 300 }}
            renderInput={(params) => <TextField {...params} label="Name" />}
        />
    )
}

export default AutoComplete