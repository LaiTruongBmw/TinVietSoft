<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
//var flag='new';
var _book_rate = 0;
var _Book_CCY = "VND";
var Trans_amt = 4;

function BodyInit()
{
   BindingDataList();
   ChangeEx();
   FormatGrid(); 
   txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   dso_getCompany.Call();
  
}
//--------------------------------------------------------------------------------------------
function ChangeEx()
{
   txtExrate2.SetDataText('1');
   txtexrate1.SetDataText("1");
   txtexrate1.SetEnable(false);
   txt_row.text    = 1;
   
    var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   listccy.SetDataText(ls_current);
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
   
  <%=CtlLib.SetGridColumnComboFormat("GridTerms",2,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB043' and a.del_if = 0 and b.del_if = 0")%>;
   
}
//------------------------------------------------------------------------------------------
function BindingDataList()
 {      
     var data ;
     var arr;
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_COMMONCODE('EACBK014') FROM DUAL")%>";
     lstReport.SetDataText(data);
     
     txtuser_pk.text =  "<%=Session("USER_PK") %>";
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
     cboStatus.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_DEFAULT('ACBG0010') FROM DUAL")%>";
     arr  = data.split("|");
	 cboStatus.SetDataText(arr[1]);
	 data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
     listccy.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_COMMONCODE('GFQC0001') FROM DUAL")%>";
     lstArea.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_COMMONCODE('ACCR0110') FROM DUAL")%>";
     lstVatrate.SetDataText(data);
     data = "<%=CtlLib.SetListDataFUNC("SELECT  SF_A_GET_COMMONCODE('GFQC0002') FROM DUAL")%>";
     lstUnit.SetDataText(data);
     
     
	 var trl = GridDetail.GetGridControl();
	 SetControlFormat();
	 trl.FrozenCols = 5;
	 data = "<%=CtlLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tlg_it_uom a where del_if=0" ) %> "; 
     GridDetail.SetComboFormat(5,data);
     data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'ACCR0110' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm" ) %> "; 
     GridDetail.SetComboFormat(9,data);
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0053' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm" ) %> "; 
     idGrid_Main.SetComboFormat(2,data);
     
 }
 //------------------------------------------------------------------------------------------

 function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}
//------------------------------------------------------------------------------------------

function SetControlFormat()
{
    var ctrl1 = GridDetail.GetGridControl();
    ctrl1.ColFormat(6) = "#,###,###,###,###,###,###,###.##R";  
    ctrl1.ColFormat(7) = "#,###,###,###,###,###,###,###.##R";  
    ctrl1.ColFormat(8) = "#,###,###,###,###,###,###,###.##R";
   
    //ctrl1.ColFormat(10) = "#,###,###,###,###,###,###,###.##R";
    //ctrl1.ColFormat(11) = "#,###,###,###,###,###,###,###.##R";
    //ctrl1.ColFormat(12) = "#,###,###,###,###,###,###,###.##R"; 
    
}
//------------------------------------------------------------------------------------------

function onSearch(index)
{
    switch(index)
    {
        case 0: // Show data on searching grid
            dat_gfqc00050_3.Call("SELECT"); 
        break;
        case 1: // Show data on control when click on searching grid
            txttac_crcontract_pk.SetDataText(GridSearch.GetGridData(GridSearch.row,0));
            flag='search';
            dat_gfqc00050_2.Call('SELECT');
        break;    
    }
}
//------------------------------------------------------------------------------------------
function BookAmt()
{
    var l_txtContractamount, l_txtAmtAdj, l_txtTotal, l_txtVatamt, l_txtAdjvatamt = 0;
    var l_txtExrate2 = 0;
    var l_txtcontract_amt = 0;
    l_txtExrate2 = Number(txtExrate2.text);
    
    if(Trim(txtContractamount.text) != "")
            {
                l_txtContractamount = Number(txtContractamount.text);
                
                l_txtcontract_amt = Number(l_txtContractamount*l_txtExrate2);
                txtContract_bamt.text = l_txtcontract_amt;
            }
    if(Trim(txtAmtAdj.text) != "")
            {
                l_txtAmtAdj = Number(txtAmtAdj.text);
                
                l_txtcontract_amt = Number(l_txtAmtAdj*l_txtExrate2);
                txtContract_bAmtAdj.text = l_txtcontract_amt;
            } 
     if(Trim(txtGrandtotal.text) != "")
            {
                l_txtGrandtotal = Number(txtGrandtotal.text);
                
                l_txtcontract_amt = Number(l_txtGrandtotal*l_txtExrate2);
                txtContract_bAmt_Final.text = l_txtcontract_amt;
            }  
      if(Trim(txtVatamt.text) != "")
            {
                l_txtVatamt = Number(txtVatamt.text);
                
                l_txtcontract_amt = Number(l_txtVatamt*l_txtExrate2);
                txtVat_bamt.text = l_txtcontract_amt;
            }  
    if(Trim(txtAdjvatamt.text) != "")
            {
                l_txtAdjvatamt = Number(txtAdjvatamt.text);
                
                l_txtcontract_amt = Number(l_txtAdjvatamt*l_txtExrate2);
                txtbAmt_adj.text = l_txtcontract_amt;
            }
    if(Trim(txtVatamt.text) != "")
            {
                l_txtVatamt = Number(txtVatamt.text);
                
                l_txtcontract_amt = Number(l_txtVatamt*l_txtExrate2);
                txtContract_bVatamt.text = l_txtcontract_amt;
            }  
   else
   
      {
        txtContractamount.text = "";
      }
                
}
//------------------------------------------------------------------------------------------
function OnChangeAmt_Receive()
{
    dso_get_rate.Call();
    OnChangeAmt();
    
}
//--------------------------------------------------------------------------------------
/*function CheckDuplicate()
{       
   for(var i = 1; i < GridSearch.rows; i++)
    {
        if(GridSearch.GetGridData(i, 2) == txtContractNo.text)
        {
            alert("Duplicated ContractNo!! ");
            txtContractNo.GetControl().focus();
            return false ;
        }
    }
    return true;
}*/
//------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {  
        case "dso_getCompany":
            dso_get_rate_book.Call();
        break;
		case "dso_get_rate_book":
				OnNew(0);
               //dat_gfqc00050_1.Call('SELECT');
        break;
        
        case "dso_get_exrate_list":
            
            dat_gfqc00050_1.Call('SELECT');
			
			
        break; 
        case "dso_get_rate":
           BookAmt();
            
        break;
        case "dat_gfqc00050_1":
           if(flag!='search')
           { 
            for(i = 1; i < GridDetail.rows; i++)
                {
                    if(GridDetail.GetGridData(i, 2)=='')
                    {
                        GridDetail.SetGridText(i, 2, txttac_crcontract_pk.text);
                        GridDetail.SetRowStatus(i, 0x20);
                    }    
                }
                if(flag=='update')
				{
					dat_gfqc00050_4.Call();
				}
           }
           else
           {
                
                dat_gfqc00050_4.Call('SELECT');
           } 
        break;  
        case "dat_gfqc00050_2":
           if(flag== 'delete')
           {
                dat_gfqc00050_3.Call('SELECT');
                return;
            }  
        
           //OnChangeAmt();
        
           if(flag!='search')
           {
                for(i=1;i< GridTerms.rows; i++)
                {
                    GridTerms.SetGridText(i, 1, txttac_crcontract_pk.text);
                    if(GridTerms.GetGridData(i,0) == '')
                    {
                    
                        GridTerms.SetRowStatus(i, 0x20);
                    }
                }
                //txttac_crcontract_pk.text = 
                dat_gfqc00050_1.Call();
           }else
           {
             dat_gfqc00050_1.Call("SELECT");
           }
        break; 
        case "dat_gfqc00050_4":
			dat_gfqc00050_5.Call('SELECT');
			
        break;
		case 'dat_gfqc00050_5':
			dso_update_grd_new.Call('SELECT');
		break;
		case 'dso_update_grd_new':
			dso_update_grd_main.Call('SELECT');
		break;
		case 'dso_update_grd_main':
			if(flag == 'new')
            {
                dat_gfqc00050_3.Call('SELECT');
            }
		break;
		case 'dso_update_grddtl_new':
			if(flag=='update')
			{
				dso_update_grd_new.Call('SELECT');
			}
		break;
        case "dso_get_exrate_list":
          /*  _book_rate = GetBookExRate(_Book_CCY);
            lblBookRate.text = _book_rate;*/
        break;
          
    }  
}
//------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------
function onPrint()
{
    var url='';
    switch(lstReport.GetData())
    {
        case "1": // A/R On Progress
            if(txttac_crcontract_pk.text !="")
            {
                url = '/standard/reports/gf/qc/gfqc00050_AR_OnProgress.aspx?p_tac_crcontract_pk=' + txttac_crcontract_pk.GetData() + '&l_company=' + cboCompany.GetData() + '&bookccy=' + listccy.value ;
                System.OpenTargetPage( System.RootURL+url , "newform" );
            }
            else
            {
                alert("Please select code master!!!");
            }
            
        break;
        case "2": // A/R On Progress - Advance From Customer
            url = '/standard/reports/gf/qc/advance.xls';
        break;
        case "3": // A/R On Progress - Turn Over
            url = '/standard/reports/gf/qc/ar_progress_turnover.xls';
        break;
        case "4": // A/R On Progress - Issue Invoice
            url = '/standard/reports/gf/qc/issue_inv.xls';
        break;
        case "5": // A/R On Progress - Collection Money
            url = '/standard/reports/gf/qc/Collection.xls';
        break;
    }
    
} 
//------------------------------------------------------------------------------------------
 
