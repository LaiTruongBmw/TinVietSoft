<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Guest Name</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
  
//-----------------------------------------------------------

function BodyInit()
{
   var data="";
        data_htfo00040.Call("SELECT");
}

//-----------------------------------------------------------

function OnSearch()
{
    data_htfo00040.Call("SELECT");
}

//-----------------------------------------------------------

function OnSelect()
{
    var code_data=new Array()
	var ctrl = idGrid.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if(ctrl.SelectedRows == 0)
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        var arrTemp=new Array();
		        for(j=0; j < idGrid.cols -1; j++)
	        	{
            		arrTemp[arrTemp.length] = idGrid.GetGridData(rowNo , j );
            		
            	} 
              code_data[index] = arrTemp;
              index ++;
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}
//-----------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------------>
    <gw:data id="data_htfo00040" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="ht_60250020_correct_pop" > 
                  <input bind="idGrid" > 
                    <input bind="dtcheckin" /> 
                    <input bind="txtCode" /> 
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 15%" align="right">
                Date
            </td>
            <td style="width: 30%">
                <gw:datebox id="dtcheckin" lang="1" onchange="OnSearch()" />
            </td>
           
            <td style="width: 15%" align="right">
                Locker#
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtCode" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
            </td>
           
            <td style="width: 10%" align="left">
            </td>
            <td style="width: 8%" align="right">
               
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <!------------------------------------------------------------------------>
        <tr style="height: 99%">
            <td colspan="9">
                <gw:grid id='idGrid'
                    header='_PK|Room#|Guest Name#|CheckIn Date'
                    format='0|0|0|4'
                    aligns='0|1|0|0'
                    defaults='|||'
                    editcol='0|0|0|0'
                    widths='0|1500|1000|1000'
                    sorting='T' autosize="T"
                    styles='width:100%; height:100%'
					oncelldblclick="OnSelect()" />
            </td>
        </tr>
        <!------------------------------------------------------------------------>
    </table>
</body>
</html>
