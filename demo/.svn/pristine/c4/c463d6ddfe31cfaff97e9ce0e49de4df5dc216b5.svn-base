<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <title>Goods Delivery Request</title> 
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------
var flag;
var G1_ROW_CLICK = 0;
    var G1_tlg_sa_saleorder_m_pk        =    0,
        G1_tlg_sa_saleorder_d_pk        =    1,
        G1_tlg_it_item_pk               =    2,
        G1_SO_No                        =    3,
        G1_Seq                          =    4,
        G1_Item_Code                    =    5,
        G1_Item_Name                    =    6,
        G1_UOM                          =    7,
        G1_Order_Qty                    =    8,
        G1_Planned_Qty                  =    9,
        G1_Balance                      =   10,
        G1_Customer_Item                =   11,
        G1_ETD                          =   12,
        G1_SO_Date                      =   13,
        G1_PO_No                        =   14 ;
            
//=================================================================================
    var G2_PK                               = 0,
        G2_Plan                             = 1,
        G2_SO_NO                            = 2,
        G2_Seq                              = 3,
        G2_Deli_Qty                         = 4,
        G2_Item_Code                        = 5,
        G2_Deli_Date                        = 6,
        G2_Description                      = 7,
        G2_Crt_By                           = 8,
        G2_Crt_Dt                           = 9,
        G2_Mod_By                           =10,
        G2_Mod_Dt                           =11,
        G2_Tlg_Item_Pk                      =12,
        G2_Tlg_saleorder_d_pk               =13 ;
                
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
 	
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	         
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;

	txtSaleOrderDetailPK.text = "<%=Request.querystring("outgo_m_pk")%>";
 /**/
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = "";           	 	 
	 var ctr = idGrid2.GetGridControl(); 
    
     ctr.ColFormat(G1_REQ_QTY) = "#,###,###,###,###,###.##";
    
     ctr.ColFormat(G1_UNIT_PRICE)   = "#,###,###,###,###,###.###";
     ctr.ColFormat(G1_ITEM_AMOUNT)  = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_VAT_RATE)     = "#,###,###,###,###,###";
     ctr.ColFormat(G1_VAT_AMOUNT)   = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_TOTAL_AMOUNT) = "#,###,###,###,###,###.##";
    
     arr_FormatNumber[G1_REQ_QTY] = 2;
     
     arr_FormatNumber[G1_UNIT_PRICE]   = 3;
     arr_FormatNumber[G1_ITEM_AMOUNT]  = 2;
     arr_FormatNumber[G1_VAT_RATE]     = 0;
     arr_FormatNumber[G1_VAT_AMOUNT]   = 2;
     arr_FormatNumber[G1_TOTAL_AMOUNT] = 2;                 
 }

 //==================================================================================
  
function OnAddNew()
 {
    if (txtSaleOrderDetailPK.text == "" || txtSONo2.text == "")
    {
        alert("Select S/O detail first.");
        return;
    }

    idGrid2.AddRow();
    //alert(idGrid2.rows);
    idGrid2.SetGridText(idGrid2.rows-1, G2_SO_NO, txtSONo2.text);    
    idGrid2.SetGridText(idGrid2.rows-1, G2_Item_Code, txtItemCode.text);
    idGrid2.SetGridText(idGrid2.rows-1, G2_Tlg_Item_Pk, txtItemPK.text);
    idGrid2.SetGridText(idGrid2.rows-1, G2_Tlg_saleorder_d_pk, txtSaleOrderDetailPK.text);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_Deli_Date, dtVoucherDate.value);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_Seq, txtSeq.text);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_Deli_Qty, txtQty.text);

    idGrid2.SetGridText(idGrid2.rows - 1, G2_Deli_Qty, Number(idGrid1.GetGridData(G1_ROW_CLICK, G1_Order_Qty)) - Number(idGrid1.GetGridData(G1_ROW_CLICK, G1_Planned_Qty)));
}  

    //=============================================================================================

