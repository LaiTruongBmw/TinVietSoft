<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Bussiness Partner Entry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
//_PK|_partner_pk|_EmpPK|EmployeeID|Emp Name|Department|Remark|Active|StartDate|EndDate|_Table
 var G_Charger_EmployeeID=0,
	 G_Charger_Emp_Name=1,
	 G_Charger_Department=2,  
	 G_Charger_Remark=3,
	 G_Charger_Active=4,
	 G_Charger_StartDate=5,
	 G_Charger_EndDate=6,
	 G_Charger_PK=7,
	 G_Charger_partner_pk=8,
	 G_Charger_EmpPK=9,
	 G_Charger_Table=10;
//_pk|_tco_buspartner_pk|Name|Position|Phone|Mobile|Fax|Email|Urgent contact|_addr|Active|Valid from|Valid to|Description|Table	 
var G_contact_Name=0,
	G_contact_Position=1,
	G_contact_Phone=2,
	G_contact_Mobile=3,
	G_contact_Fax=4,
	G_contact_Email=5,
	G_contact_Urgent_contact=6,
	G_contact_Active=7,
	G_contact_Valid_from=8,
	G_contact_Valid_to=9,
	G_contact_Description=10,
	G_contact_pk=11,
	G_contact_tco_buspartner_pk=12,
	G_contact_addr=13,
	G_contact_Table=14; 
//_pk|_tco_buspartner_pk|ID|Name|Local name|Foreign name|Nation|Reg no.|Tax|Tax office|Representative|Zipcode|Address 1|Address 2|Address 3 |Address 4|Address 5|Address 6|Phone|Fax|biz_type|biz_item|biz_grp|Description|Active|Start date|End date|_Table
var G_BizPlace_ID=0,
	G_BizPlace_Name=1,
	G_BizPlace_Local_name=2,
	G_BizPlace_Foreign_name=3,
	G_BizPlace_Nation=4,
	G_BizPlace_Reg_no=5,
	G_BizPlace_Tax=6,
	G_BizPlace_Tax_office=7,
	G_BizPlace_Representative=8,
	G_BizPlace_Zipcode=9,
	G_BizPlace_Address_1=10,
	G_BizPlace_Address_2=11,
	G_BizPlace_Address_3 =12,
	G_BizPlace_Address_4=13,
	G_BizPlace_Address_5=14,
	G_BizPlace_Address_6=15,
	G_BizPlace_Phone=16,
	G_BizPlace_Fax=17,
	G_BizPlace_biz_type=18,
	G_BizPlace_biz_item=19,
	G_BizPlace_biz_grp=20,
	G_BizPlace_Description=21,
	G_BizPlace_Active=22,
	G_BizPlace_Start_date=23,
	G_BizPlace_End_date=24,
	G_BizPlace_pk=25,
	G_BizPlace_tco_buspartner_pk=26,
	G_BizPlace_Table=27,
	G_BizPlace_tax_office_pk=28;
//pk|_tco_buspartner_pk|Name|Local name|Foreign name|Charger|Sale order|Delivery|Collection|Zip code|Address 1|Address 2|Address 3|Phone|Fax|Email|Active|Start date|To date|Description|_Table
var G_Location_Name=0,
	G_Location_Local_name=1,
	G_Location_Foreign_name=2,
	G_Location_Charger=3,
	G_Location_Sale_order=4,
	G_Location_Delivery=5,
	G_Location_Collection=6,
	G_Location_Zip_code=7,
	G_Location_Address_1=8,
	G_Location_Address_2=9,
	G_Location_Address_3=10,
	G_Location_Phone=11,
	G_Location_Fax=12,
	G_Location_Email=13,
	G_Location_Active=14,
	G_Location_Start_date=15,
	G_Location_To_date=16,
	G_Location_Description=17,
	G_Location_pk=18,
	G_Location_tco_buspartner_pk=19,
	G_Location_Table =20;
//_PK|_partner_pk|_TPS_WORKDIVISION_pk|Code|Name (ENG)|Name (VN)|Name (KR)|Remark
var G_Work_Code=0,
	G_Work_Name_ENG=1,
	G_Work_Name_VN=2,
	G_Work_Name_KR=3,
	G_Work_Remark=4,
	G_Work_PK=5,
	G_Work_partner_pk=6,
	G_Work_TPS_WORKDIVISION_pk=7;
