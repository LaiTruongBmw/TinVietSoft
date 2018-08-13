<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>Pop Up Get Warehouse</title>
</head>

<script type="text/javascript" language="javascript">
//--------------------------------------------------------------
var g_comp_pk = "";
function BodyInit()
{
	g_comp_pk = "<%=Request("company_pk") %>" ;
	txtCompany.SetDataText(g_comp_pk);
    OnSearch();
}
//--------------------------------------------------------------

function OnSearch()
{
    dsoGetWarehouse.Call("SELECT")    
}
    
//--------------------------------------------------------------
    
    function RowDbClick()
     {
        var code_data=new Array()
	    var ctrl = idGrid.GetGridControl();
	    var index, rowNo
	    index =0;
	    rowNo = 0
	    if(ctrl.SelectedRows == 0)
        {
               return ;
        }
        else
	    {
	         for(i=0;i<ctrl.SelectedRows;i++)
			    {	  
		            rowNo = ctrl.SelectedRow(i)
		            for(j=0;j< idGrid.cols -1; j++)
		            {
	                    code_data[index] = idGrid.GetGridData(rowNo , j );
	                    index ++;
                    } 
                    
			    }
	    }
	    window.returnValue = code_data; 
	    this.close();	     	
    }
    
//--------------------------------------------------------------
    
</script>

<body>
    <gw:data id="dsoGetWarehouse" onreceive="idGrid.GetGridControl().AutoSize( 0, 13, false, 0 ); "> 
    <xml> 
           <dso id="1" type="grid" function="ac_sel_60090010_wh_ap" > 
                  <input bind="idGrid" > 
					<input bind="txtCompany" />
                    <input bind="txtID" /> 
                    <input bind="txtName" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-- This is our html --------------------------------------------------  -->
    <table style="height: 100%; width: 100%">
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td width="10%" align="right" >
                            <b>ID</b></td>
                        <td width="35%">
                            <gw:textbox id="txtID" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td width="10%" align="right">
                            <b>Name</b></td>
                        <td width="35%">
                            <gw:textbox id="txtName" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td width="10%">
                            <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id="idGrid" 
                    header="_PK|WH ID|WH NAME|_tin_storage_pk|Storage
                            |_WH Item Class|Item Grade|_Item Use YN|_Outside YN|_Stock YN
                            |_Use YN|_Start Date|_End Date|Description"
                    format="0|0|0|0|0|
                            0|0|0|0|0|
                            0|0|0|0" 
                    aligns="0|0|0|0|0|
                            0|0|0|0|0|
                            0|0|0|0" 
                   editcol="0|0|0|0|0|
                            0|0|0|0|0|
                            0|0|0|0"
                    widths="0|2000|3000|2000|2000|
                            2000|2000|2000|0|0|
                            0|0|0|0"                           
                    styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="RowDbClick()" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13" />
            </td>
        </tr>
    </table>
	<gw:textbox id="txtCompany" style="display:none;" />
</body>
</html>
