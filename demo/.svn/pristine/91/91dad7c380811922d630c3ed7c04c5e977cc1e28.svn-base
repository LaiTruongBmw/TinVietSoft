<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var user_id = "<%=Session("LOGIN_ID")%>"; 
function BodyInit()
{
    System.Translate(document);
    var ls_compk = "<%=Request.querystring("compk")%>";
    txtLang.SetDataText(v_language);
    BindingDataList();
    txt_compk.SetDataText(ls_compk);
    lst_trgrp.SetDataText('');
    txtUser_id.SetDataText(user_id);
    OnSearch();
}

function BindingDataList()
{ 
    var AdminYN    = "<%=Session("CODEADMIN_YN")%>";
    txt_useyn.text = AdminYN;
    if (AdminYN == 'Y')
    {
        var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0070' AND A.USE_IF = 1 ORDER BY ORD")%>";
    }
    else if (AdminYN == 'N')
    { 
        var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0070' AND A.USE_IF = 1 AND A.SYS_YN = 'N' ORDER BY ORD")%>";
    }
    lst_trgrp.SetDataText(ls_data);
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	window.returnValue = code_data; 
	this.close();
}
 
function Select()
{
    var code_data=new Array();
	var ctrl = idGrid.GetGridControl();
	if (ctrl.SelectedRows == 0)
	{
	   alert('    Please select transaction!!!'+'\n'+'Bạn hãy chon loại giao dịch!!!');
	   return;
	}
	else
	{
		var tmp= new Array();
		var k = 0;
		for(j=0; j<idGrid.cols -1 ; j++)
		{
			tmp[j] = idGrid.GetGridData(ctrl.row, j);
		}
		code_data[k] = tmp;
		k = k + 1;
        for(i = 1; i < idGridDr.rows; i++)
		{
			if(idGridDr.GetGridData(i,2)== '-1')
			{
				var tmp1 = new Array();
				tmp1[0] = "D";
		        for(j=1;j<idGridDr.cols;j++)
				{
					tmp1[j] = idGridDr.GetGridData(i,j-1);
				}
				code_data[k] = tmp1;
				k = k + 1;
			}
		}
		for(i = 1; i < idGridCr.rows; i++)
		{
			if(idGridCr.GetGridData(i,2)== '-1')
			{
				var tmp2 = new Array();
				tmp2[0] = "C";
				for(j=1;j<idGridCr.cols;j++)
				{
					tmp2[j] = idGridCr.GetGridData(i,j-1);
				}
				code_data[k] = tmp2;
				k = k + 1;
			}
		}
		/*for(i=0;i<k;i++)
		{
			var tmp3= new Array();
			tmp3 = code_data[i];
			for(j=0;j<tmp3.length;j++)
			{
			    alert('a['+ i + ';'+ j+']= '+ tmp3[j]);
			}
		}*/
		window.returnValue = code_data;
		this.close();
	}
}

function OnSearch()
{
    dso_sel_trans.Call("SELECT");
}

function OnClickGrid()
{
    if (idGrid.selrow == -1)
    {
        return;
    }
    if ((idGrid.rows > 1) && (idGrid.selrow < idGrid.rows))
	{
        txt_PK.text = idGrid.GetGridData(idGrid.selrow, 0);
        txt_code.text = idGrid.GetGridData(idGrid.selrow, 1);
        txt_name.text = idGrid.GetGridData(idGrid.selrow, 2);
        txt_DRCR.SetDataText('D');
        dso_sel_trans_debit.Call('SELECT');
    }
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_trans_debit":
            txt_DRCR.SetDataText('C');
            dso_sel_trans_credit.Call('SELECT');
        break;
    }
}

</script>

<body>
    <gw:data id="dso_sel_trans">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4" function="ac_sel_60090010_transgroup">
                <input bind="idGrid" >
                    <input bind="lst_trgrp"/>
                    <input bind="txt_transcode"/>
                    <input bind="txt_transname"/>
                    <input bind="txt_accountcode"/>
                    <input bind="txt_compk"/>
                    <input bind="txt_useyn"/>
                    <input bind="txtUser_id"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_sel_trans_debit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2" function="ac_sel_60090010_account_drcr">
                <input bind="idGridDr" >
                    <input bind="txt_code"/>
                    <input bind="txt_name"/>
                    <input bind="txt_DRCR"/>
                    <input bind="txt_compk"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="idGridDr" />
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_trans_credit">
        <xml>
            <dso type="grid" parameter="0,1,2" function="ac_sel_60090010_account_drcr">
                <input bind="idGridCr">
                    <input bind="txt_code"/>
                    <input bind="txt_name"/>
                    <input bind="txt_DRCR"/>
                    <input bind="txt_compk"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="idGridCr"/>
            </dso>
        </xml>
    </gw:data>

