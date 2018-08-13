<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Move Bills to Another Room</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script> 
//G2 is grdServiceFeeAll
//G3 is grdFolio
var G1_pk=0,
	G1_table_name=1,
	G1_invoice_date=2,
	G1_invoice_id=3,
	G1_item=4,
	G1_amount=5,
	G1_ex_rate=6,
	G1_amount_usd=7,
	G1_crt_by=8,
	G1_crt_dt=9,
	G1_mod_by=10,
	G1_mod_dt=11;

var  G2_pk=0,
	 G2_tht_room_allocate_pk=1,
	 G2_tht_room_allocate_pk_2=2,
	 G2_table_name=3,
	 G2_table_pk=4,
	 G2_invoice_date=5,
	 G2_invoice_id=6,
	 G2_item=7,//description
	 G2_amount=8,
	 G2_ex_rate=9,
	 G2_amount_usd=10,
	 G2_move_bill_date=11;
	 
function BodyInit()
{
	BindingDataList();
	//dso_htbk00030_mst.Call('SELECT');	
}
function BindingDataList()
{
	txt_room_allocate_pk.text = '<%=Request.QueryString("p_room_allocate_pk") %>';
	txtRoomNo.text = '<%=Request.QueryString("p_room_no") %>';
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FEES' and del_if=0 and code in('THT_SPECIAL_SERVICE_USED','THT_OTHER_FEES','THT_PHONE_DATA','TCM_INVOICE') UNION SELECT 'ALL','SELECT ALL' FROM DUAL) A ORDER BY CODE DESC")%>";
	lstServiceType.SetDataText(data);
	lstServiceType.value='ALL';
	OnSearch('All_Services');
	//data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FOLIO' and del_if=0) A ORDER BY CODE")%>";
	//lstFolioType.SetDataText(data);
	
	
}
function OnSearch(n)
{
	switch(n)
	{
		case 'All_Services':
			dso_htfo00040_all_fees.Call("SELECT");   
		break;
		case 'Folio':
			dso_htfo00040_fee_folio.Call('SELECT');
		break;
	}
}
function OnSave()
{
	dso_htfo00040_fee_folio.Call();
}
function OnSelectServices()
{	
		if(txtRoomNo2.text=="")
		{
			alert("Please,choose room# to move bill.");
			return false;
		}
		if (grdServiceFeeAll.row == '-1')
		{
			return;
		}
		if (txtRoomNo.text != '')
		{		
				grdFolio.AddRow();
				grdFolio.SetGridText(grdFolio.rows-1, G2_tht_room_allocate_pk, txt_room_allocate_pk.text);//
				grdFolio.SetGridText(grdFolio.rows-1, G2_tht_room_allocate_pk_2, txt_room_allocate_pk2.text);//
				grdFolio.SetGridText(grdFolio.rows-1, G2_table_name,	       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_table_name));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_table_pk,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_pk));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_invoice_date,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_invoice_date));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_invoice_id,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_invoice_id));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_item,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_item));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_amount,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_amount));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_ex_rate,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_ex_rate));//
				grdFolio.SetGridText(grdFolio.rows-1, G2_amount_usd,		       grdServiceFeeAll.GetGridData(grdServiceFeeAll.row,G1_amount_usd));//
				grdServiceFeeAll.RemoveRowAt(grdServiceFeeAll.row);
				
		}		
}
function OnRemoveRoom()
{
	for(row = grdFolio.rows-1; row > 0; row--)
	{
		agin:
		if (grdFolio.GetGridControl().isSelected(row) == true)
		{
			if (grdFolio.GetGridData(row, G2_pk) == '')
			{
						grdFolio.RemoveRowAt(row);
						OnSearch('All_Services');
						break agin;
			}
		}
	}
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htfo00040_fee_folio':
				dso_htfo00040_all_fees.Call('SELECT');	
		break; 
	}
}
function OnPopUp(pos)   
{
    switch(pos)
    {                         
        case 'Room':
            var path = System.RootURL + '/standard/forms/60/25/60250020_room_inhouse_popup.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txt_room_allocate_pk.text = obj[0];   
					txtRoomNo.text = obj[2]; 
					OnSearch('All_Services');	
               }
        break; 
		case 'Room2':
            var path2 = System.RootURL + '/standard/forms/60/25/60250020_room_inhouse_popup.aspx';
               var obj2 = System.OpenModal( path2 ,550 , 500,  'resizable:yes;status:yes');
               if ( obj2 != null )
               {
                    txt_room_allocate_pk2.text = obj2[0]; 
					txtRoomNo2.text = obj2[2]; 
					dso_htfo00040_fee_folio.Call('SELECT');
               }
        break; 
      }         
} 
function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
	{
		grdFolio.DeleteRow();
		dso_htfo00040_fee_folio.Call();
	}

}  
</script> 	

