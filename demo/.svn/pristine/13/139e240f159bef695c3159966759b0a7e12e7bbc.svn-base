<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>1.2.10 Account Receivable List</title>
</head>
<script>
function OnSearch() 
{
    txtTab.text = idTab.GetCurrentPageNo();
    if (idTab.GetCurrentPageNo() == "0") 
    {
        dso_tab1.Call('SELECT');
    }
    else 
    {
        dso_tab2.Call('SELECT');
    } 

    
}
function OnPopUp(pos) {
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
function OnPrint() {
    if (txtProject_Pk.text != '') {
        var url = System.RootURL + "/reports/61/03/61030110.aspx?Project_Pk=" + txtProject_Pk.text + '&Project_Cd=' + txtProject_Cd.text + '&Project_Nm=' + txtProject_Nm.text + '&Customer_Pk=' + txtCustomer_Pk.text + '&Customer_Cd=' + txtCustomer_Cd.text + '&Customer_Nm=' + txtCustomer_Nm.text + '&Tab=' + txtTab.GetData();
        System.OpenTargetPage(url);
    }
    else {
        alert('Please select Project !!');
    }
}
</script>
<body>
 <gw:data id="dso_tab1" onreceive=""> 
    <xml> 
        <dso  type="grid"   function="pm_rpt_61030110_1"    > 
            <input bind="Grid_Trans">                    
               <input bind="txtProject_Pk" />
               <input bind="txtCustomer_Pk" />
               <input bind="txtTab" />
            </input> 
            <output bind="Grid_Trans"></output>
        </dso> 
    </xml> 
</gw:data>

 <gw:data id="dso_tab2" onreceive=""> 
    <xml> 
        <dso  type="grid"   function="pm_rpt_61030110_1"    > 
            <input bind="Grid_Book">                    
               <input bind="txtProject_Pk" />
               <input bind="txtCustomer_Pk" />
               <input bind="txtTab" />
            </input> 
            <output bind="Grid_Book"></output>
        </dso> 
    </xml> 
</gw:data>

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
  <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
        <tr style="height:4%">
            <td>
                <fieldset style="padding:0">
                    <table width="100%" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project</a></td>
                            <td width="40%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtProject_Cd"  readonly="true" styles='width:100%' /></td>
                                        <td width="70%"><gw:textbox id="txtProject_Nm"  readonly="true" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="10%"><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer')">Customer</a></td>
                            <td colspan="" width="40%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtCustomer_Cd"  styles='width:100%' readonly="T" /></td>
                                        <td width="70%" ><gw:textbox id="txtCustomer_Nm"  styles='width:100%' readonly="T" /></td>
                                        <td width=""><gw:textbox id="txtCustomer_Pk" styles='width:0%;display:none' /></td>
                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd.text='';txtCustomer_Nm.text='';txtCustomer_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td> 
                            <td><gw:imgbtn id="btnNew" img="search" alt="Search" onclick="OnSearch()" /></td>
                            <td><gw:button id="btnNew" img="excel" text="Print"alt="Print out report" onclick="OnPrint()" /></td>
                        </tr>
                       
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height:96%">
            <td width="100%">
                <gw:tab id="idTab" onpageactivate="OnSearch()">
                <table id="tab1" name="Transaction Amount" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                    <tr>
                        <td>
                            <!--header="0.Project Code|1.Project Name|2.Project Field|3.Customer|4.Description|5.Req. Type|6.Req. No.|7.Date|8.Ccy|9.( Net )|10.( VAT )|11.Deduct Advance|12.Retention|13.( Net )|14.( VAT )|15.Plan Receive|16.Trans AMT (VND)|17.Book AMT (USD)|18.Remark" -->
                            <gw:grid id="Grid_Trans" 
                            header="Request Type|No|Request Date|Percentage|Claimed Amount|VAT|Deduct advance|Retention|Others|Total deduct|Net Receivable|Total Receivable|Net Collected|VAT Collected|Total Collected|Date Collected|Remark" 
                            format="0|0|0|0|1|1|1|1|1|1|1|1|1|0|0|0"
                            aligns="0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0" 
                            defaults="|||||||||||||||" 
                           editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="2000|800|1300|1200|2000|2000|2000|2000|2000|2000|2000|2000|2000|3000|2000|2000" 
                            styles="width:100%; height:100%"
                            sorting="T" 
                            oncelldblclick="" />
                        </td>
                    </tr>
                </table>
                <table id="tab2" name="Booking Amount" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                    <tr>
                        <td>
                            <!--header="0.Project Code|1.Project Name|2.Project Field|3.Customer|4.Description|5.Req. Type|6.Req. No.|7.Date|8.Ccy|9.( Net )|10.( VAT )|11.Deduct Advance|12.Retention|13.( Net )|14.( VAT )|15.Plan Receive|16.Trans AMT (VND)|17.Book AMT (USD)|18.Remark" -->
                            <gw:grid id="Grid_Book" 
                            header="Request Type|No|Request Date|Percentage|Claimed Amount|VAT|Advance deduct|Retention|Others deduct|Total deduct|Net Receivable|Total Receivable|Net Collected|VAT Collected|Total Collected|Date collected|Remark" 
                            format="0|0|0|0|1|1|1|1|1|1|1|1|1|0|1|0|0"
                            aligns="0|1|1|1|0|0|0|0|0|0|0|0|0|0|1|0|0" 
                            defaults="||||||||||||||||" 
                           editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0" 
                            widths="2000|800|1300|1200|2000|2000|2000|2000|2000|2000|2000|2000|2000|3000|2000|2000|2000" 
                            styles="width:100%; height:100%"
                            sorting="T" 
                            oncelldblclick="" />
                        </td>
                    </tr>
                </table>
                </gw:tab>
            </td>
        </tr>
  </table>
<gw:textbox id="txtTab"  styles='width:100%;display:none' readonly="T" />
</body>
</html>