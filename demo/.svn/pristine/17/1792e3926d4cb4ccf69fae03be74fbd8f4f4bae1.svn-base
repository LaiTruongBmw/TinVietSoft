<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>1.0.13 Report Form Design </title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    OnClick_Auto();
}
//========================================================================================================
function BindingDataList()
{ 
    var ls_data     = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    //var ls_data2    = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0020','','') FROM DUAL")%>";
    var ls_data3    = "<%=ESysLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>";
    data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0048') FROM DUAL")%>";
	 lstReportType.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0050') FROM DUAL")%>";
	lstCBType.SetDataText(data); 
    var ls_print = "Data|Y|Auto|N|Manual"; 
    rbAUTO_YN.SetDataText(ls_print);
    lstCompany.SetDataText(ls_data);
    //lstFormtype.SetDataText(ls_data2);
    lstLevel.SetDataText(ls_data3);
    btGenAuto.style.display = 'none';
    <%=ESysLib.SetGridColumnComboFormat("grGrid",4,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0047' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
    //Level
	<%=ESysLib.SetGridColumnComboFormat("grGrid", 14,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
	//color
    <%=ESysLib.SetGridColumnComboFormat("grGrid",10,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0240' AND A.USE_IF = 1 ORDER BY A.CODE_NM")%>;
    //font style
    <%=ESysLib.SetGridColumnComboFormat("grGrid",11,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0270' AND A.USE_IF = 1")%>;
    //Formula
    <%=ESysLib.SetGridColumnComboFormat("grGrid",12,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0049' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
    //Operator
    <%=ESysLib.SetGridColumnComboFormat("GridRight",0,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK032' and a.del_if = 0 and b.del_if = 0")%>;
	//Contract Formula
    <%=ESysLib.SetGridColumnComboFormat("grGrid",16,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0049' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
    
	
}
//========================================================================================================
function OnPopUp(pos) 
{
    switch (pos) 
        {
            case 'project':
                var path = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
                var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
                if (obj != null) 
                {
                    txtProject_Pk.text = obj[0];
                    txtProject_Cd.text = obj[1];
                    txtProject_Nm.text = obj[2];
                }
                break;
                case 'Work_Division':
                    var fpath = System.RootURL + "/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=" + txtProject_Pk.text;
                    var aValue = System.OpenModal(fpath, 700, 600, 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;');
                    if (aValue != null) 
                    {
                        txtLevel_Pk.text = aValue[2];
                        txtLevel_Cd.text = aValue[0];
                        txtLevel_Nm.text = aValue[1];
                    }
                break;
            case 'Level':
                var path = System.RootURL + '/form/gf/ka/gfka00010_popup.aspx?com_pk=' + lstCompany.GetData();
                var o = System.OpenModal(path, 800, 300, 'resizable:yes;status:yes');
                if (o != null) 
                {
                    if (o[0] != 0) 
                    {
                        //idcause.SetDataText(o[0]);
                        //idData_Dso_TrApprCancell.Call("SELECT");
                    }
                }
            break;
            case 'Entry_Level':
                var path = System.RootURL + '/form/61/01/61010130_popup.aspx?com_pk='+ lstCompany.GetData();
	            var o = System.OpenModal( path , 800 , 300 , 'resizable:yes;status:yes');
            break;
            case 'Report_Type':
                var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0048';
				var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					if (object != null )
					{
						lstReportType.SetDataText(object[1]);
					}

            break;
        }
}
//========================================================================================================
function OnClick_Auto()
{
    if (rbAUTO_YN.GetData() == 'Y')
    {
        btGenAuto.style.display = '';	
    }
    else
    {
        btGenAuto.style.display = 'none';	
    }
}
//========================================================================================================
function OnToggle(pos) 
{
        var left = document.all("t-left");
        var right = document.all("t-right");
        var imgArrow1 = document.all("imgArrow1");
        var imgArrow2 = document.all("imgArrow2");

        if (pos == '1') 
        {
            if (imgArrow1.status == "expand" && imgArrow2.status == "expand") 
            {
                left.style.display = "none";
                right.style.display = "";

                right.style.width = "100%";

                imgArrow1.status = "collapse";
                imgArrow2.status = "expand";

                imgArrow1.style.display = "none";
                imgArrow2.style.display = "";
            }
            else if (imgArrow1.status == "expand" && imgArrow2.status == "collapse") 
            {
                left.style.display = "";
                right.style.display = "";

                left.style.width = "70%";
                right.style.width = "70%";

                imgArrow1.status = "expand";
                imgArrow2.status = "expand";

                imgArrow1.style.display = "";
                imgArrow2.style.display = "";
            }
        }
        else 
        {
            if (imgArrow1.status == "expand" && imgArrow2.status == "expand") 
            {
                left.style.width = "100%";

                right.style.display = "";
                right.style.display = "none";

                imgArrow1.status = "expand";
                imgArrow2.status = "collapse";

                imgArrow1.style.display = "";
                imgArrow2.style.display = "none";
            }
            else if (imgArrow1.status == "collapse" && imgArrow2.status == "expand") 
            {
                left.style.display = "";
                right.style.display = "";

                left.style.width = "70%";
                right.style.width = "70%";

                imgArrow1.status = "expand";
                imgArrow2.status = "expand";

                imgArrow1.style.display = "";
                imgArrow2.style.display = "";
            }
        }
}   
//========================================================================================================
function OnNew(obj)
{
    switch(obj)
    {
        case 'Master':
            if(txtProject_Pk.text != '')
            {
                grGrid.AddRow();
                grGrid.SetGridText(grGrid.rows-1,1,txtProject_Pk.text);
                grGrid.SetGridText(grGrid.rows-1,3,lstReportType.value);
                grGrid.SetGridText(grGrid.rows-1,15,lstCompany.value);
            }
            else
            {
                alert('Please select Project !!');
            }
        break;
        case 'Detail':
            if(txtMaster_Pk.text != '')
            {
                    var fpath   = System.RootURL + "/form/61/01/61010130_popup_detail.aspx?Master_pk=" + txtMaster_Pk.GetData() + "&company_pk=" + lstCompany.value + '&type=' + grGrid.GetGridData(grGrid.row,12) + '&report_type=' + lstReportType.GetData() + '&project_pk=' + txtProject_Pk.GetData() ;	
						fpath = fpath + '&contract_fomula=' + grGrid.GetGridData(grGrid.row,16) + '&cb_type=' + lstCBType.GetData() ;
						//alert(fpath);
                    aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	   
				
	                if ( aValue != null ) 
	                {
                        var tmp = new Array();
                        tmp = aValue[0];
                        txtLevel.text = tmp[5];  
	                    if(!CheckDuplicateDetail())
                        {                                       
                            return;
                        }
                        else
                        {                
                            GridRight.AddRow();
                            GridRight.SetGridText(GridRight.rows - 1,0,"+");
                            GridRight.SetGridText(GridRight.rows - 1, 3, tmp[5]);    //Level pk
                            GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Level Code
                            GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Level Name
                            GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_Pk.text);  
                            GridRight.SetGridText( GridRight.rows - 1, 6, txtFormula.text);
							GridRight.SetGridText( GridRight.rows - 1, 7, tmp[6]);   
							GridRight.SetGridText( GridRight.rows - 1, 8, lstCBType.GetData());  
                            if (aValue.length > 1)
	                        {
                                for(var i=1; i<aValue.length; i++)
                                {
                                    var tmp = new Array();
                                    tmp = aValue[i];
                                   
									GridRight.AddRow();
									GridRight.SetGridText(GridRight.rows - 1, 0, "+");    //ACPK
									GridRight.SetGridText(GridRight.rows - 1, 3, tmp[5]); 
									GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
									GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
									GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_Pk.text);  
									GridRight.SetGridText( GridRight.rows - 1, 6, txtFormula.text);   
									GridRight.SetGridText( GridRight.rows - 1, 7, tmp[6]);   
                                    GridRight.SetGridText( GridRight.rows - 1, 8, lstCBType.GetData());  
                                }
	                        }
	                    }
        	        }
            }
            else
            {
                alert('Please select a row master !!');
            }
        break;
        case 'Dblclick_AddNew':
            if(grGrid.GetGridData(grGrid.row,4)== 'L')
            {
                if(grGrid.col=='6' || grGrid.col=='7' || grGrid.col=='8' || grGrid.col=='9')
                {
                    var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
				    var aValue = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');
					 if(aValue != null)
					 {
		                txtLevel.text = aValue[2]; 
		                if(!CheckDuplicateLevel())
		                {                                       
		                    return;
		                } 
		                else
		                {
							grGrid.SetGridText(grGrid.row, 14, aValue[3]);  //level
							grGrid.SetGridText(grGrid.row, 6, aValue[0]); //code
							grGrid.SetGridText(grGrid.row, 7, aValue[1]); //name
                            grGrid.SetGridText(grGrid.row, 8, aValue[4]); //local
							grGrid.SetGridText(grGrid.row, 9, aValue[5]); //foreign
							grGrid.SetGridText(grGrid.row, 2, aValue[2]); //pk
						}  
					 }
                }
            }
        break;
    }
}
//========================================================================================================
function CheckDuplicateLevel()
{
    for(var i = 1; i < grGrid.rows; i++)
    {
       /* if(grGrid.GetGridData(i, 2) == txtLevel.text)
        {
             alert("Duplicated Level Code!! ");
             return false ;
        }*/
    }
    return true;
}
//========================================================================================================
function onBatchEntry()
{
    if(txtProject_Pk.text != '')
    {
        dso_batch_entry.Call("SELECT");
    }
    else
    {
        alert('Please select Project !!');
    }
}
//========================================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'dso_batch_entry_detail':
            var ctrl 	= GridRight.GetGridControl();
	        var rownum 	= ctrl.Rows;
            for (i = 1; i < rownum; i++)
            {
                GridRight.SetRowStatus(i, 0x20);
            }
        break;

    }
}
//========================================================================================================
function onSetStatus()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= ctrl.Rows;
    for (i = 1; i < rownum; i++)
    {
        grGrid.SetRowStatus(i, 0x20);
    }
    ChangeColor();
}
//========================================================================================================
function ChangeColor()
{
    var ctrl = grGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grGrid.GetGridData(i,11)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 16) = false;
	        grGrid.SetCellBold(i, 1, i, 16, true);
        }
        else if (grGrid.GetGridData(i,11)== "I")
        {
	        grGrid.SetCellBold(i, 1, i, 16, false);
	        ctrl.Cell(14, i, 1, i, 16) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 16) = false;
	        grGrid.SetCellBold(i, 1, i, 16, false);
	    }
	    grGrid.SetCellBgColor(i, 0, i, 16, Number(grGrid.GetGridData(i, 10)));
	}
}
//========================================================================================================
function OnSave(obj)
{
    switch(obj)
    {
        case 'Master':
            dso_master.Call();
        break;
        case 'Detail':
            dso_detail.Call();
        break;
    }
}
//========================================================================================================
function OnDelete(obj)
{
    switch(obj)
    {
        case 'Master':
            if(confirm('Are you sure you wanna delete?'))
            {
                grGrid.DeleteRow();
                dso_master.Call();
            }
        break;
        case 'Detail':
            if(confirm('Are you sure you wanna delete ?'))
            {
                GridRight.DeleteRow();
                dso_detail.Call();
            }
        break;
    }
}
//========================================================================================================
function OnSearch(obj)
{
    switch(obj)
    {
        case 'Master':
            if(txtProject_Pk.text != '')
            {
                dso_master.Call('SELECT');
            }
            else
            {
                alert('Please select Project !!');
            }
        break;
		case 'Detail':
			dso_detail.Call('SELECT');
		break;
    }
}
//========================================================================================================
function OnSelect()
{
    if (lstReportType.GetData() == '01' )
	{
	   txtFormula_contract.text = grGrid.GetGridData(grGrid.row,15);
	   txtMaster_Pk.text = grGrid.GetGridData(grGrid.row,0);
	   txtFormula.text = grGrid.GetGridData(grGrid.row,12);
	   if (grGrid.GetGridData(grGrid.row,0)!= '')
	   {
		   dso_detail.Call('SELECT');
	   }
	  
	}else {
		txtMaster_Pk.text = grGrid.GetGridData(grGrid.row,0);
		txtFormula.text = grGrid.GetGridData(grGrid.row,12);
		 if (grGrid.GetGridData(grGrid.row,0)!= '')
	    {
		    dso_detail.Call('SELECT');
	    }
	}
} 
//========================================================================================================
function CheckDuplicateDetail()
{
    for(var i = 1; i < GridRight.rows; i++)
    {
       /* if(GridRight.GetGridData(i, 3) == txtLevel.text)
        {
            alert("Duplicated Level Code!! ");
             return false ;
        }*/
    }
    return true;
}
//========================================================================================================
function Gen_Auto()
{
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 0)
	{
	    for (i = 1; i <= rows; i++)
	    {
	        grGrid.SetGridText( i , 5, i);
	    }
	}
}
//========================================================================================================
function UpClick()
{
	var lb_flag
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        grGrid.UpRow();
	}
	else
	{
		alert('  Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển');
	}
}
//========================================================================================================
function DownClick()
{
	var lb_flag
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        grGrid.DownRow();
	}
	else
	{
		alert('  Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển');
	}
}
//========================================================================================================
function OnBatchEntry_Detail()
{
    if(grGrid.GetGridData(grGrid.rows-1, 0) != '' && grGrid.GetGridData(grGrid.rows-1, 0) != '_PK')
    {
        dso_batch_entry_detail.Call('SELECT');
    }
    else
    {
        alert('Please Batch Entry for Master and save data first !!');
    }
}

