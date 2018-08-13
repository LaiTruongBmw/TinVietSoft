<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var flag ="";
function BodyInit()
{
    System.Translate(document);
    <%=CtlLib.SetGridColumnComboFormat("grGrid", 1,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0250' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",11,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0030' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",12,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0270' AND A.USE_IF = 1")%>;
    
    <%=CtlLib.SetGridColumnComboFormat("grGrid",14,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0240' AND A.USE_IF = 1 ORDER BY A.CODE_NM")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",15,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0020' AND A.USE_IF = 1 ")%>;
    
    <%=CtlLib.SetGridColumnComboFormat("GridRight",0,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK032' and a.del_if = 0 and b.del_if = 0")%>;
	<%=CtlLib.SetGridColumnComboFormat("GridRight_2",0,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK032' and a.del_if = 0 and b.del_if = 0")%>;
    <%=CtlLib.SetGridColumnComboFormat("GridRight",7,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK042' and a.del_if = 0 and b.del_if = 0")%>;
    BindingDataList();
    lstLevel.SetDataText("");
    grGrid.GetGridControl().FrozenCols = 8;
	//OnToggle1();
    onSearch(0);
}
//-------------------------------------------------------------
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="100%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="70%";
            right.style.width  ="70%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="100%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="70%";
            right.style.width  ="70%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//-------------------------------------------------------------
function BindingDataList()
{ 
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode_1('ACBG0020','','') FROM DUAL")%>";
    var ls_data3    = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0020','','') FROM DUAL")%>||";
	var ls_data2_S    = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode_1('ACBG0020','','') FROM DUAL")%>|ALL|Select All";
    var ls_print = "Data|Y|Auto|N|Manual"; 
    lstPrintSEQ.SetDataText(ls_print);
    lstCompany.SetDataText(ls_data);
    lstFormtype.SetDataText(ls_data2);
	lstCompanyS.SetDataText(ls_data);
    lstFormtypeS.SetDataText(ls_data2_S);
    lstLevel.SetDataText(ls_data3);
	<%=CtlLib.SetGridColumnComboFormat("grdSearch",1,"SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id ='ACBG0020' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.CODE_NM")%>;
    //btGenAuto.style.display = 'none';
	OnClick_Auto();
    txtac_nm.SetEnable(false);
    txt_lang.SetDataText('ENG');
    txtac_cd.GetControl().focus();
    
}
//-------------------------------------------------------------
function OnClick_Auto()
{
    if (lstPrintSEQ.GetData() == 'Y')
    {
        btGenAuto.style.display = '';	
    }
    else
    {
        btGenAuto.style.display = 'none';	
    }
}
//-------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if (key > 47 && key < 58)
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}
//-------------------------------------------------------------
function onNew(obj)
{
    switch(obj)
    {
        case 0:
            dso_control_mst.StatusInsert();
	    break;
		case 1:
			if(txtMasterPK_UP.text !="")
			{
				grGrid.DeselectRow(grGrid.selrow);
				grGrid.AddRow();
				grGrid.SelectRow(grGrid.rows - 1);
				grGrid.SetGridText( grGrid.rows - 1 ,22,txtMasterPK_UP.text);
				grGrid.SetGridText( grGrid.rows - 1 ,20, lstFormtype.GetData());
				grGrid.SetGridText( grGrid.rows - 1 ,21, lstCompany.GetData());
	        }
			else
			{
				alert("Please,save master to addnew detail.");
				return;
			}
	    break;
	    case 2:
	    
			if(txtMaster_pk.text !="")
			{
				var formular = grGrid.GetGridData(grGrid.row, 11);
				var _header =  grGrid.GetGridData(grGrid.row, 4);
				 if (formular == 'C')
				 {
					 var curRow = 1;
					 var runRow=curRow;
					 var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_2.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value;	
					 aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
					
					if (aValue.length > 0)
						{
							/*for(i=0; i<aValue.length; i++)
							{
							    var tmp = aValue[i];
								if (tmp[3] != 0)
								{
									if(runRow >= grdCFData.rows)
									{               
										grdCFData.AddRow();
										grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
										grdCFData.SetGridText(runRow, 5, tmp[1]);//Code
										grdCFData.SetGridText(runRow, 6, tmp[2]);//Account Code
										grdCFData.SetGridText(runRow ,3, txtMaster_pk.text); 
										grdCFData.SetGridText(runRow ,1, _header);
										grdCFData.SetGridText(runRow ,13, lstFormtype.GetData());  
									}
									else
									{
										alert('2');
										grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
										grdCFData.SetGridText(runRow, 5, tmp[1]);//Code
										grdCFData.SetGridText(runRow, 6, tmp[2]);//Account Code
									} 
									runRow++;
								}
							}*/
							for(i=0; i<aValue.length; i++)
							{
							    var tmp = aValue[i];
								if (tmp[3] != 0)
								{
									              
										grdCFData.AddRow();
										grdCFData.SetGridText(grdCFData.rows - 1, 4, tmp[3]);//Account PK
										grdCFData.SetGridText(grdCFData.rows - 1, 5, tmp[1]);//Code
										grdCFData.SetGridText(grdCFData.rows - 1, 6, tmp[2]);//Account Code
										grdCFData.SetGridText(grdCFData.rows - 1 ,3, txtMaster_pk.text); 
										grdCFData.SetGridText(grdCFData.rows - 1 ,1, _header);
										grdCFData.SetGridText(grdCFData.rows - 1 ,13, lstFormtype.GetData());  
									
								}
							}
						}
					
				 }
				 else if(formular != "F" && formular != "C")
				 {  
					 var curRow = GridRight.row;
					 var runRow=curRow;
					 var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_2.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value;	
					 aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
					 if ( aValue != null ) 
					 {
						var tmp = new Array();
						tmp = aValue[0];
						txtac_pk.text = tmp[3];  
						 if(!CheckDuplicateDetail())
						 {                                       
							return;
						 }
						 else
						 {
							GridRight.AddRow();
							GridRight.SetGridText(GridRight.rows - 1,0,"+");
							GridRight.SetGridText(GridRight.rows - 1, 3, tmp[3]);    //ACPK
							GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
							GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
							GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_pk.text);   
							if (aValue.length > 1)
							{
							
								for(var i=1; i<aValue.length; i++)
								{
									var tmp = new Array();
									tmp = aValue[i];
								   
									if (tmp[3] != 0)
									{
										GridRight.AddRow();
										GridRight.SetGridText(GridRight.rows - 1, 0, "+");    //ACPK
										GridRight.SetGridText(GridRight.rows - 1, 3, tmp[3]); 
										GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
										GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
										GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_pk.text);   
								   }
							   }
						   }
						 }
					 }
				 
				 }
				 else
				 {
					 var curRow = GridRight.row;
					 var runRow=curRow;
					 var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_3_new.aspx?company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData()+ "&p_tac_kafinanceform_mst_pk="+txtMasterPK_UP.text;	
					 aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
					 if ( aValue != null ) 
					 {
						var tmp = new Array();
						tmp = aValue[0];
						txtFormular.text = tmp[5];  
						 if(!Duplicate())
						 {                                       
							return;
						 }
						 else
						 {
							GridRight.AddRow();
							GridRight.SetGridText(GridRight.rows - 1,0,"+");
							GridRight.SetGridText(GridRight.rows - 1, 6, tmp[5]);    
							GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
							GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
							GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_pk.text);   
							if (aValue.length > 1)
							{
							
								for(var i=1; i<aValue.length; i++)
								{
									var tmp = new Array();
									tmp = aValue[i];
								   
									if (tmp[5] != 0)
									{
										GridRight.AddRow();
										GridRight.SetGridText(GridRight.rows - 1,0,"+");
										GridRight.SetGridText(GridRight.rows - 1, 6, tmp[5]);    
										GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
										GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
										GridRight.SetGridText( GridRight.rows - 1, 4, txtMaster_pk.text);   
								   }
							   }
						   }
						 }
					 }
				 }
					
		}
		else
		{
			alert("Please select Code Master!!")
		}
	    break;
		case 3:
	    
	            if(txtMaster_pk.text !="")
	            {
	                //GridRight.AddRow();
    	            
	                //GridRight.SetGridText( GridRight.rows - 1, 5, txtMaster_pk.text); 
	                /*var i ;
	                var ls_accd_arr = "";
	                for(i = 1; i < GridRight.rows; i++)
	                {
	                    ls_accd_arr += GridRight.GetGridData(i, 1);
	                }   */   
	                var formular = grGrid.GetGridData(grGrid.row, 11);
	                
	                 /*if(formular != "F")
	                 {  
	                             
	                             var curRow = GridRight_2.row;
                                 var runRow=curRow;
                                 var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_2.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value;	
                                 aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
	                             if ( aValue != null ) 
	                             {
                                        var tmp = new Array();
                                        tmp = aValue[0];
                                        txtac_pk.text = tmp[3];  
	                                     if(!CheckDuplicateDetail_2())
                                         {                                       
                                            return;
                                         }
                                         else
                                         {
                                            
                                                    GridRight_2.AddRow();
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1,0,"+");
                                                   GridRight_2.SetGridText(GridRight_2.rows - 1, 3, tmp[3]);    //ACPK
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1, 1, tmp[1]);    //Account Code
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1, 2, tmp[2]);    //Account Name
                                                     
                                                    GridRight_2.SetGridText( GridRight_2.rows - 1, 4, txtMaster_pk.text);   
                                                    if (aValue.length > 1)
	                                                {
                                        	        
                                                        for(var i=1; i<aValue.length; i++)
                                                        {
                                                            var tmp = new Array();
                                                            tmp = aValue[i];
                                        	               
                                                            if (tmp[3] != 0)
                                                            {
                                                                GridRight_2.AddRow();
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1, 0, "+");    //ACPK
                                                               GridRight_2.SetGridText(GridRight_2.rows - 1, 3, tmp[3]); 
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1, 1, tmp[1]);    //Account Code
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1, 2, tmp[2]);    //Account Name
                                                               
                                                               // txtMaster_pk.SetDataText(GridRight.GetGridData(GridRight.row,5));  
                                                                GridRight_2.SetGridText( GridRight_2.rows - 1, 4, txtMaster_pk.text);   
                                                           }
                                                       }
	                                               }
	                                     }
        	                     }
        	         
        	         }
        	         else
        	         {*/
        	                     var curRow = GridRight_2.row;
                                 var runRow=curRow;
                                 var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_4_new.aspx?company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData()+ "&p_tac_kafinanceform_mst_pk="+txtMasterPK_UP.text;	
                                 aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
	                             if ( aValue != null ) 
	                             {
                                        var tmp = new Array();
                                        tmp = aValue[0];
                                        txtFormular.text = tmp[5];  
	                                     if(!Duplicate_2())
                                         {                                       
                                            return;
                                         }
                                         else
                                         {
                                           //alert(tmp[3]);
                                                    GridRight_2.AddRow();
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1,0,"+");
													GridRight_2.SetGridText(GridRight_2.rows - 1, 6, tmp[5]);    
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1, 1, tmp[1]);    //Account Code
                                                    GridRight_2.SetGridText(GridRight_2.rows - 1, 2, tmp[2]);    //Account Name
                                                    //GridRight_2.SetGridText(GridRight_2.rows - 1, 3, tmp[5]); 
                                                   // GridRight.SetGridText(GridRight.rows - 1, 4, tmp[6]); 
                                                    GridRight_2.SetGridText( GridRight_2.rows - 1, 4, txtMaster_pk.text);   
													//alert(aValue.length);
                                                    if (aValue.length > 1)
	                                                {
                                        	        
                                                        for(var i=1; i<aValue.length; i++)
                                                        {
                                                            var tmp = new Array();
                                                            tmp = aValue[i];
                                        	               //alert(tmp[5]);
                                                            if (tmp[5] != 0)
                                                            {
                                                                
                                                                GridRight_2.AddRow();
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1,0,"+");
																GridRight_2.SetGridText(GridRight_2.rows - 1, 6, tmp[5]);    
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1, 1, tmp[1]);    //Account Code
                                                                GridRight_2.SetGridText(GridRight_2.rows - 1, 2, tmp[2]);    //Account Name
                                                                //GridRight_2.SetGridText(GridRight_2.rows - 1, 3, tmp[5]); 
                                                               // GridRight.SetGridText(GridRight.rows - 1, 4, tmp[6]); 
                                                                GridRight_2.SetGridText( GridRight_2.rows - 1, 4, txtMaster_pk.text);   
                                                           }
                                                       }
	                                               }
	                                     }
        	                     }
        	         //}
        	            
        	}
	        else
	        {
	            alert("Please select Code Master!!")
	        }
	    break;
	}
}

