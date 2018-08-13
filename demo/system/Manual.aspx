<html>
<script>
var lang = "<%=Session("SESSION_LANG")%>";
var url = "<%=Request.QueryString("url")%>";

function BodyInit()
{
   lstLang.value = lang;
   OnLangChange();
}
function SetTitle( s )
{
	document.title = s;
	idtitle.innerText = s;
}
function OnLangChange()
{
    var url2="";
    lang = lstLang.value;
    url2=url.replace(".aspx","_"+ lang +".mht");
    
    idFrame.document.location.href = url2;
    
}
function OnPrintPreview(OLECMDID) {
	try {
         var PROMPT = 1;
         var oWebBrowser = frames["idFrame"].document.getElementById('WebBrowser1');
	        if(oWebBrowser == null) {
		        var sWebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
 	            frames["idFrame"].document.body.insertAdjacentHTML('beforeEnd', sWebBrowser); 
		        oWebBrowser = frames["idFrame"].document.getElementById('WebBrowser1');
	        }
	        oWebBrowser.ExecWB(OLECMDID,PROMPT);
	    }
        catch(e){alert('Printing failed!' + e.message);}
}
function OnPrint()
{
  frames["idFrame"].focus();
  frames["idFrame"].print();
}
function OnClose()
{
    this.close();
}
</script>
<body  onload="BodyInit()" style="margin:0 0 0 0; padding:0 0 0 0">
    <table width="100%" height="100%" >
        <tr bgcolor="#33ccff">
            <td width="5%"><button onclick="idFrame.window.history.back()" > Back </button></td>
	        <td width="5%"><button onclick="idFrame.window.history.forward()" > Forward </button></td>
            <td width="40%" align="center" id="idtitle"></td>
            <td width="10%"><button onclick="OnPrintPreview(8)" > Page Setup</button></td>
            <td width="10%"><button onclick="OnPrintPreview(7)" > Print Preview</button></td>
            <td width="5%"><button onclick="OnPrint()" > Print </button></td>
            <td width="10%"><b>Language</b></td>
            <td width=10%>
                <select name="lstLang" onchange="OnLangChange()" >
                    <option value="ENG">English</option>
                    <option value="VIE">Vietnamese</option>
                    <option value="KOR">Korean</option>
                </select>
            </td>
            <td width="5%"><button onclick="OnClose()">Close</button></td>
        </tr>
        <tr>
            <td height="100%" colspan="9">
                <iframe id="idFrame" frameborder="0" style="width:100%; height: 100%"></iframe>
            </td>    
        </tr>
    </table>
    
</body>
