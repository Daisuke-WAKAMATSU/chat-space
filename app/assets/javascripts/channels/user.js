$(function() {
  var user_search_result = $("#user-search-result");
  var user_add = $("#user_add_result");
  function searchUsers(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.name }</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
                </div>`
    user_search_result.append(html);
  }

  function searchMessage() {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">該当するユーザーはいません</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="user.id" data-user-name="user.name"></a>
                </div>`
    user_search_result.append(html);
  }

  function addUser(user_id, user_name) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value=${user_id}>
                  <p class='chat-group-user__name'>${ user_name }</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`;
    user_add.append(html);
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();

    $.ajax({
      type: 'GET',
      url: '/users/',
      data: { keyword: input },
      dataType: 'json',
    })

    .done(function(users) {
     $("#user-search-result").empty();
     if (users.length !== 0) {
       users.forEach(function(user){
         searchUsers(user);
       });
     }
     else {
      searchMessage();
     }
   })
  });

  $(document).on('click', '.chat-group-user__btn--add', function(){
    var user_id = $(this).attr('data-user-id');
    var user_name = $(this).attr('data-user-name');
    addUser(user_id, user_name);
    $(this).parent().remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function(){
    $("#chat-group-user-8").remove();
  });
});
