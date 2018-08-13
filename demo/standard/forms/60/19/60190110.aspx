<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily S/L</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
var Ispopup='';
function BodyInit()
{
    grdSLByVoucher.style.display="none";
    BindingDataList();
    FormatSumGrid() ;
    FormatDateGrid();
   
     

    System.Translate(document);
}

function BindingDataList()
{

  

    var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_data4 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2  FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
    var ls_data5 = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK002' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_data6 ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_LNM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACAB021'  ORDER BY D.DEF_YN DESC, D.ORD")%>";
  
      lstCompany.SetDataText(ls_data);
    lstLanguage.SetDataText(ls_data1); 
    lstBookCcy.SetDataText(ls_data3); 
    lstCurrency.SetDataText(ls_data4); 
    lstReportType.SetDataText(ls_data5); 
    lstRptOption.SetDataText(ls_data6); 
    txtAccCode.SetEnable(false); 
    txtAccName.SetEnable(false);
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();	
}

function onGetAcc()
{

	var fpath = System.RootURL + "/standard/forms/60/19/gfff00020_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60190110_popup2";
	var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
			if (aValue != null)
			{
				if(aValue[0] != 0)
				{
					txtAccCode.SetDataText(aValue[0]);
					txtAccName.SetDataText(aValue[1]);
					txtAccPK.SetDataText(aValue[3]);
				}
			}
}

function onResetAcc()
{
        txtAccPK.text = '';
        txtAccCode.text = '';
        txtAccName.text = '';
}

function onChangeFormat()
{
        if (rdoAmountType.value==1)//Trans & Books
        {
            if (g_inquiry_type==10)//Dates :10; 
            {
                var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(3)=2000;
			    fg.ColWidth(4)=2000;
			    fg.ColWidth(5)=2000;
			    fg.ColWidth(6)=2000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(6)=1500;
                fg.ColWidth(7)=1500;
                fg.ColWidth(8)=1500;
                fg.ColWidth(9)=1500; 
            }
          
        }
        else//2: Books
        {
             if (g_inquiry_type==10)//Dates :10; 
            {
                 var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(3)=0;
			    fg.ColWidth(4)=0;
			    fg.ColWidth(5)=3000;
			    fg.ColWidth(6)=3000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(6)= 0;
                fg.ColWidth(7)= 0;
                fg.ColWidth(8)=1500;
                fg.ColWidth(9)=1500; 
            }
        }
          FormatSumGrid();
}

function FormatDateGrid()
{
        if(grdSLByDate.rows <2)
       {
            grdSLByDate.AddRow();
       } 
        var fg=grdSLByDate.GetGridControl();
		
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

		fg.MergeCol(0) = true;
        fg.Cell(0, 0, 0, 1, 0) = "Date";
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "CCY";
		fg.MergeCol(2) = true;
		fg.Cell(0, 0, 2, 1, 2) = "Opening Balance";
		
		fg.Cell(0, 0, 3, 0, 4) = "Trans";  
		fg.Cell(0, 0, 5, 0, 6) = "Books";
		
		fg.Cell(0, 1, 3, 1) = "Debit";
		fg.Cell(0, 1, 4, 1) = "Credit";
		
		fg.Cell(0, 1, 5, 1) = "Debit";
		fg.Cell(0, 1, 6, 1) = "Credit";
		
		fg.MergeCol(7) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, 7, 1, 7) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, 7, 1, 7) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, 7, 1, 7) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=1500;
		fg.ColWidth(1)=800;
		fg.ColWidth(2)=2000;
		
		fg.ColWidth(3)=2000;
		fg.ColWidth(4)=2000;
		
		fg.ColWidth(5)=2000;
		fg.ColWidth(6)=2000;
		
		fg.ColWidth(7)=2000;
		fg.ColWidth(8)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(5)=2000;
			fg.ColWidth(6)=2000;
		} else // Only Books
		{
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(5)=3000;
			fg.ColWidth(6)=3000;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(2) = "#,###,###,###,###";
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(6) = "#,###,###,###,###";
		    fg.ColFormat(7) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(2) = "#,###,###,###,###.##";
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(6) = "#,###,###,###,###.##";
		    fg.ColFormat(7) = "#,###,###,###,###.##";
		}
		
		fg.ColFormat(3) = "#,###,###,###,###.##";
		fg.ColFormat(4) = "#,###,###,###,###.##";
		
		fg.ColAlignment(2) = flexAlignRightCenter;
		fg.ColAlignment(3) = flexAlignRightCenter;
		fg.ColAlignment(4) = flexAlignRightCenter;
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		fg.ColAlignment(7) = flexAlignRightCenter;
		
		//fg.ColAlignment(i) = flexAlignRightCenter;
}

