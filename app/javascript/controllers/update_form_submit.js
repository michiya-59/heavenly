document.addEventListener("DOMContentLoaded", function() {
  var updateButton = document.getElementById("update-button");
  updateButton.addEventListener("click", function(e) {
    e.preventDefault(); // フォームのデフォルトの送信を防ぐ
    var form = this.form; // ボタンが属するフォームを取得
    var learnId = form.dataset.learnId; // フォームからdata-learn-id属性の値を取得

    // フォームのaction属性を更新アクションのURLに設定
    form.action = `/learns/${learnId}`;
    form.method = 'post'; // フォームのメソッドをPOSTに設定

    // _methodの値をPATCHに設定する隠しフィールドを作成してフォームに追加
    var hiddenMethodInput = document.createElement('input');
    hiddenMethodInput.setAttribute('type', 'hidden');
    hiddenMethodInput.setAttribute('name', '_method');
    hiddenMethodInput.setAttribute('value', 'patch');
    form.appendChild(hiddenMethodInput);

    form.submit(); // フォームを送信
  });
});
