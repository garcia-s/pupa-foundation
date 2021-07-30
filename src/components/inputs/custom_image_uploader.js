import ImageUploading from 'react-images-uploading';
import React from 'react';
import './custom_image_uploader.css'

const CustomImageUploader = ({ label, imageList, onChange, maxNumber }) => <div>
    <label>Imagenes</label>
    <ImageUploading
        multiple
        value={imageList}
        onChange={onChange}
        maxNumber={maxNumber}
        dataURLKey="data_url">
        {({
            imageList,
            onImageUpload,
            onImageRemoveAll,
            onImageUpdate,
            onImageRemove,
            isDragging,
            dragProps,
        }) => {
            return <div
                {...dragProps}
                onClick={onImageUpload}
                className="dragbox-custom-image-wrapper">
                <div className='dragbox-inner-top'>
                    {imageList.map((image, index) => (
                        <div key={index}
                            style={{
                                width: 150, height: 150, margin: 20,
                                borderRadius: 10,
                                overflow: 'hidden',
                                position: 'relative',

                            }}
                            onClick={(e) => e.stopPropagation()}>

                            <img src={image['data_url']}
                                alt="image"
                                style={{
                                    objectFit: 'cover', width: '100%', height: '100%'
                                }} />
                            <div className='custom-image-wrapper-remove-button'>X</div>
                        </div>
                    ))}
                </div>
                <div className='dragbox-inner-bottom'>
                    Arrastre las imagenes aqui o haga click.
                </div>
            </div>
        }}
    </ImageUploading>
</div>

export default CustomImageUploader;