function OnSelectAcc()
{
    if (GridRight.col=="1" || GridRight.col=="2")
    {
        var fpath   = System.RootURL + "/form/kp/ac/kpac1013_popup_detail_1.aspx?company_pk="+lstCompany.value + '&Master_pk=' + txtMaster_Pk.text + '&type=' + GridRight.GetGridData(GridRight.row, 6) + '&Project_pk=' + GridRight.GetGridData(GridRight.row, 9) + '&Report_Type=' + lstReportType.value;	    
		       
        aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	
        if ( aValue != null ) 
        {
            GridRight.SetGridText(GridRight.row, 3, aValue[3]);    //ACPK
            GridRight.SetGridText(GridRight.row, 1, aValue[1]);    //Account Code
            GridRight.SetGridText(GridRight.row, 2, aValue[2]);    //Account Name
        } 
    }  
}

function OnReport()
{
    if(grGrid.rows>1)
    {
        var url = System.RootURL + "/reports/61/01/61010130.aspx?TCO_COMPANY_PK=" + lstCompany.value + '&TECPS_PROJECTSUMM_PK=' + txtProject_Pk.text + '&TECPS_UNDERTAKELEVELCODE_PK=' + txtLevel_Pk.text + '&REPORT_TYPE=' + lstReportType.value;
        System.OpenTargetPage(url);
    }
    else
    {
        alert('There is not data !!');
    }
}
</script>
<body>
<gw:data id="dso_batch_entry" onreceive="onSetStatus()">
        <xml>
            <dso type="grid" function="pm_sel_61010130_batch_entry" >
                <input bind="grGrid">
                    <input bind="lstCompany"/>
                    <input bind="txtProject_Pk"/>
                    <input bind="lstReportType"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_batch_entry_detail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="pm_sel_61010130_batchentry_dt" >
                <input bind="GridRight">
                    <input bind="txtMaster_Pk"/>
                    <input bind="txtFormula"/>
                </input>
                <output bind="GridRight"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_master" onreceive="ChangeColor()">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="pm_sel_61010130" procedure="pm_upd_61010130">
                <input bind="grGrid">
                    <input bind="lstCompany"/>
                    <input bind="txtProject_Pk"/>
                    <input bind="txtLevel_Pk"/>
                    <input bind="lstReportType"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_detail" onreceive="">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="pm_sel_61010130_dt" procedure="pm_upd_61010130_dt">
                <input bind="GridRight">
                    <input bind="txtMaster_Pk"/>
					 <input bind="lstCBType"/>
					 <input bind="lstReportType"/>
                </input>
                <output bind="GridRight"/>
            </dso>
        </xml>
    </gw:data>
