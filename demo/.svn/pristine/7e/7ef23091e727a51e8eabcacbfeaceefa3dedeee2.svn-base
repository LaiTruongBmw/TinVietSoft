
var RootURL ;
var SystemURL;
var HostURL;
var S_MultiLog=false;

var System = this;
var Menu = null;
var gArrInputPara ="";

var dsolist = new Array();
var currentDSO = null;
var currentDataControl = null;
// logging 
var logger=null;
var lastLog=null;

//for user information

var S_UserID = "";
var S_UserName = "";

var S_ArrUserChat = new Array();

//for image path
var SysImgPath;
var SysDfPath = "T";

var S_LoginInfo="Processing was completed !";
var S_Lang;
var S_ArrDict = new Array();
var S_ArrFormDict = new Array();

//
//	System Library
// 
function CheckSystem()
{
	alert( "This is System" );
}

function AppLogout()
{
	OpenPage( SystemURL + "/Logout.aspx");
}
function OnHelp(url)
{
	OpenModeless(url,600,700,'resizable:no;status:no');
}
function OpenPage( url )
{

	idSystemFrm.document.location.reload ( url ); 
}

function OpenTargetPage( url , target )
{
    var d = new Date();
	if ( url.indexOf( "?" ) == -1 )
		url += "?random=" + d ;
	else
		url += "&random=" + d ;
	window.open( url , target );
}

function Delay(millis) 
{
    var date = new Date();
    var curDate = null;

    do { curDate = new Date(); } 
    while(curDate-date < millis);
} 

function OpenModal( url , width , height , style , caller)
{
    if(System.S_Lang != "ENG"){
        
        var sIdx = url.lastIndexOf("/");
        var eIdx = url.indexOf(".aspx");
        var popup_id = url.substr(sIdx + 1,eIdx - sIdx -1);
        //alert(popup_id);
        System.Menu.LoadDictionaryForPopup(popup_id);
        //Delay(5000); //pause 20 seconds
        
    }
    
	var d = new Date();
	if ( url.indexOf( "?" ) == -1 )
		url += "?random=" + d ;
	else
		url += "&random=" + d ;
		

	var s = "";
	
	if ( width > 0 ) s += ";dialogWidth:" + width +" px";
	if ( height > 0 ) s += ";dialogHeight:" + height + " px" ;
	
	if ( style.length > 0 )
		 s += "; resizable:no;status:no; " + style ;
	if (caller) {
		return window.showModalDialog(  url    , caller, 
		"unadorned:on ; center:yes; edge:sunken ; " + s  );		
	} else {
		return window.showModalDialog(  url    , this, 
			"unadorned:on ; center:yes; edge:sunken ; " + s  );		
	}
	
}


function OpenModeless( url , width , height , style )
{
    
	var d = new Date();
	if ( url.indexOf( "?" ) == -1 )
		url += "?random=" + d ;
	else
		url += "&random=" + d ;
		

	var s = "";
	
	if ( width > 0 ) s += ";dialogWidth:" + width +" px";
	if ( height > 0 ) s += ";dialogHeight:" + height + " px" ;
	
	if ( style.length > 0 )
		 s += "; resizable:no;status:no; " + style ;
	
	return window.showModelessDialog(  url    , this, 
		"unadorned:on ; center:yes; edge:sunken ; " + s  );		
	
	
}
var logMsg;
function Logging ( logmsg )
{
	if(this.logger)
	{
	    re = /</g;             //Create regular expression pattern.
   	    logmsg = logmsg.replace(re, "&lt;");    
   	    re = />/g;             //Create regular expression pattern.
   	    logmsg = logmsg.replace(re, "&gt;");    
	    // this.logger.innerHTML =   this.logger.innerHTML +   logmsg + "<br>";
	    this.logger.document.write ( logmsg + "<br><br>" );
		
	}
}

