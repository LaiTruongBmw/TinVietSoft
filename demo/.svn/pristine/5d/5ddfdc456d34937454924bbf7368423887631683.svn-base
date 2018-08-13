<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Cutting W/I Inquiry</title>
</head>

<script>
var G1_Date         = 0,
    G1_ARRAY_SO_PK  = 1,
    G1_PO_No        = 2,
    G1_STYLE_PK     = 3,
    G1_Style_Code   = 4,
    G1_Style_Name   = 5,
    G1_SPEC01_PK    = 6,
    G1_Spec_01      = 7,
    G1_SPEC02_PK    = 8,
    G1_Spec_02      = 9,
    G1_SPEC03_PK    = 10,
    G1_Spec_03      = 11,
    G1_SPEC04_PK    = 12,
    G1_Spec_04      = 13,
    G1_SPEC05_PK    = 14,
    G1_Spec_05      = 15,
    G1_Plan_Qty     = 16,
    G1_GROUP_PK     = 17,
    G1_Group_ID     = 18,
    G1_Group_Name   = 19,
    G1_Comp_PK      = 20, 
    G1_Comp_ID      = 21,
    G1_Comp_Name    = 22,    	
    G1_Req_Qty      = 23,
    G1_Result_Qty   = 24,
    G1_Bal_Qty      = 25,
    G1_Description  = 26,
    G1_ORDPLAN_PK   = 27;
    
var G2_LINE_ID      = 0,
    G2_PROD_DATE    = 1, 
    G2_PO_NO        = 2,
    G2_STYLE_CODE   = 3, 
    G2_STYLE_NAME   = 4,
    G2_COMP_ID      = 5,
    G2_COMP_NAME    = 6,
    G2_SPEC_01      = 7,
    G2_SPEC_02      = 8,
    G2_SPEC_03      = 9,
    G2_SPEC_04      = 10,
    G2_SPEC_05      = 11,
    G2_PROD_QTY     = 12,
    G2_END_TIME     = 13,
    G2_REMARK       = 14;
    
