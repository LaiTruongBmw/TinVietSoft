<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Cutting W/I for Group (Spec)</title>
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
    G1_GROUP_PK     = 16,
    G1_Group_ID     = 17,
    G1_Group_Name   = 18,
    G1_Req_Qty      = 19,
    G1_WI_Qty       = 20,
    G1_Bal_Qty      = 21,
    G1_Description  = 22,
    G1_PP_ORDPLAN_PK = 23;
    
//=============================================================================             
function BodyInit()
{       
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));    
 
    FormatGrid();
    //-----------------
    OnSearch('grdCutGroup');
}
//=============================================================================             
function FormatGrid()
{
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
         
    ctrl.ColFormat(G1_Req_Qty) = "###,###,###" ;
    ctrl.ColFormat(G1_WI_Qty)  = "###,###,###" ;
    ctrl.ColFormat(G1_Bal_Qty) = "###,###,###" ;

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
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_02) = false;
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_03) = false;            
	            grdCutGroup.GetGridControl().ColHidden(G1_Spec_04) = false;
	            grdCutGroup.GetGridControl().ColHidden(G1_Spec_05) = false;
	            
	            grdCutGroup.GetGridControl().FrozenCols = G1_Style_Name ;		    	        
            }
            else
            {
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_01) = true;
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_02) = true;
                grdCutGroup.GetGridControl().ColHidden(G1_Spec_03) = true;            
	            grdCutGroup.GetGridControl().ColHidden(G1_Spec_04) = true;
	            grdCutGroup.GetGridControl().ColHidden(G1_Spec_05) = true;  
	            
	            grdCutGroup.GetGridControl().FrozenCols = G1_Req_Qty ;          
            }
            //---------------------         
            data_fpcw00060.Call('SELECT');
        break;
    }
}

//=============================================================================             
function OnPrint()
{
    if ( grdCUT.row > 0 ) 
    {
        var url = System.RootURL + '/reports/fp/cw/fpcw00122.aspx?wi_pk=' + grdCUT.GetGridData( grdCUT.row, grdCUT_PK) ;
	    window.open(url);
	}
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpcw00060':
            lbRecord.text = grdCutGroup.rows-1 + " (s)";
            
            if ( grdCutGroup.rows > 1 )
            {
                grdCutGroup.SetCellBold( 1, G1_PO_No,   grdCutGroup.rows-1, G1_PO_No,  true);
                grdCutGroup.SetCellBold( 1, G1_Req_Qty, grdCutGroup.rows-1, G1_Bal_Qty, true);
                
                grdCutGroup.SetCellBgColor( 1, G1_Style_Code, grdCutGroup.rows - 1, G1_Style_Name, 0xCCFFFF );
                
                grdCutGroup.SetCellBgColor( 1, G1_Group_ID, grdCutGroup.rows - 1, G1_Group_Name, 0xd4d2ff ); 
            }
            
        break;
                
        case 'pro_fpcw00060' :
            alert(txtReturnValue.text);
            
            OnSearch('grdCutGroup');
        break;  
        
        case 'pro_fpcw00060_1' :
            alert(txtReturnValue.text);
            
            OnSearch('grdCutGroup');
        break;               
    }
}
//=============================================================================             
function OnProcess(pos)
{
    switch (pos)
    {
        case 'Load_CutPlan' :
            if ( confirm('Are you sure to Load Cutting Group Request ?') )
            {
                pro_fpcw00060.Call();
            }    
        break;   
        
        case 'Cancel_CutPlan' :
            if ( grdCutGroup.row > 0 )
            {
                if ( confirm('Are you sure to Cancel Cutting Group Request ?') )
                {
                    txtOrdPlanPK.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_PP_ORDPLAN_PK ) ;
                    pro_fpcw00060_1.Call();
                }
            }         
        break;               
    }
}  
//============================================================================= 

function OnAddNew()
{
    if ( grdCutGroup.row > 0 )    
    {
        txtOrdPlanPK.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_PP_ORDPLAN_PK ) ;
        txtArraySOPK.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_ARRAY_SO_PK   ) ;
        txtPONo.text      = grdCutGroup.GetGridData( grdCutGroup.row, G1_PO_No         ) ;
        
        txtStylePK.text   = grdCutGroup.GetGridData( grdCutGroup.row, G1_STYLE_PK      ) ;
        txtStyleCode.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_Style_Code    ) ;
        txtStyleName.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_Style_Name    ) ;
        
        txtPatternGroupPK.text   = grdCutGroup.GetGridData( grdCutGroup.row, G1_GROUP_PK ) ;
        txtPatternGroupName.text = grdCutGroup.GetGridData( grdCutGroup.row, G1_Group_Name ) ;
        
        var path   = System.RootURL + '/form/fp/cw/fpcw00061.aspx'; 
        var object = System.OpenModal( path, 1000, 700, 'resizable:yes;status:yes', this);
    }
    else
    {
        alert('Pls select one P/O.');
    }    
}
//=============================================================================                       
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00060" > 
                <input>
			        <input bind="dtFrom" />
			        <input bind="dtTo" />    
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
        <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00060_1" > 
                <input>
			        <input bind="txtOrdPlanPK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00060" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpcw00060"  >
                <input bind="grdCutGroup" >               
			        <input bind="txtPOStyle" />
			        <input bind="chkBalance" />
			        <input bind="chkDetail" />
                </input>
                <output bind="grdCutGroup" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Date</td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnLoadCutReq" img="2" text="Load Req" onclick="OnProcess('Load_CutPlan')" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnCancelCutReq" img="2" text="Cancel Req" onclick="OnProcess('Cancel_CutPlan')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style</td>
            <td style="width: 30%">
                <gw:textbox id="txtPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdCutGroup')" />
            </td>
            <td style="width: 20%; white-space: nowrap; background-color: CCFFFF" align="center">
                Balance
                <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdCutGroup')"></gw:checkbox>
                Detail
                <gw:checkbox id="chkDetail" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdCutGroup')"></gw:checkbox>
            </td>
            <td style="width: 16%; text-align: center; white-space: nowrap">
                <gw:label id="lbRecord" styles="color: cc0000; font: 9pt">record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:icon id="btnCutWI" img="2" text="W/I" onclick="OnAddNew()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdCutGroup')" />
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="10">
                <gw:grid id='grdCutGroup' header='Date|_ARRAY_SO_PK|P/O No|_STYLE_PK|Style Code|Style Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|_TPR_PATTERN_GROUP_PK|Group ID|Group Name|Req Qty|W/I Qty|Bal Qty|Remark|_PP_ORDPLAN_PK'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|0|1|0|3|3|3|0|0'
                    defaults='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|1000|1500|1000|2000|3500|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1000|1500|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%; display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtOrdPlanPK" styles='width:100%;display: none' />
    <gw:textbox id="txtArraySOPK" styles='width:100%;display: none' />
    <gw:textbox id="txtPONo" styles='width:100%;display: none' />
    <gw:textbox id="txtStylePK" styles='width:100%;display: none' />
    <gw:textbox id="txtStyleCode" styles='width:100%;display: none' />
    <gw:textbox id="txtStyleName" styles='width:100%;display: none' />
    <gw:textbox id="txtPatternGroupPK" styles='width:100%;display: none' />
    <gw:textbox id="txtPatternGroupName" styles='width:100%;display: none' />
    <!----------------------------------------------------------->
</body>
</html>
