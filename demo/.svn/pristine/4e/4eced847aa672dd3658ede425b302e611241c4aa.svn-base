<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POPUP GET ONE PROCESS ENTRY</title>
</head>

<script type="text/javascript" language="javascript">
 
var _RowSelect = '-1';

var G1_PK                 = 0,   
    G1_SEQ                = 1,   
    G1_MA_TYPE            = 2,   
    G1_PROCESS_ID         = 3,
    G1_PROCESS_NAME       = 4,
    G1_ST_AMOUNT          = 5,
    G1_DESCRIPTION        = 6,    
    G1_ISSELECTED         = 7;
    
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
    System.Translate(document);  // Translate to language session
	
    BindingDataList(); 
	
    var ctrl = grdProcess.GetGridControl();
    ctrl.ColFormat(G1_SEQ) = "###,###,###,###,###";
	
    var ctrl = grdProcessTask.GetGridControl();
    ctrl.ColFormat(G2_SEQ) = "###,###,###,###,###";
    ctrl = grdProcessCons.GetGridControl();
    ctrl.ColFormat(G3_SEQ) = "###,###,###,###,###";
    ctrl.ColFormat(G3_PARK_PK) = "###";
    ctrl.ColFormat(G3_QTY) = "###,###,###,###,###";
	 
    OnSearch(grdProcess);   
    _RowSelect = '-1'; 
}                 

//=================================================================================
function BindingDataList()
{    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1130' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
    grdProcess.SetComboFormat(G1_MA_TYPE,data);
}

//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {      
        case "data_fpma00012" :
             lblRecord_M.text=grdProcess.rows-1 + " record(s).";
                          
        break;
		
        case 'data_fpma00012_1':
            data_fpma00012_2.Call('SELECT');
        break
    }    
}

//=================================================================================
function OnSearch(objGrid)
{
    switch (objGrid.id)
    {
        case 'grdProcess' :
            data_fpma00012.Call("SELECT");
        break;
                                  
    }
}
//======================================================================
function OnGridCellDblClick(objGrid)
{
    OnSelect(objGrid);
}

//=======================================================================

function OnGridCellClick(objGrid)
{
    if(grdProcess.rows > 0)
    {
        if(_RowSelect == '-1')
        {
            if(_RowSelect != grdProcess.row)
            {
                _RowSelect = grdProcess.row;
                txtProcessPK.text = grdProcess.GetGridData(grdProcess.row, G1_PK ); 
                data_fpma00012_1.Call('SELECT');
            }
        }
    }
}

//=======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
	        if(oGrid.GetGridData(oGrid.row, G1_ISSELECTED)==0)
	        {
                for( j=0 ; j<oGrid.cols ; j++ )
                {
                    code_data[j] = oGrid.GetGridData(oGrid.row , j );
                }
            } 
            else
            {
                code_data = null;
            }
	    }
	    else
	    {
	        code_data = null;	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

function onPageActive()
{
   
}

//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00012" parameter="0,1,2,3,4,5,6" > 
                <input bind="grdProcess" >
                    <input bind="txtProcess" />
                </input>
                <output  bind="grdProcess" />
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="data_fpma00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter ="0,1,2,5" function="<%=l_user%>lg_sel_fpma00012_1" procedure="<%=l_user%>lg_upd_fpma00012_1" > 
                <input bind="grdProcessTask" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00012_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00012_2" parameter="0,1,2,5,6" procedure="<%=l_user%>lg_upd_fpma00012_2" > 
                <input bind="grdProcessCons" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtProcess" csstype="mandatory" text="" styles='width:100%' onenterkey="OnSearch(grdProcess)" />
                        </td>
                        <td style="width: 28%" align="center">
                            <gw:label img="new" id="lblRecord_M" style="font-weight: bold; color: red; font-size: 12"
                                text="0 record(s)." />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(grdProcess)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="select" onclick="OnSelect(grdProcess)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Seq|Ma Type|Process Id|Process Name|ST Amount|Description|_isSelected'
                    format='1|1|2|0|0|1|0|0' aligns='3|1|0|0|0|3|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='10|500|1000|1000|2000|1200|2000|100' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick='OnGridCellDblClick(this)' oncellclick='OnGridCellClick(this)' />
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <gw:tab id="tabMain" border="1" style="width: 100%; height: 100%;" onpageactivate="onPageActive()"> 
                    <table id="tab_grdProcessTask" name="Task of Process" style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td>
                                <gw:grid id='grdProcessTask' header='_PK|Seq|_MA_PROCESS_PK|_TaskTypePK|Task Type|_MA_TASK_PK|Task Name'
                                    format='1|1|1|0|0|1|0' aligns='2|1|0|0|0|3|0' check='||||||' editcol='0|1|1|0|0|1|1'
                                    widths='1000|1000|1000|1000|2000|1000|2000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                            </td>
                        </tr>
                    </table>
                    <table id="tab_grdProcessCons" name="Maintenance tools of Process" style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td>
                                
                                  <gw:grid id='grdProcessCons' header='_PK|Seq|_Part Pk|Item Code|Item Name|Qty|_MA_PROCESS_PK'
                                    format='1|1|1|0|0|1|1' aligns='3|1|3|0|0|3|1' check='||||||' editcol='1|1|1|1|1|1|0'
                                    widths='1000|1000|1000|1500|6000|1000|10' styles='width:100%; height:100%' /> 
                           </td>
                        </tr>
                    </table>                            
                </gw:tab>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtProcessPK" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