function	LoggingStart( title )
{
	var d = new Date();
	
	// this.logger.innerHTML =   this.logger.innerHTML + "<font style='font-weight:bold;color:blue'>" + title + "</font> (" + d +") <br> <div style='padding:2 0 2 10'>";
	 this.logger.document.write ( "<font style='font-weight:bold;color:blue'>" + title + "</font> (" + d +") <br> <div style='padding:2 0 2 10'>");
}

function	LoggingEnd()
{
 	logMsg += "</div>";
// 	this.logger.innerHTML += "</div>";

	this.logger.document.write ( "</div>");
	
	this.logger.document.body.scrollTop = this.logger.document.body.scrollHeight ;
}
function MakeData( obj  )
{
	this.idfrm.appendChild(obj);
	this.idfrm.action = "demo/system/binary/PostFile.aspx";
	this.idfrm.submit();
}
function SaveLastLog(logmsg)
{
    if(S_MultiLog == false)
    {
        this.lastLog.document.close();
        this.lastLog.document.open();
        this.lastLog.document.write('<html><LINK href="default.css" rel="stylesheet" ><body>');
    }
	//alert(logmsg);
    top.lastLog.document.write(unescape(logmsg) + "<br>");
}
var ErrorData = new Object;
function ShowErrorMessage(obj)
{

    var url;
    ErrorData = obj;
    
    url = System.RootURL + "/system/ErrorHandle.aspx?ShowButton=1|1|0|0|1|1";
	    //alert(url)
    return  System.OpenModal(url,500,270,"status:yes;resizable:on;");    
    
}

