<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var NO = 0,
    ITEM = 1,
    UNIT = 2,
    PLAN = 3,
    PLAN_QTY = 4,
    UNIT_PRICE = 5,
    RQ_YESTERDAY = 6,
    RQ_TODAY = 7,
    RQ_ACCUMM = 8,
    RA_YESTERDAY = 9,
    RA_TODAY = 10,
    RA_ACCUMM = 11,
    RR_YESTERDAY = 12,
    RR_TODAY = 13,
    RR_ACCUMM = 14,
    R_QTY = 15,
    R_AMT = 16,
    R_PERCENT = 17,
    DESCRIPTION = 18,
    PK = 19,
    PROJECT_PK = 20,
    RESULT_DATE = 21,
    SUBCONTRACT_PK = 22,
    ITEM_PK = 23,
    STATUS = 24,
    MONTH = 25,
    TECPS_VENDORCTRTRMRK_PK = 26
    ;
function BodyInit()
{
    System.Translate(document);
    MergeHeader();
	BindingDataList();	
	grdDetail.GetGridControl().FrozenCols = UNIT;
}
//==============================================================================
function BindingDataList()
{
	 
}
//==============================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/next_orange.gif";

    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/prev_orange.gif";

    }
}	
//==============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
            var path = System.RootURL + "/form/61/03/61030010_1.aspx";
            var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
            if (obj != null) 
            {
                txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
                txtProject_M.text = obj[1];
                txtTAC_ABPL_pk.text = obj[3];
                dso_Main_Cont_Period.Call();
                
            }
        break;
        case 'Subcontract':
				var path = System.RootURL + '/form/61/08/61080030_Subcontract.aspx?Project_pk=' + txtProject_Pk.text;
				var obj = System.OpenModal( path ,700 , 400 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
				
				    txtSubcontract_Cd.SetDataText(obj[3]);
					txtSubcontract_Nm.SetDataText(obj[2]);
                    txtSubcontract_Pk.SetDataText(obj[0]);
                    txtSubcontract_M.SetDataText(obj[3]);
                    dso_Subcontrac_Period.Call();
                    
				}
		break;

    }
    
}
var flag='';
//==============================================================================
var flag="";
function OnSave(obj)
{
    for(i=2;i<grdDetail.rows;i++)
    {
        grdDetail.SetGridText(i,RESULT_DATE,dtResult.value);
        grdDetail.SetGridText(i,MONTH,dtResult.value.substring(0,4)+dtResult.value.substring(4,6));
    }
    flag='save';
	dso_detail.Call();
}
//==============================================================================
function OnNew(obj)
{
    if (txtProject_Pk.text != '' && txtSubcontract_Pk.text != '')
    {
        dso_AddNew.Call('SELECT');
    }
    else 
    {
        alert('Please select Project and Subcontract !!');
    }
}
//==============================================================================
function CheckDuplicateItem()
{
    for(var i = 2; i < grdDetail.rows; i++)
    {
        if(grdDetail.GetGridData(i, ITEM_PK) == txtItem_Pk.text)
        {
             alert("Duplicated Item!! ");
             return false ;
        }
    }
    return true;
}
//==============================================================================
function OnDelete(obj)
{
	if(confirm('Are you sure you wanna delete ?'))
    {
        flag='delete';
        grdDetail.DeleteRow();
        dso_detail.Call();
    }
}
//==============================================================================
function OnSearch(obj)
{
	switch (obj)
	{
		case 'master':
			dso_master.Call('SELECT');
		break;
		case 'Detail':
            txtProject_Cd.text = grdMaster.GetGridData(grdMaster.row, 4);
            txtProject_Nm.text = grdMaster.GetGridData(grdMaster.row, 2);
            txtProject_Pk.text = grdMaster.GetGridData(grdMaster.row, 3);
            txtSubcontract_Cd.text = grdMaster.GetGridData(grdMaster.row, 6);
            txtSubcontract_Nm.text = grdMaster.GetGridData(grdMaster.row, 1);
            txtSubcontract_Pk.text = grdMaster.GetGridData(grdMaster.row, 5);
            dtResult.value = grdMaster.GetGridData(grdMaster.row, 7);
            flag='search';
            dso_detail.Call('SELECT');
		break;	
	}
}
//==============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_master':
			for(i = 1; i < grdMaster.rows; i++)
			{
			    if(grdMaster.GetGridData(i,8) != '')
			    {
					//alert(grdMaster.GetGridData(i,8));
			        grdMaster.SetCellBgColor(i, 0, i ,grdMaster.cols-1, 0X00FFFF);
                }			        
			}	
		break;
		case 'dso_AddNew':
            MergeHeader() ;
            var i = 0;
            btnSave.SetEnable(true);
            btnDelete.SetEnable(true);
            btnConfirm.SetEnable(true);
            btnCancel.SetEnable(false);
            for(i=2;i<grdDetail.rows;i++)
            {
                grdDetail.SetGridText(i, 0, i-1);
                grdDetail.SetRowStatus(i, 0x20);
            }
           
        break;
        case 'dso_detail':
            MergeHeader() ;
            if(grdDetail.rows>2)
            {
                if(grdDetail.GetGridData(grdDetail.rows-1,STATUS)=='Y' )
                {
                    btnNew.SetEnable(false);
                    btnSave.SetEnable(false);
                    btnDelete.SetEnable(false);
                    btnConfirm.SetEnable(false);
                    btnCancel.SetEnable(true);
                }
                else{
                    btnNew.SetEnable(true);
                    btnSave.SetEnable(true);
                    btnDelete.SetEnable(true);
                    btnConfirm.SetEnable(true);
                    btnCancel.SetEnable(false);
                }
            }
                if(grdDetail.GetGridData(grdDetail.rows-1,RESULT_DATE)=='')
                {
                    btnNew.SetEnable(true);
                }
            
            if(flag=='delete' || flag=='save')
            {
                dso_master.Call('SELECT');
            }
            
        break;
        case 'dso_Subcontrac_Period':
            dso_AddNew.Call('SELECT');
        break;
    }
}
//==============================================================================
function MergeHeader() 
{
    var fg = grdDetail.GetGridControl();
    if (fg.Rows < 2) 
    {
        grdDetail.AddRow();
    }

    fg.FixedRows = 2
    fg.MergeCells = 5

    fg.MergeCol(NO) = true
    fg.Cell(0, 0, NO, 1, NO) = "No"

    fg.MergeCol(ITEM) = true
    fg.Cell(0, 0, ITEM, 1, ITEM) = "Item"

    fg.MergeCol(UNIT) = true
    fg.Cell(0, 0, UNIT, 1, UNIT) = "Unit"

    fg.MergeCol(PLAN) = true
    fg.Cell(0, 0, PLAN, 1, PLAN) = "% Plan"

    fg.MergeCol(PLAN_QTY) = true
    fg.Cell(0, 0, PLAN_QTY, 1, PLAN_QTY) = "Plan Qty"

    fg.MergeCol(UNIT_PRICE) = true
    fg.Cell(0, 0, UNIT_PRICE, 1, UNIT_PRICE) = "Unit Price"

    fg.MergeRow(0) = true
    fg.Cell(0, 0, RQ_YESTERDAY, 0, RQ_ACCUMM) = "Result Qty"
    fg.Cell(0, 1, RQ_YESTERDAY, 1, RQ_YESTERDAY) = "Previous"
    fg.Cell(0, 1, RQ_TODAY, 1, RQ_TODAY) = "This Month"
    fg.Cell(0, 1, RQ_ACCUMM, 1, RQ_ACCUMM) = "Accumm"

    fg.Cell(0, 0, RA_YESTERDAY, 0, RA_ACCUMM) = "Result Amount"
    fg.Cell(0, 1, RA_YESTERDAY, 1, RA_YESTERDAY) = "Previous"
    fg.Cell(0, 1, RA_TODAY, 1, RA_TODAY) = "This Month"
    fg.Cell(0, 1, RA_ACCUMM, 1, RA_ACCUMM) = "Accumm"

    fg.Cell(0, 0, RR_YESTERDAY, 0, RR_ACCUMM) = "Result Rate"
    fg.Cell(0, 1, RR_YESTERDAY, 1, RR_YESTERDAY) = "Previous"
    fg.Cell(0, 1, RR_TODAY, 1, RR_TODAY) = "This Month"
    fg.Cell(0, 1, RR_ACCUMM, 1, RR_ACCUMM) = "Accumm"

    fg.Cell(0, 0, R_QTY, 0, R_PERCENT) = "Remain"
    fg.Cell(0, 1, R_QTY, 1, R_QTY) = "Qty"
    fg.Cell(0, 1, R_AMT, 1, R_AMT) = "Amount"
    fg.Cell(0, 1, R_PERCENT, 1, R_PERCENT) = "%"

    fg.MergeCol(DESCRIPTION) = true
    fg.Cell(0, 0, DESCRIPTION, 1, DESCRIPTION) = "Description"
}
//-------------------------------------------------------------------------------
function format_number(dec, fix) 
{
	fixValue = parseFloat(Math.pow(10,fix));
	rtn_value = parseInt(Math.round(dec * fixValue)) / fixValue;	
	return rtn_value ;
}
//==============================================================================
function OnEdit()
{
    var _Unit_Price = grdDetail.GetGridData(grdDetail.row, UNIT_PRICE).replace(/,/g,"");
    var _Today_Qty = grdDetail.GetGridData(grdDetail.row, RQ_TODAY).replace(/,/g,"");
    var _Rs_Amt = 0;
    _Rs_Amt = Number(_Unit_Price) * Number(_Today_Qty);
    grdDetail.SetGridText(grdDetail.row, RA_TODAY, _Rs_Amt);

    var total_plan = 0, percent = 0;
		for (row = 2; row < grdDetail.rows; row++)
		{
			total_plan += Number(grdDetail.GetGridData(row, PLAN_QTY));
		}
        
		if (total_plan == 0) return;

		percent = 100 / total_plan;	
		for (i = 2; i < grdDetail.rows; i++)
		{
			grdDetail.SetGridText(i, PLAN, percent *  grdDetail.GetGridData(i, PLAN_QTY));
		}

//        var _percent = 0;
//        //_percent.toFixed(10);
//        if (grdDetail.GetGridData(grdDetail.row, PLAN_QTY) == 0) return;
//        _percent = Number(grdDetail.GetGridData(grdDetail.row, PLAN_RESULT)) / Number(grdDetail.GetGridData(grdDetail.row, PLAN_TOTAL)) * 100;
//		grdDetaGridText(grdDetail.row, PERCENT, _percent);

        var _Plan_Qty = Number(grdDetail.GetGridData(event.row,PLAN_QTY));
        var _Accum1 = Number(grdDetail.GetGridData(event.row,RQ_ACCUMM));
        var _Qty = 0;
        _Qty = format_number( Number(_Plan_Qty),8) - format_number( Number(_Accum1),8);
//        alert(_Plan_Qty);
//        alert(_Accum1);
//        alert(_Qty);
		var remain_qty = Number(grdDetail.GetGridData(event.row,R_QTY));
        if(Number(grdDetail.GetGridData(event.row,RQ_TODAY))> remain_qty)
        {
            alert('This month quantity can not be large than remain quantity !!');
            grdDetail.SetGridText(event.row,RQ_TODAY,'');
        }
}
//==============================================================================
function OnConfirm()
{
    if(txtProject_Pk.text != '' && txtSubcontract_Pk.text != '')
    {
        if(confirm('Are you sure you want to confirm ?'))
        {
            var _Month = dtResult.value.substring(0,6);
            for(i=2;i<grdDetail.rows;i++)
            {
                grdDetail.SetGridText(i, MONTH, _Month);
                grdDetail.SetGridText(i, STATUS, 'confirm');
            }
            dso_detail.Call();
        }
    }
    else
    {
        alert('Please select row master !!');
    }
}
//==============================================================================
function OnCancel()
{
    if(confirm('Are you sure you want to cancel ?'))
    {
        var _Month = dtResult.value.substring(0,6);
        for(i=2;i<grdDetail.rows;i++)
        {
            grdDetail.SetGridText(i, MONTH, _Month);
            grdDetail.SetGridText(i, STATUS, 'cancel');
        }
        dso_detail.Call();
    }
}
//==============================================================================
function OnPrint()
{
    if(txtProject_Pk.text != '')
       { 
                var path = System.RootURL + "/reports/61/08/61080020.aspx?Project_pk=" + txtProject_Pk.text + '&Subcont_Pk=' + txtSubcontract_Pk.text + '&Month=' +  dtResult.value;
                System.OpenTargetPage(path);  
        }
       else
       {
            alert('Please select a row master !!');
       }   
}
</script>
<body> 
<gw:data id="dso_Main_Cont_Period" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_SEL_61080030_DATE_PERIOD"  > 
			<input>
                <input  bind="txtProject_Pk" />
            </input>
            <output>
                  <output bind="dtPeriod_Fr"/>
                <output bind="dtPeriod_To"/>
            </output>
		</dso> 
	</xml>
