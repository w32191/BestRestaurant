$(function () {

  //新增帳號按鈕
  $("#insertBtn").click(function () {
    $("#dialog").dialog('open');
  });

  let id;
  $('.deleteBtn').click(function () {
    //點刪除時先取得該筆資料的id
    id = $(this).closest('tr').children('td:eq(0)').text();
    $('#dialogDelete').dialog('open');
  });

  //刪除的dialog
  $('#dialogDelete').dialog({
    autoOpen: false,
    width: 350,
    modal: true,
    buttons: {
      "刪除": function () {
        $.ajax({
          url: "member.delete/id/" + id,
          type: "GET",
          success: function (res) {
            if (res === 'success') {
              $('#result-content').text("刪除成功");
              //將畫面上該行<tr>元素給remove掉
              $(`#delete${id}`).closest('tr').remove();
            } else {
              $('#result-content').text("刪除失敗");
            }
            $('#dialogResult').dialog();
          }
        });

        $(this).dialog('close');
      },
      "取消": function () {
        $(this).dialog('close');
      }
    }
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

  var updateIdValue, updateNameValue, updateAccountValue, updateGenderValue,
      updateAddressValue, updateTelValue, updatePerssionValue;

  //Edit click時
  $('.templatemo-edit-btn.edit1').click(function () {

    //先抓到點下編輯按鈕的該行<tr>中，全部的資料
    updateIdValue = $(this).closest('tr').children('td:eq(0)').text();
    updateNameValue = $(this).closest('tr').children('td:eq(1)').text();
    updateAccountValue = $(this).closest('tr').children('td:eq(2)').text();
    updateGenderValue = $(this).closest('tr').children('td:eq(3)').text();
    updateAddressValue = $(this).closest('tr').children('td:eq(4)').text();
    updateTelValue = $(this).closest('tr').children('td:eq(5)').text();
    updatePerssionValue = $(this).closest('tr').children('td:eq(6)').text();

    if (updateGenderValue === '男') {
      $('#updateGender').find('option[value="1"]').attr("selected", "selected");
    } else {
      $('#updateGender').find('option[value="2"]').attr("selected", "selected");
    }

    if (updatePerssionValue === '管理者') {
      $('#updatePerssion').find('option[value="99"]').attr("selected",
          "selected");
    } else if (updatePerssionValue === '一般帳號') {
      $('#updatePerssion').find('option[value="1"]').attr("selected",
          "selected");
    } else if (updatePerssionValue === '門市人員') {
      $('#updatePerssion').find('option[value="2"]').attr("selected",
          "selected");
    }

    // 將該行資料
    $('#updateId').val(updateIdValue);
    $('#updateName').val(updateNameValue);
    $('#updateAccount').val(updateAccountValue);
    $('#updateAddress').val(updateAddressValue);
    $('#updateTel').val(updateTelValue);

    $('#dialogUpdate').dialog('open');
  });

  //update的dialog
  $('#dialogUpdate').dialog({
    autoOpen: false,
    buttons: {
      "更新": function () {
        $('#updateForm').submit();
        $(this).dialog('close');
      },
      "取消": function () {
        $(this).dialog('close');
      }
    }
  });

});
