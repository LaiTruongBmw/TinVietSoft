<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1"  runat="server">
    <title>Takeout Material</title>
</head>

<script>
   
    var  user_pk = "<%=Session("USER_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var  user_id = "<%=Session("USER_ID")%>" ;
    var  p_update = 0 ;
//-----------------------------------------------------
//grdSearch
    var iG1_pk              = 0,    
        iG1_Voucher_No      = 1,
        iG1_Trans_DT        = 2,
        iG1_ACC_Voucher_No  = 3,
        iG1_ACC_Seq_No      = 4,
        iG1_TR_STATUS       = 5;
// transaction type        
var ls_trtype_pk, ls_trtype_code, ls_trtype_nm, ls_slipremarkeng, ls_slipremarklocal ;            
//grdDetail    
var iG2_pk                  = 0,
	iG2_SlipNo				= 1,
    iG2_tco_item_pk         = 2,
    iG2_Item_Code           = 3,
    iG2_Item_Name           = 4,
    iG2_UOM                 = 5,
    iG2_Qty                 = 6,
    iG2_UPrice              = 7,
    iG2_Trans_Amt           = 8,
    iG2_Books_Amt           = 9,
    iG2_Debit_Acc_Cd        = 10,
    iG2_Debit_Acc_Nm        = 11,
    iG2_Credit_Acc_Cd       = 12,
    iG2_Credit_Acc_Nm       = 13,
    iG2_Description         = 14,
    iG2_Local_Description   = 15,
    iG2_WH_Name             = 16,
    iG2_tac_abplcenter_pk   = 17,
    iG2_PL_Cd               = 18,
    iG2_PL_Nm               = 19,
    iG2_debit_acctcode_pk   = 20,
    iG2_credit_acctcode_pk  = 21,
    iG2_TAC_OMCOST_PRICER_PK = 22,
    iG2_tin_warehouse_pk     = 23,
	iG2_tin_linemattakeoutd_pk = 24, 
	ÏG_tlg_co_cost_center_pk   = 25 ;
	
// insert or delete master
	var g_insert = false, g_delete = false ;
	
//---------------------------------------------------------

function BodyInit()
{
    txtDepartment.SetEnable(false);
    txtUserID.SetEnable(false);
    txtUserName.SetEnable(false);
    txtTransCode.SetEnable(false);
    txtTransName.SetEnable(false);
    txtDebitCode.SetEnable(false);
    txtDebitName.SetEnable(false);
    txtDepartment.SetEnable(false);
   
//    lstCurr.value = 'USD';
    txtVoucherNo.SetEnable(true);
    chkVoucher_Auto.value = 'F';
    OnFormatGrid();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
	
	
}
//-----------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("tLEFT");    
    var right = document.all("tRIGHT");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }

//-----------------------------------------------------
 function BindingDataList()
 {
    // company
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    //lstCompany.SetDataText(ls_data);
	//lstCompany.value = "3";
    lstCompany_1.SetDataText(ls_data);
	ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, wh_id || '-' || wh_name as wh_name FROM TLG_IN_WAREHOUSE WHERE DEL_IF = 0 AND USE_YN = 'Y' ")%>||ALL" ;
	lstWH.SetDataText(ls_data);
	lstWH.value = "";
	//lstCompany_1.value = "3";
    // voucher type
    ls_data = "<%=CtlLib.SetListDataSQL("select A.CODE, A.CODE_NM FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TAC_COMMCODE_MASTER_PK = B.PK AND B.ID = 'ACBG0130' and ( code = 'XNL' or code = 'XDC' ) order by ORD " )%>|ALL|Select All"; 
    lstVoucherType.SetDataText(ls_data);
    lstVoucherType.value = "XNL" ;
        
    txtabemp_pk.text = user_pk ;
    txtDepartment.text = '';
    txtUserID.text = user_id;
    txtUserName.text = user_name;                
    txtDept_PK.text = "";                     
	// init values
    
    var ls_first_date = dtFromDT.value ;
    ls_first_date = ls_first_date.substr(0, 4) + ls_first_date.substr(4, 2) + "01";
    dtFromDT.value = ls_first_date;
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACAB047' and A.use_yn = 'Y' and a.code <> 'O1' order by A.ord asc ")%>";	
	lstGetData.SetDataText(ls_data);
	dso_initial.Call();
 }  
 //-----------------------------------------------------
 
function OnPopUp(iObject)
{
    switch(iObject)
    {
        case 'Proposed By':
            var path = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            lrow = grdDetail.row ;
            lcol = grdDetail.col;
            if(object!=null)
            {
                txtabemp_pk.text    = object[0];                
                txtDepartment.text  = object[4];
                txtUserID.text      = object[1];
                txtUserName.text    = object[2];                
                txtDept_PK.text     = "";                
            }        
        break ;
        case 'Debit Account':
            var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCode.text + "&val1=" + txtTransName.text + "&val2=D" + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60170130_acc_new_drcr" ;
            var object  =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
            if(object!=null)
            {               
                var tmp = object[0];
                if( tmp != null && Trim(tmp[1]) != '' )
                {
                    txtDebitCode.text = tmp[4];
                    txtDebitName.text = tmp[5];
                    txttac_abacctcode_pk.text = tmp[1] ;                    
                }
            }                                                    
        break ;
        case 'Trans Type':
            var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.value;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if( object != null )
            {
		        var tmp = object[0];
		        if (tmp[1] != null)
		        {
		            txtTransCode.text = tmp[1];
		            txtTransName.text = tmp[2];
		            txtabtypetr_pk.text = tmp[0];
		            txtDesc.text = tmp[3];
		            txtLocalDesc.text = tmp[4];
                }                
            }
        break ;        
    }
}

