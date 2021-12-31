import consumer from "./consumer"

consumer.subscriptions.create({
  channel: "MessageChannel",
  group_id: location.pathname.match(/\d+/)[0]
},{
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // current_user.idを取得
    const user = document.getElementById("current_user_id");
    const current_user_id = user.value
    // 時間の取得
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth()+1;
    const today = now.getDate();
    const hour = now.getHours();
    const mins = now.getMinutes();
    let html = ""
if (data.user.id == current_user_id) {
html = `<div class="message-mine">${ data.user.name }  ${year}/${month}/${today} ${hour}:${mins}
<p>${ data.message.message }</p></div>`
} else {
html = `<div class="message-content">${ data.user.name }  ${year}/${month}/${today} ${hour}:${mins}
<p>${ data.message.message }</p></div>`
};
    const messages = document.getElementById("messages")
    messages.insertAdjacentHTML('afterbegin', html)
    const messageForm = document.getElementById("message-form")
    messageForm.reset();
  }
});