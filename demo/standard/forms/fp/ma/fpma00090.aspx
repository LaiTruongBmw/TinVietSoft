<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Request Maintenance Approve</title>

</head>

<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK		        = 0,
    G1_MA_REQ_PK		= 1,
    G1_REQ_NO		    = 2,
    G1_STATUS		    = 3,
    G1_STATUS_NAME	    = 4,
    G1_PROCESS		    = 5,
    G1_ASSET		    = 6,
    G1_UOM		        = 7,
    G1_REQ_DESC		    = 8;

    
var G2_CHK		        = 0,
    G2_MA_REQ_PK		= 1,
    G2_REQ_NO		    = 2,
    G2_STATUS		    = 3,
    G2_PROCESS		    = 4,
    G2_ASSET		    = 5,
    G2_UOM		        = 6,
    G2_REQ_DESC		    = 7;
//==================================================================
         
function BodyInit()
{          
    System.Translate(document);
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;  
    //-----------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom1.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom1.value=ldate ; 
    
    ldate=dtFrom2.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom2.value=ldate ;  
    var gCtrl = grdRequest1.GetGridControl();
    gCtrl.SelectionMode = 1;
    
   // FormatGrid();
    //-----------------------------------
    OnSearch(grdRequest1);
    
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;

}

//==================================================================
function OnSearch(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdRequest1':
            data_fpma00090.Call('SELECT');
        break;
        
        case 'grdRequest2':
            data_fpma00090_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnCopy()
{
    var gctrl = grdRequest1;
    if(gctrl.rows < 1) return;
    var RowSelect = 0;
    for( var i=1; i<gctrl.rows; i++)
    {
        var a = gctrl.GetGridData(i,G1_CHK);
        var b = gctrl.GetGridData(i,G1_MA_REQ_PK);        
        if (a == "-1" )
        {
           RowSelect = RowSelect + 1;
           txtOutGoPK.text = gctrl.GetGridData(i,G1_MA_REQ_PK); 
        }
    } 
    if(RowSelect == 1)
    {     
       // pro_fpma00090_2.Call();
        var path = System.RootURL + '/form/fp/ma/fpma00050.aspx?MA_REQ_PK=' + txtOutGoPK.text ;
        var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
        if ( obj != null )
        {
            data_fpma00090.Call('SELECT');
        }
    }
    else
    {
        alert('Pls choose on Request to copy data!');
        txtOutGoPK.text = '';
        RowSelect = 0;
    }
    
    
    
}
//==================================================================
function OnPrint()
{    
    txtDateFrom.text=dtFrom2.value;
    txtDateTo.text=dtTo2.value;
    
    var url =System.RootURL + "/reports/fp/ip/rpt_bini00180.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpma00090':
            if ( grdRequest1.rows > 1 )
            {
                lbRecord1.text = grdRequest1.rows-1 + " record(s)";
                btnApprove1.SetEnable(true);
                //grdRequest1.SetCellBold( 1, G1_WH_Name, grdRequest1.rows - 1, G1_WH_Name, true);
            }
            else
            {
                btnApprove1.SetEnable(false);
            }  
            OnSearch(grdRequest2);
        break;    
        
        case 'data_fpma00090_1':                    
            if ( grdRequest2.rows > 1 )
            {
                btnCancel2.SetEnable(true);                
               // grdRequest2.SetCellBold( 1, G2_WH_Name, grdRequest2.rows - 1, G2_WH_Name, true);
            }     
            else
            {
                btnCancel2.SetEnable(false);
            } 
            lbRecord2.text = grdRequest2.rows-1 + " record(s)";    
        break;  
                 
        case 'pro_fpma00090' :
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);
                data_fpma00090.Call('SELECT')   
            }
        break;
        
        case'pro_fpma00090_1':
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);
                data_fpma00090.Call('SELECT');
            }
        break;
        case 'pro_fpma00090_2':
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);
                data_fpma00090.Call('SELECT');
            }
        break;
    }
}
//==================================================================
function OnGridCellDblClick(objGrid)
{
    var col = event.col;
    var row = event.row;
    var path = '';
    var obj = null;
    switch(objGrid.id)
    {
        case 'grdRequest1':
            if(row > 0)
            {
                path = System.RootURL + '/form/fp/ma/fpma00091.aspx?MaReqPK=' + grdRequest1.GetGridData(row,G1_MA_REQ_PK);
                obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            }
        break;
        case 'grdRequest2':
            if(row > 0)
            {
                path = System.RootURL + '/form/fp/ma/fpma00091.aspx?MaReqPK=' + grdRequest2.GetGridData(row,G2_MA_REQ_PK);
                obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            }
        break;
    }
    if(obj!=null && obj == 1)
    {
        data_fpma00090.Call('SELECT');
    }
}
//==================================================================

