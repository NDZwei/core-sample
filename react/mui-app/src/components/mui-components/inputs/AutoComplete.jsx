import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import { Stack } from '@mui/material';

const AutoComplete = () => {
    const names = [
        "Duc",
        "Nam",
        "Huong",
        "Son",
        "Linh"
    ];

    const films = [
        { label: 'The Shawshank Redemption', year: 1994 },
        { label: 'The Godfather', year: 1972 },
        { label: 'The Godfather: Part II', year: 1974 },
        { label: 'The Dark Knight', year: 2008 },
        { label: '12 Angry Men', year: 1957 },
        { label: "Schindler's List", year: 1993 },
        { label: 'Pulp Fiction', year: 1994 },
        {
            label: 'The Lord of the Rings: The Return of the King',
            year: 2003,
        },
        { label: 'The Good, the Bad and the Ugly', year: 1966 },
        { label: 'Fight Club', year: 1999 },
        {
            label: 'The Lord of the Rings: The Fellowship of the Ring',
            year: 2001,
        },
        {
            label: 'Star Wars: Episode V - The Empire Strikes Back',
            year: 1980,
        }
    ];

    const filmNews = [
        { name: 'The Shawshank Redemption', year: 1994 },
        { name: 'The Godfather', year: 1972 },
        { name: 'The Godfather: Part II', year: 1974 },
        { name: 'The Dark Knight', year: 2008 },
        { name: '12 Angry Men', year: 1957 },
        { name: "Schindler's List", year: 1993 },
        { name: 'Pulp Fiction', year: 1994 },
    ];

    const options = films.map((option) => {
        const firstLetter = option.label[0].toUpperCase();
        return {
          firstLetter: /[0-9]/.test(firstLetter) ? '0-9' : firstLetter,
          ...option,
        }
    });
    return (
        <div>
            <Stack paddingY={3}>
                <Autocomplete
                    disablePortal
                    id="combo-box-demo"
                    options={names}
                    sx={{ width: 300 }}
                    renderInput={(params) => <TextField {...params} label="Name" />}
                />
            </Stack>
            <Stack paddingY={3}>
                <Autocomplete
                    multiple
                    defaultValue={[films[0]]}
                    disablePortal
                    id="combo-box-demo"
                    options={films}
                    sx={{ width: 300 }}
                    renderInput={(params) => <TextField {...params} label="Film" />}
                />
            </Stack>
            <Stack paddingY={3}>
                <Autocomplete
                    multiple
                    disablePortal
                    id="combo-box-demo"
                    options={filmNews}
                    getOptionLabel={(option) => option.name}
                    sx={{ width: 300 }}
                    renderInput={(params) => <TextField {...params} label="Film" />}
                />
            </Stack>
            <Stack paddingY={3}>
                <Autocomplete
                    id="grouped-demo"
                    multiple
                    options={options.sort((a, b) => -b.firstLetter.localeCompare(a.firstLetter))}
                    groupBy={(option) => option.firstLetter}
                    getOptionLabel={(option) => option.label}
                    sx={{ width: 300 }}
                    renderInput={(params) => <TextField {...params} label="With films sort" />}
                />
            </Stack>
        </div>
    )
}

export default AutoComplete