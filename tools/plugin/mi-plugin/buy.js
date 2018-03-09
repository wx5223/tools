console.log("do it");
var script = document.createElement('script');
script.type = 'text/javascript';
script.innerHTML = 'function check(){console.log("checking");if($("a:contains(\'去购物车\')").length==0){window.setTimeout(check,100);return;}$("a:contains(\'去购物车\')")[0].click();}check();'
document.body.appendChild(script);
console.log("end");
