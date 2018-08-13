<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PROJECT ENTRY</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>


var rtnLGCode = '';

var arr_FormatNumber = new Array();
//======================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    	imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //---------------------------------- 
    grdCust.GetGridControl().WordWrap = true;
	grdCust.GetGridControl().RowHeight(0) = 450 ;
	//------------------------------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;      
    //----------------------------------            
  
    //---------------------------------- 
               
    FormFormat();
   // onNew(0);
    OnChangeTab(0);
     //OnToggleGrid();
	// dbCrtdt_6.Enanble(false);
	 dbCrtdt_6.SetEnable(false);
    //------------------------- 
   // OnAddNew('Master');  
}
//======================================================================

 function FormFormat()
 {      
     var data ;
      var arr;
	 data = "<%=ESysLib.SetListDataFUNC("SELECT sf_a_get_company('') FROM DUAL")%>";   
     cboCompany_1.SetDataText(data);
     cboCompany_1.value = "<%=Session("COMPANY_PK") %>";
     //-----------------------
	  data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
     cboStatus_2.SetDataText(data);
	  data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0010') FROM DUAL")%>";
     arr  = data.split("|");
	 cboStatus_2.SetDataText(arr[1]);
   
     //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0001') FROM DUAL")%>";
	 lstPrjtype_10.SetDataText(data);
	  //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0002') FROM DUAL")%>";
	 lstPrjcategory_9.SetDataText(data);
	  //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0003') FROM DUAL")%>";
	 lstJointExe_8.SetDataText(data);
	 //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0004') FROM DUAL")%>";
	 cboContractYN_28.SetDataText(data);
	  //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0005') FROM DUAL")%>";
	 cboContracttype_30.SetDataText(data);
     
	 //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0020') FROM DUAL")%>";
	 txtInsured_37.SetDataText(data);

     //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0021') FROM DUAL")%>";
	 lstProvision_53.SetDataText(data);
	 
	  //-----------------------
	 data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0012') FROM DUAL")%>";
	 txtExecutiongroup_cd_49.SetDataText(data);

     //-----------------------
	 <%=ESysLib.SetGridColumnComboFormat("grdCust",5,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;
     <%=ESysLib.SetGridColumnComboFormat("grdCust",8,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0029' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	 //------Vat rate-------------------
	  <%=ESysLib.SetGridColumnComboFormat("grdCust",9,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
     //-----------Currency
	  <%=ESysLib.SetGridColumnComboFormat("grdCollect",3,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;
	  //Progress Stage
	  <%=ESysLib.SetGridColumnComboFormat("grdCollect",2,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0007' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
     //-----------Currency
	  <%=ESysLib.SetGridColumnComboFormat("grdJoin_ctr",5,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;
	   //-----------Currency
	  <%=ESysLib.SetGridColumnComboFormat("grdInsurrance",3,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;
	 //-----------Insurance type
	  <%=ESysLib.SetGridColumnComboFormat("grdInsurrance",2,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0015' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	 //-----------grdGuarantee ccy
	  <%=ESysLib.SetGridColumnComboFormat("grdGuarantee",3,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;
	  //-----------grdGuarantee type
	  <%=ESysLib.SetGridColumnComboFormat("grdGuarantee",2,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0016' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	 //-----------grdGuarantee type
	  <%=ESysLib.SetGridColumnComboFormat("grdGuarantee",5,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
 }
//======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'PM':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtPM_nm_17.text = obj[2];
                txtPM_pk_16.text   = obj[0];
				txtPM_cd_15.text   = obj[1];
            }
        break;         
        case 'PC':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtPC_nm_20.text = obj[2];
                txtPC_pk_19.text   = obj[0];
				txtPC_cd_18.text   = obj[1];
            }
        break; 
		case 'CUS':
		    
        	if (event.col == 3){
				var path = System.RootURL + '/form/61/01/61010050_popup_cust.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

				if ( obj != null )
				{
				   grdCust.SetGridText(grdCust.row,11,obj[0]);
				   grdCust.SetGridText(grdCust.row,3,obj[2]);
				   grdCust.SetGridText(grdCust.row,2,obj[27]);
				}
			}
        break; 
		case 'CUS1':
		    
        	if (event.col == 2){
				var path = System.RootURL + '/form/61/01/61010050_popup_cust.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

				if ( obj != null )
				{
				   grdJoin_ctr.SetGridText(grdJoin_ctr.row,10,obj[0]); // pk 
				   grdJoin_ctr.SetGridText(grdJoin_ctr.row,2,obj[2]); // name
				}
			}
        break; 
		case 'CUS2':
		    
        	if (event.col == 2){
				var path = System.RootURL + '/form/61/01/61010050_popup_cust.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

				if ( obj != null )
				{
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,8,obj[0]); // pk 
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,2,obj[2]); // name
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,3,obj[26]); // representative
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,4,obj[27]); // license_no
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,5,obj[12]); // phone
				   grdJoint_Liabity.SetGridText(grdJoint_Liabity.row,6,obj[9]); // Address
				}

			}
        break;
		case 'CUS3':
		    
        	if (event.col == 7){
				var path = System.RootURL + '/form/61/01/61010050_popup_cust.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

				if ( obj != null )
				{
				   grdInsurrance.SetGridText(grdInsurrance.row,10,obj[0]); // pk 
				   grdInsurrance.SetGridText(grdInsurrance.row,7,obj[2]); // name
				   
				}

			}
        break;
		case 'CUS4':
		    
        	if (event.col == 8){
				var path = System.RootURL + '/form/61/01/61010050_popup_cust.aspx';
				var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

				if ( obj != null )
				{
				   grdGuarantee.SetGridText(grdGuarantee.row,11,obj[0]); // pk 
				   grdGuarantee.SetGridText(grdGuarantee.row,8,obj[2]); // name
				   
				}

			}
        break;
		case 'Exegroup':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0012';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

			if ( obj != null )
			{
			   txtExecutiongroup_cd_49.text =obj[1];
			   txtExecutiongroup_nm_51.text =obj[2];
			}
		break;
		case 'Prjcategory':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0002';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

			//if ( obj != null )
			//{
			//   txtExecutiongroup_cd_49.text =obj[1];
			//   txtExecutiongroup_nm_51.text =obj[2];
			//}
		break;
		case 'JointExecution':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0003';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

			//if ( obj != null )
			//{
			//   txtExecutiongroup_cd_49.text =obj[1];
			//   txtExecutiongroup_nm_51.text =obj[2];
			//}
		break;
        case 'Projecttype':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0001';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

			//if ( obj != null )
			//{
			//   txtExecutiongroup_cd_49.text =obj[1];
			//   txtExecutiongroup_nm_51.text =obj[2];
			//}
		break;
		case 'Contracttype':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0005';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

			//if ( obj != null )
			//{
			//   txtExecutiongroup_cd_49.text =obj[1];
			//   txtExecutiongroup_nm_51.text =obj[2];
			//}
		break;   
		case 'Insurance':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0020';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

		break;   
		case 'Provision':
			var path = System.RootURL + '/form/61/01/61010050_popup_type.aspx?code=TPS0021';
			
			var obj = System.OpenModal( path ,850 , 600 ,  'resizable:yes;status:yes');

		break;   
		case 'newprj':
			 onNew(0);
			var path = System.RootURL + '/form/kp/bp/kpbp00010_1.aspx';
			var obj = System.OpenModal( path ,600 , 200 ,  'resizable:yes;status:yes');
           if ( obj != null )
			{
			   txtprojectPK_0.text =obj[0];
			   txtProject_cd_3.text =obj[1];
			   txtProject_nm_4.text =obj[2];
			   txtsiteAdress_11.text =obj[3];
			   dat_kpbp00010_1.StatusUpdate();
			}
		break;   
																			   
    }	       
}
 


//======================================================================
function OnSearch(pos)
{  
    switch (pos)
    {
        case 'grdSearch':
            dat_kpbp00010_2.Call("SELECT");
        break;
		case 'grdMaster':
			txtprojectPK_0.text = grdSearch.GetGridData(grdSearch.row,0);
			dat_kpbp00010_1.Call("SELECT");
		break;
		case 'grdJoin_ctr':
			dat_kpbp00010_9.Call("SELECT");
		break;
		case 'grdJoint_Liabity':
			dat_kpbp00010_10.Call("SELECT");
		break;
		case 'grdInsurrance':
			dat_kpbp00010_7.Call("SELECT");
		break;
		case 'grdGuarantee':
			dat_kpbp00010_8.Call("SELECT");
		break;
    }
}



//======================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            flag = 'save';
            dat_kpbp00010_1.Call();
        break;
        case 'cust':    
		  
		    for(var i=1; i<grdCust.rows ; i++ )
		    {
				grdCust.SetGridText(i,13,dbCrtdt_6.GetData());
		    }
            dat_kpbp00010_4.Call();
        break;
		case 'progress':
			switch(radgrid.GetData())
			{
			  case "1" :
				 dat_kpbp00010_6.Call();
              break;
			  case "2" :
				 dat_kpbp00010_7.Call();
              break;
			  case "3" :
				dat_kpbp00010_8.Call();
              break;
            }
		break;
		case 'grdJoin_ctr':
			switch(radjointgrid.GetData())
			{
			  case "1" :
				dat_kpbp00010_9.Call();
              break;
			  case "2" :
				 dat_kpbp00010_10.Call();
              break;
		    }
			
		break;

    }
}
//======================================================================
function onNew(idx)
{
	switch(idx)
	{
		case 0:
			  dat_kpbp00010_1.StatusInsert();
			  chkActive_YN_5.SetDataText("Y");
		break;
		case 1:
			  grdCust.AddRow();
              grdCust.SetGridText(grdCust.rows - 1,12,txtprojectPK_0.GetData());
			  grdCust.SetGridText(grdCust.rows - 1,9,"10");
		break;
		case 2:
			switch(radgrid.GetData())
			{
			  case "1" :
				  grdCollect.AddRow();
				  grdCollect.SetGridText(grdCollect.rows - 1,8,txtprojectPK_0.GetData());
              break;
			  case "2" :
				  grdInsurrance.AddRow();
				  grdInsurrance.SetGridText(grdInsurrance.rows - 1,9,txtprojectPK_0.GetData());
              break;
			  case "3" :
				  grdGuarantee.AddRow();
				  grdGuarantee.SetGridText(grdGuarantee.rows - 1,10,txtprojectPK_0.GetData());
              break;
            }
			 
		break;
		case 3:
			switch(radjointgrid.GetData())
			{
			  case "1" :
				  grdJoin_ctr.AddRow();
				  grdJoin_ctr.SetGridText(grdJoin_ctr.rows - 1,11,txtprojectPK_0.GetData());
              break;
			  case "2" :
				  grdJoint_Liabity.AddRow();
				  grdJoint_Liabity.SetGridText(grdJoint_Liabity.rows - 1,7,txtprojectPK_0.GetData());
              break;
			
            }
		break;
	}
}
//======================================================================
function OnEditDetail()
{
	var vat_amt=0;
	var vat_rate="";
    var ctr_amt =0;
    if (event.col == 8)
    {
		if(grdCust.GetGridData(grdCust.row,8)== "Y")
		{
			grdCust.SetGridText(grdCust.row,9,"10");
			vat_rate = grdCust.GetGridData(grdCust.row,9);
			ctr_amt  = grdCust.GetGridData(grdCust.row,7)
			vat_amt = Number(ctr_amt) * (Number(vat_rate)/100);
			grdCust.SetGridText(grdCust.row,10,vat_amt);
		}else{
			grdCust.SetGridText(grdCust.row,9,"0");
			vat_amt = 0; 
			grdCust.SetGridText(grdCust.row,10,vat_amt);
		}
    }
	if (event.col == 9)
    {
		if(grdCust.GetGridData(grdCust.row,8)== "Y")
		{
			vat_rate = grdCust.GetGridData(grdCust.row,9);
			ctr_amt  = grdCust.GetGridData(grdCust.row,7)
			vat_amt = Number(ctr_amt) * (Number(vat_rate)/100);
			grdCust.SetGridText(grdCust.row,10,vat_amt);
		}else{
			vat_amt = 0; 
			grdCust.SetGridText(grdCust.row,10,vat_amt);
		}
     }

}
//======================================================================
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case "dat_kpbp00010_1":
		  dat_kpbp00010_4.Call('SELECT');
		break;
		case "dat_kpbp00010_4":
		  dat_kpbp00010_5.Call('SELECT');
		break;
		case "dat_kpbp00010_5":
		  OnChangeTab(0);
		break;
		case "dat_kpbp00010_6":
		  OnSearch('grdInsurrance');
		break;
		case "dat_kpbp00010_7":
		  OnSearch('grdGuarantee');
		break;
		case 'dat_kpbp00010_9':
		  OnSearch('grdJoint_Liabity');
		break;
	}
}
//====================================================================
function OnChangeTab(idx)
{ 
	switch(idx)
	{
		case 0:

			var info     = document.all("info"); 
			var shipment = document.all("shipment"); 
			var payment  = document.all("payment");
			
			switch (radTab.value)
			{
				case '1':
					info.style.display     = "";
					shipment.style.display = "none"; 
					payment.style.display  = "none";   
					ibtnNewgrdCust.style.display     = "";
					ibtnsavegrdCust.style.display     = "";
					ibtnDeletegrdCust.style.display     = "";
					ibtUnDeletegrdCust.style.display     = "";
					document.all("Progress").style.color     = ""; 
					document.all("JointContract").style.color     = ""; 
					document.all("Contract").style.color      = "red";    

					
				break;
				
				case '2' :
					info.style.display     = "none";
					shipment.style.display = "";
					payment.style.display  = "none"; 
					ibtnNewgrdCust.style.display     = "none";
					ibtnsavegrdCust.style.display     = "none";
					ibtnDeletegrdCust.style.display     = "none";
					ibtUnDeletegrdCust.style.display     = "none";
					document.all("Progress").style.color     = "red"; 
					document.all("JointContract").style.color     = ""; 
					document.all("Contract").style.color      = "";    

					dat_kpbp00010_6.Call('SELECT');
				break;
				
				case '3' :
					info.style.display     = "none";
					shipment.style.display = "none";
					payment.style.display  = ""; 
					ibtnNewgrdCust.style.display     = "none";
					ibtnsavegrdCust.style.display     = "none";
					ibtnDeletegrdCust.style.display     = "none";
					ibtUnDeletegrdCust.style.display     = "none";
					document.all("Progress").style.color     = ""; 
					document.all("JointContract").style.color     = "red"; 
					document.all("Contract").style.color      = "";   
					OnSearch('grdJoin_ctr');

				break;        
			}
         break;
		 case 1:
			switch (radjointgrid.value)
			{
				case '1':
					document.all("radjointgrid1").style.color     = "Orange"; 
					document.all("radjointgrid2").style.color     = ""; 
					   
				break;
				case '2':
					document.all("radjointgrid1").style.color     = ""; 
					document.all("radjointgrid2").style.color     = "Orange"; 
					   
				break;
			}
		 break;
     }
}
 // ----------------------------------------------------------------------------------
 function onDelCust()
 {
	 if(confirm("Do you want to delete selected customer ?"))
	 {
			grdCust.DeleteRow();
			dat_kpbp00010_4.Call();
	 }
 }
 //-----------------------------------------------------------------------------------
 function onDelete(idx)
 {
	switch(idx)
	{
		case 0:
			switch(radjointgrid.GetData())
			{
				case "1":
				  if(confirm("Do you want to delete selected row ?"))
				  {
					grdJoin_ctr.DeleteRow();
					dat_kpbp00010_9.Call();
                  } 
                break;
				case "2":
				  if(confirm("Do you want to delete selected row ?"))
				  {
					grdJoint_Liabity.DeleteRow();
					dat_kpbp00010_10.Call();
                  }
                break;
            }
		break;
		case 1:
			switch(radgrid.GetData())
			{
				case "1":
				  if(confirm("Do you want to delete selected row ?"))
				  {
					grdCollect.DeleteRow();
					dat_kpbp00010_6.Call();
                  }
                break;
				case "2":
				  if(confirm("Do you want to delete selected row ?"))
				  {
					grdInsurrance.DeleteRow();
					dat_kpbp00010_7.Call();
                  }
                break;
				case "3":
				 if(confirm("Do you want to delete selected row ?"))
				 {
					grdGuarantee.DeleteRow();
					dat_kpbp00010_8.Call();
                 }
                break;
            }
		break;
	}
 }

 //===================================================================================

