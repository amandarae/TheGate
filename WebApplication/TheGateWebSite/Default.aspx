<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheGateWebSite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFull" runat="server">
    <div class="row">
                <div class="span9">
					<div id="slides">						
						<div class="slides_container">
							<a href="#" title="New Ipad"><img src="img/2.jpg" alt="Slide 2"></a>
							<a href="#" title="Crazy day"><img src="img/1.jpg" alt="Slide 1"></a>							
						</div>		
						<a href="#" class="next"><img src="img/arrow-next.png" alt="Next"></a>
						<a href="#" class="prev"><img src="img/arrow-prev.png" alt="Prev"></a>						
					</div>
                </div>
				 <div class="span3">
					<a href="#"><img src="img/ad.png" alt="" /></a>
                </div>
            </div>
			<div class="row services">						
				<div class="span4">
					<div class="service">
						<div>									
							<h4><img src="img/feature_img_1.png" alt="" />SOMETHING <strong>ABOUT US</strong></h4>
							<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
							<p class="center"><button class="btn btn-inverse btn-small">read more</button></p>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="service">
						<div>									
							<h4><img src="img/feature_img_2.png" alt="" />FREE <strong>SHIPPING</strong></h4>
							<p>Free shipping on orders over <strong>$1000</strong>. Printing industry unknown printer.</p>
							<p class="center"><button class="btn btn-inverse btn-small">read more</button></p>
						</div>
					</div>
				</div>
				<div class="span4">
					<div class="service">
						<div>									
							<h4><img src="img/feature_img_3.png" alt="" />24/7 LIVE <strong>SUPPORT</strong></h4>
							<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
							<p class="center"><button class="btn btn-inverse btn-small">read more</button></p>
						</div>
					</div>
				</div>
			</div>		
			<div class="block_content container">
				<section class="products">
					<div class="row">
						<div class="span12">
							<h4 class="title feature">
								<span class="pull-left"><strong>Feature</strong> Products</span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel-1" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">										
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>
													<a href="product_detail.html"><img alt="" src="img/products/m1.png"></a>
													<a href="product_detail.html"><h4>Product 1</h4></a>
													<p>Phasellus consequat sem congue diam congue</p>
													<p class="price">Price: <span>$124</span></p>
												</div>
											</li>       
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>
													<a href="product_detail.html"><img alt="" src="img/products/m2.png"></a>
													<a href="product_detail.html"><h4>Product 2</h4></a>
													<p>Integer in ligula et erat gravida placerat</p>
													<p class="price">Price: <span>$256</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m4.png"></a>
													<a href="product_detail.html"><h4>Product 3</h4></a>
													<p>Suspendisse aliquet orci et nisl iaculis</p>
													<p class="price">Price: <span>$316</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m3.png"></a>
													<a href="product_detail.html"><h4>Product 4</h4></a>
													<p>Nam imperdiet urna nec lectus mollis</p>
													<p class="price">Price: <span>$79</span></p>
												</div>
											</li>						
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">                                        									
													<a href="product_detail.html"><img alt="" src="img/products/m2.png"></a>
													<a href="product_detail.html"><h4>Product 1</h4></a>
													<p>Phasellus consequat sem congue diam congue</p>
													<p class="price">Price: <span>$543</span></p>												
												</div>
											</li>       
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m3.png"></a>
													<a href="product_detail.html"><h4>Product 2</h4></a>
													<p>Integer in ligula et erat gravida placerat</p>
													<p class="price">Price: <span>$41</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m4.png"></a>
													<a href="product_detail.html"><h4>Product 3</h4></a>
													<p>Suspendisse aliquet orci et nisl iaculis</p>
													<p class="price">Price: <span>$28</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m3.png"></a>
													<a href="product_detail.html"><h4>Product 4</h4></a>
													<p>Nam imperdiet urna nec lectus mollis</p>
													<p class="price">Price: <span>$341</span></p>
												</div>
											</li>						
										</ul>
									</div>
								</div>                		
							</div>                		
						</div>                		
					</div>
				</section>
			</div>
			<div class="block_content container last">
				<section class="products">
					<div class="row">
						<div class="span12">
							<h4 class="title latest">
								<span class="pull-left"><strong>Latest</strong> Products</span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel-2" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">										
											<li class="span3">
												<div class="product-box">                                        									
													<a href="product_detail.html"><img alt="" src="img/products/m4.png"></a>
													<a href="product_detail.html"><h4>Product 1</h4></a>
													<p>Phasellus consequat sem congue diam congue</p>
													<p class="price">Price: <span>$49</span></p>
												</div>
											</li>       
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m3.png"></a>
													<a href="product_detail.html"><h4>Product 2</h4></a>
													<p>Integer in ligula et erat gravida placerat</p>
													<p class="price">Price: <span>$35</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m2.png"></a>
													<a href="product_detail.html"><h4>Product 3</h4></a>
													<p>Suspendisse aliquet orci et nisl iaculis</p>
													<p class="price">Price: <span>$61</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m1.png"></a>
													<a href="product_detail.html"><h4>Product 4</h4></a>
													<p>Nam imperdiet urna nec lectus mollis</p>
													<p class="price">Price: <span>$233</span></p>
												</div>
											</li>						
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">                                        									
													<a href="product_detail.html"><img alt="" src="img/products/m2.png"></a>
													<a href="product_detail.html"><h4>Product 1</h4></a>
													<p>Phasellus consequat sem congue diam congue</p>
													<p class="price">Price: <span>$134</span></p>
												</div>
											</li>       
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m3.png"></a>
													<a href="product_detail.html"><h4>Product 2</h4></a>
													<p>Integer in ligula et erat gravida placerat</p>
													<p class="price">Price: <span>$261</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m4.png"></a>
													<a href="product_detail.html"><h4>Product 3</h4></a>
													<p>Suspendisse aliquet orci et nisl iaculis</p>
													<p class="price">Price: <span>$212</span></p>
												</div>
											</li>
											<li class="span3">
												<div class="product-box">									
													<a href="product_detail.html"><img alt="" src="img/products/m2.png"></a>
													<a href="product_detail.html"><h4>Product 4</h4></a>
													<p>Nam imperdiet urna nec lectus mollis</p>
													<p class="price">Price: <span>$52</span></p>
												</div>
											</li>						
										</ul>
									</div>
								</div>                		
							</div>                		
						</div>                		
					</div>
				</section>            
			</div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        $(function () {
            $('#myCarousel-1,#myCarousel-2').carousel({
                interval: false
            });

            $('#slides').slides({
                preload: true,
                preloadImage: 'img/loading.gif',
                play: 5000,
                pause: 2500,
                hoverPause: true,
                generatePagination: false
            });
        });
		</script>
</asp:Content>