function ShowPopupMessage(strDescription, strDetail, strShowButton)
{
    var url;     
    ErrorData =null;
    url = System.RootURL + "/system/ErrorHandle.aspx?ShowButton="+strShowButton + "&Description="+strDescription + "&Detail="+strDetail;
    return System.OpenModal(url,500,270,"status:no;resizable:on;help:off");
}
function AddDate(strDate,intDay)
{
	
	var strYear;
	var strMonth;
	var strDay;
	var strFullDate;
	strYear=strDate.substr(0,4);
	strMonth=strDate.substr(4,2);
	strDay=strDate.substr(6,2);
	var oDate = new Date(strYear,strMonth-1, strDay);//20060203
	
	oDate.setDate(oDate.getDate()+intDay);	
	strYear=oDate.getYear();
	strMonth=oDate.getMonth()+1;
	strDay =oDate.getDate();
	
	strFullDate=strYear.toString()+String(strMonth<10?'0'+strMonth:strMonth) +String(strDay<10?'0'+strDay:strDay);
	return strFullDate;

}
//-----------------------------------------------------------------get data translate-------------------------------------------------------------
function GetDataLanguage_Popup(doc, url, lang, admin) {
    var temp = url;
    var sIdx = temp.lastIndexOf("/");
    var eIdx = temp.indexOf(".aspx");
    var form_id = temp.substr(sIdx + 1, eIdx - sIdx - 1);
    if (form_id == "undefined") {
        alert("This popup is error cannot make dictionary!"); return false;
    }
    var result = GetDataLanguage(doc);
    if (result == "") {
        alert("No data make dictionary!"); return false;
    }
    if (lang != "ENG") {
        alert("Please choose English Language!"); return false;
    }
    if (admin != "Y") {
        alert("Only Admin System can used this function!"); return false;
    }
    var fpath = System.RootURL + "/system/sde/ab/DictionnaryAuto.aspx?form_id=" + form_id + "&type_dic=popup";
    System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes');
}
function GetDataLanguage(doc) {
    
    var tags = new Array;
    var data = new Array;
    var str_return = "";
    var str_temp = "";

    //process tag 'NOBR'
    tags = doc.all.tags("NOBR");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();
        s = Trim(tags[i].innerText);
        s2 = Trim(tags[i].innerHTML);
        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'legend'
    tags = doc.all.tags("LEGEND");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();
        s = Trim(tags[i].innerText);
        s2 = Trim(tags[i].innerHTML);
        //alert(s+":"+s2)
        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'font'
    tags = doc.all.tags("font");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();

        s = Trim(tags[i].innerText);
        s2 = Trim(tags[i].innerHTML);
        //alert(s+":"+s2)
        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag '<b>'
    tags = doc.all.tags("b");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();
        s = Trim(tags[i].innerText);
        s2 = tags[i].innerHTML;
        s2 = Trim(TrimHTMLSpace(s2));

        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'td'
    tags = doc.all.tags("TD");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();
        s = Trim(tags[i].innerText);
        s2 = tags[i].innerHTML;
        s2 = Trim(TrimHTMLSpace(s2));

        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'label'
    tags = doc.all.tags("label");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();

        s = Trim(tags[i].text);
        if (s != "") {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'SPAN'
    tags = doc.all.tags("SPAN");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var s2 = new String();
        s = Trim(tags[i].innerText);
        s2 = Trim(tags[i].innerHTML);
        if (s != "" && s == s2 || (s2.indexOf("&amp;") > -1 && s.indexOf("&") > -1)) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'hyperlink'
    tags = doc.all.tags("A");
    for (var i = 0; i < tags.length; i++) {
        var s = new String();
        var title = new String();

        s = Trim(tags[i].innerText);
        s2 = tags[i].innerHTML;
        //alert(s2);return;
        title = tags[i].title;
        if (s != "" && s == s2) {
            str_temp += '!' + s.toLowerCase();
        }
    }

    //process tag 'imgbtn'
    tags = doc.all.tags("imgbtn");
    for (var i = 0; i < tags.length; i++) {
        var alt = new String();

        alt = Trim(tags[i].alt);
        if (alt != "") {
            str_temp += '!' + alt.toLowerCase();
        }
    }

    //process tag 'grid'
    var arrGrid = new Array();

    arrGrid = doc.all.tags("grid");
    
    for (var i = 0; i < arrGrid.length; i++) {
        var obj = arrGrid[i].GetGridControl();
        for (var j = 0; j < obj.Cols; j++) {
            if (obj.ColHidden(j) == false) {
                if (obj.FixedRows == 1) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                }
                if (obj.FixedRows == 2) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                }
                else if (obj.FixedRows == 3) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(2, j).toLowerCase());
                }
                else if (obj.FixedRows == 4) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(2, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(3, j).toLowerCase());
                }
            }
        }
    }

    //process tag 'neogrid'
    var arrGrid = new Array();

    arrGrid = doc.all.tags("neogrid");
    for (var i = 0; i < arrGrid.length; i++) {
        var obj = arrGrid[i].GetGridControl();
        for (var j = 0; j < obj.Cols; j++) {
            if (obj.ColHidden(j) == false) {
                if (obj.FixedRows == 1) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                }
                if (obj.FixedRows == 2) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                }
                else if (obj.FixedRows == 3) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(2, j).toLowerCase());
                }
                else if (obj.FixedRows == 4) {
                    str_temp += '!' + Trim(obj.TextMatrix(0, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(1, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(2, j).toLowerCase());
                    str_temp += '!' + Trim(obj.TextMatrix(3, j).toLowerCase());
                }
            }
        }
    }

    if (str_temp != "") {
        var b_exist = false;
        var arr_rtn = new Array;
        data = str_temp.split('!');
        for (var x = 0; x < data.length; x++) {
            if (data[x].length > 1 && data[x].toString() != 'undefined') {
                b_exist = false;
                for (var i = 0; i < arr_rtn.length; i++) {
                    if (data[x] == arr_rtn[i]) {
                        b_exist = true;
                    }
                }
                if (b_exist == false) {
                    arr_rtn[arr_rtn.length] = data[x];
                    str_return += data[x] + "!";
                }
            }
        }
        S_ArrDictAuto = arr_rtn;
        str_return = str_return.substr(0, str_return.length - 1);
        //S_ArrDictAuto = str_return.split('!');
    }
    return str_return;
}
//-----------------------------------------------------------------translate language-------------------------------------------------------------
function Translate(doc)
{
    if(S_Lang == "ENG") return;
    SetupLanguage(doc);
}

