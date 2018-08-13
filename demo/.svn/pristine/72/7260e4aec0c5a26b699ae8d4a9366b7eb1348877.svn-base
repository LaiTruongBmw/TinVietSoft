<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
      System.Translate(document);
      BindingDataList();
	  txtProject_Pk.text = '<%=Request.QueryString("p_project_pk") %>';
	  txtorderwork_Pk.text = '<%=Request.QueryString("p_orderwork_pk") %>';
	  OnSearch();
}

function BindingDataList()
{
	
}

function OnPopUp(obj)
{
    if(Grid_Detail.GetGridData( Grid_Detail.row , 5 ) == '0')
	{
        alert("Cannot select parent value !!" + '\n' + "Please choose another value !!");return false;
    }
    else
  {    
	var code_data=new Array()
	var ctrl = Grid_Detail.GetGridControl();
	code_data[0] = Grid_Detail.GetGridData( ctrl.row , 7 );  // pk
	code_data[1] = Grid_Detail.GetGridData( ctrl.row , 0 );  // code
	code_data[2] = Grid_Detail.GetGridData( ctrl.row , 1 ); //  name
	window.returnValue = code_data; 
	this.close(); 	
	}
}

function OnSearch()
{
	dso_update.Call('SELECT');
}
function OnDataReceive(obj)
{  
    switch(obj.id)
    {
        case "dso_update":
            var i;
            var ctl = Grid_Detail.GetGridControl();
            ctl.OutlineBar = 5;
            var j;
            for(i=1;i<Grid_Detail.rows;i++)
            {   
                j = Find_Heigher_Level(Grid_Detail.GetGridData(i,6),i);
               ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;   
            }
        break;
    }
}  
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( Grid_Detail.GetGridData(row,6) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( Grid_Detail.GetGridData(i,6) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
} 
</script>

<body>
<gw:data id="dso_update" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid"  function="pm_sel_61060010_budget"  > 
            <input bind="Grid_Detail">
                <input bind="txtProject_Pk"/>  
                <input bind="txtBudget"/>  
				<input bind="txtorderwork_Pk"/>  

            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
<table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
	<tr style="height: 2%">
		<td style="width: 100%" align="">
		    <fieldset style="padding:0">
                <table cellpadding="0" cellspacing="0" >
                        <tr>
                            <td align="right" width="10%">Budget&nbsp;</td>
                            <td width="60%"><gw:textbox id="txtBudget" onenterkey="OnSearch()" styles='width:100%' /></td>    
                            <td width="30%"></td>
                        </tr>  
                </table>
		    </fieldset>
		</td>
	</tr>
	<tr style="height: 98%">
		<td style="width: 100%">
			<gw:grid id="Grid_Detail" 
			header="Code|Name|Account Name|_Cagetory|Use Y/N|_leaf|_Level|_PK"
				format="0|0|0|0|0|0|0|0" 
				aligns="0|0|0|0|1|0|0|0"
				defaults="|||||||" 
				editcol="0|0|0|0|0|0|0|0" 
				widths="2000|3500|3500|0|400|0|0|0"
				styles="width:100%; height:100%" 
				sorting="T" 
				oncelldblclick="OnPopUp()" />
		</td>
	</tr>
</table>
</body>
</html>

<gw:textbox id="txtProject_Pk" styles='display:none' />
<gw:textbox id="txtorderwork_Pk" styles='display:none' />