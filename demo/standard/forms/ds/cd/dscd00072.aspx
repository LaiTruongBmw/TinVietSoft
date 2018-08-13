<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <title>POP UP G/D REQUEST</title> 
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var G_PK        = 0,     
    G_SLip_No   = 1,
    G_Date      = 2,
    G_PARTNER   = 3;

//=================================================================================
var G1_DETAIL_PK     = 0,
    G1_SEQ           = 1,
    G1_REF_NO        = 2,
    G1_REQ_ITEM_PK      = 3,
    G1_REQ_ITEM_CODE    = 4,
    G1_REQ_ITEM_NAME    = 5,
    G1_NULL_01          = 6,
    G1_NULL_02          = 7,
    G1_NULL_03          = 8,
    G1_REQ_QTY          = 9,
    G1_REQ_UOM          = 10,
    G1_NULL_04          = 11,
    G1_NULL_05          = 12,
    G1_NULL_06          = 13,
    G1_NULL_07          = 14,
    G1_NULL_08          = 15,
    G1_NULL_09          = 16,
    G1_NULL_10          = 17,
    G1_LOT_NO           = 18,
    G1_ETD              = 19,
    G1_WH_PK            = 20,
    G1_WH_NAME          = 21,
    G1_REMARK           = 22,
    G1_MASTER_PK        = 23,
    G1_SO_D_PK          = 24,
    G1_NULL_11          = 25;	
    
var arr_FormatNumber = new Array();   
	    
 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
     
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    txtSlipNo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtCustomerName.SetEnable(false);      
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;   
    //----------------------------         
    SetGridFormat();  
 
    //----------------------------
 }
 //==================================================================================
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G1_REQ_QTY) = "#,###,###,###,###,###.###";
    
    arr_FormatNumber[G1_REQ_QTY] = 3;    
 }
  
//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_dscd00072.Call("SELECT");
        break;
    
        case 'grdMaster':
             if ( grdSearch.row > 0 )
             {
             	   txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
             }
                     
             data_dscd00072_1.Call("SELECT");                                  
        break;
        
        case 'grdDetail':            
            data_dscd00072_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_dscd00072_1": 
                //---------------------------- 
                OnSearch('grdDetail');   
        break;

        case "data_dscd00072_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_REQ_ITEM_CODE, grdDetail.rows - 1, G1_REQ_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY,   true);                
                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CODE , grdDetail.rows - 1, G1_REQ_ITEM_NAME , 0xCCFFFF );                                    
                //--------------------------------                
            }         
        break;                   
   }            
} 
 //===================================================================================
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
        
        callerWindowObj.txtCustomerPK.text   = txtCustomerPK.text ; 
        callerWindowObj.txtCustomerName.text = txtCustomerName.text ;
    }
              
    window.returnValue =  arr_data;
    window.close();            
} 
//=================================================================================
</script>

<body>    
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_dscd00072" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_dscd00072" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSearchNo" />
					<input bind="txtItem" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_dscd00072_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_dscd00072_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtReqDate" />
					 <inout  bind="txtRefNo" />                          
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />                                          
                     <inout  bind="txtCustomerPK" />
                     <inout  bind="txtCustomerName" />					 				 
                     <inout  bind="txtRemark" />                                                                                              
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00072_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" function="st_lg_sel_dscd00072_2" > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
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
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>  
					<tr> 
						<td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
					</tr>                   
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
						</td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Slip/Ref No|Date|Partner" format="0|0|4|0"
                                aligns="0|0|1|0" defaults="|||" editcol="0|0|0|0" widths="0|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 20%" align="left">
                            <gw:datebox id="dtReqDate" lang="1" />
                        </td>                        
                        <td style="width: 20%" align="center">                             
                        </td>                       
                        <td style="width: 1%" align="right">                             
                        </td>
                        <td style="width: 1%" align="right">
                             
                        </td>
                        <td style="width: 1%">
                             
                        </td>
                        <td style="width: 1%" >
                              <gw:button id="btnSelect" img="select" text="Select" onclick="OnSelect('Partial')" />
                        </td>
                        <td style="width: 1%" >
                              <gw:button id="btnSelectALL" img="select" text="Select ALL" onclick="OnSelect('ALL')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Ref No
                        </td>
                        <td >
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">                             
                                Charger 
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                             Cust 
                        </td>
                        <td style="white-space: nowrap"  >
                            <gw:textbox id="txtCustomerPK" styles="display:none" />
                            <gw:textbox id="txtCustomerName" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                             Remark
                        </td>
                        <td style="white-space: nowrap" colspan="9">
                            <gw:textbox id="txtRemark" styles="width:100%;" />  
                        </td>
                    </tr>                                         
                    <tr style="height: 97%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_NULL|_NULL|_NULL|Req Qty|UOM|_NULL|_NULL|_NULL|_NULL|_NULL|_NULL|_NULL|Lot No|ETD|_WH_PK|W/H|Remark|_MASTER_PK|_SO_D_PK|_NULL'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|2|0|0|0|0|0|0'
                                check='||||||||||||||||||||||||' editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|0|0|1|0|0|0'
                                widths='0|800|1500|0|2000|3500|0|1500|2000|1200|1000|1200|1000|1500|1500|1500|1500|1500|1500|1200|0|1500|1000|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" acceptnulldate='T'/>
                            />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
 
</html>
