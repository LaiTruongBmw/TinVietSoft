<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily S/L</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
var Ispopup='';
function BodyInit()
{
    System.Translate(document);
    _Voucher.style.display="none";
    BindingDataList();
    FormatSumGrid() ;
    FormatDateGrid();
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
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
   lstCompany.value="<%=session("company_pk") %>"; 
    lstLanguage.SetDataText(ls_data1); 
    lstBookCcy.SetDataText(ls_data3); 
    lstCurrency.SetDataText(ls_data4); 
    lstReportType.SetDataText(ls_data5); 
    lstRptOption.SetDataText(ls_data6); 
    txtAccCode.SetEnable(false); 
    txtAccName.SetEnable(false);
	rdoInquiryType.value = '2';
}

function onGetAcc()
{
var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60030010_sum_parent";
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
                fg.ColWidth(7)=1500;
                fg.ColWidth(8)=1500;
                fg.ColWidth(9)=1500;
                fg.ColWidth(10)=1500; 
            }
          
        }
        else if (rdoAmountType.value==2)//2: Books
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
                fg.ColWidth(7)= 0;
                fg.ColWidth(8)= 0;
                fg.ColWidth(9)=1500;
                fg.ColWidth(10)=1500; 
            }
        }
        else//trans
        {
             if (g_inquiry_type==10)//Dates :10; 
            {
                 var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(5)=0;
			    fg.ColWidth(6)=0;
			    fg.ColWidth(3)=3000;
			    fg.ColWidth(4)=3000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(9)= 0;
                fg.ColWidth(10)= 0;
                fg.ColWidth(7)=1500;
                fg.ColWidth(8)=1500; 
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
        fg.FrozenCols = 6;

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
        fg.Cell(0, 0, 5, 1, 5) = "Acc Code";
		
        fg.MergeCol(6) = true;
        fg.Cell(0, 0, 6, 1, 6) = "Oppeing Balance";
        
        fg.Cell(0,0,7,0,8) = "Trans";
        fg.Cell(0,1,7,1,7) = "Debit";
        fg.Cell(0,1,8,1,8) = "Credit";
        
        fg.Cell(0,0,9,0,10) = "Books";
        fg.Cell(0,1,9,1,9) = "Debit";
        fg.Cell(0,1,10,1,10) = "Credit";
        
        fg.MergeCol(11) = true;
        fg.Cell(0, 0, 11, 1, 11) = "CFM Balance";
        
        fg.MergeCol(12) = true;
        fg.Cell(0, 0, 12, 1, 12) = "Customer Name";
        
        fg.Cell(0,0,13,0,14) = "Description";
        fg.Cell(0,1,13,1,13) = "Foreign";
        fg.Cell(0,1,14,1,14) = "Local";
        
       fg.ColWidth(0)=600;
		fg.ColWidth(1)=1500;
		fg.ColWidth(2)=1100;
		fg.ColWidth(3)=1200;
		fg.ColWidth(4)=500;
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=1700;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
		fg.ColWidth(11)=2000;
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=1500;
		fg.ColWidth(14)=1500;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(7)=1500;
		    fg.ColWidth(8)=1500;
		    fg.ColWidth(9)=1500;
		    fg.ColWidth(10)=1500;
		} else // Only Books
		{
			fg.ColWidth(7)= 0;
		    fg.ColWidth(8)= 0;
		    fg.ColWidth(9)=1500;
		    fg.ColWidth(10)=1500;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(6) = "#,###,###,###,###";
		    fg.ColFormat(9) = "#,###,###,###,###";
		    fg.ColFormat(10) = "#,###,###,###,###";
		    fg.ColFormat(11) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(6) = "#,###,###,###,###.##";
		    fg.ColFormat(9) = "#,###,###,###,###.##";
		    fg.ColFormat(10) = "#,###,###,###,###.##";
		    fg.ColFormat(11) = "#,###,###,###,###.##"; 
		}
		fg.ColFormat(7) = "#,###,###,###,###.##";
		fg.ColFormat(8) = "#,###,###,###,###.##";
		
		fg.ColAlignment(6) = flexAlignRightCenter;
		fg.ColAlignment(7) = flexAlignRightCenter;
		fg.ColAlignment(8) = flexAlignRightCenter;
		fg.ColAlignment(9) = flexAlignRightCenter;
		fg.ColAlignment(10) = flexAlignRightCenter;
		fg.ColAlignment(11) = flexAlignRightCenter;
		
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
		} else if (AmountType == '2') // Only Books
		{
			fg.ColWidth(2)=0;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=3000;
			fg.ColWidth(5)=3000;
		}
        else//trans
		{
			fg.ColWidth(4)=0;
			fg.ColWidth(5)=0;
			fg.ColWidth(2)=3000;
			fg.ColWidth(3)=3000;
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
            _Date.style.display="";
            grdSLByDate.ClearData();
            _Voucher.style.display="none";
            g_inquiry_type =10;
            FormatDateGrid();
      }
      if (rdoInquiryType.value=="2")//Report type is Voucher
      {
            _Date.style.display="none";
            _Voucher.style.display="";
            grdSLByVoucher.ClearData();
            g_inquiry_type =20;
            FormatVoucherGrid();
      }
      
      datSLSum.Call('SELECT');
      //grdSLByDate.
}

