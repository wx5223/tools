console.log("do it");
var script = document.createElement('script');
script.type = 'text/javascript';
script.innerHTML = 'function check(){console.log("checking");if($("a:contains(\'加入购物车\')").length==0){if($("a:contains(\'点开售\')").length>0){location.reload();return;}window.setTimeout(check,100);return;}$("a:contains(\'加入购物车\')")[0].click();}function buy(){if($("a:contains(\'加入购物车\')").length==0){$("#J_buyBtnBox").before(\'<li class="countdown" data-name="加入购物车"><a href="javascript:void(0);" class="btn btn-primary  btn-biglarge J_proBuyBtn" data-type="common" data-isbigtap="false" data-name="加入购物车">加入购物车</a></li>\');}$("#J_bigtapSoldout span.close").click();$("a:contains(\'加入购物车\')")[0].click();$("#J_bigtapSoldout span.close").click();}function startBuy(){setInterval("buy()", 200);}'
+'autoGetTime = 0;function autoCheckLocalTime() {var localTime = new Date().getTime();if(autoGetTime-localTime <=3000) {startBuy();return;}console.log("auto get after:", (autoGetTime-localTime-3000)/1000);window.setTimeout(autoCheckLocalTime,200);}function autoGet(){autoGetTimeStr=prompt("请输入抢购时间","2018-03-08 10:00:00");autoGetTime=new Date(autoGetTimeStr).getTime();autoCheckLocalTime();}'
+'$("body").append(\'<div style="top: 0;left: 0;float: left;position: absolute;z-index: 9999999;"><button onclick="buy()">BUY</button><button onclick="startBuy()">START</button><button onclick="autoGet()">AUTO</button></div>\');//check();'
document.body.appendChild(script);
console.log("end");


