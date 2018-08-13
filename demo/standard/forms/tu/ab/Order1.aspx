<%@ Page Language="C#" AutoEventWireup="true"  %>
<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CONSUMPTION SLIP ENTRY</title>
</head>
<%ESysLib.SetUser("comm");%>
<script language="javascript" type="text/javascript">
    var action;
function BodyInit()
{ 
    System.Translate(document);  // Translate to language session
    onNew();
    
    <%=ESysLib.SetGridColumnComboFormat("grdManChild", 8, "select a.CODE,  a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='IEBD0050' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>; 
    <%=ESysLib.SetGridColumnComboFormat("grdBOMList", 8, "select a.CODE,  a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='IEBD0050' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>; 
    
    <%=ESysLib.SetGridColumnComboFormat("grdManChild", 12, "select country_cd2, country_nm from imex.tie_country where del_if=0 ")%>; 
    <%=ESysLib.SetGridColumnComboFormat("grdBOMList", 12, "select country_cd2, country_nm from imex.tie_country where del_if=0 ")%>; 
    var data1 = "<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>"; 
    
    cboCompany.SetDataText(data1);
    txtCusName.SetEnable(false);
    txtCusCode.SetEnable(false);
    SetGridFormat();
}
//------------------------------------------------------------------------------------------
function onNew()
{
    dat_epil00010_1.StatusInsert();
    txtStatusNum.text=1;
    txtEmpPK.text = "<%=Session["USER_PK"]%>";
    SetStatus(1);
    grdManParent.ClearData();  
    grdManChild.ClearData();
    grdBOMParent.ClearData(); 
    grdBOMList.ClearData();
    cboOption.value='Man';
    onChangeOption();
}
//--------------------------------------------------------------------------------------
function onSave(index)
{
    switch(index)
    {
        case 0:
            if(ValidateData())
            {
                action ="save";
                dat_epil00010_1.Call('');
            }            
        break;
        case 1:
            for(var i=0; i<grdManParent.rows;i++)
                if (grdManParent.GetGridData(i,0)=='')
                {
                    grdManParent.SetGridText(i,1,txtMasterPK.text);
                }
            dat_epil00010_4.Call('');
        break;
        case 2:
            dat_epil00010_5.Call('');     
        break;  
        case 3:
            for(var i=1; i<grdBOMParent.rows;i++)
            {
                if(grdBOMParent.GetGridData(i,0)=='')
                {
                    grdBOMParent.SetGridText(i,1,txtMasterPK.text);
                    grdBOMParent.SetGridText(i,9,dtValidDate.value);
                }
            }  
            dat_epil00010_6.Call('');     
        break;
        case 4:
            for(var i=1; i<grdBOMList.rows;i++)
            {
                if(grdBOMList.GetGridData(i,0)=='')
                    grdBOMList.SetGridText(i,1,grdBOMParent.GetGridData(Number(txtdtlmRow.text),0));
            }  
            dat_epil00010_7.Call('');     
        break;
    }
}
//--------------------------------------------------------------------------------------
function onAfterEditting(obj)  
{
   var ctr = obj.GetGridControl();   
   var colidx;
   //0._Pk|1._consp_dtlm_pk|2._item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty|8.Loss Rate
   //|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark|14._tpr_abbomprodd_pk'  grdManChild   grdBOMList
   colidx= obj.col;  
   
   switch(colidx)
   {
        case 8:
            obj.SetGridText(obj.row,9,Number(obj.GetGridData(obj.row,7))*Number(obj.GetGridData(obj.row,8))/100)
        break;        
   }
   obj.SetGridText(obj.row,11,Number(obj.GetGridData(obj.row,7))+Number(obj.GetGridData(obj.row,9))+Number(obj.GetGridData(obj.row,10)))
   
}
//--------------------------------------------------------------------------------------
function onDelete(index)
{
    switch(index)
    {
        case 0:
            if(confirm('Do you want to delete this entry?'))
            {
                dat_epil00010_1.StatusDelete();
                action = 'delete';
                dat_epil00010_1.Call('');
            }
        break;
        case 1:
            if(confirm('Do you want to delete this item ?'))
            {
                grdManParent.DeleteRow();
            }
        break;
        case 2:
            if(confirm('Do you want to delete this item ?'))
            {
                grdManChild.DeleteRow();
            }    
        break;
        case 3:
            if(confirm('Do you want to delete this item ?'))
            {
                grdBOMParent.DeleteRow();
            }
        break;
        case 4:
            if(confirm('Do you want to delete this item ?'))
            {
                grdBOMList.DeleteRow();
            }  
        break;
    }
}
//--------------------------------------------------------------------------------------
function ValidateData()
{
//    if(txtConstNo.text=='')
//    {
//        alert("You must input Consumption No!");
//        txtConstNo.GetControl().focus();
//        return false;
//    }
    if(txtCusPK.text=='')
    {
        alert("You must input Customs Office!"); 
        return false;
    }
    if(cboOption.value=='')
    {
        alert("You must input a option!");    
        return false;  
    }
    if((chkCloseYN.value=='Y')&& (dtCloseDate.value==''))
    {
        alert("You must input Close Date!");
        return false;
    }
    if((chkCloseYN.value=='N')&& (dtCloseDate.value!=''))
    {
        alert("You must ckeck Close Y/N!");
        return false;
    }
    return true;
}
//--------------------------------------------------------------------------------------
function ValidataConfirm()
{   
   //0._Pk|1._consp_dtlm_pk|2._item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty|8.Loss Rate
   //|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark|14._tpr_abbomprodd_pk'  grdManChild   grdBOMList
    
   for(i=0; i<grdManChild .rows;i++)
   {
        if(grdManChild.GetGridData(i,7)=='')
        {
            alert("You must input Request Qty at row " +i);
            return false;
        }
        
        if(grdManChild.GetGridData(i,0)=='')
        {
            alert("You must input Loss Rate at row " +i);
            return false;
        }
   }
   
   for(i=1; i<grdBOMList .rows;i++)
   {
        if(grdBOMList.GetGridData(i,7)=='')
        {
            alert("You must input Request Qty at row " +i);
            return false;
        }
        
        if(grdBOMList.GetGridData(i,0)=='')
        {
            alert("You must input Loss Rate at row " +i);
            return false;
        }
   }
   
   if(cboOption.value=='BOM')
   {
        for(i=1; i<grdBOMParent.rows; i++)
        {
            var isAlready ;
            isAlready=0;
            if(grdBOMParent.GetGridData(i,0)=='')    
            {
                alert("You must save parent item first!");
                return false;
            }
            
//            for(j=1; j<grdBOMList.rows;j++)
//            {
//                if(grdBOMList.GetGridData(j,1)== grdBOMParent.GetGridData(i,0))
//                {
//                    isAlready=1;
//                    break;
//                }   
//            }
//            if(isAlready==0)
//            {
//                alert("You must add child item to parent item at row " + i);
//                return false;
//            }
        }
   }
   
   if(cboOption.value=='Man')
   {
        for(i=1; i<grdManParent.rows; i++)
        {
            var isAlready ;
            isAlready=0;
            if(grdManParent.GetGridData(i,0)=='')    
            {
                alert("You must save parent item first!");
                return false;
            }
            
//            for(j=1; j<grdManChild.rows;j++)
//            {
//                if(grdManChild.GetGridData(j,1)== grdManParent.GetGridData(i,0))
//                {
//                    isAlready=1;
//                    break;
//                }   
//            }
//            if(isAlready==0)
//            {
//                alert("You must add child item to parent item at row " + i);
//                return false;
//            }
        }
   }
   
   return true;
}
//--------------------------------------------------------------------------------------
function onAcceptDateChange()
{
    dtValidDate.value=dtAcceptDate.value;
}
//--------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dat_epil00010_1":
            onChangeOption();
            
            lbStatus.text=txtStatus.text;
            if(action=='select')
                if (cboOption.value=='BOM')
                    dat_epil00010_6.Call('SELECT');
                else
                    dat_epil00010_4.Call('SELECT');
            if(action=='view')
                    SetStatus("4");
            else
                SetStatus(txtStatusNum.text);
                
            if (chkCloseYN.value=='Y')
            {
                SetStatus(2);
                btnCancel.style.display="none";
            }
        break;
        case "dat_epil00010_2": 
            if(txtStatusNum.text==2)
                lbStatus.text="Confirmed" ;
            else    
                lbStatus.text="Cancelled"  ;
                 
            SetStatus(txtStatusNum.text);
        break;
        case "dat_epil00010_3":
            lbStatus.text="Saved" ;
            SetStatus("1");
            dat_epil00010_1.Call('SELECT');
        break;
        case "dat_epil00010_6":            
            for(var i=1; i<grdBOMList.rows;i++)
            {
                if(grdBOMList.GetGridData(i,0)=='')
                    grdBOMList.SetGridText(i,1,grdBOMParent.GetGridData(Number(txtdtlmRow.text),0));
            }  
            dat_epil00010_7.Call('');          
        break;
    }
}
//--------------------------------------------------------------------------------------
function onConfirmCancel(index)
{
    switch(index)
    {
        case 0: //confirm
            if(ValidataConfirm())
            {
                txtStatusNum.text=2;
                dat_epil00010_2.Call(); 
            } 
        break;
        case 1: //Cancel
            txtStatusNum.text=3;
            dat_epil00010_2.Call(); 
        break;
    }    
}
//--------------------------------------------------------------------------------------
function onCopyRegen()
{
    dat_epil00010_3.Call();
}
//---------------------------------------------------------------------------------------
function SetGridFormat()
 {                 
    var ctr = grdManChild.GetGridControl(); 
    ctr.ColFormat(7) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(9) = "#,###,###,###,###,###.#####";    
    ctr.ColFormat(10) = "#,###,###,###,###,###.#####"; 
    ctr.ColFormat(11) = "#,###,###,###,###,###.#####"; 
    
    var ctr = grdBOMList.GetGridControl(); 
    ctr.ColFormat(7) = "#,###,###,###,###,###.#####";
    ctr.ColFormat(9) = "#,###,###,###,###,###.#####";    
    ctr.ColFormat(10) = "#,###,###,###,###,###.#####"; 
    ctr.ColFormat(11) = "#,###,###,###,###,###.#####";         
 }
