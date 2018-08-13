<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';

var REVISION = 0,
    APPROVAL_REQUEST_NO = 1,
    CONTRACT_CCY = 2,
    BUDGET_CCY = 3,
    EX_RATE = 4,
    TRANS_AMT = 5,
    BOOK_CCY = 6,
    BOOK_EX_RATE = 7,
    STATUS = 8,
    APPROVED_DATE = 9,
    CREATE_DATE = 10,
    DRAFTER = 11,
    PK = 12
    ;
//===================================================================================================================
function BodyInit()
{
      System.Translate(document);
	  BindingDataList();
      MergeHeader();  
      dso_update.StatusInsert();
	  Insert = 'T';
	  Grid_Detail.GetGridControl().FrozenCols = 3;
	  Grid_Detail.GetGridControl().WordWrap = true;
      Grid_Detail.GetGridControl().RowHeight(0) = 450 ;
	  button_status('Approved');
}
//====================================================================================================================
function BindingDataList()
{
	//commancode con thieu -->them vao loi vi -->vao file word ghi chu xem 
	ls_Working_Desc = "<%=ESysLib.SetListDataFUNC("SELECT ac_GET_COMMONCODE('TPS0026') FROM DUAL")%>";
	lstBudget_Description.SetDataText(ls_Working_Desc);	
	var ls_Contract_Ccy = "<%=ESysLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>";
	lstContract_Ccy.SetDataText(ls_Contract_Ccy); 
	lstBudget_Ccy.SetDataText(ls_Contract_Ccy); 
	lstBook_Ccy.SetDataText(ls_Contract_Ccy); 
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCompany.SetDataText(ls_company);
	lstCompany.value = "<%=session("company_pk") %>";
	OnChangeCurrent('contract');
}
//====================================================================================================================
function MergeHeader()
{
	var fg=Grid_Contract.GetGridControl(); 	
	if(fg.Rows < 2)
	{
	   Grid_Contract.AddRow();     
	}    
	fg.FixedRows = 2
	fg.MergeCells =5	
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 2, 0, 4)  = "Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, 2, 1, 2) = "Transaction amt."
	fg.Cell(0, 1, 3, 1, 3) = "Exchg Rate" 
	fg.Cell(0, 1, 4, 1, 4) = "booking Amt." 
	
	fg.Cell(0, 0, 5, 0, 7)  = "Working"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, 5, 1, 5) = "Transaction amt."
	fg.Cell(0, 1, 6, 1, 6) = "Exchg Rate" 
	fg.Cell(0, 1, 7, 1, 7) = "Bookng Amt." 
	fg.MergeCol(0) = true
	fg.Cell(0, 0, 0, 1, 0) = "Description"	
	fg.MergeCol(1) = true
	fg.Cell(0, 0, 1, 1, 1) = "Currency"	
}
//====================================================================================================================
function OnChangeCurrent(obj)
{
    switch(obj)
    {
        case 'contract':
            dso_get_rate.Call();
        break;
        case 'budget':
            dso_Budget_Ccy.Call();
        break;
        case 'book':
            dso_Book_Ccy.Call();
        break;
    }
} 

