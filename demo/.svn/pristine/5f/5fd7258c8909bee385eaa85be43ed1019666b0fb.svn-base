<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
function BodyInit()
{
    System.Translate(document);
    
    <%=CtlLib.SetGridColumnComboFormat("grGrid", 1,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0250' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",11,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0030' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",12,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0270' AND A.USE_IF = 1")%>;
    
    <%=CtlLib.SetGridColumnComboFormat("grGrid",14,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0240' AND A.USE_IF = 1 ORDER BY A.CODE_NM")%>;
    <%=CtlLib.SetGridColumnComboFormat("grGrid",15,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0020' AND A.USE_IF = 1 ")%>;
    
    <%=CtlLib.SetGridColumnComboFormat("GridRight",0,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK032' and a.del_if = 0 and b.del_if = 0")%>;
    <%=CtlLib.SetGridColumnComboFormat("GridRight",7,"SELECT B.CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK042' and a.del_if = 0 and b.del_if = 0")%>;
    BindingDataList();
    lstLevel.SetDataText("");
    
    onSearch(1);
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
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
    var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0020','','') FROM DUAL")%>";
    var ls_data3    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var ls_print = "Data|Y|Auto|N|Manual"; 
    rbAUTO_YN.SetDataText(ls_print);
    lstCompany.SetDataText(ls_data);
    lstFormtype.SetDataText(ls_data2);
    lstLevel.SetDataText(ls_data3);
    //btGenAuto.style.display = 'none';
    txtac_nm.SetEnable(false);
    txt_lang.SetDataText('ENG');
    txtac_cd.GetControl().focus();
    
}
//-------------------------------------------------------------
function OnClick_Auto()
{
    if (rbAUTO_YN.GetData() == 'Y')
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
function OnNew(obj)
{
    switch(obj)
    {
        case 1:
            grGrid.DeselectRow(grGrid.selrow);
	        grGrid.AddRow();
	        grGrid.SelectRow(grGrid.rows - 1);
	        grGrid.SetGridText( grGrid.rows - 1 ,20, lstFormtype.GetData());
	        grGrid.SetGridText( grGrid.rows - 1 ,21, lstCompany.GetData());
	        
	    break;
	    case 2:
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
	                
	                 if(formular != "F")
	                 {  
	                             
	                             var curRow = GridRight.row;
                                 var runRow=curRow;
                                 var fpath   = System.RootURL + "/standard/forms/60/18/60180110_popup_2.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value;	
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
                                                                GridRight.SetGridText(GridRight.rows - 1, 3, tmp[3]);    //ACPK
                                                                GridRight.SetGridText(GridRight.rows - 1, 1, tmp[1]);    //Account Code
                                                                GridRight.SetGridText(GridRight.rows - 1, 2, tmp[2]);    //Account Name
                                                               
                                                               // txtMaster_pk.SetDataText(GridRight.GetGridData(GridRight.row,5));  
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
                                 var fpath   = System.RootURL + "/standard/forms/60/18/60180110_popup_3.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData();	
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
                                                    GridRight.SetGridText(GridRight.rows - 1, 6, tmp[5]);    //ACPK
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
                                                                GridRight.SetGridText(GridRight.rows - 1, 6, tmp[5]);    //ACPK
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
        case 1:
  
            dso_sel_grd_financeform.Call("SELECT");
        break;
        case 2:
            var icol,irow;
            icol=grGrid.col;
            irow=grGrid.row;
            
           txtMaster_pk.SetDataText(grGrid.GetGridData(grGrid.row,0));
           //var formular = grGrid.GetGridData(grGrid.row, 11);
           txtL.SetDataText(grGrid.GetGridData(grGrid.row,11));
           
                flag='search';
                dso_gridDetail.Call('SELECT');
                       
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
function OnSave(obj)
{
    switch(obj)
    {
        case 1:
            if (CheckItemLength())
            {
                dso_sel_grd_financeform.Call();
            }
        break;
        case 2:
       
       
            dso_gridDetail.Call();
       
        break;
    }
    
}
function Check()
{
    if(GridRight.col=="0")
    {
        
        GridRight.SetDataText()!="";
    }
//    else
//    {
//        alert('Please select Operator!!');
//    }
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
    var fpath = System.RootURL + "/standard/forms/60/18/60180110_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=AC_SEL_60180110_11";
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
    
    if (event.col ==6 && (grGrid.GetGridData(event.row, 1) == "01" || grGrid.GetGridData(event.row, 1) == "05" ))
	{
        if (grGrid.GetGridData(event.row, 1) == "01")
        {
            var fpath = System.RootURL + "/standard/forms/60/18/60180110_popup_1.aspx?comm_code=" + "" + "&dsqlid=AC_SEL_60180110_POPUP_1" + "&val1=" + lstFormtype.GetData() + "&val2=" + lstCompany.GetData();
        }
        else if (grGrid.GetGridData(event.row, 1) == "05")
        {
            var fpath = System.RootURL + "/standard/forms/ff/co/ffco002001.aspx?comm_code=" + "" + "&dsqlid=AC_SEL_60180110_POPUP_PL_FS" + "&val2=" + lstCompany.GetData();
        }
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
    else if(event.col == 7 || event.col == 8 || event.col == 9)
    {
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
         var fpath = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   
   if((lstFormtype.value=="93" ) && (event.col ==16)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
         var fpath = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   if((lstFormtype.value=="23" ) && (event.col ==18)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
        
         var fpath = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
   if((lstFormtype.value=="92" ) && (event.col ==18)&& (Trim(grGrid.GetGridData(event.row, 3))!=""))
   {
        
         var fpath = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf.aspx?com_pk=" + lstCompany.GetData()+"&row_pk="+grGrid.GetGridData(event.row, 0)+"&cf_type="+lstFormtype.value;
         aValue    = System.OpenModal( fpath , 850 , 450 , 'resizable:yes;status:yes');
         if ( aValue != null )  
		{
		    
		}
   } 
   
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
	        grGrid.SetGridText( i ,20, lstFormtype.GetData());
	        grGrid.SetGridText( i ,21, lstCompany.GetData());
	    }
	}
}
//-------------------------------------------------------------
function OnDelete(obj) 
{	
           
        	
    switch(obj)
    {
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
	    var ctrl 	= GridRight.GetGridControl();
	        var rownum 	= Number(ctrl.Row);
	        var rownums = Number(ctrl.Rows);
	        if ((rownums > 1) && (rownum > 0))
	        {
			        for(i=1; i<rownums; i++)
			        {
				        if (ctrl.isSelected(i) == true)
                        {
				            GridRight.DeleteRow();
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
function CheckDuplicateDetail()
{
    
    for(var i = 1; i < GridRight.rows; i++)
    {
        
        if(GridRight.GetGridData(i, 3) == txtac_pk.text)
        {
            
             alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//-------------------------------------------------------------

function Duplicate()
{
    for(var i = 1; i < GridRight.rows; i++)
    {
        
        if(GridRight.GetGridData(i, 6) == txtFormular.text)
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
	var path = System.RootURL + '/standard/forms/60/19/gfka00010_popup.aspx?com_pk='+ lstCompany.GetData();
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
                            var fpath   = System.RootURL + "/standard/forms/60/18/60180110_popup_4.aspx?company_pk="+lstCompany.value ;	    
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
                            
                                 var fpath   = System.RootURL + "/standard/forms/60/18/60180110_popup_5.aspx?TAC_LOCALCODE=" + txtMaster_pk.GetData() + "&company_pk=" + lstCompany.value + "&l_type=" + lstFormtype.value + "&Master_pk=" + txtMaster_pk.GetData();	
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
//-------------------------------------------------------------
function onEnter()
{
    dso_pro_acc.Call();
}
//-------------------------------------------------------------
function OnDataReceive(obj)
{
	switch(obj)
		{
			case 'dso_getCompany':
					
			break;
		}
}
function OnPrint()
{

}
//-------------------------------------------------------------
</script>

<body style="margin: 0; padding: 0;">
    <gw:data id="dso_sel_grd_financeform" onreceive="ChangeColor()">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="AC_SEL_60180110_FINANCE_LOCAL" procedure="AC_UPD_60180110_FINANCE_LOCAL">
                <input bind="grGrid">
                    <input bind="lstCompany"/>
                    <input bind="txtac_cd"/>
                    <input bind="lstLevel"/>
                    <input bind="lstFormtype"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>
<!----------------------------------------------------------------------->
<gw:data id="dso_sel_financeform_batch_entry" onreceive="onSetStatus()">
	<xml>
		<dso type="grid" function="AC_SEL_60180110_FIN_BAT_LOCAL" >
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
		<dso type="process" procedure="AC_PRO_60180110_SEL_ACC_LOCAL" > 
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
<gw:data id="dso_gridDetail" onreceive="">
	<xml>
		<dso type="grid" parameter="0,1,2,3,4,5,6,7" function="AC_SEL_60180110_DETAIL_LOCAL" procedure="AC_UPD_60180110_DETAIL_LOCAL">
			<input bind="GridRight">                    
			<input bind="txtMaster_pk" /> 
			<input bind="txtL" /> 
		</input> 
		<output bind="GridRight"></output>
		</dso>
	</xml>
</gw:data>
<!-------------------------------------------------->
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
<!-------------------------------------------------->
<table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 70%; height: 100%" id="t-left">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%" >
                                    <tr>
                                        <td align="right" width="20%">
                                            Company&nbsp;</td>
                                        <td width="80%">
                                            <gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%'></gw:list>
                                        </td>
                                        <td width="1%">
                                        </td>
                                        <td width="3%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td><gw:icon id="btnSearch" img="in" text="Batch Entry" onclick="onBatchEntry()" /></td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch(1)" />
                                                    </td>
                                                    <td>
														<gw:button  id="btnAddNewM" img="new" alt="New"onclick="OnNew(1)" />
                                                    </td>
                                                    <td>
														<gw:button id="btSaveM" img="save" alt="Save" onclick="OnSave(1)" />
                                                    </td>
                                                    <td>
														<gw:button id="btDeleteM" img="delete" alt="Delete" onclick="OnDelete(1)" />
                                                    </td>
                                                    <td>
														<gw:button id="btnReport"  text="Print" img="excel" alt="Print Out Report" onclick="OnPrint()" /> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">Type </td>
                                        <td width="80%">
                                            <gw:list id="lstFormtype" onchange="OnChangeList()" styles='width:100%'></gw:list>
                                        </td>
                                        <td width="1%">
                                        </td>
                                        <td width="15%">
                                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="40%" align="right">
                                                        Print Seq &nbsp;</td>
                                                    <td width="60%"><gw:list id="rbAUTO_YN" value="N" onchange="OnClick_Auto()" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 20">
                                        <td width="12%" align="right">
                                            <a title="Click here to select Account Code" onclick="Popup_Acc()" href="#tips">Account&nbsp;</a></td>
                                        <td width="40%">
                                            <table style="width: 100%" border=0 cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtac_cd" styles='width:100%' onenterkey="onEnter()" onkeypress="CheckNumeric()" />
                                                    </td>

                                                    <td width="60%">
                                                        <gw:textbox id="txtac_nm" styles='width:100%' />
                                                    </td>
                                                    <td width="1%" align="left">
                                                        <gw:imgbtn img="reset" id="idResetTr" alt="Reset" onclick="Reset_Acc()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="3%">
                                        </td>
                                        <td width="42%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%"><gw:button img="auto" id="btGenAuto" alt="Gen Auto" onclick="Gen_Auto()" /></td>
                                                    <td width="10%"><gw:button img="up" id="btnUp_Dr" alt="Up" onclick="UpClick()" /></td>
                                                    <td width="10%"><gw:button img="down" id="btnDown_Dr" alt="Down" onclick="DownClick()" /></td>
                                                    <td width="10%" >
                                                        <a title="Click here to select Level" onclick="onPopup()" href="#tips">Level&nbsp;</a></td>
                                                    <td width="60%"><gw:list id="lstLevel" onchange="OnChangeLevel()" /></td>
                                                   
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
                                header="_PK|Group|Print Seq|Code|Header|_AcPK|Ac Code|Account Name|Local Account Name|Korean Account Name|Print|L/R|Font stype|Rem|Color|Level|_Formular 1|_Formular 2|_Formular 3|_Formular 4|_FormType|_Com_PK"
                                format="0|0|0|0|0|0|0|0|0|0|3|0|0|3|0|0|0|0|0|0|0|0" 
                                aligns="0|1|1|1|1|1|0|0|0|0|1|0|1|1|0|1|1|1|1|1|0|0"
                                defaults="|03|||||||||-1|L|R|-1|0XFFFFFF|1||||||" 
                                editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0"
                                acceptnulldate="T" 
                                widths="0|1400|900|600|700|0|1000|2500|2500|2500|500|800|1000|500|1500|800|0|0|0|0|0|0"
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
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                
                                    <td width="100%">
                                        <fieldset>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                <td width="85%"></td>
                                                    <td width="5%">
                                                        <gw:button  id="btnAddNewD" img="new" alt="New"onclick="OnNew(2)" />
                                                    </td>
                                                    <td width="5%">
                                                       <gw:button id="btSaveD" img="save" alt="Save" onclick="OnSave(2)" />
                                                    </td>
                                                    <td width="5%">
                                                        <gw:button id="btDeleteD" img="delete" alt="Delete" onclick="OnDelete(2)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 28%" id="Td2">
                            <gw:grid id="GridRight" header='Operator|Account Code|Account Name|_Account_pk|_Master_pk|_pk|_Formular_pk|Balance'
                                format='0|0|0|0|0|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0' 
                                defaults='|||||||' 
                                editcol='0|0|0|0|0|0|0|0'
                                widths='900|1500|3000|2500|0|0|0|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnSelectAcc()" />
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
    <gw:textbox id="txtL" styles='display:none' />
    <gw:textbox id="txtFormular" styles='display:none' />
	<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>
