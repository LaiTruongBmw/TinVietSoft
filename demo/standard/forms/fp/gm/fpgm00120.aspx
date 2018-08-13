<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>P/O W/Process Balance</title>
</head>

<script>
    
var G1_ORDPLAN_PK   = 0,
    G1_Array_SO_PK  = 1,
    G1_PO_No        = 2,    
    G1_STYLE_PK     = 3,
    G1_Style_Code   = 4,
    G1_Style_Name   = 5,
    G1_Ord_Qty      = 6,    
    G1_WPro_PK      = 7,
    G1_Seq          = 8,
    G1_WProcess     = 9, 
    G1_Plan_Qty     = 10,
    G1_WI_Qty       = 11,
    G1_Wait_Qty     = 12,
    G1_Prepare_Qty  = 13,
    G1_Process_Qty  = 14,
    G1_Finish_Qty   = 15,
    G1_Prod_Qty     = 16,
    G1_Defect_Qty   = 17,
    G1_Plan_Bal     = 18,
    G1_WI_Bal       = 19;         
    
 //========================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //-----------------------------------------------------
    FormatGrid();
    BindingDataList();    
    
}
//========================================================================
function BindingDataList()
{    
    var data="";    
        
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, process_id || ' - ' || process_name FROM prod.pb_process WHERE del_if = 0 and use_yn = 'Y' ORDER BY process_id ") %>||" ;    
    lstProcess.SetDataText(data);  
    lstProcess.value = '' ;             
} 
//========================================================================
function FormatGrid()
{    
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G1_Ord_Qty)  = "###,###,###,###";
    ctrl.ColFormat(G1_Plan_Qty) = "###,###,###,###"; 
    ctrl.ColFormat(G1_WI_Qty)   = "###,###,###,###"; 
        
    ctrl.ColFormat(G1_Wait_Qty)    = "###,###,###,###";
    ctrl.ColFormat(G1_Prepare_Qty) = "###,###,###,###";
    ctrl.ColFormat(G1_Process_Qty) = "###,###,###,###";
    ctrl.ColFormat(G1_Finish_Qty)  = "###,###,###,###"; 
     
    ctrl.ColFormat(G1_Prod_Qty)   = "###,###,###,###"; 
    ctrl.ColFormat(G1_Defect_Qty) = "###,###,###,###"; 
    ctrl.ColFormat(G1_Plan_Bal)   = "###,###,###,###"; 
    ctrl.ColFormat(G1_WI_Bal)     = "###,###,###,###"; 
    //-----------------------------------    

    grdOrdPlan.GetGridControl().MergeCells  = 2 ;	
    grdOrdPlan.GetGridControl().MergeCol(0) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(1) = true ;   	
    grdOrdPlan.GetGridControl().MergeCol(2) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(3) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(4) = true ;
    grdOrdPlan.GetGridControl().MergeCol(5) = true ;
    grdOrdPlan.GetGridControl().MergeCol(6) = true ;
       
    //-----------------------------------
}     

 //========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {
            case 'grdOrdPlan' :
                data_fpgm00120.Call("SELECT");
            break; 
      }  
 }
 
 //========================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "data_fpgm00120" :
                var p_ordplan_pk ;
                
                if ( grdOrdPlan.rows > 1 )
                {
                    grdOrdPlan.SetCellBold( 1, G1_PO_No,    grdOrdPlan.rows - 1, G1_PO_No,      true);
                    grdOrdPlan.SetCellBold( 1, G1_WProcess, grdOrdPlan.rows - 1, G1_WProcess,   true);
                    grdOrdPlan.SetCellBold( 1, G1_Wait_Qty, grdOrdPlan.rows - 1, G1_Finish_Qty, true);
                    
                    p_ordplan_pk = grdOrdPlan.GetGridData( 1, G1_ORDPLAN_PK);
                }
                
                //-------------------
                
                for ( var i=1; i<grdOrdPlan.rows; i++ )
                {
                    if ( Number(grdOrdPlan.GetGridData( i, G1_Plan_Qty)) <= Number(grdOrdPlan.GetGridData( i, G1_Prod_Qty))*(1.03) )
                    {
                        grdOrdPlan.GetGridControl().Cell( 7, i, G1_WProcess, i, G1_WI_Bal ) = 0x3300cc;
                    }
                    //-------------------------------------------------------------                
                    if ( p_ordplan_pk != grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK) )
                    {
                        p_ordplan_pk = grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK);
                    
                        while ( grdOrdPlan.rows > i && p_ordplan_pk == grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK))
                        {
                            grdOrdPlan.SetCellBgColor( i, 1, i, grdOrdPlan.cols - 1, 0xCCFFFF );                             
                            i++;
                        }
                        
                        if ( grdOrdPlan.rows > i )
                        {
                            p_ordplan_pk = grdOrdPlan.GetGridData( i, G1_ORDPLAN_PK);
                        }                                                                           
                    }                    
                }   
                //------------------- 
                
                grdOrdPlan.Subtotal( 0, 2, -1, '10!11!12!13!14!15!16!17!18!19','###,###,###');               
            break;            
      }
 }       
 
