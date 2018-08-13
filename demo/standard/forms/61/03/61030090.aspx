<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>1.2.10 Account Receivable List</title>
</head>
<script>
//------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    var data = "DATA|1|Save|2|Confirm|ALL|[SELECT ALL]";
    lstStatus.SetDataText(data);
    lstStatus.value = 'ALL';
    var vendor = document.all("updating_info");
    vendor.style.display = "none";
	
	 txtuser_pk.text = "<%=session("USER_PK") %>";
	 txtuser_id.text = "<%=session("User_ID") %>";
}
//--------------------------------------------------------------------
function OnPopUp(pos)
{
    switch (pos) {
        case 'project':
            var path = System.RootURL + '/form/61/03/61030010_1.aspx';
            var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
            if (obj != null) {
                txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
                dso_cus.Call();
            }
            break;
        case 'Customer':
            var path = System.RootURL + '/form/61/03/61030070_popup_Customer.aspx?Project_Pk=' + txtProject_Pk.text;
            var obj = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
            if (obj != null) {
                txtCustomer_Nm.SetDataText(obj[2]); //customer name
                txtCustomer_Pk.SetDataText(obj[0]); //customer name
                txtCustomer_Cd.SetDataText(obj[1]);
            }
            break;
    }
}
//---------------------------------------------------------------------------
function OnSearch(obj) 
{
    switch (obj) 
    {
        case 'Master':
            dso_search_master.Call('SELECT');
        break;
        case 'Detail':
		    if (event.col > 2)
		    {
				  txtMaster_pk.text = Grid_Detail.GetGridData(Grid_Detail.row, 0);
				  DSO_ATTACH_FILE.Call('SELECT');
		    }
          
        break;
    }

}
//----------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'DSO_ATTACH_FILE':
            var vendor = document.all("updating_info");
            if (Grid_Attach.rows > 1) {
                vendor.style.display = "";
                //imgup.src = "../../../system/images/up.gif";
            }
            else {
                vendor.style.display = "none";
                //imgup.src = "../../../system/images/down.gif";
            }

        break;
    }
}
//--------------------------------------------------------------------------------
function OnOpenFile() {
    var img_pk = Grid_Attach.GetGridData(Grid_Attach.GetGridControl().row, 3);
    var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TECPS_128CONTRACT_FILE";
    window.open(url);
}
//-------------------------------------------------------------------------------
function OnPrint() {
    if (Grid_Detail.rows>1)
    {
        var url = System.RootURL + "/reports/61/03/61030090.aspx?Project_Pk=" + txtProject_Pk.text + '&Project_Nm=' + txtProject_Nm.text + '&Customer_Pk=' + txtCustomer_Pk.text + '&Customer_Nm=' + txtCustomer_Nm.text + '&Status=' + lstStatus.value + '&From=' + dtFrom.value + '&To=' + dtTo.value + '&p_user_pk=' + txtuser_pk.GetData();
		System.OpenTargetPage(url);  
    }
}
//------------------------------------------------------------------------------------
function OnApprove()
{
    var data;
	data = "";
	var ctrl 	= Grid_Detail.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = Grid_Detail.GetGridData(i, 1);
		if (tmp == "-1")
		{
			data  = Grid_Detail.GetGridData(i, 0)+ "," + data ;
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for approval!!!'+'\n'+'  Bạn hãy chọn số SEQ để Approval!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to approve?'+'\n'+'Bạn có chắc Approval số SEQ này?'))
		{
	      //  txtStatus.text  = 0;
	        txtseq_str.text = data;
	        txtindex.text   = index;
			alert(txtseq_str.GetData());
	        //dso_upd_approval_cancel.Call();	
        }
    }
}
//------------------------------------------------------------------------------------
function onCancel()
{
	
}
//------------------------------------------------------------------------------------

</script>

<body>
<gw:data id="dso_cus"> 
<xml>
    <dso  type="process"   procedure="sp_pro_get_customer"  > 
        <input>
            <input bind="txtProject_Pk" />
        </input> 
        <output>
            <output bind="txtCustomer_Pk" />
            <output bind="txtCustomer_Cd" />
            <output bind="txtCustomer_Nm" />
        </output>
    </dso> 