function OnReset()
{
    txtDepartment.text          = '';
    txtDept_PK.text             = '';
    txtUserName.text            = '';    
    txtUserID.text              = '';
    txtabemp_pk.text            = '';
    txtTransCode.text           = '';
    txtTransName.text           = '';
    txtabtypetr_pk.text         = '';    
    txtDebitCode.text           = '';
    txtDebitName.text           = '';
    txttac_abacctcode_pk.text   = '';    
    txtVoucherNo.text           = '';
    txtSEQ.text                 = '';
}
function OnAddNew(iObj)
{
    var lNewRow ;
    switch(iObj)
    {
        case '1':
            if(grdMaster.GetStatus() != 20)
            {
                grdMaster.StatusInsert();
                txtVoucherNo.enabled = true;
                grdDetail.ClearData();                
                OnReset();				
                txtabtypetr_pk.text = ls_trtype_pk ;
                txtTransCode.text = ls_trtype_code ;
                txtTransName.text = ls_trtype_nm ;
                txtDesc.text = ls_slipremarkeng ;
                txtLocalDesc.text = ls_slipremarkeng ;
                txtDebitCode.text = txtDebitCD.text ;
                txtDebitName.text = txtDebitNM.text ;                                
                txttac_abacctcode_pk.text = txtDebitPK.text ;
                lstVoucherType.value = "XNL" ;
                txtVoucherNo.text = '**New Slip No**';
                lblStatus.text = 'Saved';
				txtabemp_pk.text = user_pk ;
				txtDepartment.text = '';
				txtUserID.text = user_id;
				txtUserName.text = user_name;                				
                txtVoucherNo.GetControl().focus();						
                InActiveButton();               
				g_insert = true;	
            }
            else
            {
                alert("Already add new. Please input data !!!");
            }                        
        break ;
        case '2':                        
            if(Trim(txttac_omcost_pricer_PK.text) == '')
            {
                alert("Please choose the Voucher No!!!");
                return false ;
            }		
			if(lstGetData.value == 'ED')
			{
				lstWH.value = ''; // Set All warehouses
            	grdDetail.AddRow();
            	grdDetail.SelectRow(grdDetail.rows - 1);                        
            	lNewRow = grdDetail.rows - 1 ;            
            	grdDetail.SetGridText(lNewRow, iG2_TAC_OMCOST_PRICER_PK, txttac_omcost_pricer_PK.text);
            	if( Trim(txttac_abacctcode_pk.text) != "" ) //debit account code
            	{                                
                	grdDetail.SetGridText(lNewRow, iG2_debit_acctcode_pk,   txttac_abacctcode_pk.text);
                	grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Cd,        txtDebitCode.text);
                	grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Nm,        txtDebitName.text);
            	}
			}
			else if(lstGetData.value == 'TO')
			{
				// raise pop up
				var l_arr = new Array();
				var i ;
  	      		var fpath   = System.RootURL + "/standard/forms/fm/gf/fmgf00130_takeout_mat_month.aspx?company=" + lstCompany.GetData() + "&takeout_dt=" + dtTransDt.value;
        		var aValue  = System.OpenModal(fpath , 1000 , 600 , 'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
		        if ( aValue != null ) 
				{
					lstWH.value = ''; // Set All warehouses
					for (i = 0; i < aValue.length; i++)
					{
						l_arr = aValue[i];
						grdDetail.AddRow();
						lNewRow = grdDetail.rows - 1;
                		//grdDetail.SetGridText(lNewRow, iG2_debit_acctcode_pk,   txttac_abacctcode_pk.text); //debit acc pk
                		grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Cd,        l_arr[19]); //debit acc code
                		grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Nm,        l_arr[20]); //debit acc name
						grdDetail.SetGridText(lNewRow, iG2_tco_item_pk,   l_arr[2]     ); //tco_item_pk
						grdDetail.SetGridText(lNewRow, iG2_Item_Code,   l_arr[3]     ); //item_code
						grdDetail.SetGridText(lNewRow, iG2_Item_Name,   l_arr[4]     ); //item_name
						grdDetail.SetGridText(lNewRow, iG2_UOM,   l_arr[5]     ); //Unit
						grdDetail.SetGridText(lNewRow, iG2_Qty,   l_arr[6]     ); // take out qty
						grdDetail.SetGridText(lNewRow, iG2_WH_Name,   l_arr[9]     ); // wh name
						grdDetail.SetGridText(lNewRow, iG2_tin_warehouse_pk,   l_arr[14]     ); // warehouse_pk
						grdDetail.SetGridText(lNewRow, iG2_credit_acctcode_pk,   l_arr[11]     ); // credit acc pk
						grdDetail.SetGridText(lNewRow, iG2_Credit_Acc_Cd,   l_arr[12]     ); // credit acc code
						grdDetail.SetGridText(lNewRow, iG2_Credit_Acc_Nm,   l_arr[13]     ); // credit acc name						
						grdDetail.SetGridText(lNewRow, iG2_tin_linemattakeoutd_pk,   l_arr[1]     ); // tin_linemattakeoutd_pk
						grdDetail.SetGridText(lNewRow, iG2_Description, txtDesc.text ); // description
						grdDetail.SetGridText(lNewRow, iG2_Local_Description, txtLocalDesc.text ); // description
						grdDetail.SetGridText(lNewRow, iG2_debit_acctcode_pk, l_arr[15] ); // account expense
						//grdDetail.SetGridText(lNewRow, iG2_tac_abplcenter_pk, l_arr[16] ); // tac_abplcenter_pk
						//grdDetail.SetGridText(lNewRow, iG2_PL_Cd, l_arr[17] ); // PL Code
						//grdDetail.SetGridText(lNewRow, iG2_PL_Nm, l_arr[18] ); // PL Name
						grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Cd, l_arr[16] ); // Exp Acc Cd
						grdDetail.SetGridText(lNewRow, iG2_Debit_Acc_Nm, l_arr[17] ); // Exp Acc NM
						grdDetail.SetGridText(lNewRow, iG2_SlipNo, l_arr[8] ); // Slip No
						grdDetail.SetGridText(lNewRow, iG2_PL_Cd, l_arr[18] ); // PL CD
						grdDetail.SetGridText(lNewRow, iG2_PL_Nm, l_arr[19] ); // PL Name
						grdDetail.SetGridText(lNewRow, iG2_tac_abplcenter_pk, l_arr[20] ); // PL PK
						grdDetail.SetGridText(lNewRow, ÏG_tlg_co_cost_center_pk, l_arr[21] ); // PL
					}
				}				
			}	
        break ;
    }
}

