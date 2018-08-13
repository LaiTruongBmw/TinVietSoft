<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>W/H Stock Closing</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK          = 0,           
    G1_WH_PK        = 1,   
    G1_WH_ID        = 2,
    G1_WH_NM        = 3,    
    G1_LOCK_YN      = 4;
    
var G2_WH_PK        = 0,    
    G2_WH_ID        = 1,
    G2_WH_NM        = 2,     
    G2_LOCK_YN      = 3;
//==================================================================
         
function BodyInit()
{
    System.Translate(document); 
	
    txtUser_PK.text = "<%=session("USER_PK")%>";       
    //------------------------------------
         BindingDataList();
}
//-----------------------------------------------
function BindingDataList()
{
	var data = '';
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk, a.STRG_NAME from tlg_in_storage a where a.del_if = 0 ")%>|ALL|Select all";
	lstStorage.SetDataText(data);
	lstStorage1.SetDataText(data);
}
//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':            
            data_bisa00070.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bisa00070_1.Call('SELECT')
        break;
    }
} 

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisa00070':
            
            data_bisa00070_1.Call('SELECT');  
        break;    
        
        case 'data_bisa00070_1':           
                                 
        break;             
       
       case 'pro_bisa00070' :
	   	    alert(txtReturnValue.text);
			 
            data_bisa00070.Call('SELECT');
       break;     

       case 'pro_bisa00070_1' :
            alert(txtReturnValue.text);
             
            data_bisa00070.Call('SELECT');
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
                var a = grdConfirm.GetGridData( i, G1_CHK   );
                var b = grdConfirm.GetGridData( i, G1_WH_PK );
                
                if ( a == "-1" && b != '' )
                {
                   slip_pk = slip_pk + b + ",";
                }
            }
            
            txtSlipPK.text = slip_pk.substring( 0, slip_pk.length-1 );
            
            if ( txtSlipPK.text == "")
            {
                alert('You must select one W/H.');
            }
            else
            {
                pro_bisa00070.Call();
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if (confirm ('Do you want to unlock this W/H'))
                {
                    txtSlipPK.text = grdApprove.GetGridData( grdApprove.row, G2_WH_PK);                    
                    pro_bisa00070_1.Call();
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
    <gw:data id="data_bisa00070" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bisa00070"  >
                <input bind="grdConfirm" >
			        <input bind="txtUser_PK" />
			        <input bind="lstStorage" />			         
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisa00070_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="2" type="grid"  function="st_lg_SEL_bisa00070_1"  >
                <input bind="grdApprove" >
			        <input bind="txtUser_PK" />	
			        <input bind="lstStorage1" />			         
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisa00070" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="st_lg_pro_bisa00070" >
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
    <gw:data id="pro_bisa00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bisa00070_1" > 
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
                            <b>Storage</b></td>
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:list id="lstStorage" styles="width:100%" onclick="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                           
                        </td>
                        <td style="width: 30%">                             
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 27%; text-align: center">                             
                        </td>
						<td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="lock" text="Lock" onclick="OnProcess('Approve')" />
                        </td>                        
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
							<gw:grid id='grdConfirm' header='Chk|_WH_PK|W/H ID|W/H Name'
                                format='3|0|0|0' aligns='0|0|1|0' check='|||' editcol='0|0|0|0'
                                widths='600|0|2000|1200' sorting='T' styles='width:100%; height:100%' />	
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
                        <b>Storage</b>
                        </td>
                        <td style="width: 20%">   
                        <gw:list id="lstStorage1" styles="width:100%" onclick="OnSearch()" />                          
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 30%">                             
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 16%; white-space: nowrap" align="center">                            
                        </td>
						<td style="width: 1%">                             
                        </td>
                        <td style="width: 1%">                            
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="lock_open" text="UnLock" onclick="OnProcess('Cancel')" />
                        </td>                      
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="14">
                            <gw:grid id='grdApprove' header='_WH_PK|W/H ID|W/H Name'
                                format='0|0|0' aligns='0|1|0' check='||' editcol='0|0|0'
                                widths='0|2000|1200' sorting='T' styles='width:100%; height:100%' />
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
	<gw:textbox id="txtUser_PK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
