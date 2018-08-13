<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Stock Closing ACC Approve</title>
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

	var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn='Y' order by wh_id ")%>||Select ALL";   
    lstApproveWH.SetDataText(data);
    lstApproveWH.value = '' ;
	lstConfirmWH.SetDataText(data);
	lstConfirmWH.value = '' ;
		
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ;        
    //------------------------------------
         
}
//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':            
            data_bimc00010.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bimc00010_1.Call('SELECT')
        break;
    }
} 

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bimc00010':
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";  
            data_bimc00010_1.Call('SELECT');  
        break;    
        
        case 'data_bimc00010_1':           
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";                         
        break;             
       
       case 'pro_bimc00010' :
	   	    alert(txtReturnValue.text);
			lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
            data_bimc00010.Call('SELECT');
       break;     

       case 'pro_bimc00010_1' :
            alert(txtReturnValue.text);
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";  
            data_bimc00010.Call('SELECT');
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
                
                if ( a == "-1" && b != '' )
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
                pro_bimc00010.Call();
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if (confirm ('Do you want to Cancel this slip'))
                {
                    txtSlipPK.text = grdApprove.GetGridData( grdApprove.row, G2_OS_PK);                    
                    pro_bimc00010_1.Call();
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
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_bimc00010" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bimc00010"  >
                <input bind="grdConfirm" >
			        <input bind="dtConfirmFrom" />
			        <input bind="dtConfirmTo" />
			        <input bind="lstConfirmWH" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bimc00010_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="2" type="grid"  function="st_lg_SEL_bimc00010_1"  >
                <input bind="grdApprove" >
			        <input bind="dtApproveFrom" />
			        <input bind="dtApproveTo" />
			        <input bind="lstApproveWH" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bimc00010" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="st_lg_pro_bimc00010" >
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
    <gw:data id="pro_bimc00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bimc00010_1" > 
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
                        </td>
                        <td style="width: 27%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
						<td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="Lock" text="Lock" onclick="OnProcess('Approve')" />
                        </td>                        
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdConfirm' header='Chk|_OS_PK|_Status|Close Date|_Seq|W/H ID|W/H Name|Charger|Remark'
                                format='3|0|0|4|0|0|0|0|0' aligns='0|0|1|1|1|0|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='800|0|1200|1200|1000|1500|3000|2500|1000' sorting='T' styles='width:100%; height:100%' 
								acceptnulldate="T"/>
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
                        </td>
                        <td style="width: 16%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
						<td style="width: 1%">                             
                        </td>
                        <td style="width: 1%">                            
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>                      
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="14">
                            <gw:grid id='grdApprove' header='_OS_PK|_Status|Close Date|_Seq|W/H ID|W/H Name|Charger|Remark'
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
</body>
</html>
