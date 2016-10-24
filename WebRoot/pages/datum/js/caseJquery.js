$(document).ready(function(){
//table
	$(".ui-table-list tr:odd").addClass("tr-odd-bg");
	$(".ui-table-list tr:even").addClass("tr-even-bg");
//Ìí¼Ó
/*
	$(".case-table").find(".case-btn-blue").each(function(){
		var e = function() {
			var cloneNode = $(this).parent().clone();
			cloneNode.appendTo($(this).parent().parent());
			$(cloneNode).find(".case-btn-blue").click(e);
		}
		$(this).click(e);
	});
*/
	$(".case-add").find(".case-btn").each(function(){

		var e = function() {
			$(this).parent(".case-add-del").remove();
		}

		$(this).click(function(){
			var node = $(".case-add-del:first").clone();
			node.appendTo($(this).parent().parent());
			node.show()
			node.find(".case-btn-del ").click(e);
		});
		
	});
	
	//É¾³ý¸½¼þ
	$(".case-updown-in").find(".case-del").click(function(){
		$(this).parent().remove();
	});
//tab
	$(".case-tab div").on({
		'click':function(){
			$(this).addClass("cur").siblings().removeClass("cur");
			$(".case-info-in").hide().eq($('.case-tab div').index(this)).show();
		}
	});









});