//====================================================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
			case 'Project':
                            var fpath = System.RootURL + "/form/61/04/61040020_popup_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
									txtProject_Pk1.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_version.Call();
                            } 
                break;
				case 'Revision':
					var path = System.RootURL + '/form/61/04/61040010_popup_1.aspx?code=TPS0025';
					var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					 if (object != null )
					 {
						 lstRevision_Type.SetDataText(object[1]);
					 }
				break;
				case 'Budget_Description':
					var path = System.RootURL + '/form/61/04/61040010_popup_1.aspx?code=TPS0026';
					var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
					 if (object != null )
					 {
						 lstBudget_Description.SetDataText(object[1]);
					 }
				break;
				case 'Prepared_By':
					var path = System.RootURL + '/form/61/04/61040010_popup_search_emp.aspx';
					var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		 
					if ( obj != null )
					{
						txtPrepared_By_Nm.text = obj[2];
						txtPrepared_By_Pk.text   = obj[0];
						txtPrepared_By_Cd.text   = obj[1];
					}
				break;         

		}
}
//====================================================================================================================
function OnNew()
{
		if(txtProject_Pk1.text != '')
		{
					dso_update.StatusInsert();
					 Insert = 'T';
					 button_status('Saved');
		}
		else
		{
				alert('Please select Project !!');	
				return false;
		}
}
//====================================================================================================================
function OnSave()
{
					if(Grid_Detail.rows  == 1)
					 {
							txtSerial_No.SetDataText(0);
							txtRevision_No.SetDataText(0);
					 }
					 else
					 {
						 	 var Serial_No	= 0;
							 var Change_SN = 0;
							 var i=0;
							if(Grid_Detail.rows>1)
							{
									var g221 =  Number(Grid_221.GetGridData(Grid_221.rows -1, 0));
									if(!isNaN(g221))
									{
	   									 g221 = Number(g221);
									}
									else
									{
											g221 = 0;
									}
									Change_SN = 1 + Number(Grid_Detail.GetGridData(Grid_Detail.rows -1, REVISION));	
									 if(Number(Grid_Detail.GetGridData(Grid_Detail.rows -1, REVISION)) >  g221  )
									 {
											 txtSerial_No.SetDataText(1 + Number(Grid_Detail.GetGridData(Grid_Detail.rows -1, REVISION) ));
											  //alert(txtSerial_No.text);
									 }
									 else
									 {
											txtSerial_No.SetDataText(Number(g221  + 1 ));
									 }
							} 
							else
							{
									return ;	
							}
							txtRevision_No.SetDataText(Change_SN);
					 }
			txtProject_Pk.SetDataText(txtProject_Pk1.text);
			txtBudget_No.SetDataText(lstBudget_Description.value+ '.' + txtRevision_No.text+ '.' + '0');
            if(lstVersion_No.value!='')
            {
			    dso_update.Call();
            }
            else
            {
                alert('Please create main contract version first !!');
            }
}
//====================================================================================================================
function OnSearch()
{
		if(txtProject_Pk1.text != '')
		{
				dso_search.Call("SELECT");
		}
		else
		{
				alert('Please select a Project !!');	
		}
}
//====================================================================================================================
function OnDelete()
{
	if(confirm('Are you sure you want to delete !!'))
		dso_update.StatusDelete();
		dso_update.Call();
		Delete='T';
}
//====================================================================================================================
function OnClick()
{
	txtPk.SetDataText(Grid_Detail.GetGridData(Grid_Detail.row, 16));
    button_status(Grid_Detail.GetGridData(Grid_Detail.row, 12));
	dso_update.Call("SELECT");
}
//====================================================================================================================
function button_status(p_status)
{
	switch(p_status)
	{
		case "Approved":
			ibtnUpdate.SetEnable(false);
			ibtDelete.SetEnable(false);
		break;
		case "Saved":
		case "":
			ibtnUpdate.SetEnable(true);
			ibtDelete.SetEnable(true);
		break;
	}
}
//====================================================================================================================
function OnDataReceive(obj)
{
		switch (obj.id)
		{
			case "dso_update":
			  if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                 	 Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                  	 dso_search.Call("SELECT");
              }
			  else
			  {
			  		dso_detail.Call("SELECT");
			  }
			break;
			case  "dso_version":
					dso_search.Call("SELECT");
			break;
			case "dso_detail":
					MergeHeader();
					
			break;
			case 'dso_search':
					dso_221.Call("SELECT");
			break;
            case 'dso_get_rate':
                dso_Budget_Ccy.Call();
            break;
            case 'dso_Budget_Ccy':
                dso_Book_Ccy.Call();
            break;
		}
}
//====================================================================================================================
function onBudgetEnter()
{
	var b_amt ;
	if ( Number(txtBook_Ex_Rate.GetData()) != 0)
	{
		 b_amt =  Number(txtBudget_famt.GetData()) * Number(txtBudget_Ex_Rate.GetData()) / Number( txtBook_Ex_Rate.GetData()) ;
		 b_amt = System.Round(b_amt,2);
		 txtBudget_amt.SetDataText(b_amt);
	}
   
}

