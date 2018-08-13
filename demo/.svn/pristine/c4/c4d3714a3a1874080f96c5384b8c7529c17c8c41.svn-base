<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Process W/I Entry</title>
</head>

<script>
    
var G1_ORDPLAN_PK   = 0,
    G1_Array_SO_PK  = 1,
    G1_PO_No        = 2,    
    G1_STYLE_PK     = 3,
    G1_Style_Code   = 4,
    G1_Style_Name   = 5,
    G1_Plan_Qty     = 6,    
    G1_PROCESS_PK   = 7,
    G1_Seq          = 8,
    G1_Process      = 9,  
    G1_WI_Plan      = 10,      
    G1_WI_Qty       = 11,
    G1_Prod_Qty     = 12,
    G1_Defect_Qty   = 13,
    G1_Bal_Qty      = 14;
    
var 
    G2_LINE     = 0,
    G2_WI_No    = 2,
    G2_WI_Qty   = 5;       
    
 //========================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    dtOrderFrom.SetDataText(System.AddDate(dtOrderTo.GetData(),-30)); 
    //-----------------------------------------------------
    FormatGrid();
    BindingDataList();    

}
//========================================================================
function BindingDataList()
{    
    var data="";    
        
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, process_id || ' - ' || process_name FROM tlg_pb_process WHERE del_if = 0 ORDER BY process_id ") %>||Select ALL" ;    
    lstProcess.SetDataText(data);
    lstProcess.value = 'ALL';
    
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID " )  %>|ALL|Select ALL " ; 
    lstLine.SetDataText(data);
    lstLine.value = 'ALL';               

} 
//========================================================================
function FormatGrid()
{    
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G1_Plan_Qty)    = "###,###,###,###.##";
    ctrl.ColFormat(G1_WI_Plan)     = "###,###,###,###.##";
    ctrl.ColFormat(G1_WI_Qty)      = "###,###,###,###.##";
    ctrl.ColFormat(G1_Prod_Qty)    = "###,###,###,###.##";
    ctrl.ColFormat(G1_Defect_Qty)  = "###,###,###,###.##";
    ctrl.ColFormat(G1_Bal_Qty)     = "###,###,###,###.##";  
    //-----------------------------------
    ctrl = grdOverView.GetGridControl();

    ctrl.ColFormat(5)  = "###,###,###,###.##";
   
    //-----------------------------------    

    grdOrdPlan.GetGridControl().MergeCells  = 2 ;	
    grdOrdPlan.GetGridControl().MergeCol(0) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(1) = true ;   	
    grdOrdPlan.GetGridControl().MergeCol(2) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(3) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(4) = true ;
    grdOrdPlan.GetGridControl().MergeCol(5) = true ;
    grdOrdPlan.GetGridControl().MergeCol(6) = true ;
        
    grdOverView.GetGridControl().MergeCells  = 2 ;	
    grdOverView.GetGridControl().MergeCol(0) = true ;	
    grdOverView.GetGridControl().MergeCol(1) = true ;   	
    grdOverView.GetGridControl().MergeCol(2) = true ;	
    grdOverView.GetGridControl().MergeCol(3) = true ;	
    grdOverView.GetGridControl().MergeCol(4) = true ;	
    //-----------------------------------
}     

 //========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {
            case 'grdOrdPlan' :
                data_fppw00070.Call("SELECT");
            break; 
                        
            case 'grdOverView':
                
                data_fppw00070_2.Call("SELECT");
            break;               
      }  
 }
 
 //========================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "data_fppw00070" :
                var p_ordplan_pk ;
                
                if ( grdOrdPlan.rows > 1 )
                {
                    grdOrdPlan.SetCellBold( 1, G1_PO_No,    grdOrdPlan.rows - 1, G1_PO_No,    true);
                    grdOrdPlan.SetCellBold( 1, G1_Plan_Qty, grdOrdPlan.rows - 1, G1_Plan_Qty, true);
                    grdOrdPlan.SetCellBold( 1, G1_WI_Plan,  grdOrdPlan.rows - 1, G1_Bal_Qty,  true);
                    
                    p_ordplan_pk = grdOrdPlan.GetGridData( 1, G1_ORDPLAN_PK);
                }
                
                //-------------------
                
                for ( var i=1; i<grdOrdPlan.rows; i++ )
                {
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
                
                grdOrdPlan.Subtotal( 0, 2, -1, '10!11!12!13!14','###,###,###');               
            break; 
            
            case "data_fppw00070_2" :
                var temp ="";
                
                if ( grdOverView.rows > 1 )
                {
                    grdOverView.SetCellBold( 1, G2_LINE,   grdOverView.rows - 1, G2_LINE,   true);
                    grdOverView.SetCellBold( 1, G2_WI_Qty, grdOverView.rows - 1, G2_WI_Qty, true);
                    grdOverView.SetCellBold( 1, G2_WI_No,  grdOverView.rows - 1, G2_WI_No,  true);
                     
                    temp = grdOverView.GetGridData( 1, G2_LINE);
                }
               
                for ( var i=1; i<grdOverView.rows; i++ )
                {
                    if ( temp != grdOverView.GetGridData( i, G2_LINE) )
                    {
                        temp = grdOverView.GetGridData( i, G2_LINE);
                    
                        while ( grdOverView.rows > i && temp == grdOverView.GetGridData( i, G2_LINE))
                        {
                            grdOverView.SetCellBgColor( i, 0, i, grdOverView.cols - 1, 0xCCFFFF );                             
                            i++;
                        }
                        
                        if ( grdOverView.rows > i )
                        {
                            temp = grdOverView.GetGridData( i, G2_LINE);
                        }                           
                    }                    
                }   
                //------------------- 
                
                grdOverView.Subtotal( 0, 2, -1, '5','###,###,###');  
            break;                                                     
      }
 }       
