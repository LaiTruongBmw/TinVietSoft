<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>

<!-- #include file="lib/form.inc"  -->
<html>
<script>
var theApp, theNameSpace, theMailItem
var attach = "c:\\ctl_error\\errorlog.txt";
var recipient = "hct_vn@hotmail.com";
var subject = "test";
var msg = "This is a test message";
var strProcedure, strDetail, strDescription, strErrorMsg;

function BodyInit(){

    var strShowButton;
    var lang = '<%=Session["SESSION_LANG"]%>';
    
    if (System.ErrorData!=null){
        //txtErrorCode.text=System.ErrorData.errno;
        strErrorMsg = System.ErrorData.errmsg; 
        var arrTemp = strErrorMsg.split(":");
        txtErrorCode.text = arrTemp[0].substr(4,5);
        
        if ((Number(txtErrorCode.text) >= 20000) && (Number(txtErrorCode.text) <20999)){
           dsoGetApplicationError.Call("SELECT");        
        }         
        else{      
            
            txtaDetail.SetDataText(strErrorMsg);
            strErrorMsg = arrTemp[1];
            
            if(strErrorMsg.indexOf("ORA-") > 0){
                strErrorMsg = strErrorMsg.substr(0,strErrorMsg.length - 9);
                if(Trim(strErrorMsg) == ""){
                    strErrorMsg = System.ErrorData.errmsg;
                }
            }
            
            txtaDescription.SetDataText(strErrorMsg);
            txtaLDescription.SetDataText(strErrorMsg);
            txtaFDescription.SetDataText(strErrorMsg);
            
        }
    }
    lstLanguage.SetDataText(lang);
    DisplayError(lang);
    txtaDetail.SetReadOnly(true);    
}
function SaveLog(){
    
}
function SendMail(){ 
    
}    

function sendmail (recipient, subject, msg, attach){
    
} 
function DisplayError(p_language){
    if(p_language == "ENG"){
        document.all("divDescription").style.display="";
        document.all("divLDescription").style.display="none";
        document.all("divFDescription").style.display="none";
    }
    else if(p_language == "VIE"){
        document.all("divDescription").style.display="none";
        document.all("divLDescription").style.display="";
        document.all("divFDescription").style.display="none";
    }
    else{
        document.all("divDescription").style.display="none";
        document.all("divLDescription").style.display="none";
        document.all("divFDescription").style.display="";
    }
}
function OnDataReceive(p_oData){
    
    if(p_oData.id == "dsoGetApplicationError"){
        BindDataToControls('3');
    }   
}
function BindDataToControls(strData){
    var strDes;
    strDes = "";
    if (strData=='3'){
        if(grdError.rows > 1){
            
            switch(grdError.GetGridData(1,5)){   
                case 10:    //Oracle Error
                    document.getElementById("imgApp").setAttribute("src","images/ico-query.gif");        
                    break;                
                case 20:     //ADO Error
                    document.getElementById("imgApp").setAttribute("src","images/ico-error.gif");        
                    break;
                case 30:     //User Define Error
                    document.getElementById("imgApp").setAttribute("src","images/ico-information.gif");                        
                    break;
                default:
                    document.getElementById("imgApp").setAttribute("src","images/ico-query.gif");        
                    break;                    
            };            
            var customMsg = strErrorMsg.split(":");
            var xx;
            if(customMsg.length >2){
                xx = customMsg[2].split("\n");
            }
            else{
                xx = customMsg[1].split("\n");
            }
            
            
            txtaDescription.SetDataText(txtErrorCode.text+":"+ grdError.GetGridData(1,2)+ " <<"+xx[0]+">>\r"
                                        + "Cause: " + grdError.GetGridData(1,8) +"\r"
                                        + "Action: " + grdError.GetGridData(1,9));
                                        
            txtaLDescription.SetDataText(txtErrorCode.text+":"+ grdError.GetGridData(1,3) + " <<"+xx[0]+">>\r"
                                        + "Cause: " + grdError.GetGridData(1,10) +"\r"
                                        + "Action: " + grdError.GetGridData(1,11));
            txtaFDescription.SetDataText(txtErrorCode.text+":"+ grdError.GetGridData(1,4) + " <<"+xx[0]+">>\r"
                                        + "Cause: " + grdError.GetGridData(1,12) +"\r"
                                        + "Action: " + grdError.GetGridData(1,13));
            
            txtaDetail.SetDataText(strErrorMsg);                                         
        } 
    }
}
function OnLanguageChange(){
    DisplayError(lstLanguage.GetData());
}
var gButtonName="";
function OnButtonClick(p_oControl){
    
    window.close();
}
function OnBodyClose(){
    System.ErrorData=null;
    if (window.returnValue==null){
         window.returnValue = "CANCEL";   
    }
}
function OnDetailClick(){
    if(document.all("divDetail").style.display == ""){
        document.all("divDetail").style.display = "none";
        document.getElementById("imgDetail").setAttribute("src","images/down.gif");
        window.self.resizeTo(800,400);
    }
    else{
        document.all("divDetail").style.display = "";       
        document.getElementById("imgDetail").setAttribute("src","images/up.gif");
        //self.resizeTo(800,600);
        window.self.resizeBy(800,600);
    }    
}
function show_popup(){
    var p=window.createPopup();
    var pbody=p.document.body;
    //pbody.style.backgroundColor="lime";
    pbody.style.border="solid black 1px";
    pbody.innerHTML="This is a pop-up! Click outside the pop-up to close.";
    p.show(150,150,200,50,document.body);
}