function OnPopUp(pos)
{
    switch(pos)
    {
       case 'cust_search':
            var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    //txt_CustomerID.SetDataText(object[1]);//customer id
                    txtCustomers_nm.SetDataText(object[2]);//customer name
                    //txt_CustomerPK.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;  
        case 'cust':
            var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtCust_id.SetDataText(object[1]);//customer id
                    txtCust_nm.SetDataText(object[2]);//customer name
                    txtCust_pk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break; 
        case 'cust_to':
            var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtCustto_id.SetDataText(object[1]);//customer id
                    txtCustto_nm.SetDataText(object[2]);//customer name
                    txtCustto_pk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;  
          
        case 'PL_search':
             fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompany.GetData() + '&dsqlid= AC_SEL_60020010_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
             oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            if ( oValue != null )
            {
                txtProject_pk.text = oValue[2]; 
                txtProject_nm.text   = oValue[1];
                txtProject_cd.text   = oValue[0];
            }
          
          
        break;  
        case 'Project':
             fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompany.GetData() + '&dsqlid= AC_SEL_60020010_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
             oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            if ( oValue != null )
            {
                //txtProject_pk.text = oValue[2]; 
                txtProjects_name.text   = oValue[1];
               // txtProject_cd.text   = oValue[0];
            }
         /*
            fpath   = System.RootURL + "/standard/forms/gf/qc/gfqc00050_plunit.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + cboCompany.GetData() + '&dsqlid= sp_sel_gfqc00050_plunit_tree&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
           
          var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                /*if (object[0] != 0)
                {
                   txtProject_pk.text=object;     // Center PK
                    dat_gfqc00050_popup.Call();
                }   
                     txtProjects_nm.text   = object[1];    
            }*/    
        break;      
                                                  
    }	       
} 
//----------------------------------------------------------------------------------
function UnDelete()
{ 
    GridDetail.UnDeleteRow();
}             
//--------------------------------------------------------------------
function OnChangeAmt()
{
    var l_contract_amt =0;
	var l_contract_famt = 0;
	var l_unit_price =Number(txtUnitprice.GetData());
	var l_Qty = Number(txtQuantity.GetData());
	var l_vat_rate = lstVatrate.GetData();
	if(!isNaN(l_vat_rate)){
	    l_vat_rate = Number(l_vat_rate);
	}else
	{
	    l_vat_rate =0;
	}


	
	var l_contract_vat =0;
	var l_contract_fvat =0;
	var l_contract_amt_adj = txtAmtAdj.GetData();
	var l_contract_famt_adj = 0;
	var l_vat_adj =txtAdjvatamt.GetData();
	var l_fvat_adj = 0;
	var l_contract_final_amt = 0;
	var l_contract_final_famt = 0;
	
	var l_FTotalAdjAmount = 0;
	var l_AdjAmtTemp = 0;
	var l_QtyAdj = 0;
	
	var l_TotalVatAdjTmp = 0;
	var l_TotalVatAdj = 0;
	var l_NetTotal = 0;
	var l_amt6 =0 ;
	var l_amt10 =0 ;
	var l_amt11 =0 ;
	var l_amt12 =0 ;
	l_contract_famt = l_unit_price*l_Qty;
	txtContractamount.SetDataText('' +l_contract_famt);
	l_contract_fvat = l_contract_famt*l_vat_rate/100;
	txtVatamt.SetDataText('' +l_contract_fvat);
	l_NetTotal = Number(l_contract_amt_adj)  +  Number(l_contract_famt);
	txtamt5.SetDataText('' +l_NetTotal);
	l_amt6 = Number(l_contract_famt) + Number(txtVatamt.GetData());
	txtTotal.SetDataText('' +l_amt6);
	l_amt10 = Number(l_vat_adj)  + Number(txtVatamt.GetData());
	txtamt9.SetDataText('' +l_amt10);
	l_amt11 = Number(txtAmtAdj.GetData()) + Number(txtAdjvatamt.GetData());
	Totaladj_amt.SetDataText('' +l_amt11);
	l_amt12 = Number(txtamt5.GetData()) + Number(txtamt9.GetData());
	txtGrandtotal.SetDataText('' +l_amt12);
	
	
	l_txtExrate2 = 0;
	l_txtExrate2 = Number(txtExrate2.text);
	
	if(Trim(txtContractamount.text) != "")
            {
                
                
                l_txtcontract_amt = Number(l_contract_famt*l_txtExrate2) / Number(lblBookRate.text) ;
              // alert(lblBookRate.text);
              // alert(l_txtExrate2);
                if(txtbookccy.text = "VND")
                {
                    l_txtcontract_amt = Math.round(l_txtcontract_amt);
                }
                else
                {
                    l_txtcontract_amt = Math.round(l_txtcontract_amt * 100) / 100;
                }
                txtContract_bamt.text = l_txtcontract_amt;
            }
    if(Trim(txtAmtAdj.text) != "")
            {
                
                
                l_txtcontract_amt = Number(l_contract_amt_adj*l_txtExrate2);
                txtContract_bAmtAdj.text = l_txtcontract_amt;
            }    
    if(Trim(txtGrandtotal.text) != "")
            {
                
                
                l_txtcontract_amt = Number(l_amt12*l_txtExrate2) / Number(lblBookRate.text) ;
                if(txtbookccy.text = "VND")
                {
                    l_txtcontract_amt = Math.round(l_txtcontract_amt);
                }
                else
                {
                    l_txtcontract_amt = Math.round(l_txtcontract_amt * 100) / 100;
                }
                txtContract_bAmt_Final.text = l_txtcontract_amt;
            }  
    if(Trim(txtVatamt.text) != "")
            {
                
                
                l_txtVatamt = Number(l_contract_fvat*l_txtExrate2);
                txtVat_bamt.text = l_txtVatamt;
            }
     if(Trim(txtAdjvatamt.text) != "")
            {
                
                
                l_txtAdjvatamt = Number(l_vat_adj*l_txtExrate2);
                txtbAmt_adj.text = l_txtAdjvatamt;
            }
     if(Trim(txtVatamt.text) != "")
            {
                
                
                //l_txtVatamt = Number(l_contract_fvat*l_txtExrate2);
                txtContract_bVatamt.text = l_txtVatamt;
            }
    else
    {
        txtContract_bamt.text = "";
    }
	
	OnEdit();
	
}
//--------------------------------------------------------------------
var flag ="";
function OnSave(obj)
{
    switch(obj)
	{
		case 0:
			if(onValidate())
			{
				if(txttac_crcontract_pk.GetData()!='') flag='update';
				dat_gfqc00050_2.Call();
			} 
		break;
		case 1:
			if(txttac_crcontract_pk.GetData()!='')
			{
				dat_gfqc00050_4.Call();
			}
		break;
		case 5:
			dso_update_grd_new.Call();
		break;
		case 6:
			flag='update';
			dso_update_grddtl_new.Call();
		break;
		case 7:
			dso_update_grd_main.Call();
		break;
	}	
}
//--------------------------------------------------------------------
function onDelete(index)
{
    switch(index)
    {
        case 0:
            if(txttac_crcontract_pk.GetData()!='')
            {
                if(confirm('Do you want to delete selected contract?'))
                {
                     flag='delete';
                     dat_gfqc00050_2.StatusDelete();
                     dat_gfqc00050_2.Call();
                }
            }    
        break;
        case 1:
            if(confirm('Do you want to delete selected item(s)?'))
            {
                GridDetail.DeleteRow();
                dat_gfqc00050_4.Call();
            }
        break;
		case 5:
            if(confirm('Do you want to delete?'))
            {
                idGridMst.DeleteRow();
                dso_update_grd_new.Call();
            }
        break;
		case 6:
            if(confirm('Do you want to delete?'))
            {
                flag='delete';
				idGrdDtl.DeleteRow();
                dso_update_grddtl_new.Call();
            }
        break;
		case 7:
            if(confirm('Do you want to delete?'))
            {
                idGrid_Main.DeleteRow();
                dso_update_grd_main.Call();
            }
        break;
    }         
}
//-------------------------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
    var x = c.toUpperCase().charCodeAt(0);
    event.keyCode = x;
}
//--------------------------------------------------------------------
function  OnNew(index)
{
    switch(index)
    {
        case 0: // New master
            flag='new';
            dat_gfqc00050_2.StatusInsert();
            txtuser_pk.text =  "<%=Session("USER_PK") %>";
            GridDetail.ClearData();
			
			dat_gfqc00050_1.Call("SELECT");
           for(var i = 1; i < GridTerms.rows; i++)
           {
                for(var j = 3; j < GridTerms.cols ; j++)
                {
                    GridTerms.SetGridText(i, j, "");
                }                
           }
            chkauto_YN.SetDataText("Y");
            ChangeEx();
        break;
        case 1: // new free detail
            GridDetail.AddRow();
            GridDetail.SetGridText( GridDetail.rows-1, 2, txttac_crcontract_pk.text); //master_pk	  
        break;
        case 2: // new free detail
        if(GridDetail.col=="3")
        {
            var path = System.RootURL + '/standard/forms/60/02/60020010_popup.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             var isAlready, j ;                                                     
             if ( object != null )
             {
                   
                    for( var i=0; i < object.length; i++)	  
                    {	
                         var arrTemp = new Array();
                         arrTemp = object[i];
                         isAlready = 0 ;
                          for(var k=1; k<GridDetail.rows;k++)
                          {
	                        //alert(GridDetail.GetGridData(k , 15));
	                        //alert(arrTemp[0]);
	                        if (GridDetail.GetGridData(k , 15)== arrTemp[0]) // da co item_pk
					        {					            					            
						        isAlready=1;						        
						        j = k ;						        
						        break;	
					        }		
                         }
                    
                     if(isAlready==0) 
	                    {    
                                if(i!=0)
                                {
                                    arrTemp = object[i];
                                    GridDetail.AddRow();
                                    GridDetail.SetGridText( GridDetail.rows-1, 2, txttac_crcontract_pk.text); //master_pk	    	                                               
                                    GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                    GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                                }
                                else
                                {
                                    arrTemp = object[i];
                                    
                                    GridDetail.SetGridText( GridDetail.rows-1, 2, txttac_crcontract_pk.text); //master_pk	    	                                               
                                    GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                    GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                    GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                                }
                         }
                      else 
                        {
                             GridDetail.RemoveRowAt(j) ;
                        }      
                    }		            
             }  
             GridDetail.SetGridText(GridDetail.rows-1,1,'') 
    }
        break;
        case 4: // new free detail
            var path = System.RootURL + '/standard/forms/60/02/60020010_popup.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             var isAlready, j ;                                                     
             if ( object != null )
             {
                   
                    for( var i=0; i < object.length; i++)	  
                    {	
                         var arrTemp = new Array();
                         arrTemp = object[i];
                         isAlready = 0 ;
                          for(var k=1; k<GridDetail.rows;k++)
                          {
	                        //alert(GridDetail.GetGridData(k , 15));
	                        //alert(arrTemp[0]);
	                       if (GridDetail.GetGridData(k , 15)== arrTemp[0]) // da co item_pk
					        {					            					            
						        isAlready=1;						        
						        //j = k ;						        
						        break;	
					        }		
                         }
                    
                     if(isAlready==0) 
	                    {    
                          //  if(i != 0)
                          //  {
                                arrTemp = object[i];
                                GridDetail.AddRow();
                                GridDetail.SetGridText( GridDetail.rows-1, 2, txttac_crcontract_pk.text); //master_pk	    	                                               
                                GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                            // }
                            /* else
                             {
                                 arrTemp = object[i];
                               
                                GridDetail.SetGridText( GridDetail.rows-1, 2, txttac_crcontract_pk.text); //master_pk	    	                                               
                                GridDetail.SetGridText( GridDetail.rows-1, 15, arrTemp[0]);//item_pk	    
                                GridDetail.SetGridText( GridDetail.rows-1, 3,   arrTemp[1]);//item_code	    
                                GridDetail.SetGridText( GridDetail.rows-1, 4,   arrTemp[2]);//item_name	    
                                GridDetail.SetGridText( GridDetail.rows-1, 5,         arrTemp[5]);//item_uom
                                GridDetail.SetGridText( GridDetail.rows-1, 8,         arrTemp[7]);//item_uom
                             }*/
                         }
                      else 
                        {
                             GridDetail.RemoveRowAt(j) ;
                        }      
                    }		            
             }  
             GridDetail.SetGridText(GridDetail.rows-1,1,'') 
		break;
		case 5:
			if(txttac_crcontract_pk.text =='')
			{
				alert('Please select Contract !!');
			}
			else
			{
				idGridMst.AddRow();
				idGridMst.SetGridText( idGridMst.rows-1, 1, txttac_crcontract_pk.text); //master_pk	 
			}
		break;
		case 6:
			if(txtTAC_CRCONTRACT_SCH_pk.text =='' || txtTAC_CRCONTRACTD_pk.text == '')
			{
				alert('Please select grid master !!');
			}
			else
			{
				idGrdDtl.AddRow();
				idGrdDtl.SetGridText( idGrdDtl.rows-1, 1, txtTAC_CRCONTRACT_SCH_pk.text); //master_pk	 
				idGrdDtl.SetGridText( idGrdDtl.rows-1, 2, GridDetail.GetGridData(GridDetail2.row,0));
				idGrdDtl.SetGridText( idGrdDtl.rows-1, 3, GridDetail.GetGridData(GridDetail2.row,4));
				idGrdDtl.SetGridText( idGrdDtl.rows-1, 4, GridDetail.GetGridData(GridDetail2.row,8));
			}
		break;
		case 7:
			if(txttac_crcontract_pk.text =='')
			{
				alert('Please select Contract !!');
			}
			else
			{
				idGrid_Main.AddRow();
				idGrid_Main.SetGridText( idGrid_Main.rows-1, 1, txttac_crcontract_pk.text); //master_pk	 
			}
		break;
    }        
}
//--------------------------------------------------------------------
function onValidate()
{
    if(txtContractNo.GetData()=="")
    {
        alert('Please inpput contract no first.');
        txtContractNo.GetControl().focus();
        return false;
    }
    if(txtProject_pk.GetData()=="")
    {
        alert('Please select project first.');
        txtProject_cd.GetControl().focus();
        return false;
    }
    if(txtCust_pk.GetData()=="")
    {
        alert('Please select customer first.');
        txtCust_id.GetControl().focus();
        return false;
    }
    if(txtCustto_pk.GetData()=="")
    {
        alert('Please select customer turnover first.');
        txtCustto_id.GetControl().focus();
        return false;
    }
    return true;
}
//--------------------------------------------------------------------

