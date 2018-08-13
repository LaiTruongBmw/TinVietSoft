<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/R Closing</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript"> 
 
//=======================================================================

function BodyInit()
{
    System.Translate(document);    	
 
    //-------------------------
	txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
	
	txtUser_PK.text  = "<%=Session("USER_PK")%>";
	//-------------------------
	pro_epbp00152_1.Call();
	//-------------------------
}  
 
 //=======================================================================
 function OnProcess(pos)
{
    switch(pos)
    {
        case 'CLOSE':            
            if ( confirm("Do you want to close/unclode this slip ?") )
            {      
			
				pro_epbp00152_2.Call();
			   
            }    
            else
            {
                alert("Error.");
            }
        break;
		 
    }
}
//=======================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case 'pro_epbp00152_2':
					 
			window.close();
			
		break;
		
		case 'pro_epbp00152_1':
		
			if ( txtCloseYN.text == 'Y' )
			{
				idBtnClose.text = 'UnClose' ;
			}
			else
			{
				idBtnClose.text = 'Close' ;
			}
		break;
   }   
}
//=======================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_epbp00152_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00152_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="lbContent" />
					<output bind="txtCloseYN" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->
    <gw:data id="pro_epbp00152_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_epbp00152_2" > 
                <input>
					 <input bind="txtMasterPK" />				 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width:100%;height:50%" >
        <tr>
			<td align="right" style="width: 100%" colspan=4 >
               <gw:label id="lbContent" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
            </td>            
		</tr>		 
		<tr>			
			<td></td>
			<td align="center" style="width: 20%">
               <gw:button id="idBtnClose" img="Close" text="Close" onclick="OnProcess('CLOSE')" />
            </td>
			<td align="center" style="width: 20%">
               <gw:button id="idBtnCancel" img="cancel" text="Cancel" onclick="window.close()"/>
            </td>	
			<td></td>			
		</tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtCloseYN" styles="width:100%; display:none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------->
</html>
