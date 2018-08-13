<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    BindingDataList();
    MergeHeaderGrid();
	System.Translate(document);
}
//------------------------------------------------------------
function BindingDataList()
{
        var ls_Loai     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0014') FROM DUAL")%>";
        var ls_quy     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0015') FROM DUAL")%>";
        var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
        var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
        
        var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
        var ls_date_to  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
        var ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
        
        var ls_Half_Year    = "DATA|1|6 tháng đầu năm|2|6 tháng cuối năm";

        
        lstLoai.SetDataText(ls_Loai);
        lstThang.SetDataText(ls_quy);
        txt_date.text   = ls_trsdate;
        lstHalfYear.SetDataText(ls_Half_Year);
        OnChangeDateType();
       
}
//---------------------------------------------------------
function OnShowPopup(index)
{
    switch (index)
    {
        case 0:
             if(Grid_Detail.col=='3')
                   var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=SP_SEL_ACCD_ALL";
	            var object = System.OpenModal( fpath , 800 , 550 , 'resizable:yes;status:yes'); 
                if ((object != null) &&(object[0]!="0"))
                {
                            
                    Grid_Detail.SetGridText( Grid_Detail.row, 2, object[3]);    //ACPK
	                  Grid_Detail.SetGridText( Grid_Detail.row, 3, object[0]);    //Account Code
                    Grid_Detail.SetGridText( Grid_Detail.row, 4, object[1]);    //Account Name
                   
                }
        break;
    }
}
//---------------------------------------------------------
function OnNew()
{
    Grid_Detail.AddRow();
    Grid_Detail.SetGridText( Grid_Detail.rows - 1, 1, txtPK.text); 
}
//---------------------------------------------------------
function OnSearch()
{  
    DSO_Grid.Call("SELECT");
    
}
//---------------------------------------------------------
function onSave()
{
    DSO_DETAIL.Call();
}
//---------------------------------------------------------
function OnDataReceive(obj)
{
      switch(obj.id)
      {
             case "DSO_Grid":
                   MergeHeaderGrid();
                  ChangeColor(); 
             break;
      }

}
 //-----------------------------------------------------
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
//---------------------------------------------------------------------------
function OnChangeDateType()
{
   CalculateFTDate();
    
    var quater = lstThang.GetData();
    var yyyy = dtfrdate.text.substr(6,4);
   var  yyyy1 = dtYear1.GetData();
    var mmyyyy = dtfrdate.text.substr(3,7);
    var acc_mmyyyy = dtfrdate.GetData();
    acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);
   var grid = Grid_Detail.GetGridControl(); 
    //alert(acc_mmyyyy)
   
        if(lstLoai.GetData() == '96')
        {
            txtDateType.text = "M";
            lblDateType.text = "Month";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstThang.style.display = "none";
           lstHalfYear.style.display = "none";
           dtYear1.style.display = "none";
        }
        else if(lstLoai.GetData() == '95')
        {
            ChangeGridQuater();
            txtDateType.text = "Q";
            lblDateType.text = "Quater";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstThang.style.display = "";
            lstHalfYear.style.display = "none";
            dtYear1.style.display = "none";
        }
        else if(lstLoai.GetData() == '97')
        {
            
            txtDateType.text = "N";
            lblDateType.text = "Half yearly";
            dtMonth.style.display = "none";
            dtYear.style.display = "none";
            lstThang.style.display = "none";
            lstHalfYear.style.display = "";
            dtYear.style.display = "none";
            dtYear1.style.display = "none";
        }
        else if(lstLoai.GetData() == '98')
        {
             lstThang.style.display = "none";
             lstHalfYear.style.display = "none";
             dtMonth.style.display = "none";
             dtYear.style.display = "none";
             txtDateType.text = "Na";
             lblDateType.text = "Year";
            dtYear1.style.display = "";
           
           
            dtfrdate.SetDataText(yyyy1 + "0101");    
            dttodate.SetDataText(yyyy1 + "1231");    
        
            
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
            
            grid.ColWidth(21)='2000';
            grid.ColWidth(22)='2000';
            grid.ColWidth(23)='2000';
            grid.ColWidth(24)='2000';
            grid.ColWidth(25)='2000';
            grid.ColWidth(26)='2000';
            grid.ColWidth(27)='2000';
            grid.ColWidth(28)='2000';
            grid.ColWidth(29)='2000';
            grid.ColWidth(30)='2000';
            grid.ColWidth(31)='2000';
            grid.ColWidth(32)='2000';
            
            grid.ColWidth(34)='2000';
            grid.ColWidth(35)='2000';
            grid.ColWidth(36)='2000';
            grid.ColWidth(37)='2000';
            grid.ColWidth(38)='2000';
            grid.ColWidth(39)='2000';
            grid.ColWidth(40)='2000';
            grid.ColWidth(41)='2000';
            grid.ColWidth(42)='2000';
            grid.ColWidth(43)='2000';
            grid.ColWidth(44)='2000';
            grid.ColWidth(45)='2000';
        }
}
//------------------------------------------------------------------------------
function OnChangeHalfYear()
{
     OnChangeDateType();
}
//-------------------------------------------------------------------------------
function MergeHeaderGrid()
{
     var fg = Grid_Detail.GetGridControl();
     if(fg.Rows < 2)
		{
		   Grid_Detail.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Budget code"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Budget name"	
     fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Account code"	
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Accoutn name"	
		//--------Budget
		fg.Cell(0, 0, 7,0, 19)  = "Budget"   //fg.Cell(0,row, from_col, row, to_col)	
	  fg.Cell(0, 1, 7, 1, 7) = "Total"
	  fg.Cell(0, 1, 8, 1, 8) = "Jan"
	  fg.Cell(0, 1, 9, 1, 9) = "Feb"
	  fg.Cell(0, 1, 10, 1, 10) = "Mar"
	  fg.Cell(0, 1, 11, 1, 11) = "Apr"
	  fg.Cell(0, 1, 12, 1, 12) = "May"
	  fg.Cell(0, 1, 13, 1, 13) = "Jun"
	  fg.Cell(0, 1, 14, 1, 14) = "Jul"
	  fg.Cell(0, 1, 15, 1, 15) = "Aug"
	  fg.Cell(0, 1, 16, 1, 16) = "Sep"
	  fg.Cell(0, 1, 17, 1, 17) = "Oct"
	  fg.Cell(0, 1, 18, 1, 18) = "Nov"
	  fg.Cell(0, 1, 19, 1, 19) = "Dec"
	  //--------Phát sinh-----------
	  fg.Cell(0, 0, 20,0, 32)  = "Arising"   //fg.Cell(0,row, from_col, row, to_col)	
	  fg.Cell(0, 1, 20, 1, 20) = "Total"
	  fg.Cell(0, 1, 21, 1, 21) = "Jan"
	  fg.Cell(0, 1, 22, 1, 22) = "Feb"
	  fg.Cell(0, 1, 23, 1, 23) = "Mar"
	  fg.Cell(0, 1, 24, 1, 24) = "Apr"
	  fg.Cell(0, 1, 25, 1, 25) = "May"
	  fg.Cell(0, 1, 26, 1, 26) = "Jun"
	  fg.Cell(0, 1, 27, 1, 27) = "Jul"
	  fg.Cell(0, 1, 28, 1, 28) = "Aug"
	  fg.Cell(0, 1, 29, 1, 29) = "Sep"
	  fg.Cell(0, 1, 30, 1, 30) = "Oct"
	  fg.Cell(0, 1, 31, 1, 31) = "Nov"
	  fg.Cell(0, 1, 32, 1, 32) = "Dec"
	  //---------Chenh lech-------------
	  fg.Cell(0, 0, 33,0, 45)  = "Difference"   //fg.Cell(0,row, from_col, row, to_col)	
	  fg.Cell(0, 1, 33, 1, 33) = "Total"
	  fg.Cell(0, 1, 34, 1, 34) = "Jan"
	  fg.Cell(0, 1, 35, 1, 35) = "Feb"
	  fg.Cell(0, 1, 36, 1, 36) = "Mar"
	  fg.Cell(0, 1, 37, 1, 37) = "Apr"
	  fg.Cell(0, 1, 38, 1, 38) = "May"
	  fg.Cell(0, 1, 39, 1, 39) = "Jun"
	  fg.Cell(0, 1, 40, 1, 40) = "Jul"
	  fg.Cell(0, 1, 41, 1, 41) = "Aug"
	  fg.Cell(0, 1, 42, 1, 42) = "Sep"
	  fg.Cell(0, 1, 43, 1, 43) = "Oct"
	  fg.Cell(0, 1, 44, 1, 44) = "Nov"
	  fg.Cell(0, 1, 45, 1, 45) = "Dec"
	  
	  fg.ColFormat(7) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(8) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(9) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(11) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(12) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(13) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(14) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(15) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(16) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(17) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(18) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(19) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(20) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(21) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(22) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(23) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(24) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(25) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(26) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(27) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(28) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(29) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(30) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(31) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(32) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(33) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(34) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(35) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(36) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(37) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(38) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(39) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(40) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(41) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(42) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(43) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(44) = "#,###,###,###,###,###,###R"; 
	  fg.ColFormat(45) = "#,###,###,###,###,###,###R"; 
	  
}
//-----------------------------------------------------------------------
function ChangeGridQuater()
{
    var grid = Grid_Detail.GetGridControl();
    if(lstLoai.GetData() == '95')
    {
        if(lstThang.GetData() == '1')
        {
            
             grid.ColWidth(11)=0;
             grid.ColWidth(12)=0;
             grid.ColWidth(13)=0;
             grid.ColWidth(14)=0;
             grid.ColWidth(15)=0;
             grid.ColWidth(16)=0;
             grid.ColWidth(17)=0;
             grid.ColWidth(18)=0;
             grid.ColWidth(19)=0;
             
             grid.ColWidth(8)='2000';
             grid.ColWidth(9)='2000';
             grid.ColWidth(10)='2000';
             //--------Phat sinh------
             grid.ColWidth(24)=0;
             grid.ColWidth(25)=0;
             grid.ColWidth(26)=0;
             grid.ColWidth(27)=0;
             grid.ColWidth(28)=0;
             grid.ColWidth(29)=0;
             grid.ColWidth(30)=0;
             grid.ColWidth(31)=0;
             grid.ColWidth(32)=0;
             
             grid.ColWidth(21)='2000';
             grid.ColWidth(22)='2000';
             grid.ColWidth(23)='2000';
              //--------Chenh lech------
             grid.ColWidth(37)=0;
             grid.ColWidth(38)=0;
             grid.ColWidth(39)=0;
             grid.ColWidth(40)=0;
             grid.ColWidth(41)=0;
             grid.ColWidth(42)=0;
             grid.ColWidth(43)=0;
             grid.ColWidth(44)=0;
             grid.ColWidth(45)=0;
             
             grid.ColWidth(34)='2000';
             grid.ColWidth(35)='2000';
             grid.ColWidth(36)='2000';
        }
        else if(lstThang.GetData() == '2')
        {
             grid.ColWidth(8)=0;
             grid.ColWidth(9)=0;
             grid.ColWidth(10)=0;
             grid.ColWidth(14)=0;
             grid.ColWidth(15)=0;
             grid.ColWidth(16)=0;
             grid.ColWidth(17)=0;
             grid.ColWidth(18)=0;
             grid.ColWidth(19)=0;
        
             grid.ColWidth(11)='2000';
             grid.ColWidth(12)='2000';
             grid.ColWidth(13)='2000';
            //--------Phat sinh------
             grid.ColWidth(21)=0;
             grid.ColWidth(22)=0;
             grid.ColWidth(23)=0;
             grid.ColWidth(27)=0;
             grid.ColWidth(28)=0;
             grid.ColWidth(29)=0;
             grid.ColWidth(30)=0;
             grid.ColWidth(31)=0;
             grid.ColWidth(32)=0;
             
             grid.ColWidth(24)='2000';
             grid.ColWidth(25)='2000';
             grid.ColWidth(26)='2000';
              //--------Chenh lech------
             grid.ColWidth(34)=0;
             grid.ColWidth(35)=0;
             grid.ColWidth(36)=0;
             grid.ColWidth(40)=0;
             grid.ColWidth(41)=0;
             grid.ColWidth(42)=0;
             grid.ColWidth(43)=0;
             grid.ColWidth(44)=0;
             grid.ColWidth(45)=0;
             
             grid.ColWidth(37)='2000';
             grid.ColWidth(38)='2000';
             grid.ColWidth(39)='2000';
        }
        else if(lstThang.GetData() == '3')
        {
             grid.ColWidth(14)='2000';
             grid.ColWidth(15)='2000';
             grid.ColWidth(16)='2000';
             
             grid.ColWidth(8)=0;
             grid.ColWidth(9)=0;
             grid.ColWidth(10)=0;
             grid.ColWidth(11)=0;
             grid.ColWidth(12)=0;
             grid.ColWidth(13)=0;
             grid.ColWidth(17)=0;
             grid.ColWidth(18)=0;
             grid.ColWidth(19)=0;
             //--------Phat sinh------
             grid.ColWidth(21)=0;
             grid.ColWidth(22)=0;
             grid.ColWidth(23)=0;
             grid.ColWidth(24)=0;
             grid.ColWidth(25)=0;
             grid.ColWidth(26)=0;
             grid.ColWidth(30)=0;
             grid.ColWidth(31)=0;
             grid.ColWidth(32)=0;
             
             grid.ColWidth(27)='2000';
             grid.ColWidth(28)='2000';
             grid.ColWidth(29)='2000';
              //--------Chenh lech------
             grid.ColWidth(34)=0;
             grid.ColWidth(35)=0;
             grid.ColWidth(36)=0;
             grid.ColWidth(37)=0;
             grid.ColWidth(38)=0;
             grid.ColWidth(39)=0;
             grid.ColWidth(43)=0;
             grid.ColWidth(44)=0;
             grid.ColWidth(45)=0;
             
             grid.ColWidth(40)='2000';
             grid.ColWidth(41)='2000';
             grid.ColWidth(42)='2000';
        }
        else if(lstThang.GetData() == '4')
        {
             grid.ColWidth(17)='2000';
             grid.ColWidth(18)='2000';
             grid.ColWidth(19)='2000';
             
             grid.ColWidth(8)=0;
             grid.ColWidth(9)=0;
             grid.ColWidth(10)=0;
             grid.ColWidth(11)=0;
             grid.ColWidth(12)=0;
             grid.ColWidth(13)=0;
             grid.ColWidth(14)=0;
             grid.ColWidth(15)=0;
             grid.ColWidth(16)=0;
             //--------Phat sinh------
             grid.ColWidth(21)=0;
             grid.ColWidth(22)=0;
             grid.ColWidth(23)=0;
             grid.ColWidth(24)=0;
             grid.ColWidth(25)=0;
             grid.ColWidth(26)=0;
             grid.ColWidth(27)=0;
             grid.ColWidth(28)=0;
             grid.ColWidth(29)=0;
             
             grid.ColWidth(30)='2000';
             grid.ColWidth(31)='2000';
             grid.ColWidth(32)='2000';
              //--------Chenh lech------
             grid.ColWidth(34)=0;
             grid.ColWidth(35)=0;
             grid.ColWidth(36)=0;
             grid.ColWidth(37)=0;
             grid.ColWidth(38)=0;
             grid.ColWidth(39)=0;
             grid.ColWidth(40)=0;
             grid.ColWidth(41)=0;
             grid.ColWidth(42)=0;
             
             grid.ColWidth(43)='2000';
             grid.ColWidth(44)='2000';
             grid.ColWidth(45)='2000';
        }
    }
    
    
}
//----------------------------------------------------------
function CalculateFTDate(){
    //1:Month, 2:Quater, 3:Year
    var yyyymm,yyyy, mm, quater, halfyear, yyyy1;
    //month
    if(lstLoai.GetData() == '96')
    {
        yyyymm = dtMonth.GetData();
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtfrdate.SetDataText(yyyy+mm+"01");
        dttodate.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
        var grid = Grid_Detail.GetGridControl(); 
         if(mm=='01')
         {
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
              
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(8)='2000';
             grid.ColWidth(21)='2000';
             grid.ColWidth(34)='2000';
         }
         else if(mm=='02')
         {
              grid.ColWidth(8)=0;
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
              
              grid.ColWidth(21)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(9)='2000';
             grid.ColWidth(22)='2000';
             grid.ColWidth(35)='2000';
         }
         else if(mm=='03')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(10)='2000';
             grid.ColWidth(23)='2000';
             grid.ColWidth(36)='2000';
         }
         else if(mm=='04')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(11)='2000';
             grid.ColWidth(24)='2000';
             grid.ColWidth(37)='2000';
         }
         else if(mm=='05')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(12)='2000';
             grid.ColWidth(25)='2000';
             grid.ColWidth(38)='2000';
         }
         else if(mm=='06')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(13)='2000';
             grid.ColWidth(26)='2000';
             grid.ColWidth(39)='2000';
         }
         else if(mm=='07')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(14)='2000';
             grid.ColWidth(27)='2000';
             grid.ColWidth(40)='2000';
         }
         else if(mm=='08')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(15)='2000';
             grid.ColWidth(28)='2000';
             grid.ColWidth(41)='2000';
         }
         else if(mm=='08')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(15)='2000';
             grid.ColWidth(28)='2000';
             grid.ColWidth(41)='2000';
         }
         else if(mm=='09')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(16)='2000';
             grid.ColWidth(29)='2000';
             grid.ColWidth(42)='2000';
         }
         else if(mm=='10')
         {
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(17)='2000';
             grid.ColWidth(30)='2000';
             grid.ColWidth(43)='2000';
         }
         else if(mm=='11')
         {
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
              grid.ColWidth(19)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(45)=0;
             
             grid.ColWidth(18)='2000';
             grid.ColWidth(31)='2000';
             grid.ColWidth(44)='2000';
         }
         else if(mm=='12')
         {
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
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
             
             grid.ColWidth(19)='2000';
             grid.ColWidth(32)='2000';
             grid.ColWidth(45)='2000';
         }
    }
    //quater
    else if(lstLoai.GetData() == '95'){
        yyyy = dtYear.GetData();
        
        quater = lstThang.GetData();
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
    }
    else if(lstLoai.GetData() == '97')
    {
          halfyear = lstHalfYear.GetData();
          yyyy = dtYear.GetData();
          var grid = Grid_Detail.GetGridControl();
          if(halfyear == '1')
          {
             
              dtfrdate.SetDataText(yyyy + "0101");    
              dttodate.SetDataText(yyyy + "0630"); 
              
              grid.ColWidth(14)=0;
              grid.ColWidth(15)=0;
              grid.ColWidth(16)=0;
              grid.ColWidth(17)=0;
              grid.ColWidth(18)=0;
              grid.ColWidth(19)=0;
              
              grid.ColWidth(27)=0;
              grid.ColWidth(28)=0;
              grid.ColWidth(29)=0;
              grid.ColWidth(30)=0;
              grid.ColWidth(31)=0;
              grid.ColWidth(32)=0;
              
              grid.ColWidth(40)=0;
              grid.ColWidth(41)=0;
              grid.ColWidth(42)=0;
              grid.ColWidth(43)=0;
              grid.ColWidth(44)=0;
              grid.ColWidth(45)=0;
             
              grid.ColWidth(8)='2000';
              grid.ColWidth(9)='2000';
              grid.ColWidth(10)='2000';
              grid.ColWidth(11)='2000';
              grid.ColWidth(12)='2000';
              grid.ColWidth(13)='2000';
              grid.ColWidth(21)='2000';
              grid.ColWidth(22)='2000';
              grid.ColWidth(23)='2000';
              grid.ColWidth(24)='2000';
              grid.ColWidth(25)='2000';
              grid.ColWidth(26)='2000';
              
              grid.ColWidth(34)='2000';
              grid.ColWidth(35)='2000';
              grid.ColWidth(36)='2000';
              grid.ColWidth(37)='2000';
              grid.ColWidth(38)='2000';
              grid.ColWidth(39)='2000';
               
          }
          else if(halfyear == '2')
          {
             
              dtfrdate.SetDataText(yyyy + "0701");    
              dttodate.SetDataText(yyyy + "1231"); 
              
              grid.ColWidth(8)=0;
              grid.ColWidth(9)=0;
              grid.ColWidth(10)=0;
              grid.ColWidth(11)=0;
              grid.ColWidth(12)=0;
              grid.ColWidth(13)=0;
              
              grid.ColWidth(21)=0;
              grid.ColWidth(22)=0;
              grid.ColWidth(23)=0;
              grid.ColWidth(24)=0;
              grid.ColWidth(25)=0;
              grid.ColWidth(26)=0;
              
              grid.ColWidth(34)=0;
              grid.ColWidth(35)=0;
              grid.ColWidth(36)=0;
              grid.ColWidth(37)=0;
              grid.ColWidth(38)=0;
              grid.ColWidth(39)=0;
             
              grid.ColWidth(14)='2000';
              grid.ColWidth(15)='2000';
              grid.ColWidth(16)='2000';
              grid.ColWidth(17)='2000';
              grid.ColWidth(18)='2000';
              grid.ColWidth(19)='2000';
              
              grid.ColWidth(27)='2000';
              grid.ColWidth(28)='2000';
              grid.ColWidth(29)='2000';
              grid.ColWidth(30)='2000';
              grid.ColWidth(31)='2000';
              grid.ColWidth(32)='2000';
              
              grid.ColWidth(40)='2000';
              grid.ColWidth(41)='2000';
              grid.ColWidth(42)='2000';
              grid.ColWidth(43)='2000';
              grid.ColWidth(44)='2000';
              grid.ColWidth(45)='2000';
              
          }
          
        
    }
}
//------------------------------------------------------
function OnChangeQuater()
{
    
    OnChangeDateType();
}
//--------------------------------------------------------------
function OnChangeYear()
{
    
        OnChangeDateType();
    
}
//--------------------------------------------------------------
function OnChangeYear1()
{
    
        OnChangeDateType();
    
}
//------------------------------------------------------
function OnChangeMonth()
{
   
    OnChangeDateType();
}
//---------------------------------------------------------
function OnDelete()
{
     if(confirm("Are you sure you want to delete ?"))
    {
        Grid_Detail.DeleteRow();
    }
}
//------------------------------------------------------------
function OnCheckTotal()
{
    var i;
    var total = 0;
    
   // alert(Grid_Detail.GetGridControl().Cols);
   for(i = 6; i<18;i++)
    {

         total += Number(Grid_Detail.GetGridData(Grid_Detail.row,i));
        // alert(Grid_Detail.GetGridData(Grid_Detail.row,i));
     
    }
    Grid_Detail.SetGridText(Grid_Detail.row, 5, total);
}
//---------------------------------------------------------------------------------
function OnShowPopup()
{
        var fpath   = System.RootURL + "/standard/forms/60/15/60150030_popup.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                   txtTen_pk.text=object;     // Center PK
                    dat_tree.Call();
                }            
            }    
}
function OnReport()
{

        if(lstLoai.value != '96')
       { 
            var url = System.RootURL + "/standard/reports/gf/bm/gfbm00030_Nam.aspx?Company_pk=" +lstCompany.value + "&From=" + dtfrdate.value + "&To=" + dttodate.value + "&Taikhoan_pk=" + txtTen_pk.text + "&Loai=" + lstLoai.value + "&6thang=" + lstHalfYear.value +"&Quy="+ lstThang.value;
          
       } 
       else if(lstLoai.value == '96')
       {
            var  yyyymm = dtMonth.GetData();
            var mm = yyyymm.substr(4,2);
            var url = System.RootURL + "/standard/reports/gf/bm/gfbm00030_thang.aspx?Company_pk=" +lstCompany.value + "&From=" + dtfrdate.value + "&To=" + dttodate.value + "&Taikhoan_pk=" + txtTen_pk.text + "&Loai=" + lstLoai.value + "&6thang=" + lstHalfYear.value +"&Quy="+ lstThang.value + "&Thang=" + mm;
       }
       
       System.OpenTargetPage(url);      
}
function ChangeColor()
{
    var ctrl = Grid_Detail.GetGridControl();
  //var a = '', b = '' , c= '';  
var j;  
var a = new Array();
var b = new Array();
var c = new Array();
for(j = 7; j < 46; j++)
{
    a[j - 7] = '';
    b[j - 7] = '';
    c[j - 7] = '';  
}
var l_flag = false ;
    for (i = 2; i < ctrl.Rows; i++)
	{
	    if(Grid_Detail.GetGridData(i,1)== "B")
        {
              
	        Grid_Detail.SetCellBold(i, 0, i, 45, true);
	       Grid_Detail.SetCellBgColor(i, 0,i,45,0xA9EBD7);
	     
	       //Grid_Detail.Subtotal (0,2 ,6,'7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45','',true,45,'Lợi nhuận thuần');
        }
       if(Grid_Detail.GetGridData(i,1) == 'B' && l_flag==false)
        {
                l_flag = true; 
                  for(j = 7; j < 46; j++)
                  {
                        a[j-7] = Number(Grid_Detail.GetGridData(i , j) );                        
                  }                    
        }
        else if( Grid_Detail.GetGridData(i,1)== 'B' && l_flag==true)   
          {
                          for(j = 7; j < 46; j++)
                          {
                                b[j-7] = Number(Grid_Detail.GetGridData(i , j) );                        
                               c[j-7] = Number(a[j-7] - b[j-7]); 
                          }                                           
            }     
            
    }
  Grid_Detail.AddRow();
Grid_Detail.SetCellBgColor(Grid_Detail.rows-1, 0, Grid_Detail.rows-1, Grid_Detail.cols-1, 0xabcdef);    
Grid_Detail.SetCellBold(Grid_Detail.rows-1, 0, Grid_Detail.rows-1, 45, true);
   for( j = 7; j < 46; j++)
  {  
        
        Grid_Detail.SetGridText( Grid_Detail.rows-1, 6, 'Lợi nhuận thuần' )  ;  
        Grid_Detail.SetGridText( Grid_Detail.rows-1, j, c[j-7] )  ;
   }    
}

