<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Bussiness Partner Entry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
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
    
     lstVoucherType.SetEnable(false);
     lstVoucherType.SetDataText('');
     onSearch(0);
     MergeHeader_Financial(); 
     FormatGrid(); 
 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {
        
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
            if ( txtPartnerid.text == '' )
            {
                alert('Please, input Partner ID !!!');
                txtPartnerid.GetControl().focus();
                return;
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
       case 5:// save location
                grdFinancial.SetRowStatus(1, 0);
                data_agic00010_6.Call();
        break;
     }
 }
 //---------------------------------------------------------
 function onNew(index)
    {
    switch(index)
    {
        case 0: // add new master
            lstVoucherType.SetDataText('');             
            data_agic00010.StatusInsert();
            txtPartnerid.SetEnable(true);  
            chkActive.value='-1';  
            onPartnerTypeChange();                    
        break;
        case 1:// add new charger
            if(txtPartnerPk.text !="")
            {
                grdCharger.AddRow();
                grdCharger.SetGridText(grdCharger.rows - 1,1,txtPartnerPk.GetData());
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
                 grdContact.SetGridText(grdContact.rows - 1,1,txtPartnerPk.GetData());
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
                grdBizplace.SetGridText(grdBizplace.rows - 1,1,txtPartnerPk.GetData());
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
                 grdLocation.SetGridText(grdLocation.rows - 1,1,txtPartnerPk.GetData());
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
                grdFinancial.AddRow();
                grdFinancial.SetGridText(grdFinancial.rows - 1, 8, txtPartnerPk.GetData());
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
            if(confirm('Do you want to delete selected Financial ?'))
            {
                 grdFinancial.DeleteRow();
                 //data_agic00010_5.Call();
            }
        break;
    }          
 }
 //---------------------------------------------------------
function FormatGrid()
{
            var ctrl = grdFinancial.GetGridControl();
            var i = 0; 
            var j = 0; 
           for(i=2;i<grdFinancial.cols; i++)
           {
                    ctrl.ColFormat(1) = "#,###,###,###,###,###,###,###,###";
                    ctrl.ColFormat(3) = "#,###,###,###,###,###,###,###,###";
                    ctrl.ColFormat(5) = "#,###,###,###,###,###,###,###,###";
           } 
            
 
}
 function MergeHeader_Financial()
{
        var fg=grdFinancial.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   grdFinancial.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2)  = "Chartered Capital"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 1, 1, 1) = "Amount"
	    fg.Cell(0, 1, 2, 1, 2) = "Currency" 
	    
		fg.Cell(0, 0, 3, 0, 4)  = "Turnover"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 3, 1, 3) = "Amount"
	    fg.Cell(0, 1, 4, 1, 4) = "Currency" 
	  
		fg.Cell(0, 0, 5,0, 6)  = "Profit After Tax"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 5, 1, 5) = "Amount"
	    fg.Cell(0, 1, 6, 1, 6) = "Currency" 
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Year"	
		
}
 //---------------------------------------------------------
 function loadBSDetail1()
 {
	var row  = grdPartner.row;	
    txtPartnerPk.SetDataText(grdPartner.GetGridData(row,0));
    txtPartID.SetDataText(grdPartner.GetGridData(row,1));
	txtPartNm.SetDataText(grdPartner.GetGridData(row,2));
	data_agic00010.StatusSelect();
	data_agic00010.Call("SELECT");	
 }
 //---------------------------------------------------------
 function openEmpLookup(num)
 {
//    var url = '/form/sys/auth/wsyau00001_1.aspx' ; neu khong dung thi xoa
	var url = '/form/ch/ae/chae00010_search_emp.aspx' ;
	
	o = System.OpenModal( System.RootURL+ url , 900 , 600 , 'resizable:yes;status:yes') 
	
	if ( o != null )
	{
		grdCharger.SetGridText(grdCharger.row,2,o[0]); // Emp PK
		grdCharger.SetGridText(grdCharger.row,3,o[1]); // Emp ID
		grdCharger.SetGridText(grdCharger.row,4,o[2]); // Emp Name
		grdCharger.SetGridText(grdCharger.row,5,o[4]); // Department
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
        
                    data_agic00010_6.Call("SELECT");
            
        break;
        case "data_agic00010_6":
                MergeHeader_Financial(); 
                FormatGrid(); 
        break;
    }
 }
 function OnGetParent()
 {
    var fpath = System.RootURL + "/form/ag/ec/agec00010_p.aspx";
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
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AR";
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
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AR";
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
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGGS0101";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboCompanysize.SetDataText(object[1]);
			 }
        break; 
		case 'Partner_Type':
        	 var path = System.RootURL + '/form/61/01/61010010_popup_PartnerType.aspx?code=CODC0010';
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboPartnertype.SetDataText(object[1]);
			 }
		break;
		case 'transaction':
			var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0023';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstTransaction_D.SetDataText(object[1]);
			 }
		break;
		case 'Location':
			var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0013';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboLocation.SetDataText(object[1]);
			 }
		break;
		case 'Position':
			var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0014';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstPosition.SetDataText(object[1]);
			 }
		break;
        case 'LGCM0100':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0100";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboTranccy.SetDataText(object[1]);
			 }
        break;
        
        case 'LGGS0103':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGGS0103";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboInvoiceterms.SetDataText(object[1]);
			 }
        break;
        
        case 'LGGS0104':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGGS0104";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboInvoiceSchedule.SetDataText(object[1]);
			 }
        break;
        
        case 'LGGS0105':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGGS0105";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboInvoicegroup.SetDataText(object[1]);
			 }
        break;   
        
        case 'LGCM0260':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0260";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboDeliveryterms.SetDataText(object[1]);
			 }
        break;
        
        case 'LGCM0140':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0140";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboCustTradeType.SetDataText(object[1]);
			 }
        break;
        
        case 'LGCM0141':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0141";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboVendortradetype.SetDataText(object[1]);
			 }
        break;          
        
        case 'LGCM0120':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboCustPaymentTerms.SetDataText(object[1]);
			 }
        break; 
        case 'VendorPaymentTerms':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboVendorpayterm.SetDataText(object[1]);
			 }
        break; 
        case 'LGCM0110':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboCustpaymentform.SetDataText(object[1]);
			 }
        break;  
		case 'VendorPaymentForm':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboVenPaymentform.SetDataText(object[1]);
			 }
        break;  
        case 'LGCM0160':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0160";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboSaledefaulttax.SetDataText(object[1]);
			 }
        break;  
        case 'VendorDefaultTax':        
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGCM0160";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 cboVendorDtax.SetDataText(object[1]);
			 }
        break;  
        case 'Capacity': 
			if(txtPartnerPk.text=='')
			{
				alert('Please select a Partner !!');	
			}
			else
			{
				 var fpath = System.RootURL + "/form/kp/ac/kpac00030.aspx?partner_pk=" + txtPartnerPk.text + '&_row=' + grdPartner.row;
				 //var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				 var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;dialogWidth:50;dialogHeight:40;dialogLeft:' + window.event.screenX + ';dialogTop:' + window.event.screenY    +';edge:sunken;scroll:yes;unadorned:yes;help:no;center:yes');
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
        var  url= System.RootURL + "/reports/61/01/61010010.aspx";
	    System.OpenTargetPage( url, "_blank" );        
    }
 //---------------------------------------------------------

