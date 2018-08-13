<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock OutGoing Request</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script src="../../../../system/lib/ajax.js"></script>

<script language="javascript" type="text/javascript">
//--------------------------------------

var flag;

var G1_PK    = 0 ;

var G2_DETAIL_PK    = 0 ,
    G2_MASTER_PK    = 1 ,
    G2_SEQ          = 2 ,
    G2_REF_NO       = 3 ,
    G2_ST_ITEM_PK   = 4 ,
    G2_ST_CODE      = 5 ,
    G2_ST_NAME      = 6 ,
    G2_ITEM_PK      = 7 ,
    G2_ITEM_CODE    = 8 ,
    G2_ITEM_NAME    = 9 ,
    G2_REQ_QTY_01   = 10 ,
    G2_REQ_UOM_01   = 11 ,
    G2_LOT_NO       = 12 ,
    G2_REMARK       = 13 ;
   
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }
 
//----------------------------------------------------------------------------------------
function BodyInit()
 {    
    System.Translate(document);  // Translate to language session
	    
    txtStaffName.SetEnable(false);
    txtRequester.SetEnable(false);
    txtVoucherNo.SetEnable(false);
    txtParnerName.SetEnable(false);
    //-----------------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;          
    dtFrom.value=ldate ; 
    //-------------------------
    
    BindingDataList();    
    SetGridFormat();       
    OnToggleGrid(); 
    //------------------------- 
 }
//---------------------------------------------------------------------------------------------------
 function BindingDataList()
 {  
     var data;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>";   
     cboWH.SetDataText(data);
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||";   
     lstWH2.SetDataText(data);
     lstWH2.value="";
     
     data = "<%=CtlLib.SetListDataSQL("SELECT PK, LINE_NAME FROM tlg_pb_LINE Where Del_if=0 order by LINE_NAME ")%>";  
     cboLine.SetDataText(data); 
               
 }
 
 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    ctr.ColFormat(G2_REQ_QTY_01) = "#,###,###,###,###,###.###";
 }

//--------------------------------------------------------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdVouchers':
            data_bini00155.Call("SELECT");
        break;
    
        case 'Master':
                   
                if ( grdVouchers.row > 0 )
                {
                    txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G1_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                                
                data_bini00155_1.Call("SELECT");
                                    
        break;
        
        case 'grdDetail':            
            data_bini00155_2.Call("SELECT");
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bini00155_1": 
             
            //---------------------------- 
            OnSearch('grdDetail');                          
        break;
        
        case "data_bini00155_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_REQ_QTY_01, grdDetail.rows - 1, G2_REQ_QTY_01,  true);
	            
                grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE, true);
                grdDetail.SetCellBold( 1, G2_LOT_NO,    grdDetail.rows - 1, G2_LOT_NO,    true);
                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                
                //--------------------------------
            }     
        break;
       
    }
} 
//======================================================================
function OnSelect(pos)
{
     var arr_data = new Array();
    switch(pos)
    {
        case'1':
            
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
        break;
        case'2':
            var arr_data = new Array();
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ ) 
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }    
        break;
    }
    if ( arr_data != null )
    {
        var callerWindowObj = dialogArguments;    
          
        callerWindowObj.txtRefNo.text = txtRefNo.text; 
        
        callerWindowObj.lstLine.value = cboLine.value;
        
        callerWindowObj.txtPLPK.text= txtPLPK.text;
        callerWindowObj.txtPLName.text= txtPLName.text;
        
        callerWindowObj.lstWH.value= cboWH.value;
        
    }
              
    window.returnValue =  arr_data;
    window.close();
}
 
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = false;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = false ;
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//=======================================================================================

</script>

<body>    
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_bini00155" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_bini00055" > 
                <input> 
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstWH2" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bini00155_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="st_lg_sel_bini00055_1"   > 
                <inout>             
                     <inout  bind="txtMasterPK" />                     
                     <inout  bind="txtVoucherNo" />
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="dtVoucherDate" />
                     <inout  bind="cboLine" /> 
                     <inout  bind="txtParnerName" />
                     <inout  bind="cboWH" />
                     <inout  bind="txtReqEmpPK" /> 
                     <inout  bind="txtRequester" />  
                     <inout  bind="txtRemark" />                     
                     <inout  bind="lblStatus" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="txtRefNo" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bini00155_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_bini00055_2"  > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%">
                            Date
                        </td>
                        <td style="width: 79%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                            ~
                            <gw:datebox id="dtTo" lang="1" width="10%" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstWH2" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%">
                            No.
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtNoSearch" style="width: 100%" />
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')">User
							</gw:checkbox>
                        </td>
                    </tr>
                   
                    <tr style="height: 95%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Date|Voucher No" format="0|4|0" aligns="0|1|0"
                                defaults="||" editcol="0|0|0" widths="0|1200|1200" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Voucher No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtVoucherNo" onkeypress="ChangeUpper()" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 30%">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 1%" align="right">
                            
                        </td>
                        <td style="width: 1%" align="right">
                            
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Ref No
                        </td>
                        <td style="width: 25%" colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            Charger
                        </td>
                        <td style="width: 30%" colspan="7">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Line
                        </td>
                        <td style="width: 25%" colspan="3">
                            <gw:list id="cboLine" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            P/L
                        </td>
                        <td style="width: 30%" colspan="7">
                            <gw:textbox id="txtPLName" styles="width: 100%" />
                            <gw:textbox id="txtPLPK" styles="width: 100%;display: none" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            W/H
                        </td>
                        <td style="width: 25%" colspan="3">
                            <gw:list id="cboWH" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            Partner
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtParnerName" styles="width:100%" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Requester
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRequester" styles="width:100%;" />
                            <gw:textbox id="txtReqEmpPK" styles="display=none" />
                        </td>
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="7">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="center">
                            <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                style="cursor: hand" onclick="OnToggleGrid()" />
                        </td>
                        <td align="center">
                        </td>
                        <td colspan="10">
                            <table>
                                <tr>
                                    <td style="width: 98%">
                                    </td>
                                    <td style="width: 2%">
                                        
                                    </td>
                                    <td style="width: 2%">
                                        
                                    </td>
                                    <td style="width: 2%">
                                        
                                    </td>
                                    <td style="width: 2%">
                                        <gw:button id="idBtnSelect" img="Select" text="Select" onclick="OnSelect('1')" />
                                    </td>
                                    <td style="width: 2%">
                                        <gw:button id="idBtnSelectAll" img="Select All" text="Select All" onclick="OnSelect('2')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' header='_PK|_ST_OUTGO_REQ_M_PK|Seq|Ref No|_ST_ITEM_PK|ST Code|ST Name|_ITEM_PK|Item Code|Item Name|Req Qty|UOM|Lot No|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|3|1|0|0' check='|||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|800|1500|0|2000|2500|0|2000|2500|1200|1000|1500|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txtRefTable" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txtRefTablePK" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
<!------------------------------------------------------------------------------------>
</html>
