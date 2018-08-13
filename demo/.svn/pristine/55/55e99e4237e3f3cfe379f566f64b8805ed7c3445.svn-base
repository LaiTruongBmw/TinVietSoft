<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Plan for Component</title>
</head>

<script>
    
var G1_COMP_PK          = 0,
    G1_COMP_ID          = 1,
    G1_COMP_NAME        = 2,  
    G1_SPEC01_PK        = 3,
    G1_Spec_01          = 4,
    G1_SPEC02_PK        = 5,
    G1_Spec_02          = 6,
    G1_SPEC03_PK        = 7,
    G1_Spec_03          = 8,
    G1_SPEC04_PK        = 9,
    G1_Spec_04          = 10,
    G1_SPEC05_PK        = 11,
    G1_Spec_05          = 12,
    G1_Plan_Qty         = 13,
    G1_Out_Qty          = 14,
    G1_Bal_Qty          = 15;
    
 //==============================================================
 
 function BodyInit()
 {
    System.Translate(document); 
     var p_pp_ordplan_pk      = "<%=Request.querystring("pp_ordplan_pk")%>";
      
     txtOrdPlanPK.text = Number(p_pp_ordplan_pk);
     //----------------------
     FormatGrid();
     //----------------------      
 } 

//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();
      
      trl.ColFormat(G1_Plan_Qty) = "###,###,###,###,###";      
      
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
      //-------------------------------------------------                                                  
 }        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fppr00122.Call("SELECT");
            break;                 
      }  
 }
 
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		                    
            case 'data_fppr00122':
                lbRecord.text = grdDetail.rows-1 + " (s)";
                 
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_COMP_ID,  grdDetail.rows - 1, G1_COMP_ID,  true);
                    grdDetail.SetCellBold( 1, G1_Plan_Qty, grdDetail.rows - 1, G1_Plan_Qty, true);
                    
                    grdDetail.Subtotal( 0, 2, -1, '13!14!15','###,###,###');                    
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
                if ( grdDetail.GetGridControl().isSelected(i) == true )
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
    <gw:data id="data_fppr00122" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00122" > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
                    <input bind="chkSpec01" />
                    <input bind="chkSpec02" />
                    <input bind="chkSpec03" />
                    <input bind="chkSpec04" />
                    <input bind="chkSpec05" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 15%" align="left">
                Spec 01
                <gw:checkbox id="chkSpec01" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 15%" align="left">
                Spec 02
                <gw:checkbox id="chkSpec02" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 15%" align="left">
                Spec 03
                <gw:checkbox id="chkSpec03" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 15%" align="left">
                Spec 04
                <gw:checkbox id="chkSpec04" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 15%" align="left">
                Spec 05
                <gw:checkbox id="chkSpec05" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdDetail')" />
            </td>
            <td align="center" style="white-space: nowrap; width: 23%">
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
            <td colspan="8">
                <gw:grid id='grdDetail' header='_COMP_PK|COMP ID|COMP NAME|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Plan Qty|Out Qty|Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1200|3000|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none;' />
    <gw:textbox id="txtWPPK" styles='width:100%;display:none;' />
    <!------------------------------------------------------------------>
</body>
</html>
