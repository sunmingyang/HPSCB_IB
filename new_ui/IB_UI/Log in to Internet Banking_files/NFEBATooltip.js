!function(t){var e=0,o=function(o,n){function a(n){s(n);var a,l,r,m,T=!1;o.bind("mouseenter.febaTooltip",function(n){l=o.attr(p.tooltipAttr),o.attr(p.tooltipAttr,""),l&&!p.disableToolTip.call(o)&&(a="#febacal-EventToolTip"+e++,r=p.formatTooltipContent.call(o,p.expressHTML?l:c(l)),m=t("<div class='"+p.wrapperClass+"' ><div id='"+a+"' class='"+p.tooltipClass+"' >"+r+"</div></div>").appendTo(document.body),f.call(m,n),u(function(){m&&(m.show(n),T=!0)},i.inDecayDelay?0:p.delay))}).bind("mouseleave.febaTooltip",function(){o.attr(p.tooltipAttr,l),m&&(m.hideNRemove(),p.decayDelay?d(p.decayDelay):void 0),T=!1,m=void 0}).bind("mousedown.febaTooltip",function(){p.removeOnClick&&(o.attr(p.tooltipAttr,l),T&&m.hideNRemove())}).bind("mouseup.febaTooltip",function(){p.removeOnClick&&(o.attr(p.tooltipAttr,l),T&&m.hideNRemove())}),"dynamic"===p.style&&o.bind("mousemove.febaTooltip",function(t){T?m.css(m.getPosition(t)):m&&m.getPosition(t)})}function l(t){o.unbind(".febaTooltip"),o.removeData("febaTooltipInstance")}function r(t){s(t)}function f(e){function i(e){f.css(t(f).data("position")||f.getPosition(e)).fadeTo(p.animate.fade,p.fadeTo).fadeIn(p.animate.show)}function n(){0==p.animate.hide?t(f).remove():t(f).fadeOut(p.animate.hide,function(){t(f).remove()})}function a(e){var o={};return o.top=e.pageY+p.offset.top,o.left=e.pageX+p.offset.left,t(f).data("position",o),o}function l(){var e={},i=o.offset();return e.top=i.top+o.outerHeight(!0)*p.elementRelation.top/100+p.offset.top,e.left=i.left+o.outerWidth(!0)*p.elementRelation.left/100+p.offset.left,t(f).data("position",e),e}function r(){return"dynamic"===p.style?a:"static"===p.style?l:p.aTooltipLocation}var f=this;f.show=i,f.hideNRemove=n,f.getPosition=r()}function s(e){e&&t.extend(!0,p,e)}function c(t){return t.replace(/&/g,"&").replace(/>/g,"&gt;").replace(/</g,"&lt;").replace(/"/g,"&quot;").replace(/'/g,"&#x27;").replace(/\//g,"&#x2F;")}var p={style:"dynamic",tooltipAttr:"title",tooltipClass:"febatooltip-content",wrapperClass:"febatooltip-wrapper",offset:{top:10,left:15},elementRelation:{top:"100",left:"100"},animate:{show:"slow",hide:"0",fade:"50"},delay:1500,decayDelay:500,fadeTo:.85,removeOnClick:!0,expressHTML:!1,disableToolTip:function(){return t(this).data().disableFEBAToolTip},formatTooltipContent:function(t){return t.replace(/\\n/g,"<br />")},aTooltipLocation:function(){return{top:0,left:0}}};this.initialize=a,this.destroy=l,this.setOptions=r;var u=function(){var t=0;return function(e,o){clearTimeout(t),t=setTimeout(e,o)}}(),d=function(){var t=0;return function(e){clearTimeout(t),i.inDecayDelay=!0,delayTimer=setTimeout(function(){i.inDecayDelay=!1},e)}}()},i=t.febaTooltip={version:"0.16"};t.fn.febaTooltip=function(e){var i=arguments,n={init:function(t){if(!this.data("febaTooltipInstance")){var e=new o(this,t);this.data("febaTooltipInstance",e),e.initialize(t)}},destroy:function(t){var e=this.data("febaTooltipInstance");e&&e.destroy(t)},setOptions:function(t){var e=this.data("febaTooltipInstance");e&&e.setOptions(t)}};return this.each(function(o,a){var l=t(a);n[e]?n[e].call(l,i[1]):"object"!=typeof e&&e?t.error("Method "+e+" does not exist in jQuery.tooltip"):n.init.call(l,i[0])})},i.inDecayDelay=!1}(jQuery);