//--------------------------------------------------------------------------------------
function openPopup(index)
{
    switch(index)
    {
        case 0 :
            var fpath = System.RootURL + "/form/ep/gd/PopUpGetCustoms.aspx?partner_type=90"; //customs
            aValue = System.OpenModal( fpath , 900 , 500, 'resizable:yes;status:yes');
            if ( aValue != null )
            {             
                txtCusName.SetDataText(aValue[2]); 
                txtCusCode.SetDataText(aValue[1]);  
                txtCusPK.SetDataText(aValue[0]);  
            }	
        break;
        case 1 :
            var fpath = System.RootURL + "/form/ep/hl/ephl00010_BOM_Inquiry.aspx"; //customs
            aValue = System.OpenModal( fpath , 600 , 500, 'resizable:yes;status:yes');
            if ( aValue != null )
            {             
                       
            }	
        break;
        case 2:  //SELECT PARENT    
            var fpath = System.RootURL + "/form/fp/ab/fpab00070.aspx?group_type=Y|Y||||";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
            var isAlready;           
            isAlready=0;
           
            if (oValue != null)
            {   
                //--0._Pk|1._Mst_pk|2_item_pk|3.No|4.Select|5.Parent Code|6.Parent Name|7.HS Code|8.Unit     
                for (var i=0; i<oValue.length;i++)
                {
                    aValue=oValue[i];
	                    
                    for(var k=1; k<grdManParent.rows;k++)
                        if (grdManParent.GetGridData(k , 2)== aValue[0]) // da co
				        {
					        isAlready=1;
					        break;	
				        }		
				        
				    if(isAlready==0) 
                    {    
                        var aValue = oValue[i];  
                        grdManParent.AddRow();
                        grdManParent.SetGridText(grdManParent.rows-1,3,grdManParent.rows-1);
                        grdManParent.SetGridText(grdManParent.rows-1,2,aValue[0]);
                        grdManParent.SetGridText(grdManParent.rows-1,5,aValue[1]);
                        grdManParent.SetGridText(grdManParent.rows-1,6,aValue[2]);
                        grdManParent.SetGridText(grdManParent.rows-1,7,aValue[19]);
                        grdManParent.SetGridText(grdManParent.rows-1,8,aValue[5]);
                    }
                }                
            }
        break;
        case 3:        
            var fpath = System.RootURL + "/form/ep/hl/ephl00030.aspx?IsPopup=1";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
          
            if (oValue != null)
            {  
                txtMasterPK.text=oValue[0];
                action='select';
                dat_epil00010_1.Call('SELECT');
            }
        break;
        case 4:       
            if(grdManParent.row<0)
            {
                alert("You must select a parent row!");
                return;                
            }
            else
            {
                if(grdManParent.GetGridData(grdManParent.row,0)=='')
                {
                    alert("You must save parent item first!");
                    return;
                }
            }
            
            var fpath = System.RootURL + "/form/fp/ab/fpab00070.aspx?group_type=||Y|Y|Y|Y";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
            var isAlready;           
            isAlready=0;
           
            if (oValue != null)
            {   
                //0._Pk|1._consp_dtlm_pk|2_item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty--%>
                //|8.Loss Rate|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark'--%>    
                for (var i=0; i<oValue.length;i++)
                {
                    aValue=oValue[i];
	                    
                    for(var k=1; k<grdManChild.rows;k++)
                        if (grdManChild.GetGridData(k , 2)== aValue[0]) // da co
				        {
					        isAlready=1;
					        break;	
				        }		
				        
				    if(isAlready==0) 
                    {    
                        var aValue = oValue[i];  
                        grdManChild.AddRow();
                        grdManChild.SetGridText(grdManChild.rows-1,3,grdManChild.rows-1);
                        grdManChild.SetGridText(grdManChild.rows-1,1,grdManParent.GetGridData(grdManParent.row,0));
                        grdManChild.SetGridText(grdManChild.rows-1,2,aValue[0]);
                        grdManChild.SetGridText(grdManChild.rows-1,4,aValue[1]);
                        grdManChild.SetGridText(grdManChild.rows-1,5,aValue[2]);
                        grdManChild.SetGridText(grdManChild.rows-1,6,aValue[5]);
                    }
                }                
            }
        break;
        case 5:      
            var fpath = System.RootURL + "/form/fp/ab/fpab00070.aspx?group_type=||Y|Y|Y|Y";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
            var isAlready;           
            isAlready=0;
           
            if (oValue != null)
            {   
                //--0._Pk|1._Mst_pk|2_item_pk|3.No|4.Select|5.Parent Code|6.Parent Name|7.HS Code|8.Unit 
                //0._PK|1.Parent Code|2.Parent Name|3.HS Code|4.Unit    
                
                aValue=oValue[0];   
                    
                for(var k=1; k<grdBOMParent.rows;k++)
                    if (grdBOMParent.GetGridData(k , 2)== aValue[0]) // da co
			        {
				        isAlready=1;
				        break;	
			        }		
			        
			    if(isAlready==0) 
                {    
                    grdBOMParent.AddRow();
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,3,grdBOMParent.rows-1);
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,2,aValue[0]);
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,5,aValue[1]);
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,6,aValue[2]);
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,7,aValue[3]);
                    grdBOMParent.SetGridText(grdBOMParent.rows-1,8,aValue[4]);
                    txtdtlmRow.text=grdBOMParent.rows-1;
                }
                //0._Pk|1._consp_dtlm_pk|2._item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty|8.Loss Rate
                //|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark|14._tpr_abbomprodd_pk'  grdManChild   grdBOMList
                
                //0._Child_Item_Pk|1.Item Code|2.Item Name|3.Unit|4.Req Qty|5.Loss Rate|6.Loss Qty
                //|7.Total Qty|8._tpr_abbomprodd_pk|9._Item_Seq'
                for (var i=1; i<oValue.length;i++)
                {
                    var aValue = oValue[i];  
                    grdBOMList.AddRow();   grdManChild   
                    grdBOMList.SetGridText(grdBOMList.rows-1,3,grdBOMList.rows-1);
                    grdBOMList.SetGridText(grdBOMList.rows-1,2,aValue[0]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,4,aValue[1]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,5,aValue[2]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,6,aValue[3]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,7,aValue[4]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,8,aValue[5]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,9,aValue[6]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,11,aValue[7]);
                    grdBOMList.SetGridText(grdBOMList.rows-1,14,aValue[8]);
                }                
            }
        break;
    }
}
//--------------------------------------------------------------------------------------
function onEditRow(index)
{
    switch(index)
    {
        case 0:
            var fpath = System.RootURL + "/form/fp/ab/fpab00070.aspx?group_type=||Y|Y|Y|Y";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
            var isAlready;           
            isAlready=0;
           
            if (oValue != null)
            {   
                //--0._Pk|1._Mst_pk|2_item_pk|3.No|4.Select|5.Parent Code|6.Parent Name|7.HS Code|8.Unit     
                for (var i=0; i<oValue.length;i++)
                {
                    aValue=oValue[i];
	                    
                    for(var k=1; k<grdManParent.rows;k++)
                        if (grdManParent.GetGridData(k , 2)== aValue[0]) // da co
				        {
					        isAlready=1;
					        break;	
				        }		
				        
				    if(isAlready==0) 
                    {    
                        var aValue = oValue[i];                          
                        
                        grdManParent.SetGridText(grdManParent.row,2,aValue[0]);
                        grdManParent.SetGridText(grdManParent.row,5,aValue[1]);
                        grdManParent.SetGridText(grdManParent.row,6,aValue[2]);
                        grdManParent.SetGridText(grdManParent.row,7,aValue[19]);
                        grdManParent.SetGridText(grdManParent.row,8,aValue[5]);
                    }
                }                
            }
        break;
        case 1:
            var fpath = System.RootURL + "/form/fp/ab/fpab00070.aspx?group_type=||Y|Y|Y|Y";
            oValue = System.OpenModal( fpath , 900 , 580 , 'resizable:yes;status:yes'); 
            var isAlready;           
            isAlready=0;
           
            if (oValue != null)
            {   
                //0._Pk|1._consp_dtlm_pk|2_item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty--%>
                //|8.Loss Rate|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark'--%>    
                for (var i=0; i<oValue.length;i++)
                {
                    aValue=oValue[i];
	                    
                    for(var k=1; k<grdManChild.rows;k++)
                        if (grdManChild.GetGridData(k , 2)== aValue[0]) // da co
				        {
					        isAlready=1;
					        break;	
				        }		
				        
				    if(isAlready==0) 
                    {    
                        var aValue = oValue[i];  
                       
                        grdManChild.SetGridText(grdManChild.row,2,aValue[0]);
                        grdManChild.SetGridText(grdManChild.row,4,aValue[1]);
                        grdManChild.SetGridText(grdManChild.row,5,aValue[2]);
                        grdManChild.SetGridText(grdManChild.row,6,aValue[5]);
                    }
                }                
            }
        break;
    }
}
//--------------------------------------------------------------------------------------
function SetStatus(index)
    {
        if (index=='3')    
        {//Cancelled	Chỉ hiển thị : Popup,New,Regenerate button

            btnSearch.style.display=""; 
            btnNew.style.display="";
            btnSave.style.display="none"; 
            btnDel.style.display="none"; 
            btnExcel.style.display="none"; 
            btnExcelGrp.style.display="none"; 
            btnConfirm.style.display="none"; 
            btnCancel.style.display="none"; 
            btnRegenerate.style.display=""; 
            btnCopy.style.display="none";
            
            btnPopup.style.display="none";   
            btnISave.style.display="none";   
            btnIDel.style.display="none";   
            btnRefresh.style.display="none";   
            btnMCPopup.style.display="none";  
            btnMCSave.style.display="none";  
            btnMCDel.style.display="none";   
            btnMCRefresh.style.display="none"; 
        }                
        else
        {                        
            if (index=='2')  
            {//Approved	Chỉ hiển thị : Popup,New,Copy,Cancel,Print button

                btnSearch.style.display=""; 
                btnNew.style.display="";
                btnSave.style.display="none"; 
                btnDel.style.display="none"; 
                btnExcel.style.display=""; 
                btnExcelGrp.style.display=""; 
                btnConfirm.style.display="none"; 
                btnCancel.style.display=""; 
                btnRegenerate.style.display="none"; 
                btnCopy.style.display="";
                
                btnPopup.style.display="none";   
                btnISave.style.display="none";   
                btnIDel.style.display="none";   
                btnRefresh.style.display="none";   
                btnMCPopup.style.display="none";  
                btnMCSave.style.display="none";  
                btnMCDel.style.display="none";   
                btnMCRefresh.style.display="none"; 
            }                    
            else 
                if (index=='1') 
                {//Saved	Chỉ hiển thị : Popup,New,Save,Delete,Approve button

                    btnSearch.style.display=""; 
                    btnNew.style.display="";
                    btnSave.style.display=""; 
                    btnDel.style.display=""; 
                    btnExcel.style.display="none"; 
                    btnExcelGrp.style.display="none"; 
                    btnConfirm.style.display=""; 
                    btnCancel.style.display="none"; 
                    btnRegenerate.style.display="none"; 
                    btnCopy.style.display="none";
                    
                    btnPopup.style.display="";   
                    btnISave.style.display="";   
                    btnIDel.style.display="";   
                    btnRefresh.style.display="";   
                    btnMCPopup.style.display="";  
                    btnMCSave.style.display="";  
                    btnMCDel.style.display="";   
                    btnMCRefresh.style.display=""; 
                }  
                else
                    if (action=='view')
                    { //view form
                        btnSearch.style.display="none";
                        btnNew.style.display="none";
                        btnSave.style.display="none";
                        btnDel.style.display="none";
                        btnExcel.style.display="none";
                        btnExcelGrp.style.display="none"; 
                        btnConfirm.style.display="none";
                        btnCancel.style.display="none";
                        btnRegenerate.style.display="none";
                        btnCopy.style.display="none";
                    }
        } 
    }
     //---------------------------------------------------------------------------------
    function OnCheckTab()
    {
        var index;
        index=idTab.GetCurrentPageNo();    
        if (index==2)
            if (flag==0)
            {
                
                flag=1; 
            }  
    }
    //-------------------------------------------------------------------------------------    
     function onChangeOption()
     {     
        var idManual = document.all("idManual"); 
        var idBOM = document.all("idBOM"); 
        if (cboOption.value=='BOM')
        {  
            if (grdManParent.rows<=1)
            {
                idManual.style.display="none";  
                idBOM.style.display=""; 
                //idTab.SetPage(1);
            }
            else
            {
                alert("You must delete all Man info first!")    
                cboOption.value="Man";
            }                
        }          
        else    
        {
            if(grdBOMParent.rows <=1)
            {
                idManual.style.display="";
                idBOM.style.display="none";
                idManual.style.width="100%";
                //idTab.SetPage(2);
            }
            else
            {
                alert("You must delete all BOM info below!")    
                cboOption.value="BOM";
            }
        }  
     }