function OnPopup(objGrid)
{
    var path = '';
    var obj = null;
    switch(objGrid.id)
    {
        case 'grdRequest1':
            if(objGrid.row > 0)
            {
                path = System.RootURL + '/form/fp/ma/fpma00091.aspx?MaReqPK=' + grdRequest1.GetGridData(objGrid.row,G1_MA_REQ_PK);
                obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            }
        break;
        case 'grdRequest2':
            if(objGrid.row > 0)
            {
                path = System.RootURL + '/form/fp/ma/fpma00091.aspx?MaReqPK=' + grdRequest2.GetGridData(objGrid.row,G2_MA_REQ_PK);
                obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            }
        break;
    }
    if(obj!=null && obj == 1)
    {
        data_fpma00090.Call('SELECT');
    }
}

//==================================================================

function OnProcess(objGrid)
{
    var OUTGO_PK = "";
    var t_link = "";
    switch (objGrid.id)
    {        
        case'grdRequest1':
            for( var i=1; i<objGrid.rows; i++)
            {
                var a = objGrid.GetGridData(i,G1_CHK);
                var b = objGrid.GetGridData(i,G1_MA_REQ_PK);
                
                if (a == "-1" )
                {
                   OUTGO_PK = OUTGO_PK + t_link + b ;
                   t_link = ",";
                }
            }            
            txtOutGoPK.text = OUTGO_PK;            
            if(txtOutGoPK.text=="")
            {
                alert('You must select one request to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_fpma00090.Call();
                 }       
            }
        break; 
        
        case 'grdRequest2':
            for( var i=1; i<objGrid.rows; i++)
            {
                var a = objGrid.GetGridData(i,G2_CHK);
                var b = objGrid.GetGridData(i,G2_MA_REQ_PK);
                
                if (a == "-1" )
                {
                   OUTGO_PK = OUTGO_PK + t_link + b ;
                   t_link = ",";
                }
            }            
            txtOutGoPK.text = OUTGO_PK;            
            if(txtOutGoPK.text=="")
            {
                alert('You must select one request to cancel.');
            }
            else
            {
                 if ( confirm ('Do you want to cancel ?') )
                 {
                        pro_fpma00090_1.Call();
                 }       
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
    <gw:data id="data_fpma00090" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpma00090"  >
                <input bind="grdRequest1" >
                    <input bind="dtFrom1" />
                    <input bind="dtTo1" />
                    <input bind="txtReqNo1" />
			        <input bind="txtProcess1" />
					<input bind="txtAsset1" />
					<input bind="txtEmpPK" />
                </input>
                <output bind="grdRequest1" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00090_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_sel_fpma00090_1"  >
                <input bind="grdRequest2" >
                    <input bind="dtFrom2" />
                    <input bind="dtTo2" />  
                    <input bind="txtReqNo2" />              
			        <input bind="txtProcess2" />
					<input bind="txtAsset2" />
					<input bind="txtEmpPK" />
                </input>
                <output bind="grdRequest2" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpma00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00090" > 
                <input>
                    <input bind="txtOutGoPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00090_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00090_1" > 
                <input>
                    <input bind="txtOutGoPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
     <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00090_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00090_2" > 
                <input>
                    <input bind="txtOutGoPK" /> 
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
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Req No
                        </td>
                        <td style="width: 15%; white-space: nowrap;">
                            <gw:textbox id="txtReqNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest1)" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtProcess1" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest1)" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Asset
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAsset1" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest1)" />
                        </td>
                        <td style="width: 7%; text-align: center; white-space: nowrap">
                            <gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>0 record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch(grdRequest1)" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove1" img="2" text="Approve" onclick="OnPopup(grdRequest1)" />
                        </td>                        
                        <td style="width: 1%">
                            <gw:icon id="btnNewRequest1" img="2" text="New Request" onclick="OnCopy()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdRequest1' header='Chk|_MA_REQ_PK|Req No|_STATUS|Status|Process|Asset|UOM|Remark'
                                format='3|1|0|0|0|0|0|0|0' aligns='1|0|1|0|0|0|0|1|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' defaults='||||||||'
                                styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' />
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
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Req No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtReqNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest2)" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtProcess2" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest2)" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Asset
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAsset2" maxlen="100" styles='width:100%' onenterkey="OnSearch(grdRequest2)" />
                        </td>
                        <td style="width: 3%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord2" styles='width:100%;color:cc0000;font:9pt'>0 record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch(grdRequest2)" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel2" img="2" text="Cancel" onclick="OnPopup(grdRequest2)" />
                        </td>
                       
                        
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdRequest2' header='Chk|_MA_REQ_PK|Req No|Status|Process|Asset|UOM|Remark'
                                format='3|1|0|0|0|0|0|0' aligns='1|0|1|0|0|0|1|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' defaults='|||||||'
                                styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
    <gw:textbox id="txtOutGoPK" styles='width:100%;display:none' />

</body>
</html>
