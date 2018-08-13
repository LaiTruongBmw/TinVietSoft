<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>
</head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//----------grdEmployee-----
//'_PK|Organization|Emp ID|Employee Name|Postion Name|Job Name|_TLG_ITEM_PROCESS|Item Code|Item Name|Process Name|Unit Price
//|Quantity|Amountl|Remark'
var G1_PK          = 0,
    G1_ORGANIZATION    = 1,
	G1_THR_EMP_PK  = 2,
	G1_EMP_ID	   = 3,
    G1_EMP_NAME   = 4,
    G1_POSITION   = 5,
    G1_JOB         = 6, 
    G1_ITEM_PROCESS_CODE = 7,
	G1_ITEM_CODE	= 8,	
    G1_ITEM_NAME       = 9,
	G1_PROCESS_NAME  = 10,
	G1_WORK_DATE	= 11,
	G1_UNIT_PRICE = 12,
	G1_QUANTITY = 13,
	G1_AMOUNT = 14,
	G1_STATUS = 15,
	G1_REMARK = 16;
//---------------
 
var v_language = "<%=Session("SESSION_LANG")%>";
//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //------------------
    BindingDataList();
	
	data_hrpr00500_0.Call();
}

//=======================================================================

function BindingDataList()
{
    var data=""; 
        
	idFrom.SetEnable(false);
	idTo.SetEnable(false);
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg.SetDataText(data);
    ChangeColorItem(lstOrg.GetControl());
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstSalaryKind.SetDataText(data);
   
   
}
function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "0066CC";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "FF4500";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                    }
                }                
            }
        }
    }
//=======================================================================
function OnProcess()
{
	if(confirm((v_language=='ENG') ? "Do you want to process?":"Bạn có muốn xử lý dữ liệu?"))
		data_hrpr00500_1.Call();
	
}

function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_hrpr00500_1' :
			if(txtResult.text=='0')
				alert((v_language=='ENG') ? "Process Successful":"Xử lý thành công");
		break;
		
		case 'data_hrpr00500_2' :
			if(txtResult.text=='0')
				alert((v_language=='ENG') ? "Delete Successful":"Xóa thành công");
		break;
    }
}
//=======================================================================
function OnDelete(ogrid)
{
    if( confirm((v_language=='ENG') ? "Do you want to delete?":"Bạn có muốn xóa dữ liệu?"))
	{
		data_hrpr00500_2.Call();
	}    
}

function onchange_month()
{
	data_hrpr00500_0.Call();

}


</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<gw:data id="data_hrpr00500_0" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_CO_FROM_TO" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="lstOrg" />
                    <input bind="lstSalaryKind" />  
                </input> 
                <output>
                    <output bind="idFrom" />
                    <output bind="idTo" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="data_hrpr00500_1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPR00500_1" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstOrg" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="data_hrpr00500_2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPR00500_2" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstOrg" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>    
 <form name="Process" id="form1">
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center"  align="top" class="eco_line">
        <tr style="height:10%" class="eco_bg">
            <td colspan="2">
                <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                    <tr style="height:100%">
			            <td  width="100%" align="center"><b style="font-size=20; color:Green">Monthly Process Salary Product</b></td>
		            </tr>
                </table>
            </td>
        </tr>
        <tr style="height:90%">
            <td class="eco_line_t" colspan="2" align="center" valign="top">
				<div style="height:30px">&nbsp;</div>
                <table border="0" width="800px"  cellpadding="0" cellspacing="0" class="eco_line">
                   
                    <tr>
                        <td align="center" >
                            <table  style="width:80%;height:6%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    <tr >
				                    <td class="" width="15%" align="right" style="white-space:nowrap">Work Month</td>
									<td class="" width="10%" align="right" style="white-space:nowrap">
										<gw:datebox id="idWorkMon" lang="<%=Session("Lang")%>" styles="width:90%" onchange="onchange_month()" type=month></gw:datebox>
									</td>
									<td class="" width="10%" align="right" style="white-space:nowrap"></td>
                                    <td class="" width="10%" align="right" style="white-space:nowrap">From Date</td>
                                    <td class="" width="10%"><gw:datebox id="idFrom" onChange="OnChangeDate()" lang="<%=Session("Lang")%>" styles="width:50%" ></gw:datebox></td>	
                                    <td class="" width="10%" align="right">To Date</td>
                                    <td class="" width="10%"><gw:datebox id="idTo" lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnchangeDT(2)"></gw:datebox></td>	
                                   
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="eco_line_t" style="padding-top:10px">
                            <table style="width:80%;height:30%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    
			                    <tr >
									<td  align="right" align="right" width="15%" >Organization</td>
				                    <td colspan=2 class="" width="30%">
										<gw:list  id="lstOrg" value='ALL'  styles='width:100%'  />
                                    </td>
									<td  align="right" width="15%" >Salary Kind</td>
									<td  align="left" width="30%">
                                        <gw:list  id="lstSalaryKind" value='' maxlen = "100" styles='width:100%' onchange="ChangeSalaryKind()" />
                                    </td>
			                    </tr>
			                    <tr >
				                    <td class="" width="10%" align="left">&nbsp;</td>
				                    <td colspan=2 width="50%" align="left" style="color=Black"></td>
				                    <td colspan=4 class="" width="40%"> </td>
			                    </tr>	
			                    <tr >
				                    <td class="" width="10%" align="left" valign=bottom>&nbsp;</td>			
				                    <td  align="center" style="width:15%">
										<gw:button id="idBtnProcess" img="process" text="Process" onclick="OnProcess()" />
									</td>
									<td  align="center" style="width:15%">
										<gw:button id="idBtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
									</td>
				                    <td colspan=2  align="left"  style="width:10%">
									</td>
			                    </tr>
	                            <tr >
				                    <td colspan=5 class="" width="100%" align="center" valign=bottom>
										<gw:label id="idProcess_status" text="" styles="width:100%"  ></gw:label>
									</td>			
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	
</form>
   
    <!-- </gw:tab> -->
    <!----------------------------------------------------------->
    <gw:textbox id="txtProcessPK" text="" styles="display:none" />
    <gw:textbox id="txtResult" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
