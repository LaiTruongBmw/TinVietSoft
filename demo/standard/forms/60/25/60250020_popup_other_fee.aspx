<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Other Fees</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var COL_NO			        = 0,
	COL_PK  		        = 1,
	COL_THT_ROOM_ALLOCATE   = 2,
	COL_FEE_DESC            = 3,
	COL_FEE_DESC_LOCAL		= 4,
	COL_FEE_AMT_USD		    = 5,
	COL_FEE_AMT_VND 	    = 6,
	COL_VAT_AMT		        = 7,
	COL_SVC_AMT     	    = 8,
	COL_TOTAL_AMT	        = 9,
	COL_FEE_TYPE	        = 10;

 function BodyInit()
 {    
   txtRoomNo.SetReadOnly(true);
   txtGuestName.SetReadOnly(true);
   txt_room_allocate_pk.text = '<%=Request.QueryString("p_master_pk") %>';     
   //txtGuestName.text = '<%=Request.QueryString("p_golfer_name") %>';
   txtRoomNo.text = '<%=Request.QueryString("p_room_no") %>';   
   txtExRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_sell_ex_rate('"+Session("COMPANY_PK")+"','USD') from dual")%> VND";
  
   data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='OTHERFEE' AND USE_YN='Y' and code not in('100') ORDER BY ORD" )%>"; 
   idGrid.SetComboFormat(10, data);
	
   dso_other_getfullname.Call();
   
 }
