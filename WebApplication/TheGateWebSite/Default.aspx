<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheGateWebSite.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFull" runat="server">
    <div class="row">
        <div class="span12">

            <!-- Slider (Parallax Slider) -->

            <div id="da-slider" class="da-slider">
                <div class="da-slide">
                    <h2 style="margin-right:250px;font-size: 24px; text-wrap:normal;">20" Deluxe Wooden Chess/Checkers Set with Drawers</h2>
                    <p>20" deluxe wooden chess set with inlaid wood squares, wooden chess and checker pieces</p>
                    <a href="/ItemDetail.aspx?productID=5" class="da-link">View</a>
                    <div class="da-img">
                        <img src="/Handlers/Image.ashx?ID=8" alt="image01" style="max-height:200px; max-width: 200px;" /></div>
                </div>
                <div class="da-slide">
                    <h2 style="margin-right:250px;font-size: 24px; text-wrap:normal;">MONOPOLY: Star Trek Klingon Limited Edition</h2>
                    <p>You have been chosen to preserve the glory of the Empire! Control the galaxy with the might of Kahless and be immortalized in the Hall of Warriors. Victory shall be yours if you conquer all the systems within the galaxy. </p>
                    <a href="/ItemDetail.aspx?productID=19" class="da-link">View</a>
                    <div class="da-img">
                        <img src="/Handlers/Image.ashx?ID=21" alt="image01" style="max-height:200px; max-width: 200px;" /></div>
                </div>
                <div class="da-slide">
                    <h2 style="margin-right:250px;font-size: 24px; text-wrap:normal;">Zombicide Board Game</h2>
                    <p>In the pursuit of ever greater levels of productivity, man has TWISTED both plants and animals to his own ENDS. In so doing, we have inadvertently changed ourselves... </p>
                    <a href="/ItemDetail.aspx?productID=18" class="da-link">View</a>
                    <div class="da-img">
                        <img src="/Handlers/Image.ashx?ID=20" alt="image01" style="max-height:200px; max-width: 200px;" /></div>
                </div>
                <nav class="da-arrows">
                    <span class="da-arrows-prev"></span>
                    <span class="da-arrows-next"></span>
                </nav>
            </div>

            <!-- Slider ends -->

