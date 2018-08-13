<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Other Fees</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var COL_PK			        = 0,
	COL_REFUND_AMT  	    = 1,
	COL_REFUND_DESCRIPTION   = 2,
	COL_EX_RATE   = 3;

 function BodyInit()
 {    
   txtRoomNo.SetReadOnly(true);
   txtGuestName.SetReadOnly(true);
   txt_room_allocate_pk.text = '<%=Request.QueryString("p_master_pk") %>';     
   //txtGuestName.text = '<%=Request.QueryString("p_golfer_name") %>';
   txtRoomNo.text = '<%=Request.QueryString("p_room_no") %>';   
   txtExRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_sell_ex_rate('"+Session("COMPANY_PK")+"','USD') from dual")%> VND";
   dso_other_getfullname.Call();
 }

function OnSave(){
    //if(OnValid()){
        dso_other_fee.Call();
   // }
}
function OnValid(){
    for(var x = 1; x < idGrid.rows; x++)
	{
        if(idGrid.GetGridData(x, COL_REFUND_AMT) == "")
		{
            alert("Please input data for column 'Refund Amount' row => " + idGrid.GetGridData(x, COL_REFUND_AMT) + " !" ); 
			return false;
        }
		if(idGrid.GetGridData(x, COL_REFUND_DESCRIPTION) == "")
		{
            alert("Please input data for column 'Refund Decription Local' row => " + idGrid.GetGridData(x, COL_REFUND_DESCRIPTION) + " !" ); 
			return false;
        }
		
	}
    return true;
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_other_getfullname')
	{	
		dso_other_fee.Call("SELECT");
	}
}
</script>
<body>
    <gw:data id="dso_other_fee" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2" function="st_ht_sel_60250020_refund_deposit" procedure = "st_ht_upd_60250020_refund_deposit">
                <input bind="idGrid" >
                    <input bind="txt_room_allocate_pk"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
     <!------------------------------------------------------------------------------------->
    <gw:data id="dso_other_getfullname" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="process" procedure="st_ht_PRO_60250020_getfullname" > 
			<input>
				 <input bind="txt_room_allocate_pk" /> 
			</input> 
			<output> 
				<output bind="txtGuestName"/>
			</output>
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------->

    <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr style="height: 6%" valign="top">
            <td style="background: white;">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 2%" valign="top">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 15%" align="center">
                                        Guest Name
                                    </td>
                                    <td style="width: 35%">
                                        <gw:textbox id="txtGuestName" styles="width:100%" /> 
                                    </td>
                                    <td style="width: 15%" align="center">
                                        Room No
                                    </td>
                                    <td style="width: 5%">
                                        <gw:textbox id="txtRoomNo" styles="width:100%" />
                                    </td>
                                    <td style="width:30%"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%" valign="top">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 20%">
                                        Ex. RATE : <gw:textbox id="txtExRate" styles="width: 70px;border:none;color:red;font-weight:bold;" readonly="true" />
                                    </td>
                                    <td style="width: 71%">
                                        Total : <gw:textbox id="txtTotal" styles="width: 100;border:none;color:red;font-weight:bold;" readonly="true" />
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn img="new" alt="New" id="idBtnAdd" styles="width:100%; display:none" onclick="OnAddNew()" /> 
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn img="save" alt="Save" id="idBtnUpdate" styles='width:100%' onclick="OnSave()" />
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn img="delete" alt="Delete" id="idBtnDelete" styles="width:100%; display:none" onclick="OnDelete()" />
                                    </td>
									<td width="3%" align="right">
										<gw:imgbtn id="ibtnReport" img="printer" styles="width:100%; display:none" alt="Print" onclick="OnReport()" />
									</td>	

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%" valign="top">
                        <td>
                            <gw:grid id="idGrid" 
                                header      ="_THT_ROOM_ALLOCATE_PK|Refund Amount|Refund Description"
                                format      ="0|-0|0" 
                                aligns      ="1|0|0" 
                                defaults    ="||" 
                                editcol     ="0|1|1" 
                                widths      ="1000|1000|1000" 
                                styles      ="width:100%; height:350" 
                                sorting     ="T" 
                                autosize    ="T"                                
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtMasterPK"    styles="width:100%; display:none" />
    <gw:textbox id="txtTempValue"   styles="width:100%; display:none" />
    <gw:textbox id="txt_room_allocate_pk" styles="width:100%; display:none" />
</body>
</html>
