<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Outgo Return Request</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G2_PK                           = 0,
    G2_ST_OUTGO_RETURN_REQ_M_PK     = 1,
    G2_SEQ                          = 2,
    G2_REF_NO                       = 3,
    G2_REQ_ITEM_PK                  = 4,
    G2_ITEM_CODE                    = 5,
    G2_ITEM_NAME                    = 6,
    G2_REQ_QTY                      = 7,
    G2_REQ_UOM                      = 8,
    G2_LOT_NO                       = 9,
    G2_DESCRIPTION                  = 10;
   
var user_name = "<%=Session("USER_NAME")%>"   ;
var user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
var comp_pk   = "<%=Session("COMPANY_PK") %>" ;
var arr_FormatNumber = new Array();  
var flag ;
//====================================================================================
function BodyInit()
{
    System.Translate(document); 
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtPartnerName.SetEnable(false);
    txtPLName.SetEnable(false);
    
    SetGridFormat();
    BindingDataList();
    lstWH.value = "";
    
    OnAddNew('Master');
 }
//====================================================================================

function BindingDataList()
{
    var ldate;    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    var data="";
        
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id ||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y'  ORDER BY wh_name  ASC" )%>||";    
    lstWH.SetDataText(data);       
    lstReWH.SetDataText(data); 
}
//====================================================================================
 function SetGridFormat()
 {
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G2_REQ_QTY) = "#,###,###,###,###,###.##";    
    arr_FormatNumber[G2_REQ_QTY]   = 2;
 }
//====================================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("img1"); 

    if(imgArrow.status == "expand")
    {
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}
//====================================================================================
 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bias00110.Call('SELECT');
        break;
        //------------------
        case 'Master':
            txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
            data_bias00110_1.Call('SELECT');
        break;
    }
}
//====================================================================================
function OnAddNew()
{             
    data_bias00110_1.StatusInsert();    
    txtSlipNo.text   = '***New Voucher***';
    //-------------------------------------------
    txtChargerName.text = "<%=Session("USER_NAME")%>";
    txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
    //------------------------------------------- 
    grdDetail.ClearData(); 
}
//====================================================================================

function OnSave(pos)
{   
    switch(pos)
    { 
        case 'Master':
            data_bias00110_1.Call();    
            flag="save";        
        break;
        //--------------
        case 'Detail':
            data_bias00110_2.Call();            
        break;        
    }    
}
//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bias00110_1":   
            if(flag == "save")
            { 
                for(var i=1; i < grdDetail.rows;i++)
                {
                        if ( grdDetail.GetGridData( i, G2_ST_OUTGO_RETURN_REQ_M_PK) == '' )
                        {
                            grdDetail.SetGridText( i, G2_ST_OUTGO_RETURN_REQ_M_PK, txtMasterPK.text);
                        } 
                }
                    data_bias00110_2.Call();
            }
            else
            {
               data_bias00110_2.Call('SELECT');
            }
        break;  
		case "data_bias00110": 
            if(grdSearch.rows > 1)
            { 
				lbSearchRecords.text = grdSearch.rows -1;
            }
        break;   
        case "data_bias00110_2": 
            if(grdDetail.rows > 1)
            { 
				lblRowCount.text = grdDetail.rows -1
                grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE,  true);
                grdDetail.SetCellBold( 1, G2_REQ_QTY, grdDetail.rows - 1, G2_REQ_QTY,  true);
            }
        break;       
        //--------------------
        case 'pro_bias00110':
            alert(txtReturnValue.text);
            OnSearch('Master');
        break;   
        case 'pro_bias00110_1':
            alert(txtReturnValue.text);
        break;            
    }
}
 
//====================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;  
        //---------------------------
        case 'Partner':
            var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtPartnerName.text = obj[2];
                txtPartnerPK.text   = obj[0];
            }
        break; 
        //-----------------------
        case 'PL': 
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[6]; 
                txtPLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;
        //----------------------------
        case 'FreeItem':
            if(txtPartnerPK.text!="")
            {
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=||Y|Y||';//purchase_yn=Y
                 var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 if ( object != null )
                 {                    
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdDetail.AddRow();                            
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ                     , grdDetail.rows-1);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ST_OUTGO_RETURN_REQ_M_PK, txtMasterPK.text); //master_pk	    	                                               
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_PK             , arrTemp[0]);//item_pk	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE               , arrTemp[1]);//item_code	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME               , arrTemp[2]);//item_name	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM                 , arrTemp[5]);//item_uom                                                  
                        }
                 } 
             }
             else
             {
                alert("Please Select Partner first !!!");
             }
        break;
        //--------------------------          
    }
}
//====================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G2_REQ_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
            break;             
      }         
}
//====================================================================================
function OnDelete(obj)
{
    if(obj == "Master")
    {
        if(confirm('Do you want to delete this request?'))
        {
            data_bias00110_1.StatusDelete();
            data_bias00110_1.Call();
        }        
    }
    if(obj == "Detail")
    {
        if(confirm('Do you want to delete this Item?'))
        {
                if ( grdDetail.GetGridData( grdDetail.row, G2_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
        }        
    }
}
//====================================================================================
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}
//====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( confirm('Do you want to confirm this Slip?'))
            {
                pro_bias00110.Call();
            }               
        break;
        
        case 'Return' :
            if(txtMasterPK.text!="")
            {
                if(lblStatus.text=="SUBMITED")
                {
                    if ( confirm('Do you want to return this Slip?'))
                    {
                        pro_bias00110_1.Call();
                    }
                }
                else
                {
                    alert("This slip not yet Submit!!!");
                }
            }
            else
            {
                alert("Please Select one Slip to Return!!!");
            }               
        break;
    }
}

