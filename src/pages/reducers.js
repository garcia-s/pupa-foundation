export const addAnimalReducer = (state, { type, data }) =>
    type == 'species' ? { ...state, species: data } :
        type == 'name' ? { ...state, name: data } :
            type == 'breed' ? { ...state, breed: data } :
                type == 'age' ? { ...state, age: data } :
                    type == 'description' ? { ...state, description: data } :
                        type == 'vaxxed' ? { ...state, vaxxed: data } :
                            type == 'dewormed' ? { ...state, dewormed: data } :
                                type == 'images' ? { ...state, images: data } :
                                    state;