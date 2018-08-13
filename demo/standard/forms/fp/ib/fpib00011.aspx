<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Task</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_Task_PK          = 0,
    G1_Task_Type        = 1,
    G1_Task_ID          = 2,
    G1_Task_Name        = 3,
    G1_USE_YN           = 4,      
    G1_Machine_Type     = 5,
    G1_Time_Cost        = 6,
    G1_HR_Cost          = 7,
    G1_Description      = 8;
 //---------------------------------------------------------
  
function BodyInit()
{
    System.Translate(document);
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0305' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
    grdTask.SetComboFormat(G1_Machine_Type , data ); 
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0306' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
    grdTask.SetComboFormat(G1_Task_Type, data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0306') FROM DUAL")%>||"; 
    lstTaskType.SetDataText(data);  
    lstTaskType.value = '' ;
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0305') FROM DUAL")%>||"; 
    lstMachineType.SetDataText(data);  
    lstMachineType.value = '' ; 
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";    
    
    grdTask.GetGridControl().ColFormat(G1_Time_Cost) = "###,###,###,###,###.##";       
    //--------
    OnSearch();
    //----------------------------------------      
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{
     data_fpib00011.Call("SELECT");
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
    <gw:data id="data_fpib00011" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpib00011" > 
                <input bind="grdTask" > 
                    <input bind="lstMachineType" />
                    <input bind="lstTaskType" />
                    <input bind="txtTask" />
                    <input bind="lstLang" />					                 
                  </input>
                <output bind="grdTask" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Task Type
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstTaskType" styles="width:100%;" onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Machine Type
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstMachineType" styles="width:100%;" onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Task
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTask" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Lang
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstLang" styles='width:100' onchange="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 3%" align="right">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdTask)" />
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
                <gw:grid id='grdTask' header='_PK|Task Type|Task ID|Task Name|USE|Machine Type|Time Cost|M/P(%)|Description'
                    format='0|0|0|0|3|0|0|0|0' aligns='0|1|0|0|0|0|3|3|0' editcol='0|0|0|0|0|0|0|0|0'
                    widths='1000|1500|2000|3000|800|2000|1200|1200|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnSelect(grdTask)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
</body>
</html>
