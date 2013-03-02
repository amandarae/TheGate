<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Default.Master" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="TheGateWebSite.Sample" %>
<asp:Content ContentPlaceHolderID="PageTitleText" runat="server">
    Sample Styles/Layouts
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
                            <div class="span12">
                                <h1>This is H1</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href="#">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. </p>
                                <ul>
                                    <li>Etiam adipiscing posuere justo, nec iaculis justo dictum non</li>
                                    <li>Cras tincidunt mi non arcu hendrerit eleifend</li>
                                    <li>Aenean ullamcorper justo tincidunt justo aliquet et lobortis diam faucibus</li>
                                    <li>Maecenas hendrerit neque id ante dictum mattis</li>
                                    <li>Vivamus non neque lacus, et cursus tortor</li>
                                </ul>
                                <hr />
                                <h2>This is H2</h2>
                                <p>Duis a risus sed dolor placerat semper quis in urna. Nam risus magna, fringilla sit amet blandit viverra, dignissim eget est. Ut <strong>commodo ullamcorper risus nec</strong> mattis. Fusce imperdiet ornare dignissim. Donec aliquet convallis tortor, et placerat quam posuere posuere. Morbi tincidunt posuere turpis eu laoreet. Nulla facilisi. Aenean at massa leo. Vestibulum in varius arcu.</p>

                                <div class="bor"></div>
                                <h3>This is H3</h3>
                                <div class="row">
                                    <div class="span4">
                                        <h4>This is H4</h4>
                                        <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Morbi auctor adipiscing tempor. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis. Nulla facilisi.</p>
                                    </div>
                                    <div class="span4">
                                        <h5>This is H5</h5>
                                        <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Morbi auctor adipiscing tempor. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis. Nulla facilisi.</p>
                                    </div>
                                    <div class="span4">
                                        <h6>This is H6</h6>
                                        <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Morbi auctor adipiscing tempor. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis. Nulla facilisi.</p>
                                    </div>
                                </div>
                                <p>Duis sed velit at <a href="#">magna sollicitudin cursus</a> ac ultrices magna. Aliquam consequat, purus vitae auctor ullamcorper, sem velit convallis quam, a pharetra justo nunc et mauris. Vivamus diam diam, fermentum sed dapibus eget, egestas sed eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                        <div class="bor"></div>
    <div class="row">
        <div class="span12">
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td rowspan="2">1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@TwBootstrap</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td colspan="2">Larry the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td colspan="2">Larry the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
            <table class="table table-condensed">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td colspan="2">Larry the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
                        <div class="row">
                            <div class="span6">

                                <!-- Service 1. Class name - "serv-a" -->
                                <div class="serv-a">
                                    <div class="serv">
                                        <div class="simg">
                                            <!-- Font awesome icon. -->
                                            <i class="icon-gift"></i>
                                        </div>
                                        <!-- Service title -->
                                        <h4>Web Designing</h4>
                                        <!-- Service para -->
                                        <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</p>
                                    </div>
                                </div>

                                <!-- Service 2. Class name - "serv-b" -->
                                <div class="serv-b">
                                    <div class="serv">
                                        <div class="simg">
                                            <i class="icon-home"></i>
                                        </div>
                                        <h4>Web Development</h4>
                                        <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</p>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <div class="span6">

                                <!-- Service 3. Class name - "serv-a" -->
                                <div class="serv-a">
                                    <div class="serv">
                                        <div class="simg">
                                            <i class="icon-bullhorn"></i>
                                        </div>
                                        <h4>WordPress Theme</h4>
                                        <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</p>
                                    </div>
                                </div>

                                <!-- Service 4. Class name - "serv-b" -->
                                <div class="serv-b">
                                    <div class="serv">
                                        <div class="simg">
                                            <i class="icon-cloud"></i>
                                        </div>
                                        <h4>Mobile Apps</h4>
                                        <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</p>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <!-- Testimonial -->
                        <hr />

                        <div class="testimonial">
                            <div class="row">
                                <div class="span6">
                                    <!-- Testimonial 1 -->
                                    <div class="testi">
                                        <!-- Comment -->
                                        <div class="tquote">Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</div>
                                        <!-- Author name and designation. Note down the syntax. -->
                                        <div class="tauthor pull-right">-Ashok, <span class="color">Resposnive</span></div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                                <div class="span6">
                                    <!-- Testimonial 2 -->
                                    <div class="testi">
                                        <div class="tquote">Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum.</div>
                                        <div class="tauthor pull-right">-Ravi Kumar, <span class="color">Hoooho</span></div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="span6">

                                <!-- Add the class "phighlight" to highlight specific table -->

                                <!-- Pricing table #1. Class name "price-a" -->
                                <div class="price-a pricel center">
                                    <div class="phead-top">
                                        <!-- Title -->
                                        <h4>Starter</h4>
                                    </div>
                                    <div class="phead-bottom">
                                        <!-- Price. Use the syntax correctly. -->
                                        <p><span class="pst">$</span> 4.99 <span class="psb">/m</span></p>
                                    </div>
                                    <div class="arrow-down"></div>
                                    <div class="plist">
                                        <!-- List -->
                                        <ul>
                                            <li>1 GB Disk Space</li>
                                            <li>10 GB Data Transfer</li>
                                            <li>Single Domain</li>
                                            <li>10 Email Ids</li>
                                            <li>Top Notch Support</li>
                                            <li>Instant Activation</li>
                                        </ul>
                                    </div>
                                    <div class="pbutton">
                                        <!-- button -->
                                        <div class="button"><a href="#"><i class="icon-shopping-cart"></i>Buy Now</a></div>
                                    </div>
                                </div>

                                <!-- Pricing table #2. Class name "price-b" -->
                                <div class="price-b pricel center phighlight">
                                    <div class="phead-top">
                                        <h4>Basic</h4>
                                    </div>
                                    <div class="phead-bottom">
                                        <p><span class="pst">$</span> 8.99 <span class="psb">/m</span></p>
                                    </div>
                                    <div class="arrow-down"></div>
                                    <div class="plist">
                                        <ul>
                                            <li>1 GB Disk Space</li>
                                            <li>10 GB Data Transfer</li>
                                            <li>Single Domain</li>
                                            <li>10 Email Ids</li>
                                            <li>Top Notch Support</li>
                                            <li>Instant Activation</li>
                                        </ul>
                                    </div>
                                    <div class="pbutton">
                                        <div class="button"><a href="#"><i class="icon-shopping-cart"></i>Buy Now</a></div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>

                            <div class="span6">

                                <!-- Pricing table #3. Class name "price-a" -->
                                <div class="price-a pricel center">
                                    <div class="phead-top">
                                        <h4>Business</h4>
                                    </div>
                                    <div class="phead-bottom">
                                        <p><span class="pst">$</span> 12.99 <span class="psb">/m</span></p>
                                    </div>
                                    <div class="arrow-down"></div>
                                    <div class="plist">
                                        <ul>
                                            <li>1 GB Disk Space</li>
                                            <li>10 GB Data Transfer</li>
                                            <li>Single Domain</li>
                                            <li>10 Email Ids</li>
                                            <li>Top Notch Support</li>
                                            <li>Instant Activation</li>
                                        </ul>
                                    </div>
                                    <div class="pbutton">
                                        <div class="button"><a href="#"><i class="icon-shopping-cart"></i>Buy Now</a></div>
                                    </div>
                                </div>

                                <!-- Pricing table #4. Class name "price-b" -->
                                <div class="price-b pricel center">
                                    <div class="phead-top">
                                        <h4>Enterprise</h4>
                                    </div>
                                    <div class="phead-bottom">
                                        <p><span class="pst">$</span> 39.99 <span class="psb">/m</span></p>
                                    </div>
                                    <div class="arrow-down"></div>
                                    <div class="plist">
                                        <ul>
                                            <li>1 GB Disk Space</li>
                                            <li>10 GB Data Transfer</li>
                                            <li>Single Domain</li>
                                            <li>10 Email Ids</li>
                                            <li>Top Notch Support</li>
                                            <li>Instant Activation</li>
                                        </ul>
                                    </div>
                                    <div class="pbutton">
                                        <div class="button"><a href="#"><i class="icon-shopping-cart"></i>Buy Now</a></div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="span6">
                                <div class="aservy">
                                    <h4>What we offer?</h4>
                                    <p>Aliquam consequat, purus vitae auctor ullamcorper, sem velit convallis quam, a pharetra justo nunc et mauris. Vivamus diam diam, fermentum sed dapibus eget, egestas sed eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                    <div class="aserv-list">
                                        <div class="aserv-l">

                                            <!-- Service #1 -->
                                            <div class="aserv">
                                                <!-- Font awesome icon -->
                                                <div class="aserv-img">
                                                    <i class="icon-gift"></i>
                                                </div>
                                                <!-- Detail -->
                                                <div class="aserv-details">
                                                    Fermentum <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-globe"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Egestas <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-truck"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Dapibus <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-filter"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Ut tempus <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                        </div>
                                        <div class="aserv-r">
                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-tag"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Consectetur <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-beaker"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Aliquam <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-fire"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Vivamus <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="aserv">
                                                <div class="aserv-img">
                                                    <i class="icon-pushpin"></i>
                                                </div>
                                                <div class="aserv-details">
                                                    Fermentum <span class="color">sed dapibus</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="span6">
                                <div class="well">
                                    <h5>Vivamus vel</h5>
                                    <p>Suspendisse potenti. Morbi ac felis nec mauris imperdiet fermentum. Aenean sodales augue ac lacus hendrerit sed rhoncus erat hendrerit. Vivamus vel ultricies elit. Aliquam ut feugiat ante. Curabitur lacinia nulla vel tellus elementum non mollis justo aliquam.</p>
                                </div>

                                <div class="row">
                                    <div class="span3">
                                        <div class="service">
                                            <!-- Icon & title. Font Awesome icon used. -->
                                            <h5><span><i class="icon-gift"></i>Web Designing</span></h5>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant fames ac turpis. </p>
                                        </div>
                                    </div>

                                    <div class="span3">
                                        <div class="service">
                                            <!-- Icon & title. Font Awesome icon used. -->
                                            <h5><span><i class="icon-cloud"></i>Web Development</span></h5>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant fames ac turpis. </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="span12">
                                <div class="career tabbable tabs-left">
                                    <!-- Tabs -->
                                    <ul class="nav nav-tabs">
                                        <!-- Navigation tabs (Job titles ). Use unique value in anchor tags. -->
                                        <li class="active"><a href="#tab1" data-toggle="tab">Web Designer (2)</a></li>
                                        <li><a href="#tab2" data-toggle="tab">Web Developer (3)</a></li>
                                        <li><a href="#tab3" data-toggle="tab">SEO (3)</a></li>
                                    </ul>
                                    <div class="tab-content">

                                        <!-- In "id", use the value which you used in above anchor tags -->
                                        <div class="tab-pane active" id="tab1">
                                            <!-- Content -->
                                            <h5>Web Designer - 2 Nos</h5>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href="#">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. Duis a risus sed dolor placerat semper quis in urna. Nam risus magna, fringilla sit amet blandit viverra, dignissim eget est. Ut <strong>commodo ullamcorper risus nec</strong> mattis. Fusce imperdiet ornare dignissim. Donec aliquet convallis tortor, et placerat quam posuere posuere. Morbi tincidunt posuere turpis eu laoreet. Nulla facilisi. Aenean at massa leo. Vestibulum in varius arcu.</p>
                                            <ul>
                                                <li>Etiam adipiscing posuere justo, nec iaculis justo dictum non</li>
                                                <li>Cras tincidunt mi non arcu hendrerit eleifend</li>
                                                <li>Aenean ullamcorper justo tincidunt justo aliquet et lobortis diam faucibus</li>
                                                <li>Maecenas hendrerit neque id ante dictum mattis</li>
                                                <li>Vivamus non neque lacus, et cursus tortor</li>
                                            </ul>
                                            <div class="button"><a href="#">Apply Online</a></div>
                                        </div>


                                        <div class="tab-pane" id="tab2">
                                            <h5>Web Developer - 3 Nos</h5>
                                            <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Morbi auctor adipiscing tempor. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis. Nulla facilisi. Duis sed velit at <a href="#">magna sollicitudin cursus</a> ac ultrices magna. Aliquam consequat, purus vitae auctor ullamcorper, sem velit convallis quam, a pharetra justo nunc et mauris. Vivamus diam diam, fermentum sed dapibus eget, egestas sed eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                            <div class="button"><a href="#">Apply Online</a></div>
                                        </div>


                                        <div class="tab-pane" id="tab3">
                                            <h5>SEO - 3 Nos</h5>
                                            <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. Duis eget risus ac orci vulputate vestibulum sit amet id orci. Etiam ac ante at lorem ultrices elementum. Vestibulum quis elit odio, id hendrerit ipsum. Fusce consequat leo vitae velit interdum at laoreet justo ullamcorper.</p>
                                            <div class="button"><a href="#">Apply Online</a></div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span12">
                                <div class="accordion" id="accordion2">
                                    <!-- Each item should be enclosed inside the class "accordion-group". Note down the below markup. -->

                                    <!-- First Accordion -->
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                <!-- Title. Don't forget the <i> tag. -->
                                                <h5><i class="icon-plus"></i>Proin porttitor eros a ante molestie gravida ?</h5>
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="accordion-body collapse" style="height: 0px;">
                                            <div class="accordion-inner">
                                                <!-- Para -->
                                                <p>Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Second Accordion -->
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                <h5><i class="icon-plus"></i>Proin porttitor eorbi dictum nibh gravida ?</h5>
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <p>Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Thrid accordion -->
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                <h5><i class="icon-plus"></i>In vitae adipiscing adipiscing enim gravida ?</h5>
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <p>Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Fourth accordion -->
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                <h5><i class="icon-plus"></i>Sed a interdum mauris molestie gravida ?</h5>
                                            </a>
                                        </div>
                                        <div id="collapseFour" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <p>Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. </p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Fifth accordion -->
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                <h5><i class="icon-plus"></i>Nullam in urna est urna molestie gravida ?</h5>
                                            </a>
                                        </div>
                                        <div id="collapseFive" class="accordion-body collapse">
                                            <div class="accordion-inner">
                                                <p>Proin porttitor eros a ante molestie gravida commodo dui adipiscing. <a href="#">Morbi dictum nibh gravida</a> mi pretium dapibus. Nullam in est urna. In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris. </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row teams about">
                            <div class="span3">
                                <!-- Staff #1 -->
                                <div class="staff">
                                    <!-- Picture -->
                                    <div class="pic">
                                        <img src="http://placekitten.com/g/220/220" alt="">
                                    </div>
                                    <!-- Details -->
                                    <div class="details">
                                        <!-- Name and designation -->
                                        <div class="desig pull-left">
                                            <p class="name">John Smith</p>
                                            <em>CEO of The Gate</em>
                                        </div>
                                        <!-- Social media details. Replace # with profile links -->
                                        <div class="asocial pull-right">
                                            <a href="#"><i class="icon-facebook"></i></a>
                                            <a href="#"><i class="icon-twitter"></i></a>
                                            <a href="#"><i class="icon-linkedin"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <!-- Description -->
                                        <p class="adesc">Praesent at tellus in  ligula porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor in massa ligula nulla. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <!-- Staff #2 -->
                                <div class="staff">
                                    <div class="pic">
                                        <img src="http://placekitten.com/g/220/220" alt="">
                                    </div>
                                    <div class="details">
                                        <div class="desig pull-left">
                                            <p class="name">John Smith</p>
                                            <em>CTO of The Gate</em>
                                        </div>
                                        <div class="asocial pull-right">
                                            <a href="#"><i class="icon-facebook"></i></a>
                                            <a href="#"><i class="icon-twitter"></i></a>
                                            <a href="#"><i class="icon-linkedin"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p class="adesc">Praesent at tellus in  ligula porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor in massa ligula nulla. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <!-- Staff #3 -->
                                <div class="staff">
                                    <div class="pic">
                                        <img src="http://placekitten.com/g/220/220" alt="">
                                    </div>
                                    <div class="details">
                                        <div class="desig pull-left">
                                            <p class="name">John Smith</p>
                                            <em>CFO of The Gate</em>
                                        </div>
                                        <div class="asocial pull-right">
                                            <a href="#"><i class="icon-facebook"></i></a>
                                            <a href="#"><i class="icon-twitter"></i></a>
                                            <a href="#"><i class="icon-linkedin"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p class="adesc">Praesent at tellus in  ligula porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor in massa ligula nulla. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <!-- Staff #4 -->
                                <div class="staff">
                                    <div class="pic">
                                        <img src="http://placekitten.com/g/220/220" alt="">
                                    </div>
                                    <div class="details">
                                        <div class="desig pull-left">
                                            <p class="name">John Smith</p>
                                            <em>CMO of The Gate</em>
                                        </div>
                                        <div class="asocial pull-right">
                                            <a href="#"><i class="icon-facebook"></i></a>
                                            <a href="#"><i class="icon-twitter"></i></a>
                                            <a href="#"><i class="icon-linkedin"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p class="adesc">Praesent at tellus in  ligula porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor in massa ligula nulla. </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span12">
                                <div class="about-hero">
                                    <p><span class="hightlight">We Started The Gate in 1908</span>. Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla <span class="hightlight">ullamcorper tortor</span> non felis commodo in sagittis est accumsan.</p>
                                </div>
                            </div>
                        </div>
                        <div class="row resume">
                            <div class="span3">
                                <h4>About Me</h4>
                            </div>
                            <div class="span9">
                                <div class="rinfo">
                                    <h5>John Smith</h5>
                                    <div class="rmeta">Developer</div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href="#">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. Duis a risus sed dolor placerat semper quis in urna. Nam risus magna, fringilla sit amet blandit viverra, dignissim eget est. Ut <strong>commodo ullamcorper risus nec</strong> mattis. Fusce imperdiet ornare dignissim. Donec aliquet convallis tortor, et placerat quam posuere posuere. Morbi tincidunt posuere turpis eu laoreet. Nulla facilisi. Aenean at massa leo. Vestibulum in varius arcu.</p>
                                    <!-- Social media icons -->
                                    <div class="social">
                                        <a href="#"><i class="icon-facebook"></i></a>
                                        <a href="#"><i class="icon-twitter"></i></a>
                                        <a href="#"><i class="icon-linkedin"></i></a>
                                        <a href="#"><i class="icon-google-plus"></i></a>
                                        <a href="#"><i class="icon-pinterest"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span3">
                                <!-- Step 1 -->
                                <div class="process-meta"><span>Step 1</span></div>
                                <h4>Requirement</h4>
                                <p>In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris.</p>
                            </div>
                            <div class="span3">
                                <!-- Step 2 -->
                                <div class="process-meta"><span>Step 2</span></div>
                                <h4>PSD Design</h4>
                                <p>In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris.</p>
                            </div>
                            <div class="span3">
                                <!-- Step 3 -->
                                <div class="process-meta"><span>Step 3</span></div>
                                <h4>Coding</h4>
                                <p>In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris.</p>
                            </div>
                            <div class="span3">
                                <!-- Step 4 -->
                                <div class="process-meta"><span>Step 4</span></div>
                                <h4>Testing</h4>
                                <p>In vitae adipiscing enim. Curabitur rhoncus condimentum lorem, non convallis dolor faucibus eget. In ut nulla est. Sed a interdum mauris.</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span4">
                                <!-- Testimonial #1 -->
                                <div class="test">
                                    Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.
                                </div>
                                <div class="test-arrow"></div>
                                <div class="tauth"><i class="icon-user"></i>John Smith, <span class="color">Google</span></div>
                            </div>

                            <div class="span4">
                                <!-- Testimonial #2 -->
                                <div class="test">
                                    Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.
                                </div>
                                <div class="test-arrow"></div>
                                <div class="tauth"><i class="icon-user"></i>John Smith, <span class="color">Google</span></div>
                            </div>

                            <div class="span4">
                                <!-- Testimonial #3 -->
                                <div class="test">
                                    Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.
                                </div>
                                <div class="test-arrow"></div>
                                <div class="tauth"><i class="icon-user"></i>John Smith, <span class="color">Google</span></div>
                            </div>
                        </div>
                        <div class="bor"></div>
                        <div class="row">

                            <div class="span6">
                                <!-- Testimonial 1 -->
                                <div class="testi">
                                    <!-- Comment -->
                                    <div class="tquote">"Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum."</div>
                                    <!-- Author name and designation. Note down the syntax. -->
                                    <div class="tauthor pull-right">- <i class="icon-user"></i>Ashok, <span class="color">Resposnive</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="span6">
                                <!-- Testimonial 2 -->
                                <div class="testi">
                                    <div class="tquote">"Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum."</div>
                                    <div class="tauthor pull-right">- <i class="icon-user"></i>Ravi Kumar, <span class="color">Hoooho</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="span4">
                                <!-- Testimonial 1 -->
                                <div class="testi">
                                    <!-- Comment -->
                                    <div class="tquote">"Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum."</div>
                                    <!-- Author name and designation. Note down the syntax. -->
                                    <div class="tauthor">-Ashok, <span class="color">Resposnive</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="span4">
                                <!-- Testimonial 2 -->
                                <div class="testi">
                                    <div class="tquote">"Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum."</div>
                                    <div class="tauthor">-Ravi Kumar, <span class="color">Hoooho</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="span4">
                                <!-- Testimonial 1 -->
                                <div class="testi">
                                    <!-- Comment -->
                                    <div class="tquote">"Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, tellus magna nec enim. Nunc dapibus varius interdum."</div>
                                    <!-- Author name and designation. Note down the syntax. -->
                                    <div class="tauthor">-Ashok, <span class="color">Resposnive</span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="span8">
                                <div class="review">

                                    <div class="reinfo">
                                        <h4>Microsoft Windows</h4>
                                        <p>Donec aliquet convlis tortor, et placerat quam posuere posuere. Aenean at massa leo. Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor.</p>
                                    </div>

                                    <!-- Review details with Twitter default progress bar -->
                                    <div class="redetails">
                                        <h5>Design <span class="pull-right">70%</span></h5>
                                        <div class="progress">
                                            <div class="bar bar-info" style="width: 70%;"></div>
                                        </div>
                                        <h5>Usability <span class="pull-right">60%</span></h5>
                                        <div class="progress">
                                            <div class="bar bar-success" style="width: 60%;"></div>
                                        </div>
                                        <h5>Speed <span class="pull-right">80%</span></h5>
                                        <div class="progress">
                                            <div class="bar bar-warning" style="width: 80%;"></div>
                                        </div>
                                        <h5>Performance <span class="pull-right">50%</span></h5>
                                        <div class="progress">
                                            <div class="bar bar-danger" style="width: 50%;"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <hr>

                                    <!-- Good and Bad -->

                                    <div class="rgood">
                                        <h5><i class="icon-thumbs-up"></i>Good</h5>
                                        <ul>
                                            <li>Etiamadip Crastinci</li>
                                            <li>Crastinci Maecenas</li>
                                            <li>Aeneanull Etiamadip</li>
                                            <li>Maecenas Vivamus</li>
                                            <li>Vivamus Aeneanull</li>
                                        </ul>
                                    </div>

                                    <div class="rbad">
                                        <h5><i class="icon-thumbs-down"></i>Bad</h5>
                                        <ul>
                                            <li>Etiamadip Crastinci</li>
                                            <li>Crastinci Maecenas</li>
                                            <li>Aeneanull Etiamadip</li>
                                            <li>Maecenas Vivamus</li>
                                            <li>Vivamus Aeneanull</li>
                                        </ul>
                                    </div>

                                    <div class="clearfix"></div>

                                    <hr>
                                    <!-- Image -->
                                    <p><a href="#">
                                        <img src="img/photos/1.jpg" alt=""></a></p>
                                    <hr>

                                    <p>Nulla facilisi. Sed justo dui, scelerisque ut consectetur vel, eleifend id erat. Morbi auctor adipiscing tempor. Phasellus condimentum rutrum aliquet. Quisque eu consectetur erat. Proin rutrum, erat eget posuere semper, <em>arcu mauris posuere tortor</em>, in commodo enim magna id massa. Suspendisse potenti. Aliquam erat volutpat. Maecenas quis tristique turpis. Nulla facilisi. Duis sed velit at <a href="#">magna sollicitudin cursus</a> ac ultrices magna. Aliquam consequat, purus vitae auctor ullamcorper, sem velit convallis quam, a pharetra justo nunc et mauris. Vivamus diam diam, fermentum sed dapibus eget, egestas sed eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

                                </div>
                            </div>
                            <div class="span4">
                                <div class="rbox">
                                    <h4>Buy Windows Now</h4>
                                    <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Integer porta erat ac eros porta ultrices. </p>
                                    <div class="button"><a href="#"><i class="icon-shopping-cart"></i>Buy Now</a> <a href="#">Try Now</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="span6">

                                <!-- Timeline #1 -->
                                <div class="time">
                                    <div class="tidate">
                                        1990
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="time">
                                    <div class="tidate">
                                        1994
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="time">
                                    <div class="tidate">
                                        1996
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>


                            </div>
                            <div class="span6">

                                <div class="time">
                                    <div class="tidate">
                                        1992
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="time">
                                    <div class="tidate">
                                        1999
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="time">
                                    <div class="tidate">
                                        2000
                                    </div>
                                    <div class="timatter">
                                        <h5>Nulla ullamcorper</h5>
                                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla. Ut tempus interdum mauris vel vehicula. Nulla ullamcorper tortor commodo in sagittis est accumsan.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                        </div>
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
                        <div class="row">
                            <div class="span12">
                                <div id="portfolio" style="position: relative; overflow: hidden; height: 532px;" class="isotope">
                                    <!-- Add the above used filter names inside div tag. You can add more than one filter names. For image lightbox you need to include "a" tag pointing to image link, along with the class "prettyPhoto[pp_gal]".-->
                                    <div class="element one three isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(0px, 0px, 0px);">
                                        <a href="img/photos/s1.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s1.jpg" alt="">
                                            <!-- Portfolio caption -->
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element two one isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(230px, 0px, 0px);">
                                        <a href="img/photos/s2.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s2.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element three five isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(460px, 0px, 0px);">
                                        <a href="img/photos/s3.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s3.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element four two isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(690px, 0px, 0px);">
                                        <a href="img/photos/s4.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s4.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element five one isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(0px, 266px, 0px);">
                                        <a href="img/photos/s5.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s5.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element four five isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(230px, 266px, 0px);">
                                        <a href="img/photos/s6.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s6.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element three one isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(460px, 266px, 0px);">
                                        <a href="img/photos/s7.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s7.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="element three one isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(690px, 266px, 0px);">
                                        <a href="img/photos/s8.jpg" class="prettyPhoto[pp_gal]">
                                            <img src="img/photos/s8.jpg" alt="">
                                            <div class="pcap">
                                                <h5>Lorem ipsum dolor</h5>
                                                <p>Sed justo dui, scelerisque ut consectetur vel, eleifend id erat.</p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
</asp:Content>