function OnSave(iObj)
{
    switch(iObj)
    {
        case '1':
            var lchk = CheckSave('master');
            if(lchk)
            {
                grdMaster.Call();
                p_update = 1;							
            } 
            InActiveButton();               
        break;
        case '2':
            if(CheckSave('detail'))
            {
                fmgf00130_2.Call() ;                          
                InActiveButton();
            }                
        break;
    }
}

function CheckSave(iCase)
{
    switch(iCase)
    {
        case 'master':
            if(Trim(txttac_abacctcode_pk.text) =='')
            {
                alert('Please choose the Debit Account Code');
                return false;
            }
            else if(chkVoucher_Auto.value == "F")
            {
                if(Trim(txtVoucherNo.text)=="")
                {
                    alert("Please user enter input Voucher No");
                    return false;
                }                
            }
            else if(txtabemp_pk.text == "" )
            {
                alert("Please select the Proposed by!!!");
                return false ;
            }
        return true;            
        break ;
        case 'detail':        
            for(i = 1; i < grdDetail.rows; i++)
            {
				if(Trim(grdDetail.GetGridData(i, (iG2_Item_Code)) == "Total"))
				{
					continue ;	
				}
                if(Trim(grdDetail.GetGridData(i, iG2_tco_item_pk)) == "")
                {
                    alert("Please select item code for row " + i);
                    if(grdDetail.row >= 1)
                        grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);    
                    return false;                        
                }        
                else if(Trim(grdDetail.GetGridData(i, iG2_Qty)) == "")
                {
                    alert("Please select quantity for row " + i);
                    if(grdDetail.row >= 1)
                        grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);                            
                    return false;
                }
                else if(Trim(grdDetail.GetGridData(i, iG2_WH_Name)) == "")
                {
                    alert("Please select warehouse for row " + i);
                    if(grdDetail.row >= 1)
                        grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);                            
                    return false;
                }
                else if(Trim(grdDetail.GetGridData(i, iG2_credit_acctcode_pk)) == "")
                {
                    alert("Please select credit account for row " + i);
                    if(grdDetail.row >= 1)
                        grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);                            
                    return false;
                }        
            }
            return true ;        
        break ;            
    }
}

function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
		case 'dso_getCompany':
		{
			 BindingDataList();
		}
		break;
        case 'grdMaster':
			if(g_insert == true)
			{				
				fmgf00130.Call("SELECT");
				g_insert = false;				
			}
			else if( p_update == 1 )
            {				
                p_update = 0 ;
                SetParentPKtoGrid();                
                OnSave('2');
            }
            else
            {				
                fmgf00130_2.Call('SELECT'); ///show detail
            } 
            InActiveButton();
        break ;
		case 'dso_initial':
			ls_trtype_nm = txtTransName.text; 
			ls_trtype_pk =  txtabtypetr_pk.text;
			ls_trtype_code =  txtTransCode.text;
			ls_slipremarkeng = txtDesc.text ;	
			txtDebitCode.text = txtDebitCD.text ;			
			txtDebitName.text = txtDebitNM.text ;
			txttac_abacctcode_pk.text = txtDebitPK.text; 
		break ;
		case "fmgf00130_2":
			if(grdDetail.rows > 1)
			{
				var i, l_tot_qty = 0;
				for( i = 1; i < grdDetail.rows; i++)
				{
					if(grdDetail.GetGridData(i, iG2_Qty) != "")
					{
						l_tot_qty += Number(grdDetail.GetGridData(i, iG2_Qty));
					}
				}
				grdDetail.AddRow();
				grdDetail.SetCellBgColor(grdDetail.rows-1, 0,grdDetail.rows-1, grdDetail.cols-1, 0xA9EBD7);
				grdDetail.SetGridText(grdDetail.rows - 1, iG2_Item_Code, "Total ");
				grdDetail.SetGridText(grdDetail.rows - 1, iG2_Qty, l_tot_qty);
			}	
		break ;
    }    
}