function setRowNo()
{
    for(i=1;i<grdCFData.rows;i++)
   {
        grdCFData.SetGridText(i,2,i);
   } 
}
//-------------------------------------------------------------
function onBatchEntry()
{
    if(confirm('Are you sure you want to batch entry ?'+'\n'+''))
	{
        lstLevel.SetDataText("");
        dso_sel_financeform_batch_entry.Call("SELECT");
    }
}
//-------------------------------------------------------------
function ChangeColor()
{
    var ctrl = grGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grGrid.GetGridData(i,12)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 20) = false;
	        grGrid.SetCellBold(i, 1, i, 20, true);
        }
        else if (grGrid.GetGridData(i,12)== "I")
        {
	        grGrid.SetCellBold(i, 1, i, 20, false);
	        ctrl.Cell(14, i, 1, i, 20) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 20) = false;
	        grGrid.SetCellBold(i, 1, i, 20, false);
	    }
	    grGrid.SetCellBgColor(i, 0, i, 20, Number(grGrid.GetGridData(i, 14)));
	}
}
//-------------------------------------------------------------
function onSearch(obj)
{
    switch(obj)
    {
		case 0:
            dso_search.Call("SELECT");
        break;
		case 'MST':
			flag='search';
			txtMasterPK_UP.text = grdSearch.GetGridData(grdSearch.row, 0);
            dso_control_mst.Call("SELECT");
        break;
        case 1:
            dso_sel_grd_financeform.Call("SELECT");
        break;
        case 2:
		    if (grGrid.GetGridData(grGrid.row,11) != 'C')
			{
				grdCFData.style.display='none';
				GridRight.style.display='';
				var icol,irow;
				icol=grGrid.col;
				irow=grGrid.row;
				txtMaster_pk.SetDataText(grGrid.GetGridData(grGrid.row,0));
				txtL.SetDataText(grGrid.GetGridData(grGrid.row,11));
				flag='search';
				dso_gridDetail.Call('SELECT');
			}else{
				grdCFData.style.display='';
				GridRight.style.display='none';
				txtMaster_pk.SetDataText(grGrid.GetGridData(grGrid.row,0));
				txtL.SetDataText(grGrid.GetGridData(grGrid.row,11));
				datCFDetail.Call('SELECT');
			}
        break;
		case 3:
            var icol,irow;
            icol=grGrid.col;
            irow=grGrid.row;
            txtMaster_pk.SetDataText(grGrid.GetGridData(grGrid.row,0));
			txtL.SetDataText(grGrid.GetGridData(grGrid.row,11));
            
           flag='search';
           dso_gridDetail_2.Call('SELECT');
        break;
    }
}

