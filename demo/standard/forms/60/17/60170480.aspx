
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Wip Evaluation</title>
	
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

/*var v_wip_pk				= 0 ,
	v_Item_Code 			= 1 ,
	v_Item_Name 			= 2 ,
	v_BB_WIP_Qty 			= 3 ,
	v_In_WIP_Qty			= 4 ,
	v_WIP_Out_Qty 			= 5 ,
	v_End_Bal_WIP_Qty		= 6 ,
	v_BB_WIP_Amt			= 7 ,
	v_WIP_In_Amt			= 8 ,
	v_Prod_Unit_Cost_WIP 	= 9 ,	
	v_Prod_Cons_Amt_WIP 	= 10 ,	
	v_End_Bal_WIP_Amt 		= 11 ,
	v_BB_WIP_Mat_Amt 		= 12 ,
	v_WIP_Mat_In_Amt  		= 13 ,
	v_WIP_Mat_BB_In_Amt  	= 14 ,
	v_WIP_Mat_Unit_Cost   	= 15 ,	
	v_Consum_Amt_WIP_Mat   	= 16 ,	
	v_End_WIP_Mat_Amt 		= 17 ,
	v_prev_BB_WIP_Gener_Amt 		= 18 ,
	v_prev_In_Convert_Qty		 = 19 ,
	v_prev_In_Amt_WIP_Gener  	= 20 ,
	v_prev_Prod_Unit_Cost_WIP_Gener   = 21 ,
	v_prev_Consum_Amt_WIP_Gener    	= 22 ,	
	v_prev_End_WIP_Gener_Amt      	= 23 ,
	v_BB_WIP_Gener_Amt 		= 24 ,
	v_In_Convert_Qty		 = 25 ,
	v_In_Amt_WIP_Gener  	= 26 ,
	v_Prod_Unit_Cost_WIP_Gener   = 27 ,
	v_Consum_Amt_WIP_Gener    	= 28 ,	
	v_End_WIP_Gener_Amt      	= 29 ;*/
 

var v_wip_pk				= 0 ,
	v_PL				= 1,
	v_Item_Code 			= 2,
	v_Item_Name 			= 3 ,
	v_BB_WIP_Qty 			= 4 ,
	v_In_WIP_Qty			= 5 ,
	v_WIP_Out_Qty 			= 6 ,
	v_End_Bal_WIP_Qty		= 7 ,
	v_BB_WIP_Amt			= 8 ,
	v_WIP_In_Amt			= 9 ,
	v_Prod_Unit_Cost_WIP 	= 10,	
	v_Prod_Cons_Amt_WIP 		= 11,	
	v_End_Bal_WIP_Amt 		= 12 ,
	v_BB_WIP_Mat_Amt 		= 13 ,
	v_WIP_Mat_In_Amt  		= 14 ,
	v_WIP_Mat_BB_In_Amt  	= 15 ,
	v_WIP_Mat_Unit_Cost   	= 16 ,	
	v_Consum_Amt_WIP_Mat   	= 17 ,	
	v_End_WIP_Mat_Amt 		=18 ,
	v_prev_BB_WIP_Gener_Amt 		= 19 ,
	v_prev_In_Convert_Qty		 = 20 ,
	v_prev_In_Amt_WIP_Gener  	= 21,
	v_prev_Prod_Unit_Cost_WIP_Gener   = 22 ,
	v_prev_Consum_Amt_WIP_Gener    	= 23,	
	v_prev_End_WIP_Gener_Amt      	= 24 ,
	v_BB_WIP_Gener_Amt 		= 25 ,
	v_In_Convert_Qty		 = 26 ,
	v_In_Amt_WIP_Gener  	= 27 ,
	v_Prod_Unit_Cost_WIP_Gener   = 28 ,
	v_Consum_Amt_WIP_Gener    	= 29 ,	
	v_End_WIP_Gener_Amt      	= 30;	


var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
   txtLang.text="<%=Session("SESSION_LANG") %>"; 
    BindingData(); 
   System.Translate(document); 
   
	txtUser_Pk.text = g_user_pk;
	
	//pro_bico20040_search.Call("SELECT");
	dso_getCompany1.Call();
	
	var ctrl = grdSearch.GetGridControl();
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;

	var ctrl = grdPLPROD.GetGridControl();
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(9) = true;
	
	ctrl = idGridMaterialDetail.GetGridControl();
	ctrl.MergeCells  = 2 ;	
    ctrl.MergeCol(0) = true ; 
    ctrl.MergeCol(1) = true ;

	
	ctrl = idGridCostdetail.GetGridControl();
	ctrl.MergeCells  = 2 ;	
    ctrl.MergeCol(0) = true ; 
	ctrl.MergeCol(1) = true ; 
    ctrl.MergeCol(2) = true ;
	ctrl.MergeCol(3) = true ;
	
	ctrl = idGridCostdetail_PL.GetGridControl();
	ctrl.MergeCells  = 2 ;	
    ctrl.MergeCol(0) = true ; 
	ctrl.MergeCol(1) = true ; 
    ctrl.MergeCol(2) = true ;
	ctrl.MergeCol(3) = true ;
	
	ctrl = idGridCostdetail_Item.GetGridControl();
	ctrl.MergeCells  = 2 ;	
    ctrl.MergeCol(0) = true ; 
	ctrl.MergeCol(1) = true ; 
    ctrl.MergeCol(2) = true ;
	ctrl.MergeCol(3) = true ;
	
	OnTabChange();
	//dso_getCompany.Call();
  
}
//------------------------------------------------------------------------
function BindingData()
{
        
   // var ls_data = v"<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
   // lstCompany.SetDataText(ls_data);
	//lstCompany_1.SetDataText(ls_data);
   //lstCompany.value="<%=session("company_pk") %>"; 
  // lstCompany_1.SetDataText(ls_data);	
   
   
  // txtUser_Pk.SetDataText(g_user_pk);
   // Get Company
	
   txtGroupView.text = 'COST';	
   
   
   var ls_today = dtMonth_2.value ;
   var lmonth = ls_today.substring(0,4);
    dtMonth_1.value = lmonth + '01';
   
   
   var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
     MergeGridWIP();
 
	//document.all("Costdetail2").style.display ='none';
	idGridWIP.GetGridControl().ColFormat(v_BB_WIP_Amt) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_WIP_In_Amt) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_Prod_Unit_Cost_WIP) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_Prod_Cons_Amt_WIP) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_End_Bal_WIP_Amt) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_BB_WIP_Mat_Amt) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_WIP_Mat_In_Amt) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_WIP_Mat_BB_In_Amt) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_WIP_Mat_Unit_Cost) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_Consum_Amt_WIP_Mat) = "###,###,###,###,###.00";
    
	idGridWIP.GetGridControl().ColFormat(v_prev_BB_WIP_Gener_Amt) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_prev_In_Convert_Qty) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_prev_In_Amt_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_prev_Prod_Unit_Cost_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_prev_Consum_Amt_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_prev_End_WIP_Gener_Amt) = "###,###,###,###,###.00";
	
	idGridWIP.GetGridControl().ColFormat(v_BB_WIP_Gener_Amt) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_In_Convert_Qty) = "###,###,###,###,###.00";
    idGridWIP.GetGridControl().ColFormat(v_In_Amt_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_Prod_Unit_Cost_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_Consum_Amt_WIP_Gener) = "###,###,###,###,###.00";
	idGridWIP.GetGridControl().ColFormat(v_End_WIP_Gener_Amt) = "###,###,###,###,###.00";
	
	
}
//------------------------------------------------------------------------

