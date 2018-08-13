<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Get UOM</title>
</head>

<script type="text/javascript" language="javascript">
//-------------------------------------------------
    function BodyInit()
    {
	System.Translate(document);
        //-----------------------
        OnSearch();
    }
 //------------------------------------------------

    function OnSearch()
    {
        data_fpab00230.Call("SELECT")    
    }
    //-------------------------------------------------

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
    //-------------------------------------------------

</script>

<body>
    <!----------------------------------------------------->
    <gw:data id="data_fpab00230" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_SEL_FPAB00230" > 
                  <input bind="idGrid" > 
                    <input bind="txtID" /> 
                    <input bind="txtName" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-- --------------------------------------------------  -->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                UOM ID</td>
            <td style="width: 30%">
                <gw:textbox id="txtID" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                UOM Name</td>
            <td style="width: 40%" align="left">
                <gw:textbox id="txtName" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 9%">
            </td>
            <td style="width: 1%">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="6">
                <gw:grid id="idGrid" header="_PK|UOM CD|UOM NM|_UOM LNM|_UOM FNM|Dimension Type"
                    format="0|0|0|0|0|0" aligns="0|0|0|0|0|0" defaults="|||||" editcol="0|0|0|0|0|0"
                    widths="0|1500|2000|2000|2000|2000" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="RowDbClick()" param="0,1,2,3,4,5" />
            </td>
        </tr>
    </table>
</body>
</html>