<body>
<gw:data id="dso_htfo00040_all_fees" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60250020_all_bill">
			<input bind="grdServiceFeeAll">
				 <input bind="txt_room_allocate_pk" />
				 <input bind="lstServiceType" />
				 <input bind="lstFolioType" />
			</input> 
			<output bind="grdServiceFeeAll" /> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_htfo00040_fee_folio" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_ht_sel_60250020_move_bill" procedure="st_ht_upd_60250020_move_bill">
			<input bind="grdFolio">
				<input bind="txt_room_allocate_pk2" />
			</input> 
			<output bind="grdFolio" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
        <tr style="width: 100%; height: 1%">
            
        </tr>
        
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
						<td style="width: 6%" align="right" ><b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Room')">Room#</b></td>
						<td style="width: 9%"><gw:textbox id="txtRoomNo" styles="width: 100%" readonly="T" csstype="mandatory" readonly="T" /></td>					
                        <td style="width: 10%">
							 Service Type
                        </td>
						<td style="width: 23%" align="right">
							<gw:list id="lstServiceType" onchange="OnSearch('All_Services')" /> 
                        </td>
						
                        <td style="width: 5%" align="right">
                        </td>
						<td style="width: 6%" align="right" ><b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Room2')">Room#</b></td>
						<td style="width: 9%"><gw:textbox id="txtRoomNo2" styles="width: 100%" readonly="T" csstype="mandatory" readonly="T" /></td>	
                        <td style="width: 10%">
							
                        </td>
                        <td style="width: 13%">
						<gw:list id="lstFolioType" onchange ="OnSearch('All_Services')" styles="display:none " />  
                        </td>
                        
                        <td style="width: 3%">
							<gw:imgbtn img="delete" alt="Delete" id="btnDeleteDTL" onclick="OnDelete()" />
						</td>

                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
						 <td width="3%" align="right">
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 98%; background: white">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
						<td width="48%">
                            <gw:grid id="grdServiceFeeAll" header="_pk|_table_name|Invoice_Date|Invoice|Item|Amount(VND)|Ex_rate|Amount(USD)|_CreateBy|Create Date|_ModifyBy|_ModifyDate"
                                format="0|0|4|0|0|-0|-0|-2|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0" defaults="|||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|600|1500|2000|2000|2000|1000|1000|3000|1000|1000|1000" styles="width:100%; height:100%"
                                sorting="F"  onafteredit="" autosize="T" oncelldblclick="OnSelectServices()" />
                        </td>
                        
                        <td style="width: 3%" align="center">
                            <gw:icon id="ibtnSelect" img="in" text=">>" onclick="OnSelectServices()" />
                            </br>
                            <gw:icon id="ibtnRemove" img="in" text="<<" onclick="OnRemoveRoom()" />
                        </td>
                        <td style="width: 59%; height: 5%; background: #BDE9FF">
                            <gw:grid id="grdFolio" header="_pk|_tht_room_allocate_pk|_txt_room_allocate_pk2|_table_name|_table_pk|Invoice Date|Invoice#|Item|Amount(VND)|Ex_rate|Amount(USD)|Move Bill Date"
                                format="0|0|0|0|0|4|0|0|-0|-0|-2|0" 
								aligns="0|0|0|0|0|0|0|0|0|0|0|0"                                
                                defaults="|||||||||||" 
								editcol="0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="2000|1000|1000|1000|1500|1000|1000|1000|1000|1000|1000|1000" 
								styles="width:100%;height:100%" 
                                autosize='T' debug='false'  oncellclick=""   />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txt_room_allocate_pk" styles="display:none " /> 
<gw:textbox id="txt_room_allocate_pk2" styles="display:none " />
<!--------------------------------------------------------------------------------------->
</html>