function OnChangeList()
{
    grGrid.ClearData();
    onSearch(1);
}
//-------------------------------------------------------------
function UpClick()
{
	var lb_flag
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        grGrid.UpRow();
	}
	else
	{
		alert('  Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển');
	}
}
//-------------------------------------------------------------
function DownClick()
{
	var lb_flag
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        grGrid.DownRow();
	}
	else
	{
		alert('  Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển');
	}
}
//-------------------------------------------------------------
function onSave(obj)
{
    switch(obj)
    {
		 case 0:
                dso_control_mst.Call();
        break;
        case 1:
			if(txtMasterPK_UP.text !="")
			{
				if (CheckItemLength())
				{
					for(var i=1;i<grGrid.rows;i++){
						 if(grGrid.GetGridData(i,20) == ""){
							grGrid.SetGridText( i ,20, lstFormtype.GetData());   
							grGrid.SetGridText( i ,21, lstCompany.GetData());
						 }
					}
					flag='save';
					dso_sel_grd_financeform.Call();
				}
			}
			else
			{
				alert("Please,save master to save detail.");
				return;
			}
        break;
        case 2:
		    if (grGrid.GetGridData(grGrid.row, 11) != 'C' )
			{
				dso_gridDetail.Call();
			}else{
				var ctrl 	= grdCFData.GetGridControl();
				var rownum 	= Number(ctrl.Row);
				var rownums = Number(ctrl.Rows);
				var valid =1;
				for(i=1; i<rownums; i++)
				{
					if(grdCFData.GetRowStatus(i)!=112) //DELETE
					{
						if(grdCFData.GetGridData(i,4)=="")
						{
							alert("Debit Account at row "+grdCFData.GetGridData(i,2) +"is empty "+'\n'+ "Nhập tài khoản NỢ ở dòng "+grdCFData.GetGridData(i,2));
							valid =0;
							break;
						}
						if(grdCFData.GetGridData(i,7)=="")
						{
							alert("Credit Account at row "+ grdCFData.GetGridData(i,2) +"is empty"+'\n'+"Nhập tài khoản CÓ ở dòng "+grdCFData.GetGridData(i,2));
							valid =0;
							break;
						}
					}
					
				}
			   if (valid==1)
			   {
					datCFDetail.Call();
			   } 
			}
        break;
		case 3:
            dso_gridDetail_2.Call();
        break;
    }
    
}
//-------------------------------------------------------------
function OnChangeLevel()
{
	dso_sel_grd_financeform.Call("SELECT");
}
//-------------------------------------------------------------
function Reset_Acc()
{
	txtac_cd.SetDataText('');
	txtac_nm.SetDataText('');
	txtac_pk.SetDataText('');
}
//-------------------------------------------------------------
function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60080010_acct_popup";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtac_cd.SetDataText(o[0]);
			txtac_nm.SetDataText(o[1]);
			txtac_pk.SetDataText(o[3]);
		}
    }
}
//-------------------------------------------------------------
function RowClick()
{
    var ctrl = grGrid.GetGridControl();
    var curRow = grdCFData.row;
        var runRow=curRow;
		var _header =  grGrid.GetGridData(grGrid.row, 4);
	/*if ((event.col==6) ||(event.col==7) && grGrid.GetGridData(grGrid.row, 1)=='01')//Debit
        {
            var fpath   = System.RootURL + "/standard/forms/60/08/60080010_popup_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60080010_all_account";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMaster_pk.text); 
	                        grdCFData.SetGridText(runRow ,1, _header);
	                        grdCFData.SetGridText(runRow ,13,lstFormtype.GetData());  
						}
						else
						{
						    grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMaster_pk.text);  
	                        grdCFData.SetGridText(runRow ,1, _header);
	                        grdCFData.SetGridText(runRow ,13, lstFormtype.GetData());   
						} 
						runRow++;
	                }
	            }
	        }
	    }
        }
/**/		
    if (event.col ==6|| event.col ==7 && (grGrid.GetGridData(event.row, 1) == "01" || grGrid.GetGridData(event.row, 1) == "05" ))
	{   
        if (grGrid.GetGridData(event.row, 1) == "01")
        {
            var fpath = System.RootURL + "/standard/forms/60/08/60080020_popup_fs.aspx?comm_code=" + "" + "&dsqlid=ac_sel_60080020_acc_fs" + "&val1=" + lstFormtype.GetData() + "&val2=" + lstCompany.GetData()+ "&tac_kafinanceform_mst_pk=" +txtMasterPK_UP.text;
			aValue    = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');
			if ( aValue != null )  
			{
				if (aValue.length > 0)
				{
					var j = 0;
					for(i=0; i<aValue.length; i++)
					{
						var tmp = aValue[i];
						if (tmp[0] != 0)
						{
							if (j > 0) 
							{
								grGrid.AddRow();
								grGrid.SetGridText(grGrid.rows - 1, 1, '01');
								grGrid.SetGridText(grGrid.rows - 1, 5, tmp[3]);
								grGrid.SetGridText(grGrid.rows - 1, 6, tmp[0]);
								grGrid.SetGridText(grGrid.rows - 1, 7, tmp[1]);
								grGrid.SetGridText(grGrid.rows - 1, 8, tmp[6]);
								grGrid.SetGridText(grGrid.rows - 1, 9, tmp[7]);
								grGrid.SetGridText(grGrid.rows - 1, 3, tmp[0].substr(0, 3));
								grGrid.SetGridText( grGrid.rows - 1, 20, lstFormtype.GetData());
								grGrid.SetGridText( grGrid.rows - 1, 21, lstCompany.GetData());
								grGrid.SetGridText( grGrid.rows - 1, 22, txtMasterPK_UP.text);
								j = j + 1;
							}
							else
							{
								grGrid.SetGridText(event.row, 1, '01');
								grGrid.SetGridText(event.row, 5, tmp[3]);
								grGrid.SetGridText(event.row, 6, tmp[0]);
								grGrid.SetGridText(event.row, 7, tmp[1]);
								grGrid.SetGridText(event.row, 8, tmp[6]);
								grGrid.SetGridText(event.row, 9, tmp[7]);
								grGrid.SetGridText(event.row, 3, tmp[0].substr(0, 3));
								grGrid.SetGridText(event.row, 20, lstFormtype.GetData());
								grGrid.SetGridText(event.row, 21, lstCompany.GetData());
								grGrid.SetGridText(event.row, 22, txtMasterPK_UP.text);
								j = j + 1;
							}
							if (tmp[4] == 'D')
							{
								grGrid.SetGridText( event.row, 11, "L");
							}
							else
							{
								grGrid.SetGridText( event.row, 11, "R");
							}
						}
					}
				}
			}
        }
        else if (grGrid.GetGridData(event.row, 1) == "05")
        {
			var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var aValue = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
			if ( aValue != null )  
			{
				if (aValue[0] != 0)
				{
					/*var j = 0;
					for(i=0; i<aValue.length; i++)
					{
						var tmp = aValue[i];
						if (tmp[0] != 0)
						{
							if (j > 0) 
							{
								grGrid.AddRow();
								grGrid.SetGridText(grGrid.rows - 1, 1, '01');
								grGrid.SetGridText(grGrid.rows - 1, 5, tmp[2]);//pk
								grGrid.SetGridText(grGrid.rows - 1, 6, tmp[1]);//code
								grGrid.SetGridText(grGrid.rows - 1, 7, tmp[3]);//name
								//grGrid.SetGridText(grGrid.rows - 1, 8, tmp[6]);
								//grGrid.SetGridText(grGrid.rows - 1, 9, tmp[7]);
								//grGrid.SetGridText(grGrid.rows - 1, 3, tmp[1].substr(0, 3));
								grGrid.SetGridText( grGrid.rows - 1, 20, lstFormtype.GetData());
								grGrid.SetGridText( grGrid.rows - 1, 21, lstCompany.GetData());
								grGrid.SetGridText( grGrid.rows - 1, 22, txtMasterPK_UP.text);
								j = j + 1;
							}
							else
							{*/
							
								grGrid.SetGridText(event.row, 1, '05');
								grGrid.SetGridText(event.row, 5, aValue[2]);
								grGrid.SetGridText(event.row, 6, aValue[0]);
								grGrid.SetGridText(event.row, 7, aValue[1]);
								//grGrid.SetGridText(event.row, 8, tmp[6]);
								//grGrid.SetGridText(event.row, 9, tmp[7]);
								//grGrid.SetGridText(event.row, 3, tmp[1].substr(0, 3));
								grGrid.SetGridText(event.row, 20, lstFormtype.GetData());
								grGrid.SetGridText(event.row, 21, lstCompany.GetData());
								grGrid.SetGridText(event.row, 22, txtMasterPK_UP.text);
								//j = j + 1;
							//}
							
						//}
					//}
				}
			}
		}
        
    }
    else if(event.col == 7 || event.col == 8 || event.col == 9)
    {
		var fpath   = System.RootURL + "/standard/forms/60/08/60080010_popup_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60080010_all_account";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow , 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMaster_pk.text);  
	                        grdCFData.SetGridText(runRow ,1, _header);  
	                        grdCFData.SetGridText(runRow ,13, lstFormtype.GetData());  
						}
						else
						{
						    grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMaster_pk.text);  
	                        grdCFData.SetGridText(runRow ,1, _header);   
	                        grdCFData.SetGridText(runRow ,13, lstFormtype.GetData());  
						} 
						runRow++;
	                }
	            }
	        }
	    }
        if (grGrid.GetGridData(event.row, 1) == "01")
        {
            grGrid.SetColEdit(7, 0);
		    grGrid.SetColEdit(8, 0);
            grGrid.SetColEdit(9, 0);
        }
        else
        {
            grGrid.SetColEdit(7, 1);
		    grGrid.SetColEdit(8, 1);
            grGrid.SetColEdit(9, 1);
        }
    }
   
   if((lstFormtype.value=="24" ) && (event.col ==16)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
         var fpath = System.RootURL + "/standard/forms/60/08/60080010_popup_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   
   if((lstFormtype.value=="93" ) && (event.col ==16)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
         var fpath = System.RootURL + "/standard/forms/60/08/60080010_popup_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   if((lstFormtype.value=="23" ) && (event.col ==18)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
        
         var fpath = System.RootURL + "/standard/forms/60/08/60080010_popup_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   if((lstFormtype.value=="92" ) && (event.col ==18)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
        
         var fpath = System.RootURL + "/standard/forms/60/08/60080010_popup_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   setRowNo();
}
//-------------------------------------------------------------
function Trim(sString)
{
	while (sString.substring(0,1) == ' ')
	{
		sString = sString.substring(1, sString.length);
	}
	while (sString.substring(sString.length-1, sString.length) == ' ')
	{
		sString = sString.substring(0,sString.length-1);
	}
	return sString;
}
//-------------------------------------------------------------
function Gen_Auto()
{
    ctrl = grGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 0)
	{
	    for (i = 1; i <= rows; i++)
	    {
	        grGrid.SetGridText( i , 2, i*10);
	    }
	}
}