function Translate_V2(doc, ps)
{
	if (ps.length == 8)
		InitPermission(doc, ps);
	
    if(S_Lang == "ENG") return;
    SetupLanguage(doc);
}

function InitPermission(doc, ps){
	var tags_ps = new Array();
	tags_ps = doc.all.tags("DIV");
	var a_ps = [];
	a_ps["search"]  = (ps.substring(0, 1) == "0") ? "none" : "";
	//a["new"] 	= (ps.substring(1, 2) == "0") ? "none" : "";
	a_ps["new"] 	= (ps.substring(2, 3) == "0") ? "none" : "";
	a_ps["save"] 	= (ps.substring(2, 3) == "0") ? "none" : "";
	a_ps["delete"]  = (ps.substring(3, 4) == "0") ? "none" : "";
	a_ps["temp1"] 	= (ps.substring(4, 5) == "0") ? "none" : "";
	a_ps["temp2"] 	= (ps.substring(5, 6) == "0") ? "none" : "";
	a_ps["temp3"] 	= (ps.substring(6, 7) == "0") ? "none" : "";
	a_ps["process"] = (ps.substring(7, 8) == "0") ? "none" : "";
	
	for(var i=0;i<tags_ps.length;i++)
    {
		if(tags_ps[i].className == "buttons" && tags_ps[i].tp != undefined){
			switch(tags_ps[i].tp){
				default: break;
				case "search":
				case "new":
				case "save":
				case "delete":
				case "process":
					tags_ps[i].style.display = a_ps[tags_ps[i].tp.toString()];
				break;
			}
		}
	}
}