</script>
<body onunload="OnBodyClose()">
<gw:data id="dsoGetApplicationError"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid" function="ctl.sp_get_error_code" > 
                <input> 
                    <input bind="txtErrorCode" /> 
                </input> 
                <output bind="grdError" /> 
            </dso> 
        </xml> 
</gw:data> 
	<table width=100%>
	    <tr>
	        <td style="font-weight:bold" width=5% ><img name="ButtonShow" id="imgApp" src="images/iconapplication.gif" style="height:20px"/></td>
	        <td width=95% align=right>
	            <gw:list id="lstLanguage" onchange="OnLanguageChange()">
	                <data>Data|ENG|English|VIE|Vietnamese|KOR|Korean</data>
	            </gw:list>
	        </td>
	    </tr>
	    <tr valign=top>
	        <td colspan=2>
	          <div id="divDescription" >
	            <gw:textarea id="txtaDescription" styles="width:100%; height:150px" />
	          </div>
	          <div id="divLDescription" >
	            <gw:textarea id="txtaLDescription" styles="width:100%; height:150px" />
	          </div>
	          <div id="divFDescription" >
	            <gw:textarea id="txtaFDescription" styles="width:100%; height:150px" />
	          </div>	          
	        </td>
	    </tr>
	    <tr>
	        <td colspan=2 align=right><a href="#" onclick="OnDetailClick()" ><b>Detail</b></a><img alt="Details" id="imgDetail" src="images/down.gif" onclick="OnDetailClick()"/></td>
	    </tr>
	    <tr valign=top>
	        <td colspan=2>
	          <div id="divDetail" style="display:none">
	            <gw:textarea id="txtaDetail" styles="width:100%; height:200px;" />
	          </div>
	        </td>
	    </tr>
	    <tr>
	       <td colspan=2>
	            <table width=100%>
	                <tr align=center>
	                    <td align="center" id="td1"><gw:icon id="icoOK" text="OK" onclick="OnButtonClick(this)"/></td>
	                </tr>
	            </table>
	       </td>
	    </tr>
	</table>
	
    <gw:textbox id="txtErrorCode" styles="display:none" />

<gw:grid   
    id="grdError"  
    header="PK|Error Code|Error Type|Description|Local Description|Foreign Description|Use Y/N|Remark|cause|action|lcause|laction|fcause|faction"   
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    defaults="|||||||||||||"  
    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    styles="width:100%; height:200;display:none"   
    sorting="F"   
    param="0,1,2,3,4,5,6,7,8,9,10,11,12,13"  /> 

</body>
</html>
