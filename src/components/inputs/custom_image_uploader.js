import ImageUploading from 'react-images-uploading';
import React from 'react';
import './custom_image_uploader.css'

const CustomImageUploader = ({ label, imageList, onChange, maxNumber }) => <div
className='custom-image-uploader'>
    <label>{label}</label>
    <ImageUploading
        multiple
        value={imageList}
        onChange={onChange}
        maxNumber={maxNumber}
        dataURLKey="data_url">
        {({
            imageList,
            onImageUpload,
            onImageRemove,
            dragProps,
        }) => {
            return <div
                {...dragProps}
                onClick={onImageUpload}
                className="dragbox-custom-image-wrapper">
                <div className='dragbox-inner-top'>
                    {imageList.map((image, index) => (
                        <div key={index}
                            className='dragbox-item'
                            onClick={(e) => e.stopPropagation()}>
                            <img src={image['data_url']} alt="image" />
                            <div onClick={onImageRemove} className='dragbox-item-remove'>X</div>
                        </div>
                    ))}
                </div>
                <div className='dragbox-inner-bottom'>
                    Arrastre las imagenes hasta aca o haga click.
                </div>
            </div>
        }}
    </ImageUploading>
</div>

export default CustomImageUploader;