function OnClickSODetail()
{
    
    txtSaleOrderDetailPK.text = idGrid1.GetGridData(event.row, G1_tlg_sa_saleorder_d_pk);
    txtSONo2.text = idGrid1.GetGridData(event.row, G1_SO_No);
    txtItemCode.text = idGrid1.GetGridData(event.row, G1_Item_Code);
    txtItemPK.text = idGrid1.GetGridData(event.row, G1_tlg_it_item_pk);
    txtSeq.text = idGrid1.GetGridData(event.row, G1_Seq);
    txtQty.text = idGrid1.GetGridData(event.row, G1_Order_Qty);
    G1_ROW_CLICK = event.row;
    data_dscd00020_1.Call("SELECT");
}
function OnSearch(pos)
{
    if(pos=="idGrid1")
    {
        txtSaleOrderDetailPK.text = "";
        txtSONo2.text = "";
        data_dscd00020.Call("SELECT");
    }    
}
//=============================================================================================
function OnDataReceive(obj)
{
    if(obj.id=="data_dscd00020")
    {
        for(var j=1;j<idGrid1.rows;j++)
        {
            if(Number(idGrid1.GetGridData(j, G1_Balance))<=0)
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0XE22B8A);
            else if(Number(idGrid1.GetGridData(j, G1_Planned_Qty)) == 0)
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0X000000);
            else //if(Number(idGrid1.GetGridData(j, G1_Planned_Qty)) < Number(idGrid1.GetGridData(j, G1_Balance) ))
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0X00FF00);
        }
    }
    else if (obj.id=="data_dscd00020_1")
    {
        var _total_qty = 0;
        for(var j=1;j<idGrid2.rows;j++)
        {
            _total_qty += Number(idGrid2.GetGridData(j, G2_Deli_Qty));
        }
        lblTotalOutQty.text = _total_qty + "";
    }    
}

function OnSave()
{            
    for(var i=0;i<idGrid2.rows;i++ )
    {
        if (idGrid2.GetGridData( i, G2_Deli_Qty ) <= 0 || idGrid2.GetGridData( i, G2_Deli_Qty ) == "" )
        {
            alert("Delivery quantity cannot be null");
            return;
        }
        if (idGrid2.GetGridData(i, G2_Deli_Date) == "")
        {
            alert("Delivery date cannot be null");
            return;
        }
    }
    alert("Are you sure to save?")
        data_dscd00020_1.Call();
}

function OnDelete()
{        
    idGrid2.DeleteRow();
}
//=================================================================================
 
function OnUnDelete()
{              
     idGrid2.UnDeleteRow();
}

    /*
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";
		
		idGrid2.GetGridControl().ColHidden(G1_UNIT_PRICE)  = true ;
		idGrid2.GetGridControl().ColHidden(G1_ITEM_AMOUNT) = true ;
		idGrid2.GetGridControl().ColHidden(G1_VAT_RATE)    = true ;
		idGrid2.GetGridControl().ColHidden(G1_VAT_AMOUNT)  = true ;
		idGrid2.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)= true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";			
		
		idGrid2.GetGridControl().ColHidden(G1_UNIT_PRICE)  = false ;
		idGrid2.GetGridControl().ColHidden(G1_ITEM_AMOUNT) = false ;
		idGrid2.GetGridControl().ColHidden(G1_VAT_RATE)    = false ;
		idGrid2.GetGridControl().ColHidden(G1_VAT_AMOUNT)  = false ;
		idGrid2.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)= false ;
				
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
    /**/


</script>

