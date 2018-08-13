<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>BOM Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_SELECT       = 0,
    G1_MASTER_PK        = 1,          
    G1_Status       = 2,
    G1_Bom_Date     = 3,
    G1_PL_Center    = 4,
    G1_Item_Name    = 5,    
    G1_Approve      = 6,
    G1_Cancel       = 7;
    
var G2_MASTER_PK        = 0,           
    G2_Status       = 1,
    G2_Bom_Date     = 2,
    G2_PL_Center    = 3,
    G2_Item_Name    = 4,
    G2_Approve      = 5,
    G2_Cancel       = 6;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    //---------------------------------- 
     
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;     
    FormatGrid();
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
            data_fpfa00220.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fpfa00220_1.Call('SELECT');
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Project1':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0]; 
                    txtProjectNM.text   = oValue[2];
                }
        break;    
        case 'Project2':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK2.text = oValue[0]; 
                    txtProjectNM2.text   = oValue[2];
                }
        break;    
         case 'BOMConfirm':
            if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/form/fp/fa/fpfa00221.aspx?type=APPROVE&master_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_MASTER_PK);
                var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes');
                 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }    
         break ;
         
         case 'BOMApprove':
            if ( grdApprove.row > 0 )
            {
                    var path = System.RootURL + '/form/fp/fa/fpfa00221.aspx?type=CANCEL&master_pk=' + grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK);
                    var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
                     
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
    txtDateFrom.text=dtFrom2.value;
    txtDateTo.text=dtTo2.value;
    
    var url =System.RootURL + "/reports/bi/ni/rpt_fpfa00220.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpfa00220':
            if ( grdConfirm.rows > 1 )
            {
               lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
               
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_fpfa00220_1':                    
            if ( grdApprove.rows > 1 )
            {
                lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
            }          
        break;  
                 
        case 'pro_fpfa00220_1' :
            alert(txtReturnValue.text);
            data_fpfa00220.Call('SELECT')   
        break;
        
        case'pro_fpfa00220_2':
            alert(txtReturnValue.text);
            data_fpfa00220_1.Call('SELECT');
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
                var a = grdConfirm.GetGridData(i,G1_SELECT);
                var b = grdConfirm.GetGridData(i,G1_MASTER_PK);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtMasterPK.text = income_pk;
            
            if(txtMasterPK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_fpfa00220_1.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel this Slip'))
                {
                    txtMasterPK.text = grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK);
                    
                    pro_fpfa00220_2.Call();
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
    <gw:data id="data_fpfa00220" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fpfa00220"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtProjectPK" />
			        <input bind="txtConfirmNo" />						 				
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpfa00220_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_SEL_fpfa00220_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                			       
					<input bind="txtProjectPK2" /> 
					<input bind="txtApproveNo" />					 			
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpfa00220_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfa00220" > 
                <input>
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfa00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfa00220_1" > 
                <input>
                    <input bind="txtMasterPK" />
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
                       <td width="5%" align="right">
                        <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnPopUp('Project1')">Project</b></td>
                        <td width="25%" >
                          <gw:textbox id="txtProjectNM" styles="width:100%" readonly='yes'/>
                          <gw:textbox id="txtProjectPK" styles="display:none"/>
                          </td>  
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 20%; text-align: center; white-space: nowrap">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail" img="2" text="View Detail" onclick="OnPopUp('BOMConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdConfirm' header='SELECT|_PK|Status|BOM Date|Slip No|PL Center|Item Name|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0' aligns='0|0|1|1|0|0|0|0|0' check='|||||||||'
                                editcol='1|0|0|0|0|0|0|0|0' widths='800|0|1200|1200|1200|2000|2000|2000|2000'
                                sorting='T' styles='width:100%; height:100%' />
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
                                style="cursor: hand" onclick="OnToggle()" /></td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td width="5%" align="right">
                        <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnPopUp('Project2')">Project</b></td>
                        <td width="20%" >
                          <gw:textbox id="txtProjectNM2" styles="width:100%" readonly='yes'/>
                          <gw:textbox id="txtProjectPK2" styles="display:none"/>
                          </td>  
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print Report" styles='width:100%;display:none' id="btnPrint" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail1" img="2" text="View Detail" onclick="OnPopUp('BOMApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdApprove' header='_PK|Status|BOM Date|Slip No|PL Center|Item Name|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|1200|2000|2000|2000|2000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
 
     <!----------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />

</body>
</html>