function OnSearch(pos)
{
    switch(pos)
    {
        case '1':  //grdSearch  
            fmgf00130.Call();
            grdDetail.ClearData();                        
        break;
        case '2': //master grid
            if ( grdMaster.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('1'); //save master
                }
                else
                {
                    txttac_omcost_pricer_PK.text = grdSearch.GetGridData(grdSearch.row, iG1_pk);
					g_insert = false;
                    grdMaster.Call("SELECT");  					
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txttac_omcost_pricer_PK.text = grdSearch.GetGridData(grdSearch.row, iG1_pk);
                }
                grdMaster.Call("SELECT");                
            }                                   
        break;
    }
}

function SetParentPKtoGrid()
{
    var i ;
    for( i = 1; i < grdDetail.rows ; i++)
    {
        grdDetail.SetGridText(i, iG2_TAC_OMCOST_PRICER_PK, txttac_omcost_pricer_PK.text);           
    }
}

function OnVoucherAuto()
{
    if(chkVoucher_Auto.value == 'T')
        txtVoucherNo.SetEnable(false);    
    else
    {     
        txtVoucherNo.SetEnable(true);        
        txtVoucherNo.GetControl().focus();    
    }        
}

function OnGridCellDblClick(iObj)
{
    switch(iObj.id)
    {
        case 'grdDetail':
            var lcol = event.col ;
            var lrow = event.row ;            
            if(lcol == iG2_Item_Code)
            {
                var path = System.RootURL + "/standard/forms/fm/gf/fmgf00130_popup.aspx?purchase_yn=&item_code=&item_name="   ;
                var object = System.OpenModal( path ,1100 , 700 ,  'resizable:yes;status:yes');        
                if(object != null)
                {
                    var atemp = object[0];
                    grdDetail.SetGridText(lrow, iG2_Item_Code, atemp[1]);
                    grdDetail.SetGridText(lrow, iG2_Item_Name, atemp[2]);
                    grdDetail.SetGridText(lrow, iG2_tco_item_pk, atemp[0]);
                    grdDetail.SetGridText(lrow, iG2_UOM, atemp[5]);
                    grdDetail.SetGridText(lrow,iG2_Credit_Acc_Cd, atemp[20]);
                    grdDetail.SetGridText(lrow,iG2_Credit_Acc_Nm, atemp[21]);
                    grdDetail.SetGridText(lrow,iG2_credit_acctcode_pk, atemp[19]);                    
                    if(txttac_abacctcode_pk.text != '')
                    {                        
                        grdDetail.SetGridText(lrow, iG2_debit_acctcode_pk, txttac_abacctcode_pk.text);
                        grdDetail.SetGridText(lrow, iG2_Debit_Acc_Cd, txtDebitCode.text);
                        grdDetail.SetGridText(lrow, iG2_Debit_Acc_Nm, txtDebitName.text);
                    }
                    if(Trim(txtLocalDesc.text) != '')                                           
                    {                    
                        grdDetail.SetGridText(lrow, iG2_Local_Description, txtLocalDesc.text);
                    }
                    if(Trim(txtDesc.text) != '')                                           
                    {                    
                        grdDetail.SetGridText(lrow, iG2_Description, txtDesc.text);
                    }
                    
                    for(var i = 1; i < object.length; i++)
                    {
                        var atemp = object[i];
                        grdDetail.AddRow();
                        grdDetail.SelectRow(grdDetail.rows - 1);       
                        lrow = grdDetail.rows - 1 ;
                        if(txttac_abacctcode_pk.text != '')
                        {                        
                            grdDetail.SetGridText(lrow, iG2_debit_acctcode_pk, txttac_abacctcode_pk.text);
                            grdDetail.SetGridText(lrow, iG2_Debit_Acc_Cd, txtDebitCode.text);
                            grdDetail.SetGridText(lrow, iG2_Debit_Acc_Nm, txtDebitName.text);
                        }                        
                        grdDetail.SetGridText(lrow, iG2_Item_Code,     atemp[1]);
                        grdDetail.SetGridText(lrow, iG2_Item_Name,     atemp[2]);
                        grdDetail.SetGridText(lrow, iG2_tco_item_pk,   atemp[0]);
                        grdDetail.SetGridText(lrow, iG2_UOM,           atemp[5]);  
                        grdDetail.SetGridText(lrow, iG2_TAC_OMCOST_PRICER_PK, txttac_omcost_pricer_PK.text);      
                        grdDetail.SetGridText(lrow,iG2_Credit_Acc_Cd, atemp[20]);
                        grdDetail.SetGridText(lrow,iG2_Credit_Acc_Nm, atemp[21]);
                        grdDetail.SetGridText(lrow,iG2_credit_acctcode_pk, atemp[19]);                                            
                        
                        if(Trim(txtLocalDesc.text) != '')                                           
                        {                    
                            grdDetail.SetGridText(lrow, iG2_Local_Description, txtLocalDesc.text);
                        }
                        if(Trim(txtDesc.text) != '')                                           
                        {                        
                            grdDetail.SetGridText(lrow, iG2_Description, txtDesc.text);
                        }
                    }                                                         
                }
            }
            else if(lcol == iG2_Credit_Acc_Cd )
            {
                var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCode.text + "&val1=" + txtTransName.text + "&val2=C" + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60170130_acc_new_drcr" ;
                var object  =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
                if(object!=null)
                {               
                    var tmp = object[0];
                    if( tmp != null && Trim(tmp[1]) != '' )
                    {
                        grdDetail.SetGridText(lrow,iG2_Credit_Acc_Cd, tmp[4]);
                        grdDetail.SetGridText(lrow,iG2_Credit_Acc_Nm, tmp[5]);
                        grdDetail.SetGridText(lrow, iG2_credit_acctcode_pk, tmp[1]);
                    }
                }                                                                    
            }
			else if(lcol == iG2_Debit_Acc_Cd )
			{
                var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCode.text + "&val1=" + txtTransName.text + "&val2=D" + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60170130_acc_new_drcr" ;
                var object  =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
                if(object!=null)
                {               
                    var tmp = object[0];
                    if( tmp != null && Trim(tmp[1]) != '' )
                    {
                        grdDetail.SetGridText(lrow, iG2_Debit_Acc_Cd, tmp[4]);
                        grdDetail.SetGridText(lrow, iG2_Debit_Acc_Nm, tmp[5]);
                        grdDetail.SetGridText(lrow, iG2_debit_acctcode_pk, tmp[1]);
                    }
                }                                                                    				
			}
            else if (lcol == iG2_WH_Name )
            {
                var fpath   = System.RootURL + "/standard/forms/fm/gf/PopUpGetWareHouse.aspx";
                var object  =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
                if(object!=null)
                {                                   
                    grdDetail.SetGridText(lrow,iG2_WH_Name, object[2]);
                    grdDetail.SetGridText(lrow,iG2_tin_warehouse_pk, object[0]);                        
                }                                                                                
            }
            else if(lcol == iG2_PL_Cd )
            {
                if(Trim(lstCompany.value)=='')
                {
                    alert('Must select Company!!!');
                    return ;
                }              
                var path = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?dsqlid=SP_SEL_PL_POPUP_PLPK&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name&comm_nm=" + "&val1="; //SP_SEL_fmgf00050_2
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
                if(object != null)
                {
                    grdDetail.SetGridText(lrow, iG2_tac_abplcenter_pk, object[2] );
                    grdDetail.SetGridText(lrow, iG2_PL_Cd, object[0] );
                    grdDetail.SetGridText(lrow, iG2_PL_Nm, object[1] );
                }                
            }
        break ;
    case "grdSearch":
	    var lcol = event.col;
	    var lrow = event.row ;
	    if( lcol == iG1_ACC_Seq_No && Trim(grdSearch.GetGridData(lrow, lcol)) != '' )
	    {
	        var pk = grdSearch.GetGridData(lrow, iG1_ACC_Seq_No);
	        var status = grdSearch.GetGridData(lrow, iG1_TR_STATUS);
	
	        var fpath = System.RootURL + '/standard/forms/gf/br/gfbr00030_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
	        var wWidth = 950;
	        var wHeight = 565;
	        var x = Math.round((screen.availWidth - wWidth)/2);
	        var y = Math.round((screen.availHeight - wHeight)/2);
	
	        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	        "lef="+ x +",top=" + y;
	
	        var object = System.OpenModal(fpath, wWidth, wHeight, features);                
	    }                
    break ;        
    }
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnDelete(iObj)
 {
    switch(iObj)
    {
        case '2':
	        var ctrl = grdDetail.GetGridControl();
	        var n    = ctrl.rows;
	        var row  = ctrl.row;
        	var i;
	        if ( n > 1 ) {        	
		        if ( row < 0 ) 
		        {		
		            alert('Must select a row to delete!');
		        }		
		        else 
		        {        		
			        if ( grdDetail.GetGridData( row, iG2_tco_item_pk ) == "" ) 
			        {
			            alert('Must select a row is not a total row!');
			        }
			        else 
			        {        				
				        if ( confirm ( "Do you want to delete?" ) ) 
				        {
				            var fg = grdDetail.GetGridControl();
				            
				            for(i = 1 ; i < n; i++)
				            {				
				                if(fg.isSelected(i))
					             grdDetail.SetRowStatus(i, Number("0x40"));
					        }    
				        }
				        InActiveButton();
			        }
		        }
	        }        
        break;
        case '1':
			if ( confirm ( "Do you want to delete this Slip Entry?" ) )
			  {
				grdMaster.StatusDelete();                        
				if ( txttac_omcost_pricer_PK.text != "" )                    
				{
					grdMaster.Call()                        
				}
				else                    
					alert("Please, Select a Slip entry !")
			 }        
        break;
    }
 }

function InActiveButton() 
{    
	var ctrl = grdDetail.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;	
	if ( n > 1 ) //detail has rows
	{
	    //button delete master
	    idBtnDelete.SetEnable(false);	
	    //processed or saved
		if ( row < 0 ) //not selected detail
		{
			idBtnDelete_2.SetEnable(true);
		}
		else //selected detail
		{			
			if ( grdDetail.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				idBtnDelete_2.SetEnable(false);
			}
			else 
			{
				idBtnDelete_2.SetEnable(true);
			}
		}	
	}
	else //detail empty
	{
	    idBtnDelete.SetEnable(true);
        idBtnDelete_2.SetEnable(false);        	    
	}	
	//first priority processing
    if( Trim(lblStatus.text) == 'Saved' )       
    {
        idBtnSave.SetEnable(true);
        idBtnNew_2.SetEnable(true);            
    }
    else if(Trim(lblStatus.text) == 'Processed' )
    {
        idBtnSave.SetEnable(false);
        idBtnNew_2.SetEnable(false);
        idBtnDelete.SetEnable(false);
        idBtnDelete_2.SetEnable(false);
    }
    else
    {
        idBtnSave.SetEnable(false);
        idBtnNew_2.SetEnable(false);
        idBtnDelete.SetEnable(false);
        idBtnDelete_2.SetEnable(false);    
    }		    		
}

function OnChangeAfterEdit()
{
    var lrow = event.row ;
    var lcol = event.col ;
    var lQty, lPrice ;
    if( lcol == iG2_Qty || lcol == iG2_UPrice )
    {
        lQty = Trim(grdDetail.GetGridData(lrow, iG2_Qty));
        lPrice = Trim(grdDetail.GetGridData(lrow, iG2_UPrice));
        if(lQty != "" && lPrice != "" )
        {
            grdDetail.SetGridText(lrow, iG2_Trans_Amt, Number(lQty) * Number(lPrice) );
			grdDetail.SetGridText(lrow, iG2_Books_Amt, Number(lQty) * Number(lPrice) );
        }            
    }        
}

function OnGridCellClick(iObj)
{
    switch(iObj.id)
    {
        case "grdDetail":
            InActiveButton();            
        break ;
    }
}

function OnFormatGrid()
{
    var ctrl = grdDetail.GetGridControl();
    ctrl.ColFormat(iG2_Qty)        = "###,###,###,###,###.##R";
    ctrl.ColFormat(iG2_UPrice)     = "###,###,###,###,###.##R";
    ctrl.ColFormat(iG2_Trans_Amt)  = "###,###,###,###,###.##R";
    ctrl.ColFormat(iG2_Books_Amt)  = "###,###,###,###,###.##R";        
}

function OnExcel()
{
    if(grdSearch.row > 0)
    {
        var url =System.RootURL + '/standard/reports/fm/gf/fmgf00130.aspx?company=' + lstCompany.value + '&voucher_pk=' + txttac_omcost_pricer_PK.text  ;
        System.OpenTargetPage(url); 
    }                
}

//-----------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("tLEFT");    
    var right = document.all("tRIGHT");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }

