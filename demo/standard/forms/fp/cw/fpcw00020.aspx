<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Cutting W/I Issue</title>
</head>

<script>
             
var G1_WI_MASTER_PK = 0,
    G1_Chk          = 1,
    G1_ORDPLAN_PK   = 2,
    G1_Status       = 3,
    G1_PO_No        = 4,
    G1_Style_Code   = 5,
    G1_Style_Name   = 6,
    G1_Group_ID     = 7,
    G1_Group_Name   = 8,
    G1_WI_DETAIL_PK = 9,
    G1_Lot_ID       = 10,
    G1_Spec_01      = 11,
    G1_Spec_02      = 12,
    G1_Spec_03      = 13,
    G1_Spec_04      = 14,
    G1_Spec_05      = 15,
    G1_WI_Qty       = 16,
    G1_Net_Qty      = 17,
    G1_Loss_Rate    = 18,
    G1_Gross_Qty    = 19,
    G1_Description  = 20;
    
    
//=============================================================================             
function BodyInit()
{       
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));    
 
    FormatGrid();
    //-----------------
    OnSearch('grdWIList');
}
//=============================================================================             
function FormatGrid()
{
    grdWIList.GetGridControl().MergeCells  = 2 ;	
    grdWIList.GetGridControl().MergeCol(0) = true ;	
    grdWIList.GetGridControl().MergeCol(1) = true ;   	
    grdWIList.GetGridControl().MergeCol(2) = true ;
    grdWIList.GetGridControl().MergeCol(3) = true ;
    grdWIList.GetGridControl().MergeCol(4) = true ;
    grdWIList.GetGridControl().MergeCol(5) = true ;
    grdWIList.GetGridControl().MergeCol(6) = true ;
    grdWIList.GetGridControl().MergeCol(7) = true ;
    grdWIList.GetGridControl().MergeCol(8) = true ;
    
    var ctrl = grdWIList.GetGridControl();   
                 
    ctrl.ColFormat(G1_WI_Qty)    = "###,###,###" ;
    ctrl.ColFormat(G1_Net_Qty)   = "###,###,###.#####" ;
    ctrl.ColFormat(G1_Loss_Rate) = "###,###,###.##" ;
    ctrl.ColFormat(G1_Gross_Qty) = "###,###,###.##" ;
    
    grdWIList.GetGridControl().FrozenCols = G1_Group_ID ;
    
    grdWIList.GetGridControl().Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;     
}
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {
        case 'grdWIList':
            //---------------------         
            data_fpcw00020.Call('SELECT');
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
        case 'data_fpcw00020':
            lbRecord.text = grdWIList.rows-1 + " record(s)";
            
            if ( grdWIList.rows > 1 )
            {
                grdWIList.SetCellBold( 1, G1_PO_No,  grdWIList.rows-1, G1_PO_No,  true);
                grdWIList.SetCellBold( 1, G1_Lot_ID, grdWIList.rows-1, G1_Lot_ID, true);
                
                grdWIList.SetCellBold( 1, G1_WI_Qty, grdWIList.rows-1, G1_WI_Qty, true);
                grdWIList.SetCellBold( 1, G1_Gross_Qty, grdWIList.rows-1, G1_Gross_Qty, true);
                
                grdWIList.SetCellBgColor( 1, G1_Style_Code, grdWIList.rows - 1, G1_Style_Name, 0xCCFFFF );
                
                grdWIList.SetCellBgColor( 1, G1_Group_ID, grdWIList.rows - 1, G1_Group_Name, 0xd4d2ff ); 
                
                grdWIList.Subtotal( 0, 2, -1, '16!19','###,###,###');

            }
            
        break;
                
        case 'pro_fpcw00020' :
            alert(txtReturnValue.text);
            
            OnSearch('grdWIList');
        break; 
        
        case 'pro_fpcw00020_1' :
            alert(txtReturnValue.text);
            
            OnSearch('grdWIList');
        break;             
    }
}