function OnChangeCurrent()
{    
    dso_get_rate.Call();
} 
function FormatGrid()
{
    var trl;
    trl = GridTerms.GetGridControl();	
    trl.ColFormat(Trans_amt)    = "###,###,###,###,###.##";
}
function OnEdit()
{
//     if ((event.col == 7) || (event.col ==8))
//                {
//                    if (event.row != 4)
//                    {
//                        GridTerms.SetGridText(event.row,event.col,'');   
//                        return;
//                    }
//                }
             
             var ctrl   = GridTerms.GetGridControl();
	            var amount = 0;
            	var n = 0, i ;
	          
	                    
//--------------------------------------------------------------------	                    
	                    
	        for(i = 1; i < GridTerms.rows; i++)
            	{
	               var strRate = GridTerms.GetGridData(i, 6); // code 
	            
	                    if (strRate =="50")
	                    {
	                            GridTerms.SetGridText(event.row, 4,'');  // amt
	                            GridTerms.SetGridText(event.row, 3,'');  // rate
	                    }
	                    else
	                    {	                                   
                           n += Number(GridTerms.GetGridData(i,3));
                           //alert(n);
                            if(n>100)
                            {
                                 alert("The total value can not large than 100 percent!!");
                                 GridTerms.SetGridText(event.row, 3,''); 
                                 GridTerms.SetGridText(event.row, 4,''); 
                                 return;
                            }
	                     }            

	            }  // for
             amount = Number(txtGrandtotal.GetData());
             for( i = 1; i < GridTerms.rows ; i++)
             {
                 if( Number(GridTerms.GetGridData(i, 3)) != 0 && GridTerms.GetGridData(i, 3) != '') 
                 {
                     GridTerms.SetGridText(i, 4, Math.round(Number(GridTerms.GetGridData(i, 3)) / 100 * amount)) ; 
                 }
             }
}
//--------------------------------------------------------------------
function OnEditDetail()
{
    var tmp=0;
    var l_qty = GridDetail.GetGridData(GridDetail.row,6);
    var l_u_price = GridDetail.GetGridData(GridDetail.row,7);
    var l_amt = Number(l_qty) * Number(l_u_price);
    GridDetail.SetGridText(GridDetail.row,8,'' + l_amt);
    var l_vat_rate = GridDetail.GetGridData(GridDetail.row,9);
    if(!isNaN(l_vat_rate)){
	    l_vat_rate = Number(l_vat_rate);
	}else
	{
	    l_vat_rate =0;
	}
    var l_vat_amt = (Number(l_vat_rate)/100) * Number(l_amt);
    GridDetail.SetGridText(GridDetail.row,10,'' + l_vat_amt);
    var l_amt_adj=  GridDetail.GetGridData(GridDetail.row,11);
    var l_total = Number(l_amt) + Number(l_vat_amt) + Number(l_amt_adj);
    GridDetail.SetGridText(GridDetail.row,12,'' + l_total);
    
}
//--------------------------------------------------------------------
function OnSumAmt()
{
    //alert('OnSumAmt');
    var ctrl = GridDetail.GetGridControl();
      var Total  = 0;
      var VAT_Amt = 0;
      var Sum_Adj_Amt = 0;
     var Amt = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     Total = Number(Total) + Number(GridDetail.GetGridData(i, 12));
	     VAT_Amt = Number(VAT_Amt)+ Number(GridDetail.GetGridData(i,10));
	    Amt = Number(Amt) + Number(GridDetail.GetGridData(i, 8));
	    Sum_Adj_Amt = Number(Sum_Adj_Amt)+ (Number(Total) - Number(VAT_Amt));
	   
	}
	//var l_amt = System.Round(Amt,2);
	txtAmtAdj.SetDataText( "" + System.Round(Amt,2));
	txtAdjvatamt.text = "" + System.Round(VAT_Amt,2);
	OnChangeAmt();
  
}

