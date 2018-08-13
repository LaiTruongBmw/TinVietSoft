<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="system_Main" %>

<!-- #include file="lib/form.inc"  -->
<link href="lib/application.css" rel="stylesheet" />

<script>

System.Menu = this;

var lang = '<%=Session["SESSION_LANG"]%>';
var cutoff_date = '<%=Session["CUTOFF_DATE"]%>';
var ex_rate = '<%=Session["EX_RATE"]%>';
var _url, _Title, _lTitle, _fTitle, _menu_id;
var gReload = false;
var showType;
var init_lang = "FYZAS";
function init(){
	var obj = document.all("imgType");	
	showType = obj.status;
	var debug_yn = '<%=Session["Debug_YN"]%>';
	var obj = document.getElementById("imgDebug");
	if(debug_yn == "Y")
	{
	   obj.style.display="";
	}
	else
	{
	    obj.style.display="none";
	}
	
	document.getElementById("idMenu").style.width = "250px";
	document.getElementById("idContent").style.width = document.body.clientWidth - 260;
	
	lstLang.SetDataText(lang);
	System.S_Lang = lstLang.GetData();
	frmLeftMenu.document.location.href = "../system/mn/menu.aspx?lang="+lstLang.GetData();
	//frameMenu.document.location.href = "../system/menu/menudemo/menu.html";
	frameMenu.document.location.href = "../system/menu/menudemo/menu.aspx?lang=" + lang;
	//comment below routine if dont use
	//setInterval("CheckSessionValid();",30000);//5 minutes
	
	
}

function ShowMenu()
{
	var obj = idWorkspace;
	
	
	if ( obj.style.visibility == "hidden" )
	{
		obj.style.visibility = "";	
		obj.style.display = "";
		obj.focus();
		imgShowMenu.style.display="none";
	} else
	{
		obj.style.visibility = "hidden";	
		obj.style.display = "none";
	}
}

function HideAppMenu()
{
	var obj = idWorkspace;
	obj.style.visibility = "hidden";	
	obj.style.display = "none";

	imgShowMenu.style.display="";
	imgShowMenu.style.visibility="";
}

function PinClick()
{
	var obj = event.srcElement;
	
	var pobj = obj;
	while ( pobj.id != "idWorkspace" )  pobj = pobj.parentNode;
	
	
	if ( pobj.pin == "off" ) 
	{
		pobj.pin = "on";
		obj.src = "images/pinon.png";
		//pobj.style.position = "";
		
	} else
	{
		pobj.pin = "off";
		obj.src = "images/pinoff.png";
		//pobj.style.position = "absolute";
	}
}


var nCount = 0;
var nPos = 0;

function SetNormal()
{
	if ( nCount > 0 )
	{
		//idTab.childNodes(nPos).style.backgroundColor="";
	    idTab.childNodes(nPos).className = 'tab';
		var title = idTab.childNodes(nPos).ctitle;
		
		if ( title.length > 30 ) 
			title = title.substr( 0, 30 ) + "...";
			
		idTab.childNodes(nPos).firstChild.innerText= title ;
		
		idContent.childNodes( nPos ).style.display = "none";
	}
}

function SetSelect()
{
	if ( nCount > 0 )
	{	
		idTab.childNodes(nPos).className = 'activeTab';
		idTab.childNodes(nPos).firstChild.innerText = idTab.childNodes(nPos).ctitle ;
		idContent.childNodes(nPos).style.display = "";
		idContent.childNodes(nPos).focus();
	}
	CheckScroll();
}
function IsActive(p_tittle)
{
    var idx = FindTab(p_tittle);
    
	if( idx >= 0 )
	{	
		if(idTab.childNodes(idx).className == 'activeTab'){
		    return true;
		}
	}
	return false;
}

