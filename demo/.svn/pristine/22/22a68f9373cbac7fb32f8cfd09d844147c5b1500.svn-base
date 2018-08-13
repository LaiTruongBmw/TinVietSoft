<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Bussiness Partner Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 
 var G1_MASTER_PK		= 0,
 	 G1_PARTNER_ID		= 1,
	 G1_PARTNER_NAME	= 2,
	 G1_TAX_CODE		= 3;
	 
 var G2_LOC_PK			= 0,
 	 G2_BUSPARTNER_PK	= 1,
	 G2_LOC_NAME		= 2,
	 G2_LOCAL_NAME		= 3,
	 G2_FOREIGN_NM		= 4,
	 G2_CHARGER			= 5,
	 G2_REMRAK			= 6;
 
 //---------------------------------------------------------
 function BodyInit()
 { 
 	 System.Translate(document);
	 
     txtBillToCode.SetEnable(false);
     txtBillToName.SetEnable(false);
     txtDeliToCode.SetEnable(false);
     txtDeliToName.SetEnable(false);
         
     BindingDataList();
	 
     OnAddNew('MASTER');      
 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {        
        var data = "";
		
        data = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM  tco_company where del_if=0")%>"; 
        lstCompany.SetDataText(data);            

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
        lstTrCCY.SetDataText(data);        

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL" )%>||";
        lstLGOrderType.SetDataText(data);
        lstLGOrderType.value="";
   
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGGS0106') FROM DUAL" )%>||";
        lstLGPartnerType.SetDataText(data);
        lstLGPartnerType.value="";

 }
 //---------------------------------------------------------
 
 function OnSearch(index)
 {
    switch(index)
    {
        case 'SEARCH' :
            data_agic00030_1.StatusSelect();
            data_agic00030_1.Call("SELECT");
        break;
		
		case 'MASTER' :
			var row = grdPartner.row;	
    		txtPartnerPK.SetDataText(grdPartner.GetGridData(row,G1_MASTER_PK));
    
			data_agic00030.Call("SELECT");	
		break;
    }
 }
 //---------------------------------------------------------
 function onSave(index)
 {   
    switch(index)
    {
        case 0: // save master:
          
            if ( txtPartnerID.text == '' )
            {
                alert('Please, input Partner ID !!!');
                txtPartnerID.GetControl().focus();
                return;
            }
            
            if ( txtPartnerName.text == '' )
            {
                alert('Please, input Partner Name !!!');
                txtPartnerName.GetControl().focus();
                return;
            }

            
            data_agic00030.Call();
        break;        
        
        case 4:// save location
            data_agic00030_5.Call();
        break;
      
     }
 }
 //---------------------------------------------------------
function OnAddNew(index)
{
    switch(index)
    {
        case 'MASTER': // add new master           
            data_agic00030.StatusInsert();
            
			txtPartnerName.text = "<< NEW PARTNER >>"; 
            chkActive.value='-1';                                 
        break;        
		
        case 'LOCATION': // add new location
		
            if(txtPartnerPK.text !="")
            {
                 grdLocation.AddRow();
                 grdLocation.SetGridText(grdLocation.rows - 1,G2_BUSPARTNER_PK,txtPartnerPK.GetData());
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
                data_agic00030.StatusDelete();
                data_agic00030.Call();
            }   
        break;       
        
        case 4: // delete location
            if(confirm('Do you want to delete selected location ?'))
            {
                 grdLocation.DeleteRow();
                 data_agic00030_5.Call();
            }
        break;        
      }          
 }
 
 //---------------------------------------------------------
 function OnDataReceive(oId)
 {
    switch(oId.id)
    {
        case "data_agic00030":            
                                                  
            data_agic00030_5.Call("SELECT");
        break;           
    }
 }
 //---------------------------------------------------------
 function OnGetParent()
 {
    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx";
    oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');
               
    if ( oValue != null)
    {
        txtParentPK.SetDataText(oValue[0]);
        txtParentName.SetDataText(oValue[2]);
    }
 }
  //---------------------------------------------------------
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
	         }
	    break; 	
	    
	    case 'LGCM0110' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
//	         if ( object != null )
//	         {
//	            txtDeliToPK.text   = object[0];
//                txtDeliToCode.text = object[1];
//                txtDeliToName.text = object[2];
//	         }
	    break; 	
	    
	    case 'LGGS0106' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGGS0106";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
//	         if ( object != null )
//	         {
//	            txtDeliToPK.text   = object[0];
//                txtDeliToCode.text = object[1];
//                txtDeliToName.text = object[2];
//	         }
	    break; 	
	    
                                                       		        
	 } 
}
  
//--------------------------------------------------------------------
  function onPrint()
    {
        var  url= System.RootURL + "/standard/reports/ag/ic/rptagic00030.aspx";
	    System.OpenTargetPage( url, "_blank" );        
    }
 //---------------------------------------------------------