function OnGetMst()
{
	txtTAC_CRCONTRACT_SCH_pk.text = idGridMst.GetGridData(idGridMst.row, 0);
	flag='search';
	dso_update_grddtl_new.Call('SELECT');
}

function OnCal_Amount()
{
	var _Amount = 0, _Rate = 0;
	if(event.col == '4' || event.col == '5')
	{
		_Rate = idGrdDtl.GetGridData(idGrdDtl.row,5);
		_Rate = _Rate.replace('%','');
		_Rate = Number(_Rate);
		//alert(_Rate)
		_Amount = (Number(idGrdDtl.GetGridData(idGrdDtl.row,4)) * _Rate)/100;
		idGrdDtl.SetGridText(idGrdDtl.row,6,_Amount);
	}
}

function OnGetTAC_CRCONTRACTD_PK()
{
	txtTAC_CRCONTRACTD_pk.text = GridDetail2.GetGridData(GridDetail2.row,0);
}

function OnReport_DebitNote()
{
	var url = System.RootURL + "/standard/reports/60/02/rpt_60020010_debit_note.aspx?TAC_CRCONTRACT=" + txttac_crcontract_pk.GetData()+'&TAC_CRCONTRACT_SCH_PK='+txtTAC_CRCONTRACT_SCH_pk.text;
	System.OpenTargetPage(url);	  
}
</script>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure=" AC_sel_60020010_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="cboCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!---------------------------------------------------------------------------------------->
 
  <gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure=" AC_PRO_60020010_GET_RATE"> 
                <input> 
                     <input bind="dbContractdt"/>
                     <input bind="cboCompany"/>
                     <input bind="listccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtExrate2"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------->   
<gw:data id="dso_get_rate_book" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure=" AC_PRO_60020010_GET_RATE"> 
                <input> 
                     <input bind="dbContractdt"/>
                     <input bind="cboCompany"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="lblBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!----------------------------------------------------------------------------------------------------->
 <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure=" AC_PRO_60020010_GET_BOOKCCY"> 
                <input> 
                     <input bind="cboCompany"/>
                     <input bind="dbContractdt" />
                     <input bind="txtbookccy" />
                </input>
                <output>
                     <output bind="lblBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------------->
<gw:data id="dat_gfqc00050_1"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8" function=" AC_sel_60020010_1" procedure=" AC_upd_60020010_3"   > 
            <input bind="GridTerms">                    
                <input bind="txttac_crcontract_pk" /> 
            </input> 
            <output bind="GridTerms" /> 
        </dso> 
    </xml> 
