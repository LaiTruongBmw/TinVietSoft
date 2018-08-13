<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%> 
<script> 

var emp_id = "<%=Session("LOGIN_ID")%>";

function BodyInit()
{
    //HideAppearColInGrid(1)
    System.Translate(document);
      
   BindingDataList();
    onMergeHead();
    MergeHeader();
   
 
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
         var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    
    
    var ls_lang      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_date_to  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    
    var data = "";
    data = "<%=CtlLib.SetListDataSQL("SELECT b.code, b.code_nm FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.del_if = 0 AND a.ID = 'EACAB036' AND b.del_if = 0 and b.use_yn = 'Y' order by b.ORD")%>";    
    lstReportType.SetDataText(data);
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lblBookccy.SetDataText(arr[1]);
    data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK018') FROM DUAL")%>";
    rdoType.SetDataText(data);
    
    txt_date.text   = ls_trsdate;
    txtrate.SetDataText('1');
    txtScale.SetDataText('1');
    lstCompany.SetDataText(ls_company);
    txtFinancialType.SetDataText("80");
    lstLang.SetDataText(ls_lang);
    lstCurrent.SetDataText(ls_current);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    lstCurrent.SetDataText(lstBook_ccy.GetData());
    lstLang.SetDataText('VIE');
    
     txt_row.text    = 0;
    txtScale.GetControl().focus();
    
    var fg = grid_bs.GetGridControl();
    if (lstCurrent.GetData() == 'VND')
    {
        fg.ColFormat(6) = "###,###R";
        fg.ColFormat(7) = "###,###R";
        fg.ColFormat(8) = "###,###R";
        fg.ColFormat(9) = "###,###R";
        fg.ColFormat(10) = "###,###R";
        fg.ColFormat(12) = "###,###R";
        fg.ColFormat(13) = "###,###R";
        fg.ColFormat(14) = "###,###R";
        fg.ColFormat(15) = "###,###R";
        fg.ColFormat(16) = "###,###R";
    }
    else
    {
        fg.ColFormat(6) = "###,###.##R";
        fg.ColFormat(7) = "###,###.##R";
        fg.ColFormat(8) = "###,###.##R";
        fg.ColFormat(9) = "###,###.##R";
        fg.ColFormat(10) = "###,###.##R";
        fg.ColFormat(12) = "###,###.##R";
        fg.ColFormat(13) = "###,###.##R";
        fg.ColFormat(14) = "###,###.##R";
        fg.ColFormat(15) = "###,###.##R";
        fg.ColFormat(16) = "###,###.##R";
    }    
    
    var fg = grid_ic.GetGridControl();
    if (lstCurrent.GetData() == 'VND')
    {
        
        fg.ColFormat(3) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(3) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(4) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(5) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
    }
    
    var fg = grid_cost.GetGridControl();
    if (lstCurrent.GetData() == 'VND')
    {
        
        fg.ColFormat(3) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(3) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(4) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(5) =  "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
    }
    var fg = grid_cf.GetGridControl();
    if (lstCurrent.GetData() == 'VND')
    {
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
    }
    var fg = grid_bs_2.GetGridControl();
    var i;
   // for(i = 1;i<fg.Rows;i++)
    //{
                fg.ColFormat(4) = "###,###R";
                fg.ColFormat(5) = "###,###R";
                fg.ColFormat(13) = "###,###R";
                fg.ColFormat(14) = "###,###R";
    //}
    OnChangeDateType();
	//idTab_Child.HideTab('1');
	idTab_Child.HideTab('2');
	//idTab_Child.HideTab('3');
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";
	dso_getCompany.Call();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeDateType(){
    CalculateFTDate();
    var quater = lstQuater.GetData();
    var yyyy = dtfrdate.text.substr(6,4);
    var mm = parseInt(dtMonth.GetData().substr(4,2),10);
    var mm1 = mm > 1?mm-1:12;
    mm1=mm1>9?mm1:"0"+mm1;
    mm=mm>9?mm:"0"+mm;
    if(mm1 == 12){ 
        yyyy1=yyyy-1 ;
    }
    else{
        yyyy1=yyyy ;
    }
    var C_ddmmyyyy= dttoCurrent.GetData();
    C_ddmmyyyy = C_ddmmyyyy.substr(6,2) +"/"+ C_ddmmyyyy.substr(4,2)+"/"+ C_ddmmyyyy.substr(0,4); 
    var acc_mmyyyy = dtfrdate.GetData();
    var dtfrom = dtfrdate.GetData();
    var dtTo = dttodate.GetData();
    dtfrom  = dtfrom.substr(6,2) +"/"+ dtfrom.substr(4,2)+"/"+dtfrom.substr(0,4);
    dtTo    = dtTo.substr(6,2) +"/"+ dtTo.substr(4,2)+"/"+ dtTo.substr(0,4);
    acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    //acc_mmyyyy = System.AddDate(acc_mmyyyy);
    acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);
    if(idTab_Child.GetCurrentPageNo() == 0){
        //lstReportType.value=2;
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            grid_bs.SetGridText(0,6,"A(12/"+(yyyy-1)+")");//this period        
            grid_bs.SetGridText(0,7,"B("+mm1+"/"+yyyy1+")");//
            grid_bs.SetGridText(0,8,"C("+mm+"/"+yyyy+")");//
            grid_bs.SetGridText(0,12,"A(12/"+(yyyy-1)+")");//this period
            grid_bs.SetGridText(0,13,"B("+mm1+"/"+yyyy+")");//
            grid_bs.SetGridText(0,14,"C("+mm+"/"+yyyy+")");//
                if(lstReportType.value=='4')
                {
                            grid_bs_2.SetGridText(0,4,mm+"/"+yyyy);// 
                           grid_bs_2.SetGridText(0,5, mm+"/"+yyyy);// 
                           grid_bs_2.SetGridText(0,13, mm+"/"+yyyy);// 
                           grid_bs_2.SetGridText(0,14, mm+"/"+yyyy);// 
                          dtfrdate.SetEnable(false);
                         dttodate.SetEnable(false); 
                }
           
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            grid_bs.SetGridText(0,8,"C("+mm+"/"+yyyy+")");// 
            
            if(lstReportType.value=='4')
                {
                            grid_bs_2.SetGridText(0,4, " "+yyyy+" ");// 
                           grid_bs_2.SetGridText(0,5, " "+yyyy+" ");// 
                           grid_bs_2.SetGridText(0,13, " "+yyyy+" ");// 
                           grid_bs_2.SetGridText(0,14, " "+yyyy+" ");// 
                          dtfrdate.SetEnable(false);
                         dttodate.SetEnable(false); 
                }
        }
        else if(rdoType.GetData() == 4){
            txtDateType.text = "Y";
            lblDateType.text = "A.Current:";
            dtMonth.style.display = "none";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            grid_bs.SetGridText(0,8," From(" +dtfrom+ " To "+dtTo+ ") ");//
           
           if(lstReportType.value=='4')
                {
                            grid_bs_2.SetGridText(0,4, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,5, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,13, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,14, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                          dtfrdate.SetEnable(false);
                         dttodate.SetEnable(false); 
                }
        }
        else if(rdoType.GetData() == 5){
            txtDateType.text = "Y";
            lblDateType.text = "Period:";
            dtMonth.style.display = "none";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            grid_bs.SetGridText(0,8," From (" +dtfrom+ " To " +dtTo+ ") ");//
         
            if(lstReportType.value=='4')
                {
                            grid_bs_2.SetGridText(0,4, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,5, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,13, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                           grid_bs_2.SetGridText(0,14, " From(" +dtfrom+ " To "+dtTo+ ") ");//
                          dtfrdate.SetEnable(false);
                         dttodate.SetEnable(false); 
                }
        }
      }
    else if(idTab_Child.GetCurrentPageNo() == 1){
        //lstReportType.value=1;
        var month = dtMonth.GetData();
          var mm = month.substr(4,2); 
         var grid = grid_ic2.GetGridControl();  
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            //grid_ic.SetGridText(0,6,"Month("+mmyyyy+")");//this period        
            grid_ic.SetGridText(0,7,"Month("+acc_mmyyyy+")");//this period of previous year
            grid_ic.SetGridText(0,8,"Acc Month("+yyyy+")");//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,9,"Acc Month("+(yyyy-1)+")");//accumulate from beginning of previous year to this period - 1 year
            var obj = grid_ic.GetGridControl();
            obj.ColHidden(9) = true;
            obj.ColHidden(8) = false;
                if(mm=='01' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)=0;
                        grid.ColWidth(6)=0; 
                        grid.ColWidth(7)=0;
                        grid.ColWidth(8)=0;  
                        grid.ColWidth(9)=0;
                        grid.ColWidth(10)=0; 
                        grid.ColWidth(11)=0;
                        grid.ColWidth(12)=0;   
                        grid.ColWidth(13)=0;
                        grid.ColWidth(14)=0; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                        
                }
                else if(mm=='02' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)=0;
                        grid.ColWidth(8)=0;  
                        grid.ColWidth(9)=0;
                        grid.ColWidth(10)=0; 
                        grid.ColWidth(11)=0;
                        grid.ColWidth(12)=0;   
                        grid.ColWidth(13)=0;
                        grid.ColWidth(14)=0; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                        
                }
                else if(mm=='03' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)=0;
                        grid.ColWidth(10)=0; 
                        grid.ColWidth(11)=0;
                        grid.ColWidth(12)=0;   
                        grid.ColWidth(13)=0;
                        grid.ColWidth(14)=0; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                        
                }
                 else if(mm=='04' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)=0;
                        grid.ColWidth(12)=0;   
                        grid.ColWidth(13)=0;
                        grid.ColWidth(14)=0; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='05' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)=0;
                        grid.ColWidth(14)=0; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='06' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)=0;
                        grid.ColWidth(16)=0;  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='07' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)=0;
                        grid.ColWidth(18)=0; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='08' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)=0;
                        grid.ColWidth(20)=0; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='09' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)='2000';
                        grid.ColWidth(20)='2000'; 
                        grid.ColWidth(21)=0;
                        grid.ColWidth(22)=0;  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='10' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)='2000';
                        grid.ColWidth(20)='2000'; 
                        grid.ColWidth(21)='2000';
                        grid.ColWidth(22)='2000';  
                        grid.ColWidth(23)=0;
                        grid.ColWidth(24)=0; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='11' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)='2000';
                        grid.ColWidth(20)='2000'; 
                        grid.ColWidth(21)='2000';
                        grid.ColWidth(22)='2000';  
                        grid.ColWidth(23)='2000';
                        grid.ColWidth(24)='2000'; 
                        grid.ColWidth(25)=0;
                        grid.ColWidth(26)=0;  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
                else if(mm=='12' && lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)='2000';
                        grid.ColWidth(20)='2000'; 
                        grid.ColWidth(21)='2000';
                        grid.ColWidth(22)='2000';  
                        grid.ColWidth(23)='2000';
                        grid.ColWidth(24)='2000'; 
                        grid.ColWidth(25)='2000';
                        grid.ColWidth(26)='2000';  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            grid_ic.SetGridText(0,6,"Quater "+quater+ " of " + yyyy);//this period        
            grid_ic.SetGridText(0,7,"Quater "+quater+" of " + (yyyy-1));//this period of previous year
            grid_ic.SetGridText(0,8,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,9,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
            var obj = grid_ic.GetGridControl();
            obj.ColHidden(8) = false;
            obj.ColHidden(9) = false;
           var yyyy = dtYear.GetDarta();
                 /*   if(lstReportType.value=='4')
                   {
                  alert("aaa"); 
                            grid_ic2.SetGridText(0,3, "31/01" + "/" + yyyy);
                            grid_ic2.SetGridText(0,4, "31/01" + "/" + yyyy);
                   } */
                    
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            grid_ic.SetGridText(0,6,"This Year("+yyyy+")");//this period        
            grid_ic.SetGridText(0,7,"Last Year("+(yyyy-1)+")");//this period of previous year
            grid_ic.SetGridText(0,8,"");//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,9,"");//accumulate from beginning of previous year to this period - 1 year
             var obj = grid_ic.GetGridControl();
            obj.ColHidden(8) = true;
            obj.ColHidden(9) = true;
           
             if(lstReportType.value=='4')
                {
                        grid.ColWidth(5)='2000';
                        grid.ColWidth(6)='2000'; 
                        grid.ColWidth(7)='2000';
                        grid.ColWidth(8)='2000';  
                        grid.ColWidth(9)='2000';
                        grid.ColWidth(10)='2000'; 
                        grid.ColWidth(11)='2000';
                        grid.ColWidth(12)='2000';   
                        grid.ColWidth(13)='2000';
                        grid.ColWidth(14)='2000'; 
                        grid.ColWidth(15)='2000';
                        grid.ColWidth(16)='2000';  
                        grid.ColWidth(17)='2000';
                        grid.ColWidth(18)='2000'; 
                        grid.ColWidth(19)='2000';
                        grid.ColWidth(20)='2000'; 
                        grid.ColWidth(21)='2000';
                        grid.ColWidth(22)='2000';  
                        grid.ColWidth(23)='2000';
                        grid.ColWidth(24)='2000'; 
                        grid.ColWidth(25)='2000';
                        grid.ColWidth(26)='2000';  
                       
                       grid.ColWidth(3)='2000';
                        grid.ColWidth(4)='2000';  
                }
        }
      }
     else if(idTab_Child.GetCurrentPageNo() == 2){
        if(rdoType.GetData() == 1){ 
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            //grid_cf.SetGridText(0,6,"Month("+mmyyyy+")");//this period        
            grid_cf.SetGridText(0,7,"Month("+acc_mmyyyy+")");//this period of previous year
            grid_cf.SetGridText(0,8,"Acc Month("+mmyyyy+")");//accumulate from beginning of year to this period
            grid_cf.SetGridText(0,9,"Acc Month("+acc_mmyyyy+")");//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            grid_cf.SetGridText(0,6,"Quater "+quater+ " of " + yyyy);//this period        
            grid_cf.SetGridText(0,7,"Quater "+quater+ " of " + (yyyy-1));//this period of previous year
            grid_cf.SetGridText(0,8,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            grid_cf.SetGridText(0,9,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            grid_cf.SetGridText(0,6,"This Year("+yyyy+")");//this period        
            grid_cf.SetGridText(0,7,"Last Year("+(yyyy-1)+")");//this period of previous year
            grid_cf.SetGridText(0,8,"");//accumulate from beginning of year to this period
            grid_cf.SetGridText(0,9,"");//accumulate from beginning of previous year to this period - 1 year
        }
        
     }
     else if(idTab_Child.GetCurrentPageNo() == 3){
        txtFinancialType.text='73';
        //lstReportType.value=3;
        if(txtFinancialType.GetData() == '73'){
            dso_sel_grd_cost.Call("SELECT");
        }
     }
    
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function CalculateFTDate(){
    //1:Month, 2:Quater, 3:Year
    var yyyymm,yyyy, mm, quater;
    //month
    if(rdoType.GetData() == 1){
        txtDateType.text = "M";
        yyyymm = dtMonth.GetData();
        dtfrdate.SetEnable(true);
        dttodate.SetEnable(true);
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtfrdate.SetDataText(yyyy+mm+"01");
        dttodate.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
        //dtMonth.SetEnable(true);
        dtMonth.style.display="";
        HideAppearColInGrid(1);
    }
    //quater
    else if(rdoType.GetData() == 2){
        txtDateType.text = "Q";
        yyyy = dtYear.GetData();
        quater = lstQuater.GetData();
        if(quater == 1){
            dtfrdate.SetDataText(yyyy + "0101");    
            dttodate.SetDataText(yyyy + "0331");    
        }
        else if(quater == 2){
            dtfrdate.SetDataText(yyyy + "0401");    
            dttodate.SetDataText(yyyy + "0630");    
        }
        else if(quater == 3){
            dtfrdate.SetDataText(yyyy + "0701");    
            dttodate.SetDataText(yyyy + "0930");    
        }
        else if(quater == 4){
            dtfrdate.SetDataText(yyyy + "1001");    
            dttodate.SetDataText(yyyy + "1231");    
        }
        dtfrdate.SetEnable(true);
        dttodate.SetEnable(true);
        HideAppearColInGrid(2);
    }
    //year
    else if(rdoType.GetData() == 3){
        txtDateType.text = "Y";
        dtfrdate.SetEnable(true);
        dttodate.SetEnable(true);
        yyyy = dtYear.GetData();
        dtfrdate.SetDataText(yyyy + "0101");    
        dttodate.SetDataText(yyyy + "1231"); 
        //dtYear.SetEnable(true);
        dtYear.style.display="";
        HideAppearColInGrid(3);
        
    }
    else if(rdoType.GetData() == 4){
        txtDateType.text = "Y";
        yyyy = dtYearCurrent.GetData();
        lblDateType.text='A.Current:';
        dtfrdate.SetDataText(yyyy + "0101");    
        dttodate.SetDataText(dttoCurrent.value); 
        dtYear.style.display="none";
        dtMonth.style.display="none";
        dttodate.SetEnable(false);
        dtfrdate.SetEnable(false);
        HideAppearColInGrid(4);
        
        //dtYear.SetEnable(false);
        //dtMonth.SetEnable(false);
    }
    else if(rdoType.GetData() == 5){
        txtDateType.text = "Y";
        yyyy = dtYearCurrent.GetData();
        lblDateType.text='A.Current:';
        dtfrdate.SetDataText(yyyy + "0101");    
        dttodate.SetDataText(dttoCurrent.value); 
        dtYear.style.display="none";
        dtMonth.style.display="none";
        dttodate.SetEnable(true);
        dtfrdate.SetEnable(true);
        HideAppearColInGrid(4);
        
        //dtYear.SetEnable(false);
        //dtMonth.SetEnable(false);
    }
    onSearch();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnchangeDateFrom()
{
    var dtfrom = dtfrdate.GetData();
    var dtTo = dttodate.GetData();
    dtfrom  = dtfrom.substr(6,2) +"/"+ dtfrom.substr(4,2)+"/"+dtfrom.substr(0,4);
    dtTo    = dtTo.substr(6,2) +"/"+ dtTo.substr(4,2)+"/"+ dtTo.substr(0,4);
    grid_bs.SetGridText(0,8," From (" +dtfrom+ " To " +dtTo+ ") ");//
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnchangeDateTo()
{
    var dtfrom = dtfrdate.GetData();
    var dtTo = dttodate.GetData();
    dtfrom  = dtfrom.substr(6,2) +"/"+ dtfrom.substr(4,2)+"/"+dtfrom.substr(0,4);
    dtTo    = dtTo.substr(6,2) +"/"+ dtTo.substr(4,2)+"/"+ dtTo.substr(0,4);
    grid_bs.SetGridText(0,8," From (" +dtfrom+ " To " +dtTo+ ") ");//
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function LastDayOfMonth(p_yyyymm){
    mm = p_yyyymm.substr(4,2);
    yyyy = p_yyyymm.substr(0,4);
    mm = parseInt(mm,10);
    switch(mm)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          return 31;
          break;
        case 4:
        case 6:
        case 9: 
        case 11:
        return 30;
          break;
        default: 
        if((yyyy%4 == 0)&&(yyyy%100 > 0)){
            return 29;
        }
        else
        {
            return 28;
        }
    }
    return -1;//invalid month
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeMonth(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeQuater(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeYear(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onMergeHead()
{
    grid_bs.GetGridControl().FixedRows = 1;
    //grid_bs.GetGridControl().AllowUserResizing = 0;
    grid_bs.GetGridControl().AutoResize = true;
     grid_bs_2.GetGridControl().FixedRows = 1;
    grid_bs_2.GetGridControl().AutoResize = true;
     
    grid_bs_sum.GetGridControl().FixedRows = 1;
    //grid_bs_sum.GetGridControl().AllowUserResizing = 0;
    grid_bs_sum.GetGridControl().AutoResize = true;
    grid_ic.GetGridControl().FixedRows = 1;
    //grid_ic.GetGridControl().AllowUserResizing = 0;
    grid_ic.GetGridControl().AutoResize = true;
    grid_cf.GetGridControl().FixedRows = 1;
    //grid_cf.GetGridControl().AllowUserResizing = 0;
    grid_cf.GetGridControl().AutoResize = true;

}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onSearch()
{
    if(txtFinancialType.GetData() == '80'){
        dso_sel_grd_balance_sheet.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '81'){
        dso_sel_grd_income.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '82'){
        dso_sel_grd_cf.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '73'){
        dso_sel_grd_cost.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '99'){
        dso_sel_grd_balance_sheet_2.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '74'){
        dso_sel_grd_incom2.Call("SELECT");
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onReport()
{
    if (txtFinancialType.GetData() == '80')
    {
        if (lstLang.GetData() == 'VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                   
                   url = '/standard/reports/gf/ka/gfka00210_bs_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                   System.OpenTargetPage( System.RootURL+url , "newform" ); 
            }    
            else if(lstReportType.value =='2'){
                if(rdoType.value == '1')
                {
                   url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                   System.OpenTargetPage( System.RootURL+url , "newform" );  
                }
                else if(rdoType.value == '3')
                {
                   url = '/standard/reports/gf/ka/gfka00210_bs_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                   System.OpenTargetPage( System.RootURL+url , "newform" );  
                }
                else if(rdoType.value == '4' || rdoType.value == '5')
                {
                   //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                   url = '/standard/reports/gf/ka/gfka00210_bs_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                   System.OpenTargetPage( System.RootURL+url , "newform" );  
                }
                
            }       
            else if(lstReportType.value =='3'){ 
                url = '/standard/reports/gf/ka/gfka00210_bs_monthly_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
           }
        }    
        else if (lstLang.GetData() == 'ENG')
        {
            var url;
            if (lstReportType.value=='1')
                 {
                       url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                       
                       System.OpenTargetPage( System.RootURL+url , "newform" );                        
                 }
                 else if (lstReportType.value == '2')
                 {
                    //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                    url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                    System.OpenTargetPage( System.RootURL+url , "newform" );   
                 }  
             else if (lstReportType.value == '3')
             {
                 url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
              }  
              
            else
            {
                    url = '/standard/reports/gf/ka/gfkarpt00080.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_crt_by=' + emp_id;
                    System.OpenTargetPage( System.RootURL+url , "newform" );
             }
        }
         else if (lstLang.GetData() == 'ENG-VIE')
        {
            var url;
            if (lstReportType.value=='1')
                 {
                    
                        url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                       System.OpenTargetPage( System.RootURL+url , "newform" );  
                 }
             else if (lstReportType.value == '2')
             {
                        url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                        //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                       System.OpenTargetPage( System.RootURL+url , "newform" );  
              }  
             else if (lstReportType.value == '3')
             {
                        url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );  
              } 
            else
            {
                    url = '/standard/reports/gf/ka/gfkarpt00080.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_crt_by=' + emp_id;
                    System.OpenTargetPage( System.RootURL+url , "newform" );
             }
        }
        else if (lstLang.GetData() == 'KOR-VIE')
        {
            var url;
            if (lstReportType.value=='1')
                 {
                        url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );  
                 }
             else if (lstReportType.value == '2')
             {
                         url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                        //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" ); 
              }  
              else if (lstReportType.value == '3')
             {
                        url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" ); 
              }  
            else
            {
                 url = '/standard/reports/gf/ka/gfkarpt00080.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_crt_by=' + emp_id;
                System.OpenTargetPage( System.RootURL+url , "newform" );
             }
        }
         else if (lstLang.GetData() == 'ENG-VIE-KOR')
        {
            var url;
            if (lstReportType.value=='1')
                 {
                    
                    url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_vie_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                       System.OpenTargetPage( System.RootURL+url , "newform" ); 
                 }
             else if (lstReportType.value == '2')
             {
                    //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                       System.OpenTargetPage( System.RootURL+url , "newform" ); 
              }  
              else if (lstReportType.value == '3')
             {
                 url = '/standard/reports/gf/ka/gfka00210_bs_monthly_eng_vie_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                       System.OpenTargetPage( System.RootURL+url , "newform" ); 
              }  
            else
            {
                 url = '/standard/reports/gf/ka/gfkarpt00080.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_crt_by=' + emp_id;
                System.OpenTargetPage( System.RootURL+url , "newform" );
             }
        }
        else if (lstLang.GetData() == 'KOR')
        {
            var url;
            if (lstReportType.value=='1')
            {
                  url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                  
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
            }
             else if (lstReportType.value=='2')
            {
                url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
                //url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
            }
            else if (lstReportType.value=='3')
            {
                url = '/standard/reports/gf/ka/gfka00210_bs_monthly_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
            }
            else 
                 url = '/standard/reports/gf/ka/rpt00080_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_crt_by=' + emp_id;   
                System.OpenTargetPage( System.RootURL+url , "newform" );
        }
        else if (lstLang.GetData() == 'ENG-KOR')
        {
            url = '/standard/reports/gf/ka/gfka00210_bs_monthly_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&lang=' + lstLang.GetData() + '&p_Exrate=' + txtrate1.text ;
            System.OpenTargetPage( System.RootURL+url , "newform" );
        }
    }
    else if (txtFinancialType.GetData() == '81')
   {
        if (lstLang.GetData() == 'ENG')
        {
            var url;
            if(lstReportType.value == '1'){
                    if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
            }    
            else if(lstReportType.value =='2'){
                if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
            
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
                
           }
        }   
        else if (lstLang.GetData() == 'VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }  
                    else if(rdoType.value == '2')
                    {
                       url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
            }    
            else if(lstReportType.value =='2'){ 
                    if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                     System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }  
                    else if(rdoType.value == '2')
                    {
                      url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                     System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                     
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );       
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
           }
        } 
        else if (lstLang.GetData() == 'ENG-VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                    
            }    
            else if(lstReportType.value =='2'){ 
                    if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                       
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_is_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                           System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
               
           }
        } 
         else if (lstLang.GetData() == 'KOR')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }
                  
                 
                  
            }    
            else if(lstReportType.value =='2'){
                if(rdoType.value == '1')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                       
            }
            else if(lstReportType.value =='3'){ 
                 if(rdoType.value == '1')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                 
           }
        } 
        else if (lstLang.GetData() == 'KOR-VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                      
            }    
            else if(lstReportType.value =='2'){
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                      
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" ); 
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                  
           }
        }  
        else if (lstLang.GetData() == 'ENG-VIE-KOR')
        {
            var url;
            if(lstReportType.value == '1'){
                 if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    } 
                     
            }    
            else if(lstReportType.value =='2'){
                    if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                    
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_is_monthly_eng_vie_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_01.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            // url = '/standard/reports/gf/ka/gfka00210_is_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                  
           }
        }                
    }
     else if (txtFinancialType.GetData() == '73')
     {
        if (lstLang.GetData() == 'ENG')
        {
            var url;
            if(lstReportType.value == '1'){
                    if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    
                    
                    
            }    
            else if(lstReportType.value =='2'){ 
                    
                    if(rdoType.value == '1')
                    {
                            url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
							//url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    
            }
            else if(lstReportType.value =='3'){ 
                
                    if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                    else if(rdoType.value == '2')
                    {
                        url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    } 
                  
           }
        } 
        else if (lstLang.GetData() == 'VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                 if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    } 
                     
            }    
            else if(lstReportType.value =='2'){ 
                    if(rdoType.value == '1')
                    {
                             //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
							 url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
                             System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                          url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                        System.OpenTargetPage( System.RootURL+url , "newform" );     
                    } 
                    
            }
            else if(lstReportType.value =='3'){
                 if(rdoType.value == '1')
                    {
                         url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                          url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                         System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                 
           }
        }    
        else if (lstLang.GetData() == 'KOR')
        {
            var url;
            if(lstReportType.value == '1'){
                    if(rdoType.value == '1')
                    {
                                url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                                System.OpenTargetPage( System.RootURL+url , "newform" );       
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                           url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                   
            }    
            else if(lstReportType.value =='2'){ 
                if(rdoType.value == '1')
                    {
                                url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
								//url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                                System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }  
                      
            }
            else if(lstReportType.value =='3'){
                if(rdoType.value == '1')
                    {
                              url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );  
                    }  
                    else if(rdoType.value == '2')
                    {
                    url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );    
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }   
                  
           }
        }      
        else if (lstLang.GetData() == 'KOR-VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                    if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                                url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                                System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }   
                    
            }    
            else if(lstReportType.value =='2'){ 
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
							//url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );       
                    }  
                    else if(rdoType.value == '2')
                    {
                     url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                 System.OpenTargetPage( System.RootURL+url , "newform" );        
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }   
                   
            }
            else if(lstReportType.value =='3'){
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );       
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }    
                  
           }
        }
        else if (lstLang.GetData() == 'ENG-VIE')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                                url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                                System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );        
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }    
                    
            }    
            else if(lstReportType.value =='2'){
                if(rdoType.value == '1')
                    {
                              url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
							  //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );         
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );          
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }    
                    
            }
            else if(lstReportType.value =='3'){
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );         
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );        
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }     
                  
           }
        }          
        else if (lstLang.GetData() == 'ENG-VIE-KOR')
        {
            var url;
            if(lstReportType.value == '1'){
                if(rdoType.value == '1')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );         
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );       
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }     
                     
            }    
            else if(lstReportType.value =='2'){ 
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/60/08/60080260_M_Manufacturing.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData() + '&p_rate1=' + txtrate.text + '&p_rate2=' + txtrate1.text + '&p_lang=' + lstLang.value;
							 //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );         
                    }  
                    else if(rdoType.value == '2')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_2.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );      
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }     
                     
            }
            else if(lstReportType.value =='3'){ 
                if(rdoType.value == '1')
                    {
                             url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                             System.OpenTargetPage( System.RootURL+url , "newform" );         
                    }  
                    else if(rdoType.value == '2')
                    {
                            url = '/standard/reports/gf/ka/gfka00210_mc_monthly_eng_vie_kor_3.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                            System.OpenTargetPage( System.RootURL+url , "newform" );     
                    }
                    else if(rdoType.value == '3' || rdoType.value == '4')
                    {
                              url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_03.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                              //url = '/standard/reports/gf/ka/gfka00210_mc_monthly_kor_1.aspx?p_kind=' + txtFinancialType.GetData() + '&p_status='+ rbstatus.GetData() +'&p_tco_company_pk=' + lstCompany.GetData() + '&p_date_fr=' + dtfrdate.GetData() + '&p_date_to=' + dttodate.GetData() +  '&p_date_type=' + txtDateType.GetData() + '&p_scale=' + txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );   
                    }   
               
           }
        }              
      }
    else if (txtFinancialType.GetData() == '82')
    {
       var r,f_nm;
       r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData();
       
       if (rdoType.value=='1')//Monthly
       {
            if (lstLang.GetData()=='VIE')//mo file tieng viet
            {
                f_nm='gfka00210_CF_PERIOD_VIE.aspx';
            }
             else if (lstLang.GetData() == 'ENG') //mo file tieng anh
             {
                f_nm='gfka00210_CF_PERIOD_ENG.aspx';  
              }
               else 
               {
                    f_nm='gfka00080_CF_PERIOD_KOR.aspx';     
               }
       }
       else if (rdoType.value=='2') //Quarter 
       {   
        r=r+"&p_quarter="+lstQuater.GetData(); 
            if (lstLang.GetData()=='VIE')//mo file tieng viet
                f_nm='gfka00210_CF_QUARTER_VIE.aspx';               
             else if (lstLang.GetData() == 'ENG') //mo file tieng anh
                f_nm='gfka00210_CF_QUARTER_ENG.aspx';               
               else 
                    f_nm='gfka00210_CF_QUARTER_KOR.aspx';              
       } 
       else
       {
            if (lstLang.GetData()=='VIE')//mo file tieng viet
                    f_nm='gfka00210_CF_VIE.aspx';                    
                 else if (lstLang.GetData() == 'ENG') //mo file tieng anh                    
                    f_nm='gfka00210_CF_ENG.aspx';  
                   else 
                        f_nm='gfka00210_CF_KOR.aspx';  
       }
       var url='/standard/reports/gf/ka/'+f_nm+r;       
       System.OpenTargetPage( System.RootURL+url , "newform" );
    }
    else if (txtFinancialType.GetData() == '99')
    {
            if(lstLang.value=='ENG' || lstLang.value=='VIE'  && lstReportType.value=='4')
           {
                         url = '/standard/reports/gf/ka/gfka00210_ENG.aspx?kind=' + txtFinancialType.GetData() + '&status='+ rbstatus.GetData() +'&company=' + lstCompany.GetData() + '&from=' + dtfrdate.GetData() + '&to=' + dttodate.GetData() +  '&date_type=' + txtDateType.GetData() + '&scale=' + txtScale.GetData() + '&exrate=' + txtrate1.text + '&balance=' + rdoType.value + '&month=' + dtMonth.value + '&year=' + dtYear.value + '&ccy=' + lstCurrent.value + '&lang=' + lstLang.value;
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
           } 
    }
    else if (txtFinancialType.GetData() == '74')
    {
            if(lstLang.value=='ENG' || lstLang.value=='VIE'  && lstReportType.value=='4')
           {
                         url = '/standard/reports/gf/ka/gfka00210_Income.aspx?kind=' + txtFinancialType.GetData() + '&status='+ rbstatus.GetData() +'&company=' + lstCompany.GetData() + '&from=' + dtfrdate.GetData() + '&to=' + dttodate.GetData() +  '&date_type=' + txtDateType.GetData() + '&scale=' + txtScale.GetData() + '&exrate=' + txtrate1.text + '&balance=' + rdoType.value + '&month=' + dtMonth.value + '&year=' + dtYear.value + '&ccy=' + lstCurrent.value + '&lang=' + lstLang.value;
                 System.OpenTargetPage( System.RootURL+url , "newform" );   
           } 
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onSetMonth(p_bool)
{
    if (p_bool)
    {
        dtfrdate.style.display = '';
        dttodate.style.display = '';
        //dtfrmonth.style.display = 'none';
        //dttomonth.style.display = 'none';
    }
    else
    {
        dtfrdate.style.display = 'none';
        dttodate.style.display = 'none';
        //dtfrmonth.style.display = '';
        //dttomonth.style.display = '';
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeList()
{
    if (txtFinancialType.GetData() == '80')
    {
        idTab_Child.SetPage(0);
        onSetMonth(true);
    }
    else if(txtFinancialType.GetData() == '99')
    {
            idTab_Child.SetPage(0);
        onSetMonth(true);
    }
    else if (txtFinancialType.GetData() == '81')
    {
        idTab_Child.SetPage(1);
        onSetMonth(false);
    }
    else if (txtFinancialType.GetData() == '82')
    {
        idTab_Child.SetPage(2);
        onSetMonth(false);
    }
    else if (txtFinancialType.GetData() == '73')
    {
        idTab_Child.SetPage(3);
        onSetMonth(false);
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onSetDataList()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        switch(lstReportType.GetData())
        {
            case "1":
              txtFinancialType.SetDataText('80');
              grid_bs_2.style.display="none";
              grid_bs.style.display="";
              lstCurrent.SetDataText('VND');
            break;
            case "2":
              txtFinancialType.SetDataText('80');
              grid_bs_2.style.display="none";
              grid_bs.style.display="";
              lstCurrent.SetDataText('VND');
            break;
            case "3":
              txtFinancialType.SetDataText('70');
              grid_bs_2.style.display="none";
              grid_bs.style.display="";
              lstCurrent.SetDataText('VND');
            break;
            case "4":
              txtFinancialType.SetDataText('99');
              grid_bs_2.style.display="";
              grid_bs.style.display="none";
              lstCurrent.SetDataText('USD');
              
            break; 
        }    
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        switch(lstReportType.GetData())
        {
            case "1":
              txtFinancialType.SetDataText('81');
               grid_ic2.style.display="none";
              grid_ic.style.display="";
              lstCurrent.SetDataText('VND');
            break;
            case "2":
              txtFinancialType.SetDataText('81');
               grid_ic2.style.display="none";
              grid_ic.style.display="";
              lstCurrent.SetDataText('VND');
            break;
            case "3":
              txtFinancialType.SetDataText('71');
               grid_ic2.style.display="none";
              grid_ic.style.display="";
              lstCurrent.SetDataText('VND');
            break;
           case "4":
                txtFinancialType.SetDataText('74');
                grid_ic2.style.display="";
              grid_ic.style.display="none";
         
           break; 
        }    
        
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    { 
        switch(lstReportType.GetData())
        {
            case "1":
              txtFinancialType.SetDataText('82');
            break;
            case "2":
              txtFinancialType.SetDataText('82');
            break;
            case "3":
              txtFinancialType.SetDataText('82');
            break;
        }    
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        switch(lstReportType.GetData())
        {
            case "1":
              txtFinancialType.SetDataText('15');
            break;
            case "2":
              txtFinancialType.SetDataText('15');
            break;
            case "3":
              txtFinancialType.SetDataText('73');
            break;
        }    
    }
    OnChangeDateType();
    OnChangeLang();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeLang()
{
    switch(lstLang.GetData())
    {
        case 'VIE':
            // income statement
            grid_ic.GetGridControl().ColHidden(0) = true;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = true;
            grid_ic.GetGridControl().ColWidth(0)  = "0";
            grid_ic.GetGridControl().ColWidth(1)  = "5000";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            // cost
            grid_cost.GetGridControl().ColHidden(0) = true;
            grid_cost.GetGridControl().ColHidden(1) = false;
            grid_cost.GetGridControl().ColHidden(2) = true;
            grid_cost.GetGridControl().ColWidth(0)  = "0";
            grid_cost.GetGridControl().ColWidth(1)  = "5000";
            grid_cost.GetGridControl().ColWidth(2)  = "0";
            //
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_cf.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_cf.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = true;
            grid_cf.GetGridControl().ColHidden(2) = true;
            grid_bs.GetGridControl().ColWidth(0)  = "5000";
            grid_cf.GetGridControl().ColWidth(0)  = "5000";
            // cost
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = true;
            grid_bs.GetGridControl().ColWidth(0)  = "0";
            grid_bs.GetGridControl().ColWidth(1)  = "5000";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
           
            /*grid_bs_2.GetGridControl().ColHidden(0) = true;
            grid_bs_2.GetGridControl().ColHidden(1) = false;
            
          
            grid_bs_2.GetGridControl().ColWidth(0)  = "5000";
            grid_bs_2.GetGridControl().ColWidth(1)  = "0"; */
        break;
        case 'ENG':
            //income statement
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = true;
            grid_ic.GetGridControl().ColHidden(2) = true;
            grid_ic.GetGridControl().ColWidth(1)  = "0";
            grid_ic.GetGridControl().ColWidth(0)  = "5000";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            //cost
            grid_cost.GetGridControl().ColHidden(0) = false;
            grid_cost.GetGridControl().ColHidden(1) = true;
            grid_cost.GetGridControl().ColHidden(2) = true;
            grid_cost.GetGridControl().ColWidth(1)  = "0";
            grid_cost.GetGridControl().ColWidth(0)  = "5000";
            grid_cost.GetGridControl().ColWidth(2)  = "0";
            //
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_cf.GetGridControl().ColHidden(0) = true;
            
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_cf.GetGridControl().ColHidden(1) = false;
            
            grid_bs.GetGridControl().ColHidden(2) = true;
            grid_cf.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColWidth(1)  = "5000";
            grid_cf.GetGridControl().ColWidth(1)  = "5000";
            //cost
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = true;
            grid_bs.GetGridControl().ColWidth(1)  = "0";
            grid_bs.GetGridControl().ColWidth(0)  = "5000";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
        break;
        case 'KOR':
            // income statement
            grid_ic.GetGridControl().ColHidden(0) = true;
            grid_ic.GetGridControl().ColHidden(1) = true;
            grid_ic.GetGridControl().ColHidden(2) = false;
            grid_ic.GetGridControl().ColWidth(2)  = "5000";
            // cost
            grid_cost.GetGridControl().ColHidden(0) = true;
            grid_cost.GetGridControl().ColHidden(1) = true;
            grid_cost.GetGridControl().ColHidden(2) = false;
            grid_cost.GetGridControl().ColWidth(2)  = "5000";
            
            //
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_cf.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_cf.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            grid_cf.GetGridControl().ColHidden(2) = false;
            grid_bs.GetGridControl().ColWidth(2)  = "5000";
            grid_cf.GetGridControl().ColWidth(2)  = "5000";
            // balane sheet
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            grid_bs.GetGridControl().ColWidth(2)  = "5000";
        break;
        case 'KOR-VIE':
            //income statement
             grid_ic.GetGridControl().ColHidden(0) = true;
             grid_ic.GetGridControl().ColHidden(1) = false;
             grid_ic.GetGridControl().ColHidden(2) = false;
             grid_ic.GetGridControl().ColWidth(0)  = "0";
             grid_ic.GetGridControl().ColWidth(1)  = "5000";
             grid_ic.GetGridControl().ColWidth(2)  = "5000";
             //cost
             grid_cost.GetGridControl().ColHidden(0) = true;
             grid_cost.GetGridControl().ColHidden(1) = false;
             grid_cost.GetGridControl().ColHidden(2) = false;
             grid_cost.GetGridControl().ColWidth(0)  = "0";
             grid_cost.GetGridControl().ColWidth(1)  = "5000";
             grid_cost.GetGridControl().ColWidth(2)  = "5000";
             //balance sheet
             grid_bs.GetGridControl().ColHidden(0) = true;
             grid_bs.GetGridControl().ColHidden(1) = false;
             grid_bs.GetGridControl().ColHidden(2) = false;
             grid_bs.GetGridControl().ColWidth(0)  = "0";
             grid_bs.GetGridControl().ColWidth(1)  = "5000";
             grid_bs.GetGridControl().ColWidth(2)  = "5000";
        break;
        case 'ENG-VIE':
            //income statement
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = true;
            grid_ic.GetGridControl().ColWidth(0)  = "5000";
            grid_ic.GetGridControl().ColWidth(1)  = "5000";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            // cost
            grid_cost.GetGridControl().ColHidden(0) = false;
            grid_cost.GetGridControl().ColHidden(1) = false;
            grid_cost.GetGridControl().ColHidden(2) = true;
            grid_cost.GetGridControl().ColWidth(0)  = "5000";
            grid_cost.GetGridControl().ColWidth(1)  = "5000";
            grid_cost.GetGridControl().ColWidth(2)  = "0";
            // balance sheet
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = true;
            grid_bs.GetGridControl().ColWidth(0)  = "5000";
            grid_bs.GetGridControl().ColWidth(1)  = "5000";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
        break;
        case 'ENG-VIE-KOR':
            //income statement
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = false;
            grid_ic.GetGridControl().ColWidth(0)  = "5000";
            grid_ic.GetGridControl().ColWidth(1)  = "5000";
            grid_ic.GetGridControl().ColWidth(2)  = "5000";
            //cost
            grid_cost.GetGridControl().ColHidden(0) = false;
            grid_cost.GetGridControl().ColHidden(1) = false;
            grid_cost.GetGridControl().ColHidden(2) = false;
            grid_cost.GetGridControl().ColWidth(0)  = "5000";
            grid_cost.GetGridControl().ColWidth(1)  = "5000";
            grid_cost.GetGridControl().ColWidth(2)  = "5000";
            //balance sheet
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = false;
            grid_bs.GetGridControl().ColWidth(0)  = "5000";
            grid_bs.GetGridControl().ColWidth(1)  = "5000";
            grid_bs.GetGridControl().ColWidth(2)  = "5000";
        break;
		case 'ENG-KOR':
            //balance sheet
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            grid_bs.GetGridControl().ColWidth(0)  = "5000";
            grid_bs.GetGridControl().ColWidth(1)  = "0";
            grid_bs.GetGridControl().ColWidth(2)  = "5000";
        break;
    }
    
   
    
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(p_oData)
{
        if(p_oData.id == 'dso_sel_grd_balance_sheet')
       {
                var fg = grid_bs.GetGridControl();
  
              if(lstReportType.GetData() == 1)
              {
                        for(var i=11;i<=18;i++)
                         fg.ColHidden(i) = false;
                        
                        SplitData();
              }
             
              else
              {
                         for(var i=11;i<=18;i++)
                         fg.ColHidden(i) = true;
              }
              
             
       } 
       else if(p_oData.id == 'dso_sel_grd_balance_sheet_2')
       {
                 var fg = grid_bs_2.GetGridControl();
                  if(lstReportType.GetData() == 4)
              {
                        for(var i=9;i<=17;i++)
                         fg.ColHidden(i) = false;
                        
                        SplitData();
                       dso_get_rate.Call(); 
              }
              {
                         for(var i=15;i<=17;i++)
                        fg.ColHidden(i) = true;
              }
       }
       
       
        onSetFont(p_oData);
        MergeHeader();
  
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function onSetFont(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_grd_balance_sheet":
            var ctrl = grid_bs.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            //first group
	            if(grid_bs.GetGridData(i,5)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 10) = false;
	                grid_bs.SetCellBold(i, 0, i, 10, true);
                }
                else if (grid_bs.GetGridData(i,5)== "I")
                {
	                grid_bs.SetCellBold(i, 0, i, 10, false);
	                ctrl.Cell(14, i, 0, i, 10) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 10) = false;
	                grid_bs.SetCellBold(i, 0, i, 10, false);
	            }
	            //set color
	            //alert(Number(grid_bs.GetGridData(i, 4)))
	            grid_bs.SetCellBgColor(i, 0, i, 10, Number(grid_bs.GetGridData(i, 4)));
	            
	            //second group
	            if(grid_bs.GetGridData(i,18)== "B")
                {
	                ctrl.Cell(14, i, 11, i, 18) = false;
	                grid_bs.SetCellBold(i, 11, i, 18, true);
                }
                else if (grid_bs.GetGridData(i,18)== "I")
                {
	                grid_bs.SetCellBold(i, 11, i, 18, false);
	                ctrl.Cell(14, i, 11, i, 18) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 11, i, 18) = false;
	                grid_bs.SetCellBold(i, 11, i, 18, false);
	            }
	            //set color
	            grid_bs.SetCellBgColor(i, 11, i, 18, Number(grid_bs.GetGridData(i, 17)));
	        }
        break;
       
       case "dso_sel_grd_balance_sheet_2":
            var ctrl = grid_bs_2.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            //first group
	            if(grid_bs_2.GetGridData(i,7)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 8) = false;
	                grid_bs_2.SetCellBold(i, 0, i, 8, true);
                }
                else if (grid_bs_2.GetGridData(i,7)== "I")
                {
	                grid_bs_2.SetCellBold(i, 0, i, 8, false);
	                ctrl.Cell(14, i, 0, i, 8) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 8) = false;
	                grid_bs_2.SetCellBold(i, 0, i, 8, false);
	            }
	            //set color
	            //alert(Number(grid_bs.GetGridData(i, 4)))
	            grid_bs_2.SetCellBgColor(i, 0, i, 8, Number(grid_bs_2.GetGridData(i, 6)));
	            
	            //second group
	            if(grid_bs_2.GetGridData(i,16)== "B")
                {
	                ctrl.Cell(14, i, 9, i, 17) = false;
	                grid_bs_2.SetCellBold(i, 9, i, 17, true);
                }
                else if (grid_bs_2.GetGridData(i,16)== "I")
                {
	                grid_bs_2.SetCellBold(i, 9, i, 17, false);
	                ctrl.Cell(14, i, 9, i, 17) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 9, i, 17) = false;
	                grid_bs_2.SetCellBold(i, 9, i, 17, false);
	            }
	            //set color
	            grid_bs_2.SetCellBgColor(i, 9, i, 17, Number(grid_bs_2.GetGridData(i, 15)));
	        }
        break; 
        
        case "dso_sel_grd_income":
            var ctrl = grid_ic.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            if(grid_ic.GetGridData(i,11)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 12) = false;
	                grid_ic.SetCellBold(i, 0, i, 12, true);
                }
                else if (grid_ic.GetGridData(i,11)== "I")
                {
	                grid_ic.SetCellBold(i, 0, i, 12, false);
	                ctrl.Cell(14, i, 0, i, 12) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 11) = false;
	                grid_ic.SetCellBold(i, 0, i, 12, false);
	            }
	          //set color
	            grid_ic.SetCellBgColor(i, 0, i, 12, Number(grid_ic.GetGridData(i, 12)));   
	        }
        break;
       case "dso_sel_grd_incom2":
            var ctrl = grid_ic2.GetGridControl();
           
            for (i = 2; i < ctrl.Rows; i++)
	        {
	            if(grid_ic2.GetGridData(i,30)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 33) = false;
	                grid_ic2.SetCellBold(i, 0, i, 33, true);
                }
                else if (grid_ic2.GetGridData(i,30)== "I")
                {
	                grid_ic2.SetCellBold(i, 0, i, 33, false);
	                ctrl.Cell(14, i, 0, i, 33) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 33) = false;
	                grid_ic2.SetCellBold(i, 0, i, 33, false);
	            }
	          //set color
	            grid_ic2.SetCellBgColor(i, 0, i, 33, Number(grid_ic2.GetGridData(i, 29)));   
	        }
        break; 
        case "dso_sel_grd_cost":
            var ctrl = grid_cost.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            if(grid_cost.GetGridData(i,11)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 12) = false;
	                grid_cost.SetCellBold(i, 0, i, 12, true);
                }
                else if (grid_cost.GetGridData(i,11)== "I")
                {
	                grid_cost.SetCellBold(i, 0, i, 12, false);
	                ctrl.Cell(14, i, 0, i, 12) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 11) = false;
	                grid_cost.SetCellBold(i, 0, i, 12, false);
	            }
	          //set color
	            grid_cost.SetCellBgColor(i, 0, i, 12, Number(grid_cost.GetGridData(i, 12)));   
	        }
        break;
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function OnChangeCurrent()
{
    dso_get_rate.Call();
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function SplitData(){
    
    if(txtFinancialType.text=='80')
    {
                    var midle = (grid_bs.rows-1)/2;
                    for(var i=1;i<=midle;i++)
                    {
                                grid_bs.SetGridText(i,11,grid_bs.GetGridData(i+midle,0));//item
                                grid_bs.SetGridText(i,12,grid_bs.GetGridData(i+midle,6));//
                                grid_bs.SetGridText(i,13,grid_bs.GetGridData(i+midle,7));
                                grid_bs.SetGridText(i,14,grid_bs.GetGridData(i+midle,8));
                                grid_bs.SetGridText(i,15,grid_bs.GetGridData(i+midle,9));
                                grid_bs.SetGridText(i,16,grid_bs.GetGridData(i+midle,10));
                                grid_bs.SetGridText(i,17,grid_bs.GetGridData(i+midle,4));
                                grid_bs.SetGridText(i,18,grid_bs.GetGridData(i+midle,5));
                    }
                    for(var i=1;i<=midle;i++)
                    {
                            grid_bs.RemoveRowAt(grid_bs.rows-1); 
                    }
    }
    else if(txtFinancialType.text == '99')    
    {
        
                    var midle_2 = (grid_bs_2.rows-1)/2; 
                    for(var i=1;i<=midle_2;i++)
                    {
                                grid_bs_2.SetGridText(i,9,grid_bs_2.GetGridData(i+midle_2,0));//Resource
                                grid_bs_2.SetGridText(i,10,grid_bs_2.GetGridData(i+midle_2,1));//korean
                                grid_bs_2.SetGridText(i,11,grid_bs_2.GetGridData(i+midle_2,2));//Code
                                grid_bs_2.SetGridText(i,12,grid_bs_2.GetGridData(i+midle_2,3));//note
                                grid_bs_2.SetGridText(i,13,grid_bs_2.GetGridData(i+midle_2,4));//month
                                grid_bs_2.SetGridText(i,14,grid_bs_2.GetGridData(i+midle_2,5));//month
                                grid_bs_2.SetGridText(i,15,grid_bs_2.GetGridData(i+midle_2,6));//print corlor
                                grid_bs_2.SetGridText(i,16,grid_bs_2.GetGridData(i+midle_2,7));//font style
                                grid_bs_2.SetGridText(i,17,grid_bs_2.GetGridData(i+midle_2,8));//level
                    }
                    for(var i=1;i<=midle_2;i++)
                    {
                                  grid_bs_2.RemoveRowAt(grid_bs_2.rows-1);  
                     }
   
    }
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function MergeHeader()
{
    // income statement
   	if (grid_ic.rows < 2)
	{
	    grid_ic.AddRow();
	}
    var fg=grid_ic.GetGridControl();
	fg.FixedRows = 2
	fg.MergeCells = 5
	
	fg.MergeCol(0) = true
	fg.Cell(0, 0, 0, 1, 0) = "Classification"
	fg.MergeCol(1) = true
	fg.Cell(0, 0, 1, 1, 1)  = "Chỉ tiêu"
	fg.MergeCol(2) = true
	fg.Cell(0, 0, 2, 1, 2)  = "Korea"
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 3, 0, 7) = "Period"  
	fg.Cell(0, 0, 8, 0, 10) = "Accumulate" 
	var l_year  = Number(dtMonth.GetData().substr(0,4)) -1 ;
	var l_month = Number(dtMonth.GetData().substr(4,2)) -1 
	
	if(l_month < 10)
	{
	    l_month = '0' + l_month;
	}
	fg.Cell(0, 1, 3, 1) 	= dtMonth.text.substr(0,2) + "/" + l_year + "(a)"
	fg.Cell(0, 1, 4, 1 ) 	= l_month + "/"+ dtMonth.GetData().substr(0,4) + "(b)"
    var dtfrom = dtfrdate.GetData();
    var dtTo = dttodate.GetData();
    dtfrom  = dtfrom.substr(6,2) +"/"+ dtfrom.substr(4,2)+"/"+dtfrom.substr(0,4);
    dtTo    = dtTo.substr(6,2) +"/"+ dtTo.substr(4,2)+"/"+ dtTo.substr(0,4);
	if(rdoType.value==1||rdoType.value==2||rdoType.value==3)
	{
	    fg.Cell(0, 1, 5, 1) 	= dtMonth.text +  "(c)"
	}
	else if(rdoType.value==4 || rdoType.value==5)
	{
	    fg.Cell(0, 1, 5, 1) 	= " From (" +dtfrom+ " To " +dtTo+ ") "
	}
	fg.Cell(0, 1, 6, 1 ) 	= "Variance(c-a)"
	fg.Cell(0, 1, 7, 1) 	= "Variance(c-b)"
	
	fg.Cell(0, 1, 8, 1 ) 	= "01/" + l_year + "~" + dtMonth.GetData().substr(4,2)+"/"+ l_year  + "(e)"
	fg.Cell(0, 1, 9, 1 ) 	= "01/" + dtMonth.GetData().substr(0,4) +"~" + dtMonth.text +"(f)"
	fg.Cell(0, 1, 10, 1) 	= "Variance(f-e)"
	
	// Manufacturing cost
	
	if (grid_cost.rows < 2)
	{
	    grid_cost.AddRow();
	}
    var fg=grid_cost.GetGridControl();
	fg.FixedRows = 2
	fg.MergeCells = 5
	
	fg.MergeCol(0) = true
	fg.Cell(0, 0, 0, 1, 0) = "Classification"
	fg.MergeCol(1) = true
	fg.Cell(0, 0, 1, 1, 1)  = "Chỉ tiêu"
	fg.MergeCol(2) = true
	fg.Cell(0, 0, 2, 1, 2)  = "Korea"
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 3, 0, 7) = "Period"  
	fg.Cell(0, 0, 8, 0, 10) = "Accumulate" 
	var l_year  = Number(dtMonth.GetData().substr(0,4)) -1 ;
	var l_month = Number(dtMonth.GetData().substr(4,2)) -1 
	
	if(l_month < 10)
	{
	    l_month = '0' + l_month;
	}
	fg.Cell(0, 1, 3, 1) 	= dtMonth.text.substr(0,2) + "/" + l_year + "(a)"
	fg.Cell(0, 1, 4, 1 ) 	= l_month + "/"+ dtMonth.GetData().substr(0,4) + "(b)"
	if(rdoType.value==1||rdoType.value==2||rdoType.value==3)
	{
	    fg.Cell(0, 1, 5, 1) 	= dtMonth.text +  "(c)"
	}
	else if(rdoType.value==4 || rdoType.value==5)
	{
	    fg.Cell(0, 1, 5, 1) 	= " From (" +dtfrom+ " To " +dtTo+ ") "
	}
	fg.Cell(0, 1, 6, 1 ) 	= "Variance(c-a)"
	fg.Cell(0, 1, 7, 1) 	= "Variance(c-b)"
	
	fg.Cell(0, 1, 8, 1 ) 	= "01/" + l_year + "~" + dtMonth.GetData().substr(4,2)+"/"+ l_year  + "(e)"
	fg.Cell(0, 1, 9, 1 ) 	= "01/" + dtMonth.GetData().substr(0,4) +"~" + dtMonth.text +"(f)"
	fg.Cell(0, 1, 10, 1) 	= "Variance(f-e)"
	//-----------------------------------------
	
	
	
	
	
	var month = dtMonth.GetData();
	var year = dtYear.GetData();
	var mm = month.substr(4,2);
	var yyyy;
	
	if(rdoType.value=='1' && lstReportType.value=='4')
	{
	        
	        yyyy = month.substr(0,4);
	 
	}
	if(rdoType.value=='3' || rdoType.value=='4' || rdoType.value=='5' && lstReportType.value=='4')
	{
	        yyyy = dtYear.GetData();
	     
	}
	
	 if (grid_ic2.rows < 2)
	{
	    grid_ic2.AddRow();
	}
    var fg=grid_ic2.GetGridControl();
	fg.FixedRows = 2
	fg.MergeCells = 5
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 0, 0, 1) = "Items"  
	
	fg.MergeCol(2) = true
	fg.Cell(0, 0, 2, 1, 2)  = "Code"
	        fg.Cell(0, 0, 3, 0, 4) = "31"+ "/" + "01" + "/" + yyyy 
	fg.Cell(0, 0, 5, 0, 6) = "28"+ "/" + "02" + "/" + yyyy 
	fg.Cell(0, 0, 7, 0, 8) = "31"+ "/" + "03" + "/" + yyyy 
	fg.Cell(0, 0, 9, 0, 10) = "30"+ "/" + "04" + "/" + yyyy 
	fg.Cell(0, 0, 11, 0, 12) = "31"+ "/" + "05" + "/" + yyyy 
	fg.Cell(0, 0, 13, 0, 14) = "30"+ "/" + "06" + "/" + yyyy 
	fg.Cell(0, 0, 15, 0, 16) = "31"+ "/" + "07" + "/" + yyyy 
	fg.Cell(0, 0, 17, 0, 18) = "31"+ "/" + "08" + "/" + yyyy 
	fg.Cell(0, 0, 19, 0, 20) = "30"+ "/" + "09" + "/" + yyyy 
	fg.Cell(0, 0, 21, 0, 22) = "31"+ "/" + "10" + "/" + yyyy 
	fg.Cell(0, 0, 23, 0, 24) = "30"+ "/" + "11" + "/" + yyyy 
	fg.Cell(0, 0, 25, 0, 26) = "31"+ "/" + "12" + "/" + yyyy 
	fg.Cell(0, 0, 27, 0, 28) = "Year to date" 
	fg.Cell(0, 1, 27, 1, 27) = "VND" 
    
	
}
//-----------------------------------------------------------------------------------------------------------------------------------------
function HideAppearColInGrid(opt)
	{
	    if(opt == 4)
	    {
	        //balance sheet
	        grid_bs.GetGridControl().ColHidden(3) = true;
		    grid_bs.GetGridControl().ColHidden(4) = true;
	        grid_bs.GetGridControl().ColHidden(5) = true;
		    grid_bs.GetGridControl().ColHidden(6) = true;
    		
	        grid_bs.GetGridControl().ColHidden(7) = true;
		    grid_bs.GetGridControl().ColHidden(9) = true;
		    grid_bs.GetGridControl().ColHidden(10) = true;
		    grid_bs.GetGridControl().ColHidden(11) = true;
    		
		    grid_bs.GetGridControl().ColHidden(12) = true;
		    grid_bs.GetGridControl().ColHidden(13) = true;
		    grid_bs.GetGridControl().ColHidden(14) = true;
		    grid_bs.GetGridControl().ColHidden(15) = true;
		    grid_bs.GetGridControl().ColHidden(16) = true; 
		    grid_bs.GetGridControl().ColHidden(17) = true;
		    grid_bs.GetGridControl().ColHidden(18) = true; 
		    grid_bs.GetGridControl().ColWidth(0)  = "2000";
		    grid_bs.GetGridControl().ColWidth(1)  = "2000";
		    grid_bs.GetGridControl().ColWidth(2)  = "2000";
		    grid_bs.GetGridControl().ColWidth(8)  = "2000";
		    
		    grid_bs.GetGridControl().ColWidth(3)  = "0";
		    grid_bs.GetGridControl().ColWidth(4)  = "0";
		    grid_bs.GetGridControl().ColWidth(5)  = "0";
		    grid_bs.GetGridControl().ColWidth(6)  = "0";
		    
		    grid_bs.GetGridControl().ColWidth(7)  = "0";
		    grid_bs.GetGridControl().ColWidth(9)  = "0";
		    grid_bs.GetGridControl().ColWidth(10)  = "0";
		    grid_bs.GetGridControl().ColWidth(11)  = "0";
		    
		    grid_bs.GetGridControl().ColWidth(12)  = "0";
		    grid_bs.GetGridControl().ColWidth(13)  = "0";
		    grid_bs.GetGridControl().ColWidth(14)  = "0";
		    grid_bs.GetGridControl().ColWidth(15)  = "0";
		    
		    grid_bs.GetGridControl().ColWidth(16)  = "0";
		    grid_bs.GetGridControl().ColWidth(17)  = "0";
		    grid_bs.GetGridControl().ColWidth(18)  = "0";
		    
		    //income
		    grid_ic.GetGridControl().ColHidden(3) = true;
		    grid_ic.GetGridControl().ColHidden(4) = true;
		    grid_ic.GetGridControl().ColHidden(6) = true;
    		
	        grid_ic.GetGridControl().ColHidden(7) = true;
	        grid_ic.GetGridControl().ColHidden(8) = true;
		    grid_ic.GetGridControl().ColHidden(9) = true;
		    grid_ic.GetGridControl().ColHidden(10) = true;
		    grid_ic.GetGridControl().ColHidden(11) = true;
		    grid_ic.GetGridControl().ColHidden(12) = true;
		    
		    grid_ic.GetGridControl().ColWidth(0)  = "5000";
		    grid_ic.GetGridControl().ColWidth(1)  = "5000";
		    grid_ic.GetGridControl().ColWidth(2)  = "5000";
		    grid_ic.GetGridControl().ColWidth(5)  = "2000";
		    
		    grid_ic.GetGridControl().ColWidth(3)  = "0";
		    grid_ic.GetGridControl().ColWidth(4)  = "0";
		    grid_ic.GetGridControl().ColWidth(6)  = "0";
		    
		    grid_ic.GetGridControl().ColWidth(7)  = "0";
		    grid_ic.GetGridControl().ColWidth(8)  = "0";
		    grid_ic.GetGridControl().ColWidth(9)  = "0";
		    grid_ic.GetGridControl().ColWidth(10)  = "0";
		    grid_ic.GetGridControl().ColWidth(11)  = "0";
		    grid_ic.GetGridControl().ColWidth(12)  = "0";
		    //manufaturing cost
		    grid_cost.GetGridControl().ColHidden(3) = true;
		    grid_cost.GetGridControl().ColHidden(4) = true;
		    grid_cost.GetGridControl().ColHidden(6) = true;
    		
	        grid_cost.GetGridControl().ColHidden(7) = true;
	        grid_cost.GetGridControl().ColHidden(8) = true;
		    grid_cost.GetGridControl().ColHidden(9) = true;
		    grid_cost.GetGridControl().ColHidden(10) = true;
		    grid_cost.GetGridControl().ColHidden(11) = true;
		    grid_cost.GetGridControl().ColHidden(12) = true;
		    
		    grid_cost.GetGridControl().ColWidth(0)  = "5000";
		    grid_cost.GetGridControl().ColWidth(1)  = "5000";
		    grid_cost.GetGridControl().ColWidth(2)  = "5000";
		    grid_cost.GetGridControl().ColWidth(5)  = "2000";
		    
		    grid_cost.GetGridControl().ColWidth(3)  = "0";
		    grid_cost.GetGridControl().ColWidth(4)  = "0";
		    grid_cost.GetGridControl().ColWidth(6)  = "0";
		    
		    grid_cost.GetGridControl().ColWidth(7)  = "0";
		    grid_cost.GetGridControl().ColWidth(8)  = "0";
		    grid_cost.GetGridControl().ColWidth(9)  = "0";
		    grid_cost.GetGridControl().ColWidth(10)  = "0";
		    grid_cost.GetGridControl().ColWidth(11)  = "0";
		    grid_cost.GetGridControl().ColWidth(12)  = "0";
		   
	    }
	    else if(opt == 1 || opt == 2 || opt == 3)
	    {
	        //balance sheet
	        grid_bs.GetGridControl().ColHidden(3) = true;
		    grid_bs.GetGridControl().ColHidden(4) = true;
	        grid_bs.GetGridControl().ColHidden(5) = true;
		    grid_bs.GetGridControl().ColHidden(6) = false;
    		
	        grid_bs.GetGridControl().ColHidden(7) = false;
		    grid_bs.GetGridControl().ColHidden(9) = false;
		    grid_bs.GetGridControl().ColHidden(10) = false;
		    grid_bs.GetGridControl().ColHidden(11) = false;
    		
		    grid_bs.GetGridControl().ColHidden(12) = false;
		    grid_bs.GetGridControl().ColHidden(13) = false;
		    grid_bs.GetGridControl().ColHidden(14) = false;
		    grid_bs.GetGridControl().ColHidden(15) = false;
		    grid_bs.GetGridControl().ColHidden(16) = false;
		    grid_bs.GetGridControl().ColHidden(17) = true;
		    grid_bs.GetGridControl().ColHidden(18) = true;
		    
		    
		    grid_bs.GetGridControl().ColWidth(0)  = "5000";
		    grid_bs.GetGridControl().ColWidth(1)  = "2000";
		    grid_bs.GetGridControl().ColWidth(2)  = "2000";
		    grid_bs.GetGridControl().ColWidth(8)  = "2000";
		    
		    grid_bs.GetGridControl().ColWidth(3)  = "0";
		    grid_bs.GetGridControl().ColWidth(4)  = "0";
		    grid_bs.GetGridControl().ColWidth(5)  = "1500";
		    grid_bs.GetGridControl().ColWidth(6)  = "1500";
		    
		    grid_bs.GetGridControl().ColWidth(7)  = "1500";
		    grid_bs.GetGridControl().ColWidth(9)  = "1500";
		    grid_bs.GetGridControl().ColWidth(10)  = "1500";
		    grid_bs.GetGridControl().ColWidth(11)  = "1500";
		    
		    grid_bs.GetGridControl().ColWidth(12)  = "1500";
		    grid_bs.GetGridControl().ColWidth(13)  = "1500";
		    grid_bs.GetGridControl().ColWidth(14)  = "1500";
		    grid_bs.GetGridControl().ColWidth(15)  = "1500";
		    
		    grid_bs.GetGridControl().ColWidth(16)  = "1500";
		    grid_bs.GetGridControl().ColWidth(17)  = "0";
		    grid_bs.GetGridControl().ColWidth(18)  = "0";
		    
		    
		    //income
		    grid_ic.GetGridControl().ColHidden(3) = false;
		    grid_ic.GetGridControl().ColHidden(4) = false;
		    grid_ic.GetGridControl().ColHidden(6) = false;
	        grid_ic.GetGridControl().ColHidden(7) = false;
	        grid_ic.GetGridControl().ColHidden(8) = false;
		    grid_ic.GetGridControl().ColHidden(9) = false;
		    grid_ic.GetGridControl().ColHidden(10) = false;
		    grid_ic.GetGridControl().ColHidden(11) = true;
		    grid_ic.GetGridControl().ColHidden(12) = true;
		    
		    grid_ic.GetGridControl().ColWidth(0)  = "5000";
		    grid_ic.GetGridControl().ColWidth(1)  = "5000";
		    grid_ic.GetGridControl().ColWidth(2)  = "5000";
		    grid_ic.GetGridControl().ColWidth(5)  = "2000";
		    
		    grid_ic.GetGridControl().ColWidth(3)  = "1500";
		    grid_ic.GetGridControl().ColWidth(4)  = "1500";
		    grid_ic.GetGridControl().ColWidth(6)  = "1500";
		    
		    grid_ic.GetGridControl().ColWidth(7)  = "1500";
		    grid_ic.GetGridControl().ColWidth(8)  = "1500";
		    grid_ic.GetGridControl().ColWidth(9)  = "1500";
		    grid_ic.GetGridControl().ColWidth(10)  = "1500";
		    grid_ic.GetGridControl().ColWidth(11)  = "0";
		    grid_ic.GetGridControl().ColWidth(12)  = "0";
		    
		    //manufaturing cost
		    
		    grid_cost.GetGridControl().ColHidden(3) = false;
		    grid_cost.GetGridControl().ColHidden(4) = false;
		    grid_cost.GetGridControl().ColHidden(6) = false;
	        grid_cost.GetGridControl().ColHidden(7) = false;
	        grid_cost.GetGridControl().ColHidden(8) = false;
		    grid_cost.GetGridControl().ColHidden(9) = false;
		    grid_cost.GetGridControl().ColHidden(10) = false;
		    grid_cost.GetGridControl().ColHidden(11) = true;
		    grid_cost.GetGridControl().ColHidden(12) = true;
		    
		    grid_cost.GetGridControl().ColWidth(0)  = "5000";
		    grid_cost.GetGridControl().ColWidth(1)  = "5000";
		    grid_cost.GetGridControl().ColWidth(2)  = "5000";
		    grid_cost.GetGridControl().ColWidth(5)  = "2000";
		    
		    grid_cost.GetGridControl().ColWidth(3)  = "1500";
		    grid_cost.GetGridControl().ColWidth(4)  = "1500";
		    grid_cost.GetGridControl().ColWidth(6)  = "1500";
		    
		    grid_cost.GetGridControl().ColWidth(7)  = "1500";
		    grid_cost.GetGridControl().ColWidth(8)  = "1500";
		    grid_cost.GetGridControl().ColWidth(9)  = "1500";
		    grid_cost.GetGridControl().ColWidth(10)  = "1500";
		    grid_cost.GetGridControl().ColWidth(11)  = "0";
		    grid_cost.GetGridControl().ColWidth(12)  = "0";
	    }		
	}
	
