<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>System Configuration</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var T3_G1_PK               = 0,
    T3_G1_TRANS_TYPE       = 1,
    T3_G1_TRANS_CODE       = 2,
    T3_G1_TRANS_NAME       = 3,
    T3_G1_TIN_WAREHOUSE_PK = 4,
    T3_G1_WH_NAME          = 5,
    T3_G1_COST_YN     	   = 6,
    T3_G1_WH_LOCATION      = 7,
    T3_G1_CLOSE_YN         = 8,
    T3_G1_DESCRIPTION      = 9;
	
//====================================================================================	
function BodyInit()
{  
    System.Translate(document); 
	
    BindingDataList();
    data_agds00110.Call("SELECT");
}
//====================================================================================
function BindingDataList()
{    
    var data=""; 
    
    data = "data|I|I * INCOMING TRANS|O|O * OUTGOING TRANS|A|A * ASSET TRANS|D|D * DEPRECIATION TRANS|C|C * COST TYPE|R|REVENUE TYPE";
    lstTranStyle.SetDataText(data); 
    lstTranStyle.value = '' ;
    
    data ="#I;I * INCOMING|#O;O * OUTGOING|#A;A * ASSET TRANS|#D;D * DEPR TRANS|#C;C * COST TYPE|#R;R * REVENUE TYPE"
    GridDetail3.SetComboFormat(T3_G1_TRANS_TYPE,data);    
} 
//====================================================================
function FormatGrid()
{
}
//====================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_agds00110_2':
            if ( GridDetail3.rows > 1 )
            {
                GridDetail3.SetCellBgColor( 1, T3_G1_WH_NAME, GridDetail3.rows - 1, T3_G1_WH_LOCATION, 0xCCFFFF );
            }
        break;
        
    }
}
//====================================================================
function OnSearch(obj)
{
    switch(obj)
    {
        case 'T1':
            data_agds00110.Call("SELECT");
        break;
        case 'T2':
            data_agds00110_1.Call("SELECT");
        break;
        case 'T3':
            data_agds00110_2.Call("SELECT");
        break;
    }
}
//====================================================================
function OnAddNew(obj)
{
    obj.AddRow()
}
//====================================================================
function OnDelete(obj)
{
    obj.DeleteRow()
}
//====================================================================
function OnUnDelete(obj)
{
    obj.UnDeleteRow()
}
//====================================================================
function OnSave(obj)
{
    switch(obj)
    {   
        case 'T1':
        data_agds00110.Call();
        break;
        case 'T2':
        data_agds00110_1.Call();
        break;        
        case 'T3':
        data_agds00110_2.Call();
        break;
    }
}
//====================================================================
function OnGridCellDblClick_T3(obj)
{
var row,col 
    
    row = event.row;
    col = event.col;
    
    switch (col)
    {
        case T3_G1_WH_NAME :
        {
            var path = System.RootURL + '/form/fp/ab/fpab00240.aspx';
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            
            if ( object != null )
            {
                GridDetail3.SetGridText( row, T3_G1_TIN_WAREHOUSE_PK, object[0]);
                GridDetail3.SetGridText( row, T3_G1_WH_NAME,          object[2]);                
            }          
        }  
        break; 
        
        case T3_G1_WH_LOCATION :
        {
            var path = System.RootURL + '/form/fp/ab/fpab00160.aspx';
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            
            if ( object != null )
            {
                GridDetail3.SetGridText( row, T3_G1_WH_LOCATION,  object[3]);
            }
        
        }  
        break; 
   }
}

</script>

