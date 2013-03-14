jQuery.fn.submitWithAjax = function() {
  this.unbind('submit', false);
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })

  return this;
};

//Send data via get if <acronym title="JavaScript">JS</acronym> enabled
jQuery.fn.getWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.get($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via Post if <acronym title="JavaScript">JS</acronym> enabled
jQuery.fn.postWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.post($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.putWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.put($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

jQuery.fn.deleteWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
    $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//This will "ajaxify" the links
function ajaxLinks(){
    $('.ajaxForm').submitWithAjax();
    $('a.get').getWithAjax();
    $('a.post').postWithAjax();
    $('a.put').putWithAjax();
    $('a.delete').deleteWithAjax();
}

$(document).ready(function() {
  like();
  ajaxLinks();
});

$("li.user_nav").hover(
  function(){
    $(this).addClass("opened");
  },
  function(){
    $(this).removeClass("opened")
  }
  );
$("li.user_nav>a").click(function(){
  $(this).parent().toggleClass("opened");
  return false;
})
$("a.add_like").click(function  (argument) {
  // body...
})
function like() {
    $(".add_like").click(function(){
      var url = $(this).attr('href');
      if($(this).hasClass("processing")){
        return false;
      }
      if($(this).hasClass("liked")){
        ajaxlike($(this),'delete',url);
      }else{ 
        ajaxlike($(this),'post',url);
      }
      return false;
    });
  }
function ajaxlike(elment,method,aurl){
  $.ajax({
  type: method,
  url: aurl,
  data: "",
  beforeSend: function() {
    elment.addClass('processing');
    elment.find("span").append('<span>...</span>');
  },
  error: function(){
    alert("Have some error!Please try again.");
    return false;
  },
  success: function(data) {
    if (data.done==true) {
      if(data.fav_type=="add"){
        elment.removeClass('processing').addClass("liked");
        elment.find("span").text("Liked!");
      }else if(data.fav_type=="remove"){
        elment.removeClass('processing').removeClass("liked");
        elment.find("span").text("like");
      }
    }else{
      alert("Have some error!Please try again.");
      return false;
    };
  }
  });
}
like();