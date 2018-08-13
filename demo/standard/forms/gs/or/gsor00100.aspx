
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Company Entry</title>
  </head>
  
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
 
 <script>
 var status_control;
 //---------------------------------------------------------
 function BodyInit()
 { 
    System.Translate(document); 
    BindingDataList();
    onSearch(0);
 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {
        var data="";
        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0010','','') FROM DUAL")%>"; 
        cboPartnertype.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0040','','') FROM DUAL")%>"; 
        cboCompanysize.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('COAB0080','','') FROM DUAL")%>"; 
        cboNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";
        cboTranccy.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0270','','') FROM DUAL")%>";
        cboInvoiceterms.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0280','','') FROM DUAL")%>";
        cboInvoiceSchedule.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0290','','') FROM DUAL")%>";
        cboInvoicegroup.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0245','','') FROM DUAL")%>";
        cboDeliveryterms.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('COCI0150','','') FROM DUAL")%>";
        cboCustTradeType.SetDataText(data);
        cboVendortradetype.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0150','','') FROM DUAL")%>";
        cboCustPaymentTerms.SetDataText(data);
        cboVendorpayterm.SetDataText(data); 

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0140','','') FROM DUAL")%>";
        cboCustpaymentform.SetDataText(data);
        cboVenPaymentform.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0110','','') FROM DUAL")%>";
        cboSaledefaulttax.SetDataText(data);
        cboVendorDtax.SetDataText(data);

 }
 //---------------------------------------------------------
 
 function onSearch(index)
 {
    switch(index)
    {
        case 0:
            detail.StatusSelect();
            detail.Call("SELECT");
        break;
    }
 }
 //---------------------------------------------------------
 function onSave(index)
 {
    imagePK.text = imgFile.oid;
    imagePK_1.text = imgFile_1.oid;
    switch(index)
    {
        case 0: // save master:
            if ( txtPartnerid.text == '' )
            {
                alert('Please, input data Partner ID !!!');
                txtPartnerid.GetControl().focus();
                return
            }
            
            if ( txtPartnerName.text == '' )
            {
                alert('Please, input data Partner Name !!!');
                txtPartnerName.GetControl().focus();
                return;
            }
            
            if ( txtTaxcode.text == '' )
            {
                alert('Please, input data Tax Code !!!');
                txtTaxcode.GetControl().focus();
                return;
            }
            bsEntry.Call();
            
        break;
        case 1:// save charger
            idData_Dsql_wcodc00001_1.Call();
        break;
        case 2:// save contact
            idData_Dsql_wcodc00001_2.Call();
        break;
        case 3:// save biz place
            idData_Dsql_wcodc00001_3.Call();
        break;
        case 4:// save location
            idData_Dsql_wcodc00001_4.Call();
        break;
     }
 }
 //---------------------------------------------------------
 function onNew(index)
    {
    switch(index)
    {
        case 0: // add new master
                
            bsEntry.StatusInsert();
        break;
        case 1:// add new charger
            if(txtPartnerPk!="")
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
            if(txtPartnerPk!="")
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
            if(txtPartnerPk!="")
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
            if(txtPartnerPk!="")
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
                bsEntry.StatusDelete();
                bsEntry.Call();
            }   
        break;
        case 1:// delete charger
            if(confirm('Do you want to delete selected charger ?'))
            {
                 grdCharger.DeleteRow();
                 idData_Dsql_wcodc00001_1.Call();
            }
        break;
        case 2: // Delete contact
            if(confirm('Do you want to delete selected contact ?'))
            {
                 grdContact.DeleteRow();
                 idData_Dsql_wcodc00001_2.Call();
            }
        break;
        case 3:// delete place
            if(confirm('Do you want to delete selected place ?'))
            {
                 grdBizplace.DeleteRow();
                 idData_Dsql_wcodc00001_3.Call();
            }
        break;
        case 4: // delete location
            if(confirm('Do you want to delete selected location ?'))
            {
                 grdLocation.DeleteRow();
                 idData_Dsql_wcodc00001_4.Call();
            }
        break;
      
    }          
 }
 //---------------------------------------------------------
 function loadBSDetail1()
 {
	var row  = grdPartner.row;
	txtPartnerPk.text  = grdPartner.GetGridData(row,0);
    	
	bsEntry.StatusSelect();
	bsEntry.Call("SELECT");	
 }
 //---------------------------------------------------------
 function openEmpLookup(num)
 {
	var url = '/form/ch/ae/chae0010_search_emp.aspx' ;
	
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
        case "bsEntry":            
            status_control = bsEntry.GetStatus();

            imgFile.SetDataText(imagePK.text);      
            imgFile_1.SetDataText(imagePK_1.text);      
            idData_Dsql_wcodc00001_1.Call("SELECT");
        break;
        case "idData_Dsql_wcodc00001_1":
            idData_Dsql_wcodc00001_2.Call("SELECT");
        break;
        case "idData_Dsql_wcodc00001_2":
            idData_Dsql_wcodc00001_3.Call("SELECT");
        break;
        case "idData_Dsql_wcodc00001_3":
            idData_Dsql_wcodc00001_4.Call("SELECT");
        break;
        case "idData_Dsql_wcodc00001_4":
            if ( status_control != 0 )
            {
                detail.Call("SELECT");
            }
            else
            {}
        break;
    }
 }
 
 function OnGetParent()
 {
    var fpath = System.RootURL + "/form/ag/ec/agio00010_p.aspx";
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
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }
 
