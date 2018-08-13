<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name = "<%=Session("USER_NAME")%>" ;
    
//===================================================================================

 function OnSearch(pos) 
 {	  
    if ( pos == 'mst' )
    {
            data_htfo00100.Call("SELECT");   
    }
	if ( pos == 'dtl' )
    {
        if ( grdMst.row > 0 )
        {
            txtRoomAllocatePK.text = grdMst.GetGridData( grdMst.row, 0);
            data_htfo00100_1.Call("SELECT");
        } 
		else
		{
			grdDtl.ClearData();
		}		
    }
      
 }

//===================================================================================

 function BodyInit()
 {
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE,CODE ||'-'|| NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and use_yn='Y' and del_if=0 ORDER BY CODE")%>|ALL|Select All";
	lstLocation.SetDataText(data);
	lstLocation.value='ALL';
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FEES' and del_if=0 UNION SELECT 'ALL','Select All' FROM DUAL) A ORDER BY CODE DESC")%>";
	lstTableName.SetDataText(data);
	lstTableName.value='ALL';
	OnSearch('mst');
 }
 
//===================================================================================
 
 function OnDataReceive(obj)
 {
	
		grdDtl.Subtotal( 1, 2,-1, '6!8');
	if ( obj.id== 'data_htfo00100')
	{
		if (grdMst.rows > 1)	
		{
				
		}	    
	}
 }
 
//===================================================================================
 

//=====================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00100" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60280050_mst" >
				<input  bind="grdMst">
                    <input bind="txtRoomGuest" /> 
				</input> 
                <output bind="grdMst" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00100_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60280050_dtl" >
                <input  bind="grdDtl">
                    <input bind="txtRoomAllocatePK" />
					<input bind="txtid_by" />
					<input bind="lstTableName" />
					<input bind="lstLocation" />
                </input> 
                <output bind="grdDtl" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                           Room#/Guest Name:
                        </td>
                        <td style="width: 25%; white-space: nowrap" align="center">
                          <gw:textbox id="txtRoomGuest" styles="width: 100%" onenterkey="OnSearch('mst')" />  
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap"></td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Service Name:
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstTableName" onchange="OnSearch('dtl')" />
                        </td>
						<td align="right" style="width: 10%; white-space: nowrap">
                            Location
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstLocation" onchange="OnSearch('dtl')" />
                        </td>

                    </tr>
                    <tr style="height: 98%">
                        <td colspan="2">
                            <gw:grid id='grdMst'
								header='_pk|RM#|RM Type|Last Name|_FirstName|Checkin Date|Group Name'
								format='0|0|0|0|0|4|0'
								aligns='0|0|0|0|0|0|0'
								check='||||||'
								editcol='0|0|0|0|0|0|0'
								widths='1000|1000|1000|1000|1000|1000|1000'
								acceptnulldate="T" sorting='T' autosize='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('dtl')" />
                        </td>
						<td colspan="5">
                            <gw:grid id='grdDtl' header='_pk|_TableName|Invoice Date|Invoice#|Post To|Item|Amount(VND)|Ex_Rate|Amount USD|Pay YN|Location|Create By|Create Date|Modify By|Modify Date'
							format='0|0|4|0|0|0|-0|-0|-2|0|0|0|0|0|0' 
							aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							defaults='||||||||||||||' 
							editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							sorting='T' styles='width:100%; height:100%' autosize="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
    </table>
    <gw:textbox id="txtRoomAllocatePK" styles='width:100%;display:none' />
	<gw:textbox id="txtid_by" styles='width:100%;display:none' />
	<gw:textbox id="EMPLOYEE_PK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