</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00010" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77" function="pm_sel_61010010"  procedure="pm_upd_61010010"> 
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
                
                <inout  bind="cboLocation" />
                <inout  bind="lstPosition" />
                <inout  bind="lstNationality" />  
                <inout  bind="cboCatalogue_YN" />  
                   
            </inout>
        </dso> 
    </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00010_1"> 
        <xml> 
            <dso id="1" type="grid" function="pm_sel_61010010_partner" > 
                <input> 
                    <input bind="txtPartnerQuery" /> 
                    <input bind="txtTaxcode_Q" /> 
                    <input bind="lstType" /> 
                     <input bind="lstUse_YN" /> 
                     <input bind="lstTransaction" /> 
                </input> 
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdCharger ---------------------------------------->
    <gw:data id="data_agic00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,5,7,8,9,10" function="pm_sel_61010010_charger"  procedure="pm_upd_61010010_charger"> 
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
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="pm_sel_61010010_contact"  procedure="pm_upd_61010010_contact"> 
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
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" function="pm_sel_61010010_bizplace"  procedure="pm_upd_61010010_bizplace"> 
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
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="pm_sel_61010010_location"  procedure="pm_upd_61010010_location"> 
                <input bind="grdLocation" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input>
                <output bind="grdLocation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
 <gw:data id="data_agic00010_6" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8" function="pm_sel_61010010_Financial"  procedure="pm_upd_61010010_financial"> 
                <input bind="grdFinancial" > 
                    <input bind="txtPartnerPk" />
                </input>
                <output bind="grdFinancial" /> 
            </dso> 
        </xml> 
    </gw:data>
 
    <!-------------------------------------------------------------------->    

    <table style="width: 100%; height: 100%" border="1" id="tableID1">
        <tr>
            <td id="left" style="width: 40%">
                <table style="width: 100%; height: 100%">
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
                    <tr style="height: 100%">
                        <td colspan="3">
                            <gw:grid id="grdPartner" header="_PK|ID|Name|Tax Code" format="0|0|0|0" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|0|2000|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="loadBSDetail1()" />
                        </td>
                    </tr>
                </table>
         </td>
            <td id="right" style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onClick="OnGetParent()">Parent Com</b>
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
                                    <td style="width: 95%; white-space: nowrap">
                                        <gw:label id="lblInfo" styles='width:100%;color:cc0000;font:9pt' text='' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnNw" img="popup" alt="Capacity" onclick="OnPopUp('Capacity')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnNew" img="new" alt="New" text="New" onclick="onNew(0)" styles='width:100%;display:none' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave(0)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="onDelete(0)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnPrint" img="excel" "alt="List of business partner" text="Print"
                                            onclick="onPrint()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Company</td>
                        <td style="width: 20%">
                            <gw:list id="cboOrganization" styles="width:100%;" />
                        </td>
                        <td style="width: 10%" align="right"><a href="#" title="Click here to show Partner Type " style="text-decoration:none" onClick="OnPopUp('Partner_Type')">Partner type</a></td>
                        <td style="width: 20%">
                            <gw:list id="cboPartnertype" styles="width:100%;" onchange="onPartnerTypeChange()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Tax code</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTaxcode" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
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
                   
                  <tr style="display:none">
                                <td align="right">Representative</td> 
                                <td colspan="3"><gw:textbox id="txtRepresentative" styles="width:100%;"  /></td>
                  </tr> 
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Local Name</td>
                        <td colspan="5">
                            <gw:textbox id="txtLname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">Short Name</td>
                        <td colspan="5"><gw:textbox id="txtShortNM" styles="width: 100%" /></td>
                         
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Foreign Name</td>
                        <td colspan="5">
                            <gw:textbox id="txtFname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    
                    <tr style="height: 1%;display:none">
                        <td style="width: 10%" align="right">
                            Address 3</td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress3" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    
                    <tr style="display:none">
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
                    <tr style="height: 89%">
                        <td colspan="6">
                            <!-- <gw:tab id="idTab" > -->
                            <gw:tab id="idTab">
                            <table cellpadding="1" cellspacing="1" style="width: 100%; height: 100%;overflow: scroll" name="General Info" id="TabGeneralInfo">
                                <tr>
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="100%"><gw:checkbox id="chkActive" defaultvalue="-1|0" value="-1" onchange="" /></td>
                                                <td style="display:none" align="right">Form no</td>
                                                <td style="display:none" align="left"><gw:textbox id="txtFormNo" styles="width: 100%" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 15%;" align="right">Established Date</td>
                                    <td style="width: 35%;" align="left"><gw:datebox id="dtbAnniversary" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                <tr>
                                    <td align="right"><a href="#" title="Click here to show Transaction" onClick="OnPopUp('transaction')" style="text-decoration:none" >Transaction</a></td>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                    <td width="100%"><gw:list id="lstTransaction_D" styles="width:100%" /></td>
                                                    <td style="display:none" align="right">Tax office</td>
                                                    <td style="display:none"><gw:textbox id="txtTaxoffice" styles="width:100%;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 15%" align="right">Valid</td>
                                    <td style="width: 35%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                        ~
                                        <gw:datebox id="dtbTo" nullaccept lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Corporate Type</td>
                                    <td><gw:list id="lstCorporate" styles="width:100%" /></td>
                                    <td align="right">License No</td> 
                                    <td><gw:textbox id="txtLicense_No" styles="width:100%;"  /></td>
                                </tr>
                                <tr>
                                    <td  align="right">Address (VN)</td>
                                    <td colspan="4"><gw:textbox id="txtAddress1" styles="width:100%;" csstype="" /></td>
                                </tr>
                                <tr>
                                    <td  align="right">Address(ENG)</td>
                                    <td colspan="4"><gw:textbox id="txtAddress2" styles="width:100%;" csstype="" /></td>
                                </tr>
                                 <tr >
                                    <td style="width: 10%" align="right">Phone</td>
                                    <td colspan="4">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="20%"><gw:textbox id="txtPhone" styles="width:100%;" csstype="" /></td>
                                                <td width="5%" align="right">Fax&nbsp;</td>
                                                <td width="20%"><gw:textbox id="txtFax" styles="width:100%;" csstype="" /></td>
                                                <td width="7%" align="right">Email&nbsp;</td>
                                                <td width="20%"><gw:textbox id="txtEmail" styles="width:100%;" csstype="" /></td>
                                                <td width="10%" align="right">Web site&nbsp;</td>
                                                <td width="18%"><gw:textbox id="txtWebsie" styles="width:100%;" csstype="" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">No. of Employee</td>
                                    <td style="width: 35%"><gw:textbox id="txtNum_employee" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Serial no</td>
                                    <td style="width: 35%" align="left"><gw:textbox id="txtSerial" styles="width: 100%" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;display:none" align="right">Capital</td>
                                    <td style="width: 35%;display:none"><gw:textbox id="txtCapital" styles="width:100%;" /></td>
                                    <td style="width: 15%;" align="right"><a href="#" title="Click here to show Location" onClick="OnPopUp('Location')" style="text-decoration:none" >Location</a></td>
                                    <td style="width: 35%"><gw:list id="cboLocation" styles="width:100%;" /></td>
                                    
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0101')">Company size</b></td>
                                    <td style="width: 35%"><gw:list id="cboCompanysize" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                    <td style="width: 35%" align="left" rowspan="8">
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
                                    <td style="width: 15%" align="right"><a href="#" title="Click here to show Transaction Currency" onClick="OnPopUp('LGCM0100')" style="text-decoration:none" >Transaction currency</a></td>
                                    <td style="width: 35%"><gw:list id="cboTranccy" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr style="display:none">
                                    <td style="width: 15%" align="right">Industrial zone</td>
                                    <td style="width: 35%">
                                    <gw:textbox id="txtIndustrial" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr style="display:none">
                                    <td style="width: 15%" align="right">Company product</td>
                                    <td style="width: 35%"><gw:textbox id="txtCompanyproduct" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Representative's:</td>
                                    <td >
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="30%" align="right">Name&nbsp;</td>
                                                <td style="width: 70%"><gw:textbox id="txtRepresented" styles="width:100%;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                     <td style="width: 15%" align="right"></td>
                                     <td >
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td style="width: 30%" align="right"><a href="#" title="Click here to show Position" onClick="OnPopUp('Position')" style="text-decoration:none" >Position&nbsp;</a></td>
                                                <td width="70%"><gw:list id="lstPosition" styles="width:100%;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                     <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                     <td style="width: 15%" align="right"></td>
                                     <td >
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td style="width: 30%" align="right">Nationality&nbsp;</td>
                                                <td width="70%"><gw:list id="lstNationality" styles="width:100%;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                     <td style="width: 15%" align="right"></td>
                                </tr>
                                <tr>
                                    <td  align="right" valign="top">Remark</td>
                                    <td colspan="4"><gw:textarea id="txtDescription" styles="width:100%;height:70" csstype="" /></td>
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
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('VendorPaymentForm')">Payment form</b></td>
                                    <td style="width: 35%"><gw:list id="cboVenPaymentform" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Bank account</td>
                                    <td style="width: 35%"><gw:textbox id="txtVendorbankacc" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('VendorPaymentTerms')">Payment terms</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendorpayterm" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right">Swift No</td>
                                    <td style="width: 35%"><gw:textbox id="txtVendorSwiftNo" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0141')">Trade type</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendortradetype" styles="width:100%;" /></td>
                                    <td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('VendorDefaultTax')">Default tax</b></td>
                                    <td style="width: 35%"><gw:list id="cboVendorDtax" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height:1%">
                                            <td align="right">Catalogue Y/N</td>
                                            <td style="width: "><gw:list id="cboCatalogue_YN" styles="width:100%;" /></td>
                                </tr>
                                <tr style="height: 95%"></tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Charger" id="Table3" align="top" style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right"></td>
                                    <td style="width: 1%" align="right"><gw:button id="btnNewCharger" img="new" alt="New" text="New" onclick="onNew(1)" /></td>
                                    <td style="width: 1%"><gw:button id="btnDeleteCharger" img="delete" alt="Delete" text="Delete" onclick="onDelete(1)" /></td>
                                    <td style="width: 1%"><gw:button id="btnSaveCharger" img="save" alt="Save" text="Save" onclick="onSave(1)" /></td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <gw:grid id="grdCharger" header="_PK|_partner_pk|_EmpPK|EmployeeID|Emp Name|Department|Remark|Active|StartDate|EndDate|_Table"
                                            format="0|0|0|0|0|0|0|3|4|4|0" aligns="0|0|0|0|0|0|0|0|0|0|0" defaults="||||||||||tco_buspartner"
                                            editcol="1|1|1|0|0|0|1|1|1|1|0" widths="0|0|0|1500|4000|3000|3000|800|1200|1200|0"
                                            styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10" oncelldblclick="openEmpLookup(0)" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Contact" id="Table4" align="top" style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnNewContact" img="new" alt="New" text="New" onclick="onNew(2)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDeleteContact" img="delete" alt="Delete" text="Delete" onclick="onDelete(2)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnSaveContact" img="save" alt="Save" text="Save" onclick="onSave(2)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <gw:grid id="grdContact" header="_pk|_tco_buspartner_pk|Name|Position|Phone|Mobile|Fax|Email|Urgent contact|_addr|Active|Valid from|Valid to|Description|_Table"
                                            format="0|0|0|0|0|0|0|0|0|0|3|4|4|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|4|4|0|0"
                                            defaults="||||||||||||||tco_buspartner" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"
                                            widths="||2000|1500|1500|1500|1500|2000|2000| 2000|800|1200|1200|2000|0" styles="width:100%; height:100%"
                                            sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" sendoldvalue="T" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Biz place" id="Table5" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnNewBizplace" img="new" alt="New" text="New" onclick="onNew(3)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDeleteBizplace" img="delete" alt="Delete" text="Delete" onclick="onDelete(3)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnSaveBizplace" img="save" alt="Save" text="Save" onclick="onSave(3)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="4">
                                        <gw:grid id="grdBizplace" header="_pk|_tco_buspartner_pk|ID|Name|Local name|Foreign name|Nation|Reg no.|Tax|Tax office|Representative|Zipcode|Address 1|Address 2|Address 3 |Address 4|Address 5|Address 6|Phone|Fax|biz_type|biz_item|biz_grp|Description|Active|Start date|End date|_Table"
                                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|4|4|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            defaults="|||||||||||||||||||||||||||tco_buspartner" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"
                                            widths="0|0|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|800|1200|1200|0"
                                            styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27"
                                            sendoldvalue="T" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%" name="Location" id="Table6" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnNewLoc" img="new" alt="New" text="New" onclick="onNew(4)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDelLoc" img="delete" alt="Delete" text="Delete" onclick="onDelete(4)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnSaveLoc" img="save" alt="Save" text="Save" onclick="onSave(4)" />
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <gw:grid id="grdLocation" header="_pk|_tco_buspartner_pk|Name|Local name|Foreign name|Charger|Sale order|Delivery|Collection|Zip code|Address 1|Address 2|Address 3|Phone|Fax|Email|Active|Start date|To date|Description|_Table"
                                            format="0|0|0|0|0|0|3|3|3|0|0|0|0|0|0|0|3|4|4|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            defaults="||||||||||||||||||||tco_buspartner" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"
                                            widths="0|0|1500|1500|1500|1500|1000|1000|1000|1500|1500|1500|1500|1500|1500|1500|800|1200|1200|2000|0"
                                            styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20"
                                            sendoldvalue="T" />
                                    </td>
                                </tr>
                            </table>                           
                            <table style="width: 100%; height: 100%;overflow: scroll" name="Financial Status" id="Table7"  cellpadding="0" cellspacing="0">
                                <tr style="height: 1%">
                                        <td>
                                                    <fieldset style="padding:0">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                                <td style="width: 100%"></td>
                                                                                <td ><gw:button id="btnNeLoc" img="new" alt="New" onclick="onNew(5)" /></td>
                                                                                <td style="width: 1%"><gw:button id="btnDeloc" img="delete" alt="Delete" text="Delete" onclick="onDelete(5)" /></td>
                                                                                <td style="width: 1%"><gw:button id="btnSveLoc" img="save" alt="Save" text="Save" onclick="onSave(5)" /></td>
                                                                    </tr>
                                                            </table>
                                                    </fieldset>
                                        </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td colspan="6">
                                        <gw:grid id="grdFinancial" 
                                             header="Year|Amount|Currency|Amount|Currency|Amount|Currency|_pk|_partner_pk"
                                            format="0|0|0|0|0|0|0|0|0" 
                                             aligns="1|3|1|3|1|3|1|0|0"
                                            defaults="||||||||" 
                                            editcol="1|1|1|1|1|1|1|1|1"
                                            widths="1000|2000|1000|2000|1000|2000|1000|0|0"
                                            styles="width:100%; height:100%" 
                                            sorting="T" 
                                            sendoldvalue="T" />
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
    <gw:textbox id="txtPartNm" styles='display:none' />
    <gw:textbox id="txtTable" text="tco_buspartner" styles='display:none' />
    <gw:textarea id="txtMemo" rows="10" styles="width:100%;display:none" />
    <!----------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
    <!----------------------------------------------------------------------------------------->
</body>
</html>