function SetupLanguage(doc)
{
    var tags = new Array();
	
	
	
    //legend 
    //process tag 'NOBR'
    tags = doc.all.tags("NOBR");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      s = Trim(tags[i].innerText);
      s2 = Trim(tags[i].innerHTML);
      if(s != "" && s == s2){
            tags[i].innerText= lookUpDictionary(s);
      }
    }
    
    //process tag 'legend'
    tags = doc.all.tags("LEGEND");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      s = Trim(tags[i].innerText);
      s2 = Trim(tags[i].innerHTML);
      //alert(s+":"+s2)
      if(s != "" && s==s2){
            tags[i].innerText=lookUpDictionary(s);
      }
    }
    
    //process tag 'font'
    tags = doc.all.tags("font");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      
      s = Trim(tags[i].innerText);
      s2 = Trim(tags[i].innerHTML);
      //alert(s+":"+s2)
      if(s != "" && s==s2){
            tags[i].innerText=lookUpDictionary(s);
      }
    }
    
    //process tag '<b>'
    tags = doc.all.tags("b");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      s = Trim(tags[i].innerText);
      s2 = tags[i].innerHTML;
      s2 = Trim(TrimHTMLSpace(s2));
         
      if(s !="" && s == s2){
            tags[i].innerHTML=lookUpDictionary(s);
      }
    }
    
    //process tag 'td'
    tags = doc.all.tags("TD");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      s = Trim(tags[i].innerText);
      s2 = tags[i].innerHTML;
      s2 = Trim(TrimHTMLSpace(s2));
         
      if(s !="" && s == s2){
            tags[i].innerHTML="<nobr>"+lookUpDictionary(s)+"&nbsp;</nobr>";
      }
    }
    
    //process tag 'label'
    tags = doc.all.tags("label");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      
      s = Trim(tags[i].text);
      if(s !=""){
            tags[i].text=lookUpDictionary(tags[i].text);
      }
    }
    
    //process tag 'SPAN'
    tags = doc.all.tags("SPAN");
    for(var i=0;i<tags.length;i++)
    {
      var s = new String();
      var s2 = new String();
      s = Trim(tags[i].innerText);
      s2 = Trim(tags[i].innerHTML);
      if(s != "" && s==s2 || (s2.indexOf("&amp;") > -1 && s.indexOf("&") > -1)){
            tags[i].innerText=lookUpDictionary(s);
      }
    }
    
    //process tag 'hyperlink'
    tags = doc.all.tags("A");
    for(var i=0;i<tags.length;i++)
    {
        if (tags[i].getAttribute("type") != "button") {
            var s = new String();
            var title = new String();

            s = Trim(tags[i].innerText);
            title = tags[i].title;
            if (s != "") {
                tags[i].innerText = lookUpDictionary(s);
                tags[i].title = lookUpDictionary(title);
            }
        }
    }
    
     //process tag 'imgbtn'
    tags = doc.all.tags("imgbtn");
    for(var i=0;i<tags.length;i++)
    {
      var alt = new String();
      
      alt = Trim(tags[i].alt);
      if(alt !=""){
            tags[i].SetHint(lookUpDictionary(alt));
      }
    }
    
    //process tag 'grid'
    var arrGrid = new Array();
    
    arrGrid = doc.all.tags("grid");
    for(var i=0;i<arrGrid.length;i++)
    {
       var obj=arrGrid[i].GetGridControl();
       for(var j=0;j<obj.Cols;j++)
       {
            if(obj.ColHidden(j) == false)
            {
               if(obj.FixedRows == 1){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
               }
               if(obj.FixedRows == 2){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j)); 
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
               }
               else if(obj.FixedRows == 3){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
                    obj.TextMatrix(2,j)=lookUpDictionary(obj.TextMatrix(2,j));
               }
               else if(obj.FixedRows == 4){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
                    obj.TextMatrix(2,j)=lookUpDictionary(obj.TextMatrix(2,j));
                    obj.TextMatrix(3,j)=lookUpDictionary(obj.TextMatrix(3,j));
               }
            }
       }
    }
    
    //process tag 'neogrid'
    var arrGrid = new Array();
    
    arrGrid = doc.all.tags("neogrid");
    for(var i=0;i<arrGrid.length;i++)
    {
       var obj=arrGrid[i].GetGridControl();
       for(var j=0;j<obj.Cols;j++)
       {
            if(obj.ColHidden(j) == false)
            {
               if(obj.FixedRows == 1){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
               }
               if(obj.FixedRows == 2){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j)); 
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
               }
               else if(obj.FixedRows == 3){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
                    obj.TextMatrix(2,j)=lookUpDictionary(obj.TextMatrix(2,j));
               }
               else if(obj.FixedRows == 4){
                    obj.TextMatrix(0,j)=lookUpDictionary(obj.TextMatrix(0,j));
                    obj.TextMatrix(1,j)=lookUpDictionary(obj.TextMatrix(1,j));
                    obj.TextMatrix(2,j)=lookUpDictionary(obj.TextMatrix(2,j));
                    obj.TextMatrix(3,j)=lookUpDictionary(obj.TextMatrix(3,j));
               }
            }
       }
    }
}
function lookUpDictionary(p_key)
{
    var i,j, tmp;
    p_key = Trim(p_key);
    if(p_key == null || p_key == "") return "";
  //alert(S_ArrFormDict)
    if(S_ArrFormDict.length > 0){
        //form dictionnary
        for(i=0;i<System.S_ArrFormDict.length;i++){
           tmp=System.S_ArrFormDict[i]; 
           if(tmp[0].toUpperCase()== p_key.toUpperCase()){
             if(tmp[1] == "" ){
                    //general dictionnary
                    for(j=0;j<System.S_ArrDict.length;j++){
                       tmp=System.S_ArrDict[j]; 
                       if(tmp[1].toUpperCase()== p_key.toUpperCase()){
                         if(tmp[2] == "" ){
                            return tmp[1];
                         }
                         else{
                            return tmp[2];
                         }
                       }
                    }
             }
             else{
                return tmp[1];
             }
           }
         }  
        //general dictionnary
        for(i=0;i<System.S_ArrDict.length;i++){
           tmp=System.S_ArrDict[i]; 
           if(tmp[1].toUpperCase()== p_key.toUpperCase()){
             if(tmp[2] == "" ){
                return tmp[1];
             }
             else{
                return tmp[2];
             }
           }
        }
    }
    else{
        //general dictionnary
        for(i=0;i<System.S_ArrDict.length;i++){
           tmp=System.S_ArrDict[i]; 
           if(tmp[1].toUpperCase()== p_key.toUpperCase()){
             if(tmp[2]==""){
                return tmp[1];
             }
             else{
                return tmp[2];
             }
           }
        }
    }
    return p_key;
}
function Trim(sent){
	var S=new String(sent);
	S=S.replace(/^\s+/,"");
	return S.replace(/\s+$/,"");
}
function TrimHTMLSpace(sent){
    return sent=sent.replace(/&nbsp;/g,"");
}
//------------------------------------------------------------------Ajax module-----------------------------------------------
var xhttp;
var _obj,_sql_id,_command_type;
var _arrInputCtrl = new Array();
var _arrOutputCtrl = new Array();
var _arrSearchCtrl = new Array();
var _parameter = new Array();
var _select_sql_id="",_fromrow=0,_torow=0;
var _dsoType;
var _function, _procedure;
var _element=null;
var _func;
var _grdCtrl=null;