//====================================================================================================================
</script>

<body>
<!-------1------------------------------------------------------------------------------------->
 <gw:data id="dso_update" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" function="pm_sel_61040020" procedure="pm_upd_61040020" >
      <input>
          <inout bind="txtPk"/>
           <inout bind="txtBudget_No"/>
          <inout bind="lstVersion_No"/>
          <inout bind="lstRevision_Type"/>
          <inout bind="dtEx_Rate"/>
          <inout bind="dtWorking_Period_Fr"/>
          <inout bind="dtWorking_Period_To"/>
          <inout bind="txtPrepared_By_Pk"/>
          <inout bind="txtPrepared_By_Cd"/>
          <inout bind="txtPrepared_By_Nm"/>
          
          <inout bind="txtRemark"/>
          <inout bind="lstBudget_Description"/>
          <inout bind="lstContract_Ccy"/>
          <inout bind="txtRevision_No"/>
          <inout bind="txtEx_Rate"/>
          
          <inout bind="dtContract_Period_Fr"/>
          <inout bind="dtContract_Period_To"/>
          <inout bind="dtWorkingPeriodTarget_Fr"/>
          <inout bind="dtWorkingPeriodTarget_To"/>
          <inout bind="txtRReasonofRevision"/>
          
          <inout bind="txtProject_Pk"/>
          <inout bind="txtSerial_No"/>

          <inout bind="lstBudget_Ccy"/>
          <inout bind="txtBudget_Ex_Rate"/>
          <inout bind="lstBook_Ccy"/>
          <inout bind="txtBook_Ex_Rate"/>
          <inout bind="txtBudget_famt"/>
          <inout bind="txtBudget_amt"/>

      </input>
    </dso>
  </xml>
</gw:data>
<!-----2-------------------------------------------------------------->
<gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"   function="pm_sel_61040020_1" >
                <input bind="Grid_Detail">
                    <input bind="txtProject_Pk1"/>
                </input>
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
<!-----3-------------------------------------------------------------->
 <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="pm_PRO_61040020" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstVersion_No" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>    
<!----4--------------------------------------------------------------->
<gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_PRO_61040020_GET_RATE"> 
                <input> 
                     <input bind="dtEx_Rate"/>
                     <input bind="lstCompany"/>
                     <input bind="lstContract_Ccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtEx_Rate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!---5---------------------------------------------------------------->
<gw:data id="dso_detail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"   function="pm_sel_61040020_2" >
                <input bind="Grid_Contract">
                    <input bind="txtPk"/>
                </input>
                <output bind="Grid_Contract"/>
            </dso>
        </xml>
    </gw:data>
<!---6---------------------------------------------------------------->
  <gw:data id="dso_221" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"   function="pm_sel_61040020_3" >
                <input bind="Grid_221">
                    <input bind="txtProject_Pk1"/>
                </input>
                <output bind="Grid_221"/>
            </dso>
        </xml>
    </gw:data>   
<!--7----------------------------------------------------------------->

<gw:data id="dso_Budget_Ccy" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_PRO_61040020_GET_RATE"> 
                <input> 
                     <input bind="dtEx_Rate"/>
                     <input bind="lstCompany"/>
                     <input bind="lstBudget_Ccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBudget_Ex_Rate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>  
<!---8---------------------------------------------------------------->
<gw:data id="dso_Book_Ccy" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_PRO_61040020_GET_RATE"> 
                <input> 
                     <input bind="dtEx_Rate"/>
                     <input bind="lstCompany"/>
                     <input bind="lstBook_Ccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBook_Ex_Rate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data> 