//-------------------------------------------------------------
function onDelete(obj) 
{	
    switch(obj)
    {
        case 0:
	        if(txtMasterPK_UP.text !="")
			{
				if (confirm('  Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa?'))
				{
					flag ="delete";
					dso_control_mst.StatusDelete();
					dso_control_mst.Call();
				}
			}      
	        else
	        {
		        alert('Please select date for delete!!!'+'\n'+'Bạn hãy chọn thong tin để xóa');
	        }
	   break;
		case 1:
	        var ctrl 	= grGrid.GetGridControl();
	        var rownum 	= Number(ctrl.Row);
	        var rownums = Number(ctrl.Rows);
	        if ((rownums > 1) && (rownum > 0))
	        {
		        if(GridRight.rows>1)
		        {
		            alert("Please delete all rows detail");
			      
		        }
		        else
		        {
		              for(i=1; i<rownums; i++)
			        {
				        if (ctrl.isSelected(i) == true)
                        {
				            grGrid.DeleteRow();
				        }
			        }
		        }
	        }
	        else
	        {
		        alert('Please select row for delete!!!'+'\n'+'Bạn hãy chọn 1 dòng để xóa');
	        }
	   break;
	   case 2:
	     if (grGrid.GetGridData(grGrid.row, 11) != 'C' )
		 {
	       // var ctrl 	= GridRight.GetGridControl();
	        //var rownum 	= Number(ctrl.Row);
	        //var rownums = Number(ctrl.Rows);
	        //if ((rownums > 1) && (rownum > 0))
	        //{
			//        for(i=1; i<rownums; i++)
			 //       {
			//	        if (ctrl.isSelected(i) == true)
            //            {
							if(confirm('Are you sure you want to delete?'))
							{
								GridRight.DeleteRow();
								dso_gridDetail.Call();
							}
			//	        }
			//        }
		        
	        //}
	        //else
	        //{
		    //    alert('Please select row for delete!!!'+'\n'+'Bạn hãy chọn 1 dòng để xóa');
	        //}
		}else{
			var ctrl 	= grdCFData.GetGridControl();
			var rownum 	= Number(ctrl.Row);
			var rownums = Number(ctrl.Rows);
			
			if ((rownums > 1) && (rownum > 0))
			{
				if (confirm("Are you sure you want to delete?"))
				{
					for(i=1; i<rownums; i++)
					{
						if (ctrl.isSelected(i) == true)
						{
							grdCFData.DeleteRow();
						}
					}
				}
			}
			else
			{
				alert("Please select row for delete.");
			}
		}
		
	   break;
	   case 3:
	    var ctrl 	= GridRight_2.GetGridControl();
	        var rownum 	= Number(ctrl.Row);
	        var rownums = Number(ctrl.Rows);
			
	        if ((rownums > 1) && (rownum > 0))
	        {
				if(confirm('Are you sure you want to delete ?'))
				{
			        for(i=1; i<rownums; i++)
			        {
				        if (ctrl.isSelected(i) == true)
                        {
				            GridRight_2.DeleteRow();
							onSave(3);
				        }
			        }
		        }
	        }
	        else
	        {
		        alert('Please select row for delete!!!'+'\n'+'Bạn hãy chọn 1 dòng để xóa');
	        }
	   break;
   }
}
//-------------------------------------------------------------
function onReport()
{
    var  url= System.RootURL + "/standard/reports/gf/ka/gfka00010_Trial_Balance.aspx?p_compk="+lstCompany.value+"&p_accd="+txtac_cd.text
        +"&p_level=" + lstLevel.value + "&p_formtype=" + lstFormtype.value + '&p_frm_type=' + escape(lstFormtype.GetText());
        System.OpenTargetPage(url);
}
//-------------------------------------------------------------
function CheckDuplicateDetail()
{
    
    for(var i = 1; i < GridRight.rows; i++)
    {
        
        if(GridRight.GetGridData(i, 4) == txtac_pk.text)
        {
            
            alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//----------------------------------------------------------------------
function CheckDuplicateDetail_2()
{
    
    for(var i = 1; i < GridRight_2.rows; i++)
    {
        
        if(GridRight_2.GetGridData(i, 4) == txtac_pk.text)
        {
            
            alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//----------------------------------------------------------------------
function Duplicate()
{
    for(var i = 1; i < GridRight.rows; i++)
    {
        
        if(GridRight.GetGridData(i, 7) == txtFormular.text)
        {
            
             alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//--------------------------------------------------------------------------
function Duplicate_2()
{
    for(var i = 1; i < GridRight_2.rows; i++)
    {
        
        if(GridRight_2.GetGridData(i, 7) == txtFormular.text)
        {
            
             alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//--------------------------------------------------------------
function onPopup()
{
	var path = System.RootURL + '/standard/forms/60/08/60080010_popup.aspx?com_pk='+ lstCompany.GetData();
	var o = System.OpenModal( path , 800 , 300 , 'resizable:yes;status:yes');
	if ( o != null )
	{
		if(o[0] != 0)
		{
			//idcause.SetDataText(o[0]);
			//idData_Dso_TrApprCancell.Call("SELECT");
		}
	}
}
//-------------------------------------------------------------
function CheckItemLength()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= ctrl.Rows;
	for(i = 1; i < rownum; i++)
	{
	    if(grGrid.GetGridData(i, 1)== "01")
		{
			if (grGrid.GetGridData(i, 5) == "")
			{
				alert('Please enter Code at row ' + i + ' is empty ...'+'\n'+'    Code tại dòng '+ i + ' không được rỗng.');
				grGrid.SelectRow(i);
				return false;
			}
			if (grGrid.GetGridData(i, 2) == "")
			{
				alert('Please input or gen auto SEQ at row ' + i + '.'+'\n'+'    Print SEQ tại dòng '+ i + ' không được rỗng.');
				grGrid.SelectRow(i);
				return false;
			}
		}
	}
   	return true;
}
//-------------------------------------------------------------
function onSetStatus()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= ctrl.Rows;
    for (i = 1; i < rownum; i++)
    {
        grGrid.SetRowStatus(i, 0x20);
    }
    ChangeColor();
}
//-------------------------------------------------------------
function OnSelectAcc()
{
    if (GridRight.col=="1")
    {
        var formular = grGrid.GetGridData(grGrid.row, 11);
                 if(formular != "F")
                 {
                            //var curRow = GridRight.row;
                           // var runRow=curRow;
                    var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_4.aspx?company_pk="+lstCompany.value ;	    
                    aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	
                     if ( aValue != null ) 
                     {
                         txtac_pk.text = aValue[3];  
                         if(!CheckDuplicateDetail())
                         {                                       
                                   return;
                         }
                        else
                        {        
                            GridRight.SetGridText(GridRight.row, 3, aValue[3]);    //ACPK
                            GridRight.SetGridText(GridRight.row, 1, aValue[1]);    //Account Code
                            GridRight.SetGridText(GridRight.row, 2, aValue[2]);    //Account Name
                            GridRight.SetGridText( GridRight.row, 4, txtMaster_pk.text); 
							
                       }          
                  }      
	            } 
                else
                {
                        
                         var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_5.aspx?company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData();	
                         aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
                         if ( aValue != null ) 
                         {
                             txtFormular.text = aValue[5];  
                             if(!Duplicate())
                             {                                       
                                return;
                             }
                             else
                             {
                                //GridRight.AddRow();
                                GridRight.SetGridText(GridRight.row, 0,"+");
                               GridRight.SetGridText(GridRight.row, 6, aValue[5]);    //ACPK
                                GridRight.SetGridText(GridRight.row, 1, aValue[1]);    //Account Code
                                GridRight.SetGridText(GridRight.row, 2, aValue[2]);    //Account Name
                                GridRight.SetGridText(GridRight.row, 4, txtMaster_pk.text); 
                             }
                      }
                 }   
    }  
}
//---------------------------------------------------------------------
function OnSelectAcc_2()
{
    if (GridRight_2.col=="1" || GridRight_2.col=="2")
    {
		var fpath   = System.RootURL + "/standard/forms/60/08/60080020_popup_5.aspx?company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData();	
		aValue      =   System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');	    
		if ( aValue != null ) 
		{
			txtFormular.text = aValue[5];  
			if(!Duplicate_2())
			{                                       
				return;
			}
			else
			{
				//GridRight.AddRow();
				GridRight_2.SetGridText(GridRight_2.row, 0,"+");
				GridRight_2.SetGridText(GridRight_2.row, 6, aValue[5]);    //ACPK
				GridRight_2.SetGridText(GridRight_2.row, 1, aValue[1]);    //Account Code
				GridRight_2.SetGridText(GridRight_2.row, 2, aValue[2]);    //Account Name
				GridRight_2.SetGridText(GridRight_2.row, 4, txtMaster_pk.text); 
			}
		}
    }  
}
//--------------------------------------------------------------------------------
function OnToggle1()
{
	var left  = document.all("t-left1");    
	var right = document.all("t-left");   
	
	if(imgArrow.status == "expand")
	{
		left.style.display="none";       
		imgArrow.status = "collapse";
		right.style.width="50%";
		imgArrow.src = "../../../system/images/button/next.gif";
	}
	else
	{
		left.style.display="";
		imgArrow.status = "expand";
		right.style.width="50%";
		imgArrow.src = "../../../system/images/button/previous.gif";
	}

}
//-------------------------------------------------------------
function onEnter()
{
    dso_pro_acc.Call();
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_control_mst')
	{
		
			dso_sel_grd_financeform.Call("SELECT");
	}
	if(obj.id=='dso_copy_form_design')
	{
			dso_control_mst.Call("SELECT");
	}	
	if(obj.id=='dso_sel_grd_financeform')
	{
		ChangeColor();
		//if(f_lag=='save')
		//{
		//	dso_gridDetail.Call('SELECT');
		//}
	}
	if(obj.id=='dso_gridDetail')
	{
		if(flag=='search')
		{
			dso_gridDetail_2.Call('SELECT');
		}
	}
}
//-------------------------------------------------------------
function OnCopy()
{
	if(txtMasterPK_UP.text !="")
	{
		if(dtYearFrmCopy.value=="" || dtYearToCopy.value=="")
		{
			alert("Please,choose year to copy.");
			return;
		}
		if (confirm('Are you sure you want copy data?'))
		{
			dso_copy_form_design.Call();
		}
	}
	else
	{
		alert("Please,choose data to copy.");
		return;
	}
}
//-----------------------------------------------------------------------------
</script>

<body style="margin: 0; padding: 0;">
 <gw:data id="dso_search" onreceive="">
        <xml>
            <dso type="grid" function="ac_sel_60080020_search" > 
                <input bind="grdSearch">
                    <input bind="lstCompanyS"/>
                    <input bind="lstFormtypeS"/>
                </input>
                <output bind="grdSearch"/>
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------------->
	<gw:data id="dso_control_mst" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5" function="ac_sel_60080020_mst" procedure="ac_upd_60080020_mst" > 
            <inout>
                <inout bind="txtMasterPK_UP" />               
                <inout bind="lstCompany" />
                <inout bind="lstFormtype" />
                <inout bind="dtYearFrm" />
                <inout bind="dtYearTo" />    					
				<inout bind="Description" />
            </inout>
        </dso> 
    </xml> 
</gw:data>
    <gw:data id="dso_sel_grd_financeform" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="ac_sel_60080020" procedure="ac_upd_60080020">
                <input bind="grGrid">
                    <input bind="txtMasterPK_UP"/>
					<input bind="lstCompany"/>
					<input bind="txtac_cd"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_sel_financeform_batch_entry" onreceive="onSetStatus()">
        <xml>
            <dso type="grid" function="ac_sel_60080020_batch_entry" >
                <input bind="grGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstFormtype"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_pro_acc" onreceive="onSearch(1)">
        <xml> 
            <dso type="process" procedure="ac_pro_60080020_sel_account" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtac_cd"/>
                     <input bind="txt_lang"/>
                </input>
                <output>
                     <output bind="txtac_pk"/>
                     <output bind="txt_temp"/>
                     <output bind="txtac_nm"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------->
    <gw:data id="dso_gridDetail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_sel_60080020_griddetail" procedure="ac_upd_60080020_griddetail">
                <input bind="GridRight">                    
                <input bind="txtMaster_pk" /> 
                <input bind="txtL" /> 
            </input> 
            <output bind="GridRight"></output>
            </dso>
        </xml>
    </gw:data>
	
	<gw:data id="dso_gridDetail_2" onreceive="">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_sel_60080020_griddetail_2" procedure="ac_upd_60080020_griddetail_2">
                <input bind="GridRight_2">                    
                <input bind="txtMaster_pk" /> 
                <input bind="txtL" /> 
            </input> 
            <output bind="GridRight_2"></output>
            </dso>
        </xml>
    </gw:data>
<!----------------------------------------------------------------------->
    <gw:data id="dso_copy_form_design" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60080020_fdesign_copy" > 
                <input> 
                     <input bind="txtMasterPK_UP"/>
                     <input bind="lstCompany"/>
                     <input bind="lstFormtype"/>
					 <input bind="dtYearFrmCopy"/>
					 <input bind="dtYearToCopy"/> 
                </input>
                <output>
                     <output bind="txtMasterPK_UP"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="datCFDetail" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,7,10,11,12,13" function="ac_sel_60080010_design_cf" procedure="ac_upd_60080010_design_cf">
                <input bind="grdCFData">
                    <input bind="lstCompany"/>
                    <input bind="txtMaster_pk"/>
                    <input bind="txt_lang"/>
                    <input bind="txtCF_TYPE"/>
                    
                </input>
                <output bind="grdCFData"/>
            </dso>
        </xml>
    </gw:data>	
       <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
		<td style="width: 20%; height: 100%" id="t-left1">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%" >
                                    <tr>
                                        
                                       
                                        <td width="100%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
													<td align="right" width="10%">
														Company&nbsp;</td>
													<td width="72%">
														<gw:list id="lstCompanyS" onchange="" styles='width:100%'></gw:list>
													</td>
                                                    <td align="right" width="3%">
                                                        <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch(0)" />
                                                    </td>
                                                    
                                                </tr>
												 <tr>
													<td width="9%" align="right">Type </td>
													<td width="45%">
														<gw:list id="lstFormtypeS" onchange="onSearch(0)" styles='width:100%'></gw:list>
													</td>
                                                </tr>
												
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
					
                    <tr style="height: 99%">
                        <td style="width: 70%" id="Td1">
                            <gw:grid id="grdSearch" 
                                header="_PK|Form type|Year From|Year To"
                                format="0|0|0|0" 
                                aligns="0|0|0|0"
                                widths="0|1500|1000|1000"
                                styles="width:100%; height:100%" 
                                sorting="T" oncellclick="onSearch('MST')" />
                        </td>
                    </tr>
                </table>
            </td>
			<td style="width: 2%; white-space: nowrap;background:#BDE9FF" align="center">
                <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                    style="cursor: hand; position: center" onclick="OnToggle1()" />
			</td>		
            <td style="width: 48%; height: 100%" id="t-left">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%" >
                                    <tr>
                                        
                                       
                                        <td width="100%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
													<td align="right" width="10%">
														Company&nbsp;</td>
													<td width="45%">
														<gw:list id="lstCompany" onchange="" styles='width:100%'></gw:list>
													</td>
                                                    <td align="right" width="3%">
														<gw:icon id="btnCopy" text="Copy" styles="width:100%; " onclick="OnCopy()" />
														<gw:icon id="btnSearch" styles='width:100%;display:none' img="in" text="Batch Entry" onclick="onBatchEntry()" />
													</td>
                                                    <td align="right" width="10%">
                                                       Copy Year 
                                                    </td> 
													<td align="right" width="10%">
                                                       <gw:datebox id="dtYearFrmCopy" type="year" nullaccept="T" onchange="" lang="1" styles="width:42%;background:#FFFFAF"/> ~
                                                    </td>
													<td align="right" width="8%">
                                                        <gw:datebox id="dtYearToCopy" type="year" nullaccept="T" onchange="" lang="1" styles="width:42%;background:#FFFFAF"/>
                                                    </td>
                                                    <td align="right" width="3%">
                                                        <gw:imgbtn id="ibtnNewMST" img="new" alt="New" onclick="onNew(0)" />
                                                    </td>
                                                    <td align="right" width="3%">
                                                        <gw:imgbtn id="ibtnSaveMST" img="save" alt="Save" onclick="onSave(0)" />
                                                    </td>
                                                    <td align="right" width="3%">
                                                        <gw:imgbtn id="ibtnDeleteMST" img="delete" alt="Delete" onclick="onDelete(0)" />
                                                    </td>
                                                    <td align="right" width="2%">
                                                        <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="onReport()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td width="100%">
											<table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
													<td width="9%" align="right">Type </td>
													<td width="45%">
														<gw:list id="lstFormtype" onchange="" styles='width:100%'></gw:list>
													</td>
                                                    <td width="4%">
                                                        Year</td>
                                                    <td width="10%"><gw:datebox id="dtYearFrm" type="year" onchange="" lang="1" styles="width:42%;background:#FFFFAF"/>
														
													</td>
													<td width="1%"> 
													~ 
													</td>
													<td width="10%">
														<gw:datebox id="dtYearTo" type="year" onchange="" lang="1" styles="width:42%;background:#FFFFAF"/>
													</td>
													 <td width="10%">
                                                        Print Seq &nbsp;</td>
                                                    <td width="11%"><gw:list id="lstPrintSEQ" value="N" onchange="OnClick_Auto()" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                        
                                    </tr>
                                    <tr style="height: 20">
                                       <td>
                                            <table style="width: 100%" border=0 cellpadding="0" cellspacing="0">
                                                <tr>
													 <td width="9%" align="right">
														<a title="Click here to select Account Code" onclick="Popup_Acc()" href="#tips">Account&nbsp;</a></td>
															
																<td width="34%">
																	<gw:textbox id="txtac_cd" styles='width:100%' onenterkey="onEnter()" onkeypress="CheckNumeric()" />
																</td>
																<td width="30%">
																	<gw:textbox id="txtac_nm" styles='width:100%' />
																</td>
																<td width="1%" align="left">
																	<gw:imgbtn img="reset" id="idResetTr" alt="Reset" onclick="Reset_Acc()" />
																</td>
																<td width="5%"><gw:imgbtn img="auto" id="btGenAuto" alt="Gen Auto" onclick="Gen_Auto()" /></td>
																<td width="3%"><gw:imgbtn img="up" id="btnUp_Dr" alt="Up" onclick="UpClick()" /></td>
																<td width="3%"><gw:imgbtn img="down" id="btnDown_Dr" alt="Down" onclick="DownClick()" /></td>
																<td width="3%"> </td>
																<td width="2%" >
																	<a title="Click here to select Level" onclick="onPopup()" href="#tips">Level&nbsp;</a></td>
																<td width="10%"><gw:list id="lstLevel" onchange="OnChangeLevel()" /></td>
												</tr>
											</table>
										</td>
                                    </tr>
									<tr>
                                       
                                        <td width="100%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td width="88%"></td>
                                                    <td width="4%">
                                                        <gw:imgbtn id="ibtnNew" img="new" alt="New" onclick="onNew(1)" />
                                                    </td>
                                                    <td width="4%">
                                                        <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="onSave(1)" />
                                                    </td>
                                                    <td  width="4%" align="left">
                                                        <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="onDelete(1)" />
                                                    </td>
                                                  
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 70%" id="Td1">
                            <gw:grid id="grGrid" 
                                header="_PK|Group|Print Seq|Code|Header|_AcPK|Ac Code|Account Name|Local Account Name|Korean Account Name|Print|L/R|Font stype|Rem|Color|Level|_Formular 1|_Formular 2|_Formular 3|_Formular 4|_FormType|_Com_PK|tac_kafinanceform_mst"
                                format="0|0|0|0|0|0|0|0|0|0|3|0|0|3|0|0|0|0|0|0|0|0|0" 
                                aligns="0|1|1|1|1|1|0|0|0|0|1|0|1|1|0|1|1|1|1|1|0|0|0"
                                defaults="|03|||||||||-1|L|R|-1|0XFFFFFF|1|||||||" 
                                editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0"
                                acceptnulldate="T" 
                                widths="0|1400|900|600|700|0|1000|2500|2500|2500|500|800|1000|500|1500|800|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" 
                                sorting="T" 
                                oncelldblclick="RowClick()" 
                                onselchange="ChangeColor()"
                                oncellclick="onSearch(2);" />
							
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 2%; white-space: nowrap;background:#BDE9FF" align="center">
                <img status="expand" id="imgArrow1" src="../../../../system/images/button/previous.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('1')" />
                <img status="expand" id="imgArrow2" src="../../../../system/images/button/next.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('2')" />
            </td>
            <td style="width: 28%" id="t-right">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="height: 2%">
						<td width="100%">
							<fieldset>
								<table style="width: 100%" cellpadding="0" cellspacing="0" >
									<tr>
									<td width="91%"></td>
										<td width="3%">
											<gw:imgbtn id="ibtnNew1" img="new" alt="New" onclick="onNew(2)" />
										</td>
										<td width="3%">
											<gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="onSave(2)" />
										</td>
										<td width="3%">
											<gw:imgbtn id="ibtnDelete1" img="delete" alt="Delete" onclick="onDelete(2)" />
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
                    </tr>
                    <tr style="height: 48%">
                        <td style="width: 28%" id="Td2">
                            <gw:grid id="GridRight" 
                                header='Operator|Account Code|Account Name|_Account_pk|_Master_pk|_pk|_Formular_pk|Balance'
                                format='0|0|0|0|0|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0' 
                                defaults='|||||||' 
                                editcol='0|0|0|0|0|0|0|0'
                                widths='900|1500|3000|2500|0|0|0|2000' 
                                sorting='T' 
                                styles='width:100%; height:100%'
                                oncelldblclick="OnSelectAcc()" />
							<gw:grid id='grdCFData'
							header='_PK|Code|No|_TAC_KAFINANCEFORM_PK|_TAC_ABACCTCODE_PK_DR|Debit Acc.Code|Account Name|_TAC_ABACCTCODE_PK_CR|Credit Acc.Code|Account Name|_FORMULAR|_REMARK|_REMARK2|_CF_TYPE'
							format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							aligns='0|2|2|0|0|0|0|0|0|0|0|0|0|0'
							defaults='|||||||||||||'
							editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
							widths='1000|700|500|0|0|1500|2500|0|1500|2000|1000|1000|1000|500'
							sorting='T'
							oncelldblclick ="RowClick()"
							styles='width:100%;  height:100%'
							/>		
                        </td>
                    </tr>
					<tr style="height: 2%">
						<td width="100%">
							<fieldset>
								<table style="width: 100%" cellpadding="0" cellspacing="0" >
									<tr>
									<td width="91%"></td>
										<td width="3%">
											<gw:imgbtn id="ibtnNew1" img="new" alt="New" onclick="onNew(3)" />
										</td>
										<td width="3%">
											<gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="onSave(3)" />
										</td>
										<td width="3%">
											<gw:imgbtn id="ibtnDelete1" img="delete" alt="Delete" onclick="onDelete(3)" />
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
                    </tr>
                    <tr style="height: 48%">
                        <td style="width: 28%" id="Td3">
                            <gw:grid id="GridRight_2" 
                                header='Operator|Account Code|Account Name|_Account_pk|_Master_pk|_pk|_Formular_pk|Balance'
                                format='0|0|0|0|0|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0' 
                                defaults='|||||||' 
                                editcol='0|0|0|0|0|0|0|0'
                                widths='900|1500|3000|2500|0|0|0|2000' 
                                sorting='T' 
                                styles='width:100%; height:100%'
                                oncelldblclick="OnSelectAcc_2()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_temp" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_lang" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtac_pk" styles='display:none' />
    <gw:textbox id="txttac_kafinanceformd1_pk" styles='display:none' />
    <gw:textbox id="txtMaster_pk" styles='display:none' />
    <gw:textbox id="txtFormular" styles='display:none' />
    <gw:textbox id="txtL" styles='display:none' />
	<gw:textbox id="txttac_omcost_pricer_PK" styles='display:none' />
	<gw:textbox id="txtMasterPK_UP" styles='display:none' />
	<gw:textbox id="Description" styles='display:none' />
	<gw:textbox id="txtCF_TYPE" styles='display:none' />
</body>
</html>