function OnResetAccount()
{
	txtACPK.text ='';
	txtACCD.text ='';
	txtACNM.text ='';
}

function OnResetPLUnit(index)
{
	switch(index) 
	{
		case '0':
			 txtPLID_1.text='';
			 txtPLNM_1.text='';
			 txtPLPK_S.text ='';
		 break;
		 
		 case '1':
			 txtPLID.text='';
			 txtPLNM.text='';
			 txtPLPK_S_1.text ='';
		 break;
	 }
}
    
function OnPopUp(pname, index)
{
    if (pname=='ACCT')
   {
         var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_SEL_60080190_ACCD_PL";
	var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;scroll:no;'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtACPK.SetDataText(object[3]);
        txtACCD.SetDataText(object[0]);
        txtACNM.SetDataText(object[1]);
    }
	
	return false;
   }
    if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes;scroll:no;'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_gfka00220_1.Call();
                }            
            } 
	return false;			
   }
    if (pname=='PL')
   {
          
          var fpath   = System.RootURL + "/standard/forms/60/17/60170001_pl_popup.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 400 , 'resizable:yes;status:yes;scroll:no;'); 
          var tmp;
            if ( object != null && index == '0' )  
            {
                if (object[0] != 0)
                {
                   txtPLID_1.text=object[1];
				   txtPLNM_1.text=object[2];
				   txtPLPK_S.text =object[0];
                }            
            }  
			
			if ( object != null && index == '1' )  
            {
                if (object[0] != 0)
                {
                   txtPLID.text=object[1];
				   txtPLNM.text=object[2];
				   txtPLPK_S_1.text =object[0];
				  
                }            
            }  


			return false;
   }
    if (pname=='COST')
   {
          if(grdCost.GetGridData(grdCost.row,0) !='')
		  {
          var fpath   = System.RootURL + "/standard/forms/60/17/60170481.aspx?p_month="+dtMonth.value+"&p_abplcenter_pk="+txtPLPK.text+"&p_grp_cd="+grdCost.GetGridData(grdCost.row,0);
          var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes;scroll:no;'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
	}  
	
return false;	
   }
   
   if(pname ='REGISTERRATIO' &&  index == 0){
		 var code_group_pk = '';//partner
		 var fpath   = System.RootURL + "/standard/forms/60/17/60170480_popup.aspx?p_CODE_GROUP_PK="+code_group_pk+"&p_month="+dtMonth.value;   
          var object  = System.OpenModal(fpath , 500 , 500 , 'resizable:yes;status:yes'); 
          return false;
   }
    
}

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dat_sel_60170480_header':	
			 if(txt_header_pk.text !="")
			 {
			    	dat_sel_60170480_cost.Call('SELECT');
			 }else
			 {
				grdCostD.ClearData();
				idGridWIP.ClearData();	
				MergeGridWIP();
				grdPLPROD.ClearData();
				grdMAT.ClearData();

			 }
		break;
		case 'dso_getCompany1':
				dso_getCompany.Call();
			break;
			
		case 'dat_sel_60170480_cost':
			grdCostD.Subtotal (0,2 ,'-1', '5');
			if(chk_status.value=='0')
			{
				dat_sel_60170480_wip.Call('SELECT');
			}else	if(chk_status.value=='1')
			{
				dat_sel_60170480_wip_mat.Call('SELECT');
			}	
			else	if(chk_status.value=='2')
			{
				dat_sel_60170480_mat.Call('SELECT');
			}				
		break;
		
		case 'dat_sel_60170480_wip': 
				MergeGridWIP();
				setColor(idGridWIP,2,v_BB_WIP_Mat_Amt,v_End_WIP_Mat_Amt,0xCCFFFF );
				setColor(idGridWIP,2,v_BB_WIP_Gener_Amt  ,v_End_WIP_Gener_Amt, 0xB0E2FF);
			 //  idGridWIP.Subtotal (0,2 ,'-1', '3!4!5!6!7!8!9!9!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!28!29');
				idGridWIP.Subtotal (0,2 ,'-1', '4!5!6!7!8!9!9!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30');
				
				
		break;
		case 'dat_sel_60170480_MaterialD':
				
				var ctrl = idGridMaterialDetail.GetGridControl();
				setColor(idGridMaterialDetail,1,0,11,0xCCFFFF );
				idGridMaterialDetail.setFormat('0|0|0|0|1|1|1|1|1|1|1|-0|-0');
				//idGridMaterialDetail.Subtotal (0,2 ,'-1', '4!5!6!7!8!9!10');
				idGridMaterialDetail.Subtotal (0,2 ,'-1', '5!6!7!8!9!11!12');
				txtGroupView.text="COST";
				dat_sel_60170480_Cost_D.Call("SELECT");
				break;
		
		case 'dat_sel_60170480_Cost_D': 
				idGridCostdetail.setFormat("0|0|0|0|1|1|-0|-0|-0|-0");
				txtGroupView.text="PL";
				for(var i = 1; i< idGridCostdetail.rows; i++){
					if(idGridCostdetail.GetGridData(i,1) == "" && idGridCostdetail.GetGridData(i,2) == "" && idGridCostdetail.GetGridData(i,3) == "")
						idGridCostdetail.SetCellBgColor(i, 0, i,11,0XEE82EE);
					else if(idGridCostdetail.GetGridData(i,1) == "" && idGridCostdetail.GetGridData(i,2) == "" && idGridCostdetail.GetGridData(i,3) != "")
						idGridCostdetail.SetCellBgColor(i, 0, i,11,0xB0E2FF);
					else
						idGridCostdetail.SetCellBgColor(i, 0, i,11,0xCCFFFF);

				}
				dat_sel_60170480_Cost_D_PL.Call("SELECT");
				break;
	  case 'dat_sel_60170480_Cost_D_PL':
				idGridCostdetail_PL.setFormat('0|0|0|0|1|1|-0|-0|-0|-0');
				txtGroupView.text="ITEM";
				for(var i = 1; i< idGridCostdetail_PL.rows; i++){
					if(idGridCostdetail_PL.GetGridData(i,1) == "" && idGridCostdetail_PL.GetGridData(i,2) == "" && idGridCostdetail_PL.GetGridData(i,3) == "")
						idGridCostdetail_PL.SetCellBgColor(i, 0, i,11,0XEE82EE);
					else if(idGridCostdetail_PL.GetGridData(i,1) != "" && idGridCostdetail_PL.GetGridData(i,2) == "" && idGridCostdetail_PL.GetGridData(i,3) == "")
						idGridCostdetail_PL.SetCellBgColor(i, 0, i,11,0xB0E2FF);
					else
						idGridCostdetail_PL.SetCellBgColor(i, 0, i,11,0xCCFFFF);

				}				
				dat_sel_60170480_Cost_D_ITEM.Call("SELECT");
			break;
		case 'dat_sel_60170480_Cost_D_ITEM':
				for(var i = 1; i< idGridCostdetail_Item.rows; i++){
					if(idGridCostdetail_Item.GetGridData(i,1) == "" && idGridCostdetail_Item.GetGridData(i,2) == "" && idGridCostdetail_Item.GetGridData(i,3) == "")
						idGridCostdetail_Item.SetCellBgColor(i, 0, i,11,0XEE82EE);
					else if(idGridCostdetail_Item.GetGridData(i,1) == "" && idGridCostdetail_Item.GetGridData(i,2) != "" && idGridCostdetail_Item.GetGridData(i,3) == "")
						idGridCostdetail_Item.SetCellBgColor(i, 0, i,11,0xB0E2FF);
					else
						idGridCostdetail_Item.SetCellBgColor(i, 0, i,11,0xCCFFFF);

				}
				idGridCostdetail_Item.setFormat('0|0|0|0|1|1|-0|-0|-0|-0');
			break;
		case 'dat_sel_60170480_mat':
			grdMAT.Subtotal (0,2 ,'-1', '7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23');
		break;
		
		case 'dso_60170480_wip1_step1':
			alert(txtReturn.text);
			dso_sel_tree_account.Call('SELECT');
		break;
		case 'dso_60170480_wip1_step2':
			alert(txtReturn.text);
			dat_sel_60170480.Call();
		break;
		case  'dso_60170480_wip1_cl':
			alert(txtReturn.text);
			dat_sel_60170480.Call();
		break;	
	
		case 'dso_60170480_makeslip':
			//alert(txtReturn.text);
			dat_sel_60170480.Call();
		break;
	}
}
function OnSearch(obj)
{
	switch(obj)
	{
		case 'LIST':
			dso_sel_tree_account.Call('SELECT')
			//dat_sel_60170480.Call('SELECT');
		break;
		
		case 'MM_COST':
			txt_header_pk.text = grdSearch.GetGridData(grdSearch.row,0);
			dat_sel_60170480_header.Call('SELECT');
		break;
		
		case 'LISTgrdCostDpl':
			dat_sel_60170480_cost.Call();
			
   }
  
}