//_PK|_partner_pk|_tac_bfbeneficiary_pk|Currency|Bank Name|Account No|Account Name|Remark
var G_Acount_Currency=0,
	G_Acount_Bank_Name=1,
	G_Acount_Account_No=2,
	G_Acount_Account_Name=3,  
	G_Acount_Remark=4,
	G_Acount_PK=5,
	G_Acount_partner_pk=6,
	G_Acount_tac_bfbeneficiary_pk=7;	
 var status_control;
 //---------------------------------------------------------
 function BodyInit()
 { 
     txtBillToCode.SetEnable(false);
     txtBillToName.SetEnable(false);
     txtDeliToCode.SetEnable(false);
     txtDeliToName.SetEnable(false);
    
     System.Translate(document);
     BindingDataList();
     onNew(0);
    
     //lstVoucherType.SetEnable(false);
     //lstVoucherType.SetDataText('');
	 
	 txtSesion_company.text = "<%=Session("USER_PK")%>";
     chAuto.value = 'T';
	 datCompany.Call();
 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {
        var data="";
        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0010','','') FROM DUAL")%>|ALL|--Select All--"; 
        cboPartnertype.SetDataText(data);
        lstType.SetDataText(data); 
		lstType.value = 'ALL';
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0160','','') FROM DUAL")%>"; 
        lstVoucherType.SetDataText(data);

        data = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>"; 
        cboOrganization.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGGS0101') FROM DUAL" )%>";    
        cboCompanysize.SetDataText(data);           
		
		data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
		cboNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0100') FROM DUAL" )%>";    
        cboTranccy.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGGS0103') FROM DUAL" )%>";    
        cboInvoiceterms.SetDataText(data);        

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGGS0104') FROM DUAL" )%>";
        cboInvoiceSchedule.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGGS0105') FROM DUAL" )%>";
        cboInvoicegroup.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0260') FROM DUAL" )%>";
        cboDeliveryterms.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0140') FROM DUAL" )%>";
        cboCustTradeType.SetDataText(data);
        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0141') FROM DUAL" )%>";
        cboVendortradetype.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0120') FROM DUAL" )%>";
        cboCustPaymentTerms.SetDataText(data);
        cboVendorpayterm.SetDataText(data); 

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0110') FROM DUAL" )%>";
        cboCustpaymentform.SetDataText(data);
        cboVenPaymentform.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lf_logistic_code('LGCM0160') FROM DUAL" )%>";
        cboSaledefaulttax.SetDataText(data);
        cboVendorDtax.SetDataText(data);
        data = "DATA|Y|Yes|N|No";
        lstCorporate.SetDataText(data); 
        data = "DATA|Y|Yes|N|No";
        lstUse_YN.SetDataText(data);  
        
        ls_Transaction      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0023') FROM DUAL")%>|ALL|--Select All--";  
        lstTransaction_D.SetDataText(ls_Transaction);  
        lstTransaction.SetDataText(ls_Transaction); 
		lstTransaction.value = 'ALL'; 
		ls_auto_voucher_type      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK058') FROM DUAL")%>";  
        lst_auto_voucher_type.SetDataText(ls_auto_voucher_type);  
 }
 //---------------------------------------------------------
 
 function onSearch(index)
 {
    switch(index)
    {
        case 0:
            data_agic00010_1.StatusSelect();
            data_agic00010_1.Call("SELECT");
        break;
    }
 }
 //---------------------------------------------------------
 function onSave(index)
 {
    imagePK.text = imgFile.oid;
    
    switch(index)
    {
        case 0: // save master:
            if ( chAuto.value == 'F' )
            {
                if ( txtPartnerid.text == '' )
				{
					alert('Please, input Partner ID !!!');
					txtPartnerid.GetControl().focus();
					return;
				}
            }        
            
            if ( txtPartnerName.text == '' )
            {
                alert('Please, input Partner Name !!!');
                txtPartnerName.GetControl().focus();
                return;
            }
            
//            if ( txtTaxcode.text == '' )
//            {
//                alert('Please, input Tax Code !!!');
//                txtTaxcode.GetControl().focus();
//                return;
//            }
            
            data_agic00010.Call();
        break;
        case 1:// save charger
            data_agic00010_2.Call();
        break;
        case 2:// save contact
            data_agic00010_3.Call();
        break;
        case 3:// save biz place
            data_agic00010_4.Call();
        break;
        case 4:// save location
            data_agic00010_5.Call();
        break;
       case 5:
                data_Work_Classification.Call();
       break; 
       case 6:
                data_Bank_Account.Call();
       break; 
     }
 }
 //---------------------------------------------------------
 function onNew(index)
    {
    switch(index)
    {
        case 0: // add new master
            //lstVoucherType.SetDataText('');             
            data_agic00010.StatusInsert();
            txtPartnerid.SetEnable(true);  
            chkActive.value='-1';  
			chAuto.value='T';  
            onPartnerTypeChange();                    
        break;
        case 1:// add new charger
            if(txtPartnerPk.text !="")
            {
                grdCharger.AddRow();
                grdCharger.SetGridText(grdCharger.rows - 1,G_Charger_partner_pk,txtPartnerPk.GetData());
            }
            else
            {
               alert("You should input and save master information first.");
               return;
            }
        break;
        case 2: // add new contact
            if(txtPartnerPk.text !="")
            {
                 grdContact.AddRow();
                 grdContact.SetGridText(grdContact.rows - 1,G_contact_tco_buspartner_pk,txtPartnerPk.GetData());
            }
            else
            {
               alert("You should input and save master information first.");
               return;
            }     
        break;
        case 3:// add new biz placeok
            if(txtPartnerPk.text !="")
            {
                grdBizplace.AddRow();
                grdBizplace.SetGridText(grdBizplace.rows - 1,G_BizPlace_tco_buspartner_pk,txtPartnerPk.GetData());
            }
            else
            {
               alert("You should input and save master information first.");
               return;
            }   
            
        break;
        case 4: // add new location
            if(txtPartnerPk.text !="")
            {
                 grdLocation.AddRow();
                 grdLocation.SetGridText(grdLocation.rows - 1,G_Location_tco_buspartner_pk,txtPartnerPk.GetData());
            }
            else
            {
               alert("You should input and save master information first.");
               return;
            }   
        break;
        case 5:
            if(txtPartnerPk.text !="")
            { 
                grdWork_Classification.AddRow();
                grdWork_Classification.SetGridText(grdWork_Classification.rows - 1,G_Work_partner_pk,txtPartnerPk.GetData());
            }
            else
            {
               alert("Please select row master first.");
              return; 
            }    
        break;  
        case 6:
            if(txtPartnerPk.text !="")
            { 
                grdBank_Account.AddRow();
                grdBank_Account.SetGridText(grdBank_Account.rows - 1, G_Acount_partner_pk, txtPartnerPk.GetData());
            }
            else
            {
               alert("Please select row master first.");
              return; 
            }    
        break;   
    }
 }
 //---------------------------------------------------------
 function onDelete(index)
 {
    switch(index)
    {
       case 0:// delete master
            if(confirm('Do you want to delete selected item ?'))
            {
                data_agic00010.StatusDelete();
                data_agic00010.Call();
            }   
        break;
        case 1:// delete charger
            if(confirm('Do you want to delete selected charger ?'))
            {
                 grdCharger.DeleteRow();
                 data_agic00010_2.Call();
            }
        break;
        case 2: // Delete contact
            if(confirm('Do you want to delete selected contact ?'))
            {
                 grdContact.DeleteRow();
                 data_agic00010_3.Call();
            }
        break;
        case 3:// delete place
            if(confirm('Do you want to delete selected place ?'))
            {
                 grdBizplace.DeleteRow();
                 data_agic00010_4.Call();
            }
        break;
        case 4: // delete location
            if(confirm('Do you want to delete selected location ?'))
            {
                 grdLocation.DeleteRow();
                 data_agic00010_5.Call();
            }
        break;
        case 5: // delete location
            if(confirm('Do you want to delete selected Work Classification ?'))
            {
                 Work_Classification.DeleteRow();
                 //data_agic00010_5.Call();
            }
        break;
        case 6: // delete location
            if(confirm('Do you want to delete selected Bank Account ?'))
            {
                 grdBank_Account.DeleteRow();
            }
        break; 
    }          
 }
 //---------------------------------------------------------
 function loadBSDetail1()
 {
	var row  = grdPartner.row;	
    txtPartnerPk.SetDataText(grdPartner.GetGridData(row,0));
    
	data_agic00010.StatusSelect();
	data_agic00010.Call("SELECT");	
 }
 //---------------------------------------------------------
 function openEmpLookup(num)
 {
//    var url = '/standard/forms/sys/auth/wsyau00001_1.aspx' ; neu khong dung thi xoa
	var url = '/standard/forms/ch/ae/chae00010_search_emp.aspx' ;
	
	o = System.OpenModal( System.RootURL+ url , 900 , 600 , 'resizable:yes;status:yes') 
	
	if ( o != null )
	{
		grdCharger.SetGridText(grdCharger.row,G_Charger_EmpPK,o[0]); // Emp PK  
		grdCharger.SetGridText(grdCharger.row,G_Charger_EmployeeID,o[1]); // Emp ID
		grdCharger.SetGridText(grdCharger.row,G_Charger_Emp_Name,o[2]); // Emp Name
		grdCharger.SetGridText(grdCharger.row,G_Charger_Department,o[4]); // Department
	}	
 }
 //---------------------------------------------------------
 function OnDataReceive(oId)
 {
    switch(oId.id)
    {
        case "data_agic00010":            
            status_control = data_agic00010.GetStatus();
            
            imgFile.SetDataText(imagePK.text);
            
            if ( chAuto.value == 'T' )
            {
                txtPartnerid.SetEnable(false);
            }
            else
            {
                txtPartnerid.SetEnable(true);
            }
            
            data_agic00010_2.Call("SELECT");
        break;
        case "data_agic00010_2":            
            data_agic00010_3.Call("SELECT");
        break;
        case "data_agic00010_3":
            data_agic00010_4.Call("SELECT");
        break;
        case "data_agic00010_4":
            data_agic00010_5.Call("SELECT");
        break;
        case "data_agic00010_5":
            if ( status_control == 10 || status_control == 20 || status_control == 40 )
            {
                data_agic00010_1.Call("SELECT");
            }
            else
            {
                    data_Work_Classification.Call("SELECT");
            }
        break;
       case 'data_Work_Classification':
                 var No_WC =0;
            for(i=1;i<grdWork_Classification.rows;i++)
            {
                No_WC = i;
            }
            
            txtWork_Classification.text =  No_WC;
           data_Bank_Account.Call("SELECT"); 
       break;
       case 'data_Bank_Account':
                 var No_BA =0;
            for(i=1;i<grdBank_Account.rows;i++)
            {
                No_BA = i;
            }
            txtBank_Account.text =  No_BA;
       break;
	   case'datCompany':
		onSearch(0);
	   break;
    }
 }
 
 function OnGetParent()
 {
    var fpath = System.RootURL + "/standard/forms/ag/ec/agec00010_p.aspx";
    oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');
               
    if ( oValue != null)
    {
        txtParentPk.SetDataText(oValue[0]);
        txtParCom.SetDataText(oValue[2]);
    }
 }
 
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
       // imgArrow.src = "../../../images/right-arrow.ico";
        imgArrow.src = "../../../system/images/next_orange.gif";

    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="60%";
        //imgArrow.src = "../../../images/left-arrow.ico";
        imgArrow.src = "../../../system/images/prev_orange.gif";

    }
 }
 