<body>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agds00110" procedure="st_lg_upd_agds00110"> 
                <input bind="GridDetail"  > 
                    <input bind="txtFilter" />	
                </input> 
                <output bind="GridDetail" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agds00110_1" procedure="st_lg_upd_agds00110_1"> 
                <input bind="GridDetail2"  > 
                    <input bind="txtFilter2" />	
                </input> 
                <output bind="GridDetail2" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00110_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="st_lg_sel_agds00110_2" parameter="0,1,2,3,4,5,6,7,8,9" procedure="st_lg_upd_agds00110_2"   > 
			    <input  > 
			        <input bind="lstTranStyle" />
			    </input>     			
			    <output bind="GridDetail3" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------- MainTable -------------------------->
      <gw:tab id="tab">                
                <table style="height: 100%; width: 100%" name="Approve Setting">
                    <tr>
                        <td width="10%">
                            Search</td>
                        <td width="30%">
                            <gw:textbox id="txtFilter" styles="width:100%" onenterkey="OnSearch('T1')" />
                        </td>
                        <td width="50%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnSearch01" img="search" alt="Search" styles='width:100%' onclick="OnSearch('T1')" />
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="ibnNew" img="new" alt="New" styles='width:100%' onclick="OnAddNew(GridDetail)" />
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="ibnDelete" img="delete" alt="Delete" styles='width:100%' onclick="OnDelete(GridDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnUpdate01" img="save" alt="save" styles='width:100%' onclick="OnSave('T1')" />
                        </td>
                    </tr>
                    <tr style="height: 99%; width: 100%">
                        <td colspan="7">
                            <gw:grid id='GridDetail' 
                                header='_PK|Seq|Form Id|Form Name|Auto Approve|Keep Cancel|User Authority|Remark|Use YN'
                                format='0|0|0|0|3|3|3|0|3' aligns='0|0|0|0|0|0|0|0|0' check='||||||||'
                                editcol='0|1|1|1|1|1|1|1|1' 
                                default='||||-1|-1|-1||-1'
                                widths='1000|1000|1500|2000|1500|1500|1500|2000|1500'
                                sorting='T'  styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
                <table style="height: 100%; width: 100%" name="Process Config">
                    <tr>
                        <td width="10%">
                            Search</td>
                        <td width="30%">
                            <gw:textbox id="txtFilter2" styles="width:100%" onenterkey="OnSearch('T2')" />
                        </td>
                        <td width="50%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnSearch02" img="search" alt="Search" styles='width:100%' onclick="OnSearch('T2')" />
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="ibnNew2" img="new" alt="New" styles='width:100%' onclick="OnAddNew(GridDetail2)" />
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="ibnDelete2" img="delete" alt="Delete" styles='width:100%' onclick="OnDelete(GridDetail2)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibnUpdate02" img="save" alt="save" styles='width:100%' onclick="OnSave('T2')" />
                        </td>
                    </tr>
                    <tr style="height: 99%; width: 100%">
                        <td colspan="7">
                            <gw:grid id='GridDetail2' 
                                header='_PK|Seq|Code |Func Name| Value |_Num_val|Remark|Proc Used|Use YN'
                                format='0|0|0|0|0|0|0|0|3' aligns='0|0|0|0|1|0|0|0|0' check='||||||||'
                                editcol='0|1|1|1|1|1|1|1|1' 
                                default='|||||||'
                                widths='0|800|1000|2000|0|1500|3000|2000|800'
                                sorting='T'                                
                                styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; height: 100%" name="Transaction Code">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Trans Type</td>
                        <td style="width: 45%">
                            <gw:list id="lstTranStyle" text="" styles="width:100%" onchange="OnSearch('T3')" />
                        </td>
                        <td style="width: 45%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('T3')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" onclick="OnAddNew(GridDetail3)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" onclick="OnDelete(GridDetail3)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUnDelete" img="udelete" onclick="OnUnDelete(GridDetail3)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" onclick="OnSave('T3')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            <gw:grid id='GridDetail3' header='_PK|Trans Type|Trans Code|Trans Name|_TIN_WAREHOUSE_PK|Warehouse Name|Cost|Warehouse Location|Close|Description'
                                format='0|0|0|0|0|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|1|0' defaults='|||||||||'
                                editcol='0|1|1|1|0|0|0|0|0|1' widths='0|2000|1500|2000|0|2500|1000|2500|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick_T3()' />
                        </td>
                    </tr>
                </table>
       </gw:tab>
</body>
<!---------------------------------------------------------------->
<!---------------------------------------------------------------->
</html>
