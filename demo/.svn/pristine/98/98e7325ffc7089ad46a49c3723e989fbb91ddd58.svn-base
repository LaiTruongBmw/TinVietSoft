<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>OQC Inquiry</title>
</head>

<script>
 
    var  user_pk =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var iColOrd_Qty         = 14,
        iColDefect_Qty      = 23 ;

 //---------------------------------------------------------
 function BodyInit()
 {
      grdMaster.GetGridControl().FrozenCols = 7;
       
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
    
      BindingDataList();
      MergeColumn();
      OnFormatGrid();
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
{
      grdMaster.GetGridControl().MergeCells  = 2 ;	
      grdMaster.GetGridControl().MergeCol(0) = true ;	
      grdMaster.GetGridControl().MergeCol(1) = true ;   	
      grdMaster.GetGridControl().MergeCol(2) = true ;	
      grdMaster.GetGridControl().MergeCol(3) = true ;
      grdMaster.GetGridControl().MergeCol(4) = true ;
      grdMaster.GetGridControl().MergeCol(5) = true ;
      grdMaster.GetGridControl().MergeCol(6) = true ;
      grdMaster.GetGridControl().MergeCol(7) = true ;
      grdMaster.GetGridControl().MergeCol(8) = true ;
      grdMaster.GetGridControl().MergeCol(9) = true ;
      grdMaster.GetGridControl().MergeCol(10) = true ;
      grdMaster.GetGridControl().MergeCol(11) = true ;
      grdMaster.GetGridControl().MergeCol(12) = true ;
      grdMaster.GetGridControl().MergeCol(14) = true ;
      grdMaster.GetGridControl().MergeCol(15) = true ;
      grdMaster.GetGridControl().MergeCol(16) = true ;
      grdMaster.GetGridControl().MergeCol(17) = true ;
      grdMaster.GetGridControl().MergeCol(18) = true ;
      grdMaster.GetGridControl().MergeCol(19) = true ;
      grdMaster.GetGridControl().MergeCol(20) = true ;
      grdMaster.GetGridControl().MergeCol(21) = true ;
      grdMaster.GetGridControl().MergeCol(22) = true ;
      grdMaster.GetGridControl().MergeCol(23) = true ;	
}

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var sData="";
        
    sData = "DATA|O|Order Date|E|ETD";

    idList.SetDataText(sData);
        
 }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdMaster' :
                fpfo00050.Call("SELECT");
            break; 
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "fpfo00050" :

            break;

            
            
      }  
 }
 
//------------------------------------------------------------------------------------------------

function OnDateChange()
{
	var strRad = radSearchDate.GetData();
	
	switch (strRad)
	{
		case 'a':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
			break;			
		case 'b':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-14));
			break;
		case 'c':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
			break;						
	}
}

//---------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var ctrl = grdMaster.GetGridControl();
    ctrl.ColFormat(iColOrd_Qty) = "###,###,###.##" ;
    ctrl.ColFormat(iColDefect_Qty) = "###,###,###.##" ;
}

//---------------------------------------------------------------------------------------
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpfo00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3" function="prod.sp_sel_fpfo00050" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="ckClose" />  
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table width="100%">
        <tr id='top'>
            <td>
                <table width="100%">
                    <tr>
                        <td style="width: 10%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <b>From</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 3%" align="right">
                            <b>To</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 22%" align="center">
                            <gw:radio id="radSearchDate" value="a" styles="width:100%" onchange="OnDateChange()">                      
			                    <span value="a">1 Week</span>                       
			                    <span value="b">2 Weeks</span>    
			                    <span value="c">1 Month</span>                
        			        </gw:radio>
                        </td>
                        <td style="width: 7%" align="right">
                            <b>SO No</b>
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:checkbox id="ckClose" defaultvalue="Y|N" value="N" />
                        </td>
                        <td style="width: 11%" align="left">
                            <b>Closed Order</b>
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 4%" align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="12">
                            <gw:grid id='grdMaster' header='_TSA_SALEORDER_PK|SO No|_ORDER_DT|Etd|_TSA_SALEORDERD_PK|_TCO_STITEM_PK|_STITEM_CODE|_STITEM_NAME|_TCO_ITEM_PK|Item Code|Item Name|UOM|_ST_ORD_QTY|_ST_UNIT|Ord Qty|_ITEM_UNIT|_TPR_OQCRESULT_PK|_TPR_DEFECTTYPE_PK|_DEFECTTYPE_ID|Defect Type|_TPR_DEFECT_PK|_DEFECT_ID|Defect|Defect Qty'
                                format='0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|3'
                                defaults='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1000|1500|1200|1200|1000|1000|1440|1000|1000|1500|4000|800|1000|1000|1000|800|1000|1000|1230|1740|1000|1000|1395|1000'
                                sorting='T' styles='width:100%; height:450' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtMaster_PK" style="display: none" />
</body>
</html>
