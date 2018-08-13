<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Warehouse Location Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_WH_LOC_PK		= 0,
	G_STORAGE_PK	= 1,
	G_STORAGE_ID	= 2,
	G_STORAGE_NAME	= 3,
	G_ROW			= 4,
	G_STAIR			= 5,
	G_COLUMN		= 6,
	G_RACK_ID		= 7,
	G_ACTIVE		= 8,
	G_REMARK		= 9;

//-----------------------------------------------
function BodyInit()
{
    System.Translate(document);
	 
    BindingDataList(); 
    
    OnSearch();       
}
//-----------------------------------------------
function BindingDataList()
{
	var data = '';
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk,a.STRG_ID || ' * ' || a.STRG_NAME from tlg_in_storage a where a.del_if = 0 order by a.STRG_ID")%>||Select ALL";
	lstStorage.SetDataText(data);
	lstStorage.value = '' ;
}
//=====================================================
function OnSearch()
{
	idData_grdWHLocation.Call("SELECT");
}

//=====================================================
function OnSelect()
{
    var code_data = new Array() ;
	    var ctrl = grdWHLocation.GetGridControl();
	    var index, rowNo ;
	    
	    index =0;
	    rowNo = 0 ;
	    
	    if ( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
	    {
	       for(i=0; i<ctrl.SelectedRows; i++)
		    {
		             rowNo = ctrl.SelectedRow(i);
    		         
		             for(j=0; j < grdWHLocation.cols -1; j++)
		             {
		                    code_data[index] = grdWHLocation.GetGridData(rowNo , j );
                            index ++;
                     }
	        }
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
}
//=====================================================
</script>

<body>
	<!---------------------------------------------------------------->
				<gw:data id="idData_grdWHLocation">
                    <xml>
                        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_lg_sel_fpab00160">
                            <input bind="grdWHLocation" >
				                <input bind="lstStorage" />
                                <input bind="txtLocID" />
                            </input>
                            <output bind="grdWHLocation" />
                        </dso>
                    </xml>
                </gw:data>
	<!---------------------------------------------------------------->						
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%" align="right">
                Storage</td>
            <td style="width: 40%">
                <gw:list id="lstStorage" styles="width:100%" onclick="OnSearch()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                Rack ID</td>
            <td style="width: 30%">
                <gw:textbox id="txtLocID" styles="width:100%" />
            </td>
            <td style="width: 8%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="15">
                
                <gw:grid id="grdWHLocation" 
                header="_pk|_tin_storage_pk|_STORAGE ID|Storage Name|Row|Stair|Column|Rack ID|Active|Remark"
                    format="0|0|0|0|0|0|0|0|3|0" 
                    aligns="0|1|0|0|0|0|0|0|0|0" 
                    defaults="||||||||-1|"
                    editcol="0|0|0|0|0|0|0|0|0|0" 
                    widths="0|0|1500|2500|1500|1500|1500|2000|1000|0"
                    styles="width:100%; height:100%" sorting="T" 
                    oncelldblclick="OnSelect()" param="0,1,2,3,4,5,6,7,8,9" />
            </td>
        </tr>
    </table>
	
	<!---------------------------------------------------------------->
	
</body>
</html>