function FormatVoucherGrid()
{
        if(grdSLByVoucher.rows <2)
        {
            grdSLByVoucher.AddRow();
        } 
        var fg =  grdSLByVoucher.GetGridControl();
        fg.FixedRows = 2;
        fg.MergeCells = 5;
        fg.FrozenCols = 5;

        fg.MergeRow(0) = true;

        fg.MergeCol(0) = true;
        fg.Cell(0, 0, 0, 1, 0) = "Seq";

        fg.MergeCol(1) = true;
        fg.Cell(0, 0, 1, 1, 1) = "Voucher No";
        
        fg.MergeCol(2) = true;
        fg.Cell(0, 0, 2, 1, 2) = "Proposed Date";
        
        fg.MergeCol(3) = true;
        fg.Cell(0, 0, 3, 1, 3) = "Proposed By";
        
        fg.MergeCol(4) = true;
        fg.Cell(0, 0, 4, 1, 4) = "Ccy";
        
        fg.MergeCol(5) = true;
        fg.Cell(0, 0, 5, 1, 5) = "Oppeing Balance";
        
        fg.Cell(0,0,6,0,7) = "Trans";
        fg.Cell(0,1,6,1,6) = "Debit";
        fg.Cell(0,1,7,1,7) = "Credit";
        
        fg.Cell(0,0,8,0,9) = "Books";
        fg.Cell(0,1,8,1,8) = "Debit";
        fg.Cell(0,1,9,1,9) = "Credit";
        
        fg.MergeCol(10) = true;
        fg.Cell(0, 0, 10, 1, 10) = "CFM Balance";
        
        fg.MergeCol(11) = true;
        fg.Cell(0, 0, 11, 1, 11) = "Customer Name";
        
        fg.Cell(0,0,12,0,13) = "Description";
        fg.Cell(0,1,12,1,12) = "Foreign";
        fg.Cell(0,1,13,1,13) = "Local";
        
       fg.ColWidth(0)=600;
		fg.ColWidth(1)=1100;
		fg.ColWidth(2)=1100;
		fg.ColWidth(3)=1200;
		fg.ColWidth(4)=500;
		fg.ColWidth(5)=1700;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=2000;
		fg.ColWidth(11)=1500;
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=1500;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(6)=1500;
		    fg.ColWidth(7)=1500;
		    fg.ColWidth(8)=1500;
		    fg.ColWidth(9)=1500;
		} else // Only Books
		{
			fg.ColWidth(6)= 0;
		    fg.ColWidth(7)= 0;
		    fg.ColWidth(8)=1500;
		    fg.ColWidth(9)=1500;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(8) = "#,###,###,###,###";
		    fg.ColFormat(9) = "#,###,###,###,###";
		    fg.ColFormat(10) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(8) = "#,###,###,###,###.##";
		    fg.ColFormat(9) = "#,###,###,###,###.##";
		    fg.ColFormat(10) = "#,###,###,###,###.##"; 
		}
		fg.ColFormat(6) = "#,###,###,###,###.##";
		fg.ColFormat(7) = "#,###,###,###,###.##";
		
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		fg.ColAlignment(7) = flexAlignRightCenter;
		fg.ColAlignment(8) = flexAlignRightCenter;
		fg.ColAlignment(9) = flexAlignRightCenter;
		fg.ColAlignment(10) = flexAlignRightCenter;
		
}
function FormatSumGrid()
{
     if(grdSLSum.rows <2)
       {
            grdSLSum.AddRow();
       } 
        var fg=grdSLSum.GetGridControl();
		
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
        fg.MergeCells = 3;
		fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "Opening Balance";
		
		
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "Ccy";
		
		fg.Cell(0, 0, 2, 0, 3) = "Trans";  
		fg.Cell(0, 0, 4, 0, 5) = "Books";
		
		fg.Cell(0, 1, 2, 1) = "Debit";
		fg.Cell(0, 1, 3, 1) = "Credit";
		
		fg.Cell(0, 1, 4, 1) = "Debit";
		fg.Cell(0, 1, 5, 1) = "Credit";
		
		fg.MergeCol(6) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, 6, 1, 6) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, 6, 1, 6) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, 6, 1, 6) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=2300;
		fg.ColWidth(1)=2000;
		
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(2)=2000;
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(5)=2000;
		} else // Only Books
		{
			fg.ColWidth(2)=0;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=3000;
			fg.ColWidth(5)=3000;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(0) = "#,###,###,###,###";
		    fg.ColFormat(4) = "#,###,###,###,###";
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(6) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(0) = "#,###,###,###,###.##";
		    fg.ColFormat(4) = "#,###,###,###,###.##";
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(6) = "#,###,###,###,###.##";		    
		}
		
		fg.ColFormat(2) = "#,###,###,###,###.##";
		fg.ColFormat(3) = "#,###,###,###,###.##";
	
		
		fg.ColAlignment(0) = flexAlignRightCenter;
		fg.ColAlignment(2) = flexAlignRightCenter;
		fg.ColAlignment(3) = flexAlignRightCenter;
		fg.ColAlignment(4) = flexAlignRightCenter;
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		
}
function onSearch()
{  
        if(Trim(txtAccPK.text)=="")
       {
         alert('Please select an account ');
         return;
       }
      if (rdoInquiryType.value=="1")//Report type is Date
      {
            grdSLByDate.style.display="";
            grdSLByDate.ClearData();
            grdSLByVoucher.style.display="none";
            g_inquiry_type =10;
            FormatDateGrid();
      }
      if (rdoInquiryType.value=="2")//Report type is Voucher
      {
            grdSLByDate.style.display="none";
            grdSLByVoucher.style.display="";
            grdSLByVoucher.ClearData();
            g_inquiry_type =20;
            FormatVoucherGrid();
      }
      
      datSLSum.Call('SELECT');
      
}