//=============================================================================             
function BodyInit()
{       
    FormatGrid();
    //-----------------
    OnSearch('grdCutGroup');
}
//=============================================================================             
function FormatGrid()
{
    var data ;

    data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' - ' || a.group_name  FROM tlg_pb_line_group a,  tlg_pb_process_linegroup b, tlg_pb_process c WHERE a.del_if = 0 AND a.pk = b.tlg_pb_line_group_pk AND b.tlg_pb_process_pk = c.pk AND c.del_if = 0 AND c.process_type = '10'  ORDER BY 1 ") %>||" ;    
    lstLineGroup.SetDataText(data); 
    lstLineGroup.value = '' ;  
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	
    
    var ctrl = grdCutGroup.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;
    ctrl.MergeCol(7) = true;
    ctrl.MergeCol(8) = true;
    ctrl.MergeCol(9) = true;
    ctrl.MergeCol(10) = true;
    ctrl.MergeCol(11) = true;
    ctrl.MergeCol(12) = true;
    ctrl.MergeCol(13) = true;
    ctrl.MergeCol(14) = true;
    ctrl.MergeCol(15) = true;
    ctrl.MergeCol(16) = true;
    ctrl.MergeCol(17) = true;
    ctrl.MergeCol(18) = true;
    ctrl.MergeCol(19) = true;
    
    ctrl.ColFormat(G1_Plan_Qty)   = "###,###,###" ;     
    ctrl.ColFormat(G1_Req_Qty)    = "###,###,###" ;
    ctrl.ColFormat(G1_Result_Qty) = "###,###,###" ;
    ctrl.ColFormat(G1_Bal_Qty)    = "###,###,###" ;
    
    var ctrl = grdCutResult.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;  
      
    ctrl.ColFormat(G2_PROD_QTY) = "###,###,###" ;     

} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {
        case 'grdCutGroup':
            //---------------------
            if ( chkDetail.value == 'Y' )
        	{	    
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_01) = false;
                //grdCutGroup.GetGridControl().ColHidden(G1_Spec_02) = false;
                //grdCutGroup.GetGridControl().ColHidden(G1_Spec_03) = false;            
	            //grdCutGroup.GetGridControl().ColHidden(G1_Spec_04) = false;
	            //grdCutGroup.GetGridControl().ColHidden(G1_Spec_05) = false;	            
            }
            else
            {
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_01) = true;
                //grdCutGroup.GetGridControl().ColHidden(G1_Spec_02) = true;
                //grdCutGroup.GetGridControl().ColHidden(G1_Spec_03) = true;            
	            //grdCutGroup.GetGridControl().ColHidden(G1_Spec_04) = true;
	            //grdCutGroup.GetGridControl().ColHidden(G1_Spec_05) = true;  	            
            }
            //---------------------         
            data_fpcw00130.Call('SELECT');
        break;
        
        case 'grdCutResult':           
            //---------------------         
            data_fpcw00130_1.Call('SELECT');
        break;        
    }
}
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fpcw00130.Call();
        break;                     
    }        
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpcw00130':
            lbRecord.text = grdCutGroup.rows-1 + " (s)";
            
            if ( grdCutGroup.rows > 1 )
            {
                grdCutGroup.SetCellBold( 1, G1_PO_No,    grdCutGroup.rows-1, G1_PO_No,    true);
                grdCutGroup.SetCellBold( 1, G1_Plan_Qty, grdCutGroup.rows-1, G1_Plan_Qty, true);
                grdCutGroup.SetCellBold( 1, G1_Req_Qty,  grdCutGroup.rows-1, G1_Bal_Qty,  true);
                grdCutGroup.SetCellBold( 1, G1_Group_ID, grdCutGroup.rows-1, G1_Group_ID, true);
                grdCutGroup.SetCellBold( 1, G1_Comp_ID,  grdCutGroup.rows-1, G1_Comp_ID,  true);
                
                grdCutGroup.SetCellBgColor( 1, G1_Style_Code, grdCutGroup.rows - 1, G1_Style_Name, 0xCCFFFF );
            }            
        break;     
        
        case 'data_fpcw00130_1':            
            if ( grdCutResult.rows > 1 )
            {
                grdCutResult.SetCellBold( 1, G2_PO_NO,    grdCutResult.rows-1, G2_PO_NO,    true);
                grdCutResult.SetCellBold( 1, G2_PROD_QTY, grdCutResult.rows-1, G2_PROD_QTY, true);
                grdCutResult.SetCellBold( 1, G2_COMP_ID,  grdCutResult.rows-1, G2_COMP_ID,  true);
                grdCutResult.SetCellBold( 1, G2_STYLE_CODE,  grdCutResult.rows-1, G2_STYLE_CODE,  true);
                
                grdCutResult.SetCellBgColor( 1, G2_PO_NO,   grdCutResult.rows - 1, G2_PO_NO,     0xCCFFFF );
                grdCutResult.SetCellBgColor( 1, G2_COMP_ID, grdCutResult.rows - 1, G2_COMP_NAME, 0xCCFFFF );
            }            
        break;             
    }
}

//============================================================================= 

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'ViewDetail':
            if ( grdCutGroup.row > 0 )
            {
                 var path = System.RootURL + '/form/fp/cw/fpcw00131.aspx?ordplan_pk=' + grdCutGroup.GetGridData( grdCutGroup.row, G1_ORDPLAN_PK) + '&comp_pk=' + grdCutGroup.GetGridData( grdCutGroup.row, G1_Comp_PK);
                 var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');
            }
            else
            {
                alert('Pls select a Component first.');
            }            
        break;
        
        case 'GenReq':
             var path = System.RootURL + '/form/fp/cw/fpcw00132.aspx' ;
             var obj = System.OpenModal( path ,700 , 450 ,  'resizable:yes;status:yes');            
        break;        
    }
}

