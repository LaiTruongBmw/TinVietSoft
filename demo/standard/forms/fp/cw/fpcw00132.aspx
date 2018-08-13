<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GENERATE CUT COMPONENT REQUEST</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_OrdPlanPK     = 0,
    G_Array_SO_PK   = 1,
    G_PO_No         = 2,
    G_From          = 3,
    G_To            = 4,
    G_Style_PK      = 5,
    G_Style_Code    = 6,
    G_Style_Name    = 7;
    
//=======================================================================
function BodyInit()
{
}
//=======================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {
        case '1':
            data_fpcw00132.Call('SELECT');
        break;
        
        case '2':
            data_fpcw00132_1.Call('SELECT');
        break;
    }        
 }
   
//======================================================================

function OnProcess(pos)
{
    switch (pos)
    {        
        case 'GenCutReq': 
            if ( grdOrdPlan.row > 0 )
            {                                   
                txtOrdPlanPK.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G_OrdPlanPK );
                txtOrdPlanNo.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G_PO_No     );
                
                if ( txtOrdPlanPK.text == '' )
                {
                    alert('You must select one P/O.');
                }
                else
                {
                    if ( confirm("Do you want to generate req for " + txtOrdPlanNo.text + " ? ") )
                    {
                         pro_fpcw00132.Call();
                    } 
                }
            }                 
        break;  
        
        case 'CancelCutReq': 
            if ( grdGenOrdPlan.row > 0 )                                   
            {
                txtOrdPlanPK.text = grdGenOrdPlan.GetGridData( grdGenOrdPlan.row, G_OrdPlanPK );
                txtOrdPlanNo.text = grdGenOrdPlan.GetGridData( grdGenOrdPlan.row, G_PO_No     );
                
                if ( txtOrdPlanPK.text == '' )
                {
                    alert('You must select one P/O.');
                }
                else
                {
                    if ( confirm("Do you want to cancel request for " + txtOrdPlanNo.text + " ? ") )
                    {
                         pro_fpcw00132_1.Call();
                    } 
                } 
            }                
        break;               
    }    
}

//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case 'data_fpcw00132' :
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G_Style_Code, grdOrdPlan.rows - 1, G_Style_Name, 0xCCFFFF );
                grdOrdPlan.SetCellBold(    1, G_PO_No,      grdOrdPlan.rows-1,   G_PO_No,      true     );
            }  
            OnSearch('2');                      
        break;
        
        case 'data_fpcw00132_1' :
            if ( grdGenOrdPlan.rows > 1 )
            {
                grdGenOrdPlan.SetCellBgColor( 1, G_Style_Code, grdGenOrdPlan.rows - 1, G_Style_Name, 0xCCFFFF );
                grdGenOrdPlan.SetCellBold(    1, G_PO_No,      grdGenOrdPlan.rows-1,   G_PO_No,      true     );
            }
        break;
        
        case 'pro_fpcw00132' :
            alert(txtReturnValue.text);
            OnSearch('1');
        break; 
        
        case 'pro_fpcw00132_1' :
            alert(txtReturnValue.text);
            OnSearch('1');
        break;                       
    }    
}
//=======================================================================

</script>

<body>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpcw00132" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00132" > 
                <input>
                    <input bind="txtOrdPlanPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpcw00132_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpcw00132_1" > 
                <input>
                    <input bind="txtOrdPlanPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00132" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpcw00132"  > 
			    <input bind="grdOrdPlan" >
			        <input bind="txtSearchNo" />		
			    </input> 
			    <output bind="grdOrdPlan" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00132_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpcw00132_1"  > 
			    <input bind="grdGenOrdPlan" >
			        <input bind="txtSearchNo" />		
			    </input> 
			    <output bind="grdGenOrdPlan" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                SO/PO/Style No</td>
            <td style="width: 40%">
                <gw:textbox id="txtSearchNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('1')" />
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
            </td>
            <td style="width: 20%; white-space: nowrap">
            </td>
            <td style="width: 8%">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('1')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnGenCutReq" img="2" text="Gen Req" onclick="OnProcess('GenCutReq')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id='grdOrdPlan' header='_OrdPlanPK|_ArraySOPK|P/O No|From|To|_Style_PK|Code|Name'
                    format='0|0|0|4|4|0|0|0' aligns='0|0|0|1|1|0|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|0|2000|1200|1200|0|2000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
            </td>
            <td style="width: 40%">
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
            </td>
            <td style="width: 20%; white-space: nowrap">
            </td>
            <td style="width: 8%">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('2')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnCancelCutReq" img="2" text="Cancel Req" onclick="OnProcess('CancelCutReq')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id='grdGenOrdPlan' header='_OrdPlanPK|_ArraySOPK|P/O No|From|To|_Style_PK|Code|Name'
                    format='0|0|0|4|4|0|0|0' aligns='0|0|0|1|1|0|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|0|2000|1200|1200|0|2000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" styles='width:100%; display:none' />
<gw:textbox id="txtOrdPlanNo" styles='width:100%; display:none' />
<gw:textbox id="txtReturnValue" styles='width:100%; display:none' />
<!---------------------------------------------------------------------->
</html>
