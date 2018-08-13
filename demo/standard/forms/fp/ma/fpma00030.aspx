<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Maintenance Scheduling</title>
</head>

<script type="text/javascript" language="javascript">

var G_CHK   		    = 0,
    G_MA_REQ_M_PK	    = 1,
    G_ASSET_PK		    = 2,
    G_ASSET_CODE		= 3,
    G_ASSET_NAME		= 4,
    G_ASSET_TYPE		= 5,
    G_UOM		        = 6,
    G_PROCESS_PK        = 7,
    G_PROCESS_ID		= 8,
    G_PROCESS_NAME		= 9,
    G_REQ_DATE		    = 10,
    G_REQ_TYPE		    = 11,
    G_STATUS		    = 12,
    G_STATUS_NAME		= 13,
    G_REQ_DESC		    = 14,
    G_TODAYS		    = 15;


function BodyInit()
{
    System.Translate(document);  // Translate to language session
    dtWarrToDate.SetDataText(System.AddDate(dtWarrToDate.GetData(),30));
    var gctrl = grdScheduling.GetGridControl();
    gctrl.ColFormat(G_TODAYS) = "###,###,###,###,###";
    BindingDataList();
    OnSearch(grdScheduling);
}
//=================================================================================
function BindingDataList()
{
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1140' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
     grdScheduling.SetComboFormat(G_REQ_TYPE,data);
}
//=================================================================================
function OnSearch(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdScheduling':
            data_fpma00030.Call('SELECT');
        break;
        default:
        break;
    }
}

//=================================================================================
function OnSave(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdScheduling':
            data_fpma00030.Call();
        break;
        default:
        break;
    }
}

//=================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Process':
            pro_fpma00030.Call();
        break;
        case 'Submit':
            var gctrl = grdScheduling;
            if(gctrl.rows - 1 < 1)
            {
                return;
            }
            var tmpVal = '';
            for(var i = 1; i < gctrl.rows; i ++)
            {
                if(gctrl.GetGridData(i, G_CHK) == '-1')
                {
                    tmpVal = tmpVal + gctrl.GetGridData(i,G_MA_REQ_M_PK) + ',';
                }
            }
            if(tmpVal == '')
            {
                return;
            }
            
            if(tmpVal.charAt(tmpVal.length-1) == ',')
            {
               tmpVal = tmpVal.substr(0,tmpVal.length - 1);
            }
            txtMaReqMArrPk.text = tmpVal;
            if(txtMaReqMArrPk.text!='')
            {
                pro_fpma00030_1.Call();
            }
        break;
        default:
        break;
    }
    
}

function OnDataReceive(p_oData)
{
  switch(p_oData.id)
  {
    case 'data_fpma00030':
        var l_Gird = grdScheduling;
        lblRecord.text = (l_Gird.rows - 1) + ' record(s)';
        if(l_Gird.rows > 0)
        {
            fortmatGrid(l_Gird);
        }
    break;
    case 'pro_fpma00030':        
        if(txtReturnValue.text != '')
        {
            alert(txtReturnValue.text);
            txtReturnValue.text = '';
            OnSearch(grdScheduling);
        }
    break;
    case 'pro_fpma00030_1':
        if(txtReturnValue.text != '')
        {
            alert(txtReturnValue.text);
            txtReturnValue.text = '';
            OnSearch(grdScheduling);
        }
    break;
    default:
    break;
  }
}

function fortmatGrid(objGrid)
{
    for(var i = 1; i < objGrid.rows; i++)
    {
        if(objGrid.GetGridData(i,G_STATUS) == '5')//da solved
        {
            objGrid.SetCellBgColor(i,0,i,objGrid.cols - 1,0xCDCDCD);
            continue;
        }
        if (objGrid.GetGridData(i,G_TODAYS) > 0)
        {
            objGrid.SetCellBgColor(i,0,i,objGrid.cols - 1,0xFFFF99);
        }
        else if (objGrid.GetGridData(i,G_TODAYS) < 0)
        {
            objGrid.SetCellBgColor(i,0,i,objGrid.cols - 1,0x0000CC);
        }
        else
        {
            objGrid.SetCellBgColor(i,0,i,objGrid.cols - 1,0xFFFFFF);
        }
    }
    
}

function OnGridCellAfterEdit(objGrid)
{
    var row = event.row;
    var col = event.col;
    
    switch(objGrid.id)
    {
        case 'grdScheduling':
            if(objGrid.rows >0)
            {
                if(col == G_CHK)
                {
                   
                }
            }
        break;
        default:
        break;
    }
}
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00030" parameter="0,3,5,8,9,10,12" procedure="<%=l_user%>lg_upd_fpma00030">  
                <input bind="grdScheduling" >
                    <input bind="dtWarrFrDate" />
                    <input bind="dtWarrToDate" />  
                </input>
                <output  bind="grdScheduling" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fpma00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00030" > 
                <input>
                    <input bind="dtWarrFrDate" />
                    <input bind="dtWarrToDate" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fpma00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00030_1" > 
                <input>
                    <input bind="txtMaReqMArrPk" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 5%">
                Date
            </td>
            <td style="width: 24%; white-space:nowrap;">
                <gw:datebox id="dtWarrFrDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                ~
                <gw:datebox id="dtWarrToDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
            </td>
            <td style="width: 67%">
                <table style="width: 100%; height: 100%" border="1">
                    <tr>
                        <td align="center">
                            <gw:label img="new" id="lblRecord" styles="font-weight: bold; color:#CC0000;" text="0 record(s)" />
                        </td>
                        <td align="center" style="background-color: #CC0000">
                            DELAY
                        </td>
                        <td align="center" style="background-color: #99FFFF">
                            EARLY
                        </td>
                        <td align="center" style="background-color: #FFFFFF">
                            CURRENT
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(grdScheduling)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave(grdScheduling)" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnProcess" img="2" text="Process" styles='width:100%' onclick="OnProcess('Process')" />
            </td>
            <td style="width: 1%">
                <gw:icon id="btnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
            </td>
        </tr>
        <tr style="width: 100%; height: 99%">
            <td colspan="7">
                <gw:grid id='grdScheduling' 
                header='Chk|_ma_req_m_pk|_ASSET_PK|Asset Code|Asset Name|Asset Type|UOM|_PROCESS_PK|Process Id|Process Name|Req Date|Req Type|_STATUS|Status|Req Description|Todays'
                    format='3|1|0|0|0|0|0|0|0|0|4|0|0|0|0|1' 
                    aligns='1|0|0|0|0|0|1|0|0|0|1|0|0|1|0|2' check='||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1|0|0|0' widths='500|100|1000|1000|3000|1100|1000|1000|1000|3000|1200|1200|1000|1000|3000|500'
                    sorting='T' styles='width:100%; height:100%' 
                    onafteredit='OnGridCellAfterEdit(this)'/>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtMaReqMArrPk" maxlen="100" styles='width:100%;display:none' />
</html>
