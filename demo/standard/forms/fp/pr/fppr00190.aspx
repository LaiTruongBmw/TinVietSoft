<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Production Reports</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script type="text/javascript">
    
var G_REPORTS_SETTING_PK = 0,
    G_REPORT_TYPE 		 = 1,
    G_PK 				 = 2,
    G_ID 				 = 3,
    G_NAME 				 = 4,
    G_SEQ 				 = 5,
    G_COL_HEADER 		 = 6;
	
    //============================================================================
    function BodyInit() 
	{
	    System.Translate(document); 
        BindingList();
        OnSearch('grdSearch');
    }
    //============================================================================ 
    function BindingList() 
	{
        var data = "data|10|WORK PROCESS BALANCE|20|LINE COMPONENT BALANCE|21|DAILY SHORTAGE COMPONENT|30|LINE COMPONENT GROUP BALANCE|40|Type 4|50|PREPARATION BALANCE|60|CUT-PRE-HANDLE"
        lstReportType.SetDataText(data);
    }
    //============================================================================    
    function OnPopUp() 
	{
        var col = event.col;
		
        if (lstReportType.GetData() == 10 ) 
		{
            var path = System.RootURL + '/form/fp/ab/fpab00250.aspx';
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

            if (object != null) 
			{
                var arrTemp;

                for (var i = 0; i < object.length; i++) 
				{
                    arrTemp = object[i];
                    grdDetail.AddRow();

                    grdDetail.SetGridText(grdDetail.rows - 1, G_REPORT_TYPE, lstReportType.GetData());
                    grdDetail.SetGridText(grdDetail.rows - 1, G_PK,          arrTemp[0]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_ID, 		 arrTemp[3]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_NAME, 		 arrTemp[4]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_COL_HEADER,  arrTemp[4]);
					
                    grdDetail.SetCellBgColor(grdDetail.rows - 1, 1, grdDetail.rows - 1, grdDetail.cols - 1, 0xCCFFFF);
                }
            }
        }
        else if (lstReportType.GetData() == 20 || lstReportType.GetData() == 21 || lstReportType.GetData() == 50 ) 
		{
            var path = System.RootURL + '/form/fp/dp/fpdp00020.aspx';
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

            if (object != null) 
			{
                var arrTemp;

                for (var i = 0; i < object.length; i++) 
				{
                    arrTemp = object[i];
                    grdDetail.AddRow();

                    grdDetail.SetGridText(grdDetail.rows - 1, G_REPORT_TYPE, lstReportType.GetData());
                    grdDetail.SetGridText(grdDetail.rows - 1, G_PK,          arrTemp[0]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_ID, 		 arrTemp[1]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_NAME,  		 arrTemp[2]);
                    grdDetail.SetGridText(grdDetail.rows - 1, G_COL_HEADER,  arrTemp[2]);
					
                    grdDetail.SetCellBgColor(grdDetail.rows - 1, 1, grdDetail.rows - 1, grdDetail.cols - 1, 0xCCFFFF);
                }
            }
        }
        else if (lstReportType.GetData() == 40 || lstReportType.GetData() == 60) 
		{
            grdDetail.AddRow();
            grdDetail.SetGridText(grdDetail.rows - 1, G_REPORT_TYPE, lstReportType.GetData());
        }

    }
    //============================================================================
    function OnSave() 
	{
        data_fppr00190.Call();
    }
    //============================================================================
    function OnSearch() 
	{
        data_fppr00190.Call('SELECT');
    }
    //============================================================================
    function OnDataReceive(pos) 
	{
        switch (pos.id) 
		{
            case "data_fppr00190":
                if (lstReportType.GetData() == 10) 
				{
                    grdDetail.SetGridText(0, G_ID, "Work Process ID");
                    grdDetail.SetGridText(0, G_NAME, "Work Process Name");
                }
                else if (lstReportType.GetData() == 20) 
				{
                    grdDetail.SetGridText(0, G_ID, "Component ID");
                    grdDetail.SetGridText(0, G_NAME, "Component Name");
                }
                else if (lstReportType.GetData() == 21) 
				{
                    grdDetail.SetGridText(0, G_ID, "Component ID");
                    grdDetail.SetGridText(0, G_NAME, "Component Name");
                }
                else if (lstReportType.GetData() == 30) 
				{
                    grdDetail.SetGridText(0, G_ID, "Compopent ID");
                    grdDetail.SetGridText(0, G_NAME, "Component Name");
                }
                else if (lstReportType.GetData() == 40) 
				{
                    grdDetail.SetGridText(0, G_ID, "ID");
                    grdDetail.SetGridText(0, G_NAME, "Name");
                }
				else if (lstReportType.GetData() == 50) 
				{
                    grdDetail.SetGridText(0, G_ID, "Compopent ID");
                    grdDetail.SetGridText(0, G_NAME, "Component Name");
                }
				
				
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold(1, G_ID, grdDetail.rows - 1, G_ID, true);
                    grdDetail.SetCellBold(1, G_COL_HEADER, grdDetail.rows - 1, G_COL_HEADER, true);
                }
                break;
        }
    }
    //=====================================================================================
    function OnDelete() 
	{
        if (grdDetail.row > 0) 
		{
            if (grdDetail.GetGridData(grdDetail.row, G_REPORTS_SETTING_PK) == "") 
			{
                grdDetail.RemoveRow();
            }
            else 
			{
                if (confirm(" Do you want to mark this row to delete ? ")) 
				{
                    grdDetail.DeleteRow();
                }
            }
        }
    }
    //=====================================================================================
    function OnUnDelete() 
	{
        if (grdDetail.row > 0) 
		{
            grdDetail.UnDeleteRow();
        }
    }
    //=====================================================================================	 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fppr00190" procedure="<%=l_user%>lg_upd_fppr00190"  > 
                <input> 
                    <input bind="lstReportType" /> 
                    <input bind="txtSearch" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap">
                Report Type
            </td>
            <td style="width: 25%">
                <gw:list id="lstReportType" styles="width:100%;" onchange="OnSearch('grdSearch')" />
            </td>
            <td style="width: 5%; white-space: nowrap">
                Search
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdSearch')" />
            </td>
            <td>
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnPopUp()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete1" onclick="OnUnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('grdSearch')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%; height: 100%" colspan="10">
                <gw:grid id='grdDetail' header='_PK|_REPORT_TYPE|_PB_WORK_PROCESS_PK|WP_ID|WP_NAME|Seq|Col Header'
                    format='0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|0' check='|||||-|' editcol='0|0|0|1|1|1|1'
                    widths='0|0|0|2500|3000|1000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