</script>

<body style="margin: 0; padding: 0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_all" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_rate" onreceive="">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCurrent" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate1"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
     <!---------------------------------------------------------------------------------------------------------------->  
    <gw:data id="dso_sel_grd_balance_sheet" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080260_bs_internal">
                <input bind="grid_bs">
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                     <input bind="rbstatus"/>
                    <input bind="txtScale"/>
                    <input bind="txtrate1"/>
                </input>
                <output bind="grid_bs"/>
            </dso>
        </xml>
    </gw:data>
        <!---------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_grd_income" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_gfka00210_3">
                <input bind="grid_ic">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
					<input bind="txtrate"/>
					<input bind="txtrate1"/>
                    <input bind="txtScale"/>
                  
                </input>
                <output bind="grid_ic"/>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------------------------->    
     <gw:data id="dso_sel_grd_cost" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_gfka00210_3">
                <input bind="grid_cost">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
					<input bind="txtrate"/>
					<input bind="txtrate1"/>
                    <input bind="txtScale"/>
                  
                </input>
                <output bind="grid_cost"/>
            </dso>
        </xml>
    </gw:data>
      <!---------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_grd_cf" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_gfka00210">
                <input bind="grid_cf">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
                    <input bind="txtScale"/>
                </input>
                <output bind="grid_cf"/>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_grd_balance_sheet_2" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_gfka00210_5_tmp">
                <input bind="grid_bs_2">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
                    <input bind="txtScale"/>
                    <input bind="txtrate1"/>
                </input>
                <output bind="grid_bs_2"/>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------------------------------->
     <gw:data id="dso_sel_grd_incom2" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_gfka00210_5_tmp">
                <input bind="grid_ic2">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
                    <input bind="txtScale"/>
                    <input bind="txtrate1"/>
                </input>
                <output bind="grid_ic2"/>
            </dso>
        </xml>
    </gw:data>
    <fieldset style="padding: 2;width:100%;">
        <table border="0" cellpadding=0 cellspacing=0 width="100%" id="table2">
        <tr>
            <td width="5%">Company</td>
            <td width="20%" colspan=1><gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%' /></td>
            <td width="5%">Balance</td>
            <td width="25%"> <gw:list id="rdoType" value="1" onchange="OnChangeDateType()" /> 
               
            </td>
            <td width="5%"><gw:label id="lblDateType" text="Month:" styles="width:100%;font-weight:600;" /></td>
             <td width="10%">
                <gw:list id="lstQuater" styles="width:100%;" onchange="OnChangeQuater()" >
                    <data>Data|1|I|2|II|3|III|4|IV</data>
                </gw:list>
            </td>
            <td width="10%" colspan=2>
                <gw:datebox id="dtYear" type="year" lang="1" styles="display:none" onchange="OnChangeYear()"/>
                <gw:datebox id="dtMonth" type="month" lang="1" onchange="OnChangeMonth()"/>
            </td>
           
            <td width="10%">
                <gw:datebox id="dtfrdate" onchange="OnchangeDateFrom()" type="date" lang="1" />
            </td>
            <td width="10%" colspan=2>
                <gw:datebox id="dttodate" onchange="OnchangeDateTo()" type="date" lang="1" />
            </td>
            <td width="3%">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" />
            </td>
            <td width="3%">
                <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="onReport(lstLang.GetData())" />
            </td>
           
        </tr>
        <tr>
            <td width="5%">Language</td>
            <td width="20%" colspan=1><gw:list id="lstLang" onchange="OnChangeLang()" styles='width:100%' /></td>
            <td width="5%">Status</td>
            <td width="25%"> <gw:radio id="rbstatus" value="2" onchange="onSearch()"> 
                <span value="2">Confirmed</span>
                <span value="0">Approved</span>
                </gw:radio>
            </td>
            <td width="5%">Currency</td>
             <td width="10%">
                <gw:list id="lstCurrent" onchange="OnChangeCurrent()" styles='width:100%' />
            </td>
            <td width="8%" align=right>Ex Rate</td>
           
            <td width="2%"><gw:textbox id="txtrate" styles='width:100%' type="number" format="###,###.##R" /></td>
            <td width="10%"> <gw:textbox id="txtrate1" text="1" styles='width:100%' type="number" format="###,###.##R"
             onenterkey="onSearch()" /></td>
            <td width="3%" align=right>Unit</td>
            <td width="3%"><gw:textbox id="txtScale" styles='width:100%' type="number" format="###,###,###R"
              onenterkey="onSearch()" />
            </td>
             <td width="3%" colspan=2><gw:label id="lblBookccy" styles="width:100%;color:red; font-weight:700;" /></td>
        </tr>
         <tr>
             <td width="75%" colspan=8></td>
            <td width="5%" align=right>Report type</td>
            <td width="20%" colspan=4><gw:list id="lstReportType" onchange="onSetDataList()"  /></td>
           
           
        </tr>
    </table>
    </fieldset>
    
   
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td width="100%">
            <gw:tab id="idTab_Child" onpageactivate="onSetDataList()">
                <table name="Balance Sheet"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:380;" >
                    <tr valign="top" height="90%">
                        <!--0.Item|1_Item|2_Item Korea|3_Code|4_Color|5_Font Type|6.Last Year Bal(A)|7.Last Month Bal(B)|8.This Month Bal(C)
                         |9.Variance(C-A)|10.Variance(C-B)|11.Item|12.Last Year Bal(A)|13.Last Month Bal(B)|14.This Month Bal(C)|15.Variance(C-A)
                         |16.Variance(C-B)|17._Color|18._Font Type-->                    
                        <td width="100%">
                            <gw:grid   
	                                id="grid_bs"
                                    header  ="_Item|Item|_Item Korea|_Code|_Color|_Font Type|Last Year Bal(A)|Last Month Bal(B)|This Month Bal(C)|Variance(C-A)|Variance(C-B)|Item|Last Year Bal(A)|Last Month Bal(B)|This Month Bal(C)|Variance(C-A)|Variance(C-B)|_Color|_Font Type"
                                    format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    aligns  ="0|0|0|1|1|1|3|3|3|3|3|0|3|3|3|3|3|3|0"
                                    defaults="||||||||||||||||||"
                                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="0|4000|0|0|0|0|1500|1500|1500|1500|1500|4000|1500|1500|1500|1500|1500|0|0"
                                    styles  ="width:100%; height:100%;display:"
                                    sorting="F"
                                    /> 
                                    <!---header  ="0.Assets|1.자산|2.Code|3.Notes|4.Month|5.Month|6.Print corlor|7.font style|8.print level|9.Resources|10.자산|11.Code|12.Notes|13.Month|14.Month|15.Print corlor|16.font style|17.print level"--> 
                                   
                                    <gw:grid   
	                                id="grid_bs_2"
                                    header  ="Assets|자산|Code|Notes|Month|Month|_Print corlor|_font style|_print level|Resources|자산|Code|Notes|Month|Month|_Print corlor|_font style|_print level"
                                    format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    aligns  = "0|0|0|0|3|3|0|0|0|0|0|0|0|3|3|0|0|0"
                                    defaults="|||||||||||||||||"
                                    editcol= "0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="4000|3000|1000|1500|2000|2000|0|0|0|4000|3000|1000|1500|2000|2000|0|0|0"
                                    styles  ="width:100%; height:1;display:none"
                                    sorting="T"
                                    />  
                        </td>
                      
                     </tr>
                    <tr valign="top">
                        <td width="100%" height="10%">
                            <gw:grid   
	                                id ="grid_bs_sum"
                                    header  ="Balance|Total Assets|Total Resources|Difference"
                                    format  ="0|0|0|0"  
                                    aligns  ="0|0|0|1"
                                    defaults="|||"  
                                    editcol ="0|0|0|0"
                                    widths  ="4500|3500|3500|3000"  
                                    styles  ="width:100%; height:100%"
                                    sorting="F" 
                                    /> 
                        </td>
                    </tr>
                </table>
				
                <table name="Income Statement"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:380;" >    
                    <tr valign="top">
           <!--0.Item Local|1_Item|2_Item Korea|3.Period_a|4.Period_b|5.Period_c|6.P_ca|7.P_cb|8.Acc_e|9.Acc_f|10.Acc_fe|11_Font Type|12_color-->
                        <td width="100%">
                        
                        <gw:grid   
                            id="grid_ic"  
                            header  ="Item Local|_Item|_Item Korea|Period_a|Period_b|Period_c|P_ca|P_cb|Acc_e|Acc_f|Acc_fe|_Font Type|_color"
                            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                            aligns  ="0|0|0|3|3|3|3|3|3|3|3|3|3"
                            defaults="||||||||||||"
                            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                            widths  ="5000|1500|1500|1500|1500|1500|1500|1500|2200|2200|1500|0|0"
                            styles  ="width:100%; height:440;display:"
                            sorting="F" 
                            /> 
                            <!--header  ="0.Item Local|1.Item Korea|2.Code|3.VND_1|4.USD_1|5.VND_2|6.USD_2|7.VND_3|8.USD_3|9.VND_4|
                            10.USD_4|11.VND_5|12.USD_5|13.VND_6|14.USD_6|15.VND_7|16.USD_7|17.VND_8|18.USD_8|19.VND_9|20.USD_9|21.VND_10|22.USD_10|
                            23.VND_11|24.USD_11|25.VND_12|26.USD_12|27.Total|28.Total|29.color|30.font style|31.print level|32.form type|33.code"-->
                            <gw:grid   
                            id="grid_ic2"  
                            header  ="Item Local|Item Korea|Code|VND_1|USD_1|VND_2|USD_2|VND_3|USD_3|VND_4|USD_4|VND_5|USD_5|VND_6|USD_6|VND_7|USD_7|VND_8|USD_8|VND_9|USD_9|VND_10|USD_10|VND_11|USD_11|VND_12|USD_12|Total_vnd|Total_usd|_color|_font style|_print level|_form type|_code"
                            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            aligns   ="0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0|0|0"
                            defaults="|||||||||||||||||||||||||||||||||"
                            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            widths  ="5000|1500|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0|0|0|0|"
                            styles  ="width:100%; height:440"
                            sorting="T" 
                            /> 
                           
                        </td>
                    </tr>
                </table>
                <table name="Cash Flows"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:380;" >    
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid   
                                id="grid_cf"  
                                header  ="Item Local|_Item|_Item Korea|Code|Node|_Font Type|This Period|Previous Period|_Accum Of Year|_Accum Of Previous Year"
                                format  ="0|0|0|0|0|0|0|0|0|0"
                                aligns  ="0|0|0|1|1|3|3|3|3|3"
                                defaults="|||||||||"
                                editcol ="0|0|0|0|0|0|0|0|0|0"
                                widths  ="8000|0|0|1000|1000|1000|2000|2000|2500|2500"
                                styles  ="width:100%; height:440"
                                sorting="F" 
                                /> 
                        </td>
                    </tr>
                </table>
                <table name="Manufacturing Cost"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:380;" >    
                    <tr valign="top">
                        <td width="100%">
                             <gw:grid   
                                id="grid_cost"  
                                header  ="Item Local|_Item|_Item Korea|Period_a|Period_b|Period_c|P_ca|P_cb|Acc_e|Acc_f|Acc_fe|_Font Type|_color"
                                format  ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                                aligns  ="0|0|0|3|3|3|3|3|3|3|3|3|3"
                                defaults="||||||||||||"
                                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths  ="5000|1500|1500|1500|1500|1500|1500|1500|2200|2200|1500|0|0"
                                styles  ="width:100%; height:440"
                                sorting="F" 
                            /> 
                        </td>
                        </td>
                    </tr>
                </table>
            </gw:tab>
             
            
        </td>
    </tr>
</table>
                       
<gw:list id="lstBook_ccy" style="width: 75%; display: none"></gw:list>
<gw:textbox id="txt_date" style="display: none" />
<gw:textbox id="txt_row" style="display: none" />
<gw:textbox id="txtDateType" style="display: none" />
<gw:textbox id="txtFinancialType" style="display:none " />
<gw:datebox id="dtYearCurrent" type="year" lang="1" style="display: none" />
<gw:datebox id="dttoCurrent" type="date" lang="1" style="display: none"  />
<gw:textbox id="txtProposedByUserPk" style="display: none" />
</body>
</html>