function ResetData(){
    _arrInputCtrl = new Array();
    _arrOutputCtrl = new Array();
    _arrSearchCtrl = new Array();
    _parameter = new Array();
}
function GetDataBinding(){
    ResetData();
    var dso = _element.childNodes(0).XMLDocument.childNodes(0);
	var list =  dso.childNodes;
   //alert(_element.parameters)
    _arrInputCtrl = _element.inputs;
    _arrOutputCtrl = _element.outputs;
    _arrSearchCtrl = _element.searchs;
    _parameter = _element.parameters;
   //alert(_parameter)
    _function=dso.getAttribute("function");
    _procedure=dso.getAttribute("procedure");
    _dsoType=dso.getAttribute("type");
    //alert(_dsoType)
    
}
function Send(ctrl, func ){   
     
     _element=ctrl;
     if(func)
     {
        _func=func;
     }
     else
     {
        _func="UPDATE";
     }
     
     GetDataBinding();
    
    var strXML="";
    strXML=buildXML();  
    
    if(strXML == "" || strXML == null){
        window.status = "Please check your input data.";
        System.HideProgress();
        return;
    } 
    
    
    //alert(strXML)
      // to see if we are running in IE 
      if (document.all){ 
        xhttp = new ActiveXObject("Msxml2.XMLHTTP"); 
      } 
      else{ 
      // Mozilla - based browser 
        xhttp = new XMLHttpRequest(); 
      }
      //alert(S_UserID);
      //hook the event handler
      xhttp.onreadystatechange = HandlerOnReadyStateChange;
      //prepare the call, http method=GET, false=asynchronous call
	  //alert("../system/DSOHandler.ashx?dso_type="+_dsoType+"&action="+_func);
      xhttp.open("POST","../system/DSOHandler.ashx?dso_type="+_dsoType+"&action="+_func, true);
	  //xhttp.open("POST","http://127.0.0.1/demo/system/DSOHandler.ashx?dso_type="+_dsoType+"&action="+_func, true);
      
      // Tell the server you're sending it XML
      xhttp.setRequestHeader("Content-Type", "text/xml");
      //finally send the call
      
      Logging("Send: "+strXML);
      xhttp.send(strXML);          
}
function HandlerOnReadyStateChange(){
    
    if (xhttp.readyState == 4){
      //responseXML contains an XMLDOM object
      //var nodes = xhttp.responseXML.selectNodes("//root");
      //alert(xhttp.responseText);
     
      var text = xhttp.responseText;
      var xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
      xmlDoc.async="false";
      xmlDoc.loadXML(text);
      
      //window.clipboardData.setData( "Text", xhttp.responseText);
      //nodes = xhttp.responseXML;
       //alert(xmlDoc.xml + ":" + _function)
       _element.Retrieve(xmlDoc);
   }
}
function buildXML(){
   if(_dsoType == "array" || _dsoType == "table")
   {
        return GetDataFromArray();
   }
   else if(_dsoType == "grid" || _dsoType == "tree"){
       return GetDataFromGrid();
   }
   else if(_dsoType == "control"){
        return GetDataFromControl();
   }
   else if(_dsoType == "process"){
        return GetDataFromControl2();
   }
   else if(_dsoType == "list"){
        return GetDataFromControl2();
   }
   return "";
}    
function GetDataFromArray(){
    var xml="", parameter="", row="";
    var i,j;
    if(_arrSearchCtrl!=null){  
        for(i=0 ; i< _arrSearchCtrl.length ; i++){   
            var obj=_arrSearchCtrl[i];
           
            parameter += obj.GetData()+"|!";
        }
        parameter=parameter.substr(0,parameter.length-2);
        
        if(parameter.length == 0 && _arrSearchCtrl.length > 0){
            parameter = " ";
        }
    }
    else{
        parameter = "";
    }
   // alert(parameter)
    if(_func == "SELECT"){
        xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter></data>";
    }
    else{
        /*
        var grdCtrl = _arrInputCtrl[0];
        for(i=1 ; i< grdCtrl.rows ; i++ ){
              if(grdCtrl.GetRowStatus(i) == 16){
                  row=row+"<row><![CDATA[UPDATE|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            if(grdCtrl.Validate(i,j)){
                                row=row+grdCtrl.GetGridData(i,j)+"|!";
                            }
                            else{
                                return "";
                            }
                       }
                  }
                  row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
              else if(grdCtrl.GetRowStatus(i) == 32 || grdCtrl.GetRowStatus(i) == 48){
                  row=row+"<row><![CDATA[INSERT|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            if(grdCtrl.Validate(i,j)){
                                row=row+grdCtrl.GetGridData(i,j)+"|!";
                            }
                            else{
                                return "";
                            }
                       }
                  }
                  row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
              else if(grdCtrl.GetRowStatus(i) > 48){
                  row=row+"<row><![CDATA[DELETE|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            row=row+grdCtrl.GetGridData(i,j)+"|!";
                       }
                  }
                 row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
        }
        */
        xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter><rows>"+row+"</rows></data>";
    }
   return xml;
}

