<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Transfer Request</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var flag;

//-------------------
var G1_PK                       = 0 ;

var G2_PK	                    = 0,               
    G2_ST_TRANSFER_REQ_M_PK     = 1,
    G2_REQ_ITEM_PK	            = 2,
    G2_SEQ                      = 3,
    G2_REQ_ITEM_CODE            = 4,
   	G2_REQ_ITEM_NAME            = 5,
    G2_REF_NO                   = 6,
    G2_REQ_UOM                  = 7,
    G2_UNIT_PRICE               = 8,
    G2_REQ_QTY                  = 9,
	G2_TRANS_QTY				= 10,
    G2_ITEM_AMOUNT              = 11,
    G2_VAT_RATE                 = 12,
    G2_VAT_AMOUNT               = 13,
    G2_TOTAL_AMOUNT             = 14,
    G2_LOT_NO                   = 15,
    G2_REMARK              		= 16;  
	
//--------------------------------------------------------------------- 

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../../system/images/next_orange.gif";
    }
}

//-------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document); 
     //---------------------------------- 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------------- 
    txtStaff.SetEnable(false);
    //-------------------------
    SetGridFormat();
		
    OnSearch('grdSearch');
}

 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
     var data ;
     
     data = "<%=CtlLib.SetListDataSQL("select pk, wh_name from tlg_in_warehouse where del_if = 0 and use_yn = 'Y'")%>||";
     lstOutWH.SetDataText(data);
     lstOutWH.value = "";
     
     lstInWH.SetDataText(data);
     lstInWH.value = "";
     
     lstWH.SetDataText(data);
     lstWH.value = "";
      
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G2_REQ_QTY)           = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_UNIT_PRICE)        = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_VAT_AMOUNT)        = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_ITEM_AMOUNT)       = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_TOTAL_AMOUNT)      = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_VAT_RATE)          = "#,###,###,###,###,###.##";    
 }