function OnPrint()
{
	var url =System.RootURL + '/reports/bi/as/rpt_bias00110.aspx?p_master_pk=' + txtMasterPK.text ;
	window.open(url, "_blank");
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00110" > 
                <input>                     
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtVoucherSearch" />
                    <input bind="lstWh" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_bias00110_1"  procedure="st_lg_upd_bias00110_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstReWH" />
                     <inout  bind="dtReDate" />  
                     <inout  bind="txtRefNo" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtPartnerPK" />
                     <inout  bind="txtPartnerName" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="lblStatus" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_bias00110_2" procedure="st_lg_upd_bias00110_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00110" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="pro_bias00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00110_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtEmpPK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">Records :</td>
                            <td align="left" style="width:25%">
                                <gw:label id="lbSearchRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td></td>
                            <td><gw:button img="search" alt="Search" onclick="OnSearch('grdSearch')" /></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td>
                                            Date
                                        </td>
                                        <td style="white-space: nowrap">
                                           <gw:datebox id="dtFrom" lang="1" />
                                            ~
                                            <gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            W/H
                                        </td>
                                        <td colspan="2">
                                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                          
							                Slip No
                                        </td>
                                        <td colspan="2">                            
							                <gw:textbox id="txtVoucherSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Ref No" format="0|0|0|4|0"
                                aligns="1|0|0|1|0" defaults="|||||" editcol="0|0|0|0|0" widths="0|1000|1000|1100|1000"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('Master')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
										<td align="left"> 
											<img status="expand" id="img1" src="../../../../system/images/button/previous.gif" style="cursor: hand"
												onclick="OnToggle()" />
										</td>
                                        <td>Status : </td>
                                        <td style="width:100px">
											<gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
										</td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td>
											<gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Confirm')" />
										</td>
										<td >
											<gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
										</td>
										<td >
											<gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
										</td>
										<td >
											<gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
										</td>
										<td >
											<gw:button id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnPrint()" />
										</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtReDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" class="eco_link"><b>Charger</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtChargerName" styles="width:100%" />
											<gw:textbox id="txtChargerPK" styles="display:none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                           Slip No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" class="eco_link"><b>Supplier</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSupplierPK" styles="display:none" />
                                            <gw:textbox id="txtSupplierName" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstReWH" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            Ref No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRefNo" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <a title="Charger" onclick="OnPopUp('Partner')" href="#tips" class="eco_link"><b>
											Partner</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtPartnerName" styles="width:100%" />
											<gw:textbox id="txtPartnerPK" styles="display:none" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            Description
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                    </tr>
									
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr style="height: 96%">
            <td valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                            <td align="left" style="white-space:nowrap">
                                <table style="height:100%">
                                    <tr>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                        <td> </td>
                                        <td style="width:100px"></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td style="width: 10%" align="left" colspan="6">
                            
										</td>
										<td >
											<gw:button id="idBtnFreeItem" img="item" text="Item" onclick="OnPopUp('FreeItem')" />
										</td>
										<td >
											<gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
										</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' header='_pk|_st_outgo_return_req_m_pk|Seq|Ref No|_req_item_pk|Item Code|Item Name|Req Qty|Req Uom|Lot No|Description'
                                format='0|0|0|0|0|0|0|1|2|0|0' aligns='0|0|1|0|0|0|0|0|1|0|0' editcol='1|1|0|1|1|0|0|1|1|1|1'
                                widths='0|0|500|1000|0|1200|2500|1000|1000|1000|1200' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
	<gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')" />
	<gw:textbox id="txtPLPK" styles="display:none" />
    <gw:textbox id="txtPLName" styles="width:100%;display:none" />
    <!------------------------------------------------------------------->
</body>
</html>