//========================================================================
function OnCellDoubleClick(obj)
{
    switch(obj.id)
    {        
        case 'grdOrdPlan' :
            OnPopUp('ViewDetail');      
        break;
    }
}
//========================================================================
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'ViewDetail' :
            if ( grdOrdPlan.row > 0 )
            {
                if ( grdOrdPlan.col == G1_Wait_Qty )
                {
                     var path = System.RootURL + '/form/fp/gm/fpgm00121.aspx?type=1&pp_ordplan_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK) +'&pb_work_process_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_WPro_PK);
                     var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');                
                }
                else if ( grdOrdPlan.col == G1_Prepare_Qty )
                {
                     var path = System.RootURL + '/form/fp/gm/fpgm00121.aspx?type=2&pp_ordplan_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK) +'&pb_work_process_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_WPro_PK);
                     var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');                            
                }
                
                else if ( grdOrdPlan.col == G1_Process_Qty )
                {
                     var path = System.RootURL + '/form/fp/gm/fpgm00121.aspx?type=3&pp_ordplan_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK) +'&pb_work_process_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_WPro_PK);
                     var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');                            
                }
                else if ( grdOrdPlan.col == G1_Finish_Qty )
                {
                     var path = System.RootURL + '/form/fp/gm/fpgm00121.aspx?type=4&pp_ordplan_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK) +'&pb_work_process_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_WPro_PK);
                     var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');                            
                }                        
            }
            else
            {
                alert('Pls select one P/O.');
            }
        break;
        
        
        case 'COMP_STOCK':
            if ( grdOrdPlan.row > 0 )
            {
                var path = System.RootURL + '/form/fp/gm/fpgm00122.aspx?pp_ordplan_pk='+ grdOrdPlan.GetGridData( grdOrdPlan.row, G1_ORDPLAN_PK);
                var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');                                                
            }
            else
            {
                alert('Pls select one P/O.');
            }            
        break;
    }    
}

//========================================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'WP':
            pro_fpgm00120.Call();
        break;
    }
}    
//========================================================================
        
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00120" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstWP" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fpgm00120" > 
                <input> 
                    <input bind="lstProcess" />
                    <input bind="lstWP" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Total">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Process</td>
            <td style="width: 30%">
                <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnProcess('WP')" />
            </td>
            <td style="width: 5%; white-space: nowrap">
                W/Process</td>
            <td style="width: 25%">
                <gw:list id="lstWP" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtPOStyle" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
            </td>
            <td style="width: 7%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnLoadData" img="1" text="Comp Stock" onclick="OnPopUp('COMP_STOCK')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnViewDetail" img="2" text="View Detail" onclick="OnPopUp('ViewDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('grdOrdPlan')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id='grdOrdPlan' header='_PP_ORDPLAN_PK|_Array_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|Ord Qty|_PB_PROCESS_PK|Seq|W/Process|Plan Qty|W/I Qty|Waiting|Prepared|Processing|Finished|Prod Qty|Defect Qty|Plan Bal|W/I Bal'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|3|0|1|0|3|3|3|3|3|3|3|3|3|3'
                    defaults='|||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|2000|0|2000|3500|1200|0|800|2000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