</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00030" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37" function="<%=l_user%>lg_sel_agic00030"  procedure="<%=l_user%>lg_upd_agic00030"> 
            <inout> 
                <inout  bind="txtPartnerPK" />
				<inout  bind="lstCompany" />
				<inout  bind="lblInfo" />  
                <inout  bind="txtParentPK" />
                <inout  bind="txtParentName" /> 
				
				<inout  bind="txtTaxcode" />				 				           
                <inout  bind="txtPartnerID" />								
                <inout  bind="txtPartnerName" />		
				<inout  bind="txtShortName" />						
                <inout  bind="txtLname" />
                <inout  bind="txtFname" />                
                               
                <inout  bind="txtAddress1" />				
                <inout  bind="txtAddress2" />
                <inout  bind="txtAddress3" />
				<inout  bind="txtDescription" />
                <inout  bind="txtPhone" />
				
                <inout  bind="txtEmail" />				
                <inout  bind="txtFax" />
                <inout  bind="txtWebsie" />
				<inout  bind="chkActive" />				 
				<inout  bind="dtbFrom" />
				
                <inout  bind="dtbTo" />								 
				<inout  bind="lstLGOrderType" />
				<inout  bind="lstTrCCY" />						
				<inout  bind="txtBillToPK" />                
                <inout  bind="txtBillToCode" />
				
                <inout  bind="txtBillToName" />    				                            
                <inout  bind="txtDeliToPK" />				
                <inout  bind="txtDeliToCode" />
                <inout  bind="txtDeliToName" /> 						
                <inout  bind="chkIsCust" />
				
                <inout  bind="chkActiveCust" />                                                               
                <inout  bind="chkIsvendor" />  				
                <inout  bind="chkActiveVendor" />                                                                                                                                                                                                  	
				<inout  bind="txtLGTaxRate" /> 				
				<inout  bind="txtMemo" />                                                                 
				
				<inout  bind="chkLG" />   
				<inout  bind="lstLGPartnerType" />       
            </inout>
        </dso> 
    </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_agic00030_1"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_agic00030_1" > 
                <input> 
                    <input bind="txtPartnerQuery" /> 
                    <input bind="txtTaxCodeQuery" /> 
                    <input bind="chkUse_YN" /> 
					<input bind="chkLogistic_YN" />
                </input> 
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdLocation ---------------------------------------->
    <gw:data id="data_agic00030_5" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_agic00030_5"  procedure="<%=l_user%>lg_upd_agic00030_5"> 
                <input bind="grdLocation" > 
                    <input bind="txtPartnerPK" />
                </input>
                <output bind="grdLocation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1" id="tableID1">
        <tr>
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Customer
                        </td>
                        <td style="width: 90%" colspan="4">
                            <gw:textbox id="txtPartnerQuery"   onenterkey="OnSearch('SEARCH')" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">
                            Tax code
                        </td>
                        <td style="width: 90%" colspan="4">
                            <gw:textbox id="txtTaxCodeQuery"   onenterkey="OnSearch('SEARCH')" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">
                            Use Y/N
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkUse_YN" defaultvalue="Y|N" value="Y" onchange="OnSearch('SEARCH')" />
                        </td>
						<td style="width: 10%" align="left" style="white-space:nowrap">
                            Logistic Y/N
                        </td>
                        <td style="width: 60%" align="left">
                            <gw:checkbox id="chkLogistic_YN" defaultvalue="Y|N" value="Y" onchange="OnSearch('SEARCH')" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('SEARCH')" />
                        </td>
                    </tr>
                    <tr style="height: 100%">
                        <td colspan="5">
                            <gw:grid id="grdPartner" header="_PK|ID|Name|Tax Code" format="0|0|0|0" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|0|2000|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('MASTER')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
						<td style="width: 5%" align="right">
                            Company
                        </td>
                        <td style="width: 20%" colspan="3">
                            <gw:list id="lstCompany" styles="width:100%;" />
                        </td>   						 
                        <td style="width: 10%">                             
                        </td>
                        <td style="width: 30%">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 96%; white-space: nowrap">
                                        <gw:label id="lblInfo" styles='width:100%;color:cc0000;font:9pt' text='' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('MASTER')" />
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
                    <tr style="height: 1%">
                       <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnGetParent()">Parent Bus</b>
                        </td>
                        <td colspan=3>
							<gw:textbox id="txtParentPK" maxlen="100" styles='width:100%;display:none' csstype="" />
                            <gw:textbox id="txtParentName" styles="width:100%" />
                        </td>                       
                        <td style="width: 10%" align="right">
                            Tax code
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTaxcode" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Partner ID
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPartnerID" styles="width:100%;" csstype="mandatory"  />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Name
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtPartnerName" csstype="mandatory" styles="width:100%;" />
                        </td>
                    </tr>  
					<tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Short Name
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtShortName" styles="width:100%;" csstype="" />
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Local Name
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtLname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Foreign Name
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtFname" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Address 1
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress1" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Address 2
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress2" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Address 3
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtAddress3" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Description
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtDescription" styles="width:100%;" csstype="" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Phone
                        </td>
                        <td colspan="5">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="20%">
                                        <gw:textbox id="txtPhone" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="5%" align="right">
                                        Fax
                                    </td>
                                    <td width="20%">
                                        <gw:textbox id="txtFax" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="7%" align="right">
                                        Email
                                    </td>
                                    <td width="20%">
                                        <gw:textbox id="txtEmail" styles="width:100%;" csstype="" />
                                    </td>
                                    <td width="10%" align="right">
                                        Web site
                                    </td>
                                    <td width="18%">
                                        <gw:textbox id="txtWebsie" styles="width:100%;" csstype="" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                    
                    <tr style="height: 89%">
                        <td colspan="6">                             
                            <gw:tab id="idTab">
                            <table style="width: 100%; height: 100%" name="General Info" id="TabGeneralInfo"
                                align="top" style="overflow: scroll">
                                <tr>
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%"><gw:checkbox id="chkActive" defaultvalue="-1|0" value="-1" onchange="" /></td>
                                    <td style="width: 15%" align="right">Valid from</td>
                                    <td style="width: 35%; white-space:nowrap" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                                        ~
                                        <gw:datebox id="dtbTo" nullaccept lang="<%=Application("Lang")%>" mode="01" onchange="" />
									</td>
                                </tr> 
                                <tr>
                                    <td style="width: 15%" align="right">Logistic YN</td>
                                    <td style="width: 35%"><gw:checkbox id="chkLG" defaultvalue="Y|N" value="Y" onchange="" /></td>
                                    <td style="width: 15%" align="right"></td>
                                    <td style="width: 35%; white-space:nowrap" align="left">
									</td>
                                </tr>                                                                                               
                                <tr>                                                                       
									<td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGCM0110')">Order Type</b></td>
                                    <td style="width: 35%"><gw:list id="lstLGOrderType" styles="width:100%;" /></td>
									<td style="width: 15%" align="right"><b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('LGGS0106')">LG Partner Type</b></td>
                                    <td style="width: 35%"><gw:list id="lstLGPartnerType" styles="width:100%;" /></td> 
                                </tr> 
                                <tr>                                                                       
									<td style="width: 15%" align="right">LG Tax Rate</td>
                                    <td style="width: 35%"><gw:textbox id="txtLGTaxRate" csstype="mandatory" styles='width:100%' /></td>
									<td style="width: 15%" align="right">Tr CCY</td>
                                    <td style="width: 35%"><gw:list id="lstTrCCY" styles="width:100%;" /></td> 
                                </tr> 
                                <tr>                                    
                                    <td style="width: 15%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('BillTo')">Bill To </b>
                                    </td>
                                    <td style="width: 35%; white-space: nowrap">
										<gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                    </td>
									<td style="width: 15%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onClick="OnPopUp('DeliTo')">Deli To </b>
                                    </td>
                                    <td style="width: 35%; white-space: nowrap">
										<gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                </tr> 
								
                                <tr style=" height:40%">                                                                       
									<td style="width: 15%" align="right"></td>
                                    <td style="width: 35%"></td>
									<td style="width: 15%" align="right"></td>
                                    <td style="width: 35%"></td> 
                                </tr> 
								                                                                 
                            </table>
                            <table style="width: 100%; height: 100%" name="Customer" style="overflow: scroll">
                                <tr>
                                    <td style="width: 15%" align="right">Customer</td>
                                    <td style="width: 35%"><gw:checkbox id="chkIsCust" mode="01" onchange="" /></td>
                                    
                                </tr>
                                <tr>
                                    <td style="width: 15%" align="right">Active</td>
                                    <td style="width: 35%"><gw:checkbox id="chkActiveCust" mode="01" onchange="" /></td>
                                    <td style="width: 15%" align="right"> </td>
                                    <td style="width: 35%"> </td>
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
                            </table>                                                                          
                            <table style="width: 100%; height: 100%" name="Location" id="Table6" align="top"
                                style="overflow: scroll">
                                <tr style="height: 1%">
                                    <td style="width: 97%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNewLoc" img="new" alt="New" text="New" onclick="OnAddNew('LOCATION')" />
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
                                        <gw:grid id="grdLocation" 
											header="_pk|_tco_buspartner_pk|Name|Local name|Foreign name|Charger|Address|Remark"
                                            format="0|0|0|0|0|0|0|0" 
											aligns="0|0|0|0|0|0|0|0"
                                            defaults="|||||||" 
											editcol="0|0|1|1|1|1|1|1"
                                            widths="0|0|1500|1500|1500|1500|1000|1000"
                                            styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7"
                                            sendoldvalue="T" />
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
                         </gw:tab>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" maxlen="100" styles='width:100%;display:none' csstype="" />
    <!----------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!----------------------------------------------------------------------------------------->
</body>
</html>
