<%@page import ="javax.servlet.ServletContext"%>
<%@page import ="java.io.*"%>


<% 

	ServletContext context = config.getServletContext();
String[] nameString= (String[])	context.getAttribute("nameString"); 
String[] dscString= (String[])	context.getAttribute("dscString"); 
String[] imgString= (String[])	context.getAttribute("imgString"); 
String[] pdfString= (String[])	context.getAttribute("pdfString"); 


			
if(nameString!=null)
{
System.out.println("value id"+nameString[0]);
}
else
{
System.out.println("value id null");

}

%>
<html>

    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>Fullscreen Slit Slider with CSS3 and jQuery</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Fullscreen Slit Slider with CSS3 and jQuery" />
        <meta name="keywords" content="slit slider, plugin, css3, transitions, jquery, fullscreen, autoplay" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
		<noscript>
			<link rel="stylesheet" type="text/css" href="css/styleNoJS.css" />
		</noscript>
    </head>
    <body>
        
        <div class="container demo-1">
		
			<!-- Codrops top bar -->
            <div class="codrops-top clearfix">
              
                <span class="right">
                   
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->

            <nav class="codrops-demos">
				<!-- <a class="current-demo" href="index.html">Demo 1</a>
				<a href="index2.html">Demo 2</a> -->
			</nav>

            <div id="slider" class="sl-slider-wrapper">
			 

				<div class="sl-slider">

			
					<div class="sl-slide bg-1" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
							<nav class="codrops-demos">
							<h1><%=nameString[0]%></h1>
								</nav>
						<div class="sl-slide-inner">

							<div class="deco"><img src="<%=imgString[0]%>"   style="margin-top:100px;margin-left:20px"  width="100px" height="100px"></div>
							
							<blockquote><p><%=dscString[0]%></p></blockquote>
						</div>`
					</div>
					
					<div class="sl-slide bg-2" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
					<nav class="codrops-demos">
							<h1><%=nameString[1]%></h1>
								</nav>
						<div class="sl-slide-inner">
							<div class="deco"><img src="images\Icon 60.png"  style="margin-top:100px;margin-left:20px"  width="100px" height="100px"></div>
							
							<blockquote><p><%=dscString[1]%></p></blockquote>
						</div>
					</div>
					
					<div class="sl-slide bg-3" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
								<nav class="codrops-demos">
								<h1><%=nameString[2]%></h1>
								</nav>
						<div class="sl-slide-inner">
							<div class="deco"><img src="images\Icon 60.png"   style="margin-top:100px;margin-left:20px"  width="100px" height="100px"></div>
							
							<blockquote><p><%=dscString[2]%></p></blockquote>
						</div>
					</div>
					
					<div class="sl-slide bg-4" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
							<nav class="codrops-demos">
								<h1><%=nameString[3]%></h1>
								</nav>
						<div class="sl-slide-inner">
							<div class="deco" ><img src="images\Icon 60.png"   style="margin-top:100px;margin-left:20px"  width="100px" height="100px" ></div>
							
						<blockquote><p><%=dscString[3]%></p></blockquote>
						</div>
					</div>
					
					<div class="sl-slide bg-5" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1">
					<nav class="codrops-demos">
								<h1><%=nameString[4]%></h1>
								</nav>
						<div class="sl-slide-inner">
							<div class="deco" ><img src="images\Icon 60.png"   style="margin-top:100px;margin-left:20px"  width="100px" height="100px" ></div>
						
							<blockquote><p><%=dscString[4]%></p></blockquote>
						</div>
					</div>
				</div><!-- /sl-slider -->
				
				<nav id="nav-arrows" class="nav-arrows">
					<span class="nav-arrow-prev">Previous</span>
					<span class="nav-arrow-next">Next</span>
				</nav>

				<nav id="nav-dots" class="nav-dots">
					<span class="nav-dot-current"></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</nav>

			</div><!-- /slider-wrapper -->

        </div>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.ba-cond.min.js"></script>
		<script type="text/javascript" src="js/jquery.slitslider.js"></script>
		<script type="text/javascript">	
			$(function() {
			
				var Page = (function() {

					var $navArrows = $( '#nav-arrows' ),
						$nav = $( '#nav-dots > span' ),
						slitslider = $( '#slider' ).slitslider( {
							onBeforeChange : function( slide, pos ) {

								$nav.removeClass( 'nav-dot-current' );
								$nav.eq( pos ).addClass( 'nav-dot-current' );

							}
						} ),

						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							// add navigation events
							$navArrows.children( ':last' ).on( 'click', function() {

								slitslider.next();
								return false;

							} );

							$navArrows.children( ':first' ).on( 'click', function() {
								
								slitslider.previous();
								return false;

							} );

							$nav.each( function( i ) {
							
								$( this ).on( 'click', function( event ) {
									
									var $dot = $( this );
									
									if( !slitslider.isActive() ) {

										$nav.removeClass( 'nav-dot-current' );
										$dot.addClass( 'nav-dot-current' );
									
									}
									
									slitslider.jump( i + 1 );
									return false;
								
								} );
								
							} );

						};

						return { init : init };

				})();

				Page.init();

				/**
				 * Notes: 
				 * 
				 * example how to add items:
				 */

				/*
				
				var $items  = $('<div class="sl-slide sl-slide-color-2" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1"><div class="sl-slide-inner bg-1"><div class="sl-deco" data-icon="t"></div><h2>some text</h2><blockquote><p>bla bla</p><cite>Margi Clarke</cite></blockquote></div></div>');
				
				// call the plugin's add method
				ss.add($items);

				*/
			
			});
		</script>
	</body>
</html>