<!------------------------------------------------------------------->
  <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="20%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                    Project&nbsp;</a></td>
                            <td width="80%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';txtProject_Pk1.text='';" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibtnsearch" img="search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                        <td>
                                            <gw:button id="ibtnnew" img="new" alt="New" onclick="OnNew()" />
                                        </td>
                                        <td>
                                            <gw:button id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                                        </td>
                                        <td>
                                            <gw:button id="ibtDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="15%">
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 38%">
            <td colspan="4">
			 <!--0.Revision|1.Approval Request No.|2.Contract CCY|3.Ex. Rate|4.Contract Amount|5.Book Contract Amt. |6.Budget ccy|7.Budget Ex.Rate|8.Budget Amount|9.Book Ccy|10.Book Ex. Rate|11.Book budget amount|12.Status|13.Approved Date|14.Create Date|15.Drafter|16_pk-->
                <gw:grid id="Grid_Detail" 
                	header="Revision|Approval Request No.|Contract CCY|Ex. Rate|Contract Amount|Book Contract Amt. |Budget ccy|Budget Ex.Rate|Budget Amount|Book Ccy|Book Ex. Rate|Book budget amount|Status|Approved Date|Create Date|Drafter|_pk"
                    format="0|0|0|-2|-2|-2|0|-2|-2|0|-2|-2|0|0|0|0|0" 
                    aligns="0|0|0|3|3|3|0|3|3|0|3|3|0|0|0|0|0" 
                    defaults="||||||||||||||||"
                    editcol="0|0|0|3|3|3|0|3|3|0|3|3|0|0|0|0|0" 
                    widths="900|1200|1000|1000|2000|2000|1000|1000|2000|1000|1000|2000|1000|1200|1200|1200|0"
                    styles="width:100%; height:140%" 
                    sorting="T" 
                    oncellclick="OnClick()"/>
            </td>
        </tr>
        <tr style="height: 10%">
            <td>
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="20%">
                                Budget Statement No</td>
                            <td width="30%">
                                <gw:textbox id="txtBudget_No" readonly="true" styles='width:100%' />
                            </td>
                            <td align="right" width="20%">
                                <a title="Click here to show Working Description" href="#" style="text-decoration:none" onClick="OnPopUp('Budget_Description')">Working Description</a></td>
                            <td width="27%">
                                <gw:list id="lstBudget_Description" onchange="" styles='width:100%'></gw:list>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Main Contract Version No</td>
                            <td width="">
                                <gw:list id="lstVersion_No" onchange="" styles='width:100%'></gw:list>
                            </td>
                            <td align="right">Contract Currency</td>
                            <td width=""><gw:list id="lstContract_Ccy" onchange="OnChangeCurrent('contract')" styles='width:100%' /></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <a title="Click here to show Change Type" href="#" style="text-decoration:none" onClick="OnPopUp('Revision')">Change Type</a></td>
                            <td width="">
                                <gw:list id="lstRevision_Type" styles='width:100%' />
                            </td>
                            <td align="right">
                                Change Serial No.</td>
                            <td width="">
                                <gw:textbox id="txtRevision_No"  readonly="true" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Base Exchange Rate Date</td>
                            <td><gw:datebox id="dtEx_Rate" lang="1" /></td>
                                                           
                            <td align="right">
                                Exchage Rate</td>
                            <td width="">
                                <gw:textbox id="txtEx_Rate"  format="#,###,###,###,###,###,###" type="number"  styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Working Period</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <gw:datebox id="dtWorking_Period_Fr" lang="1" />
                                        </td>
                                        <td align="center">
                                            ~</td>
                                        <td width="">
                                            <gw:datebox id="dtWorking_Period_To" lang="1" />
                                        </td>
                                        <td width="100%"></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">Budget Ccy</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:list id="lstBudget_Ccy" onchange="OnChangeCurrent('budget')" styles='width:100%' /></td>
                                        <td width="40%" align="right">Ex.Rate&nbsp;</td>
                                        <td width="30%"><gw:textbox id="txtBudget_Ex_Rate"  format="#,###,###,###,###,###,###" type="number"  styles='width:100%' /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Contract Period</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td><gw:datebox id="dtContract_Period_Fr" lang="1" /></td>
                                        <td>~</td>
                                        <td width=""><gw:datebox id="dtContract_Period_To" lang="1" /></td>
                                        <td width="100%"></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">Book Ccy</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:list id="lstBook_Ccy" onchange="OnChangeCurrent('book')" styles='width:100%' /></td>
                                        <td width="40%" align="right">Book Ex.Rate&nbsp;</td>
                                        <td width="30%"><gw:textbox id="txtBook_Ex_Rate"  format="#,###,###,###,###,###,###" type="number"  styles='width:100%' /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
						<tr>
						   <td></td>
						   <td></td>
						   <td align="right">Budget amount</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td><gw:textbox id="txtBudget_famt"  format="#,###,###,###,###,###,###" onenterkey="onBudgetEnter()" type="number"  styles='width:100%' /></td>
                                        <td><gw:textbox id="txtBudget_amt"  format="#,###,###,###,###,###,###.##" type="number"  styles='width:100%' /></td>
                                     </tr>
                                </table>
                            </td>
						
						</tr>
                        <tr>
                            <td align="right"><a title="Target Construction Period" style="color:#333" >Target Const. Per.</a></td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <gw:datebox id="dtWorkingPeriodTarget_Fr" lang="1" />
                                        </td>
                                        <td>
                                            ~</td>
                                        <td width="">
                                            <gw:datebox id="dtWorkingPeriodTarget_To" lang="1" />
                                        </td>
                                        <td width="100%"></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="">
                                <a title="Click here to show Drafter" href="#" style="text-decoration: none" onClick="OnPopUp('Prepared_By')">
                                    Drafter&nbsp;</a></td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtPrepared_By_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtPrepared_By_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtPrepared_By_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btv7e2" img="reset" alt="Reset" onclick="txtPrepared_By_Cd.text='';txtPrepared_By_Nm.text='';txtPrepared_By_Pk.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">Special Matters</td>
                            <td width=""><gw:textarea id="txtRemark" styles='width:100%;height:50' /></td>
                            <td align="right" valign="top">Compilation Reason</td>
                            <td width=""> <gw:textarea id="txtRReasonofRevision" styles='width:100%;height:50' /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 50%">
           
                <td width="100%">
                <!--header="0.Description|1.Curr.|2.Key Curr.|3.Corp. Curr. Convr. Exchg Rate|4.Corp. Curr. Convr. Amt|5.Key Curr.|6.Corp. Curr. Convr. Exchg Rate|7.Corp. Curr. Convr. Amt" -->
                                <gw:grid   
                                id="Grid_Contract"  
                                header="Description|Curr.|Key Curr.|Corp. Curr. Convr. Exchg Rate|Corp. Curr. Convr. Amt|Key Curr.|Corp. Curr. Convr. Exchg Rate|Corp. Curr. Convr. Amt"
                                editcol ="0|0|0|0|0|0|0|0"  
                                format  ="0|0|1|1|1|1|1|1" 
                               aligns="0|0|3|3|3|3|3|3" 
                                defaults="|||||||"
                                widths  ="3000|1000|2000|1200|2000|2000|1200|2000"  
                                styles="width:100%; height:100%"   
                                sorting="T"
                                 />
            		</td>
        </tr>
         <tr style="height: ;display:none" >
            <td colspan="">
                <gw:grid id="Grid_221" 
                	header="S/No.|Approval Request No.|Change Times (Serial No.)|Corporation Ccy Conversion|Working Corporation Ccy Conversion Amt|Approval Status|Approved Date|Draw-up Date|Drafter|_pk|_TECPS_PERFORMCOSTRMRK_PK"
                    format="0|0|0|0|1|0|0|0|0|0|0" 
                    aligns="1|0|0|0|3|0|0|0|0|0|0" 
                    defaults="||||||||||"
                    editcol="1|1|1|1|1|1|1|1|1|1|1" 
                    widths="800|2000|2500|2500|3700|1500|1500|1500|1500|0|0"
                    styles="width:100%; height:100%" 
                    sorting="T" 
                    oncellclick="OnClick()"/>
            </td>
        </tr>
        <tr style="display:none">
        			<td> <gw:textbox id="txtSerial_No" styles='width:100%;display:' />
    <gw:textbox id="txtPk" styles='width:100%;display:none' />
  <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
  <gw:textbox id="txtProject_Pk1" styles='width:100%;display:none' />
  <gw:list id="lstCompany" styles='display:none;width:100%' />
  <gw:textbox id="txt_row"        styles='display:none'/></td>
        </tr>
    </table>
    

</body>
</html>