function OnChan()
 {
    if ( chAuto.value == 'T' )
    {
        txtPartnerid.SetEnable(false);
      
    }
    else
    {
      
        txtPartnerid.SetEnable(true);
    }
 }
 //---------------------------------------------------------
</script>

<body>
<gw:data id="bsEntry"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54" function="ST_HR_SEL_GSOR00100_0"  procedure="ST_HR_UPD_GSOR00100_0"> 
            <inout> 
                <inout  bind="txtPartnerPk" />
                <inout  bind="txtParentPk" />
                <inout  bind="txtParCom" />
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
                <inout  bind="cboSalePresentative" />
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
                <inout  bind="cboIndustrial" />
                <inout  bind="txtCompanyproduct" />
                <inout  bind="txtTaxoffice" />
                <inout  bind="dtbFrom" />
                <inout  bind="dtbTo" />
                <inout  bind="txtDescription" />
                <inout  bind="txtSerial" />
                <inout  bind="txtShortNM" />
                <inout  bind="txtFormNo" />
                <inout  bind="imagePK" />
                <inout  bind="imagePK_1" />
            </inout>
        </dso> 
    </xml> 
</gw:data> 
<gw:data id="detail" > 
        <xml> 
            <dso id="1" type="grid" function="ST_HR_SEL_GSOR00100_1" > 
                <input> 
                    <input bind="txtPartnerQuery" /> 
                </input> 
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
</gw:data> 


 <!-----------------grdCharger ---------------------------------------->
 <gw:data id="idData_Dsql_wcodc00001_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,5,7,8,9,10" function="ST_HR_SEL_GSOR00100_2"  procedure="ST_HR_UPD_GSOR00100_2"> 
                <input bind="grdCharger" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input>
                <output bind="grdCharger" />
            </dso> 
        </xml> 
</gw:data> 
<!-----------------grdContact ---------------------------------------->
 <gw:data id="idData_Dsql_wcodc00001_2"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="ST_HR_SEL_GSOR00100_3"  procedure="ST_HR_UPD_GSOR00100_3"> 
                <input bind="grdContact" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input> 
                <output bind="grdContact" /> 
            </dso> 
        </xml> 
</gw:data> 
<!-----------------grdBizplace ---------------------------------------->
 <gw:data id="idData_Dsql_wcodc00001_3"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="ST_HR_SEL_GSOR00100_4"  procedure="ST_HR_UPD_GSOR00100_4"> 
                <input bind="grdBizplace" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input> 
                <output bind="grdBizplace" /> 
            </dso> 
        </xml> 
