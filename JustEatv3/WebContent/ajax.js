 
var TEKBrowserDetect = {
init: function () {
this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
this.version = this.searchVersion(navigator.userAgent)
|| this.searchVersion(navigator.appVersion)
|| "an unknown version";
this.OS = this.searchString(this.dataOS) || "an unknown OS";
},  
searchString: function (data) {
var dLen=data.length; 
for (var i=0;i<dLen;i++)	{
var dataString = data[i].string;
var dataProp = data[i].prop;
this.versionSearchString = data[i].versionSearch || data[i].identity;
if (dataString) {
if (dataString.indexOf(data[i].subString) != -1)
return data[i].identity;
}
else if (dataProp)
return data[i].identity;
}
},
searchVersion: function (dataString) {
var index = dataString.indexOf(this.versionSearchString);
if (index == -1) return;
return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
},
dataBrowser: [
{
string: navigator.userAgent,
subString: "Chrome",
identity: "Chrome"
},
{ 	string: navigator.userAgent,
subString: "OmniWeb",
versionSearch: "OmniWeb/",
identity: "OmniWeb"
},
{
string: navigator.vendor,
subString: "Apple",
identity: "Safari",
versionSearch: "Version"
},
{
prop: window.opera,
identity: "Opera"
},
{
string: navigator.vendor,
subString: "iCab",
identity: "iCab"
},
{
string: navigator.vendor,
subString: "KDE",
identity: "Konqueror"
},
{
string: navigator.userAgent,
subString: "Firefox",
identity: "Firefox"
},
{
string: navigator.vendor,
subString: "Camino",
identity: "Camino"
},
{
string: navigator.userAgent,
subString: "Netscape",
identity: "Netscape"
},
{
string: navigator.userAgent,
subString: "MSIE",
identity: "Explorer",
versionSearch: "MSIE"
},
{
string: navigator.userAgent,
subString: "Gecko",
identity: "Mozilla",
versionSearch: "rv"
},
{
string: navigator.userAgent,
subString: "Mozilla",
identity: "Netscape",
versionSearch: "Mozilla"
}
],
dataOS : [
{
string: navigator.platform,
subString: "Win",
identity: "Windows"
},
{
string: navigator.platform,
subString: "Mac",
identity: "Mac"
},
{
string: navigator.userAgent,
subString: "iPhone",
identity: "iPhone/iPod"
},
{
string: navigator.platform,
subString: "Linux",
identity: "Linux"
}
],
windowWidth : function() {
var myWidth = 0;
if( typeof( window.innerWidth ) == 'number' ) {
myWidth = window.innerWidth;
} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
myWidth = document.documentElement.clientWidth;
} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
myWidth = document.body.clientWidth;
}
return myWidth;
},
windowHeight : function() {
var myHeight = 0;
if( typeof( window.innerHeight ) == 'number' ) {
myHeight = window.innerHeight;
} else if( document.documentElement && document.documentElement.clientHeight) {
myHeight = document.documentElement.clientHeight;
} else if( document.body && document.body.clientHeight) {
myHeight = document.body.clientHeight;
}
return myHeight;
},
getScrollX : function() {
var scrOfX = 0;
if( typeof( window.pageXOffset ) == 'number' ) {
scrOfX = window.pageXOffset;
} else if( document.body && document.body.scrollLeft ) {
scrOfX = document.body.scrollLeft;
} else if( document.documentElement && document.documentElement.scrollLeft ) {
scrOfX = document.documentElement.scrollLeft;
}
return scrOfX;
},
getScrollY : function() {
var scrOfY = 0;
if( typeof( window.pageYOffset ) == 'number' ) {
scrOfY = window.pageYOffset;
} else if( document.body && document.body.scrollTop) {
scrOfY = document.body.scrollTop;
} else if( document.documentElement && document.documentElement.scrollTop ) {
scrOfY = document.documentElement.scrollTop;
}
return scrOfY;
}
};
TEKBrowserDetect.init();
function showData(html,divId){
var tmp = '#'+divId;
$j(tmp).html(html);
}
function gtCusSizAjxBtn(flag){
if(event.keyCode == 13)
gtCusSizAjx(flag);
}

function ajaxSubmitReqUtil(url, params,callbackFunc,rType,id) {
var httpRequest = false;
if (window.ActiveXObject) { // IE
try {
httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {
try {
httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
} catch (ex) {
}
}
}
else if (window.XMLHttpRequest) { // Mozilla, Safari,...
httpRequest = new XMLHttpRequest();
if (httpRequest.overrideMimeType) {
// set type accordingly to anticipated content type
httpRequest.overrideMimeType('text/xml');
}
}
if (!httpRequest) {
alert('Unable to perform request. Please try again after sometime.');
return null;
}
document.body.style.cursor='wait';
httpRequest.open('POST', url, true);
httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
httpRequest.setRequestHeader("Connection", "close");
httpRequest.setRequestHeader("Content-length", params.length);
httpRequest.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
if(rType !='na'){
httpRequest.onreadystatechange = function() {
if (httpRequest.readyState == 4) {
if (rType =='text'){callbackFunc(httpRequest.responseText,id);}
else if(rType=='xml'){callbackFunc(httpRequest.responseXML,id);}
}
};

}else{
document.body.style.cursor = 'default';
}
httpRequest.send(params);
}
function center(id,width,zindex,adjust) {
divId= '#'+id;
$divObj = $(divId);
var windowW = TEKBrowserDetect.windowWidth();
var windowH = TEKBrowserDetect.windowHeight();

if(windowH>450){windowH+=200}
$divObj.css("position","absolute");
$divObj.css("width",width);
//$divObj.css("height",windowH/3);
$divObj.css("z-index",zindex);


$divObj.css("top", Math.max(0, ((windowH - $($divObj).outerHeight()) * .3) +
Math.max(document.documentElement.scrollTop, document.body.scrollTop))+adjust+"px");
$divObj.css("left", Math.max(0, ((windowW - $($divObj).outerWidth()) / 2) +
document.body.scrollLeft) + "px");
disableBackground();
$(divId).slideToggle();
}



function updateStatus(id,vendorOrderId){
	var url = "UpdateStatusProc.jsp";
	var params="vendorOrderId=" + vendorOrderId ;
//	params = "a=" + a + "&b=" + b+"&c="+c; For example
	ajaxSubmitReqUtil(url, params, '', 'na', '');
	document.getElementById(id).style.display = "none";


	
}

function logout(){
	
	
}