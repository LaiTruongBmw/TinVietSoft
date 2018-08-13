<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>ADJUST SLIP APPROVE</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK        = 0,           
    G1_MASTER_PK  = 1,
    G1_STATUS     = 2,
    G1_SLIP_DATE  = 3,
    G1_SLIP_NO    = 4,	
	G1_DEPR_SD_ID = 5,
	G1_TRANS_CODE = 6,
    G1_FULL_NAME  = 7,
	G1_REMARK 	  = 8,
    G1_APPROVE    = 9,
    G1_CANCEL     = 10;
    
var G2_MASTER_PK  = 0,
    G2_STATUS     = 1,
    G2_SLIP_DATE  = 2,
    G2_SLIP_NO    = 3,	
	G2_DEPR_SD_ID = 4,
	G2_TRANS_CODE = 5,
    G2_FULL_NAME  = 6,
	G2_REMARK 	  = 7,
    G2_APPROVE    = 8,
    G2_CANCEL     = 9;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document);
    txtCancelChargerPK.text="<%=Session("EMPLOYEE_PK")%>";
    //---------------------------------- 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;   
    //-----------------------------------------   
    FormatGrid();
     
    //------------------------------------
    OnSearch('grdConfirm');    
}
//==================================================================
  
function FormatGrid()
{
	  
     
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_fpma00260.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fpma00260_1.Call('SELECT')
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
                var path = System.RootURL + '/form/fp/ma/fpma00261.aspx?type=APPROVE&po_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_MASTER_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }  
	        else
	        {
	            alert('Pls select Slip No.');
	        }                   
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/form/fp/ma/fpma00261.aspx?type=CANCEL&po_pk=' + grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
	        }
	        else
	        {
	            alert('Pls select Slip No.');
	        }         	        
         break;                        
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpma00260':
            lbRecord.text = grdConfirm.rows-1 + " record(s)";
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_SLIP_NO, grdConfirm.rows - 1, G1_SLIP_NO, true);                                   
            }
            OnSearch('grdApprove');         
        break;    
        
        case 'data_fpma00260_1':       
            lbRecord1.text = grdApprove.rows-1 + " record(s)";  
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_SLIP_NO, grdApprove.rows - 1, G2_SLIP_NO, true);
               // grdApprove.SetCellBgColor( 1, G2_Total_Amt, grdApprove.rows - 1, G2_Total_Amt, 0xCCFFFF );                                      
            }                     
        break;                 
        
        case 'pro_fpma00260_3' :
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');   
        break;
        case'pro_fpma00260_4':
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');
        break;
    }
}
  
//==================================================================
var flag="";

function OnProcess(pos)
{
    switch (pos)
    {
        
        case'Approve':
            var po_pk = "";
            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData( i, 0);
                var b = grdConfirm.GetGridData( i, 1);
                
                if ( a == "-1" )
                {
                   po_pk= po_pk + b +",";
                }
            }
            
            txtArrayPOPK.text = po_pk.substring( 0, po_pk.length-1);
            
            if ( txtArrayPOPK.text == "" )
            {
                alert('You must select one Slip.');
            }
            else
            {
                pro_fpma00260_3.Call();
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel : ' + grdApprove.GetGridData( grdApprove.row, G2_SLIP_NO) ))
                {
                    txtArrayPOPK.text = grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK);
                    
                    pro_fpma00260_4.Call();
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
    <gw:data id="data_fpma00260" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fpma00260"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />                
			        <input bind="txtSearchNo1" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00260_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_SEL_fpma00260_1"  >
                <input bind="grdOrdPlan" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                  
			        <input bind="txtSearchNo2" />			        
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------Approve------------------------------>
    <gw:data id="pro_fpma00260_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00260" > 
                <input>
                    <input bind="txtArrayPOPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00260_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00260_1" > 
                <input>
                    <input bind="txtArrayPOPK" /> 
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
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                        </td>
                        <td style="width: 27%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
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
                        <td colspan="10">
                            <gw:grid id='grdConfirm' 
								header='Chk|_pk|Status|Date|Slip No|Depr SD|Trans Code|Charger|Remark|Approve|Canel'
                                format='3|0|0|4|0|0|0|0|0|0|0' 
								aligns='0|0|1|1|0|1|0|0|0|0|0' 
                                editcol='0|0|0|0|0|0|0|0|0|0|0' 
								widths='500|0|1200|1200|1500|1500|2000|1500|1500|1500|1500'
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
                        <td style="width: 1%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                            Slip Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 16%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print Report" styles='width:100%;display:none' id="btnPrint"
                                onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail1" img="2" text="View Detail" onclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="14">
							<gw:grid id='grdApprove' 
								header='_pk|Status|Date|Slip No|Depr SD|Trans Code|Charger|Remark|Approve|Canel'
                                format='0|0|4|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|1|0|0|0|0|0' 
                                editcol='0|0|0|0|0|0|0|0|0|0' 
								widths='0|1200|1200|1500|1500|2000|1500|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%' />                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-----------------------------------------------------------> 
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