function OnChan()
 {
    if ( chAuto.value == 'T' )
    {
        //lstVoucherType.SetDataText('');
        txtPartnerid.SetEnable(false);
        lstVoucherType.SetEnable(true);
    }
    else
    {
        lstVoucherType.SetDataText('');
        lstVoucherType.SetEnable(false);
        txtPartnerid.SetEnable(true);
    }
 }
 //---------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'BillTo' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtBillToPK.text   = object[0];
                txtBillToCode.text = object[1];
                txtBillToName.text = object[2];
                txtBillToPK1.text  = object[0];
                dsbs00010_4.Call("SELECT");
	         }
	    break; 
	   
        case 'DeliTo' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtDeliToPK.text   = object[0];
                txtDeliToCode.text = object[1];
                txtDeliToName.text = object[2];
                txtDeliToPK1.text  = object[0];
                dsbs00010_4.Call("SELECT");
	         }
	    break; 	
	    
        case 'LGGS0101':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGGS0101";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break; 
        
        case 'LGCM0100':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0100";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;
        
        case 'LGGS0103':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGGS0103";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;
        
        case 'LGGS0104':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGGS0104";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;
        
        case 'LGGS0105':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGGS0105";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;   
        
        case 'LGCM0260':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0260";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;
        
        case 'LGCM0140':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0140";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;
        
        case 'LGCM0141':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0141";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;          
        
        case 'LGCM0120':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break; 
        
        case 'LGCM0110':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;  
        
        case 'LGCM0160':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0160";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
        break;  
        case 'Work_Classification':
                if(event.col==G_Work_Code)
                { 
                            var fpath = System.RootURL + "/standard/forms/ag/ic/agic00010_popup1.aspx";
	                        var o = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	                        if (o != null)
	                        {
	                                if(o[4] != 0)
	                                {
	                                        grdWork_Classification.SetGridText(grdWork_Classification.row, G_Work_TPS_WORKDIVISION_pk, o[4]);//Code 
	                                        grdWork_Classification.SetGridText(grdWork_Classification.row, G_Work_Code, o[0]);//Code
	                                        grdWork_Classification.SetGridText(grdWork_Classification.row,G_Work_Name_ENG , o[1]);//
	                                        grdWork_Classification.SetGridText(grdWork_Classification.row, G_Work_Name_VN, o[2]);//Code
	                                        grdWork_Classification.SetGridText(grdWork_Classification.row, G_Work_Name_KR, o[3]);//Code
	                                } 
	                        }
	            } 
        break;
        case 'Bank_Account':
                if(event.col==G_Work_Code)
                { 
                            var fpath = System.RootURL + "/standard/forms/ag/ic/agic00010_popup2.aspx";
	                        var o = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	                        if (o != null)
	                        {
	                                if(o[4] != 0)
	                                {
	                                        grdBank_Account.SetGridText(grdBank_Account.row, G_Acount_tac_bfbeneficiary_pk, o[4]);//Code 
	                                        grdBank_Account.SetGridText(grdBank_Account.row, G_Acount_Currency, o[0]);//Code
	                                        grdBank_Account.SetGridText(grdBank_Account.row, G_Acount_Bank_Name, o[1]);//
	                                        grdBank_Account.SetGridText(grdBank_Account.row, G_Acount_Account_No, o[2]);//Code
	                                        grdBank_Account.SetGridText(grdBank_Account.row, G_Acount_Account_Name, o[3]);//Code
	                                }     
	                        }
	            } 
        break; 
                                                                             		        
	 } 
}
//----------------------------------------------------------- 
 //checkKey=================================================