function OnPageLoad()
{
	var obj =event.srcElement;
	for ( var i = 0 ;  i < frames.length ; i ++)
	{
		
		var doc = frames(i).document;
		if ( doc.location.pathname == obj.contentWindow.location.pathname  ) 
		{
			if ( (idTab.childNodes(j).title=='') 
				|| (idContent.childNodes(j).all("idTitle").innerHTML=='') ) {

				var title = doc.title;
	
				if ( title.length == 0 )
				{
					var url = doc.location.href;
					var index = url.lastIndexOf( "/" );
					title = url.substr( index + 1 );			
				}
				if ( title.length > 0 )
				{
					var arr = title.split("#");
						
					if (arr.length == 2) {
						for ( var j = 0 ;  j < obj.parentNode.childNodes.length ; j++)
						{
							if ( obj.parentNode.childNodes(j) == obj )
							{
								idTab.childNodes(j).innerText =  arr[1] ; // tTitle
								idTab.childNodes(j).title =arr[1]; // tTitle
								idContent.childNodes(j).all("idTitle").innerHTML = arr[0]; //fTitle
								break;
								
							}
						}
					} else {
						for ( var j = 0 ;  j < obj.parentNode.childNodes.length ; j++)
						{
							if ( obj.parentNode.childNodes(j) == obj )
							{
								idTab.childNodes(j).innerText =  title ; // tTitle
								idTab.childNodes(j).title =title; // tTitle
								idContent.childNodes(j).all("idTitle").innerHTML = title; // fTitle
								break;
								
							}
						}
					}
				}
			}
			return;
		
		}
		
	}

}
function NewWindow( url, Title, lTitle, fTitle, menu_id, menu_ps)
{	
    if(!Title) return;
    
    _url = url;
    _Title = Title;
    _lTitle = lTitle;
    _fTitle = fTitle;
    _menu_id = menu_id;
	_menu_ps = menu_ps;
    
    var aTemp = new Array();
	var idx, sTitle;

    if(System.S_Lang == "VIE"){
        sTitle = lTitle;
    }
    else if(System.S_Lang == "KOR"){
        sTitle = fTitle;
    }
    else{
        sTitle = Title;
    }
    
	if (showType == 1){
		idx = FindTabID(menu_id);
		//idx = FindTab(sTitle);
        
		if ((idx != -1) && (idx < idTab.childNodes.length)) {
			SelectTab(idx); 
			var currForm = idContent.childNodes( idx );
			
	        //var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
			var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
	        //reload page
	        if(confirm("Bạn có muốn làm mới lại du liệu ? \r\n Nếu chọn OK thì dữ liệu hiện tại chưa lưu sẽ bị mất.")){
				frm.src = frm.src;
				frm.location.reload();
	        }
		} 
		else{
            
		     if(System.S_Lang == "ENG"){
			    openNewWin(url,  Title, lTitle, fTitle, menu_id, menu_ps);
			 }
			 else{
			    var sIdx = url.lastIndexOf("/");
                var eIdx = url.indexOf(".aspx");
                var form_id = url.substr(sIdx + 1,eIdx - sIdx -1);
               
                txtFormID.text = menu_id;
                txtLang.text = System.S_Lang;
                datGetFormDictionnary.Call("SELECT");
			 }
		}
	} 
	else{
		if(System.S_Lang == "ENG"){
		    openNewWin(url,  Title, lTitle, fTitle,menu_id,menu_ps);
		 }
		 else{
		    var sIdx = url.lastIndexOf("/");
            var eIdx = url.indexOf(".aspx");
            var form_id = url.substr(sIdx + 1,eIdx - sIdx -1);
            
            txtFormID.text = form_id;
            txtLang.text = System.S_Lang;
            datGetFormDictionnary.Call("SELECT");
		 }
	}
}
function LoadDictionaryForPopup(popup_id){
	System.Menu.init_lang = "N";
    txtFormID.text = popup_id;
    txtLang.text = System.S_Lang;
    datGetFormDictionnaryPopup.Call("SELECT");
}
function openNewWin(url, Title, lTitle, fTitle, menu_id, menu_ps) {	
    
    var sTitle;
    if(System.S_Lang == "VIE"){
        sTitle = lTitle;
    }
    else if(System.S_Lang == "KOR"){
        sTitle = fTitle;
    }
    else{
        sTitle = Title;
    }
    
	
	
	var i = url.lastIndexOf( "/" );
	var eIdx = url.indexOf(".aspx");
	var short_url = url.substr(0,eIdx+5);
	
	SetNormal();

	idTab.insertAdjacentHTML("afterBegin", "<span sid='"+menu_id+"' onmouseout='outTab(this)' onmouseover='overTab(this)' onclick='ClickTab()' title='" + short_url + "' etitle='" + Title + "' ltitle='" + lTitle + "' ftitle='" + fTitle + "' ctitle='" + sTitle + "'><div style='display:inline;font-weight:bold;width:150px;text-align:left;padding-left:3px'>" + sTitle + "</div><div style='display:inline;padding-left:5px;padding-right:3px;font-weight:bold;font-size:12px;color:white' onmouseover='OnOver(this)' onmouseout='OnOut(this)' onclick='DeleteWindow(this)'>x</div></span>");
	
	idContent.insertAdjacentHTML("afterBegin" , 
	'<table style="' + Gb_TableStyle +'"  height="100%" border=' + Gb_TableBorder +' cellspacing=0 cellpadding=0 border=0 >' +
	'<tr style="display:none">	' +
	'	<td style="' + Gb_TdStyle1 +'">'+
	'		<table border="0" width="100%" ><tr>'+
	'			<td  align="left" width=2%>' +
	'				<img src="images/iconapplication.gif" align="absMiddle">' +
	'			</td>' +
	'			<td  id="idTitle" width="40%" style="' + Gb_TdStyle2 + '" align="left">[' + short_url + '][' + menu_id + ']</td>' +
    '			<td  id="idMenuID" style="display:none">' + menu_id + '</td>' +
	'			<td  id="idMenuPS" style="display:none">' + menu_ps + '</td>' +
	'			<td  id="idTitle" width="30%" style="color:blue" align="left">[EX.Rate: '+ ex_rate +'] [CutOff Date: '+ cutoff_date +']</td>' +
	'			<td  id="idTitle" width="21%" style="' + Gb_TdStyle2 + '" align="right"><b>Welcome ['+ System.S_UserName +']</td>' +
	'			<td align="right" width=7%><nobr>' +
	'				<img style="cursor:hand" alt="help" src="images/iconpopup.png" align="absMiddle" onclick="openUserGuide(\''+ url + '\')">' +	
	'				<img src="images/iconminimize.png" alt="next window" align="absMiddle" onclick="NextWindow()">' +
	'				<img src="images/iconexit.png" alt="close window" align="absMiddle" onclick="DeleteWindow()">' +
	'				</nobr>' +
	'			</td>' +
	'		</tr></table>'+
	'	</td>' +
	'</tr>' +
	'<tr>' +
	'	<td  width="100%" height="100%" border=0>'+
	'		<iframe id="frmContent" src="../' + url +'"  style="padding:0 0 0 0;' + Gb_FrameStyle +'" frameborder=' + Gb_FrameBorder +'  onload="OnPageLoad()">	</iframe>'+
	'	</td>'+
	'</tr>'+
	'</table>	'
	);
	
	nCount++;
	//if (nCount > 8) { document.getElementById("idScrollLeft").style.display = ""; document.getElementById("idScrollRight").style.display = ""; }
	//if (nCount > 0) { document.getElementById("idCoseWin").style.display = ""; }
	nPos = 0;
	//Tabs
	SetSelect();
}
//find tab by MenuID
function FindTabID(menuID) {
	var pobj = idTab;
	var i = 0;
	
	//return false;
	while ( i< idTab.childNodes.length) {
		obj = idTab.childNodes(i);
		if (obj.tagName == "SPAN" ) {
			//alert(obj.parentNode.innerHTML);
			if ( obj.sid == menuID) {
				return i;
			}
		}
		i++;
	}
	return -1;
}
//find tab by title
function FindTab( tlt ) {
	var pobj = idTab;
	var i = 0;
	while ( i< idTab.childNodes.length) {
		obj = idTab.childNodes(i);
		if (obj.tagName == "SPAN" ) {
			if ( obj.title == tlt) {
				return i;
			}
		}
		i++;
	}
	return -1;
}

