document.addEventListener('DOMContentLoaded', function(){
  const postForm = document.getElementById('new_shoes');
  const previewList = document.getElementById('previews');
  if (!postForm) return null;

  const buildPreviewImage = (dataIndex, blob) =>{
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage= document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  };

  const buildNewFileField = () => {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'post[images][]');

    const lastFileField = document.querySelector('input[type="file"][name="post[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);

    newFileField.addEventListener("change", changedFileField);

    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };

  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    buildPreviewImage(dataIndex, blob);
    buildNewFileField();
  };

  const fileField = document.querySelector('input[type="file"][name="post[images][]"]');

  fileField.addEventListener('change', changedFileField);
});