//-----------------------------------------------------
</script>
<body>
<!------------------------------------------------------------------------>
<gw:data id="fmgf00130" onreceive=""> 
    <xml> 
        <dso type="grid" function="ac_sel_60170160_search" > 
            <input bind="grdSearch" > 
                 <input bind="lstCompany_1" />
                 <input bind="txtVCNo" />
                 <input bind="txtSeqNo" />
                 <input bind="dtFromDT" />
                 <input bind="dtToDT" />                 
             </input> 
            <output bind="grdSearch" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="grdMaster" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="ac_sel_60170160_grd_mst" procedure="ac_upd_60170160_ctl" > 
            <inout>
                <inout bind="txttac_omcost_pricer_PK" />
                <inout bind="lstCompany" />
                <inout bind="txtVoucherNo" />
                <inout bind="txtSEQ" />
                <inout bind="dtTransDt" />
                <inout bind="txtabemp_pk" />                
                <inout bind="txtUserID" />
                <inout bind="txtUserName" />                
                <inout bind="txtabtypetr_pk" />                
                <inout bind="txtTransCode" />
                
                <inout bind="txtTransName" />
                <inout bind="txttac_abacctcode_pk" />                
                <inout bind="txtDebitCode" />
                <inout bind="txtDebitName" />                
                <inout bind="txtDesc" />
                <inout bind="txtLocalDesc" />
                <inout bind="lstVoucherType" />
                <inout bind="lblStatus" />
                <inout bind="chkVoucher_Auto" />
                <inout bind="lstVoucherType" />    
                					
				<inout bind="txtTrSeq" />	
				<inout bind="lstWH" />	
            </inout>
        </dso> 
    </xml> 