//select tab by it's index
function SelectTab(idx) {
	if ( idx != -1  && idx != nPos ){
		SetNormal();
		nPos = idx;
		SetSelect();
	}
}

function ClickTab()
{
	var obj = event.srcElement;
	var pobj;
	while ( obj.tagName != "SPAN" ) obj = obj.parentNode;
	
	pobj = obj.parentNode;
	
	var pos=-1;
	for ( var i = 0 ;  i < pobj.childNodes.length ; i++)
	{
		if ( pobj.childNodes(i) == obj )
		{
			pos = i;
			break;
			
		}
	}
	
	if ( pos != -1  && pos != nPos )
	{
		SetNormal();
		
		nPos = pos;
		
		SetSelect();
		
		var tabTilte;
    
        if(System.S_Lang == "ENG"){
            tabTilte=idTab.childNodes(nPos).etitle;
        }
        else if(System.S_Lang == "VIE"){
            tabTilte=idTab.childNodes(nPos).ltitle;
        }
        else{
            tabTilte=idTab.childNodes(nPos).ftitle;
        }
        _Title = idTab.childNodes(nPos).etitle;
        _lTitle = idTab.childNodes(nPos).ltitle;
        _fTitle = idTab.childNodes(nPos).ftitle;
        //alert(idTab.childNodes(nPos).title+":"+nPos+":"+tabTilte);
        if (idTab.childNodes(nPos).ctitle != tabTilte) {
            UpdateLanguageToForm();
        }
	}
}
function IsActive(p_tittle)
{
    var idx = FindTab(p_tittle);
    
    if( idx >= 0 )
    { 
        if(idTab.childNodes(idx).className == 'activeTab'){
            return true;
        }
    }
    return false;
}

