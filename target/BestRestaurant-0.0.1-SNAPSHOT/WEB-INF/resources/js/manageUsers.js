$(function () {

  $("#insertBtn").click(function () {
    $("#dialog").dialog('open');
  });

$('.deleteBtn').click(function (){
  if(!window.confirm("確定要刪除嗎？")){
    $('.deleteBtn').attr("href","");
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

  var updateIdValue, updateNameValue, updateAccountValue, updateGenderValue, updateAddressValue,
      updateTelValue, updatePerssionValue;

  //Edit click時
  $('.templatemo-edit-btn.edit1').click(function () {

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
      $('#updatePerssion').find('option[value="99"]').attr("selected", "selected");
    } else if (updatePerssionValue === '一般帳號') {
      $('#updatePerssion').find('option[value="1"]').attr("selected", "selected");
    }else if(updatePerssionValue==='門市人員'){
      $('#updatePerssion').find('option[value="2"]').attr("selected", "selected");
    }

    $('#updateId').val(updateIdValue);
    $('#updateName').val(updateNameValue);
    $('#updateAccount').val(updateAccountValue);
    $('#updateAddress').val(updateAddressValue);
    $('#updateTel').val(updateTelValue);


    $('#dialogUpdate').dialog('open');
  });
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