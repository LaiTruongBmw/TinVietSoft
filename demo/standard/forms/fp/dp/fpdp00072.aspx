<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET SPEC</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
var tco_itemgrp_pk = "<%=request.QueryString("tco_itemgrp_pk") %>"  ;

var gID;var gBlnFlag = true;
//-------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
     txtItemGrpPK.text = tco_itemgrp_pk ;
     
     pro_fpdp00071.Call();
}
 //-------------------------------------------------------

 function OnSearch()
 {
    data_fpdp00071.Call('SELECT')
 }
   
//----------------------------popup-------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   var control = oGrid.GetGridControl();
   var rows = control.Rows;
	
	if (control.SelectedRows >0)
	{
		for (i=0; i<control.SelectedRows ; i++)
		{
			var row = control.SelectedRow(i);
			
			var arrTemp=new Array();
         
             for(var j=0;j<oGrid.cols;j++)
             {
                arrTemp[arrTemp.length]= oGrid.GetGridData(row,j);
             }
             
             arr_data[arr_data.length]= arrTemp;
		}
		window.returnValue =  arr_data;
		window.close();
    }
	
	  else
	  {
	    alert("You have not selected data yet.");
	  }
}
//---------------------------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpdp00071" onreceive=""> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpdp00071" > 
                <input>
                    <input bind="txtItemGrpPK" /> 
                </input> 
                <output>
                    <output bind="lstSpecGrp" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00071" onreceive=""> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpdp00071"  > 
			    <input bind="grdSpec" > 
			        <input bind="lstSpecGrp" />	
			        <input bind="txtSpec" />		
			    </input> 
			    <output bind="grdSpec" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap">
                Spec Group
            </td>
            <td style="width: 45%">
                <gw:list id="lstSpecGrp" styles="width:100%" />
            </td>
            <td style="width: 5%; white-space: nowrap">
                Spec</td>
            <td style="width: 43%">
                <gw:textbox id="txtSpec" styles='width:100%' />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSpec)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="6">
                <gw:grid id='grdSpec' header='No|_Spec Grp|_tco_spec_pk|Spec ID|Spec Name|Description'
                    format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' editcol='0|0|0|0|0|0' widths='1000|2000|0|1500|2000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdSpec)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtItemGrpPK" text="" styles="display:none" />
<!---------------------------------------------------------------------->
</html>