<%--            <div class="main-content">
                <div class="row">
                    <div class="span7">
                        <h2>Lorem ipsum dolor sit amet</h2>
                        <p class="main-meta">Leave for the far of grammar</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href="#">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. Duis a risus sed dolor placerat semper quis in urna. Nam risus magna, fringilla sit amet blandit viverra, dignissim eget est. Ut <strong>commodo ullamcorper risus nec</strong> mattis. Aenean at massa leo. Vestibulum in varius arcu.</p>
                    </div>
                    <div class="span5">
                        <div class="main-box">
                            <h4>Features</h4>
                            <p>Nam risus magna, fringilla sit amet blandit viverra, dignissim eget est. Etiam adipiscing posuere justo, nec iaculis justo dictum non.</p>
                            <ul>
                                <li>Cras tincidunt mi non arcu  eleifend</li>
                                <li>Aenean ullamcorper justo  diam faucibus</li>
                                <li>Maecenas hendrerit neque id ante  mattis</li>
                            </ul>
                            <div class="button">
                                <a href="#"><i class="icon-shopping-cart"></i>Buy Now</a> <a href="#"><i class="icon-magic"></i>Try Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>

            <!-- CTA starts -->

            <div class="cta">
                <div class="row" style="margin-bottom: 0;">
                    <div class="span9" style="margin-top: 10px;">
                        <!-- First line -->
                        <p class="cbig">Get an account now and order your favourite games online!</p>
                        <!-- Second line -->
                        <%--<p class="csmall">Duis vulputate consectetur malesuada eros nec odio consect eturegestas et netus et in dictum nisi vehicula.</p>--%>
                    </div>
                    <div class="span2">
                        <!-- Button -->
                        <div class="button"><a href="Register.aspx">Sign Up</a></div>
                    </div>
                </div>
            </div>

            <!-- CTA Ends -->

            <%--<!-- Features list. Note down the class name before editing. -->
            <div class="row">
                <div class="span3">
                    <div class="afeature">
                        <div class="afmatter">
                            <i class="icon-cloud"></i>
                            <h4>Nulla ullamcorper</h4>
                            <p>Praesent at tellus porttitor  sagittis. Mauris tempor nulla. Ut tempus interdum mauris vel vehicula. </p>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="afeature">
                        <div class="afmatter">
                            <i class="icon-home"></i>
                            <h4>Praesent at tellus</h4>
                            <p>Praesent at tellus porttitor  sagittis. Mauris tempor nulla. Ut tempus interdum mauris vel vehicula. </p>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="afeature">
                        <div class="afmatter">
                            <i class="icon-gift"></i>
                            <h4>Nulla ullamcorper</h4>
                            <p>Praesent at tellus porttitor sagittis. Mauris tempor nulla. Ut tempus interdum mauris vel vehicula. </p>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="afeature">
                        <div class="afmatter">
                            <i class="icon-user"></i>
                            <h4>Mauris tempor</h4>
                            <p>Praesent at tellus porttitor  sagittis. Mauris tempor nulla. Ut tempus interdum mauris vel vehicula. </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Features ends -->--%>

            <!-- Testimonials -->

            <div class="testimonial">
                <div class="container">
                    <h4>Customer Testimonials</h4>
                    <div class="row">
                        <div class="span4">
                            <!-- Testimonial #1 -->
                            <div class="test">
                                The Gate has always been my home for board games.  Their great selection keeps me coming back!
                            </div>
                            <div class="test-arrow"></div>
                            <div class="tauth"><i class="icon-user"></i> Ravi, <span class="color">Customer</span></div>
                        </div>

                        <div class="span4">
                            <!-- Testimonial #2 -->
                            <div class="test">
                                The staff at the Gate are so helpful and always provide the right games to get the family.
                            </div>
                            <div class="test-arrow"></div>
                            <div class="tauth"><i class="icon-user"></i> Ashok, <span class="color">Customer</span></div>
                        </div>

                        <div class="span4">
                            <!-- Testimonial #3 -->
                            <div class="test">
                                If you want custom games this is the place.  The owner hand carves chess sets!
                            </div>
                            <div class="test-arrow"></div>
                            <div class="tauth"><i class="icon-user"></i> Santy, <span class="color">Customer</span></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent post starts. Note down the class name before editing. -->

            <div class="rposts">
                <div class="row">
                    <div class="span6">

                        <!-- Recent post 1. Class name should be "rpost1" -->
                        <div class="rpost1">
                            <!-- Image -->
                            <div class="rimg">
                                <img src="/Handlers/Image.ashx?ID=14" alt="" />
                            </div>
                            <!-- Title & Para -->
                            <div class="rdetails">
                                <h5>Quip It! DVD Board Game</h5>
                                <p>The uncommonly funny dvd game. Out of print, new in the shrink wrap.</p>
                            </div>
                        </div>


                        <!-- Recent post 2. Class name should be "rpost2" -->
                        <div class="rpost2">
                            <!-- Image -->
                            <div class="rimg">
                                <img src="/Handlers/Image.ashx?ID=22" alt="" />
                            </div>
                            <!-- Title & Para -->
                            <div class="rdetails">
                                <h5>Risk Board Game Starcraft Collector's Edition</h5>
                                <p>The Koprulu Sector is being ravaged by war. You must stand against your enemies as one of the three powerful races.</p>
                            </div>
                        </div>


                    </div>
                    <div class="span6">


                        <!-- Recent post 1. Class name should be "rpost1" -->
                        <div class="rpost1">
                            <!-- Image -->
                            <div class="rimg">
                                <img src="/Handlers/Image.ashx?ID=24" alt="" />
                            </div>
                            <!-- Title & Para -->
                            <div class="rdetails">
                                <h5>A Game of Thrones the Board Game: 2nd Edition</h5>
                                <p>King Robert Baratheon is dead, and the lands of Westeros brace for battle. Can you claim the Iron Throne?</p>
                            </div>
                        </div>


                        <!-- Recent post 2. Class name should be "rpost2" -->
                        <div class="rpost2">
                            <!-- Image -->
                            <div class="rimg">
                                <img src="/Handlers/Image.ashx?ID=7" alt="" />
                            </div>
                            <!-- Title & Para -->
                            <div class="rdetails">
                                <h5>Wooden Black Bird Chinese Checkers Board</h5>
                                <p>Wooden Chinese checkers game board, 45 by 45 cm, playing surface is 40 x 40 cm. </p>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <!-- Recent post ends -->


            <!-- Clients starts -->

            <!-- Clients ends -->

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        $(function () {

            $('#da-slider').cslider({
                autoplay: true,
                interval: 6000
            });

        });
    </script>
</asp:Content>