function GetDataFromGrid(){
    var xml="", parameter="", row="";
    var i,j;
    if(_arrSearchCtrl!=null){  
        for(i=0 ; i< _arrSearchCtrl.length ; i++){   
            var obj=_arrSearchCtrl[i];
           
            parameter += obj.GetData()+"|!";
        }
        parameter=parameter.substr(0,parameter.length-2);
        
        if(parameter.length == 0 && _arrSearchCtrl.length > 0){
            parameter = " ";
        }
    }
    else{
        parameter = "";
    }
   // alert(parameter)
    if(_func == "SELECT"){
        xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter></data>";
    }
    else{
        var grdCtrl = _arrInputCtrl[0];
        for(i=1 ; i< grdCtrl.rows ; i++ ){
              var status = grdCtrl.GetRowStatus(i);
              if(status == 16){
                  row=row+"<row><![CDATA[UPDATE|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            if(grdCtrl.Validate(i,j)){
                                row=row+grdCtrl.GetGridData(i,j)+"|!";
                            }
                            else{
                                return "";
                            }
                       }
                  }
                  row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
              else if(status == 32 || status == 48){
                  row=row+"<row><![CDATA[INSERT|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            if(grdCtrl.Validate(i,j)){
                                row=row+grdCtrl.GetGridData(i,j)+"|!";
                            }
                            else{
                                return "";
                            }
                       }
                  }
                  row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
              else if(status > 48){
                  row=row+"<row><![CDATA[DELETE|!";
                  for(j=0;j< grdCtrl.cols;j++){
                       if(InParameterList(j)){
                            row=row+grdCtrl.GetGridData(i,j)+"|!";
                       }
                  }
                 row = row.substr(0,row.length-2);
                  row=row+"]]></row>";
              }
        }
        
        xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter><rows>"+row+"</rows></data>";
    }
   return xml;
}

