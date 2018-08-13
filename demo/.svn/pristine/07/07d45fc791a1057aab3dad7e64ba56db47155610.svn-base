<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O Cons Map Spec</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_SO_PK    = 0,
    G1_PO_SO    = 1,
    G1_ORD_DT 	= 2,
    G1_STYLE_PK = 3,
    G1_STYLE_NM = 4;
    
var P_CONS_PK       = 0,
    P_STYLE_PK      = 1,
	P_SEQ			= 2,
    P_ST_MAT_PK     = 3, 
	P_MAT_PK		= 4,    
    P_MAT_CODE      = 5,
    P_MAT_NAME      = 6,           
	P_DOZ_QTY		= 7,
    P_NET_QTY       = 8,
    P_LOSS_RATE     = 9,
    P_GROSS_QTY     = 10, 
	P_UOM           = 11,      
    P_REMARK        = 12;
               
//===============================================================
function BodyInit()
{ 
    System.Translate(document); 
    //---------------------------
    txtSOPO.SetEnable(false);
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
    
    FormatGrid();
}
      
//===============================================================
function FormatGrid()
{
    var trl = grdMatCons.GetGridControl();	
      
	trl.ColFormat(P_DOZ_QTY)    = "###,###.##";
    trl.ColFormat(P_NET_QTY)    = "###,###.#####"; 
    trl.ColFormat(P_LOSS_RATE)  = "###,###"; 
    trl.ColFormat(P_GROSS_QTY)  = "###,###.#####"; 
}  

//===============================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch' :
            data_dsos00040.Call("SELECT");
        break;
        
        case 'grdDetail':
            if ( grdSearch.row > 0 )
            {
                txtStylePK.text = grdSearch.GetGridData( grdSearch.row , G1_STYLE_PK );
                txtOrderPK.text = grdSearch.GetGridData( grdSearch.row , G1_SO_PK    );
                txtSOPO.text    = grdSearch.GetGridData( grdSearch.row , G1_PO_SO    ); 
                
                data_dsos00040_1.Call("SELECT");
            }    
            else
            {
                alert('Pls select one SO.');
            }           
        break;       
    }    
}

//===============================================================
function OnDataReceive(obj)
{
    switch ( obj.id )
    {         
        case 'data_dsos00040_1' :
            if ( grdMatCons.rows > 1 )
			{
				for ( var i=1; i<grdMatCons.rows; i++ )
				{
					if ( Number(grdMatCons.GetGridData( i, P_ST_MAT_PK )) > 0 )
					{
						grdMatCons.SetCellBold( i, P_MAT_CODE, i, P_MAT_NAME,  true);
					}
				}		
			}
        break;               
    } 
}
//======================================================================================================
function OnShowSpecMapping()
{
    if ( grdMatCons.row > 0 )
    {
        var event_row = grdMatCons.row;
        
        if ( grdMatCons.GetGridData( event_row, P_CONS_PK) == '' )
        {
            alert('Pls Save Consumption first.');
            return;
        }
                                                     
        var path = System.RootURL + '/standard/forms/ds/os/dsos00042.aspx?style_cons_pk='+ grdMatCons.GetGridData( event_row, P_CONS_PK) +'&so_m_pk='+ txtOrderPK.text;
        var object = System.OpenModal( path ,950 , 600,  'resizable:yes;status:yes');                    

        return;    
    }
    else
    {
        alert('Pls select on saved item below.');
    }
} 
//====================================================================================
</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_dsos00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3" function="st_lg_sel_dsos00040" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtPOSONo" /> 
                    <input bind="txtStyleSearch" />                                          
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>        
    <!--------------------------------------------------------->
    <gw:data id="data_dsos00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_dsos00040_1" > 
                  <input > 
                          <input bind="txtStylePK" />                 
                  </input> 
                <output bind="grdMatCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 30%">
                            <b>Date</b>
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:button id="btnOrderNoSearch" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>PO/SO No</b></td>
                        <td colspan="2">
                            <gw:textbox id="txtPOSONo" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            Style</td>
                        <td colspan="2">
                            <gw:textbox id="txtStyleSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                     
                    <tr style="height: 94%">
                        <td colspan="3">
							<gw:grid id="grdSearch" header="_PK|SO/PO No|Date|_STYLE_PK|Style" format="0|0|4|0|0" aligns="0|0|1|0|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|2000|1000" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" param="0,1,2,3,4" oncellclick="OnSearch('grdDetail')" />							
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%">
                <table style="width: 100%; height: 100%">               
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            SO/PO No</td>
                        <td style="width: 50%">
                            <gw:textbox id="txtSOPO" styles="width:100%" />
                        </td>                        
                        <td style="width: 38%">
                        </td>
                        <td style="width: 1%">                             
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnMapSpec" img="Spec" text="Spec" onclick="OnShowSpecMapping()" />
                        </td>                        
                    </tr>                           
                    <tr style="height: 99%">
                        <td colspan=10>                             
							<gw:grid id='grdMatCons' 
								header='_PK|_TCO_STITEM_PK|Seq|_ST_MAT_PK|_MAT_PK|Item Code|Item NM|Doz Qty|Net Qty|Loss (%)|Gross Qty|UOM|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|3|3|3|3|1|0'
                                defaults='||||||||||||' 
								editcol='0|0|1|0|0|0|0|1|1|1|1|0|1'
                                widths='0|0|800|0|0|2000|4000|1200|1500|1000|1500|800|1000'
                                styles='width:100%; height:100%' />
                        </td>
                    </tr>                     
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------->
<gw:textbox id="txtOrderPK" styles="width:100%; display:none" />
<gw:textbox id="txtStylePK" styles="width:100%; display:none" />
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!------------------------------------------------------------------->
</html>
