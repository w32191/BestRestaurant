$(function () {

  //管理者帳號一鍵輸入
  $('#adminBtn').click(function () {
    $('#accountInput').val('admin');
    $('#pwdInput').val('aa');
  });

  //使用者帳號一鍵輸入
  $('#userBtn').click(function () {
    $('#accountInput').val('user');
    $('#pwdInput').val('uu');
  });

  //註冊按鈕,open dialog
  $("#insertBtn").click(function () {
    $("#dialog").dialog('open');
  });

  //新增帳號的dialog
  $("#dialog").dialog({
    autoOpen: false,
    width: 350,
    modal: true,
    buttons: {
      "新增": function () {
        $('#insertForm').submit();
        $(this).dialog('close');
      },
      "取消": function () {
        $(this).dialog('close');
      }
    }
  });

});