//============================================================================= 
function OnProcess(pos)
{
    switch(pos)
    {
        case 'WIIssue' :
            var array_wi_pk = '';
            var t_link = '' ;
            var t = 0 ; 
            
            for(i = 1; i<grdWIList.rows-1; i++)
            {            
                if ( grdWIList.GetGridData(i, G1_Chk) == -1 && t <= 10 )
                {   
                    array_wi_pk = array_wi_pk + t_link + grdWIList.GetGridData(i, G1_WI_MASTER_PK);
                    t_link = ',';
                    t = t + 1 ;
                }                
            }
            
            if ( array_wi_pk != '' )
            {
                if ( confirm ('Do you want to issue these W/I?'))
                {
                    txtArrayWIPK.text = array_wi_pk;
                    pro_fpcw00020.Call();
                }    
            }    
        break;
        
        case 'CancelIssue':
            var array_wi_pk = '';
            var t_link = '' ;
            var t = 0 ; 
            
            for(i = 1; i<grdWIList.rows-1; i++)
            {            
                if ( grdWIList.GetGridData(i, G1_Chk) == -1 && t <= 10 )
                {   
                    array_wi_pk = array_wi_pk + t_link + grdWIList.GetGridData(i, G1_WI_MASTER_PK);
                    t_link = ',';
                    t = t + 1 ;
                }                
            }
            
            if ( array_wi_pk != '' )
            {
                if ( confirm ('Do you want to cancel issue these W/I?'))
                {
                    txtArrayWIPK.text = array_wi_pk;
                    pro_fpcw00020_1.Call();
                }    
            }          
        break;
    }    
}
//============================================================================= 
function OnPrint()
{
    var array_wi_pk = '';
    var t_link = '' ;
    var t = 0 ; 
    
    for(i = 1; i<grdWIList.rows-1; i++)
    {            
        if ( grdWIList.GetGridData(i, G1_Chk) == -1 && t <= 20 )
        {   
            array_wi_pk = array_wi_pk + t_link + grdWIList.GetGridData(i, G1_WI_MASTER_PK);
            t_link = ',';
            t = t + 1 ;
        }                
    }
    
    if ( array_wi_pk != '' )
    {
        var url =System.RootURL + '/reports/fp/cw/rpt_fpcw00020_simone.aspx?array_wi_pk=' + array_wi_pk ;
        window.open(url);    
    }    

}
//============================================================================= 

function OnCellDoubleClick(obj)
{ 
    event_col = event.col ;
    event_row = event.row ;
    
    switch (obj.id)
    {
        case 'grdWIList':            
            if ( event_col == G1_Chk && event_row == grdWIList.rows-1 )
            {
                if ( grdWIList.rows > 1 )
                {              
                    if ( grdWIList.GetGridData( 1, G1_Chk) == -1 )
                    {
                        for ( var i = 1; i < grdWIList.rows-1 ; i++ )
                        {
                            grdWIList.SetGridText( i, G1_Chk, 0) ;
                        }
                    }
                    else
                    {
                        for ( var i = 1; i < grdWIList.rows-1 ; i++ )
                        {
                            grdWIList.SetGridText( i, G1_Chk, -1) ;
                        }                    
                    }
                }
            }
        break;
    }
}
//============================================================================= 

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00020" > 
                <input>
                    <input bind="txtArrayWIPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00020_1" > 
                <input>
                    <input bind="txtArrayWIPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpcw00020"  >
                <input bind="grdWIList" >
			        <input bind="dtFrom" />
			        <input bind="dtTo" />                
			        <input bind="txtPOStyle" />
			        <input bind="txtPTGroup" />
                </input>
                <output bind="grdWIList" />
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
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style</td>
            <td style="width: 20%">
                <gw:textbox id="txtPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdWIList')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PT Group
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtPTGroup" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdWIList')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdWIList')" />
            </td>
            <td style="width: 21%; text-align: center; white-space: nowrap">
                <gw:label id="lbRecord" styles="color: cc0000; font: 9pt">record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnIssue" img="2" text="Issue W/I" onclick="OnProcess('WIIssue')" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnCancelIssue" img="2" text="Cancel Issue" onclick="OnProcess('CancelIssue')" />
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="11">
                <gw:grid id='grdWIList' header='_PK|Chk|_PP_ORDPLAN_PK|Status|P/O No|Style Code|Style Name|Group ID|Group Name|_PK|Lot ID|Spec 01|Spec 01|Spec 03|_Spec 04|_Spec 05|W/I Qty|Net Qty|Loss Rate|Gross Qty|Description'
                    format='0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|1|0|0|0|0|0|0|1|0|0|0|0|0|3|3|3|3|0'
                    editcol='0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|600|0|1200|1500|1500|3000|1500|2000|0|1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayWIPK" styles='width:100%; display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%; display:none' />
    <!----------------------------------------------------------->
</body>
</html>
