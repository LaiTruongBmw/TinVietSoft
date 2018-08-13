<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Employees List</title>
</head>

<script>
    
function BodyInit() {
    txtUserPK.text = "<% = Request.QueryString("p_userpk")%>";
    txtKeyWord.GetControl().focus();
}


function doSearch()
{
   // alert(lstDept.value);
	getObject.Call('SELECT');
}
//--------------------------------------------------------------------------
function OnSelect()
{
    
    var aData =new Array();
    var j;
    j=0;
    
        for (var i=1;i<idGrid.rows;i++)
        {
            if (idGrid.GetGridData(i,1)=='-1')
            {   
                var aRow=new Array();
                aRow[0]=idGrid.GetGridData(i,0) //get emp pk
                aRow[1]=idGrid.GetGridData(i,2) //get menu id
                aRow[2]=idGrid.GetGridData(i,3) //get menu name
                aRow[3]=idGrid.GetGridData(i,4) //get menu url
                
                aData[j]=aRow;
                j=j+1;
            }
            
        }
      
    window.returnValue = aData; 			
	this.close();
	
}

function OnSetPrint(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}
function doSelect()
{
    var aData =new Array();
    
    var aRow=new Array();
    var row = event.row;
    aRow[0]=idGrid.GetGridData(row,0) //get emp pk
    aRow[1]=idGrid.GetGridData(row,2) //get menu id
    aRow[2]=idGrid.GetGridData(row,3) //get menu name
    aRow[3]=idGrid.GetGridData(row,4) //get menu url
                
    aData[0]=aRow;
                
        
      
    window.returnValue = aData; 			
	this.close();
}
</script>

<body>
<gw:data id="getObject"  > 
    <xml> 
        <dso type="grid" function="ST_HR_SEL_GSHR00401_0" > 
            <input>
                <input bind="txtUserPK"/> 
                <input bind="lstKey" />
                <input bind="txtKeyWord" />
             </input>
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<table style="margin-left:5" height="100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="border:1;width:100%;height:5%" valign="top">
    <td width="10%"><gw:checkbox id="chkCheckPre" value="F" onclick="OnSetPrint(chkCheckPre,idGrid,1)"></gw:checkbox >Select</td>
    <td width="10%"></td>
    <td width="10%" align="right" valign="middle" >Search By</td>
	<td width="20%">
        <gw:list id="lstKey"><data>DATA|0|Menu ID|1|Menu Name</data></gw:list>
    </td>
	<td width="25%"><gw:textbox id="txtKeyWord" ></gw:textbox></td>
	<td width="10%"></td>
    <td align="right" width="5%"><gw:button id="idSearch" img="search" alt="Search" text="Search" onclick="doSearch();" /></td>
    <td align="right" width="5%">
        <gw:button img="select" id="ibtnSelect" text="Select"  alt="Select"  onclick="OnSelect()"/>
    </td>
    <td align="right" width="5%">
        
    </td>
  </tr>

  <tr style="border:1;width:100%;height:95%" valign="top">
	  <td colspan = "9" style="width:100%;height:100%;">
		<gw:grid   
        id="idGrid"  
        header="_PK|Select|Menu ID|Menu Name|Menu URL"   
        format="0|3|0|0|0"  
        aligns="0|0|0|0|0"  
        defaults="||||"  
        editcol="0|0|0|0|0"  
        widths="0|1000|2000|3000|2000"  
        styles="width:100%; height:400"   
        sorting="T"   
        oncelldblclick ="doSelect()" /> 
	</td>
  </tr>
</table>
<gw:textbox id="txtUserPK" style="display: none" />
</body>

</html>