</gw:data>
<!---------------------------------------------------------------------------------------->
<gw:data id="dat_gfqc00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,47,48,49,50" function=" AC_sel_60020010_MST" procedure=" AC_UPD_60020010_MST">
                <input>
                     <inout bind="txttac_crcontract_pk"  />
                     <inout bind="cboCompany"  />
                     <inout bind="txtCust_pk"  />
                     <inout bind="txtProject_pk"  />
                     <inout bind="txtuser_pk"  />
                     
                     <inout bind="dbContractdt"  />
                     <inout bind="txtContractNo"  />
                     <inout bind="dbWorkingFr"  />
                     <inout bind="dbWorkingto"  />
                     <inout bind="dbConfirmdt"  />
                     
                     <inout bind="txtExrate2"  />
                     <inout bind="txtbook_exrate"  />
                     <inout bind="listccy"  />
                     <inout bind="txtContract_bamt"  />
                     <inout bind="txtContract_bAmtAdj"  />
                     
                     <inout bind="txtContract_bAmt_Final"  />
                     <inout bind="txtContractamount"  />
                     <inout bind="txtAmtAdj"  />
                     <inout bind="txtGrandtotal"  />
                     <inout bind="txtUnitprice"  />
                     
                     <inout bind="txtQuantity"  />
                     <inout bind="lstUnit"  />
                     <inout bind="chkauto_YN"  />
                     <inout bind="lstArea"  />
                     <inout bind="txtContract_bVatamt"  />
                     
                     <inout bind="txtVatamt"  />
                     <inout bind="dbConfirmdt"  />
                     <inout bind="txtVatamt"  />
                     <inout bind="txtAdjvatamt"  />
                     <inout bind="txtVat_bamt"  />
                     
                     <inout bind="txtbAmt_adj"  />
                     <inout bind="txtRemark"  />
                     <inout bind="txtLRemark"  />
                     <inout bind="lstVatrate"  />
                     <inout bind="txtCustto_pk"  />
                     
                     <inout bind="txtProvisionrate"  />
                     <inout bind="txtIndirectcost"  />
                     <inout bind="txtProject_cd"  />
                     <inout bind="txtProject_nm"  />
                     <inout bind="txtCust_id"  />
                     
                     <inout bind="txtCust_nm"  />
                     <inout bind="txtCustto_id"  />
                     <inout bind="txtCustto_nm"  />
                     <inout bind="txtamt5"  />
                     <inout bind="txtTotal"  />
                     
                     <inout bind="txtamt9"  />
                     <inout bind="Totaladj_amt"  />
                     <inout bind="cboStatus"  />
                     <inout bind="txtBudgetCost" />
                     <inout bind="txtProfitrate" />
                     
                     <inout bind="txtContNoEXP" />
                 </input>
            </dso>
        </xml>
    </gw:data>
 <!--------------------------------------------------------------------------->   
 <gw:data id="dat_gfqc00050_3"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"    function=" AC_sel_60020010_SEARCH"    > 
            <input bind="GridSearch"> 
				<input bind="dtFrom"/> 
				<input bind="dtTo"/> 
                <input bind="txtCustomers_nm" /> 
                <input bind="txtProjects_name" /> 
                <input bind="txtContract_s" /> 
            </input> 
            <output bind="GridSearch" /> 
        </dso> 
    </xml> 
</gw:data>
<!--------------------------------------------------------------------------->   
 <gw:data id="dat_gfqc00050_4"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,2,3,4,5,6,7,8,9,10,11,13,14,15,16" function=" AC_sel_60020010_DTL" procedure=" AC_upd_60020010_dtl"   > 
            <input bind="GridDetail">                    
                <input bind="txttac_crcontract_pk" /> 
            </input> 
            <output bind="GridDetail" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_gfqc00050_5"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"    function=" AC_sel_60020010_DTL"  > 
            <input bind="GridDetail2">                    
                <input bind="txttac_crcontract_pk" /> 
            </input> 
            <output bind="GridDetail2" /> 
        </dso> 
    </xml> 
</gw:data>
<!----------------------------------------------------------------------------->
 <gw:data id="dat_gfqc00050_popup" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure=" AC_pro_60020010_popup"  > 
                <input>
                    <input bind="txtProject_pk" />
                </input> 
                <output>
                    <output bind="txtProject_cd" />
                    <output bind="txtProject_nm" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
<!----------------------------------------------------------------------------->
<gw:data id="dso_update_grd_new"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5" function=" AC_sel_60020010_DTL1" procedure=" AC_upd_60020010_dtl1"   > 
            <input bind="idGridMst">                    
                <input bind="txttac_crcontract_pk" /> 
            </input> 
            <output bind="idGridMst" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_update_grddtl_new"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8" function=" AC_sel_60020010_DTL2" procedure=" AC_upd_60020010_dtl2"   > 
            <input bind="idGrdDtl">                    
                <input bind="txtTAC_CRCONTRACT_SCH_pk" /> 
            </input> 
            <output bind="idGrdDtl" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_update_grd_main"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7" function=" AC_sel_60020010_DTL3" procedure=" AC_upd_60020010_dtl3"   > 
            <input bind="idGrid_Main">                    
                <input bind="txttac_crcontract_pk" /> 
            </input> 
            <output bind="idGrid_Main" /> 
        </dso> 
    </xml> 
