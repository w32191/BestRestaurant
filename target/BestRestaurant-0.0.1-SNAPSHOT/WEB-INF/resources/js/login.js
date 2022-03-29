$(function () {
  $('#adminBtn').click(function () {
    $('#accountInput').val('admin');
    $('#pwdInput').val('aa');
  });

  $('#userBtn').click(function () {
    $('#accountInput').val('user');
    $('#pwdInput').val('uu');
  });

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