function onSearch1()
{  
       
      if (rdoInquiryType.value=="1")//Report type is Date
      {
            _Date.style.display="";
            grdSLByDate.ClearData();
            _Voucher.style.display="none";
            g_inquiry_type =10;
            FormatDateGrid();
      }
      if (rdoInquiryType.value=="2")//Report type is Voucher
      {
            _Date.style.display="none";
            _Voucher.style.display="";
            grdSLByVoucher.ClearData();
            g_inquiry_type =20;
            FormatVoucherGrid();
      }
      
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
            grdSLByVoucher.SetGridText(i,6,grdSLByVoucher.GetGridData(i-1,11));
        }
   } 
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
    tatus = grdSLByVoucher.GetGridData(ctrl.row, 7);
//    for (i = 1; i < grdSLByVoucher.rows; i++)
//    {
//        ls_arr = ls_arr + ' ' + grdSLByVoucher.GetGridData(i, 0);
//    } 

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/60/08/60080040_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "60080040" ;        
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function GetRowPK(row_index){
    if((row_index < grdSLByVoucher.rows) && (row_index > 0)){
        return grdSLByVoucher.GetGridData(row_index, 0);
    }
    return -1;
}


function OnReport(lang)
{
switch(lang)
    {
        case "VIE":
                    if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
               rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;
               
               //Nhat ky chi tien
               if (lstReportType.value=="S03a2-DN")
               {
                        //var s = new String(txtAccCode.text)
		                //if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		               // {
		                     //   var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN.aspx'+rqt;
                             //   System.OpenTargetPage( url , 'newform' );
                               // return;
								 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKchitien_DN_Viet.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		               // }
		              //  else
		               // {
		              //      alert("This is not payment acount code");
		               //    return; 
		             //   }
                        
               }
               //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                      /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		               var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;   */
								var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKthutien_DN_Viet.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return; 
								
               }
               //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                      /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    */  
					  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Soquy_DN_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                 /*        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   */ 
					var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoquyCTTM_DN_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 
               }
               
               //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                   /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt; gfka00020_T_SCTQT
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    */
					  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               
               //So cai
                if (lstReportType.value=="S01-DN")
               {
                     /*   var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		               */
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return; 
							//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Socai_DN_Viet.aspx'+rqt;
                            //System.OpenTargetPage( url , 'newform' );
                            //return;
							
               }
               //T so cai
                if (lstReportType.value=="TGL")
               {
                    /* var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		                
		            
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  */  
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSocai_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               
               //Daily SL
               
               if (lstReportType.value=="AS")
               {
                    var url ="";
                    if (lstBookCcy.value==lstCurrency.value)
                    {
                        url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL.aspx'+rqt;
                     }
                     else
                     {
                            url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL_CCY_VIE.aspx'+rqt;
                     }
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               
               
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                  /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return;  rpt_60080040_TKDUPSN_Viet
		                }  
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   */ 
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSN_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                  /*       var s = new String(txtAccCode.text)
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
		                }  */
		            var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSCo_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;     
               }
              //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                    /* var s = new String(txtAccCode.text)
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
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   */ 
					  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSN_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 
               }
               //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                   /*  var s = new String(txtAccCode.text)
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
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; */   
					   var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSNCo_Viet.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               
               if (lstReportType.value=="S08DN2")
               {
		            var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoguitienNH.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               if (lstReportType.value=="S38-DN") //Sổ chi tiết tài khoản
               {
		          //  var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN_VIE.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                  //  System.OpenTargetPage( url , 'newform' );
                  //  return;    
					   var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoChiTietTK_viet.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               if (lstReportType.value=="S38-DN2") //Sổ chi tiết tài khoản 2
               {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN2_VIE.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               if(lstReportType.value == 'S01-DN-CT')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_CostCenter.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;                    
			   }
			   if(lstReportType.value == 'S01-DN-BIZ-CC')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_BIZ-CC.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;                    
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
               
        //So cai
       if (lstReportType.value=="S01-DN")
       {
            var s = new String(txtAccCode.text)
           /* if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
                {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
                }
             else
                {
                    alert("This is not payment acount code");
                   return; 
                }     
    		   */
    	    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
            System.OpenTargetPage( url , 'newform' );
            return;
			
			//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Socai_DN_Eng.aspx'+rqt;
            //System.OpenTargetPage( url , 'newform' );
            //return;
			
       }
         //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return  */  
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKthutien_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return 
               }
			   //So cai Customer
	   if (lstReportType.value=="S01-DN-BUS")
       {
            var s = new String(txtAccCode.text)
           /* if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
                {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
                }
             else
                {
                    alert("This is not payment acount code");
                   return; 
                }     
    		  */ 
    	    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN-BUS_Eng.aspx'+rqt;
            System.OpenTargetPage( url , 'newform' );
            return;
       }
				//So quy tien mat BUS
                if (lstReportType.value=="S07-DN-BUS")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN-BUS_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
               //Nhat ky chi tien
               if (lstReportType.value=="S03a2-DN")
               {
                     /*   var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }
                   var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  */  
					var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKchitien_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;					
               }
                //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Soquy_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
                //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                   /*      var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoquyCTTM_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;*/ 
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               //T so cai
               if (lstReportType.value=="TGL")
               {
                   /* var s = new String (txtAccCode.text)
                      if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {   
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                        else
                        {
                            alert("This is not payment acount code");
		                   return; 
                        }
                        
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   */ 
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSocai_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
                //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  */   
					var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 
               }
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                   /* var s = new String(txtAccCode.text)
                     if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                    else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }*/
		           var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSN_Eng.aspx'+rqt;
                   System.OpenTargetPage( url , 'newform' );
                   return;           
               }
                //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                     /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  */  
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSCo_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 
               }
                //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                   /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code"); 
		                   return; 
		                } 
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  */   
					  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 
               }
                //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                   /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		               
		           var url =System.RootURL + '/standard/reports/gf/ka/rpt_60080040_TKDUTongPSNCo_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   */  
					var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSNCo_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return; 					
               }
                if (lstReportType.value=="S08DN2")
               {
		            var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoguitienNH.aspx'+rqt; //company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               
                //Daily SL
               
               if (lstReportType.value=="AS")
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
               }
               if(lstReportType.value == 'S01-DN-CT')
               {
                    //alert('test');
            		   /* var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_CostCenter.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;   */
							var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoCai_VND_center.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                           return; 							
								
			   }	               
    break;
 }
}
</script>
<body>
   <gw:data id="datSLSum" onreceive="OnDataReceive(this)" ">
        <xml>
            <dso type="grid"  function="ac_sel_60080040_daily_sl_sum">
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
   <gw:data id="datSLByDate" onreceive="OnDataReceive(this)" ">
        <xml>
            <dso type="grid"  function="ac_sel_60080040_daily_sl_date">
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
   
      <gw:data id="datSLByVoucher" onreceive="OnDataReceive(this)" ">
        <xml>
            <dso type="grid"  function="ac_sel_60080390_daily_sl_vc">
                <input bind="grdSLByVoucher">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                    <input bind="txtOpenBalance"/>
                    <input bind="txtVoucher_No"/>
                    <input bind="txtSeq"/>
                </input>
                <output bind="grdSLByVoucher"/>
            </dso>
        </xml>
    </gw:data>   