//========================================================================

function OnPopUp(pos)
{
    switch (pos)         
    {
        case "MakeWI" :        
            if ( grdOrdPlan.row > 0 )
            {
                var path = System.RootURL + "/form/fp/pw/fppw00071.aspx";
	            var object = System.OpenModal( path , 1000 , 700 ,  'resizable:yes;status:yes', this);
            }
            else
            {
                alert("Pls select one Order Plan.");
            }
        break;    
    }
}

//========================================================================
</script>

<body>
    <!--------------------SO List------------------------------------->
    <gw:data id="data_fppw00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppw00070" > 
                <input> 
                    <input bind="lstProcess" />
                    <input bind="txtPOStyle" />
                    <input bind="dtOrderFrom" /> 
                    <input bind="dtOrderTo" /> 
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------Over View------------------------------------->
    <gw:data id="data_fppw00070_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppw00070_2" > 
                <input> 
                    <input bind="lstLine" />
                    <input bind="dtWorkFrom" />
                    <input bind="dtWorkTo" /> 
                    <input bind="txtPOStyle2" /> 
                </input> 
                <output bind="grdOverView" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <!-- <gw:tab id="tab"> -->
                <gw:tab id="tab">
                <table name="Order Plan" style="width: 100%; height: 100%" border="1">
                    <tr style="height: 1%">
                        <td style="width: 50%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%">
                                        Date</td>
                                    <td style="width: 20%; white-space: nowrap">
                                        <gw:datebox id="dtOrderFrom" lang="1" styles="width:80%" />
                                        ~
                                        <gw:datebox id="dtOrderTo" lang="1" styles="width:80%" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        PO/Style
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtPOStyle" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Process</td>
                                    <td style="width: 45%">
                                        <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('grdOrdPlan')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnMakeWI" img="2" text="Make W/I" styles='width:100%' onclick="OnPopUp('MakeWI')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <gw:grid id='grdOrdPlan' header='_PP_ORDPLAN_PK|_Array_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|Plan Qty|_PB_PROCESS_PK|Seq|Process ID|W/I Plan|W/I Issue|Prod Qty|Defect Qty|Prod Bal Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|3|0|1|0|3|3|3|3|3' 
                                defaults='||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                widths='0|0|1500|0|1500|3500|1500|0|800|1500|1500|1500|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%'  />
                        </td>
                    </tr>
                    
                </table>
                <table name="Work Instruction" style="width: 100%; height: 100%" border="1">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space:nowrap" align="right">
                                       W/I Date</td>
                                    <td style="width: 20%; white-space: nowrap">
                                        <gw:datebox id="dtWorkFrom" lang="1" styles="width:80%" />
                                        ~<gw:datebox id="dtWorkTo" lang="1" styles="width:80%" /></td>
                                    <td style="width: 5%; white-space:nowrap" align="right">
                                        Line Grp</td>
                                    <td style="width: 35%">
                                        <gw:list id="lstLine" text="" styles="width:100%" onchange="OnSearch('grdOverView')" />
                                    </td>
                                    
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        WI/PO/Style
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtPOStyle2" styles='width:100%' onenterkey="OnSearch('grdOverView')" />
                                    </td>
                                    
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSearch2" img="search" onclick="OnSearch('grdOverView')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                             
                            <gw:grid id='grdOverView'
                            header='Line Name|W/I Date|W/I No|P/O NO|Style|W/I Qty|Shift'
                            format='0|4|0|0|0|1|0'
                            aligns='0|0|0|0|0|0|0'
                            defaults='||||||'
                            editcol='0|0|0|0|0|0|0'
                            widths='2500|1200|1500|1500|3500|1500|1500'
                            sorting='T' 
                            styles='width:100%; height:100%'
                            />
                           
                        </td>
                    </tr>
                </table>
                </gw:tab>
                <!-- </gw:tab> -->
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