//--------------------------------------------------------------------------------------    
     function onRowChange(obj)
     {
        if(obj.id=='grdManParent')
        {
            if(grdManParent.row>=0)
            {
                txtdtlmPK.text= grdManParent.GetGridData(grdManParent.row,0);
                dat_epil00010_5.Call('SELECT');
            }
        }
        else 
            if (obj.id=='grdBOMParent')
            {        
                if( grdBOMParent.row>=0)
                {       
                    txtdtlmPK.text= grdBOMParent.GetGridData(grdBOMParent.row,0);                
                    dat_epil00010_7.Call('SELECT');
                }
            }
     }
//-----------------------------------------------------------------------------------
    function onCloseDate()
    {
        if(chkCloseYN.value=='Y')
            dtCloseDate.value=dtTmp.value;
        else
             dtCloseDate.value='';
    }
    
//--------------------------------------------------------------------------------------
    function onPrint()
    {
        var pkList;
        pkList='';
        for(i=1; i<grdManParent.rows;i++)
            if(grdManParent.GetGridData(i,4)=='-1')
                pkList= pkList + grdManParent.GetGridData(i,0) + ","
                
        for(i=1; i<grdBOMParent.rows;i++)
            if(grdBOMParent.GetGridData(i,4)=='-1')
                pkList= pkList + grdBOMParent.GetGridData(i,0) + ",";
        pkList = pkList.substr(0, pkList.length-1);    

        if (pkList=='')              
        {
            alert('Please choose at least one item!');
            return false;
        }
        var  url= System.RootURL + "/reports/ep/hl/rpt_ephl00010_Consp.aspx?" + "pkList=" + pkList + "&ConspPK=" + txtMasterPK.text;
	    System.OpenTargetPage( url, "_blank" );  
	} 