<table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 70%; height: 100%" id="t-left">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%" >
                                    <tr>
                                        <td align="right" width="20%">Company&nbsp;</td>
                                        <td width="80%"><gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%'></gw:list></td>
                                        <td width="">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td><gw:icon id="btnSearch" img="in" text="Batch Entry" onclick="onBatchEntry()" /></td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('Master')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnNew" img="new" alt="New" onclick="OnNew('Master')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('Master')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnReport" img="excel" alt="Print" onclick="OnReport()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height:">
                                        <td width="" align="right"><a title="Click here to select Project" style="text-decoration:none" onclick="OnPopUp('project')" href="#">Project&nbsp;</a></td>
                                        <td width="">
                                            <table style="width: 100%" border=0 cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="40%"><gw:textbox id="txtProject_Cd" styles='width:100%'  /></td>
                                                    <td width="60%"><gw:textbox id="txtProject_Nm" styles='width:100%' /></td>
                                                    <td width="" style="display:none"><gw:textbox id="txtProject_Pk" styles='width:100%' /></td>
                                                    <td width="" align="left"><gw:imgbtn img="reset" id="idResetTr" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                         <td width="">
                                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="50%" align="right">Print Seq &nbsp;</td>
                                                    <td width="50%"><gw:list id="rbAUTO_YN" value="N" onchange="OnClick_Auto()" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="16%"><a title="Click here to show Level Code" href="#" style="text-decoration : none" onClick="OnPopUp('Work_Division')">Level Code</a></td>    
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40%"><gw:textbox id="txtLevel_Cd" readonly="true" styles='width:100%' /></td>
                                                    <td width="60%"><gw:textbox id="txtLevel_Nm" readonly="true" styles='width:100%' /></td>
                                                    <td width=""><gw:textbox id="txtLevel_Pk" styles='width:100%;display:none' /></td>
                                                    <td ><gw:imgbtn id="btvge2" img="reset" alt="Reset"  onclick="txtLevel_Cd.text='';txtLevel_Nm.text='';txtLevel_Pk.text='';" /></td>
                                                    
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%"><gw:imgbtn img="auto" id="btGenAuto" alt="Gen Auto" onclick="Gen_Auto()" /></td>
                                                    
                                                    <td width="10%"> </td>
                                                    <td width="30%" align="right"><a title="Click here to show Level" href="#" style="text-decoration : none" onClick="OnPopUp('Entry_Level')">Level&nbsp;</a></td>
                                                    <td width="50%"><gw:list id="lstLevel" onchange="OnChangeLevel()" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="" align="right"><a title="Click here to show Report Type" href="#" style="text-decoration : none" onClick="OnPopUp('Report_Type')">Report Type </a></td>
                                        <td width=""><gw:list id="lstReportType" styles='width:100%'></gw:list></td>
                                        <td width="">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><gw:icon id="btnSearch" img="in" text="Batch Entry for Detail" onclick="OnBatchEntry_Detail()" /></td>
                                                     <td width="10%"><gw:imgbtn img="up" id="btnUp_Dr" alt="Up" onclick="UpClick()" /></td>
                                                     <td width="10%"><gw:imgbtn img="down" id="btnDown_Dr" alt="Down" onclick="DownClick()" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 70%" id="Td1">
                        <!--header="0._PK|1._Pj_pk|2._Level_pk|3._Report Type|4.Type|5.Print Seq|6.Level Code|7.Name|8.Local Name|9.Korean Name|10.Corlor|11.Font Style|12.Formula|13.Print Y/N|14.Level"-->
                            <gw:grid id="grGrid" 
                                header="_PK|_Pj_pk|_Level_pk|_Report Type|Type|Print Seq|Level Code|Name|Local Name|Korean Name|Color|Font Style|Formula|Print Y/N|Level|_company_pk|Contract fomula"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0" 
                                aligns="0|0|0|1|1|1|0|0|0|0|1|1|1|1|1|0|0"
                                defaults="||||E||||||0XFFFFFF|R||-1|||" 
                               editcol="0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|0|0"
                                acceptnulldate="T" 
                                widths="0|0|0|0|1500|1000|2000|3000|3000|3000|1500|1500|1500|900|800|0|1500"
                                styles="width:100%; height:100%" 
                                sorting="T" 
                                oncelldblclick="OnNew('Dblclick_AddNew')" 
                                onselchange=""
                                oncellclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 2%; white-space: nowrap;background:#BDE9FF" align="center">
                <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('1')" />
                <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('2')" />
            </td>
            <td style="width: 28%" id="t-right">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                
                                    <td width="100%">
                                        <fieldset>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                <td width="25%"> Type</td>
												<td width="35%"><gw:list id="lstCBType" styles='width:100%' /></td>
												
												 <td width="25%"> </td>
												 <td width="5%">
                                                        <gw:imgbtn id="ibtnsearchd" img="search" alt="Search" onclick="OnSearch('Detail')" />
                                                    </td>
                                                    <td width="5%">
                                                        <gw:imgbtn id="ibtnNew1" img="new" alt="New" onclick="OnNew('Detail')" />
                                                    </td>
                                                    <td width="5%">
                                                        <gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('Detail')" />
                                                    </td>
                                                    <td width="5%">
                                                        <gw:imgbtn id="ibtnDelete1" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 28%" id="Td2">
                            <gw:grid id="GridRight" 
                                header='Operator|Level Code|Level Name|_Level_pk|_Master_pk|_pk|_formula|_master_pk1|cbtype|_project_pk'
                                format='0|0|0|0|0|0|0|0|0|0' 
                                aligns='1|0|0|0|0|0|0|0|0|0' 
                                defaults='|||||||||' 
                                editcol='0|0|0|0|0|0|0|0|0|0'
                                widths='900|1500|3000|0|0|0|0|0|0|0' 
                                sorting='T' 
                                styles='width:100%; height:100%'
                                oncelldblclick="OnSelectAcc()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

<gw:textbox id="txtLevel" readonly="true" styles='width:100%;display:none' />
<gw:textbox id="txtMaster_Pk" readonly="true" styles='width:100%;display:none' />
<gw:textbox id="txtFormula" readonly="true" styles='width:100%;display:none' />
<gw:textbox id="txtFormula_contract" readonly="true" styles='width:100%;display:none' />
</body>
</html>
