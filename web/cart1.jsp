<%-- 
    Document   : cart1
    Created on : 2018-9-10, 16:05:39
    Author     : ZJX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>JQuery购物车多物品数量的加减+总价计算</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
		<script>
			$(function() {
				$(".add").click(function() {
					var t = $(this).parent().find('input[class*=text_box]');
					if(t.val()==""||undefined||null){
						t.val(0);
					}
					t.val(parseInt(t.val()) + 1)
					setTotal();
				})
				$(".min").click(function() {
					var t = $(this).parent().find('input[class*=text_box]');
					if(t.val()==""||undefined||null){
						t.val(0);
					}
					t.val(parseInt(t.val()) - 1)
					if(parseInt(t.val()) < 0) {
						t.val(0);
					}
					setTotal();
				})
				$(".text_box").keyup(function(){
					var t = $(this).parent().find('input[class*=text_box]');
					if(parseInt(t.val())==""||undefined||null || isNaN(t.val())) {
						t.val(0);
					}
					setTotal();
				})
				function setTotal() {
					var s = 0;
					$("#tab td").each(function() {
						var t = $(this).find('input[class*=text_box]').val();
						var p = $(this).find('span[class*=price]').text();
						if(parseInt(t)==""||undefined||null || isNaN(t) || isNaN(parseInt(t))){
							t=0;
						}
						s += parseInt(t) * parseFloat(p);
					});
					$("#total").html(s.toFixed(2));
				}
				setTotal();
			})
		</script>
		<style type="text/css">
	    input[type=number] {  
		    -moz-appearance:textfield;  
		}  
		input[type=number]::-webkit-inner-spin-button,  
		input[type=number]::-webkit-outer-spin-button {  
		    -webkit-appearance: none;  
		    margin: 0;  
		}
		</style>
	</head>
	<body>
		<table id="tab">
			<tr>
				<td>
					<span>单价:</span><span class="price">50.00</span>
					<input class="min" name="" type="button" value="-" />
					<input class="text_box" name="" type="number" value="" placeholder="0"/>
					<input class="add" name="" type="button" value="+" />
				</td>
			</tr>
			<tr>
				<td>
					<span>单价:</span><span class="price">20.00</span>
					<input class="min" name="" type="button" value="-" />
					<input class="text_box" name="" type="number" value="" placeholder="0"/>
					<input class="add" name="" type="button" value="+" />
				</td>
			</tr>
		</table>
		<p>总价：<label id="total"></label></p>
	</body>
</html>
