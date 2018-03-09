console.log("do it");
var script = document.createElement('script');
script.type = 'text/javascript';
script.innerHTML = 'function check(){console.log("checking");if($("a:contains(\'去结算\')").length==0){window.setTimeout(check,100);return;}if($("div.address-item").length>0){$("div.address-item")[0].click();}$("a:contains(\'去结算\')")[0].click();}check();'
document.body.appendChild(script);
console.log("end");


