export const validateRescuedData = (data) => {
    let errors = {}
    let isValid;
    
    if (data.species !== 'cat'
        && data.species !== 'dog'
        && data.species !== 'rabbit') {
        errors.species = 'Seleccione una especie valida'
    }

    if (typeof (data.name) !== 'string' || data.name === '') {
        errors.name = 'El nombre no puede estar vacio'
    }

    if (!Array.isArray(data.images) || data.images.length < 1) {
        errors.images = 'Debe seleccionar al menos una imagen'
    }

    if (typeof (data.breed) !== 'string' || data.breed === '') {
        errors.breed = 'La raza no puede estar vacia'
    }

    if (typeof (data.description) !== 'string' || data.description === '') {
        errors.description = 'Por favor escriba una descripcion'
    }

    if (typeof (data.vaxxed) !== 'boolean') {
        errors.vaxxed = 'Seleccione una opcion'
    }

    if (typeof (data.sterilized) !== 'boolean') {
        errors.sterilized = 'Seleccione una opcion'
    }

    if (typeof (data.dewormed) !== 'boolean') {
        errors.dewormed = 'Seleccione una opcion'
    }
    isValid = Object.keys(errors).length === 0;
    return { isValid, errors }
}