</gw:data>
<table  cellpadding=0 cellspacing=0 style='width:100%;height:100%;border:1px #1E90FF dashed'>
	<tr height='100%'>
		<td rowspan='' id="left" width="30%" valign="top">
		        <table  style='width:100%;height:100%;border-right:1px #1E90FF dashed' cellpadding=0 cellspacing=0  id="table5">
		            <tr height='2%'>
		                <td width="100%">
		                    <fieldset style="width: 100%;  padding: 0;">
		                         <table border="0" style='width:100%;height:100%' cellpadding=1 cellspacing=1  id="table5">
		                            <tr style="height:">
										<td style="width: 10%" align="right">Date&nbsp;</td>
										<td colspan="2" style="width: 27%"><gw:datebox id="dtFrom" lang="1"/>~<gw:datebox id="dtTo" lang="1"/></td>
										<td width="1%" align="right"><gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="onSearch(0)" /></td> 
									</tr>
					                <tr>
						                <td width="10%" align="right"><a title="Click here to select Customer" onclick="OnPopUp('cust_search')" href="#tips"
                                                     style="text-decoration: none; color=#0000ff"><b>Customer</b></a></td>
                                        <td width="25%" colspan="2" ><gw:textbox id="txtCustomers_nm" onEnterkey="onSearch(0)" styles="width:100%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset1" img="reset" alt="reset" onclick="txtCustomers_nm.text='';" /></td>                                     
					                </tr>
					                <tr>
						                <td width="10%" align="right"><a title="Click here to select Project" onclick="OnPopUp('Project')" href="#tips"
                                                     style="text-decoration: none; color=#0000ff"><b>Project</b></a></td>
                                        <td width="25%" colspan="2" ><gw:textbox id="txtProjects_name" onEnterkey="onSearch(0)" styles="width:100%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset2" img="reset" alt="Reset" onclick="txtProjects_name.text='';" /></td>                                     
					                </tr>
					                <tr>
						                <td width="10%" align="right">Contract</td>
                                        <td width="25%" colspan="2" ><gw:textbox id="txtContract_s" onenterkey="onSearch(0)" styles="width:100%;" /></td>
						                <td width="1%" align="right"><gw:imgbtn id="btnreset3" img="reset" alt="Reset" onclick="txtContract_s.text='';" /></td>  
						               
					                </tr>
					              </table>  
		                     </fieldset>
		                </td>
		            </tr>
					<tr height='98%'>
						<td width="100%"  colspan="4">
						    <gw:grid   
		                        id="GridSearch"  
		                        header="_pk|No|Contract|Project"   
		                        format="0|0|0|0"  
		                        aligns="0|1|0|0"  
		                        defaults="|||"  
		                        editcol="1|1|1|1"  
		                        widths="0|0|0|0"  
		                        styles="width:100%; height:100%"   
		                        sorting="T" 
								autosize="T"
		                        oncellclick="onSearch(1)"
		                     /> 
						</td>
                    </tr>
				</table>
		</td>
		<td id="right" width="70%" valign="top">
			<table border="0" cellpadding=0 cellspacing=0 style='width:100%;height:100%' id="table4">
				<tr height='2%'>
					<td colspan="">					
						<fieldset style="width: 100%;padding: 0;">
						<table border="0" style='width:100%;height:100%' cellpadding=1 cellspacing=1  id="table5">
							<tr>
								<td width="10%">Company</td>
								<td width="40%" colspan="4" ><gw:list id="cboCompany" styles="width:100%;" /></td>
								<td width="12%" align="right" >Status</td>
								<td width="20%" colspan="2"><gw:list id="cboStatus" styles="width:100%;" /></td>
								<td width="1%" align="right"><gw:button id="btnNewMST" img="new" alt="New" onclick="OnNew(0)" /></td>
								<td width="1%" align="right"><gw:button id="btnsaveMST" img="save" alt="Save" onclick="OnSave(0)" /></td>
								<td width="1%" align="right"><gw:button id="btndelMST" img="delete" alt="Delete" onclick="onDelete(0)" /></td>
								<td width="1%" align="right"><gw:button id="btnexcelMST" img="excel" text="Print"alt="Print" onclick="onPrint()" /></td>
							</tr>
							<tr>
								<td width="10%"><a title="Click here to select Project" onclick="OnPopUp('PL_search')" href="#tips" style="text-decoration: none; color=#0000ff"><b>Project</b></a></td>
								<td colspan='4'>
									<table style='width:100%' cellpadding=0 cellspacing=0>
										<tr>
											<td width="40%" colspan="" ><gw:textbox id="txtProject_cd" csstype="mandatory" styles="width:100%;" readonly='true' /><gw:textbox id="txtProject_pk" styles="width:0%;display:none" /></td>
											<td width="60%" colspan="" ><gw:textbox id="txtProject_nm" csstype="mandatory" styles="width:100%;" readonly='true' /></td>
											<td width="" align="right"><gw:imgbtn id="btnreset4" img="reset" alt="reset" onclick="txtProject_pk.text ='';txtProject_nm.text ='';txtProject_cd.text ='';" /></td>
										</tr>
									</table>
								</td>
								<td width="12%" align="right" ><a title="Reports"  style="color=#ffff00 "><font color="#000000">Reports</font></a></td>
								<td width="20%" colspan="6"><gw:list id="lstReport" styles="width:100%;" /></td>							   
							</tr>
							<tr>
								<td width="10%"><a title="Contract No"  style="color=#ffff00 "><font color="#000000">Cont. No</font></td>
								<td colspan='4'>
									<table style='width:100%' cellpadding=0 cellspacing=0>
										<tr>
											<td width="40%" ><gw:textbox id="txtContractNo" csstype="mandatory" onkeypress="Upcase()"    styles="width:100%;" /></td>
											<td width="50%"  ><gw:textbox id="txtContNoEXP" onkeypress="Upcase()"    styles="width:100%;" /></td>
											<td  width="10%" style='' align="right">Auto</td>
											<td ><gw:checkbox id="chkauto_YN" defaultvalue="Y|N" value="Y" onclick="chkChange()" /></td>
										</tr>
									</table>
								</td>
								<td width="12%" align="right" ><a title="Contract date"  style="color=#ffff00 "><font color="#000000">Contract. dt</font></a></td>
								<td width="20%" colspan="2"><gw:datebox id="dbContractdt" lang="1" lang="1" styles="width:100%;" /></td>								
								<td width="22%" colspan="2" align=center>Book rate: </td>
							   <td align=left width="20%" colspan="2"><gw:textbox id="lblBookRate" csstype="mandatory" readonly='true'  format="#,###,###,###,###,###,###.###" type="number"/></td>
							</tr>
						</table>
						</fieldset>
					</td>
				</tr>
				<tr height='98%'>
					<td valign='top' >
						<gw:tab id="tabMain" style="width:100%;height:100%;border-top: 1px #1E90FF dashed;" onpageactivate="" onclick =""> 
							<table border="0" name="Tab 1" cellpadding=1 cellspacing=1 style='width:100%;height:100%' >
								<tr>
								<td valign="top" width="50%">			
									<table border="0" cellpadding=1 cellspacing=1 style='width:100%;height:100%;' id="table6">
										<tr height='2%'>
											<td width="10%" align="left"><a title="Area"  style="color=#ffff00 "><font color="#000000">Area</font></a></td>
											<td width="90%" colspan="3"><gw:list id="lstArea"  styles="width:100%;" /></td>									
										</tr>
										<tr height='2%'>
											<td width="20%"><a title="Click here to select Customer" onclick="OnPopUp('cust')" href="#tips" style="text-decoration: none; color=#0000ff">Customer</a></td>
											<td colspan='3'>
												<table style='width:100%' cellpadding=0 cellspacing=0>
													<tr>
														<td width="40%"><gw:textbox id="txtCust_id" csstype="mandatory" readonly='true' styles="width:100%;" /><gw:textbox id="txtCust_pk"  styles="display:none" /></td>
														 <td width="60%"><gw:textbox id="txtCust_nm" csstype="mandatory"  readonly='true' styles="width:100%;"/></td>
														 <td width=""><gw:imgbtn id="btnRest5" img="reset" alt="Reset" onclick="txtCust_id.text='';txtCust_pk.text='';txtCust_nm.text='';" /></td>
													</tr>
												</table>
											</td>
											 
										</tr>
										<tr height='2%'>
											<td width="20%"><a title="Click here to select Customer Turnover" onclick="OnPopUp('cust_to')" href="#tips" style="text-decoration: none; color=#0000ff">Cust. T/O</a></td>
											<td colspan='3'>
												<table style='width:100%' cellpadding=0 cellspacing=0>
													<tr>
														 <td width="40%"><gw:textbox id="txtCustto_id" csstype="mandatory" readonly='true' styles="width:100%;" /><gw:textbox id="txtCustto_pk"  styles="display:none" /></td>
														 <td width="60%"><gw:textbox id="txtCustto_nm" csstype="mandatory" readonly='true' styles="width:100%;" /></td>
														 <td width=""><gw:imgbtn id="btnRest6" img="reset" alt="Reset" onclick="txtCustto_pk.text='';txtCustto_id.text='';txtCustto_nm.text='';" /></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr height='2%'>
											<td width="20%"><a title="Remark"  style="color=#ffff00 "><font color="#000000">Remark</font></a></td>
											<td width="80%" colspan="3"><gw:textbox id="txtRemark" styles="width:100%;"  /></td>
										</tr>
										<tr height='2%'>
											<td width="20%"><a title="Local Remark"  style="color=#ffff00 "><font color="#000000">L.Remark</font></a></td>
											<td width="80%" colspan="3"><gw:textbox id="txtLRemark"  styles="width:100%;" /></td>								   
										</tr>
										<tr height='90%' >
							<!--0_pk|1_tac_crcontract_pk|2.Terms Type|3.Rate|4.Trans.Amt.|5_BooksAmt.|6_code|7.Valid From|8.Valid To-->
											<td width="50%" colspan="4">
												<fieldset style="width: 100%;height:100%;padding: 0">
													<legend>Terms type management</legend>
														<gw:grid  id="GridTerms" 
															header="_pk|_tac_crcontract_pk|Terms Type|Rate|Trans.Amt.|BooksAmt.|_code|Valid From|Valid To"   
															format="0|0|0|0|0|0|0|4|4"  
															aligns="0|0|0|3|3|3|0|0|0"  
															defaults="||||||||"  
															editcol="1|1|1|1|1|1|1|1|1"  
															widths="0|0|0|0|0|0|0|0|0"  
															styles="width:100%; height:100%"   
															sorting="T"
															autosize="T"
															acceptNullDate="T"
															onafteredit="OnEdit()"
														/> 
												</fieldset>
											</td>
										</tr>
									</table>
								</td>
								<td valign="top" rowspan="" width="50%">
									<fieldset style="width: 100%;padding: 0;" >
										<table border="0"  cellpadding=0 cellspacing=0 style='width:100%;height:100%' id="table7">
											<tr>								
												<td width="30%" align="left"><a title="Confirm date"  style="color=#ffff00 "><font color="#000000">Confirm dt.</font></a></td>
												<td width="25%" colspan="3"><gw:datebox id="dbConfirmdt" lang="1" styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right">Using</td>
												<td width="20%" colspan="2" align="right" ><gw:datebox id="dbUsingdt"  lang="1"  /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Working Period From"  style="color=#ffff00 "><font color="#000000">Working</font></a></td>
												<td width="25%" colspan="3"><gw:datebox id="dbWorkingFr" lang="1"  styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right">To</td>
												<td width="20%" colspan="2" align="right" ><gw:datebox id="dbWorkingto" lang="1"/></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Budget Cost"  style="color=#ffff00 "><font color="#000000">Budget</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtBudgetCost"  styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right"><a title="Profit rate(%)"  style="color=#ffff00 "><font color="#000000">Profit</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="txtProfitrate"  styles="width:100%;" /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Provision rate"  style="color=#ffff00 "><font color="#000000">Prov. rate</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtProvisionrate"  styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right"><a title="Indirect cost rate"  style="color=#ffff00 "><font color="#000000">Ind. rate</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="txtIndirectcost"  styles="width:100%;" /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Contract currency"  style="color=#ffff00 "><font color="#000000">Currency</font></a></td>
												<td width="25%" colspan="3"><gw:list id="listccy" onchange="OnChangeCurrent()" styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right"><a title="Exchange rate"  style="color=#ffff00 "><font color="#000000">Ex. rate</font></a></td>
												<td width="10%" colspan="1" align="right" ><gw:textbox id="txtexrate1" text="1" format="#,###,###,###,###,###,###" type="number"  styles="width:100%;" /></td>
												<td width="10%" colspan="1" align="right" ><gw:textbox id="txtExrate2" text="1" format="#,###,###,###,###,###,###" type="number"   styles="width:100%;" /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Quantity (manual input)"  style="color=#ffff00 "><font color="#000000">Qty. (1)</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtQuantity" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()"  styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
												<td width="25%" colspan="1" align="right">Unit</td>
												<td width="20%" colspan="2" align="right" ><gw:list id="lstUnit"  styles="width:100%;" /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Unit price/ton (manual input)"  style="color=#ffff00 "><font color="#000000">Price (2)</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtUnitprice" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()"  styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
												<td width="25%" colspan="1" align="right"><a title="Vat rate(%)"  style="color=#ffff00 "><font color="#000000">VAT(7)</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:list id="lstVatrate" onchange="OnChangeAmt()"  styles="width:100%;" /></td>									
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Contract amount = (1) * (2)"  style="color=#ffff00 "><font color="#000000">Net Amt (3)</font></a></td>
												<td width="20%" colspan="3"><gw:textbox id="txtContractamount" readonly= true  styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
												<td width="25%" colspan="1" align="right"><a title="Vat amount= (3) * (7)"  style="color=#ffff00 "><font color="#000000">Vat amt (8)</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="txtVatamt" onchange="OnChangeAmt()" readonly= true onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%;" /></td>									
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Net adjust contract amount (manual input)"  style="color=#ffff00 "><font color="#000000">Amt Adj (4)</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtAmtAdj" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()" format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%;" /></td>
												<td width="25%" colspan="1" align="right"><a title="Vat adjusting(manual input)"  style="color=#ffff00 "><font color="#000000">	Vat adj(9)</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="txtAdjvatamt" onchange="OnChangeAmt()" onBlur="OnChangeAmt()" onenterkey= "OnChangeAmt()"  format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%;" /></td>									
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Net contract amount after adjusting = (3) + (4) "  style="color=#ffff00 "><font color="#000000">Net total(5)</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtamt5"  readonly= true styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
												<td width="25%" colspan="1" align="right"><a title="Vat amount after adjusting = (8) + (9)"  style="color=#ffff00 "><font color="#000000">Vat total (10)</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="txtamt9" readonly= true  styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
											</tr>
											<tr>
												<td width="30%" align="left"><a title="Total amount= (3) + (8)"  style="color=#ffff00 "><font color="#000000">Total amt(6)</font></a></td>
												<td width="25%" colspan="3"><gw:textbox id="txtTotal" readonly= true styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
												<td width="25%" colspan="1" align="right"><a title="Total adjust amount = (4) + (9)"  style="color=#ffff00 "><font color="#000000">Total adj(11)</font></a></td>
												<td width="20%" colspan="2" align="right" ><gw:textbox id="Totaladj_amt" readonly= true format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%;" /></td>
											</tr>
											<tr>
												<td width="30%" colspan="" align=left><a title="Grand total = (5) + (10)"  style="color=#ffff00 "><font color="#000000">Grd. amt(12)</font></a></td>
												<td width="70%" colspan="6" align="right" ><gw:textbox id="txtGrandtotal"  readonly= true styles="width:100%;" format="#,###,###,###,###,###,###.##R" type="number" /></td>
											</tr>
										</table>
									</fieldset>
								</td>
								</tr>
								<tr height='2%'>
									<td colspan='2'>
										<table border="0" style='width:100%;height:100%' cellpadding=1 cellspacing=1 >
											<tr height='2%'>
												<td width="80%">&nbsp;</td>
												<td width="4%"><gw:button id="ibtnNewFree" img="new" alt="New free item" onclick="OnNew(1)"/></td>
												<td width="4%"><gw:button id="btnSaveDt" img="save" alt="Save" onclick="OnSave(1)" /></td>
												<td width="4%"><gw:button id="ibtnNewDetail" img="popup" alt="New Detail" onclick="OnNew(4)"/></td>
												<td width="4%"><gw:button id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="onDelete(1)" /></td>
												<td width="4%"><gw:button id="ibtUnDeleteDetail" img="udelete" alt="UnDelete" onclick="UnDelete()" /></td>	
											</tr>
										</table>
									</td>
								</tr>
								<tr height='98%'>
									<!--0_PK|1.No|2_TAC_CRCONTRACT_PK|3.Item code|4.Item name|5.UOM|6.Quantity|7.U/Price|8.Amount|9.Vat(%)|10.VAT Amt|11.Adjust|12.Total|13.Remark|14.Local Remark|15_tco_item_pk|16_famt_adj|17_vat_famt|18_famt-->
									<td colspan="2">
										<gw:grid  id="GridDetail"  
											header="_PK|No|_TAC_CRCONTRACT_PK|Item code|Item name|UOM|Quantity|U/Price|Amount|Vat(%)|VAT Amt|Adjust|Total|Remark|Local Remark|_tco_item_pk|_famt_adj|_vat_famt|_famt"   
											format="0|0|0|0|0|0|1|1|0|0|1|1|1|0|0|0|0|0|0"
											aligns="0|3|0|0|0|0|3|3|3|3|3|3|3|0|0|0|0|0|0"  
											defaults="||||||1||||||||||||"  
											editcol="1|1|1|1|1|1|1|1|0|1|0|1|1|1|1|1|1|1|0|0"  
											widths ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
											styles="width:100%; height:100%"   
											sorting="T"   
											autosize="T"
											oncellclick=""
											onafteredit="OnEditDetail();OnSumAmt()"
											oncelldblclick="OnNew(2)"
										 /> 
									</td>
								</tr>
							</table>
							<table border="0" name='Tab 2' style='width:100%;height:100%' cellpadding=0 cellspacing=0 >
								
								<tr height='50%'>
									<!--0_PK|1.No|2_TAC_CRCONTRACT_PK|3.Item code|4.Item name|5.UOM|6.Quantity|7.U/Price|8.Amount|9.Vat(%)|10.VAT Amt|11.Adjust|12.Total|13.Remark|14.Local Remark|15_tco_item_pk|16_famt_adj|17_vat_famt|18_famt-->
									<td colspan="2">
										<gw:grid  id="GridDetail2"  
											header="_PK|No|_TAC_CRCONTRACT_PK|Item code|Item name|UOM|Quantity|U/Price|Amount|Vat(%)|VAT Amt|Adjust|Total|Remark|Local Remark|_tco_item_pk|_famt_adj|_vat_famt|_famt"   
											format="0|0|0|0|0|0|1|1|0|0|1|1|1|0|0|0|0|0|0"
											aligns="0|3|0|0|0|0|3|3|3|3|3|3|3|0|0|0|0|0|0"  
											defaults="||||||1||||||||||||"  
											editcol="1|1|1|1|1|1|1|1|0|1|0|1|1|1|1|1|1|1|0|0"  
											widths ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
											styles="width:100%; height:100%"   
											sorting="T"   
											autosize="T"
											oncellclick="OnGetTAC_CRCONTRACTD_PK()"
											onafteredit="OnEditDetail();OnSumAmt()"
											oncelldblclick="OnNew(2)"
										 /> 
									</td>
								</tr>
								<tr height='50%'>
									<td width='50%' colspan=''>
										<fieldset style="width: 100%;height:100%;padding: 0;border: 1px #1E90FF dashed" >
										<table border="0" style='width:100%;height:100%' cellpadding=2 cellspacing=2 >
											<tr height='2%'>
												<td width="78%">&nbsp;</td>
												<td width="4%"><gw:button id="ibtnNewFree" img="new" alt="New free item" onclick="OnNew(5)"/></td>
												<td width="4%"><gw:button id="btnSaveDt" img="save" alt="Save" onclick="OnSave(5)" /></td>
												<td width="4%"><gw:button id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="onDelete(5)" /></td>		
												<td width="4%"><gw:button id="ibtnPrint" img="excel" alt="Debit Note" onclick="OnReport_DebitNote()" /></td>	
											</tr>
											<tr height='98%'>
												<!--0_PK|1.No|2_TAC_CRCONTRACT_PK|3.Item code|4.Item name|5.UOM|6.Quantity|7.U/Price|8.Amount|9.Vat(%)|10.VAT Amt|11.Adjust|12.Total|13.Remark|14.Local Remark|15_tco_item_pk|16_famt_adj|17_vat_famt|18_famt-->
												<td colspan="6">
													<gw:grid  id="idGridMst" 
														header="_PK|_TAC_CRCONTRACT_PK|Trans Date|Seq|Amount|Remark"   
														format="0|0|4|0|1|0"  
														aligns="0|0|0|0|0|0"  
														defaults="|||||"  
													   editcol="1|1|1|1|1|1"  
													   widths ="0|0|0|0|0|0"  
														styles="width:100%; height:100%"   
														sorting="T"   
														autosize="T"
														oncellclick="OnGetMst()"
													 /> 
												</td>
											</tr>
										</table>
										</fieldset>
									</td>
									<td width='50%' colspan=''>
										<fieldset style="width: 100%;height:100%;padding: 0;border: 1px #1E90FF dashed" >
										<table border="0" style='width:100%;height:100%' cellpadding=2 cellspacing=2 id="table1">
											<tr height='2%'>
												<td width="80%">&nbsp;</td>
												<td width="4%"><gw:button id="ibtnNewFree" img="new" alt="New" onclick="OnNew(6)"/></td>
												<td width="4%"><gw:button id="btnSaveDt" img="save" alt="Save" onclick="OnSave(6)" /></td>
												<td width="4%"><gw:button id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="onDelete(6)" /></td>		
												
											</tr>
											<tr height='98%'>
												<!--0_PK|1.No|2_TAC_CRCONTRACT_PK|3.Item code|4.Item name|5.UOM|6.Quantity|7.U/Price|8.Amount|9.Vat(%)|10.VAT Amt|11.Adjust|12.Total|13.Remark|14.Local Remark|15_tco_item_pk|16_famt_adj|17_vat_famt|18_famt-->
												<td colspan="6">
														<gw:grid  id="idGrdDtl" 
														header="_PK|_TAC_CRCONTRACT_SCH_PK|_TAC_CRCONTRACTD_PK|Item Name|Contract Amount|Rate|Amount|Remark|Remark 2"   
														format="0|0|0|0|1|0|1|0|0"  
														aligns="0|0|0|0|0|3|0|0|0"  
														defaults="||||||||"  
													   editcol="1|1|1|1|1|1|1|1|1"  
													   widths ="0|0|0|0|0|0|0|0|0"  
														styles="width:100%; height:100%"   
														sorting="T"   
														autosize="T"
														onafteredit="OnCal_Amount()"
													 /> 
												</td>
											</tr>
										</table>
										</fieldset>
									</td>
								</tr>
							</table>
							<table border="0" name='Tab 3' style='width:100%;height:100%' cellpadding=2 cellspacing=2 >
								<tr height='2%'>
									<td width="80%">&nbsp;</td>
									<td width="4%"><gw:button id="ibtnNewFree" img="new" alt="New free item" onclick="OnNew(7)"/></td>
									<td width="4%"><gw:button id="btnSaveDt" img="save" alt="Save" onclick="OnSave(7)" /></td>
									<td width="4%"><gw:button id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="onDelete(7)" /></td>							
								</tr>
								<tr height='98%'>
									<!--0_PK|1.No|2_TAC_CRCONTRACT_PK|3.Item code|4.Item name|5.UOM|6.Quantity|7.U/Price|8.Amount|9.Vat(%)|10.VAT Amt|11.Adjust|12.Total|13.Remark|14.Local Remark|15_tco_item_pk|16_famt_adj|17_vat_famt|18_famt-->
									<td colspan="6">
										<gw:grid  id="idGrid_Main" 
											header="_PK|_TAC_CRCONTRACT_PK|Maintenance Type|Amount|From Date|To Date|Remark|Remark 2"   
											format="0|0|0|1|4|4|0|0"  
											aligns="0|0|0|0|0|0|0|0"  
											defaults="|||||||"  
										   editcol="1|1|1|1|1|1|1|1"  
										   widths ="0|0|0|0|0|0|0|0"  
											styles="width:100%; height:100%"   
											sorting="T"   
											autosize="T"
										 /> 
									</td>
								</tr>
							</table>
						</gw:tab>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()"/>
<gw:textbox id="txttac_crcontract_pk"  styles="width:95%;display:none" /> 
<gw:textbox id="txtuser_pk"  styles="width:95%;display:none" /> 
<gw:textbox id="txtbook_exrate"  styles="width:95%;display:none" /> 
<gw:textbox id="txtbookccy" styles="width:95%;display:none"  /> 
<gw:list id="lstBookExRate" styles="width:100%;display:none" />

<gw:textbox id="txtVat_bamt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtbAmt_adj" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 

<gw:textbox id="txtContract_bamt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtContract_bAmtAdj" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtContract_bAmt_Final" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtContract_bVatamt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:95%;display:none" /> 
<gw:textbox id="txtTAC_CRCONTRACTD_pk" style="display:none " />
<gw:textbox id="txtTAC_CRCONTRACT_SCH_pk" style="display:none " />
<gw:textbox id="txtexratebook" style="display:none " />
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txtProposedByUserPk" style="display: none" />
</body>
</html>