function overTab( obj )
{
	var pobj;
	while ( obj.tagName != "SPAN" ) obj = obj.parentNode;
	
	pobj = obj.parentNode;
	
	var pos=-1;
	for ( var i = 0 ;  i < pobj.childNodes.length ; i++)
	{
		if ( pobj.childNodes(i) == obj )
		{
			pos = i;
			break;
			
		}
	}
	
	if ( pos != nPos )
	{
		obj.className = 'overTab';
	}
}

function outTab( obj ){
	var pobj;
	while ( obj.tagName != "SPAN" ) obj = obj.parentNode;
	
	pobj = obj.parentNode;
	
	var pos=-1;
	for ( var i = 0 ;  i < pobj.childNodes.length ; i++)
	{
		if ( pobj.childNodes(i) == obj )
		{
			pos = i;
			break;
			
		}
	}
	
	if ( pos != nPos )
	{
			obj.className = 'tab';	
	}
}
function OnDictionary() {
    var currForm = idContent.childNodes(nPos);
	var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
    var doc = frm;
    var form_id = currForm.childNodes(0).childNodes(0).childNodes(0).childNodes(0).childNodes(0).childNodes(0).childNodes(2).innerHTML;
    if(form_id == "undefined" || form_id == ""){
        alert("This form is error cannot make dictionary!");return false;
    }
    var result = System.GetDataLanguage(doc.contentWindow.document);
    if (result == ""){
        alert("No data make dictionary!");return false;
    }
    if(System.S_Lang != "ENG"){
        alert("Please choose English Language!");return false;
    }
    if ("<%=Session["CODEADMIN_YN"]%>" != "Y") {
        alert("Only Admin System can used this function!"); return false;
    }
    var fpath = System.RootURL + "/system/sde/ab/DictionnaryAuto.aspx?form_id="+form_id + "&type_dic=FORM";
    System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes');
}
function ExecuteFile2()
{
// Instantiate the Shell object and invoke its execute method.
var oShell = new ActiveXObject("Shell.Application");
var commandtoRun = "D:\\WebProject\\MaterialInOut\\bin\\Debug\\MaterialInOut.exe";
// Invoke the execute method.
  oShell.ShellExecute(commandtoRun, "", "", "open", "1");
}
function openUserGuide( str ) {
    var x = Math.round((screen.availWidth - 600) / 2);
 	var y = Math.round((screen.availHeight - 600) / 2);
 
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=yes,resizable=yes,copyhistory=no,width="+850+",height="+650 +
			   "lef="+ x +",top=" + y;
	if (Trim(str) != "") {
	    str=str.replace("form","manual");
	    
		window.open("Manual.aspx?url="+ str, 'ManualWin', features);
	}
}

function NextWindow()
{
	if ( nCount > 1 )
	{
		SetNormal();
		
		nPos++;
		
		if ( nPos == nCount ) nPos = 0;
		
		SetSelect();
		
	}
}

function DeleteWindow(obj)
{
   if(window.frames[nPos+1].canClose) // 2 iframe menu,workspace
	{
	    if(!window.frames[nPos+1].canClose())  //Thai
	    {
		       return ; // user cancel closing action
	    }
	}

	if ( nCount > 0 )
	{
        
        var idx = FindTabID(obj.parentNode.getAttribute("sid"));
        SelectTab(idx); 
		nCount --;
		
		idTab.removeChild( idTab.childNodes(nPos));
		idContent.removeChild( idContent.childNodes( nPos ));

		nPos = 0;
		//if (nCount < 8) { idScrollLeft.style.display = "none"; idScrollRight.style.display = "none"; }
		if (nCount == 0) {idCoseWin.style.display = "none"; }
		SetSelect();
	}
}


var nScrollDelta = 0;
var nScrollID = 0;

function fnScrollTick()
{
	idTabScroll.scrollLeft += nScrollDelta;
	CheckScroll();
}