</script>

<body>
    <gw:data id="dat_kpbp00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55" function="pm_sel_61010050_1" procedure="pm_upd_61010050_1">
                <input>
                     <inout bind="txtprojectPK_0"  />
                     <inout bind="cboCompany_1"  />
                     <inout bind="cboStatus_2"  />
                     <inout bind="txtProject_cd_3"  />
                     <inout bind="txtProject_nm_4"  />
                     <inout bind="chkActive_YN_5"  />
                     <inout bind="dbCrtdt_6"  />
                     <inout bind="dbAppdt_7"  />
                     <inout bind="lstJointExe_8"  />
                     <inout bind="lstPrjcategory_9"  />
                     <inout bind="lstPrjtype_10"  />
                     <inout bind="txtsiteAdress_11"  />
                     <inout bind="txtOrganization_cd_12"  />
                     <inout bind="txtOrganization_pk_13"  />
                     <inout bind="txtOrganization_nm_14"  />
                     <inout bind="txtPM_cd_15"  />
                     <inout bind="txtPM_pk_16"  />
                     <inout bind="txtPM_nm_17"  />
                     <inout bind="txtPC_cd_18"  />
                     <inout bind="txtPC_pk_19"  />
                     <inout bind="txtPC_nm_20"  />
					 <inout bind="chkArb_YN_21"  />
                     <inout bind="chkCourt_YN_22"  />
                     <inout bind="chkOther_YN_23"  />
                     <inout bind="txtLiability_24"  />
                     <inout bind="txtGoverning_25"  />
					 <inout bind="txtRemark_26"  />
                     <inout bind="txtComment_27"  />
                     <inout bind="cboContractYN_28"  />
                     <inout bind="dbExratedt_29"  />
                     <inout bind="cboContracttype_30"  />
                     <inout bind="dbContractdate_31"  />
                     <inout bind="dbPeriod_fr_32"  />
                     <inout bind="dbPeriod_to_33"  />
                     <inout bind="txtSubcontractamt_34"  />
                     <inout bind="txtenalty4Delay_35"  />
                     <inout bind="txtMaximum_36"  />
                     <inout bind="txtInsured_37"  />
					 <inout bind="txtAdvance_38"  />
                     <inout bind="txtRemark_39"  />
                     <inout bind="txtBudget_40"  />
                     <inout bind="txtProgress_41"  />
                     <inout bind="txtRemark_42"  />
					 <inout bind="txtContingency_43"  />
                     <inout bind="txtBalance_44"  />
                     <inout bind="txtRemark_45"  />
                     <inout bind="txtProfit_46"  />
                     <inout bind="txtRetention_47"  />
					 <inout bind="txtRemark_48"  />
					 <inout bind="txtExecutiongroup_cd_49"  />
                     <inout bind="txtExecutiongroup_pk_50"  />
					 <inout bind="txtExecutiongroup_nm_51"  />
					 <inout bind="txtGrossMargin_52"  />
					 <inout bind="lstProvision_53"  />
					 <inout bind="dbPeriod_to_54"  />
					 <inout bind="txtInDirectratio"  />
					 
                 </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_2" onreceive="OnDataReceive(this)"> 
			<xml> 
				<dso id="1" type="grid"    function="pm_sel_61010050_2"    > 
					<input bind="grdSearch">                    
						<input bind="dtFrom" /> 
						<input bind="dtTo" /> 
						<input bind="cboCompany_1" /> 
						<input bind="txtPONoSearch" /> 
					</input> 
					<output bind="grdSearch" /> 
				</dso> 
			</xml> 
     </gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_4" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,2,4,5,6,7,8,9,10,11,12,13,14" function="pm_sel_61010050_10" procedure="pm_upd_61010050_10"   > 
				<input bind="grdCust">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdCust" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_5" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0" function="pm_sel_61010050_12"    > 
				<input bind="grdCustSum">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdCustSum" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_6" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8" function="pm_sel_61010050_3"   procedure="pm_upd_61010050_3"   > 
				<input bind="grdCollect">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdCollect" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_7" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,2,3,4,5,6,7,8,9,10" function="pm_sel_61010050_4"   procedure="pm_upd_61010050_4"   > 
				<input bind="grdInsurrance">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdInsurrance" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_8" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="pm_sel_61010050_5"   procedure="pm_upd_61010050_5"   > 
				<input bind="grdGuarantee">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdGuarantee" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_9" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,1,3,4,5,6,7,8,9,10,11" function="pm_sel_61010050_8"   procedure="pm_upd_61010050_8"   > 
				<input bind="grdJoin_ctr">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdJoin_ctr" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="dat_kpbp00010_10" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,1,3,4,5,6,7,8" function="pm_sel_61010050_9"   procedure="pm_upd_61010050_9"   > 
				<input bind="grdJoint_Liabity">                    
					<input bind="txtprojectPK_0" /> 
				</input> 
				<output bind="grdJoint_Liabity" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%" align="right">
                        <td style="width: 10%; white-space: nowrap">
                            Project</td>
                        <td colspan="2">
                            <gw:textbox id="txtPONoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Crt. Date|Project No|Project Name" format="0|4|0|0"
                                aligns="1|1|0|0" defaults="|||" editcol="0|0|0|0" widths="0|1200|1500|0" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%" valign="top">
                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="table5">
                    <tr>
                        <td style="width: 5%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onClick="OnToggle()" />
                        </td>
                        <td width="13%">
                            Company</td>
                        <td width="40%" colspan="3">
                            <gw:list id="cboCompany_1" styles="width:100%;" />
                        </td>
                        <td width="12%" align="right">
                            Status</td>
                        <td width="20%" colspan="5">
                            <gw:list id="cboStatus_2" styles="width:100%;" />
                        </td>
                        <td width="1%" align="right">
                            <gw:imgbtn id="btnNewMST" styles="width:100%;display:none" img="new" alt="New project" onclick="OnPopUp('newprj')" />
                        </td>
                        <td width="1%" align="right">
                            <gw:imgbtn id="btnsaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr>
                        <td width="13%">
                            Project</td>
                        <td width="15%" colspan="2">
                            <gw:textbox id="txtProject_cd_3" csstype="mandatory" styles="width:98%;" />
                        </td>
                        <td width="25%" colspan="7">
                            <gw:textbox id="txtProject_nm_4" csstype="mandatory" styles="width:98%;" />
                        </td>
                        <td width="1%" align="right">
                            <gw:imgbtn id="btnreset4" img="reset" alt="reset" onclick="txtProject_cd_3.text ='';txtProject_nm_4.text ='';" />
                        </td>
                        <td width="10%" colspan="1" align="right">
                            <a title="Active" style="color:#333">Active</td>
                        <td width="1%" align="right">
                            <gw:checkbox id="chkActive_YN_5" defaultvalue="Y|N" value="Y" />
                        </td>
                    </tr>
                    <tr>
                        <td width="13%">
                            <a title="Create Date" style="color:#333">Crt. date</a></td>
                        <td width="25%" colspan="2">
                            <gw:datebox id="dbCrtdt_6" lang="1" csstype="mandatory" onkeypress="" styles="width:98%;" />
                        </td>
                        <td width="15%" align="right">
                            <a title="Approval Date" style="color:#333">App. date</td>
                        <td width="25%" colspan="1">
                            <gw:datebox id="dbAppdt_7" nullaccept lang="1" csstype="" onkeypress="" styles="width:98%;" />
                        </td>
                        <td width="22%" colspan="3" align="center">
                            <a title="Click here to add new joint execution" onClick="OnPopUp('JointExecution')"
                                href="#tips" style="text-decoration: none; color=#0000ff"><b>Joint Execution</b></a></td>
                        <td align="left" width="10%" colspan="5">
                            <gw:list id="lstJointExe_8" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td width="13%">
                            <a title="Click here to add new project field" onClick="OnPopUp('Prjcategory')"
                                href="#tips" style="text-decoration: none; color=#0000ff"><b>Prj. field</b></a></td>
                        <td width="25%" colspan="2">
                            <gw:list id="lstPrjcategory_9" styles="width:100%;" />
                        </td>
                        <td width="22%" colspan="1" align="right">
                            <a title="Click here to add new project type" onClick="OnPopUp('Projecttype')" href="#tips"
                                style="text-decoration: none; color=#0000ff"><b>Project type</b></a></td>
                        <td align="left" width="10%" colspan="9">
                            <gw:list id="lstPrjtype_10" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td width="13%">
                            <a title="Click here to select execution group" onClick="OnPopUp('Exegroup')" href="#tips"
                                style="text-decoration: none; color=#0000ff"><b>Execution group</b></a></td>
                        <td width="15%" colspan="12">
                            <gw:list id="txtExecutiongroup_cd_49" csstype="" styles="width:98%;" readonly='true' />
                            <gw:textbox id="txtExecutiongroup_pk_50" styles="width:98%;display:none" />
                            <gw:textbox id="txtExecutiongroup_nm_51" csstype="" styles="width:98%;display:none"
                                readonly='true' />
                        </td>
                        <tr>
                            <td width="13%">
                                <a title="Click here to select Project Manager" onClick="OnPopUp('PM')" href="#tips"
                                    style="text-decoration: none; color=#0000ff"><b>PM</b></a></td>
                            <td colspan="12" width="87%">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="table15">
                                    <tr>
                                        <td width="10%" colspan="1">
                                            <gw:textbox id="txtPM_cd_15" csstype="" styles="width:98%;"  />
                                            <gw:textbox id="txtPM_pk_16" styles="width:98%;display:none" />
                                        </td>
                                        <td width="30%" colspan="2">
                                            <gw:textbox id="txtPM_nm_17" csstype="" styles="width:98%;"  />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnresetPM" img="reset" alt="reset" onclick="txtPM_cd_15.text ='';txtPM_pk_16.text ='';txtPM_nm_17.text ='';" />
                                        </td>
                                        <td width="5%" align="right">
                                            <a title="Click here to select Project Controller" onClick="OnPopUp('PC')" href="#tips"
                                                style="text-decoration: none; color=#0000ff"><b>PC</b></a></td>
                                        <td width="10%" colspan="2">
                                            <gw:textbox id="txtPC_cd_18" csstype="" styles="width:98%;"  />
                                            <gw:textbox id="txtPC_pk_19" styles="width:98%;display:none" />
                                        </td>
                                        <td width="30%" colspan="4">
                                            <gw:textbox id="txtPC_nm_20" csstype="" styles="width:98%;"  />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnresetPC" img="reset" alt="reset" onclick="txtPC_cd_18.text ='';txtPC_pk_19.text ='';txtPC_nm_20.text ='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="13%">
                                <a title="Site address"  style="color:#333">Site addr.</a></td>
                            <td width="90%" colspan="12">
                                <gw:textbox id="txtsiteAdress_11" csstype="" styles="width:99%;" />
                            </td>
                        </tr>
                        <tr>
                            <td width="13%">
                                <a title="Remark"  style="color:#333">Remark</a></td>
                            <td width="90%" colspan="12">
                                <gw:textbox id="txtRemark_48" csstype="" styles="width:99%;" />
                            </td>
                        </tr>
                        <tr style="width: 100%; height: 100%; background-color: CCFFFF">
                            <td colspan="9" width="99%" style="height: 100%; background-color: CCFFFF">
                                <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab(0)"> 
                                <span value="1" id="Contract">Contract</span> 
								<span value="2" id="Progress">Progress/Insurance/Bond</span>
								<span value="3" id="JointContract">Joint Contract</span>
                            </gw:radio>
                            </td>
                            <td width="1%">
                                <gw:imgbtn id="ibtnNewgrdCust" img="new" alt="New free item" onclick="onNew(1)" />
                            </td>
                            <td width="1%">
                                <gw:imgbtn id="ibtnsavegrdCust" img="save" alt="New Detail" onclick="OnSave('cust')" />
                            </td>
                            <td width="1%" align="right">
                                <gw:imgbtn id="ibtnDeletegrdCust" img="delete" alt="Delete Detail" onclick="onDelCust()" />
                            </td>
                            <td width="1%">
                                <gw:imgbtn id="ibtUnDeletegrdCust" img="udelete" alt="UnDelete Detail" onclick="UnDelete()"  styles="width:100%;display:none"  />
                            </td>
                        </tr>
                        <tr id="info">
                            <td colspan="13">
                                <table style="height: 100%; width: 100%;" border="0">
                                    <tr>
                                        <!--0_PK|1.Seq|2.License No|3.Customer Name|4.Portion(%)|5.Currency|6.Ex.Rate|7.Contract Amount|8.VAT Y/N|9. Vat rate(%)|10.VAT Amount|11.Cust_pk|12.TPS_PROJECT_PK|13. project_dt-->
                                        <td colspan="13" width="100%">
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Customer</legend>
                                                <gw:grid id="grdCust" 
												header="_PK|Seq|License No|Customer Name|Portion(%)|Currency|Ex. Rate|Contract Amount|VAT Y/N|Vat rate(%)|VAT Amount|_Cust_pk|_TPS_PROJECT_PK|_Project_dt|Book ex.rate"
                                                    format="0|0|0|0|0|0|1|1|0|0|1|0|0|0|-2" 
													aligns="0|3|2|2|3|1|3|3|1|3|3|3|0|0|3" 
													defaults="||||||||||||||"
                                                    editcol="0|1|1|1|1|1|1|1|1|1|1|0|1|0|1" 
													widths="0|500|1500|2500|700|1000|1000|1500|700|1500|1500|0|0|1200"
                                                    styles="width:100%; height:80" sorting="T" onafteredit="OnEditDetail()"
                                                    debug="false"
                                                    oncelldblclick="OnPopUp('CUS')" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" colspan="13">
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Sum</legend>
                                                <gw:grid id="grdCustSum" header="Currency|Amount|Exchange rate|VAT Y/N|VAT Amount|Booking Currency Amount"
                                                    format="0|1|1|0|1|1" aligns="1|3|3|2|3|3" defaults="0|0|0|0|0|0" editcol="0|0|0|0|0|0"
                                                    widths="1000|1800|2000|1000|1200|3000" styles="width:100%; height:60" sorting="F"
                                                    acceptnulldate="T" onafteredit="OnEdit()" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" colspan="13">
                                            <table border="0" width="100%" style="height: 100%; width: 100%; background-color: #CCFFFF"
                                                cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="15%">
                                                        Contract Y/N</td>
                                                    <td width="11%">
                                                        <gw:list id="cboContractYN_28" styles="width:100%;" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        Period</td>
                                                    <td width="18%" colspan="2">
                                                        <gw:datebox id="dbExratedt_29" lang="1" styles="width:98%;" />
                                                    </td>
                                                    <td width="2%" align="center">
                                                        ~</td>
                                                    <td width="10%" colspan="2">
                                                        <gw:datebox id="dbPeriod_to_54" nullaccept lang="1" styles="width:98%;" />
                                                    </td>
                                                    <td width="15%" colspan="1" align="right">
                                                        <a title="Click here to select Project Controller" onClick="OnPopUp('Contracttype')"
                                                            href="#tips" style="text-decoration: none; color=#0000ff"><b>Contract type</b></a></td>
                                                    <td width="30%" colspan="4">
                                                        <gw:list id="cboContracttype_30" styles="width:100%;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        Contract date</td>
                                                    <td width="11%">
                                                        <gw:datebox id="dbContractdate_31" lang="1" styles="width:98%;" />
                                                    </td>
                                                    <td width="8%" align="right">
                                                        Warranty</td>
                                                    <td width="6%" colspan="2">
                                                        <gw:datebox id="dbPeriod_fr_32" lang="1" styles="width:98%;" />
                                                    </td>
                                                    <td width="2%">
                                                        ~</td>
                                                    <td width="10%" colspan="2">
                                                        <gw:datebox id="dbPeriod_to_33" nullaccept lang="1" styles="width:98%;" />
                                                    </td>
                                                    <td width="15%" colspan="1" align="right">
                                                        <a title="Click here to select Project Controller" onClick="OnPopUp('Insurance')"
                                                            href="#tips" style="text-decoration: none; color=#0000ff"><b>Insurance</b></a></td>
                                                    <td width="30%" colspan="3">
                                                        <gw:list id="txtInsured_37" styles="width:100%;" onenterkey="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%" colspan="13">
                                                        <table border="1" width="100%" cellpadding="0" cellspacing="0" bordercolorlight="#00FFFF"
                                                            style="border-collapse: collapse" bordercolor="#008080">
                                                            <tr>
                                                                <td width="15%">
                                                                    Penalty for Delay</td>
                                                                <td width="11%">
                                                                    1 day</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtenalty4Delay_35" type="number" format="#,###,###,###,###.##R"
                                                                        styles="width:100%;" onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                    Maximum</td>
                                                                <td width="5%">
                                                                    <gw:textbox id="txtMaximum_36" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="2%">
                                                                    %</td>
                                                                <td width="15%" colspan="3" align="right" title="Expected Subcontract Amount">Exp. subcontract amt.</td>
                                                                <td width="9%" colspan="2">
                                                                    <gw:textbox id="txtSubcontractamt_34" type="number" format="#,###,###,###,###.##R"
                                                                        styles="width:100%;" onenterkey="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="15%" rowspan="4">
                                                                    Payment condition</td>
                                                                <td width="11%">
                                                                    Advance</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtAdvance_38" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                    Remark</td>
                                                                <td width="22%" colspan="4">
                                                                    <gw:textbox id="txtRemark_39" styles="width:100%;" onenterkey="" />
                                                                </td>
                                                                <td width="9%" align="right">
                                                                    Budget</td>
                                                                <td width="14%">
                                                                    <gw:textbox id="txtBudget_40" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="1%">
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="11%">
                                                                    Progress</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtProgress_41" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                    Remark</td>
                                                                <td width="22%" colspan="4">
                                                                    <gw:textbox id="txtRemark_42" styles="width:100%;" onenterkey="" />
                                                                </td>
                                                                <td width="9%" align="right">
                                                                    Contingency</td>
                                                                <td width="14%">
                                                                    <gw:textbox id="txtContingency_43" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="1%">
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="11%">
                                                                    Balance</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtBalance_44" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                    Remark</td>
                                                                <td width="22%" colspan="4">
                                                                    <gw:textbox id="txtRemark_45" styles="width:100%;" onenterkey="" />
                                                                </td>
                                                                <td width="9%" align="right">
                                                                    Gross margin</td>
                                                                <td width="14%">
                                                                    <gw:textbox id="txtGrossMargin_52" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="1%">
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="11%">
                                                                    Retention</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtRetention_47" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                    <a title="Click here to select Provision Controller" onClick="OnPopUp('Provision')"
                                                                        href="#tips" style="text-decoration: none; color=#0000ff"><b>Provision</b></a></td>
                                                                <td width="9%" colspan="5">
                                                                    <gw:list id="lstProvision_53" styles="width:100%;" onenterkey="" />
                                                                </td>
                                                                <td width="14%" colspan="1">
                                                                    <gw:textbox id="txtProfit_46" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="1%">
                                                                    %</td>
                                                            </tr>
															 <tr>
                                                                <td width="11%">
                                                                    InDirect ratio</td>
                                                                <td width="8%">
                                                                    <gw:textbox id="txtInDirectratio" type="number" format="#,###,###,###,###.##R" styles="width:100%;"
                                                                        onenterkey="" />
                                                                </td>
                                                                <td width="3%">
                                                                    %</td>
                                                                <td width="10%" colspan="3" align="right">
                                                                   </td>
                                                                <td width="9%" colspan="5">
                                                                   
                                                                </td>
                                                                <td width="14%" colspan="1">
                                                                    
                                                                </td>
                                                                <td width="1%">
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
                        <tr id="shipment">
                            <td colspan="13">
                                <table style="height: 100%; width: 100%;" border="0">
                                    <tr>
                                        <td width="99%" colspan="9">
                                            <gw:radio id="radgrid" value="1" styles="width:100%" onchange=""> 
																<span value="1" id="1">Collection Schedule</span> 
																<span value="2" id="2">Insurance</span>
																<span value="3" id="3">Guarantee Bond</span>
															</gw:radio>
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnNewFree" img="new" alt="New free item" onclick="onNew(2)" />
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnNewDetail" img="save" alt="New Detail" onclick="OnSave('progress')" />
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnDeleteDetail" img="delete" alt="Delete Detail" onclick="onDelete(1)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <!--0_PK|1.Seq|2.Progress Stage|3.Currency|4.Amount|5.Receipt rate|6.Cash|7.Expected Turn Over Date|8.projectpk--->
                                        <td colspan="13" width="100%">
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Collection Schedule</legend>
                                                <gw:grid id="grdCollect" header="_PK|Seq|Progress Stage|Currency|Amount|Receipt rate|Cash|Expected Turn Over Date|_projectpk"
                                                    format="0|0|0|0|1|1|1|4|0" aligns="0|3|1|1|3|3|3|1|3" defaults="||||||||" editcol="0|1|1|1|1|1|1|1|"
                                                    widths="0|800|1500|1000|1500|1500|1500|1500|0" styles="width:100%; height:100"
                                                    sorting="T" onafteredit="" oncelldblclick="" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13" width="100%">
                                            <!--0_PK|1.Seq| 2.Type| 3.Currency| 4.Amount| 5.Beginning Date| 6.Expiry date| 7.Insurance Company| 8.Remark|9_projectPK|10_buspartner_pk--->
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Insurance</legend>
                                                <gw:grid id="grdInsurrance" header="_PK|Seq| Type| Currency| Amount| Beginning Date| Expiry date| Insurance Company| Remark|_projectPK|_buspartner_pk"
                                                    format="0|0|0|0|1|4|4|0|0|0" aligns="0|3|1|1|3|1|2|2|2|3" defaults="|||||||||"
                                                    editcol="0|1|1|1|1|1|1|1|1|1" widths="0|800|1500|1000|1500|1200|1200|2500|2500|0"
                                                    styles="width:100%; height:100" sorting="T" onafteredit="OnEditDetail();OnSumAmt()"
                                                    oncelldblclick="OnPopUp('CUS3')" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13" width="100%">
                                            <!--0_PK|1.Seq|2.Type|3.Currency|4.Amount|5.Guarantee Rate (%)|6.Start Date|7.Expiry date
									    |8.Guarantee company|9.Remark|10_projectpk|11_buspartner_pk-->
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Guarantee Bond</legend>
                                                <gw:grid id="grdGuarantee" header="_PK|Seq|Type|Currency|Amount|Guarantee Rate (%)|Start Date|Expiry date|Guarantee company|Remark|_projectpk|_buspartner_pk"
                                                    format="0|0|0|0|1|0|4|4|0|0|0|0" aligns="0|3|1|1|3|3|1|1|2|2|0|0" defaults="|||||||||||"
                                                    editcol="0|1|1|1|1|1|1|1|1|1|0|0" widths="0|800|1000|1000|1000|1000|1200|1200|2500|2500|0|0"
                                                    styles="width:100%; height:100" sorting="T" onafteredit="" oncelldblclick="OnPopUp('CUS4')" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="payment">
                            <td colspan="13">
                                <table style="height: 100%; width: 100%;" border="1">
                                    <tr>
                                        <td width="99%" colspan="9">
                                            <gw:radio id="radjointgrid" value="1" styles="width:100%" onchange="OnChangeTab(1)"> 
																	<span value="1" id="radjointgrid1">Joint Contract</span> 
																	<span value="2" id="radjointgrid2">Joint Liability on Guarantee</span>
															  </gw:radio>
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnNewFree" img="new" alt="New" onclick="onNew(3)" />
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnNewDetail" img="save" alt="save" onclick="OnSave('grdJoin_ctr')" />
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="ibtnDeleteDetail" img="delete" alt="Delete" onclick="onDelete(0)" />
                                        </td>
                                        <!--td width="1%"><gw:imgbtn id="ibtUnDeleteDetail" img="udelete" alt="UnDelete Detail" onclick="UnDelete()" /></td-->
                                    </tr>
                                    <tr>
                                        <td colspan="13" width="100%">
                                            <!--0._PK|1.Seq|2.Joint Contractor|3.Portion(%)|4.Description|5.Currency|6.Contract Amount|7.Person in charge|8.Tel|9.Settlement|10.Cust_pk|11._projectpk-->
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Joint Contract</legend>
                                                <gw:grid id="grdJoin_ctr" header="_PK|Seq|Joint Contractor|Portion(%)|Description|Currency|Contract Amount|Person in charge|Tel|Settlement|_Cust_pk|_projectpk"
                                                    format="0|0|0|0|0|0|1|0|0|0|0|0" aligns="0|3|2|3|2|1|3|2|2|3|0|0" defaults="|||||||||||0"
                                                    editcol="1|1|1|1|1|1|1|1|1|1|1|0" widths="0|500|2500|1200|2000|1000|1500|2000|1500|1500|0|0"
                                                    styles="width:100%; height:100" sorting="T" debug="true" onafteredit="" oncelldblclick="OnPopUp('CUS1')" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!--0_PK|1.Seq|2.Company|3.Representative|4.License No|5.Tel|6.Address|7_projectpk|8.Cust_pk-->
                                        <td colspan="13" width="100%">
                                            <fieldset style="width: 100%; height: 100%; padding: 2">
                                                <legend>Joint Liability on Guarantee</legend>
                                                <gw:grid id="grdJoint_Liabity" header="_PK|Seq|Company|Representative|License No|Tel|Address|projectpk|Cust_pk"
                                                    format="0|0|0|0|0|0|0|0|0" aligns="0|3|2|2|2|2|2|0|0" defaults="||||||||" editcol="1|1|1|1|1|1|1|1|1"
                                                    widths="0|500|2500|1500|1500|1500|2500|0|0" styles="width:100%; height:100" sorting="T"
                                                    onafteredit="" oncelldblclick="OnPopUp('CUS2')" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13" width="100%">
                                            <table border="1" width="100%" style="height: 100%; width: 100%; background-color: #CCFFFF"
                                                cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="30%">
                                                        Settlement of dispute</td>
                                                    <td width="1%">
                                                        <gw:checkbox id="chkArb_YN_21" defaultvalue="Y|N" value="Y" />
                                                    </td>
                                                    <td width="10%">
                                                        Arbitration</td>
                                                    <td width="2%">
                                                        <gw:checkbox id="chkCourt_YN_22" defaultvalue="Y|N" value="Y" />
                                                    </td>
                                                    <td width="4%">
                                                        Court</td>
                                                    <td width="2%">
                                                        <gw:checkbox id="chkOther_YN_23" defaultvalue="Y|N" value="Y" />
                                                    </td>
                                                    <td width="44%">
                                                        Other</td>
                                                </tr>
                                                <tr>
                                                    <td width="30%">
                                                        Liability of reparation</td>
                                                    <td colspan="6">
                                                        <gw:textbox id="txtLiability_24" csstype="mandatory" styles="width:100%;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%">
                                                        Governing Law</td>
                                                    <td colspan="6">
                                                        <gw:textbox id="txtGoverning_25" csstype="mandatory" styles="width:100%;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="30%">
                                                        Remark (Other special condition)</td>
                                                    <td colspan="6">
                                                        <gw:textbox id="txtRemark_26" csstype="mandatory" styles="width:100%;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="30%">
                                                        Comment</td>
                                                    <td colspan="6">
                                                        <gw:textbox id="txtComment_27" csstype="mandatory" styles="width:100%;" />
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
    </td> </tr> </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtprojectPK_0" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <gw:textbox id="txtComCodeID" styles='width:100%;display:none' />
    <gw:textbox id="txtCodeTemp" styles='width:100%;display:none' />
    <gw:textbox id="txtOrganization_cd_12" csstype="" styles="width:98%;display:none"
        readonly='true' />
    <gw:textbox id="txtOrganization_pk_13" styles="width:98%;display:none" />
    <gw:textbox id="txtOrganization_nm_14" csstype="" styles="width:98%;;display:none"
        readonly='true' />
    <gw:imgbtn id="btnresetOrg" img="reset" alt="reset" onclick="txtOrganization_nm_14.text ='';txtOrganization_pk_13.text ='';txtOrganization_cd_12.text ='';"
        styles="width:98%;;display:none" />
    <!--------------------------------------------------------------------------->
</body>
</html>