function ReplaceACharacter(vStr,vChar)
{
    var i;
	for(i=0;i<vStr.length;i++)
	{
		if(vStr.substr(i,1)== vChar)
		{
			vStr=vStr.replace(vChar,"");
		}
	}
	return vStr;
}


function OnDataReceive(dsql)
{
    if (dsql.id=="datSLSum")
   {
        FormatSumGrid();
         if(grdSLSum.rows > 2)
       {	
		    txtOpenBalance.text = parseFloat(ReplaceACharacter(Trim(grdSLSum.GetGridData(2,0)),","));
       }else{
   		    txtOpenBalance.text = 0;
       }
      //Merge Balance column
      
       
        if(g_inquiry_type==10)
        {
            datSLByDate.Call('SELECT');
        }
        if(g_inquiry_type==20)
        {
            datSLByVoucher.Call('SELECT');
        }
        return;
   } 
   if(dsql.id=="datSLByDate")
   {
         FormatDateGrid();
         makeOpenBalanceByDate();
   }
   
   if(dsql.id=="datSLByVoucher")
   {
           
         FormatVoucherGrid();
         makeOpenBalanceByVoucher();
   }
}

function makeOpenBalanceByDate()
{
    if (grdSLByDate.rows >2)
   {
        for(i=3;i<grdSLByDate.rows;i++)
        {
            grdSLByDate.SetGridText(i,2,grdSLByDate.GetGridData(i-1,7));
        }
   } 
}