function  OnUnProcess()
{
	if(txt_header_pk.text != "")
	{
		if(confirm("Do you want to Cancel ?"))
		{
			dso_60170480_wip1_cl.Call();
		}
	}else
	{
		alert("Please, select a process to cancel!");
	}
}

function  OnProcess()
{
	
		if(confirm("Do you want to make evaluation for this wip?"))
		{
			dso_60170480_wip1_step1.Call();
		}
	
}
function OnMakeSlip()
{
	if(txt_header_pk.text != "")
	{
	dso_60170480_makeslip.Call();
	}else
	{
		alert("Please select Process to evaluate!");
	}
}

function OnCancelSlip()
{
	dso_60170480_makeslip_cl.Call();
}
function MergeGridWIP()
{
		if(idGridWIP.rows == 1)
		idGridWIP.AddRow();

	var fg = idGridWIP.GetGridControl();
	fg.FixedRows = 2; 
	//fg.Cell(13, 1, 0, 1, fg.Cols - 1) = true ;    
	fg.MergeCells = 5;
	fg.MergeRow(0) = true; 

//
	fg.MergeCol(v_PL) = true;
	fg.Cell(0, 0, v_PL, 1, v_PL) = 'PL';  
//	
	
	fg.MergeCol(v_Item_Code) = true;
	fg.Cell(0, 0, v_Item_Code, 1, v_Item_Code) = 'Item Code';  
	fg.MergeCol(v_Item_Name) = true;
	fg.Cell(0, 0, v_Item_Name, 1, v_Item_Name) = 'Item Name'; 
 	
	fg.Cell(0, 0, v_BB_WIP_Qty, 0, v_End_Bal_WIP_Amt) = "WIP"; //WIP
	
	fg.Cell(0, 1, v_BB_WIP_Qty, 1, v_BB_WIP_Qty) = "Begin Bal. Qty"; 
	
	fg.Cell(0, 1, v_In_WIP_Qty, 1, v_In_WIP_Qty) = "In Qty"; 
	
	fg.Cell(0, 1, v_WIP_Out_Qty, 1, v_WIP_Out_Qty) = "Prod. Convert Qty"; 
	
	fg.Cell(0, 1, v_End_Bal_WIP_Qty, 1, v_End_Bal_WIP_Qty) = "End Bal. Qty"; 
	
	fg.Cell(0, 1, v_BB_WIP_Amt, 1, v_BB_WIP_Amt) = "Begin Bal. Amt"; 
	
	fg.Cell(0, 1, v_WIP_In_Amt, 1, v_WIP_In_Amt) = "In Amt"; 
	
	fg.Cell(0, 1, v_Prod_Unit_Cost_WIP, 1, v_Prod_Unit_Cost_WIP) = "Prod. Unit Cost"; 
	
	fg.Cell(0, 1, v_Prod_Cons_Amt_WIP, 1, v_Prod_Cons_Amt_WIP) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Bal_WIP_Amt, 1, v_End_Bal_WIP_Amt) = "End Bal. Amt"; 	
	
	fg.Cell(0, 0, v_BB_WIP_Mat_Amt, 0, v_End_WIP_Mat_Amt) = "WIP Material"; //WIP Material 
		
	fg.Cell(0, 1, v_BB_WIP_Mat_Amt, 1, v_BB_WIP_Mat_Amt) = "Begin Bal. Amt"; 
	
	fg.Cell(0, 1, v_WIP_Mat_In_Amt, 1, v_WIP_Mat_In_Amt) = "In Amt"; 
	
	fg.Cell(0, 1, v_WIP_Mat_BB_In_Amt, 1, v_WIP_Mat_BB_In_Amt) = "Begin + In"; 
	
	fg.Cell(0, 1, v_WIP_Mat_Unit_Cost, 1, v_WIP_Mat_Unit_Cost) = "Unit Cost"; 
	
	fg.Cell(0, 1, v_Consum_Amt_WIP_Mat, 1, v_Consum_Amt_WIP_Mat) = "Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_WIP_Mat_Amt, 1, v_End_WIP_Mat_Amt) = "End Bal. Amt"; 
	
	fg.Cell(0, 0, v_prev_BB_WIP_Gener_Amt, 0, v_prev_End_WIP_Gener_Amt) = "Prev WIP General Cost"; //pre_WIP General Cost
	
	fg.Cell(0, 1, v_prev_BB_WIP_Gener_Amt, 1, v_prev_BB_WIP_Gener_Amt) = "Begin Bal. Amt"; 
	
	fg.Cell(0, 1, v_prev_In_Convert_Qty, 1, v_prev_In_Convert_Qty) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_prev_In_Amt_WIP_Gener, 1, v_prev_In_Amt_WIP_Gener) = "In Amt"; 
	
	fg.Cell(0, 1, v_prev_Prod_Unit_Cost_WIP_Gener, 1, v_prev_Prod_Unit_Cost_WIP_Gener) = "Prod Unit Cost"; 
	
	fg.Cell(0, 1, v_prev_Consum_Amt_WIP_Gener, 1, v_prev_Consum_Amt_WIP_Gener) = "Cons. Amt"; 
	
	fg.Cell(0, 1, v_prev_End_WIP_Gener_Amt, 1, v_prev_End_WIP_Gener_Amt) = "End Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_WIP_Gener_Amt, 0, v_End_WIP_Gener_Amt) = "WIP General Cost"; //Cost
	
	fg.Cell(0, 1, v_BB_WIP_Gener_Amt, 1, v_BB_WIP_Gener_Amt) = "Begin Bal. Amt"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty, 1, v_In_Convert_Qty) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Amt_WIP_Gener, 1, v_In_Amt_WIP_Gener) = "In Amt"; 
	
	fg.Cell(0, 1, v_Prod_Unit_Cost_WIP_Gener, 1, v_Prod_Unit_Cost_WIP_Gener) = "Prod Unit Cost"; 
	
	fg.Cell(0, 1, v_Consum_Amt_WIP_Gener, 1, v_Consum_Amt_WIP_Gener) = "Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_WIP_Gener_Amt, 1, v_End_WIP_Gener_Amt) = "End Bal. Amt"; 
	
}