//--------------------------------------------------------------------------------------
    function onPrint1()
    {
        var pkList;
        pkList='';
        for(i=1; i<grdManParent.rows;i++)
            if(grdManParent.GetGridData(i,4)=='-1')
                pkList= pkList + grdManParent.GetGridData(i,0) + ","
                
        for(i=1; i<grdBOMParent.rows;i++)
            if(grdBOMParent.GetGridData(i,4)=='-1')
                pkList= pkList + grdBOMParent.GetGridData(i,0) + ",";
        pkList = pkList.substr(0, pkList.length-1);    
              
        if (pkList=='')              
        {
            alert('Please choose at least one item!');
            return false;
        }
        var  url= System.RootURL + "/reports/ep/hl/rpt_ephl00010_Consp_Group.aspx?" + "pkList=" + pkList + "&ConspPK=" + txtMasterPK.text;
	    System.OpenTargetPage( url, "_blank" );  
	}   	   
//--------------------------------------------------------------------------------------    
</script>
<body>
<!------------------------------------------------------------------------------------->
<gw:data id="dat_epil00010_1"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,17" function="imex.sp_sel_tie_consp_mst" procedure="imex.sp_upd_tie_consp_mst" > 
            <inout>     
                 <inout  bind="txtMasterPK" />
                 <inout  bind="txtConstNo" />
                 <inout  bind="dtAcceptDate" />   
                 <inout  bind="dtRegDate" />
                 <inout  bind="dtValidDate" />
                 <inout  bind="dtValidDateTo" />   
                 <inout  bind="chkCloseYN" />
                 <inout  bind="txtCusPK" />
                 <inout  bind="txtDeptPK" />   
                 <inout  bind="txtStatusNum" />
                 <inout  bind="txtDes" />
                 <inout  bind="cboOption" />
                 <inout  bind="dtCloseDate" />  
                 <inout  bind="txtAcceptNo" />
                 <inout  bind="txtCusCode" /> 
                 <inout  bind="txtCusName" />  
                 <inout  bind="txtStatus" />
                 <inout  bind="txtEmpPK" />
            </inout>
        </dso> 
    </xml> 
