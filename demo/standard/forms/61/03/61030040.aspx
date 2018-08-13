<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Main Contract Other Expenses</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
			System.Translate(document);
			BindingDataList();
}
//============================================================================
function BindingDataList()
{
		var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	lstCOMPANY.value = "<%=session("company_pk") %>";
		//Ccy
		<%=ESysLib.SetGridColumnComboFormat("Grid_Bottom", 2,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>; 
		Grid_Bottom.SetComboFormat(4, '#Y;Yes|#N;No');
		var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
		   var arr  = data.split("|");
		   txtbookccy.SetDataText(arr[1]);
		    var ls_ccy          = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
			txtccy.SetDataText(ls_ccy);
		   dso_get_exrate.Call();
}
//============================================================================
function OnPopUp(obj)
{
		switch(obj)
		{
				case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
									OnSearch();
                            } 
                break;
		}	
}
//============================================================================
function OnNew()
{
		if(txtPk.text == '' && txtProject_Hide.text == '')
		{
				alert('Please select a row!!');	
		}
		else
		{
					Grid_Bottom.AddRow();
					Grid_Bottom.SetGridText(Grid_Bottom.rows -1, 6, txtPk.text);
					Grid_Bottom.SetGridText(Grid_Bottom.rows -1, 7, txtProject_Hide.text);
					Grid_Bottom.SetGridText(Grid_Bottom.rows -1, 10, txtContrac_pk.text);
		}
			
}
//============================================================================
function OnDelete()
{
		if(confirm('Are you sure you want to delete ?'))
			Grid_Bottom.DeleteRow();
			dso_update.Call();	
}
//============================================================================
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
			dso_Search.Call('SELECT');
		}
		else
		{
			alert('Please select Project to search !!');	
		}
}
//============================================================================
function OnClick()
{
			txtPk.SetDataText(Grid_Detail.GetGridData(Grid_Detail.row, 3));
			txtProject_Hide.SetDataText(Grid_Detail.GetGridData(Grid_Detail.row, 4));
			txtContrac_pk.SetDataText(Grid_Detail.GetGridData(Grid_Detail.row, 5));
			dso_update.Call('SELECT');
}

function OnSave()
{
		if(!OnCheck())
		{
		
			dso_update.Call();
		}
}

function BookAmt()
{
	    var _Amount = Number(Grid_Bottom.GetGridData(Grid_Bottom.row, 3));
		var ccy = Grid_Bottom.GetGridData(Grid_Bottom.row, 2);
		var tr_rate = Number(txtTR_RATE.text);
		txtccy.value = Grid_Bottom.GetGridData(Grid_Bottom.row, 2);
		
		var _Bk_Amount = 0;
		var _book_rate = Number(txtBookRate.text);
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						OnGetRate();
						_Bk_Amount =	Math.round(_Amount * tr_rate)
				}
				else if(ccy == 'VND')
				{
						_Bk_Amount = Math.round(_Amount / _book_rate );
				}
		}
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Bk_Amount = _Amount ;
				}
				else if(ccy == 'VND')
				{
						_Bk_Amount = Math.round(_Amount / _book_rate);
				}
		}
		Grid_Bottom.SetGridText(Grid_Bottom.row, 9, _Bk_Amount);    
}
function OnDataReceive(obj)
{
		switch(obj.id)	
		{
				case "dso_get_exrate":
				
				break;	
		}
}
function OnGetRate()
{
		dso_get_exrate_list.Call();	
}
function OnCheck()
{
		if(Grid_Bottom.GetGridData(Grid_Bottom.row, 0) == '')
		{
				alert('Please input code !!');
				return false;
		}
		else if(Grid_Bottom.GetGridData(Grid_Bottom.row, 1) == '')
		{
					alert('Please input Item !!');
					return false;
		}
		
}
</script>
<body>
<gw:data id="dso_Search" onreceive="">
    <xml>
        <dso id="1" type="grid"  function="pm_sel_61030040" >
            <input bind="Grid_Detail">
                <input bind="txtProject_Pk"/>
            </input>
            <output bind="Grid_Detail"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_update" onreceive="OnDataReceive(this)">
    <xml>
        <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10" function="pm_sel_61030040_1" procedure="pm_upd_61030040">
            <input bind="Grid_Bottom">
            	<input bind="txtProject_Hide"/>
                <input bind="txtPk"/>
                <input bind="txtContrac_pk"/>
            </input>
            <output bind="Grid_Bottom"/>
        </dso>
    </xml>