<table  border="1" width="100%" height="100%" cellpadding="0" cellspacing="0" >
<tr> 
    <td width="100%" height="100%">
        <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
            <tr height="15%">
	            <td>
			        <table cellpadding="0" cellspacing="0" width="100%" height="100%">
						<tr>
							<td width="13%" align="center"><b><gw:label id="idcode3" styles="width:100%;height:" text ="Transaction Group"/> </b></td>
                            <td width="18%"><gw:list id="lst_trgrp" onChange="OnSearch()" styles='width:100%' value ="0"></gw:list></td>
							<td width="10%" align="center"><b><gw:label id="idcode1" styles="width:80%;height:" text ="Trans Code"/></b>&nbsp;</td>
							<td width="12%"><gw:textbox id="txt_transcode" styles="width:100%;" onenterkey="OnSearch()"/></td>
							<td width="10%" align="center"><b><gw:label id="idname1" styles="width:80%;height:" text ="Trans Name"/></b>&nbsp;</td>
							<td width="12%"><gw:textbox id="txt_transname" styles="width:100%;" onenterkey="OnSearch()"/></td>
							<td width="10%" align="center"><b><gw:label id="idcode2" styles="width:80%;height:" text ="Account Code"/></b>&nbsp;</td>
							<td width="12%"><gw:textbox id="txt_accountcode" styles="width:100%;" onenterkey="OnSearch()"/></td>
						</tr>
					</table>
		        </td>
	    	</tr>
	    	
	    	<tr height="80%"> 
	    		<td width="100%">
	    			<table width="100%" height="100%" border="1">
	    				<tr>
					    	<td height="80%" width="30%">   
								<gw:grid
									id="idGrid"  
									header="_pk|Trans Code|Trans Name|_SLIPREMARKENG|_SLIPREMARKLOCAL"
									format="0|0|0|0|0"  
									aligns="0|0|0|0|0"  
									defaults="||||"  
									editcol="0|0|0|0|0"
									widths="0|1200|2000|0|0"  
									styles="width:100%; height:100%"   
									sorting="T"   
									param="0,1,2,3,4"  
									oncellclick="OnClickGrid()" 
									/> 					    		    
				            </td>
							<td height="80%" width="35%">   
								<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
                                <tr>
								    <td width="50%">
									    <table width="100%" height="100%">
										    <tr>
											    <td width="70%" height="20">&nbsp&nbsp<b><gw:label id="iddebit" text="Debit" /></b></td>
											    <td></td>
											    <td></td>
										    </tr>
									    </table>
								    </td>
                                </tr>
								<tr width="100%" height="100%">
								    <td width="50%" height="100%">
								        <gw:grid
									        id="idGridDr"
									        header  ="_Pk|_Acc_pk|CHK|_REF|Account Code|Account Name|_ccy|_rate|_Amt_trans|_Amt_book|_Decription|_LDecription|_Expense Type|_m_pk|_ODR|_DRCR"
                                            format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0"
                                            aligns  ="0|0|1|1|0|0|1|1|3|3|0|0|0|0|0|0"
                                            defaults="||||||VND|||||||||"
                                            editcol ="0|0|1|1|0|0|0|1|1|1|1|1|1|0|0|0"
                                            widths  ="0|0|500|0|1500|3500|1000|1000|2000|2000|3000|3000|1000|1000|1000|800"
                                            styles  ="width:100%; height:100%"   
                                            sorting ="T"   
                                            />
									</td>
								</tr>
                                </table>    		    
                            </td>
				            <td height="80%" width="35%">
				                <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
                                <tr>
				                    <td width="50%">
										<table width="100%" height="100%">
											<tr>
												<td width="70%" height="20">&nbsp&nbsp<b><gw:label id="idcredit" text="Credit" /></b></td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</td>
                                </tr>
                                <tr width="100%" height="100%">
                                    <td width="50%" height="100%">	 
										<gw:grid
											id="idGridCr"
											header  ="_Pk|_Acc_pk|CHK|_REF|Account Code|Account Name|_ccy|_rate|_Amt_trans|_Amt_book|_Decription|_LDecription|_Expense Type|_m_pk|_ODR|_DRCR"
                                            format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0"
                                            aligns  ="0|0|1|1|0|0|1|1|3|3|0|0|0|0|0|0"
                                            defaults="||||||VND|||||||||"
                                            editcol ="0|0|1|1|0|0|0|1|1|1|1|1|1|0|0|0"
                                            widths  ="0|0|500|1000|1500|3500|1000|1000|2000|2000|3000|3000|1000|1000|1000|800"
                                            styles  ="width:100%; height:100%"   
                                            sorting ="T"   
                                            />
									</td>
                                </tr>
                                </table>
				            </td>
		            	</tr>
						
		            </table>
            	</td>
	    	</tr>
	    	
		    <tr height="5">
				<td>
			        <table class="table" border=0 cellspacing="0" cellpadding="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td>
					    	<table>
					    	    <tr>
									<td><gw:icon id="BtnOK"     img="in" text="OK"    styles="width:100"  onclick="Select()" /></td> 
									<td><gw:icon id="BtnCancel" img="in" text="EXIT"  styles="width:100"  onclick="OnCancel()" /></td> 
								</tr>
							</table>	
						</td>	
					</tr>
				    </table>
				</td>
			</tr>
		</table>  
    </td>
</tr>
</table>

<gw:textbox id="txt_compk"  styles="width:100%;display:none"/>
<gw:textbox id="txt_PK"     styles="width:100%;display:none"/>
<gw:textbox id="txt_code"   styles="width:100%;display:none"/>
<gw:textbox id="txt_name"   styles="width:100%;display:none"/>
<gw:textbox id="txt_DRCR"   styles="width:100%;display:none"/>
<gw:textbox id="txt_useyn"  styles="width:100%;display:none"/>
<gw:textbox id="txtLang"    style="display:none" />
<gw:textbox id="txtUser_id"    style="display:none" />

</body>
</html>