</gw:data>

<!------------------------------------------------------------------------>
<!--_pk|tco_item_pk|Item Code|Item Name|UOM|Qty|_UPrice|_Trans Amt|_Books Amt|Debit.Cd|Debit.Nm|Credit.Cd|Credit.Nm|Description|Local Description|WH Name|_tac_abplcenter_pk|PL Cd|PL Nm|_debit_acctcode_pk|_credit_acctcode_pk|_TAC_OMCOST_PRICER_PK|_tin_warehouse_pk|_tin_linemattakeoutd_pk-->
<gw:data id="fmgf00130_2" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,5,6,7,8,9,14,15,17,20,21,22,23,24,25" function="ac_sel_60170160_g_dtl" procedure="ac_upd_60170160_g_dtl" > 
            <input bind="grdDetail" > 
                 <input bind="txttac_omcost_pricer_PK" />
				 <input bind="lstWH" />
             </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------------>
    <gw:data id="dso_initial" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_sel_60170160_list">
                <input>                      
                     <input bind="lstCompany"/>                     
                </input>  
                <output>  
                     <output bind="txtabtypetr_pk" />
					 <output bind="txtTransCode" />
					 <output bind="txtTransName" />
					 <output bind="txtDesc" />
					 <output bind="txtLocalDesc" />
					 <output bind="txtDebitPK" />
					 <output bind="txtDebitCD" />
					 <output bind="txtDebitNM" />
               </output> 
            </dso> 
        </xml> 
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