</gw:data>

  <gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_get_rate"> 
                <input> 
                	 <input bind="txtUSE_DATE" />
                     <input bind="lstCOMPANY"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    
      <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_get_rate" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtccy"/>
                     <input bind="txtUSE_DATE"/>
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
                     <output bind="txtBK_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
  <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
            <tr style="height:2%">
                            <td width="100%">
                                            <fieldset style="padding:0">
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                                    <td width="15%"></td> 
                                                                                    <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
                                                                                    <td width="50%">
                                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                                <td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                                                                                                <td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td> 
                                                                                                                <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>  
                                                                                                                <td ><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td> 
                                                                                                                <td ><gw:imgBtn id="ibtnUpdte" img="search" alt="Search" 	onclick="OnSearch()" 	 /></td> 
                                                                                                    </tr>
                                                                                            </table>
                                                                                    </td>
                                                                                    <td width="15%"></td> 
                                                                                    
                                                                    </tr>
                                                        </table>
                                            </fieldset>
                            </td>
            </tr>
            <tr style="height:48%">
                        <td colspan="4">
                                    <gw:grid   
                                                    id="Grid_Detail"  
                                                    header="Field|Currency|Total|_pk|_Project_pk|_tecps_undertakectrtrmrk_pk"   
                                                    format  ="0|0|1|0|0|0"  
                                                     aligns  ="0|1|3|0|0|0"  
                                                    defaults="|||||"  
                                                    editcol ="1|1|1|1|1|1"  
                                                    widths  ="3000|1000|2000|0|0|0"  
                                                    styles="width:100%; height:100%"   
                                                    sorting="T"
                                                    oncellclick="OnClick()"
                                                     /> 
                        </td>
            </tr> 
            <tr height="2%">
            			<td>
                        		<fieldset style="padding:0">
                                			<table cellpadding="0" cellspacing="0" width="100%">
                                            		<tr>
                                                    			<td width="100%"></td>
                                                                <td ><gw:imgBtn id="ibtnUpdte" img="create" alt="Item Create"  styles='width:100%;display:none'	onclick="" 	 /></td>  
                                                                <td ><gw:imgBtn id="ibtnUpdate" img="new" alt="New" 	onclick="OnNew()" 	 /></td> 
                                                                <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="Save" 	onclick="OnSave()" 	 /></td> 
                                                                <td ><gw:imgBtn id="ibtnUpdate" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td> 
                                                                <td style="display:none"><gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;display:none' /></td>
                                                    </tr>
                                            </table>
                                </fieldset>
                        </td>
            </tr>
            <tr style="height:48%">
                        <td width="100%">
                                    <gw:grid   
                                                    id="Grid_Bottom"  
                                                    header="Code|All Expenditures Item|Currency|Amount|Sfty Cost (Y/N)|Remarks|_Master_pk|_Project_pk|_pk|_Book_Amt|_tecps_undertakectrtrmrk_pk"   
                                                    format  ="0|0|0|1|0|0|0|0|0|0|0"  
                                                     aligns  ="0|0|1|3|1|0|0|0|0|0|0"  
                                                    defaults="||USD||||||||"  
                                                    editcol ="1|1|1|1|1|1|1|1|1|1|1"  
                                                    widths  ="1500|3000|1000|2000|1500|3000|0|0|0|0|0"  
                                                    styles="width:100%; height:100%"   
                                                    sorting="T"
                                                    onafteredit="BookAmt()"
                                                     /> 
                        </td>
            </tr> 
            <tr>
            			<td><gw:textbox id="txtPk"  styles='width:100%;display:none' /></td>
                        <td><gw:textbox id="txtProject_Hide"  styles='width:100%;display:none' /></td>
                        
                         <td><gw:list id="lstCOMPANY" styles='width:100%;display:none' /></td>
                          <td><gw:textbox id="txtbookccy" styles='width:100%;display:none' /></td>
                          <td><gw:textbox id="txt_row" styles='display:none' /></td>
                          <td ><gw:textbox id="txtBookRate" styles='width:100%;display:none' /></td>
                             <td><gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' />
                         <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
                          <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
                          <gw:textbox id="txtContrac_pk" styles="width:100%;display:none" /></td>
                          <td></td>
                          <td ></td>
            </tr>
  </table>

</body>
</html>
