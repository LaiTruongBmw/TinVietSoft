<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var g_pk = 0,
	g_company_pk = 1,
	g_no = 2,
	g_month = 3,
	g_partner_pk = 4,
	g_partner_id = 5,
	g_partner_nm = 6,
	g_interest_rate = 7,
	g_due = 8,
	g_remark = 9
	;
function BodyInit()
{
    BindingData(); 
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
	lstCompany.SetDataText(ls_data);
}
//------------------------------------------------------------------------
function OnPopUp(obj)
{
	switch(obj)
	{
		case 'Customer':
			var path = System.RootURL + '/standard/forms/60/05/60050010_popup_ItemControl.aspx?com_pk=' + lstCompany.GetData();
			var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
			if ( object != null )
			{
				if (object[0] != 0)
				{
					txtPartner_PK.text = object[0];//
					txtPartner_CD.text = object[1];//
					txtPartner_NM.text = object[2];//
				}
			}
		break;
		case 'Customer_grid':
			if(grdDetail.col==g_partner_id||grdDetail.col==g_partner_nm)
			{
				var path = System.RootURL + '/standard/forms/60/05/60050010_popup_ItemControl.aspx?com_pk=' + lstCompany.GetData();
				var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if ( object != null )
				{
					if (object[0] != 0)
					{
						grdDetail.SetGridText(grdDetail.row,g_partner_pk,object[0]);//
						grdDetail.SetGridText(grdDetail.row,g_partner_id,object[1]);//
						grdDetail.SetGridText(grdDetail.row,g_partner_nm,object[2]);//
					}
				}
			}
		break;
	}
}
//------------------------------------------------------------------------------------------
function OnSearch()
{
   dso_update.Call("SELECT");
}
//-------------------------------------------------------------------------------------------

function OnPrint()
{
	
}
function OnDataReceive(obj)
{
		
}

function OnCopy()
{
	dso_copy.Call();
}

function OnNew()
{
	grdDetail.AddRow();
	grdDetail.SetGridText(grdDetail.rows-1,g_company_pk,lstCompany.value);
	grdDetail.SetGridText(grdDetail.rows-1,g_partner_pk,txtPartner_PK.text);
	grdDetail.SetGridText(grdDetail.rows-1,g_partner_id,txtPartner_CD.text);
	grdDetail.SetGridText(grdDetail.rows-1,g_partner_nm,txtPartner_NM.text);
	grdDetail.SetGridText(grdDetail.rows-1,g_month,dtMonth_Fr.value);
	for(i=1;i<grdDetail.rows;i++)
	{
		grdDetail.SetGridText(i,g_no,i);
	}
}

function OnSave()
{
	dso_update.Call();
}	

function OnDelete()
{
	if(confirm('Are you sure you want to delete?'))
	{
		grdDetail.DeleteRow();
		dso_update.Call();
	}
}
</script>
  <body>
     <!------------------------------------------------------------------------>
  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<gw:data id="dso_update" onreceive="">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="ac_sel_60110210" procedure="ac_upd_60110210">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="dtMonth_Fr"/>
                    <input bind="dtMonth_To"/>
					<input bind="txtPartner_PK"/>
                </input> 
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>	
	
<gw:data id="dso_copy" onreceive="alert(txtRtn.text);OnSearch();"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60110210_copy" > 
                <input> 
                    <input bind="lstCompany"/>
                    <input bind="dtMonth_Fr"/>
                </input>  
                <output>  
                     <output bind="txtRtn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
    <!--------------------------------------------------------------------------------------------------->

            <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="width:100%;height:2%">
                   <td>
                        <fieldset >
                             <table width="100%" border="0" cellpadding="1" cellspacing="1" >
							   <tr >
									<td align="right" width="8%" >Company</td>
									<td  colspan="" width="30%"><gw:list id="lstCompany" styles="width:100%" /></td>
									<td align="right" width="8%">Month</td> 
									<td><gw:datebox id="dtMonth_Fr" styles='width:100%'  lang="<%=Session("Lang")%>" type="month" /></td>  
									<td>~</td>
									<td><gw:datebox id="dtMonth_To" styles='width:100%'  lang="<%=Session("Lang")%>" type="month" /></td>
									<td align="right" styles="" width="10%"><a title="Click here to select Partner" onclick="OnPopUp('Customer')" href="#tips">Partner</a></td>
									<td width="44%" colspan=''>
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td width="35%"> <gw:textbox id="txtPartner_CD" text="" styles="width:100%" /></td>
												<td width="65%"><gw:textbox id="txtPartner_NM" text="" styles="width:100%" /><gw:textbox id="txtPartner_PK" styles="display:none; " /></td>
												<td align=""><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="txtPartner_CD.text='';txtPartner_NM.text='';txtPartner_PK.text='';" /></td>
											</tr> 
										</table>
									</td>
									<td align=""  ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
									<td align=""  ><gw:imgbtn img="copy" alt="Copy" id="btnCopy" onclick="OnCopy()" /></td>
									<td align=""  ><gw:imgbtn img="new" alt="New" id="btnNew" onclick="OnNew()" /></td>
									<td align=""  ><gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" /></td>
									<td align=""  ><gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" /></td>
								</tr>
								
							</table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:98%"> 
                    <td >
                    <!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
                                <gw:grid id='grdDetail'
                                    header='_pk|_com_pk|No|Month|_Partner_pk|Partner ID|Partner Name|Interest Rate|Due Date|Remark'
                                    format='0|0|0|0|0|0|0|0|0|0'
									aligns='0|0|1|1|0|0|0|0|0|0'
                                    defaults='|||||||||'
                                   editcol='0|0|0|1|0|0|0|1|1|1'
                                    widths='0|0|0|0|0|0|0|0|0|0'
                                    sorting='T'
                                    styles='width:100%; height:100%'
									autosize="T"
									oncelldblclick="OnPopUp('Customer_grid')"
                                />
                            </td>
                </tr>
                 
            </table>
          
<gw:textbox id="txtUser"  text="" styles="width:100%;display:none" />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
<gw:textbox id="txtRtn"       styles='display:none'/>
  </body>
</html>