</gw:data>  
<!-------------------------------Confirm/Cancel------------------------------------>
<gw:data id="dat_epil00010_2" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="imex.sp_pro_tie_consp_mst" > 
            <input>
                <input bind="txtMasterPK" />
                <input bind="txtStatusNum" /> 
            </input> 
            <output>
                <output bind="txtMasterPK" />
            </output>
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------copy/Regenerate------------------------------------>
<gw:data id="dat_epil00010_3" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="imex.sp_pro_tie_consp_mst_c_r" > 
            <input>
                <input bind="txtMasterPK" />
                <input bind="txtStatusNum" />
            </input> 
            <output>
                <output bind="txtMasterPK" />
            </output>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------>
<gw:data id="dat_epil00010_4"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,5,8,9" function="IMEX.sp_sel_tie_consp_dtlm"   procedure="IMEX.sp_upd_tie_consp_dtlm"> 
            <input bind="grdManParent">                    
                <input bind="txtMasterPK" /> 
            </input> 
            <output bind="grdManParent" /> 
        </dso>    
    </xml> 
</gw:data>  
<!------------------------------------------------------------------>
<gw:data id="dat_epil00010_5"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,6,7,8,10,12,13,14" function="IMEX.sp_sel_tie_consp_dtls"   procedure="IMEX.sp_upd_tie_consp_dtls"> 
            <input bind="grdManChild">  
                <input bind="txtdtlmPK" />  
            </input> 
            <output bind="grdManChild" /> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------>
