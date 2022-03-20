document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿機能・編集ページのフォームを取得
  const postForm = document.getElementById('new_shoes');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投・編集ページのフォームがないならここで終了
  if (!postForm) return null;
  // 投稿できる枚数の上限
  const imageLimits = 4;
  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) =>{
    // 画像表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);
    // 表示する画像を生成
    const previewImage= document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    // 削除ボタンを生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";
    // 削除ボタンをクリックしたらプレビューとfile fieldを削除させる
    deleteButton.addEventListener("click", () => deleteImage(dataIndex));
    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  };
  // file fieldを生成・表示する関数
  const buildNewFileField = () => {
    // 2枚目用のfile fieldを作成
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'post[images][]');
    // 最後のfile fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="post[images][]"]:last-child');
    // nextdataindex = 最後のfile fieldのdata-index+1
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);
    // 追加されたfile fieldにchangeイベントをセット
    newFileField.addEventListener("change", changedFileField);
    // せいせいしたfile fieldを表示
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };
  // 指定したdata-indexを持つプレビューとfile fieldを削除する
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();
    // 画像の枚数が最大の時に削除ボタンを押した場合file fieldを一つ追加する
    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount == imageLimits - 1) buildNewFileField();
  };
  // input要素で値の変化が起きた際に呼び出される関数の中身
  const changedFileField = (e) => {
    // data-index(何番目を操作しているか)を取得
    const dataIndex = e.target.getAttribute('data-index');

    const file = e.target.files[0];
    // fileが空＝何も選択しなかったのでプレビュー等を削除して終了する
    if (!file) {
      deleteImage(dataIndex);
      return null;
    };
    
    const blob = window.URL.createObjectURL(file);
    // data-indexを使用して既にプレビューが表示されているかを確認する
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      // クリックしたfile fieldのdata-indexと同じ番号のプレビュー画像が既に表示されている場合は画像の差し替えのみを行う
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    };


    buildPreviewImage(dataIndex, blob);
    // 画像の枚数制限に引っ掛からなければ新しいfile fieldを追加する
    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount < imageLimits) buildNewFileField();
  };
  // input要素を取得する
  const fileField = document.querySelector('input[type="file"][name="post[images][]"]');
  // input要素で値の変化が起きた際日呼び出される関数
  fileField.addEventListener('change', changedFileField);
});