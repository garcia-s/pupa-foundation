export const addAnimalReducer = (state, { type, data }) => {
    if (type === 'species') { return { ...state, species: data } }
    else if (type === 'name') { return { ...state, name: data } }
    else if (type === 'breed') { return { ...state, breed: data } }
    else if (type === 'age') { return { ...state, age: data } }
    else if (type === 'description') { return { ...state, description: data } }
    else if (type === 'vaxxed') { return { ...state, vaxxed: data } }
    else if (type === 'dewormed') { return { ...state, dewormed: data } }
    else if (type === 'sterilized') { return { ...state, sterilized: data } }
    else if (type === 'images') { return { ...state, images: data } }
    else if (type === 'size') { return { ...state, size: data } }
    return state;
}