var happy = {
  USPhone: function (val) {
    return /^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test(val);
  },
  
  // matches mm/dd/yyyy (requires leading 0's (which may be a bit silly, what do you think?)
  date: function (val) {
    return /^(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])\/(?:\d{4})/.test(val);
  },
  email: function (val) {
    if(/^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/.test(val)){
      if($('#emailval').size()==0){
        $("#user_email").after('<span id="emailval" class="unhappyMessage">验证中...</span>');
      }
      else{
        $("#emailval").text('验证中...')
      }
      $.ajax({url:"http://localhost:3000/email.txt",error:function(){$("#emailval").removeClass("happyMessage").addClass("unhappyMessage").text("服务器错误,请稍候重试... ")},success:function(result){
          if(result=='false'){
            $("#emailval").replaceWith("<span id='emailval' class='unhappyMessage'>邮箱已被注册!!</span>");
          }
          else{
            $("#emailval").replaceWith("<span id='emailval' class='happyMessage'>邮箱正确!</span>");
          }
        }
      });
      return true;
    }
    else{
      $('#emailval').remove();
      return false;
    }
  },
  
  minLength: function (val, length) {
    return val.length >= length;
  },
  
  maxLength: function (val, length) {
    return val.length <= length;
  },
  
  equal: function (val1, val2) {
    return (val1 == val2);
  },

  nickname: function(val){
    $('#nicknameval').remove();
    if(/^\w+$/.test(val)&&val.length>=3){
      $('#user_username').after("<span id='nicknameval' class='unhappyMessage'>检查是否被注册...</span>");
      $.ajax ( {url:"http://localhost:3000/email.txt",error:function(){$("#nicknameval").removeClass("happyMessage").addClass("unhappyMessage").text("服务器错误,请稍候重试... ")},success:function(result){
        if(result=='false'){
          $("#nicknameval").replaceWith("<span id='nicknameval' class='unhappyMessage'>昵称已被注册!!</span>");
        }
        else{
          $("#nicknameval").replaceWith("<span id='nicknameval' class='happyMessage'>昵称可用!</span>");
        }
        }})
      return true;
    }
    else{
    return false;
    }
  },
  password: function(val){//password校验: 输入与否 强度校验
    if($('#passwordval').size()==0){$("#user_password").after("<span id='passwordval' class='warnMessage'></span>")}
    if(val.length<6){
      $('#passwordval').text("密码太短!");
      return true;
    }else if(val.length>40){
      $('#passwordval').text("密码太长!");
      return true;
    }else{
      $('#passwordval').removeClass("unhappyMessage").addClass("happyMessage").html('<i class="icon-ok"></i>');
      return true;
    }
  },
  password_confirmation: function(val){
    if($('#passwordcval').size()==0){$("#user_password_confirmation").after("<span id='passwordcval' class='warnMessage'></span>")}
    if(val==$('#user_password').val()){
      $('#passwordcval').removeClass("unhappyMessage").addClass("happyMessage").html('<i class="icon-ok"></i>');
      return true;
    }
    else{
      $('#passwordcval').removeClass("happyMessage").addClass("unhappyMessage").text("两次输入密码不一致!");
      return true;
    }
  },
};