function OnTabChange()
{

	var iProd = document.all("SEMI");    
	var iMat = document.all("MAT");   
	var iWipMat = document.all("WIP_MAT"); 
	//var iMaterialDetail =document.all("MaterialDetail"); 
	//var iCostdetail2 = document.all("Costdetail2");
   
	if(chk_status.value ==0)
	{
		
		iProd.style.display ='';
		iMat.style.display ='none';
		iWipMat.style.display ='none';
		//iMaterialDetail.style.display ='';
		//iCostdetail2.style.display ='';
		if(txt_header_pk.text !="")
		{
		dat_sel_60170480_wip.Call('SELECT');
		}
	}
	if(chk_status.value ==1)
	{
	   
		iProd.style.display ='none';
		iMat.style.display ='none';
		iWipMat.style.display ='';
		//iMaterialDetail.style.display ='none';
		//iCostdetail2.style.display ='none';
		if(txt_header_pk.text !="")
		{
		dat_sel_60170480_wip_mat.Call('SELECT');
		}
	}
	if(chk_status.value ==2)
	{
		
		iProd.style.display ='none';
		iMat.style.display ='';
		iWipMat.style.display ='none';
		//iMaterialDetail.style.display ='none';
		//iCostdetail2.style.display ='none';
		if(txt_header_pk.text !="")
		{
		dat_sel_60170480_mat.Call('SELECT');
		}
	}
}

  //---------------------------------------------------------
     function OnToggle()
     {
	 
        var left1  = document.all("left1");    
        var right1 = document.all("right1");   
         //var left2  = document.all("left2");    
        //var right3 = document.all("right2"); 
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left1.style.display="none";  
           // left2.style.display="none";       
            imgArrow.status = "collapse";
            right1.style.width="100%";
           // right2.style.width="100%";
            imgArrow.src = "../../../system/images/next_orange.gif";
        }
        else
        {
            left1.style.display="";
           // left2.style.display="";
            imgArrow.status = "expand";
           // right2.style.width="75%";
            right1.style.width="75%";
            imgArrow.src = "../../../system/images/prev_orange.gif";
        }
     }
	 
	 
	 function setColor(id1,h,startcol,endcol,color  ){
		var ctrl = id1.GetGridControl();
		
		var len =  ctrl.Rows;
		
		for (var i = h ; i < len; i++){
			 id1.SetCellBgColor(i, startcol, i, endcol,color);
		}
	 }
	 
	 
	 function Ongrid(){
	/*	var iMaterialDetail =document.all("MaterialDetail"); 
		var iCostdetail2 = document.all("Costdetail2");
		if(idGridWIP.col >= v_BB_WIP_Mat_Amt && idGridWIP.col <=v_End_WIP_Mat_Amt){
			txtWipDetail_Pk.text = idGridWIP.GetGridData(idGridWIP.row,0);
			dat_sel_60170480_MaterialD.Call('SELECT');
			iMaterialDetail.style.display ="";
			iCostdetail2.style.display ="none";
		}
		
		if(idGridWIP.col >= v_BB_WIP_Gener_Amt && idGridWIP.col <= v_End_WIP_Gener_Amt ){
			txtWipDetail_Pk.text = idGridWIP.GetGridData(idGridWIP.row,0);
			dat_sel_60170480_Cost_D.Call('SELECT');
			iCostdetail2.style.display ="";
			iMaterialDetail.style.display ="none";
		}*/
		
		txtWipDetail_Pk.text = idGridWIP.GetGridData(idGridWIP.row,0);
			dat_sel_60170480_MaterialD.Call('SELECT');
	 }
	 
	 function OnPLDBLClick()
	 {
		 txtPLID.text=  grdCostD.GetGridData(grdCostD.row,1); //PL_p
		 txtPLNM.text= grdCostD.GetGridData(grdCostD.row,2); //PL_p
		 txtPLPK_S_1.text = grdCostD.GetGridData(grdCostD.row,8); //PL_pK
		 txtGroup_code.text = grdCostD.GetGridData(grdCostD.row,9); //group_code_pk
		 var pl = grdCostD.GetGridData(grdCostD.row,1);
		 OnSearch('LISTgrdCostDpl');
		 
		 if(grdCostD.col == 5){
			 var fpath   = System.RootURL + "/standard/forms/60/17/60170482_popup.aspx?CodeGroupPK="+txtGroup_code.text+"&pL_cd="+pl+"&month="+dtMonth.value;
              var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
		 }
	 }
	 
