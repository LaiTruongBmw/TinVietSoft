<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Asset Movement Approve</title>
</head>

<script type="text/javascript">

var v_language = "<%=Session("SESSION_LANG")%>";

var G1_PK		    = 0,
    G1_CHK		    = 1,
    G1_STATUS		= 2,
    G1_SLIP_NO		= 3,
    G1_MOVE_DATE	= 4,
    G1_LINEFROM		= 5,
    G1_LINETO		= 6,
    G1_CHARGER		= 7,
    G1_APPROVED		= 8,
    G1_CANCEL		= 9,
    G1_DESCRIPTION	= 10;
    
var G2_PK		    = 0,
    G2_CHK		    = 1,
    G2_STATUS		= 2,
    G2_SLIP_NO		= 3,
    G2_MOVE_DATE	= 4,
    G2_LINEFROM		= 5,
    G2_LINETO		= 6,
    G2_CHARGER		= 7,
    G2_APPROVED		= 8,
    G2_CANCEL		= 9,
    G2_DESCRIPTION	= 10;

//==================================================================
         
function BodyInit()
{       
    //---------------------------------- 
    System.Translate(document);
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;      
    //---------------------------------- 
           
    FormatGrid();
    //-----------------------------------
    OnSearch('grdConfirm');
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_STATUS, 0, G1_STATUS) = 0x3300cc;
    //--------------------- 
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_fpma00120.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fpma00120_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'POConfirm':
            if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/form/bi/as/bias00131.aspx?trans_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_TRANS_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this);
                 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }    
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                    var path = System.RootURL + '/form/bi/as/bias00132.aspx?trans_pk=' + grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
                    var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this);
                     
                    if ( object != null )                    
                    {
                        OnSearch('grdApprove');
                    }
	        }      	        
         break;                         
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpma00120':
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
            /*if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_WH, grdConfirm.rows - 1, G1_WH, true);
            }*/
            OnSearch('grdApprove');
        break;    
        
        case 'data_fpma00120_1':                    
            lbApproveRecord.text = (grdApprove.rows-1) + " record(s)";
            /*if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_WH, grdApprove.rows - 1, G2_WH, true);
            } */         
        break;  
                 
        case 'pro_fpma00120' :
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);
                data_fpma00120.Call('SELECT')   
            }
        break;
        
        case'pro_fpma00120_1':
            alert(txtReturnValue.text);
            data_fpma00120_1.Call('SELECT');
        break;
    }
}
 
//==================================================================
function OnGridCellDblClick(objGrid)
{
     var col = event.col;
    var row = event.row;
    
    for(var i = 1; i < objGrid.rows; i++)
    {
        objGrid.SetGridText(i,G1_CHK,'0');
    }
    switch(objGrid.id)
    {
        case 'grdConfirm':
            objGrid.SetGridText(row,G1_CHK,'-1');
            var path = System.RootURL + "/form/fp/ma/fpma00121.aspx?ma_move_m_pk=" + objGrid.GetGridData(row, G1_PK) + '&Action=0';
	        var obj = System.OpenModal( path ,800 ,600 ,'scroll:no;resizable:yes;status:yes', this);
	        if ( obj != null )
            {
                if(obj == '1')
                {
                    OnSearch('grdConfirm');
                }             
            }
            objGrid.SetGridText(row,G1_CHK,'0');
        break
        case 'grdApprove':
            objGrid.SetGridData(row,G2_CHK,'-1');
            var path = System.RootURL + "/form/fp/ma/fpma00121.aspx?ma_move_m_pk=" + objGrid.GetGridData(row, G2_PK) + '&Action=1';
            var obj = System.OpenModal( path ,800 ,600 ,'scroll:no;resizable:yes;status:yes', this);            
	        if ( obj != null )
            {
                if(obj == '1')
                {
                    OnSearch('grdConfirm');
                }                
            }
            objGrid.SetGridText(row,G2_CHK,'0');
        break
        default:
        break;
    }
}
//==================================================================
function OnProcess(pos)
{
    switch (pos)
    {        
        case'Approve':
            var income_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData(i,G1_CHK);
                var b = grdConfirm.GetGridData(i,G1_PK);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtInComePK.text = income_pk;
            
            if(txtInComePK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_fpma00120.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel ?'))
                {
                    txtInComePK.text = grdApprove.GetGridData( grdApprove.row, G2_PK);                    
                    pro_fpma00120_1.Call();
                }    
            }
            else
            {
                alert('Pls select one slip to cancel.');
            }     
        break;       
    }    
}
//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00120" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpma00120"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtConfirmNo" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00120_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_sel_fpma00120_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="txtApproveNo" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpma00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00120" > 
                <input>
                    <input bind="txtInComePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00120_1" > 
                <input>
                    <input bind="txtInComePK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 38%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id='grdConfirm' header='_PK|Chk|Status|Slip No|Move Date|Fr Dept|To Dept|Fr Charger|To Charger|Approve|Cancel|Remark'
                                format='1|3|0|0|4|0|0|0|0|0|0|0' 
								aligns='0|1|1|1|1|0|0|0|0|0|0|0' check='|||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='0|600|1500|1200|1200|2000|2000|2000|2000|1500|1500|1000'
                                sorting='T' defaults='||||||||||' styles='width:100%; height:100%'
                                oncelldblclick='OnGridCellDblClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="width: 100%; height: 1%;">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 38%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>0 record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
                            <gw:grid id='grdApprove' header='_PK|_Chk|Status|Slip No|Move Date|From Dept|To Dept|Fr Charger|To Charger|Approve|Cancel|Remark'
                                format='1|3|0|0|4|0|0|0|0|0|0|0' aligns='0|0|1|1|1|0|0|0|0|0|0|0' check='|||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='0|600|1500|1200|1200|2000|2000|2000|2000|1500|1500|1000'
                                sorting='T' defaults='||||||||||' styles='width:100%; height:100%'
                                oncelldblclick='OnGridCellDblClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtInComePK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
