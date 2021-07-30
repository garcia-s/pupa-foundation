import React, { useReducer } from "react"

import Select from "react-select";
import CustomImageUploader from "../components/inputs/custom_image_uploader";

import { addAnimalReducer } from "./reducers";
import './temp.css'

export default function Home() {
  return <AppForm></AppForm>
}

const AppForm = () => {

  const [state, dispatch] = useReducer(addAnimalReducer, { images: [] });
  return <form onSubmit={(e) => {
    e.preventDefault();
    console.log(state);
  }}>
    {/* Especie */}
    <div>
      <label>Especie</label>
      <Select
        options={[
          { value: 'cat', label: 'Gato' },
          { value: 'dog', label: 'Dog' }
        ]}
        onChange={(e) => dispatch({ type: 'species', data: e.value })} />
    </div>
    {/* Images */}
    <CustomImageUploader imageList={state.images}
      onChange={(data) => dispatch({type:'images' , data})}
    />
    {/* Nombre */}
    <LabeledInput type='text' label='Nombre'
      name='name'
      onChange={(e) =>
        dispatch({ type: e.target.name, data: e.target.value })
      } />

    {/* Raza */}
    <LabeledInput type='text' label='Raza'
      name='breed'
      onChange={(e) =>
        dispatch({ type: e.target.name, data: e.target.value })
      } />
    {/* Edad */}
    <LabeledInput type='number' label='Edad estimada (Meses)' name='age'
      onChange={(e) =>
        dispatch({ type: e.target.name, data: e.target.value })
      } />
    {/* Descripcion */}
    <div>
      <label>Descripcion</label>
      <textarea
        name='description'
        onChange={({ target }) =>
          dispatch({ type: target.name, data: target.value })} />
    </div>
    {/* Vacunas */}
    <div>
      <label>Vacunado/a</label>
      <Select
        options={[
          { value: true, label: 'Si' },
          { value: false, label: 'No' }
        ]}
        onChange={(e) => dispatch({ type: 'vaxxed', data: e.value })}
      />
    </div>
    {/* Desparacitacion */}
    <div>
      <label>Desparacitado/a</label>
      <Select
        options={[
          { value: true, label: 'Si' },
          { value: false, label: 'No' }
        ]}
        onChange={(e) => dispatch({ type: 'dewormed', data: e.value })}
      />
    </div>
    {/* Tamaño */}


    <button>Enviar</button>
  </form>
}

const LabeledInput = ({ label, type, name, onChange }) => {
  return <div>
    <label>{label}</label>
    <input type={type} name={name} onChange={onChange} />
  </div>
}

