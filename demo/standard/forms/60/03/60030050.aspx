<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var AdminYN;
AdminYN ="<%=Session("CODEADMIN_YN")%>";

var v_language = "<%=Session("SESSION_LANG")%>";
var lb_select = false;
var lb_delete = false;
function BodyInit()
{
        System.Translate(document); 
        SetFalseButton();
        BindingDataList();
        dso_upd_trans.StatusInsert();
        txtTrans_Alias.SetEnable(false);
        txtTrans_code.SetEnable(false);
        txtTrans_Alias.SetDataText(lsttrans_grp.GetData());
       
        txtLang.SetDataText(v_language); 
        txttrcode_search.GetControl().focus();
		//OnSearch();
		txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
}

function SetFalseButton()
{
        btnDeleteD.SetEnable(false);
        btnUnDeleteD.SetEnable(false);
        btnDeleteC.SetEnable(false);
        btnUnDeleteC.SetEnable(false);
}

function BindingDataList()
{ 
var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";

var ls_data3 = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0040','01','') FROM DUAL")%>";
var ls_data4 = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0060','','') FROM DUAL")%>";

if (AdminYN == '')
{
        alert(''+'\n'+'Bạn đã hết phiên giao dịch. Hãy đăng nhập lại, cảm ơn!!!');
        return;
}

if (AdminYN == 'Y')
{
        var ls_data2 = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0070','','') FROM DUAL")%>";
}
else if (AdminYN == 'N')
{ 
		var ls_data2 = "<%=CtlLib.SetListDataFUNC("SELECT SUBSTR(ac_f_commoncode('ACAB0070','',''), 1, INSTR(ac_f_commoncode('ACAB0070','',''), '|Y|SYSTEM') -1) || SUBSTR(ac_f_commoncode('ACAB0070','',''), INSTR(ac_f_commoncode('ACAB0070','',''), '|Y|SYSTEM') + LENGTH('|Y|SYSTEM')) FROM DUAL")%>";
}

        lstCompany.SetDataText(ls_data1);
        lsttrangrp_search.SetDataText(ls_data2);
        lsttrans_grp.SetDataText(ls_data2);
        lstvoucher_evt.SetDataText(ls_data3);
        lstvoucher_type.SetDataText(ls_data4);
}

function OnSearch()
{
    dso_search_trans.Call("SELECT");
}

function AddNew()
{
	
        txtTrans_code.SetEnable(false);
        idGrid_D.ClearData();
        idGrid_C.ClearData();
        lb_select = false;
        lb_delete = false;
        txtGrp_lst_pk_dr.text = "";
        txtAcc_lst_pk_dr.text = "";
        txtGrp_lst_pk_cr.text = "";
        txtAcc_lst_pk_cr.text = "";
        idGridAllDr.ClearData();
        idGridAllCr.ClearData();
        txt_SearchAccDr.text = "";
        txt_SearchAccCr.text = "";
        dso_upd_trans.StatusInsert();
        txttrans_nm.GetControl().focus();
}

function Check_Exists()
{
    if (Number(txtExists.GetData()) > 0)
    {
        alert(' Transaction Code is exists. Please check again!!!'+'\n'+'Transaction Code đã tồn tại. Bạn hãy kiểm tra lại!!!')
        txtTrans_code.GetControl().focus();
        return false;
    }
    return true;
}

function OnSave()
{
    if (On_Check_Control() && Check_Dup_D() && Check_Dup_C() && OnCheck_NullD() && OnCheck_NullC())
    {
        if (rbauto_yn.GetData() == 'Y')
        {
            dso_upd_trans.Call("");
        }
        else
        {
            if (!lb_select)
            {
                dso_sel_exist.Call();
            }
            else
            {
                dso_upd_trans.Call("");
            }
        }
    }
}

function OnDelete()
{
    if (txt_PK.GetData() == "")
    {
        alert('Please select Transaction Code to delete!!!'+'\n'+'Yêu cầu lựa chọn Transaction Code cần xóa!!!');
        return;
    }
    else
    {
        if (confirm(' Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa Transaction Code này?'))
        {
            dso_upd_trans.StatusDelete();
            idGrid_D.ClearData();
            idGrid_C.ClearData();
            lb_delete = true;
            dso_upd_trans.Call("");
        }
    }
}

function On_Check_Control()
{
    if (rbauto_yn.GetData()== 'N')
    {
        if (txtTrans_code.GetData() == '')
        {
            alert(' Transaction Code is not null!!!'+'\n'+'Transaction Code không được rỗng!!!');
            txtTrans_code.GetControl().focus();
            return false;
        }
    }
    if (txttrans_nm.GetData()== '')
    {
        alert(' Transaction Name is not null!!!'+'\n'+'Transaction Name không được rỗng!!!');
        txttrans_nm.GetControl().focus();
        return false;
    }
    return true;
}

