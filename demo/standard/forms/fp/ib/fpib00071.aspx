<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get Process ( many row )</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_Process_PK          = 0,
    G1_Process_Seq         = 1,
    G1_Process_ID          = 2,
    G1_Process_Name        = 3,
    G1_USE_YN              = 4, 
    G1_Process_Type        = 5, 
    G1_Description         = 6;
 //---------------------------------------------------------
  
function BodyInit()
{
    System.Translate(document);
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0340' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
    grdProcess.SetComboFormat(G1_Process_Type , data ); 
    //--------
    OnSearch();
    //----------------------------------------      
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{
     data_fpib00071.Call("SELECT");
}

//-------------------------------------------------------------

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

//-------------------------------------------------------------
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="data_fpib00071" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpib00071" > 
                  <input bind="grdProcess" > 
                    <input bind="txtProcess" />					                 
                  </input>
                <output bind="grdProcess" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 50%">
                            <gw:textbox id="txtProcess" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 38%" align="right">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Seq|Process ID|Process Name|USE|Process Type|Description'
                    format='0|0|0|0|3|0|0' aligns='0|1|0|0|0|0|0' defaults='||||||' editcol='0|1|1|1|1|1|1'
                    widths='1000|800|2000|3000|800|2000|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnSelect(grdProcess)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
</body>
</html>