//========================================================================
function OnCellDoubleClick(obj)
{
    switch(obj.id)
    {
        case 'grdCutGroup':
            if ( event.col == G1_Comp_ID || event.col == G1_Comp_Name )
            {
                OnPopUp('ViewDetail');
            }
        break;
    }
}
//========================================================================
                      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpcw00130" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00130" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpcw00130"  >
                <input bind="grdCutGroup" >
					<input bind="lstFactory" />               
			        <input bind="txtPOStyle01" />
			        <input bind="txtComponent01" />
			        <input bind="chkBalance" />
			        <input bind="chkResult" />
			        <input bind="chkDetail" />			        
                </input>
                <output bind="grdCutGroup" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00130_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpcw00130_1"  >
                <input bind="grdCutResult" >               
			        <input bind="dtFromDate" />
			        <input bind="dtToDate" />
			        <input bind="lstLineGroup" />
			        <input bind="lstLine" />
			        <input bind="txtPOStyle02" />
			        <input bind="txtComponent02" />			        
                </input>
                <output bind="grdCutResult" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <!--<gw:tab> -->
    <gw:tab>
    <table style="width: 100%; height: 100%" name="Balance">
        <tr style="height: 1%">
			<td style="width: 5%; white-space: nowrap" align="right">
                Fac</td>
            <td style="width:15%">
                <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdCutGroup')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style</td>
            <td style="width: 15%">
                <gw:textbox id="txtPOStyle01" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdCutGroup')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Component</td>
            <td style="width: 15%">
                <gw:textbox id="txtComponent01" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdCutGroup')" />
            </td>
            <td style="width: 20%; white-space: nowrap; background-color: CCFFFF" align="center">
                Balance
                <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdCutGroup')"></gw:checkbox>
                Result
                <gw:checkbox id="chkResult" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdCutGroup')"></gw:checkbox>
                Detail
                <gw:checkbox id="chkDetail" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdCutGroup')"></gw:checkbox>
            </td>
            <td style="width: 17%; text-align: center; white-space: nowrap">
                <gw:label id="lbRecord" styles="color: cc0000; font: 9pt">record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:icon id="btnGenReq" img="2" text="Gen Req" onclick="OnPopUp('GenReq')" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnViewDetail" img="2" text="View Detail" onclick="OnPopUp('ViewDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdCutGroup')" />
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="11">
                <gw:grid id='grdCutGroup' header='Date|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|_SPEC01_PK|Color|_SPEC02_PK|_Spec 02|_SPEC03_PK|_Spec 03|_SPEC04_PK|_Spec 04|_SPEC05_PK|_Spec 05|Plan Qty|_TPR_PATTERN_GROUP_PK|_Group ID|Group Name|_Comp_PK|Comp ID|Comp Name|Comp Qty|Cut Qty|Bal Qty|Remark|_PP_ORDPLAN_PK'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|0|1|0|0|1|0|3|3|3|0|0'
                    defaults='|||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|1000|1500|1000|1500|2000|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1000|1000|1500|0|1500|2000|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 100%" name="Daily">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Date</td>
            <td style="width: 10%; white-space: nowrap">
                <gw:datebox id="dtFromDate" lang="1" styles='width:100%;' onchange="" />
                ~
                <gw:datebox id="dtToDate" lang="1" styles='width:100%;' onchange="" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line Group
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
            </td>
            <td style="width: 5%" align="right">
                Line
            </td>
            <td style="width: 15%">
                <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('grdCutResult')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtPOStyle02" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdCutResult')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Component</td>
            <td style="width: 15%">
                <gw:textbox id="txtComponent02" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdCutResult')" />
            </td>
            <td style="width: 4%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdCutResult')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="12">
                <gw:grid id='grdCutResult' header='Line ID|Date|P/O No|Style Code|Style Name|Comp ID|Comp Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Prod Qty|End Time|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|1|1|1|1|1|3|1|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1200|2000|2000|3000|1500|2500|1200|1200|1200|1200|1200|1500|1200|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    </gw:tab>
    <!-- </gw:tab> -->
    <!----------------------------------------------------------->
</body>
</html>