function OnClick()
{
    if (idGrid.selrow == -1)
    {
        return;
    }
    if ((idGrid.rows > 1) && (idGrid.selrow < idGrid.rows))
    {
        var ctrl_idGrid = idGrid.GetGridControl();
        txt_PK.text = idGrid.GetGridData(idGrid.selrow, 0);
        lb_select = true;
        lb_delete = false;
        idGrid_D.ClearData();
        idGrid_C.ClearData();
        txtGrp_lst_pk_dr.text = "";
        txtAcc_lst_pk_dr.text = "";
        txtGrp_lst_pk_cr.text = "";
        txtAcc_lst_pk_cr.text = "";
        idGridAllDr.ClearData();
        idGridAllCr.ClearData();
        txt_SearchAccDr.text = "";
        txt_SearchAccCr.text = "";
        dso_upd_trans.Call("SELECT");
    }
}

function OnChange_Control()
{      
    //dso_upd_trans.StatusInsert();
    idGrid_D.ClearData();
    idGrid_C.ClearData();
	txtGrp_lst_pk_dr.text = "";
    txtAcc_lst_pk_dr.text = "";
    txtGrp_lst_pk_cr.text = "";
    txtAcc_lst_pk_cr.text = "";
    idGridAllDr.ClearData();
    idGridAllCr.ClearData();
    txt_SearchAccDr.text = "";
    txt_SearchAccCr.text = "";  
    lsttrangrp_search.SetDataText(lsttrans_grp.GetData());
    txtTrans_Alias.SetDataText(lsttrans_grp.GetData());
    lb_select = false;
    OnSearch();
}

function OnChange_List()
{
    //dso_upd_trans.StatusInsert();
    idGrid_D.ClearData();
    idGrid_C.ClearData();
    txtGrp_lst_pk_dr.text = "";
    txtAcc_lst_pk_dr.text = "";
    txtGrp_lst_pk_cr.text = "";
    txtAcc_lst_pk_cr.text = "";
    idGridAllDr.ClearData();
    idGridAllCr.ClearData();
    txt_SearchAccDr.text = "";
    txt_SearchAccCr.text = ""; 
    lsttrans_grp.SetDataText(lsttrangrp_search.GetData());
    txtTrans_Alias.SetDataText(lsttrangrp_search.GetData());
    lb_select = false;
    OnSearch();
}

function OnChange_Auto()
{
    if (rbauto_yn.GetData() == 'Y')
    {
        txtTrans_code.SetEnable(false);
    }
    else
    {
        txtTrans_code.SetEnable(true);
        txtTrans_code.GetControl().focus();
    }
}

function AddRow_D()
{
    /*if (txt_PK.GetData() == '')
    {
    alert('You must select Transaction Code first!!!', '\n'+'Bạn hãy chọn Transaction Code trước!!!')
    return;
    }
    else
    {*/
        idGrid_D.AddRow();
    //}
}

function AddRow_C()
{
    /*if (txt_PK.GetData() == '')
    {
    alert('You must select Transaction Code first!!!', '\n'+'Bạn hãy chọn Transaction Code trước!!!')
    return;
    }
    else
    {*/
        idGrid_C.AddRow();
    //}
}