<gw:data id="dat_epil00010_6"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,5,8,9" function="IMEX.sp_sel_tie_consp_dtlm"   procedure="IMEX.sp_upd_tie_consp_dtlm"> 
            <input bind="grdBOMParent">                    
                <input bind="txtMasterPK" /> 
            </input> 
            <output bind="grdBOMParent" /> 
        </dso>    
    </xml> 
</gw:data>  
<!------------------------------------------------------------------>
<gw:data id="dat_epil00010_7"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,6,7,8,10,12,13,14" function="IMEX.sp_sel_tie_consp_dtls"   procedure="IMEX.sp_upd_tie_consp_dtls"> 
            <input bind="grdBOMList">  
                <input bind="txtdtlmPK" />  
            </input> 
            <output bind="grdBOMList" /> 
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table width="100%" cellpadding=0 cellspacing=0 border=0>
            <tr>
                <td colspan="21">
                    
                </td>
            </tr>
            <tr>
                <td height="10"></td>
            </tr>
            <tr>
                <td>Company</td>
                <td colspan="6"><gw:list id="cboCompany" styles="width:100%;"></gw:list></td>
                <td></td>
                <td>Status</td>
                <td></td>
                <td><gw:label id="lbStatus"  text=""  styles='width:100%;color:red; font-weight:700;' /></td>
                <td></td>
                <td colspan="9" align="right">
                    <table cellpadding=0 cellspacing=0 width="100%">
                        <tr>
                            <td width="91%"></td>
                            <td width="1%"><gw:imgbtn id="btnSearch" img="popup" alt="Open form to search" text="Search" onclick="openPopup(3)" /></td>
                            <td width="1%"><gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="onNew(0)" /></td>
                            <td width="1%"><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave(0)" /></td>
                            <td width="1%"><gw:imgbtn id="btnDel" img="delete" alt="Delete" text="Delete" onclick="onDelete(0)" /></td>
                            <td width="1%"><gw:imgbtn id="btnExcel" img="excel" alt="Print" text="Print" onclick="onPrint()" /></td>
                            <td width="1%"><gw:imgbtn id="btnExcelGrp" img="excel" alt="Print Group" text="Print Group" onclick="onPrint1()" /></td>
                            <td width="1%"><gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" text="Confirm" onclick="onConfirmCancel(0)" /></td>
                            <td width="1%"><gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" text="Cancel" onclick="onConfirmCancel(1)" /></td>
                            <td width="1%"><gw:imgbtn id="btnRegenerate" img="registration" alt="Regenerate" text="Regenerate" onclick="onCopyRegen()" /></td>
                            <td width="1%"><gw:imgbtn id="btnCopy" img="copy" alt="Copy" text="Copy" onclick="onCopyRegen()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="10%" nowrap ><a title="Click here to select Customs Office" onclick="openPopup(0)" href="#tips" style="text-decoration : none; color=#0000FF"><b>Customs Office</b></a> </td>
                <td width="10%"><gw:textbox id="txtCusCode"  text=""  styles='width:100%;' csstype="mandatory" /><gw:textbox id="txtCusPK"  text=""  styles='display:none'/></td>
                <td colspan="4" width="25%"><gw:textbox id="txtCusName"  text=""  styles='width:100%;' csstype="mandatory" /></td>
                <td><gw:imgbtn id="btnResetc" img="reset" alt="Reset" text="Reset" onclick="txtCusCode.text='';txtCusPK.text='';txtCusName.text=''" /></td>
                <td width="1%"></td>
                <td width="10%" nowrap >Consumption No</td>
                <td width="1%"></td>
                <td width="10%" colspan="2"><gw:textbox id="txtConstNo"  text=""  styles='width:100%;' csstype="mandatory" /></td>
                <td width="1%"></td>
                <td width="8%" nowrap >Register Date</td>
                <td width="1%"></td>
                <td width="10%"><gw:datebox id="dtRegDate" lang="1" onchange=""/></td>
                <td width="1%"></td>
                <td width="1%"></td>
                <td width="7%"></td>
                <td width="1%"></td>
                <td width="10%"></td>
            </tr> 
            <tr>
                <td >Accept No</td>
                <td colspan="6" width="20%">
                    <table width="100%" border=0 cellpadding=0 cellspacing=0>
                        <tr>                           
                            <td width="50%"><gw:textbox id="txtAcceptNo"  text=""  styles='width:100%;' /></td>
                            <td width="5%"></td>
                            <td align="right" nowrap width="25%">Accept Date</td>
                            <td width="5%"></td>
                            <td width="20%"><gw:datebox id="dtAcceptDate" lang="1" onchange="onAcceptDateChange();"/></td>
                        </tr>
                    </table>                
                </td>
                <td></td>
                <td>Valid Date</td>
                <td></td>
                <td><gw:datebox id="dtValidDate" lang="1" onchange=""/></td>
                <td></td>
                <td></td>
                <td align="center">~</td>
                <td></td>
                <td><gw:datebox id="dtValidDateTo" lang="1" onchange="" nullaccept/></td>
                <td></td>
                <td></td>
                <td>Option</td>
                <td></td>
                <td>
                    <gw:list id="cboOption" styles="width:100%" value='ALL' onchange="onChangeOption();" >
                        <data>Data|Man|Manual|BOM|BOM</data>
                    </gw:list >
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td colspan="11"><gw:textbox id="txtDes"  text=""  styles='width:100%;' /></td>                
                <td></td>
                <td></td>
                <td></td>
                <td nowrap>Close Y/N <gw:checkbox id="chkCloseYN"  defaultvalue="Y|N" value="N" onchange="onCloseDate()" /></td>
                <td></td>
                <td></td>
                <td nowrap >Close Date</td>
                <td></td>
                <td><gw:datebox id="dtCloseDate" lang="1" onchange="" nullaccept /></td>
            </tr>  
            <tr>
                <td colspan="21">
                    <gw:tab id="idTab" onpageactivate="return OnCheckTab()" style="width: 100%; height: 220; border1px">
                        <table id="idManual" name="Manual Info" width="100%" cellpadding=0 cellspacing=0>
                            <tr>
                                <td width="96%"></td> 
                                <td width="1%"><gw:imgbtn id="btnPopup" img="popup" alt="Click to open form search" text="Search" onclick="openPopup(2)" /></td>
                                <td width="1%"><gw:imgbtn id="btnISave" img="save" alt="Save" text="Save" onclick="onSave(1)" /></td>
                                <td width="1%"><gw:imgbtn id="btnIDel" img="delete" alt="Delete" text="Delete" onclick="onDelete(1)" /></td>
                                <td width="1%"><gw:imgbtn id="btnRefresh" img="refresh" alt="Refresh" text="Refresh" onclick="dat_epil00010_4.Call('SELECT');" /></td>
                            </tr>   
                            <tr>
                                <td colspan="5">
                                <%--0._Pk|1._Mst_pk|2_item_pk|3.No|4.Select|5.Parent Code|6.Parent Name|7.HS Code|8.Unit|9._valid_dt'--%>
                                    <gw:grid id='grdManParent'
                                        header='_Pk|_Mst_pk|_item_pk|No.|Select|Parent Code|Parent Name|HS Code|Unit|_valid_dt'
                                        format='0|0|0|0|3|0|0|0|0|0'
                                        aligns='0|0|0|1|1|0|0|0|1|0'
                                        defaults='|||||||||'
                                        editcol='1|0|0|1|1|1|1|1|1|0'
                                        widths='0|0|0|600|1200|2500|4000|1500|1200|0'
                                        sorting='T'
                                        styles='width:100%; height:120'
                                        oncelldblclick="onEditRow(0)"
                                        oncellclick="onRowChange(this)"
                                        acceptNullDate='true'
                                    />
                                </td>
                            </tr>
                            <tr>  
                                <td width="96%"></td>
                                <td width="1%"><gw:imgbtn id="btnMCPopup" img="popup" alt="Click to open form search" text="Search" onclick="openPopup(4)" /></td>
                                <td width="1%"><gw:imgbtn id="btnMCSave" img="save" alt="Save" text="Save" onclick="onSave(2)" /></td>
                                <td width="1%"><gw:imgbtn id="btnMCDel" img="delete" alt="Delete" text="Delete" onclick="onDelete(2)" /></td>
                                <td width="1%"><gw:imgbtn id="btnMCRefresh" img="refresh" alt="Refresh" text="Refresh" onclick="dat_epil00010_5.Call('SELECT');" /></td>
                            </tr>
                            <tr>
                                <td colspan="5">  		
                                    <%--0._Pk|1._Mconsp_dtlm_pk|2_item_pk|3.No|4.Child Code|5.Child Name|6.Unit|7.Request Qty--%>
                                    <%--|8.Loss Rate|9.Loss Qty.|10.Adjust Qty|11.Total Qty.|12.P/Origin|13.Remark'|14._tpr_abbomprodd_pk--%>
                                    <gw:grid id='grdManChild'
                                        header='_Pk|_consp_dtlm_pk|_item_pk|No.|Child Code|Child Name|Unit|Request Qty|Loss Rate|Loss Qty.|Adjust Qty|Total Qty.|P/Origin|Remark|_tpr_abbomprodd_pk'
                                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|1|1|0|1|3|1|3|3|3|0|0|0'
                                        defaults='||||||||||||||'
                                        editcol='1|0|0|1|1|1|1|1|1|1|1|1|1|1|0'
                                        widths='0|0|0|600|1200|2500|1000|1200|1200|1200|1200|1200|1500|2000|0'
                                        sorting='T'
                                        styles='width:100%; height:170'
                                        oncelldblclick="onEditRow(1)"
                                        onafteredit ="onAfterEditting(this)"
                                        acceptNullDate='true'
                                    />                                
                                </td>
                            </tr>
                        </table  >
                        <table id="idBOM" name="BOM Info" width="100%" cellpadding=0 cellspacing=0>
                            <tr>
                                <td width="96%"></td>
                                <td width="1%"><gw:imgbtn id="btnBPopup" img="popup" alt="Click to open form search" text="Search" onclick="openPopup(5)" /></td>
                                <td width="1%"><gw:imgbtn id="btnBSave" img="save" alt="Save" text="Save" onclick="onSave(3)" /></td>
                                <td width="1%"><gw:imgbtn id="btnBDel" img="delete" alt="Delete" text="Delete" onclick="onDelete(3)" /></td>
                                <td width="1%"><gw:imgbtn id="btnBRefresh" img="refresh" alt="Refresh" text="Refresh" onclick="" /></td>
                            </tr>
                            <tr>
                                <td colspan="5"> 
                                    <gw:grid id='grdBOMParent'
                                        header='_Pk|_Mst_pk|_item_pk|No.|Select|Parent Code|Parent Name|HS Code|Unit|_valid_dt'
                                        format='0|0|0|0|3|0|0|0|0|0'
                                        aligns='0|0|0|1|1|0|0|0|1|0'
                                        defaults='|||||||||'
                                        editcol='1|0|0|1|1|1|1|1|1|0'
                                        widths='0|0|0|600|1200|2500|4000|1500|1200|0'
                                        sorting='T'
                                        styles='width:100%; height:120'
                                        oncelldblclick=""
                                        oncellclick="onRowChange(this)"
                                        acceptNullDate='true'
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td width="96%"></td>
                                <td width="1%"></td>
                                <td width="1%"><gw:imgbtn id="btnBCSave" img="save" alt="Save" text="Save" onclick="onSave(4)" /></td>
                                <td width="1%"><gw:imgbtn id="btnBCDel" img="delete" alt="Delete" text="Delete" onclick="onDelete(4)" /></td>
                                <td width="1%"><gw:imgbtn id="btnBCRefresh" img="refresh" alt="Refresh" text="Refresh" onclick="" /></td>
                            </tr>
                            <tr>  
                                <td colspan="5">  
                                    <gw:grid id='grdBOMList'
                                        header='_Pk|_consp_dtlm_pk|_item_pk|No.|Child Code|Child Name|Unit|Request Qty|Loss Rate|Loss Qty.|Adjust Qty|Total Qty.|P/Origin|Remark|_tpr_abbomprodd_pk'
                                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|1|1|0|1|3|1|3|3|3|0|0|0'
                                        defaults='||||||||||||||'
                                        editcol='1|0|0|1|1|1|1|1|1|1|1|1|1|1|0'
                                        widths='0|0|0|600|1200|2500|1000|1200|1200|1200|1200|1200|1500|2000|0'
                                        sorting='T'
                                        styles='width:100%; height:170'
                                        oncelldblclick=""
                                        onafteredit ="onAfterEditting(this)"
                                        acceptNullDate='true'
                                    />
                                </td>
                            </tr>
                        </table>
                    </gw:tab>
                </td>                
            </tr>     
        </table>
    </form>
    <gw:textbox id="txtMasterPK"  text=""  styles='display:none;' />
    <gw:textbox id="txtStatusNum"  text=""  styles='display:none;' />
    <gw:textbox id="txtDeptPK" text=""  styles='display:none;' />
    <gw:textbox id="txtStatus"  text="1"  styles='display:none;' />
    <gw:textbox id="txtdtlmPK"  text=""  styles='display:none;' />
    <gw:textbox id="txtdtlmRow"  text=""  styles='display:none;' /> 
    <gw:textbox id="txtEmpPK"  text=""  styles='display:none;' />
    <gw:datebox id="dtTmp" lang="1"  style='display:none;'  onchange=""/>
</body>
</html>