<!------------------------------------------------------------------------>
<table border="1" style="width:100%; height:100%; " cellpadding="0" cellspacing="0" >
    <tr style="height:100%"> 
        <td style="width: 22%; " id="tLEFT">
            <table style="width: 100%; height:100% " border="0" cellpadding="0" cellspacing="0" >
                <tr>
                    <td style="width:40%"></td>
                    <td style="width:30%"></td>
                    <td style="width:30%"></td>
                </tr>
                <tr style="height:4%">
                    <td align="right">Company</td>
                    <td align="left" colspan="2"><gw:list id="lstCompany_1" styles="width: 100%; " /></td>
                </tr >
                <tr style="height:4%">
                    <td align="right">Trans Date</td>
                    <td align="left" colspan="1"><gw:datebox id="dtFromDT" styles="width: 100%; " lang="1" /></td>
                    <td align="left" colspan="1"><gw:datebox id="dtToDT" styles="width: 100%; " lang="1" /></td>
                </tr>                
                <tr style="height:4%">
                    <td align="right">Voucher No</td>
                    <td colspan="2" align="right" ><gw:textbox id="txtVCNo" text="" styles="width:100%; " onenterkey="OnSearch('1')" /></td>                                
                </tr>
                <tr style="height:4%">
                    <td align="right">SEQ</td>
                    <td align="left" ><gw:textbox id="txtSeqNo" text="" styles="width:100%; " onenterkey="OnSearch('1')" /></td>                                                            
                    <td align="right"><gw:imgbtn id="btnSearch" text="Search" alt="Search" img="search" onclick="OnSearch('1')" /></td>
                </tr>
                <tr style="height:84%" >
                    <td colspan="3">
                        <gw:grid id='grdSearch'
                        header='_pk|Voucher No|Trans Date|ACC Voucher No|ACC Seq No|_TR_STATUS'
                        format='0|0|4|0|0|0'
                        aligns='0|0|0|0|0|0'
                        defaults='|||||' editcol='0|1|1|1|1|0'                   		
                        widths='0|2000|1000|1500|800|0'
                        acceptNullDate='T'
                        sorting='T' styles='width:100%; height:100%'
                        oncellclick="OnSearch('2')"
                        oncelldblclick = "OnGridCellDblClick(this)"                                                            
                        />
                 </td>
                </tr> 
            </table>                                                                                                 
        </td>
        <td id="tRIGHT" style="width: 78%; ">
            <table style="width: 100%; height:100%; " border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 10%"></td>
                    <td style="width: 12%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 15%" ></td>  
                    <td style="width: 10%" ></td>
                    <td style="width: 7%" ></td>
                    <td style="width: 13% " ></td>
                    <td style="width: 4%" ></td>
                    <td style="width: 7%" ></td>
                    <td style="width: 2%" ></td>
                    <td style="width: 2%" ></td>
                    <td style="width: 2%" ></td>
                    <td style="width: 2%" ></td>
                    <td style="width: 2%" ></td>
                    <td style="width: 2%" ></td>                                                         
                </tr>   
                <tr style="height:4%" >
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width: 100%" /></td>
                    <td align="right">Voucher Type</td>
                    <td align="left"><gw:list id="lstVoucherType" styles="width: 100%" /></td>
                    <td align="right">Voucher No</td>
                    <td align="left"><gw:checkbox id="chkVoucher_Auto" styles="width: 100%" onchange="OnVoucherAuto()" /></td>
                    <td align="left"><gw:textbox id="txtTrSeq" styles="width: 100%" onkeypress="Upcase()"  /></td>                    
                    <td align="left" colspan="3" ><gw:textbox id="txtVoucherNo" styles="width: 100%" /></td>                    
                    <td align="right" ><gw:imgbtn id="idBtnReset" img="reset" alt="Reset" text="Reset" styles="width: 100%" onclick="OnReset()" /></td>
                    <td align="right" ><gw:imgbtn id="idBtnNew" img="new" alt="New" text="New" styles="width: 100%" onclick="OnAddNew('1')" /></td>
                    <td align="right" ><gw:imgbtn id="idBtnSave" img="save" alt="Save" text="Save" styles="width: 100%" onclick="OnSave('1')" /></td>
                    <td align="right" ><gw:imgbtn id="idBtnDelete" img="delete" alt="Delete" text="Delete" styles="width: 100%" onclick="OnDelete('1')" /></td>
                    <td align="right" ><gw:imgbtn id="idBtnExcel" img="excel" alt="Excel" text="Excel" styles="width: 100%" onclick="OnExcel()" /></td>                                                                                                                            
                </tr>             
                <tr style="height:4%">
                    <td align="right" >Trans Date</td>
                    <td align="right"><gw:datebox id="dtTransDt" styles="width: 100%" lang="1" /></td>
                    <td align="right">Department</td>
                    <td align="left"><gw:textbox id="txtDepartment"             styles="width: 100%" /></td>
                    <td align="right"><a title="Click here to select Employee"  onclick="OnPopUp('Proposed By')" href="#tips">Proposed By</a>&nbsp;</td>
                    <td align="left" colspan="1"><gw:textbox id="txtUserID"     styles="width: 100%" /></td>
                    <td colspan="4" align="left"><gw:textbox id="txtUserName"   styles="width: 100%" /></td>
                    <td colspan="2" align="right">Status:</td>
                    <td colspan="3"><gw:label id="lblStatus" text="" styles="width:100%" /></td>
                </tr>
                <tr style="height:4%">
                    <td align="right"><a title="Click here to select transaction type" onclick="OnPopUp('Trans Type')" href="#tips">Trans Type</a>&nbsp;</td>
                    <td align="left"><gw:textbox id="txtTransCode" styles="width: 100%" csstype="mandatory" /></td>
                    <td colspan="2" align="left"><gw:textbox id="txtTransName" styles="width: 100%" csstype="mandatory" /></td>
                    <td align="right"><a title="Click here to select Debit account" onclick="OnPopUp('Debit Account')" href="#tips">Debit Account</a>&nbsp;</td>
                    <td align="left" colspan="2" ><gw:textbox id="txtDebitCode" styles="width: 100%" csstype="mandatory" /></td>
                    <td colspan="8" align="left"><gw:textbox id="txtDebitName" styles="width: 100%" csstype="mandatory" /></td>
                </tr>                                
                <tr style="height:4%">
                    <td align="right">Desc</td>
                    <td colspan="3" align="left"><gw:textbox id="txtDesc" styles="width: 100%" /></td>
                    <td align="right">Local Desc</td>
                    <td colspan="10" align="left"><gw:textbox id="txtLocalDesc" styles="width: 100%" /></td>                
                </tr>
                <tr style="height:4%">
                    <td colspan="1"	align="right" >Get Data</td>
					<td colspan="1" align="left" ><gw:list id="lstGetData" styles="width:100%" >						
						</gw:list>
					</td>
					<td align="right">WH</td>
					<td colspan="1" align="left" ><gw:list id="lstWH" styles="width:100%" onchange="fmgf00130_2.Call('SELECT')" /></td>					
					<td colspan="4"></td>
					<td colspan="2" align="right"></td>
					<td colspan="3"></td>
                    <td align="right" ><gw:imgbtn id="idBtnNew_2" img="new" alt="Get Free Item" text="New" styles="width: 100%" onclick="OnAddNew('2')" /></td>                                      
                    <td align="right" ><gw:imgbtn id="idBtnDelete_2" img="delete" alt="Delete Item" text="Delete" styles="width: 100%" onclick="OnDelete('2')" /></td>                                                                  
                </tr>
                <tr style="height:80%">
                    <td colspan="15">
                        <gw:grid id='grdDetail'
                            header='_pk|Slip No|_tco_item_pk|Item Code|Item Name|UOM|Qty|UPrice|Trans Amt|Books Amt|Debit.Cd|Debit.Nm|Credit.Cd|Credit.Nm|Description|Local Description|WH Name|_tac_abplcenter_pk|PL Cd|PL Nm|_debit_acctcode_pk|_credit_acctcode_pk|_TAC_OMCOST_PRICER_PK|_tin_warehouse_pk|_tin_linemattakeoutd_pk|_tlg_co_cost_center_pk'
                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            aligns='0|1|0|0|0|1|3|3|3|3|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='|||||||||||||||||||||||||' 
							editcol='0|0|0|0|0|1|1|1|1|1|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0'                   		
                            widths='0|1300|0|1000|3000|800|1000|1000|1500|1500|1000|2000|1000|2000|2000|2000|1500|0|800|1500|0|0|0|0|0|0'
                            parameter='0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25'
                            acceptNullDate='T'
                            sorting='T' 
							styles='width:100%; height:100%' 
                            oncelldblclick = "OnGridCellDblClick(this)"
                            onafteredit="OnChangeAfterEdit()"
                            oncellclick="OnGridCellClick(this)"                            
                            />                                                                                                                               
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
<!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />      
<!------------------------------------------------------------------------>
    
<gw:textbox id="txttac_omcost_pricer_PK" style="display:none" />
<gw:textbox id="txtabemp_pk" style="display:none" />
<gw:textbox id="txtabtypetr_pk" style="display:none" />
<gw:textbox id="txttac_abacctcode_pk" style="display:none" />
<gw:textbox id="txtDept_PK" style="display:none" />
<gw:textbox id="txtReturn" style="display:none" />

<gw:textbox id="txtDebitCD" style="display:none" />
<gw:textbox id="txtDebitNM" style="display:none" />
<gw:textbox id="txtDebitPK" style="display:none" />
<gw:textbox id="txtSEQ" style="display:none" />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>