function Check_Dup_D()
{
    var ctrl = idGrid_D.GetGridControl();
    var lb_exist;
    var i;

    i = 1;
    lb_exist = true;
    while ((i < ctrl.Rows -1) && (lb_exist))
    {
        j = i + 1;
        while ((j < ctrl.Rows) && (lb_exist))
        {
            var codei = idGrid_D.GetGridData(i, 2);
            var codej = idGrid_D.GetGridData(j, 2);
            if (codei == codej)
            {
                lb_exist = false;
                alert('Code row '+ j +' in debit is exists!!!'+'\n'+'Code hàng '+ j + ' ở bên nợ đã tồn tại!!!');
                return false;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return true;
}

function OnCheck_NullD()
{
    var codei;
    var ctrl = idGrid_D.GetGridControl();
    var lb_exist;
    var i;

    i = 1;
    lb_exist = true;
    while ((i < ctrl.Rows) && (lb_exist))
    {
        codei = idGrid_D.GetGridData(i, 2);
        if (codei == "")
        {
            lb_exist = false;
            alert('Code row '+ i +' in Debit is not null!'+'\n'+'Code hàng '+ i + ' không được rỗng!');
            return false;
        }
        i = i + 1;
    }
    return true;
}

function OnCheck_NullC()
{
    var codei;
    var ctrl = idGrid_C.GetGridControl();
    var lb_exist;
    var i;

    i = 1;
    lb_exist = true;
    while ((i < ctrl.Rows) && (lb_exist))
    {
        codei = idGrid_C.GetGridData(i, 2);
        if (codei == "")
        {
            lb_exist = false;
            alert('Code row '+ i +' in Credit is not null!'+'\n'+'Code hàng '+ i + ' không được rỗng!');
            return false;
        }
        i = i + 1;
    }
    return true;
}

function Check_Dup_C()
{
    var ctrl = idGrid_C.GetGridControl();
    var lb_exist;
    var i;

    i = 1;
    lb_exist = true;
    while ((i < ctrl.Rows -1) && (lb_exist))
    {
        j = i + 1;
        while ((j < ctrl.Rows) && (lb_exist))
        {
            var codei = idGrid_C.GetGridData(i, 2);
            var codej = idGrid_C.GetGridData(j, 2);
            if (codei == "")
            {
                lb_exist = false;
                alert('Code row '+ i +' is not null!'+'\n'+'Code hàng '+ i + ' không được rỗng!');
                return false;

            }
            if (codej == "")
            {
                lb_exist = false;
                alert('Code row '+ j +' is not null!'+'\n'+'Code hàng '+ j + ' không được rỗng!');
                return false;
            }
            if (codei == codej)
            {
                lb_exist = false;
                alert('Code row '+ j +' in credit is exists!!!'+'\n'+'Code hàng '+ j + ' ở bên có đã tồn tại!!!');
                return false;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return true;
}

function OnDataReceive(p_oData)
{
switch(p_oData.id)
{
    case "dso_search_trans":
        if (lb_delete)
        {
       // dso_upd_trans.StatusInsert();
        lb_delete = false;
        lb_select = false;
        }
    break;

    case "dso_sel_exist":
        if (Check_Exists())
        {
        dso_upd_trans.Call("");
        }
    break;

    case "dso_upd_trans":
        if (lb_delete)
        {
			dso_search_trans.Call("SELECT");
        }
        else
        {
	        OnCheck_Debit();
	        OnCheck_Credit();
	        OnSave_Detail_Debit();
        }
    break;

    case "dso_upd_stardard_d":
        OnSave_Detail_Credit();
    break;

    case "dso_upd_stardard_c":
        SetFalseButton();
        if (!lb_select)
        {
            dso_search_trans.Call("SELECT");
        }
        else
        {
        SearchAccountInDr();
        } 
    break;

    case "datGetAllAccountDR":
		SearchAccountInCr();
    break;
    case "datGetAllAccountCR":

    break;
}
}

function RowClick_D()
{
    if (idGrid_D.rows < 2) 
    {
     return;
    }
    else
    {
        if ((event.col == 2) || (event.col == 3))
        {
            TabPopUp( txt_PK.GetData(), "D");
           
        /*
        if ( idGrid_D.GetGridData( idGrid_D.row, 1) == -1)
        {
        TabPopUp("ACNT.SP_SEL_POPUP_ACCOUNT_GROUP", txt_PK.GetData(), "D", "1");
        }
        else
        {
        TabPopUp("ACNT.SP_SEL_POPUP_ACCOUNT_CODE", txt_PK.GetData(), "D", "0");
        }
        */
        }
    }
}

function RowClick_C()
{
    if (idGrid_C.rows < 2) 
    {
        return;
    }
    else
    {
        if ((event.col == 2) || (event.col == 3))
        {
        TabPopUp( txt_PK.GetData(), "C");
        
        /*
        if (idGrid_C.GetGridData(idGrid_C.row, 1) == -1)
        {
        TabPopUp("ACNT.SP_SEL_POPUP_ACCOUNT_GROUP", txt_PK.GetData(), "C", "1");
        }
        else
        {
        TabPopUp("ACNT.SP_SEL_POPUP_ACCOUNT_CODE", txt_PK.GetData(), "C", "0");
        }
        */
        }
    }
}

function TabPopUp(trans_grp, drcr_type)
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030050_popup.aspx?company_pk="+lstCompany.value+'&transaction_pk='+lsttrangrp_search.value+'&slip_pk='+txt_PK.text+'&drcr_type='+drcr_type;
    aValue = System.OpenModal( fpath , 850 , 550 , 'resizable:yes;status:yes');
    if(aValue !=null)
    {
        if (drcr_type == 'D')
        {
	         //idGrid_D.RemoveRowAt(idGrid_D.selrow);
	        var  rowcrr = 1; 
	        for(i=0; i<aValue.length; i++)
	        {
		        var tmp = aValue[i];
		        if (tmp.length >0)
		        {
			        if (tmp[0] != "")
			        {
			            if(i==0)
			            {
			                 rowcrr =  idGrid_D.selrow;
			                 if( idGrid_D.GetGridData(rowcrr,0) =="")
			                 {
			                        idGrid_D.RemoveRowAt(idGrid_D.selrow);
			                        idGrid_D.AddRow();
			                        rowcrr = idGrid_D.rows - 1;
			                 }
			            }
			            else
			            {
			                idGrid_D.AddRow();
			                rowcrr = idGrid_D.rows - 1;
			            }
				        idGrid_D.SetGridText(rowcrr, 2, tmp[2]);
				        idGrid_D.SetGridText(rowcrr, 3, tmp[3]);
				        idGrid_D.SetGridText(rowcrr, 4, drcr_type);
				        idGrid_D.SetGridText(rowcrr, 7, txt_PK.GetData());
				        if (tmp[0] == "G")//Group
				        {
					        idGrid_D.SetGridText(rowcrr, 6, "");
					        idGrid_D.SetGridText(rowcrr, 8, tmp[1]);
					        idGrid_D.SetGridText(rowcrr, 1, "-1");
				        }
				        else if (tmp[0] == "C")//Code
				        {
					        idGrid_D.SetGridText(rowcrr, 6, tmp[1]);
					        idGrid_D.SetGridText(rowcrr, 8, "");
					        idGrid_D.SetGridText(rowcrr, 1, "0");
				        }
			        }
		        }
	        }
	        if (idGrid_D.rows > 1)
	        {
		        for (i = 1; i < idGrid_D.rows; i++)
		        {
					idGrid_D.SetGridText(i, 5, i);
		        }
	        }
	         SearchAccountInDr();
        }
        else if (drcr_type == 'C')
        {
			//idGrid_C.RemoveRowAt(idGrid_C.selrow);
			var  rowcrr = 1;
			for(i=0; i<aValue.length; i++)
			{
				var tmp = aValue[i];
				if (tmp[0] != "")
				{
				    
                     if(i==0)
		            {
		                 rowcrr =  idGrid_C.selrow;
		                 if( idGrid_C.GetGridData(rowcrr,0) =="")
		                 {
		                        idGrid_C.RemoveRowAt(idGrid_C.selrow);
		                        idGrid_C.AddRow();
		                        rowcrr = idGrid_C.rows - 1;
		                 }
		            }
		            else
		            {
		                idGrid_C.AddRow();
		                rowcrr = idGrid_C.rows - 1;
		            }
		            
					idGrid_C.SetGridText(rowcrr, 2, tmp[2]);
					idGrid_C.SetGridText(rowcrr, 3, tmp[3]);
					idGrid_C.SetGridText(rowcrr, 4, drcr_type);
					idGrid_C.SetGridText(rowcrr, 7, txt_PK.GetData());
					if (tmp[0] == "G")//Group
					{
						idGrid_C.SetGridText(rowcrr, 6, "");
						idGrid_C.SetGridText(rowcrr, 8, tmp[1]);
						idGrid_C.SetGridText(rowcrr, 1, -1);
					}
					else if (tmp[0] == "C")//Code
					{
						idGrid_C.SetGridText(rowcrr, 6, tmp[1]);
						idGrid_C.SetGridText(rowcrr, 8, "");
						idGrid_C.SetGridText(rowcrr, 1, "0");
					}
				}
			}
	        if (idGrid_C.rows > 1)
	        {
		        for (i = 1; i < idGrid_C.rows; i++)
		        {
					idGrid_C.SetGridText(i, 5, i);
		        }
	        }
	        SearchAccountInCr();
        } 
    }
}

function OnCheckDebit()
{
	if( event.col == 1 )
	{
		idGrid_D.SetGridText(idGrid_D.selrow, 2, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 3, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 4, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 5, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 6, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 7, "");
		idGrid_D.SetGridText(idGrid_D.selrow, 8, "");
	}
	if (idGrid_D.rows > 1)
	{
		btnDeleteD.SetEnable(true);
		btnUnDeleteD.SetEnable(true);
	}
	else
	{
		btnDeleteD.SetEnable(false);
		btnUnDeleteD.SetEnable(false);
	}
}

function OnCheckCredit()
{
	if( event.col == 1 )
	{
		idGrid_C.SetGridText(idGrid_C.selrow, 2, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 3, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 4, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 5, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 6, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 7, "");
		idGrid_C.SetGridText(idGrid_C.selrow, 8, "");
	}
	if (idGrid_C.rows > 1)
	{
		btnDeleteC.SetEnable(true);
		btnUnDeleteC.SetEnable(true);
	}
	else
	{
		btnDeleteC.SetEnable(false);
		btnUnDeleteC.SetEnable(false);
	}
}

function OnCheck_Debit()
{
	if (idGrid_D.rows > 1)
	{
		for (i = 1; i < idGrid_D.rows; i++)
		{
			if (idGrid_D.GetGridData(i, 7) == "")
			{
				idGrid_D.SetGridText(i, 7, txt_PK.GetData());
			}
		}
	}
}

function OnCheck_Credit()
{
	if (idGrid_C.rows > 1)
	{
		for (i = 1; i < idGrid_C.rows; i++)
		{
			if (idGrid_C.GetGridData(i, 7) == "")
			{
				idGrid_C.SetGridText(i, 7, txt_PK.GetData());
			}
		}
	}
}

function OnSave_Detail_Debit()
{
	if (idGrid_D.rows > 1)
	{
		txt_drcr_type.SetDataText("D");
		dso_upd_stardard_d.Call("");
	}
	else
	{
		txt_drcr_type.SetDataText("D");
		dso_upd_stardard_d.Call("SELECT");
	}
}

function OnSave_Detail_Credit()
{
    if (idGrid_C.rows > 1)
    {
        txt_drcr_type.SetDataText("C");
        dso_upd_stardard_c.Call("");
    }
    else
    {
        txt_drcr_type.SetDataText("C");
        dso_upd_stardard_c.Call("SELECT");
    }
}

function Delete_D()
{
	var ctrl = idGrid_D.GetGridControl();
	if (idGrid_D.rows > 1)
	{
		for (i = 1; i < idGrid_D.rows; i++)
		{
			if (ctrl.isSelected(i) == true)
			{
				if(idGrid_D.GetGridData(i, 0) == "")
				{
					idGrid_D.RemoveRowAt(i);
					i = i - 1;
				}
				else
				{
					idGrid_D.DeleteRow();
				}
			}
		}
		txt_drcr_type.SetDataText("D");
	}
}

function Delete_C()
{
	var ctrl = idGrid_C.GetGridControl();
	if (idGrid_C.rows > 1)
	{
		for (i = 1; i < idGrid_C.rows; i++)
		{
			if (ctrl.isSelected(i) == true)
			{
				if(idGrid_C.GetGridData(i, 0) == "")
				{
					idGrid_C.RemoveRowAt(i);
					i = i - 1;
				}
				else
				{
					idGrid_C.DeleteRow();
				}
			}
		}
		txt_drcr_type.SetDataText("C");
	}
}

function UnDelete_D()
{
    var ctrl = idGrid_D.GetGridControl();
    if (idGrid_D.rows > 1)
    {
        for (i = 1; i < idGrid_D.rows; i++)
        {
            if (ctrl.isSelected(i) == true)
            {
                idGrid_D.UnDeleteRow();
            }
        }
    }
}

function UnDelete_C()
{
    var ctrl = idGrid_C.GetGridControl();
    if (idGrid_C.rows > 1)
    {
        for (i = 1; i < idGrid_C.rows; i++)
        {
            if (ctrl.isSelected(i) == true)
            {
                idGrid_C.UnDeleteRow();
            }
        }
    }
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
    var x = c.toUpperCase().charCodeAt(0);
    event.keyCode = x;
}

function SearchAccountInDr()
{
    strGrpTmp ="";
    strAccTmp =""; 
    strGroup_Lst = "";
    strAcc_Lst = "";
    for(i=1;i<idGrid_D.rows;i++)
    {
        if(idGrid_D.GetGridData(i,1)=="-1")//Group
        {
            if (idGrid_D.GetGridData(i,8)!='')
            {
                strGroup_Lst = strGroup_Lst+strGrpTmp+idGrid_D.GetGridData(i,8);
                strGrpTmp =",";
            }
        }
        else//Account
        {
            if(idGrid_D.GetGridData(i,6)!='')
            {
                strAcc_Lst = strAcc_Lst+strAccTmp+idGrid_D.GetGridData(i,6);
                strAccTmp =",";
            } 
        }
    } 
    txtGrp_lst_pk_dr.text = strGroup_Lst;
    txtAcc_lst_pk_dr.text = strAcc_Lst;
    if((strGroup_Lst!='')||(strAcc_Lst!=''))
    {
        datGetAllAccountDR.Call('SELECT');
     }
     else
     {
        idGridAllDr.ClearData();
        SearchAccountInCr();
     }
}

function SearchAccountInCr()
{
    strGrpTmp ="";
    strAccTmp =""; 
    strGroup_Lst = "";
    strAcc_Lst = "";
    for(i=1;i<idGrid_C.rows;i++)
    {
        if(idGrid_C.GetGridData(i,1)=="-1")//Group
        {
            if(idGrid_C.GetGridData(i,8)!='')
            {
                strGroup_Lst = strGroup_Lst+strGrpTmp+idGrid_C.GetGridData(i,8);
                strGrpTmp =",";
            } 
        }
        else//Account
        {
            if(idGrid_C.GetGridData(i,6)!='')
            {
                strAcc_Lst = strAcc_Lst+strAccTmp+idGrid_C.GetGridData(i,6);
                strAccTmp =",";
            } 
        }
    } 
    txtGrp_lst_pk_cr.text = strGroup_Lst;
    txtAcc_lst_pk_cr.text = strAcc_Lst;

    if((strGroup_Lst!='')||(strAcc_Lst!=''))
   { 
        datGetAllAccountCR.Call('SELECT');
    }
   else
   {
        idGridAllCr.ClearData();
   } 
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_search_trans" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030050_abtrtype" parameter="0,1,2,3"> 
                <input bind="idGrid" > 
                    <input bind="lstCompany" /> 
                    <input bind="lsttrangrp_search" /> 
                    <input bind="txttrcode_search" /> 
                    <input bind="txttrnm_search" /> 
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data> 

    <gw:data id="dso_upd_trans" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="ac_sel_60030050_abtrtype_item" procedure = "ac_upd_60030050_abtrtype_item">
            <inout> 
                <inout bind="txt_PK"/>
                <inout bind="lsttrans_grp"/>
                <inout bind="txtTrans_code"/>
                <inout bind="rbsys_yn"/>
                <inout bind="txttrans_nm"/>
                <inout bind="txttrans_nm_lc"/>
                <inout bind="txttrans_nm_kr"/>
                <inout bind="txtslip_desc"/>
                <inout bind="txtslip_desc_lc"/>
                <inout bind="lstvoucher_evt"/>
                <inout bind="lstvoucher_type"/>
                <inout bind="rbAct_YN"/>
                <inout bind="txt_UserID"/>
                <inout bind="rbauto_yn"/>
                <inout bind="lstCompany"/>
				
				<inout bind="txtslip_desc_kr"/>
				<inout bind="txt_Expl_ENG"/>
				<inout bind="txt_Expl_LCL"/>
				<inout bind="txt_Expl_KOR"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data> 

    <gw:data id="dso_sel_exist" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_sel_60030050_code_exist"> 
                <input> 
                     <input bind="lsttrans_grp"/>
                     <input bind="txtTrans_code"/>
                     <input bind="lstCompany"/>
                </input>  
                <output>  
                     <output bind="txtExists"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data> 
    
    <gw:data id="dso_upd_stardard_d" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60030050_stand_entry_d" procedure="ac_upd_60030050_stand_entry_d">
                <input bind="idGrid_D" >
                    <input bind="txt_PK"/>
                    <input bind="txt_drcr_type"/>
                </input>
                <output bind="idGrid_D" />
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_stardard_c" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60030050_stand_entry_d" procedure="ac_upd_60030050_stand_entry_d">
                <input bind="idGrid_C" >
                    <input bind="txt_PK"/>
                    <input bind="txt_drcr_type"/>
                </input>
                <output bind="idGrid_C" />
            </dso>
        </xml>
    </gw:data>
    
<gw:data id="datGetAllAccountDR" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030050_acc_in_trans" > 
                <input bind="idGridAllDr" > 
                    <input bind="txtGrp_lst_pk_dr" /> 
                    <input bind="txtAcc_lst_pk_dr" /> 
                    <input bind="txt_SearchAccDr" /> 
                     <input bind="lstCompany" /> 
                     <input bind="txtLang" /> 
                </input> 
                <output bind="idGridAllDr" /> 
            </dso> 
        </xml> 
    </gw:data> 
   
   <gw:data id="datGetAllAccountCR" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60030050_acc_in_trans" > 
                <input bind="idGridAllCr" > 
                    <input bind="txtGrp_lst_pk_cr" /> 
                    <input bind="txtAcc_lst_pk_cr" /> 
                    <input bind="txt_SearchAccCr" /> 
                     <input bind="lstCompany" /> 
                     <input bind="txtLang" /> 
                </input> 
                <output bind="idGridAllCr" /> 
            </dso> 
        </xml> 
    </gw:data> 
   
       </gw:data>
     <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
<table  width="100%"  cellpadding="0" cellspacing="0" border="1">
<tr>
	<td width="30%" align="right" valign="top">
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%" align="right" >Company</td>
				<td width="60%">
					<gw:list id="lstCompany" onChange="OnChange_Control()" styles='width:100%'></gw:list >
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" >Trans Group</td>
				<td width="60%">
					<gw:list id="lsttrangrp_search" onChange="OnChange_List()" styles='width:100%'></gw:list >
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" >Trans Code</td>
				<td width="60%"><gw:textbox id="txttrcode_search" maxlen=50 onenterkey="OnChange_Control()" onkeypress="Upcase()" styles='width:100%;'/></td>
			</tr>
			<tr>
				<td width="40%" align="right" >Trans Name</td>
				<td width="60%"><gw:textbox id="txttrnm_search" maxlen=50 onenterkey="OnChange_Control()" onkeypress="Upcase()" styles='width:100%;'/></td>
			</tr>
			<tr>
			    <td colspan="2">  
				    <gw:grid   
					    id="idGrid"  
					    header="_PK|Trans Code|Trans Name"   
					    format="0|0|0"  
					    aligns="0|0|0"  
					    defaults="||"  
					    editcol="0|0|0"  
					    widths="0|1500|0"  
					    styles="width:100%; height:400"   
					    sorting="T"   
					    param="0,1,2"  
					    oncellclick="OnClick()" />  
			    </td>
		    </tr>
		</table>		  		 
	</td>
	<td width="70%" align="right">
		<table width="100%" cellpadding="2" cellspacing="0">
		    <tr valign="top">
		        <td width="25%"></td>
		        <td width="25%"></td>
		        <td width="25%"></td>
		        <td width="25%">
		            <table id="RightTopTB" height="20" align="right" cellpadding="0" cellspacing="0">
			            <tr>
				            <td width=""><gw:textbox id="idInput_PK"  style="display:none"/></td>
				            <td width=""></td>
							<td width=""> <gw:button  id="idBtnAdd" img="new" alt="New" onclick="AddNew()" /></td>
							<td width=""><gw:button   id="idBtnUpdate" img="save" alt="Save" onclick="OnSave()" /></td>
							<td width=""><gw:button   id="idBtnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>
			            </tr>
		            </table>
		        </td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Trans Group</td>
		        <td width="25%"><gw:list id="lsttrans_grp" styles='width:100%' onChange="OnChange_Control()"> </gw:list></td>
		        <td width="25%" align="right">Sys YN</td>
		        <td width="25%"><gw:radio id="rbsys_yn" value="Y" ><span value="Y">Yes&nbsp;&nbsp;&nbsp;</span><span value="N" >No </span></gw:radio ></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Trans Code</td>
		        <td width="25%">
		            <table width="100%" cellpadding="0" cellspacing= "0">
		                <tr>
		                    <td width="25%"><gw:textbox id="txtTrans_Alias" maxlen=1 styles='width:100%' csstype="mandatory"/></td>
		                    <td width="75%"><gw:textbox id="txtTrans_code" maxlen=6  text="" styles='width:100%' csstype="mandatory"/></td>
		                </tr>
		            </table>
		        </td>
		        <td width="25%" align="right">Auto YN</td>
		        <td width="25%"><gw:radio id="rbauto_yn" value="Y" onChange="OnChange_Auto()" ><span value="Y">Yes&nbsp;&nbsp;&nbsp;</span><span value="N" >No </span></gw:radio ></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Trans Name</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txttrans_nm" maxlen=100 styles='width:100%' csstype="mandatory"/></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Trans Name (LC)</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txttrans_nm_lc" maxlen=100 styles='width:100%'/></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Trans Name (KOR)</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txttrans_nm_kr" maxlen=100 styles='width:100%'/></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Slip Description</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txtslip_desc" maxlen=150 styles='width:100%'/></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Slip Description (LC)</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txtslip_desc_lc" maxlen=150 styles='width:100%'/></td>
		    </tr>
			<tr>
		        <td width="25%" align="right">Slip Description (KOR)</td>
		        <td width="25%" colspan= "3"><gw:textbox id="txtslip_desc_kr" maxlen=150 styles='width:100%'/></td>
		    </tr>
		    <tr>
		        <td width="25%" align="right">Voucher Event</td>
				<td colspan='3'>
					<table width='100%' >
						<tr>
							<td width="30%"><gw:list id="lstvoucher_evt" styles='width:100%'> </gw:list></td>
							<td width="25%" align="right">Voucher Type</td>
							<td width="30%"><gw:list id="lstvoucher_type" styles='width:100%;display:;'> </gw:list></td>
							
							<td width="15%" align="right">Active</td>
							<td width=""><gw:radio id="rbAct_YN" value="Y" ><span value="Y" >Yes&nbsp;&nbsp;&nbsp;</span><span value="N">No</span></gw:radio></td>
						</tr>
					</table>
				</td>
				
		    </tr>
		    <tr>
		        <td width="25%">Debit</td>
		        <td width="25%">
		            <table id="Table1" height="20" align="right" cellpadding="0" cellspacing="0">
			            <tr>
				            <td width="89%"></td>
							<td width="1%"> <gw:button  id="btnAddD"      img="new" alt="New" onclick="AddRow_D()" /></td>
							<td width="1%"> <gw:button   id="btnDeleteD" img="delete" alt="Delete" onclick="Delete_D()" /> </td>
							  
							<td width="1%"><gw:button   id="btnUnDeleteD" img="Undelete" alt="UnDelete" onclick="UnDelete_D()" /></td>
			            </tr>
		            </table>
		        </td>
		        <td width="25%">Credit</td>
		        <td width="25%">
		            <table id="Table2" height="20" align="right" cellpadding="0" cellspacing="0">
			            <tr>
				            <td width="89%"></td>
								<td width="1%"> <gw:button  id="btnAddC" img="new" alt="New" onclick="AddRow_C()" /></td>
								<td width="1%"><gw:button id="btnDeleteC" img="delete" alt="Delete" onclick="Delete_C()" /></td>
								<td width="1%"><gw:button id="btnUnDeleteC" img="Undelete" alt="UnDelete" onclick="UnDelete_C()" /></td>
			            </tr>
		            </table>
		        </td>
		    </tr>
		    <tr>
		        <td width="50%" colspan="2">
					<table width="100%" border ="1" cellpadding="0" cellspacing="0">
		            <tr>
			            <td>				
							<gw:grid
								id="idGrid_D"  
								header  ="_PK|Acc. Grp Code Y/N|Acc. Grp Code|Acc. Grp Name|_DRCR_TYPE|_DRCR_ORD|_TAC_ABACCTCODE_PK|_TAC_ABTRTYPE_PK|_TAC_ABTRACGRP_PK"   
								format  ="0|3|0|0|0|0|0|0|0"  
								aligns  ="0|0|0|0|0|0|0|0|0"  
								defaults="||||||||"  
								editcol ="1|1|0|0|0|0|0|0|0"  
								widths  ="0|1700|1500|0|0|0|0|0|0" 
								styles  ="width:100%; height:180"   
								sorting ="T"   
								param   ="0,1,2,3,4,5,6,7,8"  
								oncelldblclick  ="RowClick_D()" 
								oncellclick     ="OnCheckDebit()"/>
						</td>
					</tr>
					</table>	
				</td>
		        <td width="50%" colspan="2">
		            <table width="100%" cellpadding="0" cellspacing="0" border ="1">
			        <tr>
				        <td>
							<gw:grid
								id="idGrid_C"  
								header  ="_PK|Acc. Grp Code Y/N|Acc. Grp Code|Acc. Grp Name|_DRCR_TYPE|_DRCR_ORD|_TAC_ABACCTCODE_PK|_TAC_ABTRTYPE_PK|_TAC_ABTRACGRP_PK"   
								format  ="0|3|0|0|0|0|0|0|0"  
								aligns  ="0|0|0|0|0|0|0|0|0"  
								defaults="||||||||"  
								editcol ="1|1|0|0|0|0|0|0|0"  
								widths  ="0|1700|1500|0|0|0|0|0|0"  
								styles  ="width:100%; height:180"   
								sorting ="T"   
								param   ="0,1,2,3,4,5,6,7,8"  
								oncelldblclick  ="RowClick_C()"
								oncellclick     ="OnCheckCredit()"/>
                        </td>
					</tr>
					</table>
                </td>
		    </tr>
			<tr>
				<td align="right">Acc. Code</td>
				<td><gw:textbox id="txt_SearchAccDr" style="width:100%;" onenterkey="SearchAccountInDr()"/></td>
				<td align="right">Acc. Code</td>
				<td><gw:textbox id="txt_SearchAccCr" style="width:100%;" onenterkey="SearchAccountInCr()"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" border ="1" cellpadding="0" cellspacing="0">
		            <tr>
			            <td>
			                <gw:grid id='idGridAllDr'
                                header='Acc. Code|Acc. Name'
                                format='0|0'
                                aligns='0|0'
                                defaults='|'
                                editcol='0|0'
                                widths='1500|2000'
                                sorting='T'
                                styles='width:100%; height:180'
                            />				
						</td>
					</tr>
					</table>	
				</td>
				<td colspan="2">
					<table width="100%" border ="1" cellpadding="0" cellspacing="0">
		            <tr>
			            <td>			
			                <gw:grid id='idGridAllCr'
                                header='Acc. Code|Acc. Name'
                                format='0|0'
                                aligns='0|0'
                                defaults='|'
                                editcol='0|0'
                                widths='1500|2000'
                                sorting='T'
                                styles='width:100%; height:180'
                            />					
						</td>
					</tr>
					</table>	
				</td>
			</tr>
			<tr>
				<td align="right">Explain (ENG)</td>
				<td colspan="3"><gw:textarea id="txt_Expl_ENG" styles="width:100%;height:80;"></gw:textarea></td>
			</tr>
			<tr>
				<td align="right">Explain (LOCAL)</td>
				<td colspan="3"><gw:textarea id="txt_Expl_LCL" styles="width:100%;height:80;"></gw:textarea></td>
			</tr>
			<tr>
				<td align="right">Explain (KOR)</td>
				<td colspan="3"><gw:textarea id="txt_Expl_KOR" styles="width:100%;height:80;"></gw:textarea></td>
			</tr>
		</table>
	</td>
</tr>
</table>

<gw:textbox id="txt_PK"             style="display:none"/> 
<gw:textbox id="txtExists"          style="display:none"/> 
<gw:textbox id="txt_drcr_type"      style="display:none"/> 

<gw:textbox id="txt_UserID" styles='width:100%;display:none;'/>
 <gw:textbox id="txtProposedByUserPk"  styles='display:none' />
<gw:textbox id="txtGrp_lst_pk_dr" styles='width:100%;display:none;'/>
<gw:textbox id="txtAcc_lst_pk_dr" styles='width:100%;display:none;'/>
<gw:textbox id="txtGrp_lst_pk_cr" styles='width:100%;display:none;'/>
<gw:textbox id="txtAcc_lst_pk_cr" styles='width:100%;display:none;'/>
<gw:textbox id="txtLang" styles='width:100%;display:none;'/>

</body>
</html>
