<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Plan for W/I Process Issue</title>
</head>

<script>
    
var G1_Array_SO_PK      = 0,
    G1_PO_No            = 1,
    G1_From_DT          = 2,
    G1_To_DT            = 3,
    G1_TCO_STITEM_PK    = 4,
    G1_TCO_ITEM_PK      = 5,
    G1_Code             = 6,
    G1_Name             = 7,
    G1_SPEC01_PK        = 8,
    G1_Spec_01          = 9,
    G1_SPEC02_PK        = 10,
    G1_Spec_02          = 11,
    G1_SPEC03_PK        = 12,
    G1_Spec_03          = 13,
    G1_SPEC04_PK        = 14,
    G1_Spec_04          = 15,
    G1_SPEC05_PK        = 16,
    G1_Spec_05          = 17,
    G1_Plan_Qty         = 18,
    G1_Prod_Qty         = 19,
    G1_Bal_Qty          = 20,
    G1_PlanD_PK         = 21;
 //===============================================================
 function BodyInit()
 {
    System.Translate(document);
     //----------------------
     txtWIMasterPK.text = "<%=Request.querystring("WI_PK")%>"; 
     txtItem.text   = "<%=Request.querystring("ITEM_CODE")%>";
     //----------------------
     FormatGrid();
     
     OnChangeTab();
     //---------------------- 
 }
 
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                 data_fppw00012.Call("SELECT");
            break;
      }  
 }
 
//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      trl.FrozenCols = G1_TCO_STITEM_PK ;
      
      trl.ColFormat(G1_Plan_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G1_Prod_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G1_Bal_Qty)    = "###,###,###,###,###"; 
      
      trl.MergeCells = 2;
      trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
      trl.MergeCol(2) = true;
      trl.MergeCol(3) = true;
      trl.MergeCol(4) = true;        
      trl.MergeCol(5) = true; 
      trl.MergeCol(6) = true; 
      trl.MergeCol(7) = true; 
      trl.MergeCol(8) = true; 
      trl.MergeCol(9) = true; 
      trl.MergeCol(10)= true; 
      trl.MergeCol(11)= true; 
      trl.MergeCol(12)= true; 
      trl.MergeCol(13)= true; 
      trl.MergeCol(14)= true; 
      trl.MergeCol(15)= true;    
      trl.MergeCol(16)= true; 
      trl.MergeCol(17)= true;       
      //-------------------------------------------------      
      var ITEM_GRP_PK = "<%=Request.querystring("ITEM_GRP_PK")%>"; 
      
      var data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from comm.tco_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( SALE_YN = 'Y' or PROD_YN = 'Y' ) ORDER BY grp_cd")%>";   
      lstGroup.SetDataText(data);
      
      if ( Number(ITEM_GRP_PK)>0 )
      {
            lstGroup.value = ITEM_GRP_PK ;
      }
      //-------------------------------------------------  
                                            
 }        

//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		        
            case 'data_fppw00012' :
                lbRecord.text = grdDetail.rows-1 + " (s)";
            break;            
      }  
 }

//=======================================================================

 function OnChangeTab()
 { 
    var strRad = radSearchItem.GetData();
             
	switch (strRad)
	{
        case 'order_plan':
		    tab_order_plan.style.color  = "cc0000";
		    tab_free_item.style.color   = "";
		    
		    t_date.style.display       = "";
		    t_from_to.style.display    = "";
		    t_po_no.style.display      = "";
		    
		    txtPONo.style.display      = "";
		    
            grdDetail.GetGridControl().ColHidden(G1_PO_No)    = false;
            grdDetail.GetGridControl().ColHidden(G1_From_DT)  = false;
            grdDetail.GetGridControl().ColHidden(G1_To_DT)    = false;            
		    grdDetail.GetGridControl().ColHidden(G1_Plan_Qty) = false;
		    grdDetail.GetGridControl().ColHidden(G1_Prod_Qty) = false;
		    grdDetail.GetGridControl().ColHidden(G1_Bal_Qty)  = false;		    	
        break;	
        
        case 'free_item':
		    tab_order_plan.style.color  = "";
		    tab_free_item.style.color   = "cc0000";	
		    
		    t_date.style.display       = "none";
		    t_from_to.style.display    = "none";
		    t_po_no.style.display      = "none";
		    
		    txtPONo.style.display      = "none";
		    
            grdDetail.GetGridControl().ColHidden(G1_PO_No)    = true;
            grdDetail.GetGridControl().ColHidden(G1_From_DT)  = true;
            grdDetail.GetGridControl().ColHidden(G1_To_DT)    = true;            
		    grdDetail.GetGridControl().ColHidden(G1_Plan_Qty) = true;
		    grdDetail.GetGridControl().ColHidden(G1_Prod_Qty) = true;
		    grdDetail.GetGridControl().ColHidden(G1_Bal_Qty)  = true;		    
        break;	        
    } 
 }
//=================================================================

function OnSelect(pos)
{
    switch (pos)
    {
        case 'ALL' :
        
            var array_po       = '';
            var array_so_pk    = '';
                                       
            var arr_data = new Array();
            
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     if ( array_so_pk == '' )
                     {
                         array_po    = array_po    + grdDetail.GetGridData( i, G1_PO_No ) + ',';
                         array_so_pk = array_so_pk + grdDetail.GetGridData( i, G1_Array_SO_PK)    + ',';
                     }    
                     //---------------------------------------                   
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
            
            if ( arr_data != null )
            {
                var callerWindowObj = dialogArguments;                   
                  
                callerWindowObj.txtArraySOPK.text = array_so_pk.substring( 0, array_so_pk.length-1 );
                callerWindowObj.txtPONo.text      = array_po.substring(    0, array_po.length-1    );                                                
            }
                      
            window.returnValue =  arr_data;
            window.close();
            
        break;              
    }        
}

//=========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppw00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppw00012" > 
                <input> 
                    <input bind="radSearchItem" /> 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 20%; white-space: nowrap; background-color: #B4E7FF" align="center"
                rowspan="2">
                <gw:radio id="radSearchItem" value="order_plan" styles="width:100%" onchange="OnChangeTab()">                      
                    <span id="tab_order_plan" value="order_plan">Order Plan</span> 
                    <span id="tab_free_item" value="free_item">Free Item</span>    			                                
                </gw:radio>
            </td>
            <td style="width: 10%" align="right">
                Group
            </td>
            <td style="width: 30%">
                <gw:list id="lstGroup" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 10%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td colspan="3" align="center" style="white-space: nowrap">
                <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
            </td>
        </tr>
        <tr>
            <td style="width: 10%" align="right">
                <b id="t_date">Date</b>
            </td>
            <td style="width: 30%; white-space: nowrap" align="left">
                <b id="t_from_to">
                    <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                    ~
                    <gw:datebox id="dtTo" lang="1" styles="width:100%" />
                </b>
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                <b id="t_po_no">P/O No</b>
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtPONo" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 3%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect01" img="select" alt="Select" onclick="OnSelect('ALL')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_Array_SO_PK|P/O No|From|To|_TCO_STITEM_PK|_TCO_ITEM_PK|Code|Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Plan Qty|Prod Qty|Bal Qty|_PlanD_PK'
                    format='0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|0'
                    defaults='|||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1200|1200|1200|1000|1000|1500|3000|0|1200|0|1200|0|1200|0|1200|0|1200|1000|1000|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIMasterPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
