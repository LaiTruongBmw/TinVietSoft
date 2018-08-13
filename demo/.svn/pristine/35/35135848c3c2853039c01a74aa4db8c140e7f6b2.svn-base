<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<%  CtlLib.SetUser("CRM")%>

<script>
 
 function BodyInit()
 {
	dtDate.value = "<%=Request.QueryString("p_date")%>" ;
    txtType.text  = "<%=Request.QueryString("p_room_type")%>" ;

	dtDate.SetEnable(false);
	
   dsoDetail.Call("SELECT");
 }
//=========================================================================
 function OnDataReceive(dso){
    
 }
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoDetail" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="crm.sp_sel_htrm00010_allotment" >
                <input  bind="grdDetail">
                    <input bind="dtDate" />
					<input bind="txtType" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
					    <td align="right" style="width:5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width:10%; white-space: nowrap">
                            <gw:datebox id="dtDate" lang="1" styles="display: none" />
                        </td>
                        <td align="right" style="width:15%; white-space: nowrap">
                           
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            
                        </td>
                        <td align="right" style="width:15%; white-space: nowrap">
                            
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            
                        </td>
						<td align="right" style="width:15%; white-space: nowrap">
                            
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            
                        </td>
						<td style="width: 4%"></td>
						<td style="width: 3%" align="right">
							
						</td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan=9>
                <gw:grid id='grdDetail' 
				    header='Company name|From date|Date to|Contract no|Room type|Total allotment|Used qty|Available allotment qty'
                    format='0|4|4|0|0|-0|-0|-0'
					aligns='0|0|0|0|0|3|3|3'
                    sorting='T' styles='width:100%; height:100%'
                    autosize="T" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtType" styles="display: none" />
</body>

</html>