function Scroll( d )
{

	nScrollDelta = d*10;

	if ( nScrollID != 0 )
		MenuStop();
	nScrollID = setInterval( fnScrollTick , 50 );

}

function ScrollStop()
{
	if ( nScrollID != 0 )
	{
		clearInterval( nScrollID );
		nScrollID = 0;
	}
}

function CheckScroll() {

    //alert(idTabScroll.scrollRight + " - " + idTabScroll.scrollWidth + " - " + idTabScroll.offsetWidth);
	if ( idTabScroll.scrollLeft == 0 )
		idScrollLeft.style.display = "none";
	else
		idScrollLeft.style.display = "";
		
	if ( idTabScroll.offsetWidth < idTabScroll.scrollWidth - idTabScroll.scrollLeft)
		idScrollRight.style.display = "";
	else
		idScrollRight.style.display = "none";
}


function ShowTypeClick(obj) {
	if(obj.status == 0){
		//obj.src='images/pinon.png';
		obj.status = 1;
	} else {
		//obj.src='images/pinoff.png';
		obj.status = 0;
	}
	showType = obj.status;
}



function PinOver(obj) {
	if(obj.status == 0){
		obj.src='images/pinoff_over.png';
	} else {
		obj.src='images/pinon_over.png';
	}
}
function PinOut(obj) {
	if(obj.status == 0){
		obj.src='images/pinoff.png';
	} else {
		obj.src='images/pinon.png';
	}
}
function OnLangChange(p_lang){
    //System.S_Lang = lstLang.GetData();
    if(lstLang.value != p_lang){
        System.S_Lang = p_lang;
        lstLang.value = p_lang;
        frmLeftMenu.document.location.href = "../system/mn/menu.aspx?lang="+lstLang.GetData();
    }
    //frmLeftMenu.document.location.href = "../system/menu/menu.aspx?lang="+lstLang.GetData();
}
function UpdateLanguageToForm(){
    if(nCount > 0){
        if(!confirm("Do you want to update language for this form. \nIf you click OK. your current data which has not saved yet will be lose.")){
            return;
        }
    }
    else{
        return;
    }
    
    var tabTilte;
    
    if(System.S_Lang == "ENG"){
        tabTilte=idTab.childNodes(nPos).etitle;
    }
    else if(System.S_Lang == "VIE"){
        tabTilte=idTab.childNodes(nPos).ltitle;
    }
    else{
        tabTilte=idTab.childNodes(nPos).ftitle;
    }
    idTab.childNodes(nPos).firstChild.innerText = tabTilte;
	idTab.childNodes(nPos).firstChild.title = tabTilte;	
	
	gReload = true;
	LoadFormDictionnary();
	
}
function ReloadForm(){
    
    if(nPos > -1 && nCount > 0){
		this.ReloadDic();
		/*
        var url = new String();
        var currForm = idContent.childNodes( nPos );
        var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
		
		
        url = frm.src;
       
        //remove all querystring when reload form
        //url = url.substr(0,url.indexOf(".")) + ".aspx";
		if(confirm(
			<% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
				"Bạn chắc chắn muốn làm mới dữ liệu!\r\n Vì khi làm mới dữ liệu chưa lưu lại sẽ bị mất?"
			<% } else {%>
				"Are you sure to reload data?"
			<% }%>
		)){
			frm.src = url;
			//frm.location.reload();
		} /**/
    }
}    
function LoadFormDictionnary(){
    var currForm = idContent.childNodes( nPos );
	var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
	var url = frm.src;
	var sIdx = url.lastIndexOf("/");
    var eIdx = url.indexOf(".aspx");
    var form_id = url.substr(sIdx + 1,eIdx - sIdx -1);
    
    //txtFormID.text = form_id;
    txtFormID.text = this.GetMenuID();
    txtLang.text = System.S_Lang;
    datGetFormDictionnary.Call("SELECT");
}
function OnDataReceive(p_oData){
    if(p_oData.id == "datGetFormDictionnary"){
        BindDictionaryToArray(event.array);
    }
    else if(p_oData.id == "datGetFormDictionnaryPopup"){
        BindDictionaryToArrayPopup(event.array);
    }
}
function BindDictionaryToArrayPopup(arr){
    System.S_ArrFormDict = new Array();
    
    for(var i=0; i < arr.length ; i++ ){
       
       var tmp=new Array();
       
       tmp[tmp.length] = arr[i][0];//eng
       tmp[tmp.length] =  arr[i][1];//user language
       
       System.S_ArrFormDict[System.S_ArrFormDict.length] = tmp;
    }
	
	System.Menu.init_lang = "Y";
}    
function BindDictionaryToArray(arr){
    System.S_ArrFormDict = new Array();
    
    for(var i=0; i < arr.length ; i++ ){
       
       var tmp=new Array();
       
       tmp[tmp.length] = arr[i][0];//eng
       tmp[tmp.length] = arr[i][1];//user language
       
       System.S_ArrFormDict[System.S_ArrFormDict.length] = tmp;
    }
    if(gReload == false){
        openNewWin(_url,  _Title, _lTitle, _fTitle, _menu_id, _menu_ps);
    }
    else{
        var currForm = idContent.childNodes( nPos );
	    var frm = currForm.childNodes(0).childNodes(1).childNodes(0).childNodes(0);
	    //reload page
	    frm.src = frm.src;
		//frm.location.reload();
	    gReload = false;
	    
    }
}
function CheckSessionValid()
{
    var url = System.RootURL + "/gwWebService.asmx";
    var pl = new SOAPClientParameters();
    var login_pk = '<%=Session["LOGIN_PK"]%>';
	pl.add("Procedure", "ctl.sp_sel_check_session");
	pl.add("para", login_pk);
	
    SOAPClient.invoke(url, "GetDataTableArgJS", pl, true, ShowResult);
}

