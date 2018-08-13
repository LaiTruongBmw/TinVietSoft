<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Process Plan Registration</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var project_pk, progplanbase_pk;
var flag_save = false;
var version = '';
var dup = false;
//--------1---------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
    dtContractPeriod_Fr.SetEnable(false);
	dtContractPeriod_To.SetEnable(false);
	lstStatus.SetEnable(false);
 	BindingDataList();

	grdPlan.GetGridControl().FrozenCols = 2;
	//Grid_Inquiry.GetGridControl().FrozenCols = 2;
	InitControl();
	
} 
//--------2-------------------------------------------------------------
function BindingDataList()
{
	var l_daga = "DATA|1|Saved|2|Confirmed|3|Cancelled";
	lstStatus.SetDataText(l_daga);

	<%=ESysLib.SetGridColumnComboFormat("grdPlan", 4 ,"SELECT A.UOM_CODE, DECODE(NVL(A.CNV_RATIO,1),1,'',TO_CHAR(NVL(A.CNV_RATIO,1),'9,990'))|| ' ' || A.UOM_NM  FROM TCO_UOM A WHERE DEL_IF=0")%>; 
}

//--------3--------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
		case 'Project':
			var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtProjectPk.text	= aValue[0];
				txtProject_Cd.text	= aValue[1];
				txtProject_Nm.text	= aValue[2];  
				project_pk			= txtProjectPk.text;
				dso_Date.Call();
			}
		break;
		case 'ProjectS':
			var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtProjectPkS.text = aValue[0];
				txtProject_CdS.text = aValue[1];
				txtProject_NmS.text = aValue[2];
				dso_schedule_no.Call("SELECT");
			}
		break;
	}
}
//------4-----------------------------------------------------------------------
function InitControl()
{
	switch (lstStatus.value)
	{
		case '1': // save
			btSave.SetEnable(true);
			btCancel.SetEnable(false);
			btConfirm.SetEnable(true);
			btIncrease.SetEnable(true);
			btDelete.SetEnable(true);
			//btDown.SetEnable(true);
		break;  
		case '3':
			btSave.SetEnable(false);
			btCancel.SetEnable(false);
			btConfirm.SetEnable(false);
			btIncrease.SetEnable(false);
			btDelete.SetEnable(false);
			//btDown.SetEnable(false);
		break;
		case '2': // confirm
			btSave.SetEnable(false);			
			btCancel.SetEnable(true);
			btConfirm.SetEnable(false);
			btIncrease.SetEnable(true);
			btDelete.SetEnable(false);
			//btDown.SetEnable(false);
		break;
	}
}
//-------5-------------------------------------------------------------
function OnChangeList()
{
	InitControl();
}
//-------6-------------------------------------------------------------
function frm_Onlick(obj)
{
    switch(obj.id)
	{
        case 'btIncrease':
			//dso_Increase.StatusInsert();
			txtProjectPk.text = project_pk;
			dso_Increase.Call();	
        break;
		case 'btnRefPrj':
			if (txtProjectPk.text == '')
			{
				alert('Please select Project !!');
				return;
			}

            var fpath	= System.RootURL + "/form/61/07/61070010_item_ref.aspx";
            var aValue  = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;');
			
			if (aValue != null)
			{
				txtProjectRefPk.text = aValue;
				dso_RefGetItems.Call('SELECT');
			}
			
		break;
        case 'btnew':
			if (txtProjectPk.text == '')
			{
				alert('Please select Project !!');
				return;
			}

            var fpath	= System.RootURL + "/form/61/07/61070010_P_getnewItem.aspx?p_project_pk=" + txtProjectPk.text + '&project_cd=' + txtProject_Cd.text + '&project_nm=' + txtProject_Nm.text + '&p_version=' + lstVersion.GetData();
            var aValue = System.OpenModal( fpath , 800 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			
			//dso_GetItems.Call('SELECT');
			dso_511_1.Call();

		break;
		
		case 'btSave':
			dso_grdPlan.Call();
		break;
		case 'btConfirm':
		  if (confirm('Do you want to confirm the selected revision?'))
		  {
			txtStatus.text ='confirmed';
			dso_511_confirm_cancel.Call();
		  }
			
		break;
		case 'btCancel':
		  if (confirm('Do you want to cancel the selected revision?'))
		  {
			txtStatus.text ='cancelled';
			dso_511_confirm_cancel.Call();
		  }
			
		break;
		case 'btSearch':
			if (txtProjectPk.text == '')
			{
				alert('Please select Project !!');
				return;
			}
			dso_grdPlan.Call('SELECT');
		break;
		case 'btDown':
			if (txtProjectPk.text == '')
			{
				alert('Please select Project !!');
				return;
			}
			
			var url =System.RootURL + '/reports/61/07/61070010.aspx?p_project_pk=' + txt_progplanbase_pk.text + "&p_version=" + lstVersion.value + "&p_from=" + dtContractTarget_Fr.value +"&p_to=" + dtContractTarget_To.value;
			System.OpenTargetPage(url , 'newform');
		break;
		case 'btDelete':

		    var ctrl 	= grdPlan.GetGridControl();
	        var rownum  = ctrl.Rows - 1;
	        if (ctrl.Row < 0) 
	        {
	            if (rownum > 0)
	            {
	                alert('Please select item for delete.'+'\n'+'Yêu cầu lựa chọn hạng mục để xóa');
	                return;
	            }
	        }
	        else
	        {
	            if (confirm('Dou you want to delete selected item(s)?'+'\n'+'  Bạn có chắc muốn xóa hạng mục đang chọn'))
	            {
	                for (i=1; i < ctrl.Rows; i++ )
	                {
                        if (ctrl.isSelected(i) == true)
                        {
                            if(grdPlan.GetGridData(i, 0) == "")
	                        {
			                    grdPlan.RemoveRowAt(i);
			                    i = i - 1;
		                    }
		                    else
		                    {
						        grdPlan.DeleteRow();
						        dso_grdPlan.Call();
		                    }
		                }
                    }
                }
	        }

		break;

    }
}

//------8--------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
	{
		case 'dso_year':
		 dso_schedule_no.Call();
        break;
		case 'dso_511_status':
		  InitControl();
        break;
		case 'dso_511_confirm_cancel':
		 InitControl();
        break;
		case "dso_Date":
			txtProjectPk.text = project_pk;
			btSave.SetEnable(true);
			btConfirm.SetEnable(true);
			btCancel.SetEnable(true);
			btIncrease.SetEnable(true);
			btDelete.SetEnable(false);
			btnRefPrj.SetEnable(true); 
			btRegisItem.SetEnable(true);
			dso_schedule_no.Call("SELECT");
			
			return;
			if (txtProjectPk.text == '')
			{
				alert('Please, input 2.2.1[Adjustment Serial No. Registration]');
				txt_progplanbase_pk.text = '';
				btSave.SetEnable(false);
				btConfirm.SetEnable(false);
				btCancel.SetEnable(false);
				btIncrease.SetEnable(false);
				btDelete.SetEnable(false);
				btnRefPrj.SetEnable(false); 
				btRegisItem.SetEnable(false);
				lstVersion.ClearData();
				
				for (row = grdPlan.rows - 1; row >= 2; row--)
				{
					grdPlan.RemoveRowAt(row);
				}
			}
			else
			{
				btSave.SetEnable(true);
				btConfirm.SetEnable(true);
				btCancel.SetEnable(true);
				btIncrease.SetEnable(true);
				btDelete.SetEnable(false);
				btnRefPrj.SetEnable(true); 
				btRegisItem.SetEnable(true);
				dso_schedule_no.Call("SELECT");
		
			}
        break;
        case "dso_schedule_no":
			onChangeyear();
        break;
		
		case 'dso_status':
			lstStatus.SetDataText(txtStatus.text);			
			InitControl();

			if (flag_save == true)
			{
				if (progplanbase_pk != '')
				{					
					if (grdPlan.rows > 2)
					{
						for (row = 2; row < grdPlan.rows; row++)
						{
							grdPlan.SetGridText(row, PLAN_TECPS_PROGPLANBASE_PK, progplanbase_pk);
							grdPlan.SetGridText(row, PLAN_CHANGESEQ, lstVersion.GetData());
						}
						
					dso_grdPlan.Call();
					}
				}
			}
			else
			{
				dso_grdPlan.Call("SELECT");
			}
		break;
		case 'dso_grdPlan':
			//flag_save = false;
			//MergeHeaderRegister();
			//SetColor();
		break;
		case 'dso_GetItems':
		case 'dso_RefGetItems':
			for (i = 1; i < grdItems.rows; i++)
			{
				dup = false;

				for (row = 2; row < grdPlan.rows; row++)
				{
					if (grdItems.GetGridData(i, IT_PK) == grdPlan.GetGridData(row, PLAN_TECPS_PROPLAN_ITEM_PK))
					{
						dup = true;
						break;
					}
				}

				if (dup == false)
				{
					grdPlan.AddRow();
					for (col = PLAN_WEIGHT; col <= PLAN_TRIBUTION; col++ )
					{
						grdPlan.SetGridText(grdPlan.rows-1, col, 0);
					}
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_TECPS_PROGPLANBASE_PK, txt_progplanbase_pk.text);
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_CHANGESEQ, lstVersion.value);

					grdPlan.SetGridText(grdPlan.rows-1, PLAN_LARGE_DIV, grdItems.GetGridData(i, IT_LARGE_DIV));
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_DTL_ITEM,	grdItems.GetGridData(i, IT_DTL_ITEM));
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_PROPLAN_CD, grdItems.GetGridData(i, IT_CODE));
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_LEVEL, grdItems.GetGridData(i, IT_LEVEL));
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_TECPS_PROPLAN_ITEM_PK, grdItems.GetGridData(i, IT_PK));
					grdPlan.SetGridText(grdPlan.rows-1, PLAN_TECPS_PROJECTSUMM_PK, grdItems.GetGridData(i, IT_PROJECT_PK));
				}
			}

			MergeHeaderRegister();			
			SetColor();

			var month1, date1, year1;
			var month2, date2, year2;
			for (row = 2; row < grdPlan.rows; row++ )
			{
				if (grdPlan.GetGridData(row, PLAN_TECPS_PROGPLANBASE_PK) == '')
				{
					grdPlan.SetCellBgColor(row, 0, row, grdPlan.cols-1, 0x6699CC);
				}

				month1 = '1';
				month2 = '1';

				date1 = dtContractTarget_Fr.value;
				year1 = date1.substring(0,4);
				for (col_mm_1 = JAN+1; col_mm_1 <= PK_DEC; col_mm_1+=3 )
				{
					month1 = padLeft(month1, 2);
					grdPlan.SetGridText(row, col_mm_1, year1 + ''+ month1);

					month1 = Number(month1);
					month1++;
				}

				date2 = dtContractTarget_To.value;
				year2 = date2.substring(0,4);
				for (col_mm_2 = JAN2+1; col_mm_2 <= PK_DEC2; col_mm_2+=3 )
				{
					month2 = padLeft(month2, 2);
					grdPlan.SetGridText(row, col_mm_2, year2 + ''+ month2);

					month2 = Number(month2);
					month2++;
				}
			}
		break;
		case 'dso_MST':		
			project_pk = txtProjectPk.text;
			progplanbase_pk = txt_progplanbase_pk.text;
			dso_Date.Call("SELECT");
		break;
		case 'dso_Increase':
			dso_schedule_no.Call("SELECT");			
		break;
    }
}
//----------9--------------------------------------------------------------------------
function SetColor()
{
	for (row = 2; row < grdPlan.rows; row++ )
	{
		grdPlan.SetCellBgColor(row, PLAN_LARGE_DIV, row, PLAN_DTL_ITEM, 0xEDEDED);
		grdPlan.SetCellBgColor(row, PLAN_WEIGHT,	row, PLAN_WEIGHT, 0xEDEDED);
		grdPlan.SetCellBgColor(row, PLAN_RESULT,	row, PLAN_TRIBUTION, 0xEDEDED);
	}
}
//---------10--------------------------------------------------------------------------------
function OnChangeData()
{
	var ym1 = dtContractTarget_Fr.value.substring(0,6);
	var ym2 = dtContractTarget_To.value.substring(0,6);

	if (ym2 - ym1 < 0) return;

	MergeHeaderRegister();
}
//--------11-------------------------------------------------------------------------------------
function AfterEdit()
{
	if (grdPlan.col > PLAN_UNIT)
	{
		if (isNaN(grdPlan.GetGridData(grdPlan.row, grdPlan.col)))
		{
			grdPlan.SetGridText(grdPlan.row, grdPlan.col, 0);
		}
		else
		{
			if (grdPlan.GetGridData(grdPlan.row, grdPlan.col) < 0)
			{
				grdPlan.SetGridText(grdPlan.row, grdPlan.col, 0);
			}
		}

		// Weight Factory
		var total_plan = 0, percent = 0;
		for (row = 2; row < grdPlan.rows; row++)
		{
			total_plan += Number(grdPlan.GetGridData(row, PLAN_TOTAL));
		}
		
		if (total_plan == 0) return;

		percent = 100 / total_plan;	
		for (i = 2; i < grdPlan.rows; i++)
		{
			grdPlan.SetGridText(i, PLAN_WEIGHT, percent * grdPlan.GetGridData(i, PLAN_TOTAL));
		}

		// Distribution
		var total = 0;
		for (col = JAN; col <= DEC2; col+=3 )
		{
			total += Number(grdPlan.GetGridData(grdPlan.row, col));
		}
			
		grdPlan.SetGridText(grdPlan.row, PLAN_TRIBUTION, Number(grdPlan.GetGridData(grdPlan.row, PLAN_TOTAL)) - total);
	}
}
//------12------------------------------------------------------------------------
function OnToggle()
{
	var left  = document.all("left");    
    var right = document.all("right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}
//--------13--------------------------------------------------------------
function OnChangeVer()
{
	if (lstVersion.GetData() != '')
		dso_511_status.Call();		
}
//-------14------------------------------------------------------------------
function padLeft(n, d) 
{
	return Array(Math.max(0, d - (n + '').length + 1)).join(0) + n;
}
//-------15----------------------------------------------------------------------
function OnUpload()
{
	alert('Not yet.');
	return;
	if (txtProjectPk.text == '')
	{
		alert('Please select Project !!');
		return;
	}

	var fl = document.getElementById("idtext").value; 
	var excel = new ActiveXObject("Excel.Application");
	var excel_file  = excel.Workbooks.Open(fl);
	
	var excel_sheet = excel.Worksheets("Sheet1");
	var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count;
	var lrow, lcol, data

	var data;
	var i = 0;

	for (lrow = 3; lrow <= maxRow ; lrow++) 
	{
		for (lcol = 8; lcol <= 31; lcol++)
		{
			i = lcol;
			data = excel_sheet.Cells(lrow, lcol).Value;
			if (excel_sheet.ProtectContents == true)
			{
				excel_sheet.UnProtect("");
			}
			excel_sheet.Cells.Locked = false;
			excel_sheet.Cells.FormulaHidden = false;

			if (data == undefined)
				data = '';
			
			//alert(COL_MAR);
			//grdPlan.SetGridText(lrow-1, lcol, data);
		}
		return;

		//grdPlan.SetGridText(grdPlan.rows-1, G_description_type, lstDescription.value); 
		//grdPlan.SetGridText(grdPlan.rows-1, G_work_division_pk, txtWorkDivision_Pk.text); 
		//grdPlan.SetGridText(grdPlan.rows-1, G_project_pk, txtProject_Pk.text); 
	}
	excel_sheet.Application.ActiveWorkbook.save();
	excel_sheet.Application.Quit();

}

//-------16---------------------------------------------------------
function onChangeyear()
{
	
	var _header = "_PK|_item_pk|Item code|Item name|Unit|Plan Qty(A)|This year amt.(B)|Acc. amt(C)|Balance(A-B)|" ; 
	    _header =  _header + "01/" +  lstYear.GetData() ;
		_header =  _header + "|02/" +  lstYear.GetData() ;
		_header =  _header + "|03/" +  lstYear.GetData() ;
		_header =  _header + "|04/" +  lstYear.GetData() ;
		_header =  _header + "|05/" +  lstYear.GetData() ;
		_header =  _header + "|06/" +  lstYear.GetData() ;
		_header =  _header + "|07/" +  lstYear.GetData() ;
		_header =  _header + "|08/" +  lstYear.GetData() ;
		_header =  _header + "|09/" +  lstYear.GetData() ;
		_header =  _header + "|10/" +  lstYear.GetData() ;
		_header =  _header + "|11/" +  lstYear.GetData() ;
		_header =  _header + "|12/" +  lstYear.GetData() ;
        _header =  _header + "|acc_pk"
	grdPlan.setHeader(_header);
}
//==============================================================================================  
</script>
<body>
<!------------1---------------------------------------------------------------->
<gw:data id="dso_Date" onreceive="dso_year.Call()"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_sel_61070010_period"  > 
			<input>
                <input bind="txtProjectPk"/>
            </input>
            <output>
                 <output bind="dtContractPeriod_Fr"/>
                <output bind="dtContractPeriod_To"/>
              
            </output>
		</dso> 
	</xml>
</gw:data>
<!-------------2--------------------------------------------------------------->
<gw:data id="dso_511_1" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_pro_61070010_1"  > 
			<input>
                <input bind="txtProjectPk"/>
				<input bind="lstVersion"/>
            </input>
            <output>
                 <output bind="txtout1"/>
                <output bind="txtout2"/>
              
            </output>
		</dso> 
	</xml>
</gw:data>

<!------------3----------------------------------------------------------------->
<gw:data id="dso_schedule_no" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="list" procedure="pm_sel_61070010_revision" > 
            <input> 
                <input bind="txtProjectPk" />
            </input> 
            <output>
                <output bind="lstVersion" /> 
            </output>
        </dso> 
    </xml> 
</gw:data>


<!-----------4------------------------------------------------------------------->
<gw:data id="dso_GetItems" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"  function="pm_sel_61070010_plan_items" >
			<input bind="grdItems">
				<input bind="txtProjectPk"/>
			</input> 
			<output bind="grdItems"/>
		</dso>
	</xml>
</gw:data>

<!------------5--------------------------------------------------------------------------->
<gw:data id="dso_year" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="pm_pro_61070010_year"> 
                <input> 
                     <output bind="dtContractPeriod_Fr"/>
                     <output bind="dtContractPeriod_To"/>
                </input>
                <output>
                     <output bind="lstYear"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------6--------------------------------------------------------------------------->

<gw:data id="dso_511_status" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_PRO_61070010_STATUS"  > 
			<input> 
				<input bind="txtProjectPk" />
				<input bind="lstVersion" />
			 </input>
			 <output>
				<output bind="lstStatus"/>
			 </output>
		</dso> 
	</xml>
</gw:data>
<!-----------7------------------------------------------------------------------->

<gw:data id="dso_Increase" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_PRO_61070010_INC_V"  > 
			<input> 
				<input bind="txtProjectPk" />
				<input bind="lstVersion" />
			 </input>
			 <output>
				<output bind="lstVersion"/>
			 </output>
		</dso> 
	</xml>
</gw:data>
<!-----------8------------------------------------------------------------------->

<gw:data id="dso_grdPlan" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="grid" parameter="0,1,4,5"  function="PM_SEL_61070010_DTL" procedure="PM_UPD_61070010_1" > 
            <input bind="grdPlan">
                <input bind="txtProjectPk" />
				<input bind="lstVersion" />
				<input bind="lstYear" />
             
		    </input> 
            <output bind="grdPlan" /> 
        </dso> 
    </xml> 
</gw:data>
<!-------------9--------------------------------------------------------------->
<gw:data id="dso_511_confirm_cancel" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_UPD_61070010_MST"  > 
			<input>
                <input bind="txtProjectPk"/>
				<input bind="lstVersion"/>
				<input bind="txtStatus"/>
            </input>
            <output>
                 <output bind="lstStatus"/>
          </output>
		</dso> 
	</xml>
</gw:data>
<!-----------end------------------------------------------------------------------->

<fieldset style="padding: 2">
	<legend></legend>
	<table border="0" width="100%" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#00FFFF">
		<tr>
			<td width="10%"><a href="#" title="Click here to show Project" style="text-decoration:none" onclick="OnPopUp('Project')">Project&nbsp;</a></td>
			<td width="10%"><gw:textbox id="txtProject_Cd" readonly="true"  styles='width:100%' /></td>
			<td width="40%"><gw:textbox id="txtProject_Nm" readonly="true"  styles='width:100%' /></td>
			<td width="1%"><gw:imgbtn id="bve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProjectPk.text='';" /></td>
			<td width="5%">&nbsp;</td>
			<td>Period</td>
			<td width="10%" align="left"><gw:datebox id="dtContractPeriod_Fr" lang="1" /></td>
			<td width="2%" align="center">~</td>
			<td width="10%" align="right"><gw:datebox id="dtContractPeriod_To" lang="1" /></td>
			
			<td width="1%">&nbsp;</td>
			<td width="1%">&nbsp;</td>
			<td  width="1%"><gw:imgbtn id="btSearch"   img="search"    alt="Search"            onclick="frm_Onlick(this)"  /></td>
			<td  width="1%"><gw:imgbtn id="btSave"     img="save"      alt="Save"              onclick="frm_Onlick(this)"  /></td>
			<td  width="1%"><gw:imgbtn id="btConfirm"  img="confirm"   alt="Confirm"           onclick="frm_Onlick(this)"  /></td>
			<td  width="1%"><gw:imgbtn id="btCancel"   img="cancel"    alt="Cancel Confirm"    onclick="frm_Onlick(this)"  /></td>
			<td  width="1%"><gw:imgbtn id="btIncrease" img="increase"  alt="Increase Version"  onclick="frm_Onlick(this)"  /></td>
			<td  width="1%"><gw:imgbtn id="btDelete"   img="delete"    alt="Delete item"    onclick="frm_Onlick(this)"  /></td>
			<!--td  width="1%"><gw:imgbtn id="btDown"     img="download"  alt="Download"          onclick="frm_Onlick(this)"  /></td-->
		</tr>
		<tr>
			<td  width="10%">Upload</td>
			<td  width="50%" colspan="3" ><input type="file" id="idtext" size="1"  style="width:100%;" onChange="OnUpload()"  title="Upload"/></td>
			<td width="5%">&nbsp;</td>
			<td width="5%" align="right">Version&nbsp;</td>
			
			<td width="10%"><gw:list id="lstVersion" styles='width:100%' onchange="OnChangeVer()" /></td>
			<td width="5%" colspan="2" align="right">Status</td>
			<td width="10%" colspan="9"><gw:list id="lstStatus" styles='width:100%' onchange="OnChangeList()" /></td>
			
		</tr>
	</table>
	</fieldset>
<table style="width:100%;height:100% " cellpadding="0" cellspacing="0" border="1">
	<tr valign=top style="width:100%;height:100% ">
		<td id="left" style="width: 30%; height:100%; display:none">
			<table style="width: 100%" cellpadding="0" cellspacing="0" border="0" height="100%">
				
				<tr>
					<td style="width: 15%; height:2%" align="right">Version</td>
					<td colspan="2">
						<gw:list id="lstVersionS" styles='width:100%' />
					</td>
					<td>
						<gw:imgbtn id="btnSearch" img="search" alt="Search"  onclick="frm_Onlick(this)" />
					</td>
				</tr>
				<tr valign="top">
					<td colspan="5" style="height:98%">
						<gw:grid   
						id="grdSearch"  
						header="_PK|Version|Status"
						format  ="0|0|0"
						aligns ="0|0|0"
						defaults="||"
						editcol ="0|0|0"
						widths="0|1500|1000"
						styles="width:100%; height:100%"   
						sorting="T"
						oncellclick = "OnSearchMST()"/>
					</td>
				</tr>
			</table>
		</td>
		<td  id="right" style="width: 70%;height:100% ">
			<table style="width: 100%" cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td colspan="12" style="width: 100%; height:100%">
						<gw:tab id="idTab">
							<table style="width: 100%; height:100%" name="Progress Plan" id="Tab1"  cellpadding="1" cellspacing="1" border="0">
								<tr>
									<td style="height:5%">
										<fieldset style="width:100%;padding:0">
											<table  style="width: 100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="left">
														<gw:radio id="rdoScheduleItem" value="Q" > 
															<span value="Q">Quantity</span> 
															
														</gw:radio >
													</td>

                                                    <td width="10%" align="right"> Year </td>
													<td width="10%"><gw:list id="lstYear"  onchange="onChangeyear();"  styles="width:100%" /> </td>
													<td width="30%">  </td>
													<td  width="10%" align="center" style="display:none">
														<gw:icon id="btnQtyPPrepare"  img="in" text="Major Q'ty" onclick="Onlick(this)"  />
													</td>
													
													<td width="10%" align="right"><gw:imgbtn id="btnew" img="new" alt="New"  onclick="frm_Onlick(this)"  /> </td>
												</tr>
											</table>
										</fieldset>
								   </td>
								</tr>
								<tr style="display:none">
									<td style="height:50%">
										<gw:grid   
										id="grdItems"  
										header ="Large Division|Code|Dtl Items|Level|PK|project_pk"
										format ="0|0|0|0|0|0"
										aligns ="0|0|0|0|0|0"
										defaults="|||||"
										editcol ="1|1|1|1|1|1"  
										widths="0|0|0|0|0|0"
										styles="width:100%; height:100%"   
										sorting="T"  />
									</td>
								</tr>
								<tr>
								   <!--0_PK|1_item_pk|2.Item code|3.Item name|4.Unit|5.Plan Qty(A)|6.This year amt.(B)|7.Acc. amt(C)|8.Balance(A-C)|9.M1|10.M2|11.M3|12.M4|13.M5|14.M6|15.M7|16.M8|17.M9|18.M10|19.M11|20.M12-->
									<td style="height:100%">
										<gw:grid id="grdPlan"  
										header="_PK|_item_pk|Item code|Item name|Unit|Plan Qty(A)|This year amt.(B)|Acc. amt(C)|Balance(A-C)|M1|M2|M3|M4|M5|M6|M7|M8|M9|M10|M11|M12"
										format="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
										aligns="0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
										defaults="||||||||||||||||||||"
										editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
										widths="0|0|1500|2000|1200|1500|1500|1500|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200"
										styles="width:100%; height:88%"
										debug="false"
										sorting="T" 
										onafteredit=""/>
									</td>
								</tr>
							</table>
							
						</gw:tab>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
<gw:textbox id="txt_progplanbase_pk" readonly="true"  styles='display:none' />
<gw:textbox id="txtProjectPkS" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtProjectPk" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtStatus" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtProjectRefPk" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtout1" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtout2" readonly="true"  styles='width:100%;display:none' />
</html>
