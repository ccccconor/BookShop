<%-- 
    Document   : cart
    Created on : 2018-9-10, 14:17:39
    Author     : ZJX
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="serve.book"%>
<%@page import="serve.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>购物车</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/startstop-slider.js"></script>
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
  <div class="wrap">
	<div class="header">
		<div class="headertop_desc">
			<div class="call">
				 <p><span>Need help?</span> call us <span class="number">1-22-3456789</span></span></p>
			</div>
			<div class="account_desc">
				<ul>
					<li><a href="#">Register</a></li>
					<li><a href="#">Login</a></li>
					<li><a href="#">Delivery</a></li>
					<li><a href="#">Checkout</a></li>
					<li><a href="#">My Account</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="header_top">
			<div class="logo">
				<a href="index.html"><img src="images/logo.png" alt="" /></a>
			</div>
			  
			  <script type="text/javascript">
			function DropDown(el) {
				this.dd = el;
				this.initEvents();
			}
			DropDown.prototype = {
				initEvents : function() {
					var obj = this;

					obj.dd.on('click', function(event){
						$(this).toggleClass('active');
						event.stopPropagation();
					});	
				}
			}

			$(function() {

				var dd = new DropDown( $('#dd') );

				$(document).click(function() {
					// all dropdowns
					$('.wrapper-dropdown-2').removeClass('active');
				});

			});

		</script>
	 <div class="clear"></div>
  </div>
		     
	
   </div>
   
 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>购物车</h3>
    		</div>
    		<div class="see">
    			<p><a href="#">See all Products</a></p>
    		</div>
    		<div class="clear"></div>
    	</div>
	      <div class="section group">
                  <%
                      user u = new user();
                      book b = new book();
                      ResultSet r = u.getcart(250);
//                      while(r.next())
//                      {
//                          out.print("<p>");
//                          b = b.getbookbyid(r.getInt("BookId"));
//                          out.print(b.gettitle());
//                          out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
//                          out.print("价格："+b.getprice());
//                          out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
//                          out.print("数量："+r.getInt("Count"));
//                          out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
//                          out.print("总计："+(b.getprice()*r.getInt("Count")));
//                          out.print("</p>");
//                      }
                      %>
                  <div>
                      
                      
                      <table id="tab" width="800px" height="100px">
                          <%
                              while(r.next())
                              {
                                  b = b.getbookbyid(r.getInt("BookId"));
                              
                              %>
			<tr>
				<td>
                                                                                                <span><%=b.gettitle()%></span>
                                                                            </td>
                                                                            <td>
					<span>单价:</span><span class="price"><%=b.getprice() %></span>
                                                                            </td>
                                                                            <td>
					<input class="min" name="" type="button" value="-" />
                                        <input class="text_box" name="" type="number" value="<%=r.getInt("Count") %>" placeholder="0"/>
					<input class="add" name="" type="button" value="+" />
				</td>
			</tr>
                        <%} %>
<!--			<tr>
				<td>
					<span>单价:</span><span class="price">20.00</span>
					<input class="min" name="" type="button" value="-" />
					<input class="text_box" name="" type="number" value="" placeholder="0"/>
					<input class="add" name="" type="button" value="+" />
				</td>
			</tr>-->
		</table>
<p>总价：<label id="total"></label></p>
                
                      
                      
                      
                      
                      
                  </div>
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="preview.html"><img src="images/feature-pic1.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$620.87</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="preview.html"><img src="images/feature-pic2.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$899.75</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				    
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="preview.html"><img src="images/feature-pic3.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$599.00</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="preview.html"><img src="images/feature-pic4.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$679.87</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>				     
				</div>
			</div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>Feature Products</h3>
    		</div>
    		<div class="see">
    			<p><a href="#">See all Products</a></p>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="preview.html"><img src="images/new-pic1.jpg" alt="" /></a>					
					 <h2>Lorem Ipsum is simply </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$849.99</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="preview.html"><img src="images/new-pic2.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$599.99</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="preview.html"><img src="images/new-pic4.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$799.99</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_4 images_1_of_4">
				 <a href="preview.html"><img src="images/new-pic3.jpg" alt="" /></a>
					 <h2>Lorem Ipsum is simply </h2>					 
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$899.99</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
			</div>
    </div>
 </div>
</div>
   <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="delivery.html">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="contact.html">Sign In</a></li>
							<li><a href="index.html">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="contact.html">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<li><span>+91-123-456789</span></li>
							<li><span>+00-123-000000</span></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>			
        </div>
        <div class="copy_right">
				<p>Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		   </div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</html>

>