function OnAddNew()
{
    idGrid.AddRow();
    idGrid.SetGridText(idGrid.rows -1, COL_NO               , idGrid.rows -1);
    idGrid.SetGridText(idGrid.rows -1, COL_THT_ROOM_ALLOCATE, txt_room_allocate_pk.text);
    idGrid.SetGridText(idGrid.rows -1, COL_FEE_AMT_USD      , 0);
    idGrid.SetGridText(idGrid.rows -1, COL_FEE_AMT_VND      , 0);
    idGrid.SetGridText(idGrid.rows -1, COL_VAT_AMT          , 0);
    idGrid.SetGridText(idGrid.rows -1, COL_SVC_AMT          , 0);
    idGrid.SetGridText(idGrid.rows -1, COL_TOTAL_AMT        , 0);    
}
/*function OnSave()
{
   dso_other_fee.Call();
}*/
function OnDelete()
{
   if ( confirm( "Do you want item this row to delete?" )) {idGrid.DeleteRow();dso_other_fee.Call();}
}
function OnSerach()
{
	dso_other_fee.Call("SELECT");
}
function gridOnafteredit(){
    switch(event.col){
        case COL_FEE_AMT_USD:
        case COL_FEE_AMT_VND:
            var l_Rate = Number(String(txtExRate.GetData()).substring(0, txtExRate.GetData().length - 4));
            if(isNaN(Number(idGrid.GetGridData(event.row, event.col)))){
                idGrid.SetGridText(event.row, event.col, txtTempValue.text); txtTempValue.text = ""; alert("Please input number!"); return false;
            }


            idGrid.SetGridText(event.row, (event.col == COL_FEE_AMT_USD)? COL_FEE_AMT_VND : COL_FEE_AMT_USD, (event.col == COL_FEE_AMT_USD)? Number(idGrid.GetGridData(event.row, event.col))*l_Rate : Math.round(Number(idGrid.GetGridData(event.row, event.col))/l_Rate*100)/100);
            idGrid.SetGridText(event.row, COL_VAT_AMT, (Number(idGrid.GetGridData(event.row, COL_FEE_AMT_VND))+Number(idGrid.GetGridData(event.row, COL_FEE_AMT_VND))*0.05)*0.1);
            idGrid.SetGridText(event.row, COL_SVC_AMT, Number(idGrid.GetGridData(event.row, COL_FEE_AMT_VND))*0.05);
            idGrid.SetGridText(event.row, COL_TOTAL_AMT, Number(idGrid.GetGridData(event.row, COL_FEE_AMT_VND))+Number(idGrid.GetGridData(event.row, COL_VAT_AMT))+Number(idGrid.GetGridData(event.row, COL_SVC_AMT)));
        break;
    }
}
function gridOnbeforeedit(){
    switch(event.col){
        case COL_FEE_AMT_USD:
        case COL_FEE_AMT_VND:
            txtTempValue.text = idGrid.GetGridData(event.row, event.col);
        break;
    }
}
function OnSave(){
    if(OnValid()){
        dso_other_fee.Call();
    }
}
function OnValid(){
    for(var x = 1; x < idGrid.rows; x++)
	{
        if(idGrid.GetGridData(x, COL_FEE_DESC) == "")
		{
            alert("Please input data for column 'Fee Decription' row => " + idGrid.GetGridData(x, COL_NO) + " !" ); 
			return false;
        }
		if(idGrid.GetGridData(x, COL_FEE_DESC_LOCAL) == "")
		{
            alert("Please input data for column 'Fee Decription Local' row => " + idGrid.GetGridData(x, COL_FEE_DESC_LOCAL) + " !" ); 
			return false;
        }
		if(idGrid.GetGridData(x, COL_FEE_TYPE) == ""){
            alert("Please input data for column 'Fee Type' row => " + idGrid.GetGridData(x, COL_FEE_TYPE) + " !" ); 
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
	if(obj.id=='dso_other_fee')
	{	
		var total = 0;
		if(idGrid.rows > 1){
			for ( var i=1; i < idGrid.rows; i++)
				total += Number(idGrid.GetGridData( i, COL_FEE_AMT_VND));
		}
		txtTotal.text = total + " VND";
	}
    
}
function OnReport()
{
		 url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00040_other_fee.rpt&procedure=sp_rpt_htfo00040_other_fee&parameter="+txt_room_allocate_pk.text+","+txtGuestName.GetData()+","+txtRoomNo.GetData();   
         System.OpenTargetPage(url); 
		 window.close();	
}

</script>
<body>
    <gw:data id="dso_other_fee" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_ht_sel_60250020_other_fee" procedure = "st_ht_upd_60250020_other_fee">
                <input bind="idGrid" >
                    <input bind="txt_room_allocate_pk"/>
                    <input bind="cbDelete"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
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
                                    <td style="width:30%">
										<gw:checkbox id="cbDelete" defaultvalue="-1|0" onchange="OnSerach()"  />Deleted
									</td>
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
                                    <td style="width: 60%">
                                        Total : <gw:textbox id="txtTotal" styles="width: 100;border:none;color:red;font-weight:bold;" readonly="true" />
                                    </td>
									

                                    <td style="width: 3%">
                                        <gw:imgbtn img="new" alt="New" id="idBtnAdd" styles='width:100%' onclick="OnAddNew()" /> 
                                    </td>
									
									 
                                    <td style="width: 3%">
                                        <gw:imgbtn img="save" alt="Save" id="idBtnUpdate" styles='width:100%' onclick="OnSave()" />
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn img="delete" alt="Delete" id="idBtnDelete" styles='width:100%' onclick="OnDelete()" />
                                    </td>
									<td width="3%" align="right">
										<gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
									</td>	

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%" valign="top">
                        <td>
                            <gw:grid id="idGrid" 
                                header      ="No.|_PK|_THT_ROOM_ALLOCATE_PK|Fee Description|Fee Description Local|Fee Amt(USD)|Fee Amt(VND)|_Ex_Rate|_ServiceAMT|_Total_AMT|Fee Type"
                                format      ="0|0|0|0|0|-2|-0|-0|-0|-0|0" 
                                aligns      ="1|0|0|0|0|0|0|0|0|0|0" 
                                defaults    ="||||||||||" 
                                editcol     ="0|0|0|1|1|1|1|0|0|0|1" 
                                widths      ="1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000" 
                                styles      ="width:100%; height:350" 
                                sorting     ="T" 
                                autosize    ="T" 
                                onafteredit ="gridOnafteredit();"
                                onbeforeedit="gridOnbeforeedit();"
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
