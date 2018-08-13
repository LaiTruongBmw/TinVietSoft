<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project Inquiry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
        System.Translate(document);
	    Grid_Detail.GetGridControl().FrozenCols = 3;
		Grid_Detail.GetGridControl().WordWrap = true;
        Grid_Detail.GetGridControl().RowHeight(0) = 400 ;
        BindingDataList(); 
		Merge_grid();
}   
function BindingDataList()
{
        var ls_Company    = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
        lstCompany.SetDataText(ls_Company);
        lstCompany.value = "<%=session("company_pk") %>";  
        ls_Status = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
        lstProject_Status.SetDataText(ls_Status); 
}    
function OnPopUp(obj)
{
        switch(obj)
        {
              
                case 'Customer':
                            var path = System.RootURL + '/form/61/02/61020020_Customer.aspx';
		                    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		                    if ( object != null )
		                    {
		                        if (object[0] != 0)
                                {
                                        txtCustomer_Cd.SetDataText(object[1]);//customer id
                                        txtCustomer_Nm.SetDataText(object[2]);//customer name
                                        txtCustomer_Pk.SetDataText(object[0]);//customer name
      	                        }
      	                    }
                break;
                case 'PM':
                             var path = System.RootURL + '/form/61/02/61020020_search_emp.aspx';
                            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                            if ( obj != null )
                            {
                                txtPM_Pk.text   = obj[0];
				                txtPM_Cd.text   = obj[1];
				                txtPM_Nm.text = obj[2];
                            }
                break;
                case 'PC':
                             var path = System.RootURL + '/form/61/02/61020020_search_emp.aspx';
                            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                            if ( obj != null )
                            {
                                txtPC_Pk.text   = obj[0];
				                txtPC_Cd.text   = obj[1];
				                txtPC_Nm.text = obj[2];
                            }
                break;
				case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                            } 
                break;
				case 'Exegroup':
					var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0012';
					
					var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');
		 
					if ( obj != null )
					{
					   txtExecution_Division_Cd.text =obj[1];
					   txtExecution_Division_Nm.text =obj[2];
					}
				break;

        } 
}  
function OnSearch()
{
        dso_search.Call("SELECT");
}
function Merge_grid()
{
	if (Grid_Detail.rows < 2)
		{
			
			Grid_Detail.AddRow();
		}
	var fg=Grid_Detail.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
 
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "No"
		
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Project Code"
	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Name"
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Major Owner Name"
		
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "PM"
		
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "PC"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 6, 0, 7) = "Contract Period"  
		fg.Cell(0, 1, 6, 1 ) 	= "Start Date"
		fg.Cell(0, 1, 7, 1) 	= "Exp. Date"
		
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Currency"
		
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "Contract amount(This year)"
		
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Contract amount"
		
        fg.Cell(0, 0, 11, 0, 12) = "Collected"  
		fg.Cell(0, 1, 11, 1 ) 	= "Amount"
		fg.Cell(0, 1, 12, 1) 	= "Rate(%)"
				
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Contract Balance"
		
}
function OnPrint()
{
	if(Grid_Detail.rows > 2)                                                             
		 {
			 var url = '/reports/kp/sm/rpt_kpsm00020_project_status.aspx?p_company_pk='+ lstCompany.value;
				 System.OpenTargetPage( System.RootURL+url , "newform" );  
		}
}
</script>
<body>
 <gw:data id="dso_search" onreceive="Merge_grid()">
        <xml>
            <dso type="grid" function="pm_sel_61020020" >
                <input bind="Grid_Detail">
                        <input bind="lstCompany"/>
                        
                </input>
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
  <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
              <tr style="height:10%">
                            <td>
                                        <fieldset style="padding:0">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                            <td align="right" width="15%">Corporation&nbsp;</td>
                                                                            <td width="35%"><gw:list id="lstCompany"   styles='width:100%'></gw:list></td> 
                                                                            <td style="display:none" align="right" width="15%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
																			<td width="45%" style="display:none">
																					<table cellpadding="0" cellspacing="0" width="100%">
																							<tr>
																										<td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
																										<td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td> 
																										<td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>  
																										<td ><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td> 
																							</tr>
																					</table>
																			</td>  
                                                                           <td ><gw:imgbtn id="btve" img="search" alt="Search"  onclick="OnSearch()" /></td>  
																			<td style="width: 3%" align="right">
																				<gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport3" onclick="OnPrint()" />
																			</td>
                                                                </tr>
                                                                <tr style="display:none">
                                                                            <td align="right" ><a title="Click here to show Customer" href="#" style="text-decoration:none" onClick="OnPopUp('Customer')">Customer&nbsp;</a></td> 
                                                                            <td >
                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                        <td width="40%"><gw:textbox id="txtCustomer_Cd" readonly="true" styles='width:100%' /></td>
                                                                                                        <td width="60%"><gw:textbox id="txtCustomer_Nm" readonly="true" styles='width:100%' /></td> 
                                                                                                        <td><gw:textbox id="txtCustomer_Pk" styles='width:100%;display:none' /></td>  
                                                                                                        <td ><gw:imgbtn id="btjv2" img="reset" alt="Reset"  onclick="txtCustomer_Cd.text='';txtCustomer_Nm.text='';txtCustomer_Pk.text='';" /></td>
                                                                                                        
                                                                                                </tr>
                                                                                        </table> 
                                                                            </td> 
                                                                            <td align="right">Main Contract Date&nbsp;</td> 
                                                                            <td>
                                                                                        <table cellpadding="0" cellspacing="0" width="">
                                                                                                <tr>
                                                                                                            <td width=""><gw:datebox id="dtContractDt_Fr" lang="1"  styles="width:100%" /></td> 
                                                                                                            <td align="center" width="">~</td> 
                                                                                                            <td width=""><gw:datebox id="dtContractDt_To" lang="1" styles="width:100%" /></td>  
                                                                                                </tr>
                                                                                        </table> 
                                                                            </td> 
                                                                </tr> 
                                                                <tr style="display:none">
                                                                                <td align="right"><a title="Click here to show PM" href="#" style="text-decoration:none" onClick="OnPopUp('PM')">PM&nbsp;</a></td>
                                                                                <td>
                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                            <td width="40%"><gw:textbox id="txtPM_Cd" styles='width:100%' /></td> 
                                                                                                            <td width="60%"><gw:textbox id="txtPM_Nm" styles='width:100%' /></td>  
                                                                                                            <td ><gw:textbox id="txtPM_Pk" styles='width:100%;display:none' /></td>    
                                                                                                            <td ><gw:imgbtn id="btjhv2" img="reset" alt="Reset"  onclick="txtPM_Cd.text='';txtPM_Nm.text='';txtPM_Pk.text='';" /></td>
                                                                                                </tr>
                                                                                        </table> 
                                                                            </td> 
                                                                            <td align="right" width="20%"><a title="Click here to show PC" href="#" style="text-decoration:none" onClick="OnPopUp('PC')">PC&nbsp;</a></td>  
                                                                            <td>
                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                            <td width="40%"><gw:textbox id="txtPC_Cd" styles='width:100%' /></td>  
                                                                                                            <td width="60%"><gw:textbox id="txtPC_Nm" styles='width:100%' /></td>  
                                                                                                            <td ><gw:textbox id="txtPC_Pk" styles='width:100%;display:none' /></td>    
                                                                                                            <td ><gw:imgbtn id="btjhvhg2" img="reset" alt="Reset"  onclick="txtPC_Cd.text='';txtPC_Nm.text='';txtPC_Pk.text='';" /></td>
                                                                                                </tr>
                                                                                        </table> 
                                                                            </td>  
                                                                </tr> 
                                                                <tr style="display:none">
                                                                            <td align="right"><a title="Click here to show Execution Group" href="#" style="text-decoration:none" onClick="OnPopUp('Exegroup')">Execution Group&nbsp;</a></td>
                                                                             <td>
                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                            <td width="40%"><gw:textbox id="txtExecution_Division_Cd" styles='width:100%' /></td>  
                                                                                                            <td width="60%"><gw:textbox id="txtExecution_Division_Nm" styles='width:100%' /></td>  
                                                                                                            <td ><gw:textbox id="txtExecution_Division_Pk" styles='width:100%;display:none' /></td>    
                                                                                                            <td ><gw:imgbtn id="btjhvh2" img="reset" alt="Reset"  onclick="txtExecution_Division_Cd.text='';txtExecution_Division_Nm.text='';txtExecution_Division_Pk.text='';" /></td>
                                                                                                </tr>
                                                                                        </table> 
                                                                            </td>  
                                                                            
                                                                            <td align="right" >Project Status&nbsp;</td> 
                                                                            <td ><gw:list id="lstProject_Status"   styles='width:100%' onchange="OnSearch()"></gw:list></td>  
                                                                </tr> 
                                                    </table>
                                        </fieldset>
                            </td>
              </tr>
              <tr style="height:90%">
                            <td>
                            <!--header="0.No|1.Code|2.Project Name|3.Major Owner Name|4.PM|5.PC|6.Start Date|7.Exp. Date|8.Curr. Year Cont. Amt (Supply Amt)|9.Cont. Amt (Supply Amt)|_10.Former Term|_11.Curr. Term|_12.Total|_13.P/P Rate(%)|_14.Adv. Pay. Rcpt|_15.Working Rate(%)" -->
                                        <gw:grid   
                                        id="Grid_Detail"  
                                        header="No|Code|Project Name|Major Owner Name|PM|PC|Start Date|Exp. Date|ccy|Curr. Year Cont. Amt (Supply Amt)|Cont. Amt (Supply Amt)|Collected Amount|Working rate(%)|Balace|_P/P Rate(%)|_Adv. Pay. Rcpt|_Working Rate(%)"   
                                        format  ="0|0|0|0|0|0|0|0|0|1|1|1|1|1|0|0"  
                                         aligns ="1|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0"  
                                        defaults="|||||||||||||||"  
                                        editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        widths  ="500|1500|2500|3000|3000|3000|1200|1200|1000|2000|2000|1500|1500|2000|2000|2000"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"   
                                         /> 
                            </td>
              </tr>  
  </table>
</body>
</html>
