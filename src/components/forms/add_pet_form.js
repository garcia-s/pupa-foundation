
import React, { useReducer } from "react"
import CustomImageUploader from "../inputs/custom_image_uploader";
import StyledLabeledInput from "../inputs/styled_labeled_input";
import StyledLabeledSelect from "../inputs/styled_labeled_select";
import StyledLabeledTextarea from "../inputs/styled_labeled_textarea";
import { addAnimalReducer } from "../../reducers";
import { validateRescuedData } from "../../validators";
const AddPetForm = () => {

    const [state, dispatch] = useReducer(addAnimalReducer, { images: [] });
    return <form className='add-pet-form' onSubmit={(e) => {
        e.preventDefault();
        console.log(typeof state.images)
        const { isValid, errors } = validateRescuedData(state);
        console.log(errors);
    }}>
        {/* Especie */}
        <StyledLabeledSelect
            label='Especie'
            options={[
                { value: 'cat', label: 'Gato' },
                { value: 'dog', label: 'Dog' }
            ]}
            onChange={(e) => dispatch({ type: 'species', data: e.value })} />

        {/* Images */}
        <CustomImageUploader imageList={state.images}
            label='Imagenes'
            onChange={(data) => dispatch({ type: 'images', data })}
        />
        {/* Nombre */}
        <StyledLabeledInput type='text' label='Nombre'
            name='name'
            onChange={(e) =>
                dispatch({ type: e.target.name, data: e.target.value })
            } />

        {/* Raza */}
        <StyledLabeledInput type='text' label='Raza'
            name='breed'
            onChange={(e) =>
                dispatch({ type: e.target.name, data: e.target.value })
            } />
        {/* Edad */}
        <StyledLabeledInput type='number' label='Edad estimada (Meses)' name='age'
            onChange={(e) =>
                dispatch({ type: e.target.name, data: e.target.value })
            } />
        {/* Descripcion */}
        <StyledLabeledTextarea
            label='Descripción'
            onChange={({ target }) => dispatch({ type: 'description', data: target.value })}
        />
        {/* Vacunas */}
        <StyledLabeledSelect
            label='Vacunado/a'
            options={[
                { value: true, label: 'Si' },
                { value: false, label: 'No' }
            ]}
            onChange={(e) => dispatch({ type: 'vaxxed', data: e.value })}
        />
        <StyledLabeledSelect
            label='Esterilizado/a'
            options={[
                { value: true, label: 'Si' },
                { value: false, label: 'No' }
            ]}
            onChange={(e) => dispatch({ type: 'sterilized', data: e.value })}
        />

        {/* Desparacitacion */}
        <StyledLabeledSelect
            label='Desparasitado/a'
            options={[
                { value: true, label: 'Si' },
                { value: false, label: 'No' }
            ]}
            onChange={(e) => dispatch({ type: 'dewormed', data: e.value })}
        />
        {/* Tamaño */}
        <StyledLabeledInput
            type='number'
            label='Tamaño (en CM)'
            name='size'
            onChange={({ target }) => dispatch({ type: 'size', data: target.value })}
        />

        <button>Enviar</button>
    </form>
}

export default AddPetForm