//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            dso_bias00013.Call("SELECT");
        break;
        //--------------------
        case 'grdMaster':
             if ( grdSearch.row > 0 )
             {
                 txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK );
             }
             
            dso_bias00013_1.Call("SELECT");
        break;
        //-------------------
        case 'grdDetail':            
            dso_bias00013_2.Call("SELECT");
        break;
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "dso_bias00013_1":                    
                OnSearch('grdDetail'); 
        break;
        //===================
        case "dso_bias00013_2":
            for(var i = 1; i < grdDetail.rows; i++)
            {
                grdDetail.SetCellBold( i, G2_REQ_ITEM_CODE, grdDetail.rows - 1, G2_REQ_ITEM_CODE, true);
                grdDetail.SetCellBold( i, G2_UNIT_PRICE,    grdDetail.rows - 1, G2_LOT_NO,        true);
            }
        break;              
    }
}
//=============================================================================================
function OnSelectMaster()
{
    
}
//=============================================================================================
function OnSelect(pos)
{
    var arr_data = new Array();
    
    switch (pos)
    {
        case 'Partial' :
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
        
        case 'ALL' :
            var arr_data = new Array();
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
           
    //--------------------------------------------------------------
    if ( arr_data != null )
    { 
        var callerWindowObj = dialogArguments;    
        

            callerWindowObj.lstOutWH.value = lstOutWH.value ;                           
      
        //----------
    
            callerWindowObj.lstInWH.value = lstInWH.value ;                           
        
        //----------
     
            callerWindowObj.txtOUT_PLPK.text = txtOUT_PLPK.text ;                           
                
        //----------
        
            callerWindowObj.txtOUT_PLName.text = txtOutPL.text ;                           
             
        //----------
        
            callerWindowObj.txtIN_PLPK.text = txtIN_PLPK.text ;                           
                 
        //----------
       
            callerWindowObj.txtIN_PLName.text = txtInPL.text ;                           
        
        //----------
        
            callerWindowObj.lstCurrency.value = txtCCY.text;                   
    }
                      
    window.returnValue =  arr_data;
    window.close();
    //--------------------------------------------------------------
            
}
//=============================================================================================

</script>

<html>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="dso_bias00013" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="st_lg_sel_bias00013"> 
                <input bind="grdSearch" > 
                    <input bind="txtRefNoSearch" /> 
					<input bind="dtFrom" /> 
					<input bind="dtTo" /> 
					<input bind="lstWH" />
					<input bind="chkTransfer" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="dso_bias00013_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_bias00013_1"> 
             <inout>
                <inout  bind="txtMasterPK" /> 
                <inout  bind="txtRefNo" /> 
                <inout  bind="txtStaffPK" />
                <inout  bind="txtStaff" />
                <inout  bind="dtDocDate" />
                <inout  bind="lstOutWH" />
                <inout  bind="lstInWH" />                
                <inout  bind="txtOUT_PLPK" />
                <inout  bind="txtOutPL" />
                <inout  bind="txtIN_PLPK" />
                <inout  bind="txtInPL" />
                <inout  bind="lblStatus" /> 
                <inout  bind="txtRemark" />   
                <inout  bind="txtCCY" />      
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="dso_bias00013_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_bias00013_2"> 
                <input bind="grdDetail" > 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 2%" align="right">
                        <td style="width: 30%">
                            <b>Date</b>
                        </td>
                        <td colspan="2" align="left">
                            <gw:datebox id="dtFrom" lang="1" />
                            &nbsp;&nbsp;<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 30%; white-space: nowrap" align="right">
                            <b>W/H</b>
                        </td>
                        <td style="width: 69%" colspan="3">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 30%; white-space: nowrap" align="right">
                            <b>Ref No</b>
                        </td>
                        <td style="width: 100%">
                            <gw:textbox id="txtRefNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
						<td style="width: 30%; white-space: nowrap" align="right">
                            <b>Transfer</b>
                        </td>
						<td style="width: 30%; white-space: nowrap" align="right">
                           <gw:checkbox id="chkTransfer" defaultvalue="Y|N" value="Y" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <gw:grid id="grdSearch" header="_PK|Date|Req No" format="0|4|0" aligns="1|1|0" defaults="||"
                                editcol="0|0|0" widths="0|1200|0" styles="width:100%; height:100%" sorting="T"
                                oncellclick="OnSearch('grdMaster')" param="0,1,2" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%">
                            <b>Ref No</b>
                        </td>
                        <td style="width: 40%" colspan="2">
                            <gw:textbox id="txtRefNo" csstype="mandatory" styles="width: 100%" />
                        </td>
                        <td style="width: 2%">
                        </td>
                        <td align="right" style="width: 10%">
                            Charger
                        </td>
                        <td style="width: 100%" colspan="2">
                            <gw:textbox id="txtStaff" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td>
                        </td>
                        <td align="right" style="width: 10%">
                            <b>Date</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtDocDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%">
                            <b>Out WH</b>
                        </td>
                        <td style="width: 100%" colspan="2">
                            <gw:list id="lstOutWH" styles="width:100%" csstype="mandatory" onchange="OnSelectInWHChange()">
                            </gw:list>
                        </td>
                        <td>
                        </td>
                        <td align="right" style="width: 10%">
                            <b>In WH</b>
                        </td>
                        <td style="width: 25%" colspan="2">
                        
                            <gw:list id="lstInWH" styles="width:100%" csstype="mandatory" onchange="OnSelectInWHChange()">
                            </gw:list>
                        </td>
                        <td>
                        </td>
                        <td style="width: 14%;" align="right">
                            <b>Status</b>
                        </td>
                        <td style="width: 15%" colspan="2">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right">
                            Out PL
                        </td>
                        <td colspan="2">
                        <gw:textbox id="txtOUT_PLPK" styles="display:none" />
                            <gw:textbox id="txtOutPL" styles="width:100%;" />
                        </td>
                        <td style="white-space: nowrap" colspan="2" align="right">
                            In PL
                        </td>
                        <td colspan="2">
                        <gw:textbox id="txtIN_PLPK" styles="display:none" />
                            <gw:textbox id="txtInPL" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%">
                            <b>Remark</b>
                        </td>
                        <td style="width: 25%" colspan="7">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSelect" img="Select" text="Select" onclick="OnSelect('Partial')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSelectALL" img="Select All" text="Select ALL" onclick="OnSelect('ALL')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_PK|_ST_TRANSFER_REQ_M_PK|_REQ_ITEM_PK|Seq|Item Code|Item Name|Ref No|Req Uom|Unit Price|Req Qty|Transfer Qty|Item Amount|Tax (%)|Tax Amount|Total Amount|Lot No|Remark'
                                format='0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|0|0' aligns='0|0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|0|500|1200|2000|1000|1000|1500|1000|1200|1500|1000|1200|1800|1000|0'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtCCY" styles="width: 100%;display: none" />
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!--------------------------------------------------------------------------->
</body>
</html>