// Report Bang thong ke hang ban'
function OnExcel()
{  
alert(txt_header_pk.text);
	var url = System.RootURL + '/standard/reports/60/17/rpt_sel_60170480_wipEvalution.aspx?WIp_header_pk='+txt_header_pk.text+'&pl_pk='+txtPLPK_S_1.text;
	System.OpenTargetPage(url);  
}
</script>

<body style="margin: 0; padding: 0;">
 <!------------------------------------------------------------------------------------------------------->
 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="list" procedure="ac_sel_company" > 
			<input> 
				<input bind="txtUser_Pk"/>
			</input>
			<output>
				<output bind="lstCompany"/>
			</output> 
		</dso> 
	</xml> 
</gw:data> 

<!------------------------------------------------------------------------------------------------------------>
 <gw:data id="dso_getCompany1" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="list" procedure="ac_sel_company" > 
			<input> 
				<input bind="txtUser_Pk"/>
			</input>
			<output>
				<output bind="lstCompany_1"/>
			</output> 
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_sel_tree_account">
        <xml>

            <dso type="grid" parameter="0,1" function="ac_sel_60170480_list">
                <input bind="grdSearch" > 
                    <input bind="lstCompany_1" /> 
					<input bind="dtMonth_1" /> 
					<input bind="dtMonth_2" /> 
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>	
	
	
	<gw:data id="dat_sel_60170480_header" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="control" function="ac_sel_60170480_header"> 
				<inout> 
				<inout bind="txt_header_pk"/>
				<inout bind="dtMonth"/>
				<inout bind="txtSeq"/>			
				</inout>
			</dso>
		</xml> 
	</gw:data>
 
	<gw:data id="dat_sel_60170480_cost" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_mm_cost"> 
				<input>
					<input bind="txt_header_pk" /> 				
					<input bind="txtPLPK_S_1" /> 						
				</input> 
				<output bind="grdCostD" /> 
			</dso> 
		</xml> 
	</gw:data>

	<gw:data id="dat_sel_60170480_wip" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_Detail"> 
				<input>
					<input bind="txt_header_pk" />	
					<input bind="txtPLPK_S_1" /> 	
					<input bind="txtItemS" /> 
				</input> 
				<output bind="idGridWIP" /> 				
			</dso> 
		</xml> 
	</gw:data>
	
	
	<gw:data id="dat_sel_60170480_MaterialD" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_Material_D"> 
				<input>
					<input bind="txtWipDetail_Pk" /> 
											
				</input> 
				<output bind="idGridMaterialDetail" /> 				
			</dso> 
		</xml> 
	</gw:data>
	
	<gw:data id="dat_sel_60170480_Cost_D" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_Cost_D"> 
				<input>
					<input bind="txtWipDetail_Pk" /> 
					<input bind="txtGroupView" /> 
				</input> 
				<output bind="idGridCostdetail" /> 				
			</dso> 
		</xml> 
	</gw:data>
	<gw:data id="dat_sel_60170480_Cost_D_PL" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_Cost_D"> 
				<input>
					<input bind="txtWipDetail_Pk" /> 
					<input bind="txtGroupView" /> 
				</input> 
				<output bind="idGridCostdetail_pl" /> 				
			</dso> 
		</xml> 
	</gw:data>
	<gw:data id="dat_sel_60170480_Cost_D_ITEM" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_Cost_D"> 
				<input>
					<input bind="txtWipDetail_Pk" /> 
					<input bind="txtGroupView" /> 
				</input> 
				<output bind="idGridCostdetail_item" /> 				
			</dso> 
		</xml> 
	</gw:data>
		
	<gw:data id="dat_sel_60170480_wip_mat" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="AC_SEL_60170480_WIP_MAT"> 
				<input>
					<input bind="txt_header_pk" /> 
					<input bind="txtPLPK_S_1" /> 
					<input bind="txtItemS" /> 					
				</input> 
				<output bind="grdPLPROD" /> 				
			</dso> 
		</xml> 
	</gw:data>
	</gw:data>
		<gw:data id="dat_sel_60170480_mat" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170480_mat"> 
				<input>
					<input bind="txt_header_pk" />
					<input bind="txtPLPK_S_1" /> 
				</input> 
				<output bind="grdMAT" /> 				
			</dso> 
		</xml> 
	</gw:data>		


	<gw:data id="dso_60170480_wip1_step1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60170480_alloc_wip">
                <input> 
                     <input bind="lstCompany"/>					
					 <input bind="dtMonth"/> 
                </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
		

		