function checkKey()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}
//--------------------------------------------------------------------
function onPartnerTypeChange()
{
    if(cboPartnertype.value=='05')//A/P
    {
        chkIsvendor.value='-1';   
        chkActiveVendor.value='-1'; 
        
        chkIsCust.value='0';  
        chkActiveCust.value='0';
    }
    else
        if(cboPartnertype.value=='00')//A/R
        {
            chkIsCust.value='-1';  
            chkActiveCust.value='-1';
            
            chkIsvendor.value='0';   
            chkActiveVendor.value='0'; 
        }
}
//--------------------------------------------------------------------
  function onPrint()
    {
        var  url= System.RootURL + "/standard/reports/ag/ic/rptagic00010.aspx?company="+cboOrganization.value;
	    System.OpenTargetPage( url, "_blank" );        
    }
 //---------------------------------------------------------

</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00010" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73" function="sp_sel_agic00010"  procedure="sp_upd_agic00010"> 
            <inout> 
                <inout  bind="txtPartnerPk" />
                <inout  bind="txtParentPk" />
                <inout  bind="txtParCom" />
                <inout  bind="cboOrganization" />
                <inout  bind="txtPartnerid" />
                <inout  bind="txtPartnerName" />
                <inout  bind="txtLname" />
                <inout  bind="txtFname" />
                <inout  bind="cboPartnertype" />
                <inout  bind="txtTaxcode" />
                <inout  bind="txtAddress1" />
                <inout  bind="txtAddress2" />
                <inout  bind="txtAddress3" />
                <inout  bind="txtPhone" />
                <inout  bind="txtEmail" />
                <inout  bind="txtFax" />
                <inout  bind="txtWebsie" />
                <inout  bind="chkIsCust" />
                <inout  bind="chkActiveCust" />
                <inout  bind="cboInvoiceterms" />
                <inout  bind="cboInvoiceSchedule" />
                <inout  bind="cboInvoicegroup" />
                <inout  bind="cboDeliveryterms" />
                <inout  bind="cboCustTradeType" />
                <inout  bind="cboCustpaymentform" />
                <inout  bind="cboCustPaymentTerms" />
                <inout  bind="txtSalePresentative" />
                <inout  bind="txtCreditLimit" />
                <inout  bind="txtCreditUse" />
                <inout  bind="txtCustbankacc" />
                <inout  bind="cboSaledefaulttax" />
                <inout  bind="chkIsvendor" />  
                <inout  bind="chkActiveVendor" />
                <inout  bind="cboVenPaymentform" />
                <inout  bind="cboVendorpayterm" />
                <inout  bind="txtVendorbankacc" />
                <inout  bind="cboVendorDtax" />
                <inout  bind="cboVendortradetype" />
                <inout  bind="cboTranccy" />
                <inout  bind="cboNation" />
                <inout  bind="chkActive" />
                <inout  bind="dtbAnniversary" />
                <inout  bind="txtNum_employee" />
                <inout  bind="cboCompanysize" />
                <inout  bind="txtCapital" />
                <inout  bind="txtIndustrial" />
                <inout  bind="txtCompanyproduct" />
                <inout  bind="txtTaxoffice" />
                <inout  bind="dtbFrom" />
                <inout  bind="dtbTo" />
                <inout  bind="txtDescription" />          
                <inout  bind="txtSerial" />
                <inout  bind="txtShortNM" />
                <inout  bind="txtFormNo" />
                <inout  bind="imagePK" />
                <inout  bind="chAuto" />
                <inout  bind="lstVoucherType" />
                <inout  bind="txtVendorSwiftNo" />
                <inout  bind="txtCustSwiftNo" />
                <inout  bind="txtRepresented" />
                <inout  bind="lblInfo" />
                <inout  bind="txtMemo" />
                
                <inout  bind="txtBillToPK" />
                <inout  bind="txtBillToCode" />
                <inout  bind="txtBillToName" />                
                
                <inout  bind="txtDeliToPK" />
                <inout  bind="txtDeliToCode" />
                <inout  bind="txtDeliToName" />
                
                <inout  bind="txtLicense_No" />
                <inout  bind="lstTransaction_D" />
                <inout  bind="lstCorporate" />
                <inout  bind="txtRepresentative" />
                <inout  bind="txtWork_Classification" />
                <inout  bind="txtBank_Account" />     
            </inout>
        </dso> 
    </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00010_1"> 
        <xml> 
            <dso id="1" type="grid" function="sp_sel_agic00010_1" > 
                <input> 
                    <input bind="txtPartnerQuery" /> 
                    <input bind="txtTaxcode_Q" /> 
                    <input bind="lstType" /> 
                     <input bind="lstUse_YN" /> 
                     <input bind="lstTransaction" /> 
					 <input bind="cboOrganization" />
                </input> 
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdCharger ---------------------------------------->
    <gw:data id="data_agic00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10" function="sp_sel_agic00010_2"  procedure="sp_upd_agic00010_2"> 
                <input bind="grdCharger" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input> 
                <output bind="grdCharger" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdContact ---------------------------------------->
    <gw:data id="data_agic00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="sp_sel_agic00010_3"  procedure="sp_upd_agic00010_3"> 
                <input bind="grdContact" > 
                    <input bind="txtPartnerPk" /> 
                    <input bind="txtTable" />
                </input> 
                <output bind="grdContact" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdBizplace ---------------------------------------->
    <gw:data id="data_agic00010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="sp_sel_agic00010_4"  procedure="sp_upd_agic00010_4"> 
                <input bind="grdBizplace" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input> 
                <output bind="grdBizplace" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdLocation ---------------------------------------->
    <gw:data id="data_agic00010_5" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="sp_sel_agic00010_5"  procedure="sp_upd_agic00010_5"> 
                <input bind="grdLocation" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input>
                <output bind="grdLocation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
  <gw:data id="data_Work_Classification" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7" function="sp_sel_agic00010_Work_Class"  procedure="sp_upd_agic00010_WC"> 
                <input bind="grdWork_Classification" > 
                    <input bind="txtPartnerPk" />
                </input>
                <output bind="grdWork_Classification" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->    
