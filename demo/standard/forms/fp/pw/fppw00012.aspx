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
    
var G1_WP_PK            = 0,
    G1_WProcess         = 1,
    G1_SPEC01_PK        = 2,
    G1_Spec_01          = 3,
    G1_SPEC02_PK        = 4,
    G1_Spec_02          = 5,
    G1_SPEC03_PK        = 6,
    G1_Spec_03          = 7,
    G1_SPEC04_PK        = 8,
    G1_Spec_04          = 9,
    G1_SPEC05_PK        = 10,
    G1_Spec_05          = 11,
    G1_Plan_Qty         = 12,
    G1_WI_Qty           = 13,
    G1_Bal_Qty          = 14;
 //===============================================================
 var callerWindowObj = dialogArguments;
 
 function BodyInit()
 {
     //----------------------
       System.Translate(document);
     txtOrdPlanPK.text = callerWindowObj.txtOrdPlanPK.text //neu du lieu co ky tu dac biet 
     
     //----------------------
     FormatGrid();
     //----------------------
     OnSearch('STYLE');
      
 } 

//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      trl.FrozenCols = G1_SPEC01_PK ;
      
      trl.ColFormat(G1_Plan_Qty) = "###,###,###,###,###";
      trl.ColFormat(G1_WI_Qty)   = "###,###,###,###,###";
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
      //-------------------------------------------------                                                  
 }        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fppw00012.Call("SELECT");
            break;
            
            case 'STYLE': 
                pro_fppw00012_1.Call("SELECT");
            break;
            
            case 'WP':
                pro_fppw00012.Call();
            break;                    
      }  
 }
 
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		        
            case 'pro_fppw00012_1':
                OnSearch('WP');
            break;  
            
            case 'data_fppw00012':
                lbRecord.text = grdDetail.rows-1 + " (s)";
                 
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_WProcess, grdDetail.rows - 1, G1_WProcess, true);
                    grdDetail.SetCellBold( 1, G1_Plan_Qty, grdDetail.rows - 1, G1_Bal_Qty,  true);
                    
                    grdDetail.Subtotal( 0, 2, -1, '12!13!14','###,###,###');                    
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
                if ( grdDetail.GetGridControl().isSelected(i) == true && grdDetail.GetGridData(i,G1_WP_PK) != '' )
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
    <gw:data id="pro_fppw00012_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fppw00012_1"  > 
                <inout> 
                    <inout bind="txtOrdPlanPK" />
                    <inout bind="lblStyleName" />
                    <inout bind="lblPONo"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00012" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstWProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppw00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppw00012" > 
                <input> 
                    <input bind="txtOrdPlanPK" />
                    <input bind="lstWProcess" />                    
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">            
            <td style="width: 5%" align="right">
                Style
            </td>
            <td style="width: 50%">
                <gw:label id="lblStyleName" styles='width:100%;color:cc0000;font:10pt' text='style' />
            </td>
            <td style="width: 5%" align="right">
                P/O
            </td>
            <td colspan="4">
                <gw:label id="lblPONo" styles='width:100%;color:cc0000;font:10pt' text='PO' />
            </td>
        </tr>
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                W/P
            </td>
            <td style="width: 50%">
                <gw:list id="lstWProcess" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td align="center" style="white-space: nowrap">
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
            <td colspan="7">
                <gw:grid id='grdDetail' 
                    header='_WP_PK|W/Process|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Plan Qty|W/I Qty|Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|1|0|1|0|1|0|1|0|1|3|3|3'
                    defaults='||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|2000|0|1500|0|1500|0|1500|0|1500|0|1500|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
     <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none;' />
</body>
</html>
