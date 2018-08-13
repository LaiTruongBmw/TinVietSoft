<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Plan for Line Result</title>
</head>

<script>
    
var G1_ORDPLAN_PK       = 0,
    G1_PO_No            = 1,
    G1_STYLE_PK         = 2,
    G1_STYLE_ID         = 3,
    G1_STYLE_NAME       = 4,  
    G1_SPEC01_PK        = 5,
    G1_Spec_01          = 6,
    G1_SPEC02_PK        = 7,
    G1_Spec_02          = 8,
    G1_SPEC03_PK        = 9,
    G1_Spec_03          = 10,
    G1_SPEC04_PK        = 11,
    G1_Spec_04          = 12,
    G1_SPEC05_PK        = 13,
    G1_Spec_05          = 14,
    G1_Plan_Qty         = 15,
    G1_Prod_Qty         = 16,
    G1_Bal_Qty          = 17;
 //===============================================================
 
 function BodyInit()
 {
     var p_work_process_pk = "<%=Request.querystring("work_process_pk")%>";
     
     txtWProcessPK.text = Number(p_work_process_pk);
     //----------------------
     FormatGrid();
     //----------------------
     OnSearch('WP');
      
 } 

//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      //trl.FrozenCols = G1_SPEC01_PK ;
      
      trl.ColFormat(G1_Plan_Qty) = "###,###,###,###,###";
      trl.ColFormat(G1_Prod_Qty) = "###,###,###,###,###";
      trl.ColFormat(G1_Bal_Qty)  = "###,###,###,###,###"; 
      
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
      //-------------------------------------------------                                                  
 }        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fppr00013.Call("SELECT");
            break;
            
            case 'WP':
                pro_fppr00013.Call("SELECT");
            break;                    
      }  
 }
 
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		                    
            case 'data_fppr00013':
                lbRecord.text = grdDetail.rows-1 + " (s)";
                 
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_PO_No, grdDetail.rows - 1, G1_PO_No, true);
                    grdDetail.SetCellBold( 1, G1_Plan_Qty, grdDetail.rows - 1, G1_Bal_Qty,  true);
                    
                    grdDetail.Subtotal( 0, 2, -1, '15!16!17','###,###,###');                    
                }  
            break;                                             
      }  
 }

//=================================================================

function OnSelect(pos)
{
    switch (pos)
    {
        case 'ALL' :
                                               
            var arr_data = new Array();
            
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true && grdDetail.GetGridData(i,G1_ORDPLAN_PK) != '' )
                {
                     //---------------------------------------                   
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
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
    <gw:data id="pro_fppr00013" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fppr00013"  > 
                <inout> 
                    <inout bind="txtWProcessPK" />
                    <inout bind="lblWProcess" />
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00013" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00013" > 
                <input> 
                    <input bind="txtWProcessPK" /> 
                    <input bind="txtPO" />
                    <input bind="txtItem" />                 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 5%; white-space: nowrap; display:none" align="right">
                W/P
            </td>
            <td style="width: 30%">
                <gw:label id="lblWProcess" styles='width:300%;color:cc0000;font:10pt' text='style' />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                P/O
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtPO" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>

            <td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td align="center" style="white-space: nowrap; width: 18%">
                <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect01" img="select" alt="Select" onclick="OnSelect('ALL')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="9">
                <gw:grid id='grdDetail' header='_PP_ORDPLAN_PK|P/O No|_Style_PK|Style ID|Style Name|_SPEC01_PK|_Spec 01|_SPEC02_PK|Color|_SPEC03_PK|Size|_SPEC04_PK|_Spec 04|_SPEC05_PK|_Spec 05|Plan Qty|_Prod Qty|_Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3'
                    defaults='|||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|2000|0|1500|2500|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWProcessPK" styles='width:100%;display:none;' />
</body>
</html>