</script>
<body>
 <gw:data id="DSO_Grid" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ac_sel_60150030" > 
            <input  >
                          <input bind="lstCompany"/> 
				          <input bind="dtfrdate"/>
				          <input bind="dttodate"/> 
				          <input bind="txtTen_pk"/> 
            </input>
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
 <!------------------------------------------------------------------------------------>
<gw:data id="dat_tree" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60150030_1"  > 
                <input>
                    <input bind="txtTen_pk" />
                </input> 
                <output>
                    <output bind="txtMa" />
                    <output bind="txtTen" />
                </output>
            </dso> 
        </xml> 
   </gw:data> 
      <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
          
            <td style="background: white; width: 100%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="width: 100%;height:100%" border="0">
                   <tr style="width:100%;height:5%" valign="top">
                        <td width="100%">
                             <fieldset>
                                      <table style="width:100%" cellpadding="1" cellspacing="1" border="0">
                                        <tr>
                                                <td align="right" width="14%">Company</td>
                                                <td width="20%"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                                  </gw:list>
                                               </td>
                                                <td width="10%" align="right">Type</td>
                                                <td width="26%" >
                                                   <gw:list id="lstLoai" onchange="OnChangeDateType();OnSearch()"   styles="width:100%" />
                                                </td>
                                                <td  width="20%" align="right">
                                                     <table cellpadding="0" cellspacing="0" width="100%">
                                                             <tr>
                                                                   <td width="50%" align="right"><gw:label id="lblDateType" text="Month" styles="font-weight:600;"  /></td>
                                                                  <td width="50%" align="left"><gw:list id="lstThang" onchange="OnChangeQuater()" ></gw:list></td>
                                                             </tr>
                                                     </table>
                                                </td>
                                                <td width="10%"  >
                                                      <table width="100%" cellpadding="0" cellspacing="0">
                                                              <tr>
                                                                    <td  width="100%" align="left"><gw:datebox id="dtYear" type="year" lang="1" styles="display:none" onchange="OnChangeYear()"/>
                                                                    <gw:datebox id="dtMonth" type="month" lang="1" onchange="OnChangeMonth()"/>
                                                                    <gw:list id="lstHalfYear" onchange="OnChangeHalfYear()" ></gw:list>
                                                                    <gw:datebox id="dtYear1" type="year" lang="1" styles="display:none"  onchange="OnChangeYear1()"/>
                                                                    </td>
                                                                    
                                                              </tr>
                                                      </table>
                                                 
                                                 </td>
                                               
                                                <td><gw:imgbtn id="btnSearch1" img="search" alt="Tìm kiếm"  onclick="OnSearch()" /></td>
                                                
                                                <td ><gw:imgbtn id="btnSave2" img="excel" alt="In report"  onclick="OnReport()" /></td>
                                              
                                            </tr>
                                            <tr>
                                                   <td align="right" width="14%"><a title="Nhấp vào đây để chọn tài khoản" onclick="OnShowPopup()" href="#tips" >Budget</a></td>
                                                   <td width="46%" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width:100%">
                                                                    <tr>
                                                                                <td width="40%"><gw:textbox id="txtMa"  styles="width:100%" /></td> 
                                                                                <td width="60%"><gw:textbox id="txtTen"  styles="width:100%" /></td> 
                                                                                <td ><gw:imgbtn id="btnSave" img="reset" alt="Xóa"  onclick="txtMa.text='';txtTen.text='';txtTen_pk.text='';" /></td>
                                                                                <td><gw:textbox id="txtTen_pk"  styles="width:100%;display:none" /></td> 
                                                                    </tr>
                                                            </table> 
                                                   </td>
                                                   <td align="right" width="15%">Date from</td>
                                                   <td width="15%" colspan="3">
                                                          <table cellpadding="0" cellspacing="0" width="100%">
                                                                  <tr>
                                                                        <td width="10%"><gw:datebox id="dtfrdate" lang="<%=Session("Lang")%>"  styles="width:100%" /></td>
                                                                        <td align="center">~</td>
                                                                        <td width="10%"><gw:datebox id="dttodate" lang="<%=Session("Lang")%>"  styles="width:100%" /></td>
                                                                  </tr>
                                                          </table>
                                                   
                                                   </td>
                                                   
                                                 
                                            </tr>
                            </table>
                             </fieldset>
                            
                        </td>
                   </tr>
                  <tr  style="width:100%;height:95%"  >
                          <td width="100%">
                        <!--  header="0._PK|1._Master_pk|2._Acc_pk|3.Mã|4.Tên|5.Mã TK|6.Tên TK|          7.Tổng|8.Tháng 1|9.Tháng 2|10.Tháng 3|11.Tháng 4|12.Tháng 5|13.Tháng 6|14.Tháng 7|15.Tháng 8|16.Tháng 9|17.Tháng 10|18.Tháng 11|19.Tháng 12             |20.Tổng|21.Tháng 1|22.Tháng 2|23.Tháng 3|24.Tháng 4|25.Tháng 5|26.Tháng 6|27.Tháng 7|28.Tháng 8|29.Tháng 9|30.Tháng 10|31.Tháng 11|32.Tháng 12                |33.Tổng|34.Tháng 1|35.Tháng 2|36.Tháng 3|37.Tháng 4|38.Tháng 5|39.Tháng 6|40.Tháng 7|41.Tháng 8|42.Tháng 9|43.Tháng 10|44.Tháng 11|45.Tháng 12"   -->
                           <gw:grid
                           id="Grid_Detail"
                           
								                   header="_PK|_Master_pk|_Acc_pk|Budget code|Budget name|Account code|Account name|Total|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|Tổng|Tháng 1|Tháng 2|Tháng 3|Tháng 4|Tháng 5|Tháng 6|Tháng 7|Tháng 8|Tháng 9|Tháng 10|Tháng 11|Tháng 12|Tổng|Tháng 1|Tháng 2|Tháng 3|Tháng 4|Tháng 5|Tháng 6|Tháng 7|Tháng 8|Tháng 9|Tháng 10|Tháng 11|Tháng 12"   
													            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													               aligns="0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"  
													            defaults="|||||||||||||||||||||||||||||||||||||||||||||"  
													            editcol ="0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1"  
													            widths  ="0|0|0|1500|3000|1500|3000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000" 
													            styles="width:100%; height:100%"
                                                                sorting="T" 
                                        
													            />
										        </td>
                  </tr>
                                    
                </table>
                
                            
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
   
<gw:textbox id="txtPK"  text="" style="display:none" />      
  <gw:textbox id="txt_date" style="display: none" />       
  <gw:textbox id="txtDateType" style="display: none" />                     
</body>
</html>
