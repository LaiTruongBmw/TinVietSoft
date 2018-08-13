<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Stock Opening Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk          = 0,           
    G1_OS_PK        = 1,
    G1_Status       = 2,
    G1_Stock_Date   = 3,
    G1_Seq          = 4,
    G1_WH_ID        = 5,
    G1_WH_NM        = 6,
    G1_CHARGER      = 7,
    G1_REMARK       = 8;
    
var G2_OS_PK        = 0,
    G2_Status       = 1,
    G2_Stock_Date   = 2,
    G2_Seq          = 3,
    G2_WH_ID        = 4,
    G2_WH_NM        = 5,
    G2_CHARGER      = 6,
    G2_REMARK       = 7;
//==================================================================
         
function BodyInit()
{
    System.Translate(document); 
    var now = new Date(); 
    var lmonth, ldate;
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ; 
    txtUser_PK.text = "<%=session("USER_PK")%>";
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ;        
    //------------------------------------
    dso_wh_list_approve.Call('SELECT');          
}
//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':            
            data_bimc00060.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bimc00060_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'DetailConfirm':
            if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/standard/forms/bi/mc/bimc00061.aspx?type=APPROVE&slip_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_OS_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            } 
	        else
	        {
	            alert('Pls select Slip to view.');
	        }                     
         break ;
         
         case 'DetailApprove':
            if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/standard/forms/bi/mc/bimc00061.aspx?type=CANCEL&slip_pk=' + grdApprove.GetGridData( grdApprove.row, G2_OS_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
	            
            	if ( object != null )                    
                {
                    data_bimc00060.Call('SELECT');
                }
	        }
	        else
	        {
	            alert('Pls select Slip to view.');
	        }       	        
         break;         
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bimc00060':
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";  
            data_bimc00060_1.Call('SELECT');  
        break;    
        
        case 'data_bimc00060_1':           
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";                         
        break; 
       
       case 'dso_wh_list_approve':
            dso_wh_list_cancel.Call('SELECT');
       break;
       
       case 'dso_wh_list_cancel':
            data_bimc00060.Call('SELECT');
       break;
       
       case 'pro_bimc00060' :
            data_bimc00060.Call('SELECT');
       break;     

       case 'pro_bimc00060_1' :
            alert(txtReturnValue.text);
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";  
            data_bimc00060.Call('SELECT');
       break;                    
    }
}

//==================================================================
var flag = "";

function OnProcess(pos)
{
    switch (pos)
    {
        
        case'Approve':
            var slip_pk = "";
            
            for(var i=1;i<grdConfirm.rows;i++)
            {
                var a = grdConfirm.GetGridData( i, G1_Chk   );
                var b = grdConfirm.GetGridData( i, G1_OS_PK );
                
                if ( a == "-1" )
                {
                   slip_pk = slip_pk + b + ",";
                }
            }
            
            txtSlipPK.text = slip_pk.substring( 0, slip_pk.length-1 );
            
            if ( txtSlipPK.text == "")
            {
                alert('You must select one Slip.');
            }
            else
            {
                pro_bimc00060.Call();
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if (confirm ('Do you want to Cancel this slip'))
                {
                    txtSlipPK.text = grdApprove.GetGridData( grdApprove.row, G2_OS_PK);                    
                    pro_bimc00060_1.Call();
                }    
            }
            else
            {
                alert('Pls select one Slip.');
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
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }   
 //==================================================================  
function OnReport()
{ 
 /*   if(grdApprove.row > 0)
    {
        var url =System.RootURL + '/reports/bi/sa/rpt_bisa00060.aspx?p_pk='+grdApprove.GetGridData( grdApprove.row, G2_OS_PK);
        window.open(url);    
    }
    else
    {
        alert("Pls select one Slip.")
    } */
     if(grdApprove.row > 0)
    {
        var path = System.RootURL + '/standard/forms/bi/mc/bimc00063.aspx?master_pk='+grdApprove.GetGridData( grdApprove.row, G2_OS_PK);
        var obj = System.OpenModal( path ,750 , 500,  'resizable:yes;status:yes'); 
     }
    else
    {
        alert("Pls select one Slip.")
    } 
    
} 
 //==================================================================         
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list_approve" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bimc00060_2" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="lstConfirmWH" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bimc00060_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="lstApproveWH" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bimc00060" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bimc00060"  >
                <input bind="grdConfirm" >
			        <input bind="dtConfirmFrom" />
			        <input bind="dtConfirmTo" />
			        <input bind="lstConfirmWH" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bimc00060_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="2" type="grid"  function="st_lg_SEL_bimc00060_1"  >
                <input bind="grdApprove" >
			        <input bind="dtApproveFrom" />
			        <input bind="dtApproveTo" />
			        <input bind="lstApproveWH" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser2" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bimc00060" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="st_lg_pro_bimc00060" >
                <input>
                    <input bind="txtSlipPK" />
                </input>
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bimc00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bimc00060_1" > 
                <input>
                    <input bind="txtSlipPK" /> 
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
                        <td style="width: 10%" align="right">
                            Date</td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtConfirmFrom" lang="1" />
                            ~<gw:datebox id="dtConfirmTo" lang="1" />
                        </td>
                        <td style="width: 10%" align="right">
                            W/H
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstConfirmWH" styles="width:100%;" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y">User</gw:checkbox>
                        </td>
                        <td style="width: 27%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail" img="View Detail" text="View Detail" onclick="OnPopUp('DetailConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdConfirm' header='Chk|_OS_PK|Status|Date|_Seq|W/H ID|W/H Name|Charger|Remark'
                                format='3|0|0|4|0|0|0|0|0' aligns='0|0|1|1|1|0|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='800|0|1200|1200|1000|1500|3000|2500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            Date</td>
                        <td style="width: 20%">
                            <gw:datebox id="dtApproveFrom" lang="1" />
                            ~<gw:datebox id="dtApproveTo" lang="1" />
                        </td>
                        <td style="width: 10%" align="right">
                            W/H
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstApproveWH" styles="width:100%;" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser2" styles="color:blue" defaultvalue="Y|N" value="Y">User</gw:checkbox>
                        </td>
                        <td style="width: 16%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtns id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail1" img="View Detail" text="View Detail" onclick="OnPopUp('DetailApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="14">
                            <gw:grid id='grdApprove' header='_OS_PK|Status|Date|_Seq|W/H ID|W/H Name|Charger|Remark'
                                format='0|0|4|0|0|0|0|0' aligns='0|1|1|1|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|1000|1500|3000|2500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtSlipPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
</body>
</html>