</xml> 
</gw:data>
<gw:data id="dso_search_master" onreceive=""> 
			<xml> 
				<dso id="1" type="grid"    function="pm_sel_61030090"    > 
					<input bind="Grid_Detail">                    
						<input bind="txtProject_Pk" /> 
						<input bind="txtCustomer_Pk" /> 
						<input bind="lstStatus" />
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
						<input bind="txtuser_pk" />
					</input> 
					<output bind="Grid_Detail" /> 
				</dso> 
			</xml> 
     </gw:data>

<gw:data id="DSO_ATTACH_FILE" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid"  function="pm_sel_61030070_attach"  >
          <input bind="Grid_Attach" >
          <input bind="txtMaster_pk" />
          </input>
          <output bind="Grid_Attach" />
        </dso>
      </xml>
    </gw:data>
  <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
        <tr style="height:4%">
            <td>
                <fieldset style="padding:0">
                    <table width="100%" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project</a></td>
                            <td width="60%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtProject_Cd"  readonly="true" styles='width:100%' /></td>
                                        <td width="70%"><gw:textbox id="txtProject_Nm"  readonly="true" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="15%" align="right">Status</td>
                            <td colspan="" width="15%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="100%"><gw:list id="lstStatus" onchange="OnSearch('Master')" styles="width:100%;display:" /></td>
                                        <td><gw:imgbtn id="btnsearch" img="search" alt="Search" onclick="OnSearch('Master')" /></td>
                                        <td><gw:imgbtn id="btnexcel" img="excel" alt="Print" onclick="OnPrint()" /></td>
									   
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" ><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer')">Customer</a></td>
                            <td colspan="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtCustomer_Cd"  styles='width:100%' readonly="T" /></td>
                                        <td width="70%" ><gw:textbox id="txtCustomer_Nm"  styles='width:100%' readonly="T" /></td>
                                        <td width=""><gw:textbox id="txtCustomer_Pk" styles='width:0%;display:none' /></td>
                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd.text='';txtCustomer_Nm.text='';txtCustomer_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td> 
                            <td align="right">Trans. Date</td>
                            <td width="50%"><gw:datebox id="dtFrom" lang="1" onchange="" />~<gw:datebox id="dtTo" onchange="" lang="1" /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr  style="height:60%">
            <td width="100%">
            <!--header="0.Project Code|1.Project Name|2.Project Field|3.Customer|4.Description|5.Req. Type|6.Req. No.|7.Date|8.Ccy|9.( Net )|10.( VAT )|11.Deduct Advance|12.Retention|13.( Net )|14.( VAT )|15.Plan Receive|16.Trans AMT (VND)|17.Book AMT (USD)|18.Remark" -->
                    <gw:grid id="Grid_Detail" 
                    header="_Pk||Seq|Project Code|Project Name|Project Field|Customer|Payment method|Req. Type|Req. No.|Date|Ccy|Net (Claimed Amount)|VAT (Claimed Amount)|Deduct Advance|Retention|This time payment(Net)|This time payment(VAT)|Plan Receive|Trans AMT (VND)|Book AMT (USD)|Remark" 
                    format="0|3|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|1|1|0"
                    aligns="0|1|1|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|1|0|0|0" 
                    defaults="|||||||||||||||||||||" 
                   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="0|400|1000|1500|2500|1500|3000|3000|1500|1500|1500|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000" styles="width:100%; height:100%"
                    sorting="T" 
                    oncellclick="OnSearch('Detail')" />
            </td>
        </tr>
        <tr id="updating_info" style="height:36%">
            <td width="100%">
                    <gw:grid id="Grid_Attach" 
                    header="File Name|Size|Description|_pk|_Master_pk" 
                    format="0|0|0|0|0"
                    aligns="0|0|0|0|0" 
                    defaults="||||" 
                    editcol="0|0|1|0|0" 
                    widths="3000|1500|1000|0|0" styles="width:100%; height:100%"
                    sorting="T" 
                    oncelldblclick="OnOpenFile()" />
            </td>
        </tr>
  </table>
<gw:textbox id="txtMaster_pk"  styles='display:none' />
<gw:textbox id="txtseq_str"  styles='display:none' />
<gw:textbox id="txtindex"  styles='display:none' />
<gw:textbox id="txtuser_pk"  styles='display:' />
<gw:textbox id="txtuser_id"  styles='display:' />
</body>
</html>