</gw:data>

<gw:data id="dso_Subcontrac_Period" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="PM_SEL_61080030_DATE_PERIOD_1" > 
                <input> 
                     <input  bind="txtProject_Pk" />
                     <input  bind="txtSubcontract_Pk" />
                </input>
                <output>
                     <output  bind="dtContractTarget_Fr" />
                     <output  bind="dtContractTarget_To" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	

<gw:data id="dso_AddNew" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="grid" function="PM_SEL_61080030" > 
            <input bind="grdDetail">
                <input bind="txtProject_Pk" />
				<input bind="txtSubcontract_Pk" />
				<input bind="dtResult" />
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_detail" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26"  function="PM_SEL_61080030_1"  procedure="PM_UPD_61080030">
          <input bind="grdDetail" >
          <input bind="txtProject_Pk" />
          <input bind="txtSubcontract_Pk" />
          <input bind="dtResult" />
          </input>
          <output bind="grdDetail" />
        </dso>
      </xml>
    </gw:data>   
    
<gw:data id="dso_master" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" function="PM_SEL_61080030_MASTER">
          <input bind="grdMaster" >
          <input bind="dtFrom" />
          <input bind="dtTo" />
          <input bind="txtProject_M" />
          <input bind="txtSubcontract_M" />
          </input>
          <output bind="grdMaster" />
        </dso>
      </xml>
    </gw:data>    
    
    
   <table style="width:100%;height:100%;background:#BDE9FF" >
   		<tr height="100%">
        	<td id="left" width="25%" style="background:white" valign="top">
            	<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
                	<tr height="6%">
                    	<td>
                        	<fieldset style="padding:0">
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                         <tr style="height:">
                                                <td style="width: 10%" align="right">Date&nbsp;</td>
                                                <td style="width: 90%"><gw:datebox id="dtFrom" lang="1"  />~<gw:datebox id="dtTo" lang="1" /></td>
                                                <td width=""><gw:imgbtn id="ibtnUpdte1" img="search" alt="Search" onclick="OnSearch('master')" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td style="width: 10%" align="right">Project&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtProject_M" styles="width: 100%" onenterkey="OnSearch('master')" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td align="right">Subcontract&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtSubcontract_M" styles="width: 100%" onenterkey="OnSearch('master')" /></td>
                                            </tr>
                                </table>
                          </fieldset>  
                        </td>
                    </tr>
                    <tr height="94%">
                        <td colspan="">
                            <gw:grid id='grdMaster' 
                            header='Date|Subcontract|Project|_project_pk|_project_cd|_subcontract_pk|_subcont_cd|_result_dt|_tecps_requestpayment_pk' 
                            format='0|0|0|0|0|0|0|0|0'                           
							aligns='0|0|0|0|0|0|0|0|0' 
                            check='||||||||' 
                            editcol='0|0|0|0|0|0|0|0|0' 
                            widths='1200|2000|3000|0|0|0|0|0|0' 
                            sorting='T'
                            oncellclick="OnSearch('Detail')"
                            styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        	<td id="right" width="75%" valign="top" style="background:white">
            	<table cellpadding="1" cellspacing="0" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" width="20%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                        <td width="80%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                    <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                    <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                    <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    <td width="" style="display:"><gw:button id="btnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
                                    <td width=""><gw:button id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" /></td>
                                    <td width=""><gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete('Master')" /></td>
                                    <td width=""><gw:button id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
                                    <td width=""><gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
                                    <td width=""><gw:button id="btncel" img="excel" alt="Print Report" onclick="OnPrint()" /></td>
                                </tr>
                            </table>
                        </td>
                        
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td style="width: " align="right">Main Cont. Per.&nbsp;</td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: " colspan=""><gw:datebox id="dtPeriod_Fr" lang="1" />~<gw:datebox id="dtPeriod_To" lang="1" /></td>
                                    <td style="width:100% " align="right">Result Date&nbsp;</td>
                                    <td style="width: " colspan=""><gw:datebox id="dtResult" onchange="dso_detail.Call('SELECT')" lang="1" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Subcontract" style="text-decoration: none" onClick="OnPopUp('Subcontract')">Subcontract&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtSubcontract_Cd" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtSubcontract_Nm" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtSubcontract_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtSubcontract_Cd.text='';txtSubcontract_Pk.text='';txtSubcontract_Nm.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">Subcontract Period&nbsp;</td>
					    <td colspan="">
						    <table style="width:100%" cellpadding="0" cellspacing="0">
							    <tr>
								    <td width="" ><gw:datebox id="dtContractTarget_Fr"  lang="1" "/></td>
								    <td width="" >~</td>
								    <td width="" ><gw:datebox id="dtContractTarget_To"  lang="1" " /></td>
								    <td width="100%"></td>
							    </tr>
						    </table>
					    </td>
                    </tr>
                    <tr height="90%">
                    	<td colspan="2">
                        <!--header='0.No|1.Item|2.Unit|3.% Plan|4.Plan Qty|5.Unit Price|6.Until Yesterday|7.Today|8.Accumm|9.Until Yesterday|10.Today|11.Accumm|12.Until Yesterday|13.Today|14.Accumm|15.Qty|16.Amount|17.%|18.Description|19_pk|20_project_pk|21_result date|22_subcontract_pk|23_Item_pk|24_Status|25_Month|26_TECPS_VENDORCTRTRMRK_PK' -->
                            <gw:grid id='grdDetail' 
                            	header='No|Item|Unit|% Plan|Plan Qty|Unit Price|Until Yesterday|Today|Accumm|Until Yesterday|Today|Accumm|Until Yesterday|Today|Accumm|Qty|Amount|%|Description|_pk|_project_pk|_result date|_subcontract_pk|_Item_pk|_Status|_Month|_TECPS_VENDORCTRTRMRK_PK' 
							    format='0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0'
                                aligns='1|0|1|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0|0|0|0|0|0|0' 
								check='||||||||||||||||||||||||||' 
							   editcol='0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0' 
								widths='700|4000|1500|700|1500|2000|4000|4000|4000|2000|2000|2000|2000|2000|2000|2000|2000|2000|3000|0|0|0|0|0|0|0|0' 
                                sorting='T'
                                styles='width:100%; height:100%' 
                                onafteredit="OnEdit()"
                                oncelldblclick="" />
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
   </table>
  <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;position:absolute; left:1; top: 0;" onClick="OnToggle()" />   
  <gw:textbox id="txtItem_Pk" styles='width:100%;display:none' readonly="T" />
  <gw:textbox id="txtMasterPK" styles='width:100%;display:none' readonly="T" />
  <gw:textbox id="txtRtn_RemainQty" type="number" format="###,###,###,###.##R" styles='width:100%;display:none' readonly="T" />
  <gw:textbox id="txtTAC_ABPL_pk"        styles='display:none'/>
</body>
</html>