<body>    
    <!-----------------------idGrid1---------------------------------------->
    <gw:data id="data_dscd00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0" function="st_lg_sel_dscd00020_ens" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSONo" />
                    <input bind="txtPONo" />                    
					<input bind="txtItem" />									
                </input> 
                <output bind="idGrid1" /> 
            </dso> 
        </xml> 
    </gw:data>         
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00020_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_dscd00020_1_ens"   procedure="st_lg_upd_dscd00020_1_ens"> 
                <input bind="idGrid2">                    
                    <input bind="txtSaleOrderDetailPK" /> 
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020" > 
                <input>
                    <input bind="txtSaleOrderDetailPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020_1" > 
                <input>
                    <input bind="txtSaleOrderDetailPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <!--<gw:data id="data_dscd00020_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dscd00020_4" > 
                <inout>
                    <inout bind="txtCustomerPK"/>
                    <inout bind="txtDeliLocPK"/>
                    <inout bind="txtDeliLocName"/> 				
					<inout bind="lstCurrency" />					 
                </inout>
            </dso> 
        </xml> 
    </gw:data>   	 -->  
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fpab00220_2" > 
                <input> 
                    <input bind="txtLGGroupCodeID" />
                </input>
	           <output>
	                <output bind="txtLGCodeList" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>		
    <!---------------------------------------------------------------->
    <!--<gw:data id="pro_dscd00020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020_3" > 
                <input>
                    <input bind="txtReportType" /> 
                    <input bind="txtSlipNo" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> -->
    <!-------------------------------------------------------------------->
    <gw:data id="pro_dscd00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020_2" > 
                <input>
                    <input bind="txtSaleOrderDetailPK" />
                    <input bind="txtEmpPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <gw:data id="pro_dscd00020_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020_5" > 
                <input>
                    <input bind="txtSaleOrderDetailPK" /> 
                    <input bind="txtEmpPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 94%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('idGrid1')" />
                        </td>
                    </tr>  
					                   
                    <tr style="height: 1%">
                        <td style="width: 5%;white-space: nowrap" align="right">
                            S/O.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtSONo" styles="width: 100%" onenterkey="OnSearch('idGrid1')" />
                        </td>
						<td>
							
						</td>
                    </tr>

                    <tr style="height: 1%">
                        <td style="width: 5%;white-space: nowrap" align="right">
                            P/O.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtPONo" styles="width: 100%" onenterkey="OnSearch('idGrid1')" />
                        </td>
						<td>
							
						</td>
                    </tr>
					<tr> 
						<td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('idGrid1')" />
                        </td>
					</tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="idGrid1" 
                                header="_tlg_sa_saleorder_m_pk|_tlg_sa_saleorder_d_pk|_tlg_it_item_pk|SO No.|_Seq|ITEM CODE|ITEM NAME|UOM|ORDER QTY|PLANNED QTY|BALANCE|CUSTOMERS ITEM|ETD|S/O DATE|P/O NO." 
                                format="0|0|0|0|0|0|0|0|0|0|0|0|4|4|0"
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                defaults="|||||||||||||||" 
                               editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                widths="1000|1000|1000|1000|1000|1500|3000|1000|1000|1000|1000|2000|1300|1300|1000"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnClickSODetail()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">                            
                        </td>
                        <td style="width: 25%">
                            <!--<gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" /> -->
                        </td> 
                        <td align="right" style="width: 5%; white-space: nowrap">
                          Delivery Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 3%">
                        </td>  
						<td style="width: 1%">                            
                        </td>                      
                        <td style="width: 1%" align="right">                           
                        </td>
                        <td style="width: 1%" align="right">							                    
                        </td>                        
                        <td style="width: 1%">
                            <gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>						
						<td style="width: 1%" align="right">
                            <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp()" />
                        </td>
                    </tr>
                                       					 
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">
                                        <!--<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" /> -->
                                    </td>
                                    
									<td style="width: 4%; white-space: nowrap" align="right">
                                        Qty :
                                    </td>
                                    <td style="width: 20%; white-space: nowrap" align="center">
                                        <gw:label id="lblTotalOutQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###.###,###.##" />
                                    </td>
                                    <td style="width: 20%" align="right">
                                        
                                    </td>									 									                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="14">
                            <gw:grid id='idGrid2' 
								header='_PK|Plan#|S/O No|Seq|DELI QTY|ITEM CODE|DELI DATE|DESCRIPTION|CRT BY|CRT DATE|MOD BY|MOD DATE|_tlg_it_item_pk|_tlg_sa_saleorder_d_pk'
                                format='0|0|0|0|0|0|4|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='||||||||||||||' 
							   editcol='0|1|0|0|1|0|1|1|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|2000|1300|1800|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T'/>
                            />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtSaleOrderDetailPK" styles="display:none;" />
<gw:textbox id="txtSONo2" styles="display:none;" />
    <gw:textbox id="txtItemCode" styles="display:none;" />
    <gw:textbox id="txtItemPK" styles="display:none;" />
    <gw:textbox id="txtSeq" styles="display:none;" />
    <gw:textbox id="txtQty" styles="display:none;" />
    

<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
<gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
<gw:textbox id="txtReportType" styles='display:none;width:100%' />
<gw:textbox id="txtRadValue" styles='display:none;width:100%' />
<!---------------------------------------------------------------------------------->
</html>