function ShowResult(r)
{
   if(r.length > 0)
   {
        if(r[0] == "N")
        {
            alert("Your session was invalided. \n Because your account was using in another session(maybe this account login from another location.) \nMột tài khoản không thể cùng lúc sử dụng ở hai nơi.");
            System.AppLogout();
            return;
        }
   }
}

function ShowTypeClickPin(obj) {
    var status;
    if (obj.id == "unpin") {
        status = 1;
        pin.style.display = "";
        unpin.style.display = "none";
    } else {
        status = 0;
        pin.style.display = "none";
        unpin.style.display = "";
    }
    showType = status;
}

function GetMenuID() {
    return System.Menu.idContent.childNodes(System.Menu.nPos).childNodes(0).all("idMenuID").innerText;
}

function GetMenuPS() {
    return System.Menu.idContent.childNodes(System.Menu.nPos).childNodes(0).all("idMenuPS").innerText;
}

function OnGetID(url){
	return url.split(".aspx")[0].split("/")[url.split(".aspx")[0].split("/").length - 1].toUpperCase();
}

function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return escape(utftext);
}

function DisMenu(){
	if(document.getElementById("idMenu").style.width == "250px"){
		document.getElementById("idMenu").style.width = "0px";
		document.getElementById("idContent").style.width = document.body.clientWidth - 10;
	} else {
		document.getElementById("idMenu").style.width = "250px";
		document.getElementById("idContent").style.width = document.body.clientWidth - 260;
	}
}

function OnGetError(str_err){
    alert(str_err.replace( /\n/g, "|!" ).replace( /: /g, "|!" ).split("|!")[1]); 
}

function ReloadDic(){
    gReload = true;
    LoadFormDictionnary();
}

function OnOver(obj){obj.style.color = "red";}
function OnOut(obj){obj.style.color = "white";}
</script>