function  GetDataFromControl()
{
    var xml="", parameter="", row="";
    var i,j;
    if(_arrSearchCtrl!=null){  
        for(i=0 ; i< _arrSearchCtrl.length ; i++){   
            var obj=_arrSearchCtrl[i];
            parameter += obj.GetData()+"|!";
        }
        parameter=parameter.substr(0,parameter.length-2);
    }
    
    if(_func == "SELECT"){
        xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter></data>";
    }
    else{
          var status = _element.GetStatus();
          if( status == 10){
              row +="<row><![CDATA[UPDATE|!";
              for(i=0;i< _arrInputCtrl.length ; i++){
                     //if( _arrInputCtrl[i].Validate() ){
                        row += _arrInputCtrl[i].GetData() + "|!";
                     /*}
                     else{
                        return "";
                     }*/
              }
              row = row.substr(0,row.length-2);
              row +="]]></row>";
          }
          else if(status == 20){
              row +="<row><![CDATA[INSERT|!";
              for(i=0;i< _arrInputCtrl.length ; i++){
                     //if( _arrInputCtrl[i].Validate() ){
                        row += _arrInputCtrl[i].GetData() + "|!";
                     /*}
                     else{
                        return "";
                     }*/
              }
              row = row.substr(0,row.length-2);
              row +="]]></row>";
          }
          else if(status == 40){
              row +="<row><![CDATA[DELETE|!";
              for(i=0;i< _arrInputCtrl.length ; i++){
                 row +=_arrInputCtrl[i].GetData()+"|!";
              }
              row = row.substr(0,row.length-2);
              row +="]]></row>";
          }
          else{
               _function = "SELECT";
               xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter></data>";  
               return xml;
          }
          xml="<data><function>"+_function+"</function><procedure>"+_procedure+"</procedure><parameter><![CDATA["+parameter+"]]></parameter><rows>"+row+"</rows></data>";
    }
   return xml;
}
//from data control with type=process,list
function  GetDataFromControl2(){
          var input ="<input><![CDATA[";
          var i;
          for(i=0;i< _arrInputCtrl.length ; i++){
             input=input+_arrInputCtrl[i].GetData()+"|!";
          }
          input = input.substr(0,input.length-2);
          if(input == "<input><![CDATA[") input = "<input><![CDATA[ ";
          input +="]]></input>";
          
          if(_arrInputCtrl.length == 0){
            input ="<input></input>"
          }
          
          var output ="<output><![CDATA[";
          for(i=0;i< _arrOutputCtrl.length ; i++){
             output = output + _arrOutputCtrl[i].GetData()+"|!";
          }
          output = output.substr(0,output.length-2);
          output +="]]></output>";
          
          var xml="<data><procedure>"+_procedure+"</procedure><inputs>" + input + "</inputs><outputs>" + output + "</outputs></data>";
          
          return xml;
}

function InParameterList(col){
  if(_parameter == null) return true;
 
  for(var i=0;i<_parameter.length;i++){
    if(_parameter[i] == col){
        return true;
    }
  }
  return false;
}


//------------------------------------------------------------------------------------------------------------------------------------
