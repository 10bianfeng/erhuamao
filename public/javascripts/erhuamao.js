$("#primary_navigation tbody tr td").hover(function(){
$(this).children(":first").addClass("show_menu");
$inner_menu=$(this).find("ul");
$(this).find(".menu").addClass("show_menu").html("<div class='outset_content'><div class='inset_content'></div></div>").find(".inset_content").append($inner_menu).parents(".menu").append("<div class='corner_top_left'></div><div class='corner_top_right'></div><div class='corner_bottom_right'></div><div class='corner_bottom_left'></div><div class='side_top'></div><div class='side_right'></div><div class='side_bottom'></div><div class='side_left'></div>");
},function(){
$(this).children().removeClass("show_menu");
$inner_menu=$(this).find("ul");
$(this).find(".menu").removeClass("show_menu").html($inner_menu);
});
// popout mask onclick remove
$("#popout_modal_mask").live("click",function(){
	$(".search_modal").hide();
	$("#popout_modal").hide();
	$(this).remove();
})