<gw:data id="dso_60170480_wip1_cl" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60170480_wip_cl">
                <input> 
					 <input bind="lstCompany"/>
                     <input bind="txt_header_pk"/>
                </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>

	<!-----------make slip --------->
	 <gw:data id="dso_60170480_makeslip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170480_SLIP">
                <input> 
                     <input bind="lstCompany"/>
                    <input bind="txt_header_pk"/>
		        </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	 <gw:data id="dso_60170480_makeslip_cl" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170480_CancelSLIP">
                <input> 
                     <input bind="lstCompany"/>
                    <input bind="txt_header_pk"/>
		        </input>
                <output>
                     <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	
    <table style="width:100%;height:100% " border="1" cellpadding="0" cellspacing="0" >	
		<tr  style="height:100%">
			<td style="width:30%" valign:top" id="left1">			
			<table style="width: 100%; height:100% " border="0"  >
                <tr style="height:1%">
                    <td style="width:20%"></td>
                    <td style="width:30%"></td>
                    <td style="width:20%"></td>
					<td style="width:25%"></td>
					<td style="width:5%"></td>
                </tr>
                <tr style="height:1%">
                    <td align="right">Company</td>
                    <td align="left" colspan="3" ><gw:list id="lstCompany_1" styles="width: 100%; " /></td>				
				
                </tr >  
				<tr style="height:1%">
                   	<td align="right">Month</td>
                    <td align="left" ><gw:datebox id="dtMonth_1" styles="width: 100%" type="month" lang="1" /></td>
					<td align="left" ><gw:datebox id="dtMonth_2" styles="width: 100%" type="month" lang="1" /></td>
					<td align="right"> <gw:imgbtn id="btnSearch" text="Search" alt="Search" img="search" onclick="OnSearch('LIST')" /></td>
                </tr>	
                <tr style="height:85%" >

                    <td colspan="5" style="width:100%; v-align:top">
					<gw:grid id='grdSearch'
							header='_PK|Month|Slip No|Status|Remarks'
							format='0|0|0|0|0'
							aligns='0|0|0|0|0'
							defaults='|||||'
							editcol='0|0|0|0|0'
							widths='0|950|950|1000|1500'
							sorting='F'
							oncellclick = "OnSearch('MM_COST')"
							styles='width:100%; height:100%'
							/>
					</td>
                </tr> 
            </table>  
			</td>
			<td style="width:70%; valign:top;height:100%" id="right1">
				<table width="100%" valign="top" style="height:100%;" border="0"  >
					 <tr style="height:1%">
						<td style="width:10%"></td>
						<td style="width:15%"></td>
						<td style="width:20%"></td>
						<td style="width:5%"></td>
						
						<td style="width:10%"></td>
						<td style="width:5%"></td>
						<td style="width:5%"></td>
						<td style="width:30%"></td>
						
						
						<td style="width:5%"></td>
					</tr>
					<tr style="height:1%"    >
						<td  style="width:10%" >
							 Company
						</td>
						<td  style="width:15%" colspan="3">
							<gw:list id="lstCompany" styles="width: 100%; " />
						</td>
						<td  >
							 Month
						</td>
						<td  style="width:15%"  >
							<gw:datebox id="dtMonth" styles="width:100%"  type="month" lang="1" />
						</td>	
						 <td  style="width:10%; white-space:nowrap;" >
							 Slip No
						</td>
						<td align="right">
							<gw:textbox id="txtSeq" text="" styles="width:100%; "  />
						</td>     
						<td width="1%"><gw:button img="process"   	alt="Process"     	id="btnProcess" 			onclick="OnProcess();" /> </td>
						<td width="1%"><gw:button img="Cancel"   	alt="Cancel"     	id="btnUnProcess" 			onclick="OnUnProcess();" /> </td>
						<td width="1%"><gw:button img="Make slip"   	alt="Make slip"   	id="btnMakeslip" 		onclick="OnMakeSlip();" /> </td>
						<td width="1%"><gw:button img="Cancel slip"  alt="Cancel slip"    id="btnCancelslip" 		onclick="OnCancelSlip();" /> </td>
					</tr>
					
					<tr style="height:5%"    >
						<td  style="width:10% text-align:right;" >
							<a title="Click here to select PL" onclick="OnPopUp('PL','1')" href="#tips" style="text-decoration: none; color=#0000ff"> <b> PL</b> </a>
						</td>
						<td align="left" ><gw:textbox id="txtPLID" text="" styles="width:100%; "  /></td>     
						<td  align="right"> <gw:textbox id="txtPLNM" text="" styles="width:100%; " /></td>
						<td align="right"> <gw:imgbtn id="btnReset" text="Search" alt="Reset" img="reset" onclick="OnResetPLUnit('1')"  /></td>
						<td align="right"> <gw:imgbtn id="btnSearch" text="Search" alt="Search" img="search" onclick="OnSearch('LISTgrdCostDpl')" /></td>
						<td></td>
						 <td align="left"><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnExcel()"/></td>
						<td align="right" colspan=3> 
					<!--	<a title="Click here to update Progress Ratio" onclick="OnPopUp('REGISTERRATIO','0')" href="#tips" style="text-decoration: none; color=#0000ff"> <b> Wip Progress Ratio</b> </a>-->
						</td>
					</tr>
					<tr style="height:15%"  >						
						<td colspan = '12'>
							<gw:grid id='grdCostD'
							header='_PK|PL CD|PL NM|Cost Group|Cost Group Nm|Amount|CCY|Progress Ratito|_PL_PK|_CODE_GROUP_PK|-'
							format='0|0|0|0|0|-2|0|-1|0|0|0'
							aligns='0|0|0|0|0|0|0|0|0|0'
							defaults='||||||||||'
							editcol='0|0|0|0|0|0|0|0|0'
							widths='0|1500|2500|1500|2000|1500|1000|1500|0|0|0'
							sorting='T'
							oncelldblclick = "OnPLDBLClick()"
							styles='width:100%; height:150'
							/>
						</td>
					</tr>
					
					<tr style="height:3%">
						<td colspan =3 >
							<gw:radio id="chk_status" value="0" onchange="OnTabChange()"> 
							<span value="0">WIP(Semi-Prod)</span>
							<span value="1">MAT-WIP</span>
							<span value="2">Material</span>
							</gw:radio >
						<td  align="right" colspan =2> Wip Item: </td> 
						<td  align="right" colspan =3> <gw:textbox id="txtItemS" text="" styles="width:100%; onenterkey="OnTabChange()" /></td>
						<td align="left"> <gw:imgbtn id="btnSearchD" text="Search" alt="Search" img="search" onclick="OnTabChange()" /></td>
					</tr>
					<tr   style="height:50%" id='SEMI'>
						<td colspan = '12' style='width:100%'>
							<!--<gw:grid id="idGridWIP" 
								header="_PK|Item Code|Item Name|Begining Bal. Qty|In Qty|Prod. Cons. Qty|Ending Bal. Qty|Begining Bal. Amt|In Amt|Prod. Unit Cost|Prod. Cons. Amt|Ending Bal. Amt|Begining Bal. Amt|In Amt|Beginning + In|Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|_In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|_In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt"
								format="0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|-2|1|-2|-2"
								aligns=" |1|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
								defaults="||||||||||||||||||||||||||||" 
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								widths="0|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"
                                styles="width:100%; height:150 " 
                                sorting="T"                                 
                                acceptnulldate="T" 
								oncellclick="Ongrid()"/>-->
							<gw:grid id="idGridWIP" 
								header="_PK|PL|Item Code|Item Name|Begining Bal. Qty|In Qty|Prod. Cons. Qty|Ending Bal. Qty|Begining Bal. Amt|In Amt|Prod. Unit Cost|Prod. Cons. Amt|Ending Bal. Amt|Begining Bal. Amt|In Amt|Beginning + In|Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|_In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|_In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt"
								format="0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
								aligns=" |1|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"

								defaults="|||||||||||||||||||||||||||||" 
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								widths="0|2000|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"
                                styles="width:100%; height:300 " 
                                sorting="T"                                 
                                acceptnulldate="T" 
								oncellclick="Ongrid()"/>
							</td>		
					
					</tr>	
					
					<tr   style="height:50%" id='WIP_MAT'>
						<td colspan = '12' style='width:100%'>
							 <gw:grid id='grdPLPROD'
									header='WIP Item CD|Wip Item Nm|UOM|Convert Qty|MAT Code|Mat Nm|UOM|ST Qty|ST AMT'
									format='0|0|0|1|0|0|0|1|1'
									aligns='0|0|0|0|0|0|0|0|3'
									defaults='||||||||'
									editcol='0|0|0|0|0|0|0|0|0'
									widths='1500|1500|1500|1500|1500|1500|1500|1500|1500'
									sorting='F'
									styles='width:100%; height:300'
									/>
							</td>		
					
					</tr>		
					<tr   style="height:50%" id='MAT'>
						<td colspan = '12' style='width:100%'>
							<gw:grid id='grdMAT'
							header='AC_CD|AC_NM|Mat Cd|Mat Nm|UOM |PL|Warehouse|Begin Qty|In Qty|Tran In|Tran Out|Ex. In|Ex. Out|OUT Qty|End Qty|Begin AMT|In AMT|Tran In AMT|Tran Out AMT|Ex.In AMT|Ex. Out AMT|Out AMT|End AMT'
							format='0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|-2|-2|-2|-2|-2|-2|-2|-2'
							aligns='0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
							defaults='||||||||||||||||||||||'
							editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							widths='1500|2000|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
							sorting='F'
							styles='width:100%; height:300'
							/>
							</td>		
					
					</tr>
					<tr   style="height:10%;" id='MaterialDetail'>
						<td colspan = '12' style = "width: 100%;">
				   	   <table  style="width: 100%; height:100% " border="0" cellpadding="1" cellspacing="0" >
								<tr style="height:10%;">
									<td colspan = '5'>
										Material Detail
									</td>
								</tr>
								<tr style = "height:80%">
									 <td colspan = '5' style='width:50%'>
											<gw:grid id="idGridMaterialDetail" 
												header="_WIP CODE|_WIp Out Qty|Mat Code|Mat Nm|UOM| Begining Qty|MAT In Qty|MAT Total In| Consumption (Out )Qty|WIP End Qty|Mat U/P|Consumption  Amt|End Amt|-
												format="1|1|0|0|1|1|1|1|1|1|-2|-2|-2|-2"
												aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
												defaults="|||||||||||||"
												editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
												widths="0|1500|2000|1000|1500|1500|1500|2500|2000|1500|1500|1500|2000|1500|0"
												styles="width:100%; height:150" 
												sorting="T"  
												autoresize="T"                               
												acceptnulldate="T" />
										</td>	
								</tr>
						</table>
					</td>
					</tr>
					<tr   style="height:25%;" id='MaterialDetail'>
					  <td colspan = '12' style = "width: 100%;">
				   	   <table  style="width: 100%; height:100% " border="0" cellpadding="1" cellspacing="0" >
								<tr style="height:10%;">
									<td colspan = '5'>
									  Cost Detail  
									</td>
								</tr>
								<tr style = "height:80%">
										<td colspan = '6' >
										<gw:tab id="tabCostDetail" style="width: 100%; height: 220; border1px">
											<table id="Cost_Type" name="Cost Type" width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width=100%>
														<gw:grid id="idGridCostdetail" 
															header="_pk|PL|Item|Cost type|Ratio|Convert Qty|Begin Amt|In Amt|Consumption Out|WIP Ending Amt|-
															format="1|0|0|0|0|-2|-2|-2|-2|0"
															aligns="0|0|0|0|0|0|0|0|0|0|0"
															defaults="|||||||||||"
															editcol="0|0|0|0|0|0|0|0|0|0|0"
															widths="0|2000|2000|2000|1500|1500|1500|1500|1500|1500|0"
															styles="width:100%; height:200 " 
															sorting="T"       
															autosize='T' 												
															acceptnulldate="T" />
													</td>
												</tr>
											</table>
											<table id="PL" name="PL" width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width=100%>
														<gw:grid id="idGridCostdetail_PL" 
															header="_pk|PL|Item|Cost type|Ratio|Convert Qty|Begin Amt|In Amt|Consumption Out|WIP Ending Amt|-
															format="1|0|0|0|0|-2|-2|-2|-2|0"
															aligns="0|0|0|0|0|0|0|0|0|0|0"
															defaults="|||||||||||"
															editcol="0|0|0|0|0|0|0|0|0|0|0"
															widths="0|2000|2000|2000|1500|1500|1500|1500|1500|1500|0"
															styles="width:100%; height:200 " 
															sorting="T"       
															autosize='T' 												
															acceptnulldate="T" />
													</td>
												</tr>
											</table>
											<table id="Item" name="Item" width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width=100%>
														<gw:grid id="idGridCostdetail_Item" 
															header="_pk|PL|Item|Cost type|Ratio|Convert Qty|Begin Amt|In Amt|Consumption Out|WIP Ending Amt|-
															format="1|0|0|0|0|-2|-2|-2|-2|0"
															aligns="0|0|0|0|0|0|0|0|0|0|0"
															defaults="|||||||||||"
															editcol="0|0|0|0|0|0|0|0|0|0|0"
															widths="0|2000|2000|2000|1500|1500|1500|1500|1500|1500|0"
															styles="width:100%; height:200 " 
															sorting="T"       
															autosize='T' 												
															acceptnulldate="T" />
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
 <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle();" />
<gw:textbox id="txt_header_pk" styles="display:none; " />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtACPK" styles="display:none; " />
<gw:textbox id="txtPLPK_S" styles="display:none; " />
<gw:textbox id="txtPLPK_S_1" styles="display:none; " />
<gw:textbox id="txtPLPK" styles="display:none; " />
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtLang" styles="display:none; " text="<%=Session("SESSION_LANG") %>"/>
<gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
<gw:textbox id="txtPhase" styles="display:none; " />
<gw:textbox id="txtWipDetail_Pk" styles="display:none;" />
<gw:textbox id="txtGroup_code" styles="display:none; " />
<gw:textbox id="txtGroupView" styles="display:none; " />

</body>
</html>