<html>
<body onload="init()" style="padding: 0 0 0 0; margin: 0 0 0 0; background-color: #FFFFFF;
    overflow: hidden; ">
    <gw:data id="datGetFormDictionnary" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="array" parameter="0,1" function="ST_SY_SEL_DICTIONNARY" > 
                <input bind="noneed" >
                    <input bind="txtFormID" />  
                    <input bind="txtLang" /> 
                </input> 
                <output bind="noneed" /> 
            </dso> 
        </xml> 
 </gw:data>
    <gw:data id="datGetFormDictionnaryPopup" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="array" parameter="0,1" function="ST_SY_SEL_DICTIONNARY" > 
                <input bind="noneed" >
                    <input bind="txtFormID" />  
                    <input bind="txtLang" /> 
                </input>
                <output bind="noneed" /> 
            </dso> 
        </xml> 
 </gw:data>
  <iframe id="frameMenu" style="border: 0px outset #eeeeee; width: 100%; height:48px;overflow: hidden;position:absolute;left:0px;top:0px;" scrolling="no" frameborder="0">
  </iframe>
    <table border="0" width="100%" cellpadding="0" cellspacing="0" style="height: 100%;">
        <tr valign="top" style="height: 100px;display:none;" class="navigator">
            <td>
                <table width="100%" style="display:none;">
                    <tr style="height: 35px">
                        <td width="10%">
                            <div>
                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
                                    width="134" height="40">
                                    <param name="movie" value="images/swf/logotreasure.swf">
                                    <param name="quality" value="high">
                                    <param name="wmode" value="transparent">
                                    <param name="bgcolor" value="#FFFFFF">
                                    <param name="wmode" value="transparent">
                                    <embed src="../images/swf/logotreasure.swf" quality="high" wmode="transparent" bgcolor="#FFFFFF"
                                        width="134" height="40" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
                                 </embed>
                                </object>
                            </div>
                        </td>
                        <td width="54%" align="center">
                            &nbsp;
                        </td>
                        <td width="10%" align="center">
                            <img src="images/menutop/help.gif" width="120" height="30" style="cursor: pointer;
                                background-image: none; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/menutop/help.gif', sizingMethod='scale');"
                                alt="Help" onclick="System.OnHelp('../OnlineHelp.aspx');" />
                        </td>
                        <td width="2%" align="center">
                            &nbsp;
                        </td>
                        <td width="5%" align="center">
                            <img src="images/menutop/dot_transparent.gif" width="70" height="26" style="cursor: pointer;
                                background-image: none; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/menutop/log-out.png', sizingMethod='scale');"
                                alt="Log out" onclick="System.AppLogout()" />
                        </td>
                        <td width="5%">
                            <img src="images/menutop/dot_transparent.gif" width="63" height="26" style="cursor: pointer;
                                background-image: none; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/menutop/iconRefresh.png', sizingMethod='scale');"
                                alt="Refresh the current form" style="cursor: pointer; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='iconRefresh.png', sizingMethod='scale';"
                                onclick="ReloadForm()" />
                        </td>
                        <td width="11%">
                            <gw:list id="lstLang" styles="width:100%" onchange="OnLangChange()">
                                <data>Data|ENG|English|VIE|Vietnamese|KOR|Korean</data>
                            </gw:list>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top" style="height: 99%">
            <td>
                <table border="0px" cellpadding="0" cellspacing="0" width="100%" style="height: 100%;">
                    <tr valign="top" style="height: 100%;">
                        <td width="100%">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                <tr>
                                    <td style="background-color:#ffffff;padding-top:48px;" class="navigator" valign="bottom">
                                        <div  style="float:left;height:28px;width:30px;background-color:transparent;" title="Ẩn/Hiện Menu">
                                            <div style="border-right:0px solid #ffffff;height:22px" align="center">
                                                <div style="padding-top:1px; padding-left:1px; padding-right:1px;height:22px;width:24px" onclick="DisMenu()" onmouseover="this.style.cursor='hand'">
                                                    <div style="border:1px solid #ffffff;height:100%;width:100%" valign="middle">
                                                        <table style="width:15px;" cellpadding="3" cellspacing="2">
                                                            <tr style="height:3px;"><td></td></tr>
                                                            <tr style="height:1px;background-color:White"><td></td></tr>
                                                            <tr style="height:1px;background-color:White"><td></td></tr>
                                                            <tr style="height:1px;background-color:White"><td></td></tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="frmDiv" style="height:28px;background-color:transparent;width:100%;">
                                            <nobr>                                                
						                        <span id="idTabScroll" style="width:100%;overflow:hidden; padding: 0 0 0 0;width: expression(offsetParent.offsetWidth)">
						                            <b><nobr id="idTab"  style="font-size:9pt;" ></nobr></b>
						                        </span>
					                        </nobr>
                                        </div>
                                    </td>
                                </tr>
                                <tr valign="top" style="height: 100%;">
									<td valign="top" colspan="1">
										<div style="border-right:1px solid #e5e5e5;width:0px; display:inline;height:100%;background-color:transparent" id="idMenu">
											<iframe id="frmLeftMenu" style="border: 0 outset #e5e5e5; width:100%; height: 100%; overflow:auto " frameborder="0"></iframe>
										</div>
										<div style="border: 5px;width:0px;height:100%;display:inline;background-color:transparent" id="idContent"></div>
									</td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="1">
                                        <div style="height:20px;" class="footer" id="footer">
                                            <div class="btn_left">
                                                <ul>
                                                    <li><div class="leftdiv">&nbsp;</div></li>
                                                    <li><a href="#" class="refresh" title="Refresh" onclick="ReloadForm()">
														<% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
															Làm mới
														<% } else {%>
															Refesh 
														<% }%>
													</a></li>
                                                    <li><a id="idCoseWin" onclick="DeleteWindow();" style="display:none;" href="#" class="close" title="Close Window">
														<% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
															Đóng cửa sổ
														<% } else {%>
															Close Window
														<% }%>
													</a></li>
                                                    <li><a id="idScrollLeft" onmouseout="ScrollStop()" onmouseover="Scroll(-1)" href="#" class="left" title="Roll Left" style="display:none"><% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
															Di chuyển trái
														<% } else {%>
															Left
														<% }%></a></li>
                                                    <li><a id="idScrollRight" onmouseout="ScrollStop()" onmouseover="Scroll(1)" href="#" class="right" title="Roll Right" style="display:none"><% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
															Di chuyển trái
														<% } else {%>
															Right
														<% }%></a></li>
                                                    <li id="imgDebug"><a href="#" class="firebug" title="Debug" onclick="parent.ondebugclick()">Debug</a></li>
                                                    <li id="pin" onclick="ShowTypeClickPin(this)"><a href="#" class="pin" title="Pin"><% if(Session["SESSION_LANG"].ToString() == "VIE") {%>
															Cố định
														<% } else {%>
															Pin
														<% }%></a></li>
                                                    <li id="unpin" onclick="ShowTypeClickPin(this)" style="display:none;"><a href="#" class="unpin" title="UnPin"><% if(Session["SESSION_LANG"].ToString() == "VIE"){%>
															Không cố định
														<% } else {%>
															Un Pin
														<% }%></a></li>
                                                    <li><a href="#" class="dictionary" onclick="OnDictionary()">
														<% if(Session["SESSION_LANG"].ToString() == "VIE"){%>
														    Từ điển
														<% } else {%>
															Dictionary
														<% }%></a></li>
                                                    <li>
                                                        <div class="flag">
                                                            <a href="#" onclick="OnLangChange('ENG')"><img src="images/us.gif" border="0" /></a>
                                                            &nbsp;
                                                            <a href="#" onclick="OnLangChange('VIE')"><img src="images/vn.gif" border="0" /></a>
                                                        </div>
                                                    </li>
                                                    <li><a href="#" class="logout" title="Logout" 
														onclick="if(confirm(<% if(Session["SESSION_LANG"].ToString() == "VIE"){%>'Bạn thật sự muốn thoát khỏi ứng dụng?'<% } else {%>'Are you sure to logout?'<% }%>)){System.AppLogout();}">
														<% if(Session["SESSION_LANG"].ToString() == "VIE"){%>
															Đăng xuất
														<% } else {%>
															Log out
														<% }%></a></li>
                                                    <li><div class="rightdiv">&nbsp;</div></li>
													<!---->
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div>
        <table pin="on" id="idWorkspace" style="width: 250; border: 2 outset lightgray;" border="0" cellspacing="0" cellpadding="0" style="height: 100%;display:none">
            <tr style="height: 1%">
                <td style="background-image: url(menu/images/menuHeaderBackground.gif)">
                    <table border="0" width="100%">
                        <tr>
                            <td width="99%">
                                Menu
                            </td>
                            <td width="1%" align="right">
                                <img src="menu/images/iconHideAppMenu.png" onmouseover="this.src='menu/images/iconHideAppMenuOver.png'"
                                    onmouseout="this.src='menu/images/iconHideAppMenu.png'" style="cursor: pointer;"
                                    alt="Hide the application menu" onclick="HideAppMenu()">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 99%" style="display:none">
                <td>
                    
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="display:none">
            <tr>
                <td>
                    <img src="menu/images/iconShowAppMenu.png" width="31" height="20" onmouseover="this.src='menu/images/iconShowAppMenuOver.png';"
                        onmouseout="this.src='menu/images/iconShowAppMenu.png';" id="imgShowMenu" style="display: none;
                        cursor: hand" alt="Show the application menu" onclick="ShowMenu()" />
                </td>
                <td>
                    <img src="images/pinon.png" width="31" height="20" onmouseover="PinOver(this);" onmouseout="PinOut(this);"
                        id="imgType" status="1" style="cursor: hand" onclick="ShowTypeClick(this);" title="dock" />
                </td>
            </tr>
        </table>
    </div>
    <gw:textbox id="txtFormID" styles="display:none" />
    <gw:textbox id="txtLang" styles="display:none" />
</body>
</html>