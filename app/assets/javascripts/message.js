$(function() {
  var main_message = $(".main__message");
  function buildHTML(message) {
    if (message.image && message.body) {
      var html = `<div class="main__message__chat-contents" data-message-id: "#{message.id}"}>
                    <div class="main__message__send-name">${ message.user_name }</div>
                    <div class="main__message__send-time">${ message.time }</div>
                    <div class="main__message__content">${ message.body }</div>
                    <div class="main__message__content"><img src="${ message.image }"</div>
                  </div>`
    } else if (message.body){
      var html = `<div class="main__message__chat-contents" data-message-id: "#{message.id}"}>
                    <div class="main__message__send-name">${ message.user_name }</div>
                    <div class="main__message__send-time">${ message.time }</div>
                    <div class="main__message__content">${ message.body }</div>
                  </div>`
    } else {
      var html = `<div class="main__message__chat-contents" data-message-id: "#{message.id}"}>
                    <div class="main__message__send-name">${ message.user_name }</div>
                    <div class="main__message__send-time">${ message.time }</div>
                    <div class="main__message__content"><img src="${ message.image }"</div>
                  </div>`
    };
    main_message.append(html);
  }

  $("#new_message").on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(message) {
      buildHTML(message)
      $("#message_body").val('');
      $(".main__send__form-image").val('');
      $('.main__message').animate({
          'scrollTop': $('.main__message')[0].scrollHeight}, 'fast');
      $(".main__send-botton").prop('disabled', false);
    })
    .fail(function() {
      $("#message_body").val('');
      $(".main__send__form-image").val('');
      $(".main__send-botton").prop('disabled', false);
      alert("メッセージ送信が失敗しました")
    })
  });

  setInterval(function() {

    $.ajax({
      type: 'GET',
      url: location.href,
      dataType: 'json'
    })

  .done(function(messages) {
    var id = $('.main__message__chat-contents:last').data('message-id');
    var insertHTML = '';
    messages.forEach(function(message) {
      if (message.id > id ) {
        insertHTML += buildHTML(message);
      }
    });
    $('.main__message').animate({
          'scrollTop': $('.main__message')[0].scrollHeight}, 'fast');
  })
  },5000);
});
