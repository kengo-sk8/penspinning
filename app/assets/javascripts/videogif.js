function previewImage(id) {
  const target = this.event.target;     //イベントを発生させたオブジェクトを参照
  const file = target.files[0];       //選択した画像ファイルを代入
  const reader = new FileReader();     //fileオブジェクトを読み込み
  reader.onloadend = function() {      //読み込みが終了した時に発火するイベント
    preview.src = reader.result;       //ファイルの内容を返す
  };
  if (file) {
    reader.readAsDataURL(file);       //ファイルのデータを示すURLを格納
  } else {
    preview.src = "";
  }
}
