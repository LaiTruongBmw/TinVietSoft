<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>QC Result Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var G1_Chk     			= 0,           
    G1_TRANS_PK			= 1,
    G1_Status  			= 2,
    G1_Qc_Date 			= 3,
    G1_Slip_No 			= 4,
    G1_Pp_ordplan_pk    = 5,
    G1_Ref_po_no        = 6,
    G1_Item_name        = 7,
    G1_Pb_line_pk  		= 8,   
    G1_Charger_01_pk    = 9, 
    G1_Full_name_01     = 10,
	G1_Charger_02_pk    = 11,
	G1_Full_name_02     = 12,
	G1_Description      = 13,
	G1_Style_pk    		= 14;
    
var G2_TRANS_PK			= 0,
    G2_Status  			= 1,
    G2_Qc_Date 			= 2,
    G2_Slip_No 			= 3,
    G2_Pp_ordplan_pk    = 4,
    G2_Ref_po_no        = 5,
    G2_Item_name        = 6,
    G2_Pb_line_pk  		= 7,   
    G2_Charger_01_pk    = 8,     
    G2_Full_name_01     = 9,
	G2_Charger_02_pk    = 10,
	G2_Full_name_02     = 11,
	G2_Description      = 12,
	G2_Style_pk    		= 13;	
//==================================================================
         
function BodyInit()
{       
    //---------------------------------- 

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
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;
    //--------------------- 
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_fpfo00130.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fpfo00130_1.Call('SELECT')
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
                var path = System.RootURL + '/form/fp/fo/fpfo00131.aspx?trans_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_TRANS_PK);
                var object = System.OpenModal( path, 900, 550, 'resizable:yes;status:yes', this);
                 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }    
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                    var path = System.RootURL + '/form/fp/fo/fpfo00132.aspx?trans_pk=' + grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
                    var object = System.OpenModal( path, 900, 550, 'resizable:yes;status:yes', this);
                     
                    if ( object != null )                    
                    {
                        OnSearch('grdApprove');
                    }
	        }      	        
         break;                         
     }       
}
//==================================================================
function OnPrint()
{    
	if(grdApprove.row > 0)
	{		
		if(grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK ) != '' && grdApprove.GetGridData( grdApprove.row, G2_Status ) == 'APPROVED')
		{
			var url = System.RootURL + "/reports/fp/fo/rpt_fpfo00130.aspx?master_pk="+grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK );
			System.OpenTargetPage(url); 
		}
	}
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpfo00130':
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_Ref_po_no, grdConfirm.rows - 1, G1_Ref_po_no, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_fpfo00130_1':                    
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_Ref_po_no, grdApprove.rows - 1, G2_Ref_po_no, true);
            }          
        break;  
                 
        case 'pro_fpfo00130' :
            alert(txtReturnValue.text);
            data_fpfo00130.Call('SELECT')   
        break;
        
        case'pro_fpfo00130_1':
            alert(txtReturnValue.text);
            data_fpfo00130_1.Call('SELECT');
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
                var a = grdConfirm.GetGridData(i,0);
                var b = grdConfirm.GetGridData(i,1);
                
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
                        pro_fpfo00130.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel ?'))
                {
                    txtInComePK.text = grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
                    
                    pro_fpfo00130_1.Call();
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
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.width="100%";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }    

//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpfo00130" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fpfo00130"  >
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
    <gw:data id="data_fpfo00130_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_SEL_fpfo00130_1"  >
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
    <gw:data id="pro_fpfo00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfo00130" > 
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
    <gw:data id="pro_fpfo00130_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfo00130_1" > 
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
                        <td style="width: 37%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail" img="2" text="View Detail" onclick="OnPopUp('POConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
						<gw:grid id='grdConfirm'
						header='Chk|_pk|Status|QC Date|Slip No|_pp_ordplan_pk|Ref PO|Item Name|_pb_line_pk|_charger_01_pk|Charger|_charger_02_pk|Emp|Description|_style_pk'
						format='3|0|1|4|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|1|1|0|0|0|0|0|0|1|0|1|0|0'
						check='||||||||||||||'
						editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
						widths='500|0|1200|1200|800|0|1200|2000|0|0|2000|0|2000|1200|1000'
						sorting='T'
						styles='width:100%; height:100%'
						/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
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
                        <td style="width: 21%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print Repo<pre><pre><pre></pre></pre></pre>rt" id="btnPrint" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail1" img="2" text="View Detail" onclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
                        <gw:grid id='grdApprove'
						header='_pk|Status|QC Date|Slip No|_Pp_ordplan_pk|Ref PO|Item Name|_Pb_line_pk|_Charger_01_pk|Charger|_Charger_02_pk|Emp|Description|_Style_pk'
						format='0|1|4|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|1|1|0|0|0|0|0|0|1|0|1|0|0'
						check='|||||||||||||'
						editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
						widths='0|1200|1200|800|0|1200|2000|0|0|2000|0|2000|1200|0'
						sorting='T'
						styles='width:100%; height:100%'
						/>
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