</gw:data> 
<!-----------------grdLocation ---------------------------------------->
 <gw:data id="idData_Dsql_wcodc00001_4"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="ST_HR_SEL_GSOR00100_5"  procedure="ST_HR_UPD_GSOR00100_5"> 
                <input bind="grdLocation" > 
                    <input bind="txtPartnerPk" />
                    <input bind="txtTable" />
                </input> 
                <output bind="grdLocation" /> 
            </dso> 
        </xml> 
</gw:data> 

<!-------------------------------------------------------------------->
   
  
        <table width="100%" border="1" cellpadding="0" cellspacing="0" id="tableID1">
            <tr>
                <td id="left" width="20%">
                    <table width="100%" height="100%" cellpadding="1" cellspacing="1" border="0">
                        <tr valign="center">
                            <td width="10%">
                                <b>Client</b>
                            </td>
                            <td width="20%">
                                <gw:textbox id="txtPartnerQuery" csstype="filter" onenterkey="onSearch(0)" />
                            </td>
                            <td width="3%" align="right">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch(0)" />
                            </td>
                        </tr>
                        <tr valign="center">
                            <td colspan=3 width="100%">                               
                               <gw:grid   
		                        id="grdPartner"  
		                        header="_PK|ID|Name"   
		                        format="0|0|0"  
		                        aligns="0|0|0"  
		                        defaults="||"   
		                        editcol="1|1|1"  
			                    widths="0|0|1200"  
		                        styles="width:100%; height:500"   
		                        sorting="T"   
		                        param="0,1,2"  oncellclick="loadBSDetail1()" /> 
                            </td>                            
                        </tr>
                    </table>
                </td>                
                <td id="right" width="80%" >
                    <table width="100%" cellpadding="1" cellspacing="1" border="0">
                        <tr valign=top>               
                            <td id="Td1" width="80%" valign="top" >
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b style="color: #1b2ff2; cursor: hand" onclick="OnGetParent()">&nbsp;&nbsp;&nbsp; Parent Com</b>
                                        </td>
                                        <td width="87%" colspan="3">
                                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td width="20%">
                                                        <gw:textbox id="txtParCom" styles="width:100%" />
                                                    </td>
                                                    <td id="idVoucher" width="10%" align="right"></td>
                                                    <td width="15%"></td>
                                                    <td width="8%" align="left"></td>
                                                    <td width="13%">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="85%"></td>
                                                                <td width="3%" align="right" style="height: 19px">
                                                                    <gw:button id="btnSearch1" img="search" alt="Search" text="Search" onclick="onSearch(1)" />
                                                                </td>
                                                                <td width="3%" align="right" style="height: 19px">
                                                                    <gw:button id="btnNew" img="new" alt="New" text="Add New" onclick="onNew(0)" />
                                                                </td>
                                                                <td width="3%" style="height: 19px">
                                                                    <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave(0)" />
                                                                </td>
                                                                <td width="3%" style="height: 19px">
                                                                    <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="onDelete(0)" />
                                                                </td>
                                                                <td width="3%" style="height: 19px">
                                                                    <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="3">
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp;&nbsp;&nbsp; Company Type</b>
                                        </td>
                                        <td width="87%" colspan="3">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="20%">
                                                        <gw:list id="cboPartnertype" styles="width:100%;" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        <b>Tax code &nbsp;</b>
                                                    </td>
                                                    <td width="15%">
                                                        <gw:textbox id="txtTaxcode" styles="width:100%;" csstype="mandatory" />
                                                    </td>
                                                    <td width="8%" align="right"></td>
                                                    <td width="13%"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="3">
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Company ID</b></td>
                                        <td width="20%">
                                            <gw:textbox id="txtPartnerid" styles="width:100%;" csstype="mandatory" />
                                        </td>
                                        <td width="15%" valign="middle" align="right">
                                            <b>Company Name &nbsp;</b></td>
                                        <td width="50%">
                                            <gw:textbox id="txtPartnerName" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                    </tr>
									 <tr>
                                        <td width="13%" valign="middle">&nbsp; &nbsp;Short Name</td>
                                        <td width="20%" colspan="1">
                                            <gw:textbox id="txtShortNM" styles="width: 100%" />
                                        </td>
										<td width="15%" align="right">Representative</td>
                                        <td width="50%" colspan="1">
                                            <gw:textbox id="txtRepresentative" styles="width: 100%" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                          <b>&nbsp; &nbsp; Local Name</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtLname" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                   
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Foreign Name</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtFname" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Address 1</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtAddress1" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Address 2</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtAddress2" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Address 3</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtAddress3" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Description</b></td>
                                        <td width="87%" colspan="3">
                                            <gw:textbox id="txtDescription" styles="width:100%;" csstype="" />
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td width="13%" valign="middle">
                                            <b>&nbsp; &nbsp; Phone</b>
                                        </td>
                                        <td width="87%" colspan="3">
                                            <table width="100%" cellpadding="0" cellspacing="0" border="0" >
                                                <tr>
                                                    <td width="20%">
                                                        <gw:textbox id="txtPhone" styles="width:100%;" csstype="" />
                                                    </td>
                                                    <td width="5%" align="right">
                                                        <b>Fax &nbsp; </b>
                                                    </td>
                                                    <td width="20%">
                                                        <gw:textbox id="txtFax" styles="width:100%;" csstype="" />
                                                    </td>
                                                    <td width="7%" align="right">
                                                        <b>Email &nbsp;</b></td>
                                                    <td width="20%">
                                                        <gw:textbox id="txtEmail" styles="width:100%;" csstype="" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        <b>Web site &nbsp;</b></td>
                                                    <td width="18%">
                                                        <gw:textbox id="txtWebsie" styles="width:100%;" csstype="" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" height="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" height="1" bgcolor="#999999">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" width="100%">
                                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td>
                                                        <gw:tab id="idTab" style="width: 100%; height: 220; border1px">
							                            <!--onpageactivate="showActiveTab()"-->
							                            <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="General Info" id="TabGeneralInfo" align="top"
								                            style="overflow:scroll">
								                            <tr>
								                                <td width=100%>
								                                    <table width="100%" cellpadding="0" cellspacing="2" border=0 >
								                                        <tr>
					                                                        <td colspan="5" height="2" ></td>
				                                                        </tr>
				                                                        <tr>
					                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
				                                                        </tr>
				                                                        <tr>
				                                                            <td width=50% valign=top>
				                                                                <table width=100% cellpadding=0 cellspacing=0 border=0>
			                                                                       <tr height=24>
			                                                                            <td width=15%><b>&nbsp; &nbsp;Active</b></td>
											                                            <td width=20%><gw:checkbox id="chkActive" mode="01"	onchange="" /></td>
											                                            
										                                            </tr>
										                                             <tr height=24 >
											                                            <td width=15%><b>&nbsp; &nbsp;Tax office</b></td>
											                                            <td width=20%><gw:textbox id="txtTaxoffice"   styles="width:100%;" /></td>
            											                           
										                                             </tr>
										                                            <tr>
											                                            <td width=15% align="left" ><b>&nbsp; &nbsp;Number of employee</b></td>
											                                            <td width=20%><gw:textbox id="txtNum_employee" styles="width:100%;" /></td>
            											                               
										                                            </tr>
										                                             <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Capital</b></td>
											                                            <td width=20%><gw:textbox id="txtCapital" styles="width:100%;" /></td>
            											                               
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Company size</b></td>
											                                            <td width=20%><gw:list id="cboCompanysize" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Nation</b></td>
											                                            <td width=20%><gw:list id="cboNation" styles="width:100%;"></gw:list></td>
            											                               
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Currency</b></td>
											                                            <td width=20%><gw:list id="cboTranccy" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Industrial zone</b></td>
											                                            <td width=20%><gw:list id="cboIndustrial" styles="width:100%;"></gw:list></td>
            											                               
										                                            </tr>
										                                             <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Company product</b></td>
											                                            <td width=20%><gw:textbox id="txtCompanyproduct" styles="width:100%;" /></td>
            											                                
										                                            </tr>
            										                                 <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Bank account</b></td>
											                                            <td width=20%><gw:textbox id="txtbankacc" styles="width:100%;" /></td>
            											                                
										                                            </tr>
											                                    </table>
				                                                            </td>
                                                                            <td width=50% valign=top>
								                                                 <table width=100% cellpadding=0 cellspacing=0 border="0">
								                                                     <tr>
											                                            <td width=40% ><b>&nbsp; &nbsp; &nbsp; &nbsp;Anniversary &nbsp;</b></td>
											                                            <td width=10%><gw:datebox id="dtbAnniversary"  lang="<%=Application("Lang")%>" mode="01"	onchange="" /></td>
										                                             </tr>
								                                                     <tr>
								                                                        <td width=40% align=left><b>&nbsp; &nbsp; &nbsp; &nbsp;Valid from &nbsp;</b></td>
								                                                        <td width=20%><gw:datebox id="dtbFrom"  lang="<%=Application("Lang")%>" mode="01"	onchange="" /></td>
								                                                        <td width=10% valign="middle"><b>~</b></td>
								                                                        <td width=20%><gw:datebox id="dtbTo"  lang="<%=Application("Lang")%>" mode="01"	onchange="" /></td>
							                                                        </tr>
							                                                         <tr>
								                                                        <td width=40% align=left><b>&nbsp; &nbsp; &nbsp; &nbsp;Serial no &nbsp;</b></td>
								                                                        <td width=60% colspan=3><gw:textbox id="txtSerial" styles="width: 100%" /></td>
							                                                        </tr>
            							                                            
							                                                        <tr>
							                                                            <td width=40% align=left><b>&nbsp; &nbsp; &nbsp; &nbsp;Form no &nbsp;</b></td>
							                                                            <td width=60% colspan=3><gw:textbox id="txtFormNo" styles="width: 100%" /></td>
							                                                        </tr>
							                                                        <tr>
							                                                            <td width=40% align=left><b>&nbsp;</b></td>
							                                                            <td width=60% colspan=3><gw:image id="imgFile" view="../../system/binary/ViewFile.aspx" post="../../system/binary/PostFile.aspx" styles="width:100%;height:130" /></td>
							                                                        </tr>
								                                                 </table>
								                                            </td>
				                                                         </tr>
										                            </table>
								                                </td>
								                            </tr>
								                        </table>
							                            <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="Customer" id="tbCustomer" align="top"
								                            style="overflow:scroll">
								                            <tr>
								                                <td width=100%>
								                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
								                                        <tr>
					                                                        <td colspan="5" height="2" ></td>
				                                                        </tr>
				                                                        <tr>
					                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
				                                                        </tr>
				                                                        <tr>
				                                                            <td width=50%>
				                                                                <table width=100% cellpadding=0 cellspacing=1 border=0>
			                                                                       <tr>
										                                            <td width=15%><b>&nbsp; &nbsp;Customer</b></td>
													                                <td width=20%><gw:checkbox id="chkIsCust" mode="01"	onchange="" /></td>
                    												             
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Active</b></td>
											                                            <td width=10%><gw:checkbox id="chkActiveCust" mode="01"	onchange="" /></td>
            											                             
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Invoice terms</b></td>
											                                            <td width=20%><gw:list id="cboInvoiceterms" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Invoice schedule</b></td>
											                                            <td width=20%><gw:list id="cboInvoiceSchedule" styles="width:100%;"></gw:list></td>
            											                               
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Invoice grouping</b></td>
											                                            <td width=20%><gw:list id="cboInvoicegroup" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Delivery terms</b></td>
											                                            <td width=20%><gw:list id="cboDeliveryterms" styles="width:100%;"></gw:list></td>
            											                               
										                                            </tr>
										                                             <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;CustTradeType</b></td>
											                                            <td width=20%><gw:list id="cboCustTradeType" styles="width:100%;"></gw:list></td>
            											                                
										                                            </tr>
										                                             <tr>
											                                            <td width=15%><b>&nbsp; &nbsp;Cust payment terms</b></td>
											                                            <td width=20%><gw:list id="cboCustPaymentTerms" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
											                                    </table>
				                                                             </td>
				                                                              <td width=50% valign=top>
								                                                 <table width=100% cellpadding=0 cellspacing=0 border=0>
								                                                    <tr>
								                                                        <%--<td width=20%><b>&nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Payment form</b></td>
								                                                        <td width=20%><gw:list id="cboCustpaymentform" styles="width:100%;"></gw:list></td>
            								                                          
							                                                        </tr>
							                                                         <tr>
							                                                            <%--<td width=20%><b>&nbsp; &nbsp; &nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Sale Presentative</b></td>
								                                                        <td width=20%><gw:list id="cboSalePresentative" styles="width:100%;"></gw:list></td>
            								                                          
							                                                        </tr>
							                                                         <tr>
							                                                            <%--<td width=20%><b>&nbsp; &nbsp; &nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Sale default tax</b></td>
								                                                        <td width=20%><gw:list id="cboSaledefaulttax" styles="width:100%;"></gw:list></td>
            								                                          
								                                                     <tr>
								                                                        <%--<td width=20%><b>&nbsp; &nbsp; &nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Credit limit</b></td>
								                                                        <td width=20%><gw:textbox id="txtCreditLimit" styles="width:100%;" /></td>
            								                                          
							                                                        </tr>
							                                                        <tr>
							                                                            <%--<td width=20%><b>&nbsp; &nbsp; &nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Credit use</b></td>
								                                                        <td width=20%><gw:textbox id="txtCreditUse" styles="width:100%;" /></td>
            								                                          
							                                                        </tr>
							                                                         <tr>
							                                                            <%--<td width=20%><b>&nbsp; &nbsp; &nbsp; &nbsp;</b></td>--%>
								                                                        <td width=15%><b>&nbsp; &nbsp; &nbsp; &nbsp;Bank account</b></td>
								                                                        <td width=20%><gw:textbox id="txtCustbankacc" styles="width:100%;" /></td>
            								                                          
							                                                        </tr>
								                                                 </table>
								                                             </td>
				                                                         </tr>    
            											               
										                            </table>
								                                </td>
            								                   
								                            </tr>
								                        </table>
								                        <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="Vendor" id="Table1" align="top"
								                            style="overflow:scroll">
								                            <tr>
								                                <td width=100%>
								                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
								                                        <tr>
					                                                        <td colspan="5" height="2" ></td>
				                                                        </tr>
				                                                        <tr>
					                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
				                                                        </tr>
				                                                        <tr>
				                                                            <td width=50%>
				                                                                <table width=100% cellpadding=0 cellspacing=1 border=0>
			                                                                       <tr>
										                                            <td width=10%><b>&nbsp; &nbsp;Vendor</b></td>
													                                <td width=10%><gw:checkbox id="chkIsvendor" mode="01"	onchange="" /></td>
                    												             
										                                            </tr>
										                                            <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Active</b></td>
											                                            <td width=10%><gw:checkbox id="chkActiveVendor" mode="01"	onchange="" /></td>
            											                             
										                                            </tr>
										                                            <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Payment form</b></td>
											                                            <td width=20%><gw:list id="cboVenPaymentform" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Payment terms</b></td>
											                                            <td width=20%><gw:list id="cboVendorpayterm" styles="width:100%;"></gw:list></td>
            											                               
										                                            </tr>
										                                            <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Trade type</b></td>
											                                            <td width=20%><gw:list id="cboVendortradetype" styles="width:100%;"></gw:list></td>
            											                              
										                                            </tr>
										                                            <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Bank account</b></td>
											                                            <td width=20%><gw:textbox id="txtVendorbankacc" styles="width:100%;" /></td>
            											                               
										                                            </tr>
										                                             <tr>
											                                            <td width=10%><b>&nbsp; &nbsp;Default tax</b></td>
											                                            <td width=20%><gw:list id="cboVendorDtax" styles="width:100%;"></gw:list></td>
            											                                
										                                            </tr>
            										                               
											                                    </table>
				                                                             </td>
				                                                              <td width=50% valign=top>
								                                                 <table width=100% cellpadding=0 cellspacing=0>
								                                                     <tr>
								                                                        <td width=10%><b>&nbsp; &nbsp;</b></td>
								                                                        <td width=20%><gw:image id="imgFile_1" table_name="TCO_BPPHOTO" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:100%;height:130" /></td>
            								                                          
							                                                        </tr>
            							                                          
								                                                 </table>
								                                             </td>
				                                                         </tr>    
            											               
										                            </table>
								                                </td>
            								                   
								                            </tr>
								                        </table>
								                        <table width="100%" border="0" cellpadding="1" cellspacing="0"
								                            name="Charger" id="Table3" align="top"
								                            style="overflow:scroll">
								                            <tr>
		                                                        <td colspan="5" height="2" ></td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                        </tr>
								                            <tr>
												            <td width="90%" align="right">
            												
												            </td>
            												
												            <td width="4%" align="right"><gw:imgBtn id="btnNewCharger" img="new" alt="New" text="New"
														            onclick="onNew(1)" />
												            </td>
												            <td width="3%">
													            <gw:imgBtn id="btnDeleteCharger" img="delete" alt="Delete"
														            text="Delete" onclick="onDelete(1)" />
												            </td>												
												            <td width="4%">
													            <gw:imgBtn id="btnSaveCharger" img="save" alt="Save" text="Save" onclick="onSave(1)" />
												            </td>
											            </tr>
								                            <tr>
								                                <td colspan =6>
								                                    <script>
										                                document.writeln('<gw:grid ');
										                                document.writeln('id="grdCharger"');
										                                document.writeln('header="_PK|_partner_pk|_EmpPK|EmployeeID|Emp Name|Department|Remark|Active|StartDate|EndDate|Table"');
										                                document.writeln('format="0|0|0|0|0|0|0|3|4|4|0"');
										                                document.writeln('aligns="0|0|0|0|0|0|0|0|0|0|0"');
										                                document.writeln('defaults="||||||||||tco_company"');
										                                document.writeln('editcol="1|1|1|0|0|0|1|1|1|1|0"');
										                                document.writeln('widths="0|0|0|1500|4000|3000|3000|800|1200|1200|0"');
										                                document.writeln('styles="width:100%; height:200"');
										                                document.writeln('sorting="T" ');
										                                document.writeln('param="0,1,2,3,4,5,6,7,8,9,10" oncelldblclick="openEmpLookup(0)" />');
									                                </script>
								                                </td>
								                            </tr>
								                        </table>
								                        <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="Contact" id="Table4" align="top"
								                            style="overflow:scroll">
								                             <tr>
		                                                        <td colspan="5" height="2" ></td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                        </tr>
								                            <tr>
												            <td width="90%" align="right">
            												
												            </td>
            												
												            <td width="4%" align="right"><gw:button id="btnNewContact" img="new" alt="New" text="New"
														            onclick="onNew(2)" />
												            </td>
												            <td width="3%">
													            <gw:button id="btnDeleteContact" img="delete" alt="Delete"
														            text="Delete" onclick="onDelete(2)" />
												            </td>
												            <td width="4%">
													            <gw:button id="btnSaveContact" img="save" alt="Save"
														            text="Save" onclick="onSave(2)" />
												            </td>
											            </tr>
								                            <tr>
								                                <td colspan =6>
								                                    <script>
										                                document.writeln('<gw:grid ');
										                                document.writeln('id="grdContact"');
										                                document.writeln('header="_pk|_tco_buspartner_pk|Name|Position|Phone|Mobile|Fax|Email|Urgent contact|_addr|Active| Valid from| Valid to| Description|_Table"   ');
										                                document.writeln('format="0|0|0|0|0|0|0|0|0|0|3|4|4|0|0"  ');
										                                document.writeln('aligns="0|0|0|0|0|0|0|0|0|0|0|4|4|0|0"  ');
										                                document.writeln('defaults="||||||||||||||tco_company" ');
										                                document.writeln('editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"');
										                                document.writeln('widths="||2000|1500|1500|1500|1500|2000|2000| 2000|800|1200|1200|2000|0"');
										                                document.writeln('styles="width:100%; height:200" ');
										                                document.writeln('sorting="T" ');
										                                document.writeln('param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" sendoldvalue="T"  /> ');
									                                </script>
								                                </td>
								                            </tr>
								                        </table>
								                        <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="Biz place" id="Table5" align="top"
								                            style="overflow:scroll">
								                             <tr>
		                                                        <td colspan="5" height="2" ></td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                        </tr>
								                            <tr>
												            <td width="90%" align="right">
            												
												            </td>
            												
												            <td width="4%" align="right"><gw:button id="btnNewBizplace" img="new" alt="New" text="New"
														            onclick="onNew(3)" />
												            </td>
												            <td width="3%">
													            <gw:button id="btnDeleteBizplace" img="delete" alt="Delete"
														            text="Delete" onclick="onDelete(3)" />
												            </td>
												            <td width="4%">
													            <gw:button id="btnSaveBizplace" img="save" alt="Save"
														            text="Save" onclick="onSave(3)" />
												            </td>
											            </tr>
								                            <tr>
								                                <td colspan =6>
								                                    <script>
										                                document.writeln('<gw:grid ');
										                                document.writeln('id="grdBizplace"');
										                                document.writeln('header="_pk|_tco_buspartner_pk|ID|Name|Local name|Foreign name|Nation|Reg no.|Tax|Tax office|Representative|Zipcode|Address 1|Address 2|Address 3 |Address 4|Address 5|Address 6|Phone|Fax|biz_type|biz_item|biz_grp|Description|Active|Start date|End date|_Table|_tax_office_pk"   ');
										                                document.writeln('format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|4|4|0|0"  ');
										                                document.writeln('aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  ');
										                                document.writeln('defaults="|||||||||||||||||||||||||||tco_company|0" ');
										                                document.writeln('editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0"');
										                                document.writeln('widths="0|0|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|800|1200|1200|0|0"');
										                                document.writeln('styles="width:100%; height:200" ');
										                                document.writeln('sorting="T" ');
										                                document.writeln('param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" sendoldvalue="T"  /> ');
									                                </script>
								                                </td>
								                            </tr>
								                        </table>
								                        <table width="100%" border="0" cellpadding="0" cellspacing="0"
								                            name="Location" id="Table6" align="top"
								                            style="overflow:scroll">
								                             <tr>
		                                                        <td colspan="5" height="2" ></td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                        </tr>
								                            <tr>
												            <td width="90%" align="right">
            												
												            </td>
            												
												            <td width="4%" align="right"><gw:button id="btnNewLoc" img="new" alt="New" text="New"
														            onclick="onNew(4)" />
												            </td>
												            <td width="3%">
													            <gw:button id="btnDelLoc" img="delete" alt="Delete"
														            text="Delete" onclick="onDelete(4)" />
												            </td>
												            <td width="4%">
													            <gw:button id="btnSaveLoc" img="save" alt="Save"
														            text="Save" onclick="onSave(4)" />
												            </td>
											            </tr>
								                            <tr>
								                                <td colspan =6>
								                                    <script>
										                                document.writeln('<gw:grid ');
										                                document.writeln('id="grdLocation"');
										                                document.writeln('header="_pk|_tco_buspartner_pk|Name|Local name|Foreign name|Charger|Sale order|Delivery|Collection|Zip code|Address 1|Address 2|Address 3|Phone|Fax|Email|Active|Start date|To date|Description|_Table"   ');
										                                document.writeln('format="0|0|0|0|0|0|3|3|3|0|0|0|0|0|0|0|3|4|4|0|0"  ');
										                                document.writeln('aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  ');
										                                document.writeln('defaults="||||||||||||||||||||tco_company" ');
										                                document.writeln('editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"');
										                                document.writeln('widths="0|0|1500|1500|1500|1500|1000|1000|1000|1500|1500|1500|1500|1500|1500|1500|800|1200|1200|2000|0"');
										                                document.writeln('styles="width:100%; height:200" ');
										                                document.writeln('sorting="T" ');
										                                document.writeln('param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" sendoldvalue="T"  /> ');
									                                </script>
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
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>            
            
        </table>
   
    <gw:textbox id="txtPartnerPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtParentPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="imagePK" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="imagePK_1" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtPartID" styles='display:none' />
    <gw:textbox id="txtTable" text="tco_company" styles='display:none' />
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor:hand;position:absolute;left:1;top:0;" onclick="OnToggle()"  /> 
</body>
</html>