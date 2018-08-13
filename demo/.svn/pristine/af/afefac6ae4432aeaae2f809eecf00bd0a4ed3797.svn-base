<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>VIEW PROCESS INFO</title>
</head>

<script type="text/javascript" language="javascript">
    
   
var G2_PK                    = 0,
    G2_SEQ                   = 1,
    G2_MA_PROCESS_PK         = 2,
    G2_MA_TASK_TYPE          = 3,
    G2_MA_TASK_TYPE_NAME     = 4,
    G2_MA_TASK_PK            = 5,
    G2_MA_TASK_NAME          = 6;
   
var G3_PK                    = 0,
    G3_SEQ                   = 1,
    G3_PARK_PK               = 2,
    G3_ITEM_CODE             = 3,
    G3_ITEM_NAME             = 4,
    G3_QTY                   = 5,
    G3_MA_PROCESS_PK         = 6;

//=================================================================================

function BodyInit()
{
    txtProcessPK.SetEnable(false);
    txtProcessID.SetEnable(false);
    txtProcessName.SetEnable(false);
    txtProcessPK.text = "<%=request.QueryString("ProcessPK")%>";
    txtProcessID.text = "<%=request.QueryString("ProcessID")%>";
    txtProcessName.text = "<%=request.QueryString("ProcessName")%>";
    
    System.Translate(document);  // Translate to language session
    BindingDataList(); 
    //----------------------------
    var ctrl = grdProcessTask.GetGridControl();
    ctrl.ColFormat(G2_SEQ) = "###,###,###,###,###";
    ctrl = grdProcessCons.GetGridControl();
    ctrl.ColFormat(G3_SEQ) = "###,###,###,###,###";
    ctrl.ColFormat(G3_PARK_PK) = "###";
    ctrl.ColFormat(G3_QTY) = "###,###,###,###,###";
    OnSearch(grdProcessTask);    
    
}

//=================================================================================
function BindingDataList()
{
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
    grdProcessTask.SetComboFormat(G2_MA_TASK_TYPE,data);
}

//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {      
        case "data_fpma00010_1" :
             lblRecord_M1.text=grdProcessTask.rows-1 + " record(s).";            
             data_fpma00010_2.Call('SELECT');
        break;
        case 'data_fpma00010_2':
            lblRecord_M2.text=grdProcessCons.rows-1 + " record(s).";            
        break;
    }    
}
//=================================================================================
function OnSearch(objGrid)
{
    switch (objGrid.id)
    {
        case 'grdProcessTask':
            data_fpma00010_1.Call('SELECT');
        break;
        case 'grdProcessCons' :
            data_fpma00010_2.Call("SELECT");
        break;                             
    }
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter ="0,1,2,5" function="<%=l_user%>lg_sel_fpma00010_1" procedure="<%=l_user%>lg_upd_fpma00010_1" > 
                <input bind="grdProcessTask" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00010_2" parameter="0,1,2,5,6" procedure="<%=l_user%>lg_upd_fpma00010_2" > 
                <input bind="grdProcessCons" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <td style="height: 100%; width: 50%">
        <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr style="height: 50%; width: 100%">
                <td>
                    <fieldset style="height: 100%; width: 100%; padding: 0 0 0 0; margin: 0 0 0 2;">
                        <legend>Task of Process:</legend>
                        <table style="width: 100%; height: 100%" border="0">
                            <tr style="height: 1%">
                                <td>
                                    <table style="width: 100%; height: 100%">
                                        <tr>
                                            <td style="width: 5%" align="left">
                                                Process
                                            </td>
                                            <td style="width: 60%; white-space: nowrap;" align="center">
                                                <gw:textbox id="txtProcessPK" maxlen="100" styles='width:100%;display:none' />
                                                <gw:textbox id="txtProcessID" csstype="mandatory" styles='width:30%' />
                                                <gw:textbox id="txtProcessName" csstype="mandatory" styles='width:70%' />
                                            </td>
                                            <td style="width: 30%" align="center">
                                                <gw:label img="new" id="lblRecord_M1" style="font-weight: bold; color: red; font-size: 12"
                                                    text="0 record(s)." />
                                            </td>
                                            <td style="width: 1%" align="right">
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 99%">
                                <td>
                                    <gw:grid id='grdProcessTask' header='_PK|Seq|_MA_PROCESS_PK|_TaskTypePK|Task Type|_MA_TASK_PK|Task Name'
                                        format='1|1|1|0|0|1|0' aligns='2|1|0|0|0|3|0' check='||||||' editcol='0|1|1|0|0|1|1'
                                        widths='1000|1000|1000|1000|2000|1000|2000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr style="height: 50%; width: 100%">
                <td>
                    <fieldset style="height: 100%; width: 100%; padding: 0 0 0 0; margin: 0 0 0 2;">
                        <legend>Maintenance tools of Process:</legend>
                        <table style="width: 100%; height: 100%" border="0">
                            <tr style="height: 1%">
                                <td>
                                    <table style="width: 100%; height: 100%">
                                        <tr>
                                            <td style="width: 5%" align="left">
                                            </td>
                                            <td style="width: 50%" align="center">
                                            </td>
                                            <td style="width: 40%" align="center">
                                                <gw:label img="new" id="lblRecord_M2" style="font-weight: bold; color: red; font-size: 12"
                                                    text="0 record(s)." />
                                            </td>
                                            <td style="width: 1%" align="right">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                            <td style="width: 1%">
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 99%">
                                <td>
                                    <gw:grid id='grdProcessCons' header='_PK|Seq|Part Pk|Item Code|Item Name|Qty|_MA_PROCESS_PK'
                                        format='1|1|1|0|0|1|1' aligns='3|1|3|0|0|3|1' check='||||||' editcol='1|1|1|1|1|1|0'
                                        widths='1000|1000|1000|1500|6000|1000|10' styles='width:100%; height:100%' />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </td>
    <!--------------------------------------------------------->
</body>
</html>
