<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Vina Genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Employees List</title>
</head>
<script>
function BodyInit()
{
    BindingDataList();
    txtKeyWord.GetControl().focus();
    
    var TAC_ABTRTYPE_pk = "<%=request.QueryString("TAC_ABTRTYPE_pk")%>";
    _TAC_ABTRTYPE_pk.SetDataText(TAC_ABTRTYPE_pk);
}
function BindingDataList()
{   
  lstDept.SetDataText("<%=CtlLib.SetListDataSQL("SELECT PK, ORG_ID ||'-'|| ORG_NM FROM TCO_ORG ORDER BY 2")%>|ALL|Select All");
  lstDept.value = "ALL";
}

function doSearch()
{
 
	data_gfnt00070_11.Call('SELECT');
}

function doSelect()
{
	var aValue = new Array()
	var ctrl = idGrid.GetGridControl();
    
	if(ctrl.row > 0 ) {
	  for(i=1;i<2;i++)
	  {
		 tmp= new Array();
		 for(j=0;j<idGrid.cols;j++)
         {
			tmp[tmp.length] = idGrid.GetGridData(idGrid.row,j);
			
		 }
		 aValue[aValue.length]=tmp; 
	  }
    }
	window.returnValue = aValue; 
	window.close(); 
}
function OnSelectAll()
{	
    var ctrl=idGrid.GetGridControl();
    if( chkSelectAll.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
        idGrid.SetGridText(i,0,"-1");
    }
	else
	{
            for(var i=1;i<ctrl.rows;i++)
            idGrid.SetGridText(i,0,"0");
    }        

}
//---------------------------------------------------------
function onExit()
{
    var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
}
//---------------------------------------------------------
function SelectCheck()
{
	
	var aValue = new Array();
	for(i=1;i<idGrid.rows;i++)
    {
    
		if(idGrid.GetGridData(i,0)== "-1" ) 
		{
			tmp= new Array();
			
			
			for(j=0;j<idGrid.cols;j++)
            {
				tmp[tmp.length] = idGrid.GetGridData(i,j);
				
			}
			aValue[aValue.length]=tmp; 
		}
    }
	window.returnValue = aValue; 
	window.close(); 
}
//---------------------------------------------------------
</script>

<body>
<gw:data id="data_gfnt00070_11"  > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ac_sel_60030070_11" > 
            <input> 
                <input bind="lstDept" />
                <input bind="lstKey" />
                <input bind="txtKeyWord" />
                <input bind="_TAC_ABTRTYPE_pk" />
             </input>
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<table style="margin-left:5" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
			<tr>
                <td width="1%"><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll()" /> </td>
                <td width="10%" align=left> Select All</td>
                <td width="10%" align=right>Department:</td>
	            <td width="40%"><gw:list id="lstDept"></gw:list></td>
	            <td width="5%" align=right>Key</td>
	            <td width="12%"><gw:list id="lstKey"><data>DATA|0|Emp Name|1|Emp ID|2|User ID</data></gw:list></td>
	            <td width="15%"><gw:textbox id="txtKeyWord" ></gw:textbox></td>
                <td align="right" width="5%"><gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="doSearch();" /></td>
                <td align="right" width="5%"><gw:imgBtn id="idSelect" img="select" alt="Search" text="Select" onclick="SelectCheck();" /></td>
                <td align="right" width="5%"><gw:imgBtn id="idCancel" img="cancel" alt="Exit" text="Exit" onclick="onExit();" /></td>
             </tr>
		 </table>  
     </fieldset>
    </td>
  </tr>
  
  <tr>
      <!--0.Chk|1.User ID|2.Emp ID|3.Employee Name|4.Department|5.tco_bsuser_pk|TAC_ABTRTYPE_pk-->
	  <td colspan = "9">
		<gw:grid   
        id="idGrid"  
        header="Chk|User ID|Emp ID|Employee Name|Department|_tco_bsuser_pk|_TAC_ABTRTYPE_pk"   
        format="3|0|0|0|0|0|0"  
        aligns="0|0|0|0|0|0|0"  
        defaults="||||||"  
        editcol="0|0|0|0|0|0|0"  
        widths="500|1500|1500|3000|3000|0|0"  
        styles="width:100%; height:450"   
        sorting="T"   
        oncelldblclick ="doSelect()" /> 
	</td>
  </tr>
</table>
 <gw:textbox  id="_TAC_ABTRTYPE_pk" styles='display:none'/>
</body>
</html>
