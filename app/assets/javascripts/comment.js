$(function(){
  function buildHTML(comment){ //関数を定義する。また、引数の中は、引っ張ってくる値を使用する（今回であればcomment）
    var html = `<div class="comments-box__message">
                  <div class="comments-box__message__products">
                    <div class="comments-box__message__products__user">
                      <div class="comments-box__message__products__user__name">${comment.user_name}</div>
                    </div>
                    <div class="comments-box__message__products__body">
                      ${comment.text}
                      <div class="comments-box__message__products__body__icons">
                        <div class="comments-box__message__products__body__icons__left">
                          <i class="fas fa-history"></i>
                          <span>${comment.created_at}</span>
                        </div>
                        <div class="comments-box__message__products__body__icons__right">
                          <div class="message-delete">
                            <a id="delete_btn" rel="nofollow" data-method="delete" href="/products/${comment.product_id}/comments/${comment.id}">
                              <i class="fas fa-trash"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </divZ>
                  </div>
                </div>`
    return html;
  } //上記の記述は非同期で表示させた部分をHTML表記で記述した。テンプレートリテラル「`」を用いて記入する。(シングルクォーテンションとは異なるので注意)


  // ↓送信ボタン('submit')クリック時にイベント発火
  // ('#new_comment') form_forで作成した入力フォームに、あらかじめid属性が付与されている。ブラウザの要素検証を利用して、メッセージ送信フォームのid属性を確認して値('#new_comment')を入れた。ちなみに、今回はidが振ってある。
  $('#new_comment').on('submit', function(e){
    e.preventDefault();  //e.preventDefaultで送信ボタンクリック時の通信を止める
    console.log(this);
    var formData = new FormData(this); //このthisは、show.html.hmalのfrom_forの全てのデータが格納されている。(FormDataについては下記に詳細を記述)
    // new FormData(this);左記の記述により、var formDataに値を格納している。railsで言うインスタンス化を行っている(@〇〇的な感じ。もっと簡単に言えば、def newで書いてる事を行っている)
    // ↓非同期通信でコメントが保存されるようにする
    var url = $(this).attr('action') //このthisもform_forのデータを全て格納している
    //$(this).attr('action') はthisのデータ(form_forのデータ)からaction属性のデータを取り出す為の記述をしている。今回の場合のsction属性のデータは、右記の内容 action = "/products/2/commnts" (検証ツール or 下記にdebugger;入力で確認出来る)
    $.ajax({
      url: url, //同期通信でいう『パス』
      type: "POST", //同期通信でいう『HTTPメソッド』
      data: formData,  //上で定義したformDataを使用する
      dataType: 'json', //データ型は、jsonを指定
      processData: false, //formDataで値を取得している為、この２行を書く必要がある。
      contentType: false  //jqueryのajax機能には、データを送る際に適した形にして送る仕様になっている。ただ、今回はそんな事をしないでも送る様に定義した為、この２行を書く必要がある
    })
    .done(function(comment){
      var html = buildHTML(comment); //buildHTML(comment)の結果が反映される様する記述をした
      $('.message-box').append(html); //コメント記述されている物にアペンドを行うのではなく、大枠（今回だとmessage-boxに）にappendを行う。これにより、正常に動作が出来る
      $('.comment-area').val(''); //val(''); 左記の記述により、comment-area内に書いた文を消す動作を行っている。これがないと送信しても、文字が残り続ける。
      $('.comment-btn__submit').prop('disabled', false);  //.prop('disabled', false);により、何度もボタンが押せる様になる。これがないと、文字を送信した後、submitボタンが押せなくなる
    })
    .fail(function(){
      alert('文字を入力して下さい')
    });
  })
});


// FormDataオブジェクトとは、サーバーにデータを送信する際に使用するオブジェクトです。
// ユーザーが入力するフォームデータや、任意のデータをサーバーに送信できます。
// appendメソッドはhtml要素を動的に追加することができるメソッドです。appendメソッドを使用すればほんの数行でhtml要素を追加することができるのでとても便利です。
