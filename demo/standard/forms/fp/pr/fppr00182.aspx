<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get One Process</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>


 //---------------------------------------------------------
  
function BodyInit()
{
    System.Translate(document); 
    var tco_stitem_pk;
    
    line_pk = "<%=Request.querystring("line_pk")%>";   
     
    var data = ""; 
    data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
    lstSlipLine.SetDataText(data);   
    lstSlipLine.value = line_pk;
    
    
}

//-----------------------------------------------------------------------------------------------

function OnSelect()
{
    var code_data = new Array()
    
    code_data[0]= lstSlipLine.value ;
    window.returnValue = code_data; 
    this.close(); 	
} 
//==============================================================
function OnCancel()
{
    var code_data = new Array()
    
    for( j=0 ; j < grdProcess.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 		
}  
//==============================================================
</script>

<body>

    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="0">
        <tr style="height: 2%">
            <td style="width:20%" align="right">
                To Line
            </td>
            <td style="width:80%">
                <gw:list id="lstSlipLine" styles='width:100%' csstype="mandatory" />
            </td>
            
        </tr>
        <tr style="height: 2%" >
            <td align="center"  colspan="2">
                <gw:icon id="idBtnOutgo" img="2" text="OK" styles='width:20%' onclick="OnSelect()" />
            </td>
        </tr>
        <tr style="height: 2%" >
            <td align="center"  colspan="2">
               
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txtSTitemPK" styles="display:none" />
    <!--------------------------------------------->
</body>
</html>