function makeOpenBalanceByVoucher()
{
    if (grdSLByVoucher.rows >2)
   {
        for(i=3;i<grdSLByVoucher.rows;i++)
        {
            grdSLByVoucher.SetGridText(i,5,grdSLByVoucher.GetGridData(i-1,10));
        }
   } 
}


function OnDataError(dsql)
{
alert(dsql.id);
}

function RowClick()
{
   var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";
    var ls_arr = ""; 

    var ctrl = grdSLByVoucher.GetGridControl();
    rows = ctrl.Rows;
    rows = rows - 1;
    rownum = ctrl.row;
    pk = grdSLByVoucher.GetGridData(ctrl.row, 0);
    tatus = grdSLByVoucher.GetGridData(ctrl.row, 6);
//    for (i = 1; i < grdSLByVoucher.rows; i++)
//    {
//        ls_arr = ls_arr + ' ' + grdSLByVoucher.GetGridData(i, 0);
//    } 

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "gfka00020" ;        
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function GetRowPK(row_index){
    if((row_index < grdSLByVoucher.rows) && (row_index > 0)){
        return grdSLByVoucher.GetGridData(row_index, 0);
    }
    return -1;
}


function OnPrint(lang)
{
var p =  "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;  
switch(lang)
    {
        
        case "VIE":
                    if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
              var p =  "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;  
               //rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;
               rqt = "?p_company_pk="+lstCompany.value+'&p_acc_pk='+txtAccPK.text+'&p_date_from='+dtbFrom.value+'&p_date_to='+dtbTo.value+'&p_status='+rdoSlipStatus.value+'&p_ccy='+lstCurrency.value+'&p_openbal='+txtOpenBalance.text;
               //Nhat ky chi tien
               if (lstReportType.value=="AS")
               {
//                        if(rdoInquiryType.value == 1)
//                        {
//                            if(rdoAmountType.value == 2)
//                            {
                                
	                            var url =System.RootURL + '/standard/reports/60/19/60190110_DateFormUp_ENG_DateFormUp_VIE.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
//                            }
//                            else
//                            {
//                                var url =System.RootURL + '/standard/reports/60/19/60190110_Date_BookTrans.aspx'+rqt;
//                                System.OpenTargetPage( url , 'newform' );
//                            }
//		                }
//		                else
//		                {
//	                           if(rdoAmountType.value == 2)
//	                           {
//	                                var url =System.RootURL + '/standard/reports/60/19/60190110_GiongTrenForm_Voucher.aspx'+rqt;
//                                    System.OpenTargetPage( url , 'newform' );
//                               }
//                               else
//                               {
//                                     var url =System.RootURL + '/standard/reports/60/19/60190110_GiongTrenForm_Vouche_Book_Trans.aspx'+rqt;
//                                    System.OpenTargetPage( url , 'newform' );
//                               }
//		                }
                        
               }
               if (lstReportType.value=="S03a2-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKchitienS03a2-DN_VIE.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }
                        
               }
               //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKthutienS03a1-DN_VIE.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_Soquy_S07-DN.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoKToanCTquy_S07a-DN.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_T_SCTQT.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //So cai
                if (lstReportType.value=="S01-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoCaiNKC_So3b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
            		   
               }
               //T so cai
                if (lstReportType.value=="TGL")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_T_SOCAI.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //Daily SL
               
               /*if (lstReportType.value=="AS")
               {
                    var url ="";
                    if (lstBookCcy.value==lstCurrency.value)
                    {
                        url =System.RootURL + '/standard/reports/60/19/60190110_DailySL.aspx'+rqt;
                     }
                     else
                     {
                            url =System.RootURL + '/standard/reports/60/19/60190110_DailySL_CCY.aspx'+rqt;
                     }
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }*/
               
               
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_TKDUPSN.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                         var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_TKDUPSC.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
              //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_taikhoan_doiung_tongphatsinh_1.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_taikhoan_doiung_tongphatsinh_2.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
              //so tien gui ngan hang
                if (lstReportType.value=="S08DN2")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_NH_S07-DN.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               } 
              //so chi tiet tai khoan
                if (lstReportType.value=="S38-DN")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoChitietTK_S38-DN_VIE.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }  
               if (lstReportType.value=="S38-DN2")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoChitietTK_S38-DN2_VIE.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }   
               if (lstReportType.value=="S01-DN-CT")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SocaiNKC_S03b-DN_CostCenter.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }    
              if (lstReportType.value=="S01-DN-BIZ-CC")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SocaiNKC_S03b-DN_BIZ-CC.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }     
    break;
    case "KOR":
                    if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
               //rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;
               rqt = "?p_company_pk="+lstCompany.value+'&p_acc_pk='+txtAccPK.text+'&p_date_from='+dtbFrom.value+'&p_date_to='+dtbTo.value+'&p_status='+rdoSlipStatus.value+'&p_ccy='+lstCurrency.value+'&p_openbal='+txtOpenBalance.text;
               //Nhat ky chi tien
               if (lstReportType.value=="AS")
               {
                        if(rdoInquiryType.value == 1)
                        {
	                            var url =System.RootURL + '/standard/reports/60/19/60190110_DateFormUp_ENG.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
		                }
		                else
		                {
	                           //var url =System.RootURL + '/standard/reports/60/19/60190110_SoCaiNKC_So3b-DN.aspx'+rqt;
	                            var url =System.RootURL + '/standard/reports/60/19/60190110_GiongTrenForm_Voucher_ENG.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
		                }
                        
               }
               if (lstReportType.value=="S03a2-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKchitienS03a2-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }
                        
               }
               //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                        var s = new String(txtAccCode.text)
                       rqt = "?p_company_pk="+lstCompany.value+'&p_acc_pk='+txtAccPK.text+'&p_date_from='+dtbFrom.value+'&p_date_to='+dtbTo.value+'&p_ccy='+lstCurrency.value + '&p_status='+rdoSlipStatus.value+ '&bookccy='+lstBookCcy.value;  
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKthutienS03a1-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_Soquy_S07-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoKToanCTquy_S07a-DN.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                   
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_T_SCTQT.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //So cai
                if (lstReportType.value=="S01-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoCaiNKC_So3b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
            		   
               }
               //T so cai
                if (lstReportType.value=="TGL")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_T_SOCAI.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               
               //Daily SL
               
               /*if (lstReportType.value=="AS")
               {
                    var url ="";
                    if (lstBookCcy.value==lstCurrency.value)
                    {
                        url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL.aspx'+rqt;
                     }
                     else
                     {
                            url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL_CCY.aspx'+rqt;
                     }
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }*/
               
               
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                         var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
              //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
    break;
    case "ENG":
          if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
              rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value; 
              // rqt = "?p_company_pk="+lstCompany.value+'&p_acc_pk='+txtAccPK.text+'&p_date_from='+dtbFrom.value+'&p_date_to='+dtbTo.value+'&p_status='+rdoSlipStatus.value+'&p_ccy='+lstCurrency.value+'&p_openbal='+txtOpenBalance.text;
               //Nhat ky chi tien
               if (lstReportType.value=="AS")
               {
//                        if(rdoInquiryType.value == 1)
//                        {
//	                         if(rdoAmountType.value == 2)
//                                {       
	                                var url =System.RootURL + '/standard/reports/60/19/60190110_DateFormUp_ENG.aspx'+rqt;
                                    System.OpenTargetPage( url , 'newform' );
//                                 }
//                                 else
//                                 {
//                                     var url =System.RootURL + '/standard/reports/gf/rv/gflv00020_Date_BookTrans_ENG.aspx'+rqt;
//                                     System.OpenTargetPage( url , 'newform' );
//                                 }
//		                }
//		                else
//		                {
//	                           if(rdoAmountType.value == 2)
//	                           {
//	                                 var url =System.RootURL + '/standard/reports/gf/rv/gfrv00020_GiongTrenForm_Voucher_ENG.aspx'+rqt;
//                                     System.OpenTargetPage( url , 'newform' );
//                                }
//                                else
//                                {
//                                    var url =System.RootURL + '/standard/reports/gf/rv/gfrv00020_GiongTrenForm_Vouche_Book_Trans_ENG.aspx'+rqt;
//                                    System.OpenTargetPage( url , 'newform' );
//                                }
//		                }
                        
               }
                if(lstReportType.value=="S01-DN")
              {
                         var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                                var url =System.RootURL + '/standard/reports/60/19/60190110_SoCaiNKC_So3b-DN_ENG.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' ); 
                                return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
              }  
         //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
              
                        var s = new String(txtAccCode.text)
                      var p = "?p_company_pk="+lstCompany.value+'&p_acc_pk='+txtAccPK.text+'&p_date_from='+dtbFrom.value+'&p_date_to='+dtbTo.value+'&p_status='+rdoSlipStatus.value+'&p_ccy='+lstCurrency.value+'&p_openbal='+txtOpenBalance.text; 
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKthutienS03a1-DN_Eng.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Nhat ky chi tien
               if (lstReportType.value=="S03a2-DN")
               {
              
                   if(rdoInquiryType.value == 1)
                   {
                        var s = new String(txtAccCode.text)
                        if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                    {
                                var url =System.RootURL + '/standard/reports/60/19/60190110_SoNKchitienS03a2-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
                            }
                         else
		                    {
		                        alert("This is not payment acount code");
		                       return; 
		                    }     
            	    }
//            	else
//            	{
//            	    var url =System.RootURL + '/standard/reports/gf/rv/gfrv00020_SoCaiNKC_So3b-DN_ENG.aspx'+rqt;
//                                System.OpenTargetPage( url , 'newform' );
//            	}	 
                        
               }
                //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_Soquy_S07-DN_ENG.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
                //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_SoKToanCTquy_S07a-DN_Eng.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //T so cai
                if (lstReportType.value=="TGL")
               {
                    var s = new String (txtAccCode.text)
                      if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {   
                            var url =System.RootURL + '/standard/reports/60/19/60190110_T_SOCAI_Eng.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                        else
                        {
                            alert("This is not payment acount code");
		                   return; 
                        }
               }
                //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/60/19/60190110_T_SCTQT_Eng.aspx'+p;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                    var s = new String(txtAccCode.text)
                     if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_TKDUPSN_Eng.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                    else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }      
               }
                //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                         var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_TKDUPSC_Eng.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
                //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_taikhoan_doiung_tongphatsinh_1_Eng.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
                //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_taikhoan_doiung_tongphatsinh_2_Eng.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }
            //So tien gui ngan hang
           if (lstReportType.value=="S08DN2")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_NH_S07-DN_ENG.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }  
                if (lstReportType.value=="S38-DN")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoChitietTK_S38-DN_ENG.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }   
                if (lstReportType.value=="S38-DN2")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SoChitietTK_S38-DN2_ENG.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }   
              if (lstReportType.value=="S01-DN-CT")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SocaiNKC_S03b-DN_CostCenter_ENG.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }     
               if (lstReportType.value=="S01-DN-BIZ-CC")
               {
                     var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/60/19/60190110_SocaiNKC_S03b-DN_BIZ-CC_ENG.aspx'+p;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
               }      
    break;
 }
}
</script>
<body>
   <gw:data id="datSLSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60190110_company">
                <input bind="grdSLSum">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                </input>
                <output bind="grdSLSum"/>
            </dso>
        </xml>
    </gw:data> 
   <gw:data id="datSLByDate" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60190110_copany2">
                <input bind="grdSLByDate">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                    <input bind="txtOpenBalance"/>
                </input>
                <output bind="grdSLByDate"/>
            </dso>
        </xml>
    </gw:data>  
   
      <gw:data id="datSLByVoucher" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60190110_grd_voucher">
                <input bind="grdSLByVoucher">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                    <input bind="txtOpenBalance"/>
                </input>
                <output bind="grdSLByVoucher"/>
            </dso>
        </xml>
    </gw:data>   
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
	
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="10%">Company</td>
                        <td  width="22%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                        <td width="10%" align="right" valign="middle"><a onclick="onGetAcc()" href="#" title="Get Account">Account Code</a></td>
                        <td width="44%" colspan="3">
                            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                    <td width="25%"><gw:textbox id="txtAccCode" text="" maxlen = "6" styles='width:100%'/> </td>
                                    <td width="70%"><gw:textbox id="txtAccName" text="" maxlen = "100" styles='width:100%'/></td>
                                    <td width="5%"><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account" onclick="onResetAcc()" /></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" width="6%">Language</td>
                        <td  width="8%"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
                        <td align="right">Proposed Date</td>
                        <td >
                                <table border="0" cellpadding="0" cellspacing="0"  width="100%">
                                <tr>
                                    <td width="45%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                    <td width="10%" align="center"><b>&nbsp;~&nbsp;</b></td>
                                    <td width="45%" align="right"><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                </table>
                        </td>
                        <td align="right"  valign="middle">Inquiry Type</td>
                        <td width="16%">
                                <gw:radio id="rdoInquiryType"  value="1"> 
                                        <span value="1" > Dates</span>
                                        <span value="2" >Vouchers</span>
                                 </gw:radio >
                        </td>
                        <td align="right" width="9%">Report Option</td>
                        <td  width="19%"><gw:list id="lstRptOption" styles="width:100%;" ></gw:list></td>
                        <td align="right">Currency</td>
                        <td><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
                        <td align="right"  valign="middle">Slip Status</td>
                        <td  align="left">
                                <gw:radio id="rdoSlipStatus"  value="2" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                        </td>
                        <td align="right"  valign="middle">Amount Type</td>
                        <td >
                                 <gw:radio id="rdoAmountType"  value="2" onchange="onChangeFormat()"> 
                                        <span value="1" >Trans & Books</span>
                                        <span value="2" > Books</span>
                                 </gw:radio >
                        </td>
                        <td align="right" >Report Type </td>
                        <td  ><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                        <td ></td>
                        <td align="right">
                            <table border="0" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                                    <td><gw:button id="ibtnReport" img="excel" text="Print"  alt="Print Report" onclick="OnPrint(lstLanguage.GetData())" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
          </td> 
       </tr>
      <tr>
            <td>
           <gw:grid id='grdSLByDate'
        header='Proposed Date|Ccy|Oppeing Balance|Debit Trans|Credit Trans|Debit Books|Credit Books|Closing Balance|_Date'
        format='4|0|1|1|1|1|1|1|0'
        aligns='1|1|2|2|2|2|2|2|2'
        defaults='||||||||'
        editcol='0|0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|0'
        sorting='T'
        acceptNullDate="T"
        styles='width:100%; height:280'
        />
        <gw:grid id='grdSLByVoucher'
        header='PK|VOUCHERNO|TR_DATE|USER_ID|CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|CREDITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|CUSTOMER|REMARK|remark2|_tr_date_filter'
        format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0'
        aligns='1|0|1|1|1|2|2|2|2|2|2|0|0|0|0'
        defaults='||||||||||||||'
        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        acceptNullDate="T"
        styles='width:100%; height:280;'
        oncelldblclick ="RowClick()"
        />
        
            </td>
      </tr> 
      <tr>
            <td>
           <gw:grid id='grdSLSum'
        header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|_OB'
        format='0|1|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2|2'
        defaults='|||||||'
        editcol='0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:80;'
        />
            </td>
      </tr> 
</table>  
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAccPK" styles="display:none;"/> 
<gw:textbox id="txtOpenBalance" styles="display:none;" /> 
<gw:textbox id="txt_temp" styles="display:none;" /> 
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>