<gw:data id="data_Bank_Account" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7" function="sp_sel_agic00010_Bank_Acc"  procedure="sp_upd_agic00010_Bank_Acc"> 
                <input bind="grdBank_Account" > 
                    <input bind="txtPartnerPk" />
                </input>
                <output bind="grdBank_Account" /> 
            </dso> 
        </xml> 
    </gw:data>    
	<!-------------------------------------------------------------------->   
	<gw:data id="datCompany" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ac_sel_company"  > 
                <input>
                    <input bind="txtSesion_company" />
                </input> 
                <output>
                    <output bind="cboOrganization" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <table style="width: 100%; height: 100%" border="1" id="tableID1">
        <tr>
            <td id="left" style="width: 40%" valign="top">
                <table style="width: 100%;" border="0">
                    <tr >
                        <td style="width: 10%" align="right">Customer</td>
                        <td style="width: 90%" colspan="2"><gw:textbox id="txtPartnerQuery" csstype="filter" onenterkey="onSearch(0)" styles="width: 100%" /></td>
                        
                    </tr>
                    <tr >
                        <td style="width: 10%" align="right">Tax code</td>
                        <td style="width: 90%" colspan="2"><gw:textbox id="txtTaxcode_Q" csstype="filter" onenterkey="onSearch(0)" styles="width: 100%" /></td>
                        
                    </tr>
                   <tr>
                            <td style="width: 10%" align="right">Type</td>
                            <td style="width: 90%" colspan="2"><gw:list id="lstType"  onchange="onSearch(0)" styles="width: 100%" /></td>
                   </tr> 
                   <tr>
                            <td style="width: 10%" align="right">Transaction</td>
                            <td style="width: 90%" colspan="2"><gw:list id="lstTransaction"  onchange="onSearch(0)" styles="width: 100%" /></td>
                   </tr>  
                   <tr>
                            <td style="width: 10%" align="right">Use Y/N</td>
                            <td style="width: 90%"><gw:list id="lstUse_YN"  onchange="onSearch(0)" styles="width: 100%" /></td>
                            <td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch(0)" /></td>
                   </tr>   
                    <tr style="height: 100%" valign="top">
                        <td colspan="3">
                            
						<gw:grid  id="grdPartner" header="_PK|ID|Name|Tax Code" format="0|0|0|0" aligns="0|0|0|0"
							defaults="|||" editcol="0|0|0|0" widths="1|90|225|110" styles="width:150; height:500"
							sorting="T" autosize="true" oncellclick="loadBSDetail1()" />
							
                        </td>
                    </tr>
                </table>
         </td>
            <td id="right" style="width: 60%">
                <table style="width: 100%" border="0">
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onClick="OnGetParent()">Partner Com</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtParCom" styles="width:100%" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Voucher type</td>
                        <td style="width: 20%">
                            <gw:list id="lstVoucherType" styles="width:100%;" />
                        </td>
                        <td style="width: 10%">
                            <gw:checkbox id="chAuto" defaultvalue="T|F" value="F" styles="width:50%" onclick="OnChan()" />
                        </td>
                        <td style="width: 30%">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 96%; white-space: nowrap">
                                        <gw:label id="lblInfo" styles='width:100%;color:cc0000;font:9pt' text='' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="onNew(0)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave(0)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="onDelete(0)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnPrint" img="excel" alt="List of business partner" text="Print"
                                            onclick="onPrint()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Company</td>
                        <td style="width: 20%">
                            <gw:list id="cboOrganization" styles="width:100%;" />
                        </td>
                        <td style="width: 10%" align="right">
                            Partner type</td>
                        <td style="width: 20%">
                            <gw:list id="cboPartnertype" styles="width:100%;" onchange="onPartnerTypeChange()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Tax code</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTaxcode" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Partner ID</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPartnerid" styles="width:100%;" csstype="mandatory" onkeypress="checkKey()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Partner Name</td>
                        <td colspan="3">
                            <gw:textbox id="txtPartnerName" csstype="mandatory" styles="width:100%;" />
                        </td>
                    </tr>
                   <tr style="height: 25px">
                                <td align="right">License No</td> 
                                <td><gw:textbox id="txtLicense_No" styles="width:100%;"  /></td>
                                
                                <td align="right">Transaction</td>
                                <td colspan="3"><gw:list id="lstTransaction_D" styles="width:100%" /></td>
                   </tr> 
                  <tr style="height: 25px">
                                <td align="right">Corporate Y/N</td>
                                <td><gw:list id="lstCorporate" styles="width:100%" /></td>
                                <td align="right">Representative</td> 
                                <td colspan="3"><gw:textbox id="txtRepresentative" styles="width:100%;"  /></td>
                  </tr> 
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Local Name</td>
                        <td colspan="5">
                            <gw:textbox id="txtLname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">Short Name</td>
                        <td colspan="5"><gw:textbox id="txtShortNM" styles="width: 100%" /></td>
                         
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Foreign Name</td>
                        <td colspan="5">
                            <gw:textbox id="txtFname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Address 1</td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress1" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Address 2</td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress2" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Address 3</td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress3" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td style="width: 10%" align="right">
                            Description</td>
                        <td colspan="5">
                            <gw:textbox id="txtDescription" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right" >
                            Phone</td>
                        <td colspan="5">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="20%">
                                        <gw:textbox id="txtPhone" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="5%" align="right">
                                        Fax</td>
                                    <td width="20%">
                                        <gw:textbox id="txtFax" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="7%" align="right">
                                        Email</td>
                                    <td width="20%">
                                        <gw:textbox id="txtEmail" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="10%" align="right">
                                        Web site</td>
                                    <td width="18%">
                                        <gw:textbox id="txtWebsie" styles="width:100%;" csstype="" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                                <td align="right">No. of Work Classification</td>
                                <td colspan="5">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                            <td width="40%"><gw:textbox id="txtWork_Classification" styles="width:100%;text-align:left;font-weight:600;color:red"  /></td> 
                                                            <td width="20%" align="right" >No. of Bank Account</td>
                                                            <td width="40%"><gw:textbox id="txtBank_Account" styles="width:100%;text-align:left;font-weight:600;color:red"  /></td> 
                                                </tr>
                                        </table>
                                </td> 
                                
                    </tr> 
                    <tr>
                        <td colspan="6">
                            <!-- <gw:tab id="idTab" > -->
                            <gw:tab id="idTab">
                            <table style="width: 100%; height: 100%" name="General Info" id="TabGeneralInfo"
                                align="top" style="overflow: scroll">
                                <tr>
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%"><gw:checkbox id="chkActive" defaultvalue="-1|0" value="-1" onchange="" /></td>
                                    <td style="width: 15%" align="right">Anniversary</td>
                                    <td style="width: 35%" align="left"><gw:datebox id="dtbAnniversary" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Tax office</td>
                                    <td style="width: 35%"><gw:textbox id="txtTaxoffice" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Valid from</td>
                                    <td style="width: 35%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                        ~
                                        <gw:datebox id="dtbTo" nullaccept lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Number of employee</td>
                                    <td style="width: 35%"><gw:textbox id="txtNum_employee" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Serial no</td>
                                    <td style="width: 35%" align="left"><gw:textbox id="txtSerial" styles="width: 100%" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Capital</td>
                                    <td style="width: 35%"><gw:textbox id="txtCapital" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Form no</td>
                                    <td style="width: 35%" align="left"><gw:textbox id="txtFormNo" styles="width: 100%" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0101')">Company size</b></td>
                                    <td style="width: 35%"><gw:list id="cboCompanysize" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                    <td style="width: 35%" align="left" rowspan="6">
                                        <gw:image id="imgFile" table_name="TCO_BPPHOTO" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx"
                                            styles="width:100%;height:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Nation</td>
                                    <td style="width: 35%"><gw:list id="cboNation" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Transaction currency</td>
                                    <td style="width: 35%"><gw:list id="cboTranccy" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Industrial zone</td>
                                    <td style="width: 35%">
                                    <gw:textbox id="txtIndustrial" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Company product</td>
                                    <td style="width: 35%"><gw:textbox id="txtCompanyproduct" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Represented by</td>
                                    <td style="width: 35%"><gw:textbox id="txtRepresented" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Customer" style="overflow: scroll">
                                <tr>
                                    <td style="width: 15%" align="right">Customer</td>
                                    <td style="width: 35%"><gw:checkbox id="chkIsCust" mode="01" onchange="" /></td>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0110')">Payment form</b></td>
                                    <td style="width: 35%"><gw:list id="cboCustpaymentform" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%"><gw:checkbox id="chkActiveCust" mode="01" onchange="" /></td>
                                    <td style="width: 15%" align="right"> </td>
                                    <td style="width: 35%"> </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0103')">Invoice terms</b></td>
                                    <td style="width: 35%"><gw:list id="cboInvoiceterms" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0160')">Sale default tax</b></td>
                                    <td style="width: 35%"><gw:list id="cboSaledefaulttax" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0104')">Invoice schedule</b></td>
                                    <td style="width: 35%"><gw:list id="cboInvoiceSchedule" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Credit limit</td>
                                    <td style="width: 35%"><gw:textbox id="txtCreditLimit" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0105')">Invoice grouping</b></td>
                                    <td style="width: 35%"><gw:list id="cboInvoicegroup" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Credit use</td>
                                    <td style="width: 35%"><gw:textbox id="txtCreditUse" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0260')">Delivery terms</b></td>
                                    <td style="width: 35%"><gw:list id="cboDeliveryterms" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Bank account</td>
                                    <td style="width: 35%"><gw:textbox id="txtCustbankacc" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0140')">CustTradeType</b></td>
                                    <td style="width: 35%"><gw:list id="cboCustTradeType" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Swift No</td>
                                    <td style="width: 35%"><gw:textbox id="txtCustSwiftNo" styles="width:100%;" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0120')">Cust payment terms</b></td>
                                    <td style="width: 35%"><gw:list id="cboCustPaymentTerms" styles="width:100%;" /></td>
                                                <td style="width: 10%" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('BillTo')">Bill To </b>
                                                </td>
                                                <td style="width: 40%; white-space: nowrap">
                                                    <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Sale presentative</td>
                                    <td style="width: 35%"> 
                                    
                                    <gw:textbox id="txtSalePresentative"   styles='width:100%' />
                                    </td>
                                                <td style="width: 10%" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('DeliTo')">Deli To </b>
                                                </td>
                                                <td style="width: 40%; white-space: nowrap">
                                                    <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Vendor" style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right">Vendor</td>
                                    <td style="width: 35%"><gw:checkbox id="chkIsvendor" mode="01" onchange="" /></td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%"></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%"><gw:checkbox id="chkActiveVendor" mode="01" onchange="" /></td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%"></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0110')">Payment form</b></td>
                                    <td style="width: 35%"><gw:list id="cboVenPaymentform" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Bank account</td>
                                    <td style="width: 35%"><gw:textbox id="txtVendorbankacc" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0120')">Payment terms</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendorpayterm" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Swift No</td>
                                    <td style="width: 35%"><gw:textbox id="txtVendorSwiftNo" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0141')">Trade type</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendortradetype" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0160')">Default tax</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendorDtax" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 95%"></tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Charger" id="Table3" align="top" style="overflow: scroll" border="0">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right"></td>
                                    <td style="width: 1%" align="right"><gw:imgbtn id="btnNewCharger" img="new" alt="New" text="New" onclick="onNew(1)" /></td>
                                    <td style="width: 1%"><gw:imgbtn id="btnDeleteCharger" img="delete" alt="Delete" text="Delete" onclick="onDelete(1)" /></td>
                                    <td style="width: 1%"><gw:imgbtn id="btnSaveCharger" img="save" alt="Save" text="Save" onclick="onSave(1)" /></td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid  id="grdCharger" header="EmployeeID|Emp Name|Department|Remark|Active|StartDate|EndDate|PK|partner_pk|EmpPK|Table"
												format="0|0|0|0|3|4|4|0|0|0|0" 
												aligns="0|0|0|0|0|0|0|0|0|0|0" 
												defaults="||||||||||tco_buspartner"
												editcol="0|0|0|1|1|1|1|0|1|1|1" 
												widths="100|200|150|200|70|130|130|1|1|1|1"
												styles="width:120; height:100%" paging="true" pageview="10" sorting="T" oncelldblclick="openEmpLookup(0)" />
										</div>					
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Contact" id="Table4" align="top" style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNewContact" img="new" alt="New" text="New" onclick="onNew(2)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteContact" img="delete" alt="Delete" text="Delete" onclick="onDelete(2)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSaveContact" img="save" alt="Save" text="Save" onclick="onSave(2)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid id="grdContact" header="Name|Position|Phone|Mobile|Fax|Email|Urgent contact|Active|Valid from|Valid to|Description|_pk|_tco_buspartner_pk|_addr|Table"
                                            format="0|0|0|0|0|0|0|3|4|4|0|0|0|0|0" 
											aligns="0|0|0|0|0|0|0|0|0|4|4|0|0|0|0"
                                            defaults="||||||||||||||tco_buspartner" 
											editcol="1|1|1|1|1|1|1|1|1|1|1|0|1|1|1"
                                            widths="200|150|150|200|100|100|300|80|150|150|300|1|1|1|1" styles="width:100%; height:100%"
                                            sorting="T" sendoldvalue="T" paging="true" pageview="10" />
										</div>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Biz place" id="Table5" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNewBizplace" img="new" alt="New" text="New" onclick="onNew(3)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteBizplace" img="delete" alt="Delete" text="Delete" onclick="onDelete(3)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSaveBizplace" img="save" alt="Save" text="Save" onclick="onSave(3)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid id="grdBizplace" header="ID|Name|Local name|Foreign name|Nation|Reg no.|Tax|Tax office|Representative|Zipcode|Address 1|Address 2|Address 3 |Address 4|Address 5|Address 6|Phone|Fax|biz_type|biz_item|biz_grp|Description|Active|Start date|End date|_pk|_tco_buspartner_pk|_Table|_tax_office_pk"
                                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|4|4|0|0|0|0" 
											aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            defaults="|||||||||||||||||||||||||||tco_buspartner|" 
											editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1||1"
                                            widths="100|250|250|150|100|150|150|150|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|1|1|1|1"
                                            styles="width:100%; height:100%" sorting="T" 
                                            sendoldvalue="T" paging="true" pageview="10" />
										</div>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Location" id="Table6" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNewLoc" img="new" alt="New" text="New" onclick="onNew(4)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelLoc" img="delete" alt="Delete" text="Delete" onclick="onDelete(4)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSaveLoc" img="save" alt="Save" text="Save" onclick="onSave(4)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid  id="grdLocation" header="Name|Local name|Foreign name|Charger|Sale order|Delivery|Collection|Zip code|Address 1|Address 2|Address 3|Phone|Fax|Email|Active|Start date|To date|Description|_pk|_tco_buspartner_pk|_Table"
                                            format="0|0|0|0|3|3|3|0|0|0|0|0|0|0|3|4|4|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            defaults="||||||||||||||||||||tco_buspartner" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"
                                            widths="250|250|250|250|100|100|100|150|150|150|150|150|150|150|80|120|120|200|1|1|1"
                                            styles="width:100%; height:100%" sorting="T" 
                                            sendoldvalue="T" paging="true" pageview="10"  />
										</div>	
                                    </td>
                                </tr>
                            </table>                           
                            <table style="width: 100%; height: 100%" name="Memo" id="Table1" align="top" style="overflow: scroll">                                                               
                                <tr style="height: 99%">
                                    <td>
                                        <gw:textarea id="txtMemo" rows="10" styles="width:100%;" />
                                    </td>
                                </tr>
                            </table>
							<table style="width: 100%; height: 100%" name="Work Classification" id="Table7" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNewLoc" img="new" alt="New" text="New" onclick="onNew(5)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelLoc5" img="delete" alt="Delete" text="Delete" onclick="onDelete(5)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSaveLoc5" img="save" alt="Save" text="Save" onclick="onSave()" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid id="grdWork_Classification" header="Code|Name (ENG)|Name (VN)|Name (KR)|Remark|_PK|_partner_pk|_TPS_WORKDIVISION_pk"
												format="0|0|0|0|0|0|0|0" 
												 aligns="0|0|0|0|0|0|0|0" 
												 defaults="|||||||"
												editcol="0|0|0|0|1|0|0|0|" widths="150|300|300|300|300|1|1|1"
												styles="width:100%; height:100" sorting="T" paging="true" pageview="7" 
												oncelldblclick="OnPopUp('Work_Classification')" />
										</div>	
                                    </td>
                                </tr>
                            </table>   
							<table style="width: 100%; height: 100%" name="Bank Account" id="Table2" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td><gw:imgbtn id="btnDete" img="new" alt="New" onclick="onNew(6)" /></td> 
									<td><gw:imgbtn id="btDlte" img="save" alt="Save" onclick="onSave(6)" /></td> 
									<td><gw:imgbtn id="bnlte" img="delete" alt="Delete" onclick="onDelete(6)" /></td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <div style="width:766; height:200; overflow:auto">
											<gw:datagrid id="grdBank_Account" header="Currency|Bank Name|Account No|Account Name|Remark|_PK|_partner_pk|_tac_bfbeneficiary_pk"
												format="0|0|0|0|0|0|0|0" 
												 aligns="0|0|0|1|0|0|0|0" 
												 defaults="|||||||"
												editcol="0|0|0|0|1|0|0|0" widths="100|200|150|300|300|1|1|1"
												styles="width:100%; height:100%" sorting="T"  paging="true" pageview="7" 
												oncelldblclick="OnPopUp('Bank_Account')" />
										</div>	
                                    </td>
                                </tr>
                            </table> 
                            </gw:tab>
                            <!--  </gw:tab> -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtParentPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />        
    <gw:textbox id="imagePK" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtPartID" styles='display:none' />
    <gw:textbox id="txtTable" text="tco_buspartner" styles='display:none' />
	<gw:textbox id="txtSesion_company"  styles='display:none' />
	<gw:textbox id="lst_auto_voucher_type"  styles='display:' />
    <!----------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
    <!----------------------------------------------------------------------------------------->
</body>
</html>