<gw:data id="dso_getCompany" onreceive="onSearch1();"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:2%">
        <td>
            <fieldset style="padding:0">
                <table border="0" cellpadding="1" cellspacing="1" width="100%">
                    <tr>
                        <td align="right" width="13%">Company</td>
                        <td  width="22%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                        <td width="12%" align="right" valign="middle"><a onclick="onGetAcc()" href="#" title="Get Account">Account Code</a></td>
                        <td width="32%" >
                            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                    <td width="30%"><gw:textbox id="txtAccCode" text="" maxlen = "6" styles='width:100%'/> </td>
                                    <td width="70%"><gw:textbox id="txtAccName" text="" maxlen = "100" styles='width:100%'/></td>
                                    <td width=""><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account" onclick="onResetAcc()" /></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" width="9%">Language</td>
                        <td  width="12%"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
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
                        <td width="">
                                <gw:radio id="rdoInquiryType"  value="1"> 
                                        <span value="1" > Dates</span>
                                        <span value="2" >Vouchers</span>
                                 </gw:radio >
                        </td>
                        
                        <td align="right">Currency</td>
                        <td><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
                        <td align="right">Slip Status</td>
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
                                        <span value="3" > Trans</span>
                                 </gw:radio >
                        </td>
                        <td align="right" width="">Voucher No</td>
                        <td colspan="">
                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td width="100%"><gw:textbox id="txtVoucher_No" onenterkey="onSearch()" styles='width:100%'/> </td>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                                </tr>
                            </table>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="right" width="">Report Option</td>
                        <td  width=""><gw:list id="lstRptOption" styles="width:100%;" ></gw:list></td>
                        <td align="right" >Report Type </td>
                        <td  ><gw:list id="lstReportType" styles="width:100%;" /></td>
                        <td align="right" width="">Seq</td>
                        <td  colspan="">
                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td width="100%"><gw:textbox id="txtSeq" onenterkey="onSearch()"  styles='width:100%'/> </td>
                                    <td><gw:button id="ibtnReport" img="excel"  text="Print" alt="Print Report" onclick="OnReport(lstLanguage.GetData())" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </fieldset>
          </td> 
       </tr>
      <tr id="_Date" style="height:40%">
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
        styles='width:100%; height:100%'
        />
        
        
            </td>
      </tr> 
      <tr id="_Voucher" style="height:40%">
            <td>
                    <gw:grid id='grdSLByVoucher'
        header='PK|VOUCHERNO|TR_DATE|USER_ID|CCY|Account Code|_OPENINGBALANCE|DEBITTRANSAMOUNT|CREDITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITBOOKAMOUNT|_CLOSINGBALANCE|CUSTOMER|REMARK|remark2|_tr_date_filter'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        aligns='1|0|1|1|1|0|2|2|2|2|2|2|0|0|0|0'
        defaults='|||||||||||||||'
        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='1000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        acceptNullDate="T"
		autosize="F"
        styles='width:100%; height:100%;'
        oncelldblclick ="RowClick()"
        />
            </td>
      </tr>
      <tr style="height:18%">
            <td>
           <gw:grid id='grdSLSum'
        header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|_OB'
        format='0|1|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2|2'
        defaults='|||||||'
        editcol='0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:100%;'
        />
            </td>
      </tr> 
</table>  
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAccPK" styles="display:none;"/> 
<gw:textbox id="txtOpenBalance" styles="display:none;" /> 
 <gw:textbox id="txtUser_Pk"  styles='display:none' />
</body>
</html>
