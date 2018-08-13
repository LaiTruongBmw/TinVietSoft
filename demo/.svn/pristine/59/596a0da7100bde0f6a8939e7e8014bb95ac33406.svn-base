<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>Advance For Employee Summary Inquiry</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var g_flag = 0;
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    System.Translate(document);
    txtAC_CD.SetEnable(false);
    txtAC_NM.SetEnable(false);
    txtEmp_ID.SetEnable(false);
    txtEmp_NM.SetEnable(false);
    BindingDataList();
    lstCcy.SetDataText("");
    txttab.SetDataText("0");
    rdoAMOUNT.value = "2";
    rdoSTATUS.value = "0";
   var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstBookCcy.SetDataText(ls_bookccy);  
   var myDate=new Date();
    var fDate =""+myDate.getFullYear();
    if (myDate.getMonth()<9)
    {
        fDate=fDate+"0"+(myDate.getMonth()+1);
    }
    else
    {
    fDate=fDate+(myDate.getMonth()+1);
    }
    fDate=fDate+"01";
    txtFROM_DATE.SetDataText(fDate);
 
    MergeHeaderEmployee();
    MergeHeaderBook();
    MergeHeaderSum();
    
     ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    
    txt_date.text   = ls_trsdate;
	
    txtUser_Pk.text = g_user_pk;
dso_getCompany.Call();
}
//---------------------------------------------------------------------------------------------------

function BindingDataList()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_report   = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK010' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    
    lstCompany.SetDataText(ls_comp);
    lstCcy.SetDataText(ls_ccy);
    lstReport.SetDataText(ls_report);
   
    
     var  data = "<%=CtlLib.SetDataSQL("select pk, AC_CD,  TRIM(REPLACE(REPLACE(TRIM(AC_NM), CHR(13), ''), CHR(10), '') )    FROM tac_abacctcode  WHERE ac_cd = ac_get_common_bycode('EACAB053','02') and del_if=0 and USE_YN='Y'")%>";
    var arr  = data.split("|");
     txtAC_PK.SetDataText(arr[0]);
     txtAC_CD.SetDataText(arr[1]);
     txtAC_NM.SetDataText(arr[2]);
 
}
//--------------------------------------------------------------------------------------------------
function onSetDataList()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        txttab.SetDataText('0');
        OnSearch();
        
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        txttab.SetDataText('1');
        OnSearch();
       // datMonthlyBook.Call("SELECT");
    }
    
}
//---------------------------------------------------------------------------------------------------
function MergeHeaderEmployee()
{
		var fg=grdEmployee.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdEmployee.AddRow();     
		}
		fg.FrozenCols = 6;
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
		
		fg.MergeCells = 5;
		fg.MergeCol(0) = true;//TCO_EMPLOYEE_PK
		fg.MergeCol(1) = true;//TAC_ABACCTCODE_PK
		fg.Cell(0, 0, 2, 0, 3) = "Employee";
        fg.Cell(0, 1, 2, 1, 2) = "ID";
        fg.Cell(0, 1, 3, 1, 3) = "Name";
        fg.MergeCol(4) = true;//ACCD
        fg.Cell(0, 0, 4, 1, 4) = "Acc. Code";
        fg.MergeCol(5) = true;//
        fg.Cell(0, 0, 5, 1, 5) = "Ccy";
        
        fg.Cell(0, 0, 6, 0, 7) = "Opening Balance";
        fg.Cell(0, 1, 6, 1, 6) = "Debit";
        fg.Cell(0, 1, 7, 1, 7) = "Credit";
        
        fg.Cell(0, 0, 8, 0, 9) = "Transaction";
        fg.Cell(0, 1, 8, 1, 8) = "Debit";
        fg.Cell(0, 1, 9, 1, 9) = "Credit";
        
        fg.Cell(0, 0, 10, 0, 11) = "Book";
        fg.Cell(0, 1, 10, 1, 10) = "Debit";
        fg.Cell(0, 1, 11, 1, 11) = "Credit";
        
        fg.Cell(0, 0, 12, 0, 13) = "Closing Balance";
        fg.Cell(0, 1, 12, 1, 12) = "Debit";
        fg.Cell(0, 1, 13, 1, 13) = "Credit";

		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0) =0;
		fg.ColWidth(1) =0;
		fg.ColWidth(2) =1000;
		fg.ColWidth(3) =3000;
		fg.ColWidth(4) =0;
		fg.ColWidth(5) =500;//CCY
		
		fg.ColWidth(6)=1700;
		fg.ColWidth(7)=1700;
		fg.ColWidth(8)=1700;
		fg.ColWidth(9)=1700;
		fg.ColWidth(10)=1700;
		fg.ColWidth(11)=1700;
		fg.ColWidth(12)=1700;
		fg.ColWidth(13)=1700;
		
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')
		{   
			fg.ColWidth(10)=0;
			fg.ColWidth(11)=0;
		}
		else
		{
		    fg.ColWidth(10)=1700;
			fg.ColWidth(11)=1700;
		}
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###R";
        }
        else
        {
            //Book
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
        }
        
        fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
        System.Translate(document);
}


//---------------------------------------------------------------------------------------------------
function MergeHeaderBook()
{
		var fg=grdBook.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdBook.AddRow();     
		}
		fg.FrozenCols = 6;
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
		
		fg.MergeCells = 5;
		fg.MergeCol(0) = true;//TCO_EMPLOYEE_PK
		fg.MergeCol(1) = true;//TAC_ABACCTCODE_PK
		fg.Cell(0, 0, 2, 0, 3) = "Employee";
        fg.Cell(0, 1, 2, 1, 2) = "ID";
        fg.Cell(0, 1, 3, 1, 3) = "Name";
        fg.MergeCol(4) = true;//ACCD
        fg.Cell(0, 0, 4, 1, 4) = "Acc. Code";
        fg.MergeCol(5) = true;//
        fg.Cell(0, 0, 5, 1, 5) = "Ccy";
        
        fg.Cell(0, 0, 6, 0, 7) = "Opening Balance";
        fg.Cell(0, 1, 6, 1, 6) = "Debit";
        fg.Cell(0, 1, 7, 1, 7) = "Credit";
        
        fg.Cell(0, 0, 8, 0, 9) = "Booking";
        fg.Cell(0, 1, 8, 1, 8) = "Debit";
        fg.Cell(0, 1, 9, 1, 9) = "Credit";
        
        fg.Cell(0, 0, 10, 0, 11) = "Book";
        fg.Cell(0, 1, 10, 1, 10) = "Debit";
        fg.Cell(0, 1, 11, 1, 11) = "Credit";
        
        fg.Cell(0, 0, 12, 0, 13) = "Closing Balance";
        fg.Cell(0, 1, 12, 1, 12) = "Debit";
        fg.Cell(0, 1, 13, 1, 13) = "Credit";

		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0) =0;
		fg.ColWidth(1) =0;
		fg.ColWidth(2) =1000;
		fg.ColWidth(3) =3000;
		fg.ColWidth(4) =0;
		fg.ColWidth(5) =500;//CCY
		
		fg.ColWidth(6)=1700;
		fg.ColWidth(7)=1700;
		fg.ColWidth(8)=1700;
		fg.ColWidth(9)=1700;
		fg.ColWidth(10)=1700;
		fg.ColWidth(11)=1700;
		fg.ColWidth(12)=1700;
		fg.ColWidth(13)=1700;
		
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')
		{   
			fg.ColWidth(10)=0;
			fg.ColWidth(11)=0;
		}
		else
		{
		    fg.ColWidth(10)=1700;
			fg.ColWidth(11)=1700;
		}
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###R";
        }
        else
        {
            //Book
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
        }
        
        fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
        System.Translate(document);
}

//--------------------------------------------------------------------------------------------------------

function MergeHeaderSum()
{
		var fg=grdSum.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSum.AddRow();     
		}
		fg.FrozenCols = 1;
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

        fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "CCY";
        fg.Cell(0, 0, 1, 0, 2) = "Opening Balance";
        fg.Cell(0, 1, 1, 1, 1) = "Debit";
        fg.Cell(0, 1, 2, 1, 2) = "Credit";
        
        fg.Cell(0, 0, 3, 0, 4) = "Arising Amount";
        fg.Cell(0, 1, 3, 1, 3) = "Debit";
        fg.Cell(0, 1, 4, 1, 4) = "Credit";
        
        fg.Cell(0, 0, 5, 0, 6) = "Books";
        fg.Cell(0, 1, 5, 1, 5) = "Debit";
        fg.Cell(0, 1, 6, 1, 6) = "Credit";
        
        fg.Cell(0, 0, 7, 0, 8) = "Closing Balance";
        fg.Cell(0, 1, 7, 1, 7) = "Debit";
        fg.Cell(0, 1, 8, 1, 8) = "Credit";
        
		fg.ColWidth(0)=1000;
		fg.ColWidth(1)=2300;
		fg.ColWidth(2)=2300;
		fg.ColWidth(3)=2300;
		fg.ColWidth(4)=2300;
		fg.ColWidth(5)=2300;
		fg.ColWidth(6)=2300;
		fg.ColWidth(7)=2300;
		fg.ColWidth(8)=2300;
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')
		{   
			fg.ColWidth(5)=0;
			fg.ColWidth(6)=0;
		}
		else
		{
			fg.ColWidth(5)=2300;
			fg.ColWidth(6)=2300;
		}
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(5) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###R";
        }
        else
        {
            //Book
            fg.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###.##R";
        }
        fg.ColFormat(1) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(2) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(3) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(4) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R";
        System.Translate(document);
}
//---------------------------------------------------------------------------------------------------
	
function OnChangeAmountType()
{
	MergeHeaderEmployee();
	MergeHeaderSum();
}
//---------------------------------------------------------------------------------------------------

function GetAccount()
{
   var fpath = System.RootURL + "/standard/forms/60/08/60080100_popup_1.aspx?col_nm=Account Name&col_code=Account Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=ac_SEL_60080100_popup_ACC";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtAC_PK.SetDataText("");
        txtAC_CD.SetDataText("");
        txtAC_NM.SetDataText("");
        txtAC_PK.SetDataText(object[2]);
        txtAC_CD.SetDataText(object[0]);
        txtAC_NM.SetDataText(object[1]);

    }
}
//---------------------------------------------------------------------------------------------------

function resetAcc(ind)
{
    txtAC_PK.SetDataText("");
    txtAC_CD.SetDataText("");
    txtAC_NM.SetDataText("");
   
}
//---------------------------------------------------------------------------------------------------

function onGetEmployee()
{
    //var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
    var fpath = System.RootURL + "/standard/forms/60/08/60080100_popup_2.aspx?company_pk=" + lstCompany.value;
	var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	if ((aValue != null)&&(aValue[0]!=""))
	{
	    txtEmp_PK.text = aValue[0];
	    txtEmp_ID.text = aValue[1];
	    txtEmp_NM.text = aValue[2];
	}
}
//---------------------------------------------------------------------------------------------------

function onResetEmployee()
{
    txtEmp_PK.text = "";
    txtEmp_ID.text = "";
    txtEmp_NM.text = "";
}
//---------------------------------------------------------------------------------------------------


function OnSearch()
{
    if (txtAC_PK.text=="") 
    {
        alert("Please select an Account Code!");
        return;
    }
    switch(idTab_Child.GetCurrentPageNo())
    {
        case 0:
             datMonthlyEmp.Call("SELECT");
        break;
        case 1:
             datMonthlyBook.Call("SELECT");
        break;
        
    }
//    if(txtAC_PK.text =="")
//    {
//        alert("Please select account");
//        return;
//    }
     
//    datSLSum.Call("SELECT");
//    g_flag = 1;
//var l_tab = txttab.GetData();
// if(l_tab == '0')
 
//    {
//       datMonthlyEmp.Call("SELECT");
//    }
}
//---------------------------------------------------------------------------------------------------


function loadDateOpeningBalance()
{
	var i,liRow;
	var llData;
	liRow = grdEmployee.rows
	for(i=3;i<liRow;i++)
	{
		grdEmployee.SetGridText(i,2,grdEmployee.GetGridData(i-1,8));
	}
}

//---------------------------------------------------------------------------------------------------

function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
       
        case "datMonthlyEmp":
            MergeHeaderEmployee();
            
            if(txtAC_PK.text=="")
                {
                    grdEmployee.GetGridControl().ColWidth(4) =800;
                }
            else
                {
                    grdEmployee.GetGridControl().ColWidth(4) =0;
                }
            //if(g_flag == 1)
//            {
//                datMonthlyBook.Call("SELECT");
//                g_flag = 0;
//            }
          
            datSLSum.Call("SELECT");
            
            
        break;
        case "datMonthlyBook":
            MergeHeaderBook();
            if(txtAC_PK.text=="")
            {
                grdBook.GetGridControl().ColWidth(4) =800;
            }
            else
            {
                grdBook.GetGridControl().ColWidth(4) =0;
            }
//            if(g_flag == 1)
//            {
//                datMonthlyEmp.Call("SELECT");
//                g_flag = 0;
//            }   
               datSLSum.Call("SELECT");  
               
        break;
        case "datSLSum":
            MergeHeaderSum();
             
//            datMonthlyEmp.Call("SELECT");
        break;
        case "datCurrent":
            if(idTab_Child.GetCurrentPageNo()=="1")
            {
                datMonthlyBook.Call("SELECT");
            }
        break;
	case "dso_getCompany":
            onSetDataList();
        break;
    }
}
//---------------------------------------------------------------------------------------------------

function OnReport()
{

     if (txtAC_PK.text=="") 
    {
        alert("Please select an Account Code!");
        return;
    }
    var l_tab = idTab_Child.GetCurrentPageNo() ;
    switch(l_tab)
    {
        case 0:
            
             var url ='/standard/reports/gf/ka/gfka00150_tonghop_1.aspx?company_pk='+lstCompany.value+'&emp_pk='+ txtEmp_PK.GetData() + '&from_date='+txtFROM_DATE.value+'&to_date='+txtTO_DATE.value+'&status='+rdoSTATUS.value+'&acc_pk='+txtAC_PK.text+'&Trans=TRANS&BookCCy='+lstBookCcy.value;
                    System.OpenTargetPage( System.RootURL+url , 'newform' );
        break;
        case 1:
             var url ='/standard/reports/gf/ka/gfka00150_tonghop.aspx?company_pk='+lstCompany.value+'&from_date='+txtFROM_DATE.value+ '&to_date='+txtTO_DATE.value+ '&acc_pk='+txtAC_PK.text+ '&emp_pk=' + '&status='+rdoSTATUS.value+ '&Tab='+l_tab +'&Trans ='+lstBookCcy.value;
           System.OpenTargetPage( System.RootURL+url , 'newform' );
         break;  
    }
}
//---------------------------------------------------------------------------------------------------
function OnChangeCurrent()
{
    dso_get_rate.Call();
}
//---------------------------------------------------------------------------------------------------

function OnShowDetail()
{
    var ctrl = grdEmployee.GetGridControl();
    if (ctrl.row >1)
    {
        var emp_pk     = grdEmployee.GetGridData(ctrl.row,0);
        var emp_id     = grdEmployee.GetGridData(ctrl.row,2);
        var emp_nm     = grdEmployee.GetGridData(ctrl.row,3);
        var status      = rdoSTATUS.value;
        var ccy         = grdEmployee.GetGridData(ctrl.row,5);
        
        var fpath = System.RootURL + '/standard/forms/60/08/60080100_popup_3.aspx?comp_pk=' + lstCompany.value + '&from_date=' + txtFROM_DATE.value + '&to_date=' + txtTO_DATE.value + "&acc_pk=" + txtAC_PK.text + '&acc_cd=' + txtAC_CD.text +'&acc_nm=' + txtAC_NM.text + "&emp_pk=" + emp_pk + "&emp_id=" + emp_id + "&emp_nm=" + emp_nm + "&status=" + rdoSTATUS.value + "&ccy=" + ccy ;
        //alert(fpath);
        var wWidth = 1000;
        var wHeight = 500;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
    
}

</script>
<body style="margin:0; padding:0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
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

<gw:data id="datMonthlyEmp" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080100_mon_emp_bal">
                <input bind="grdEmployee">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtEmp_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>
                    <input bind="txttab"/>
                </input>
                <output bind="grdEmployee"/>
            </dso>
        </xml>
    </gw:data>
<!---------------------------------------------------------------------------------------------------->
<gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCcy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                    <output bind="txtrate"/> 
                    <output bind="txt_row"/> 
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------------------->
<gw:data id="datMonthlyBook" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080100_mon_emp_bal">
                <input bind="grdBook">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtEmp_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>
                    <input bind="txttab"/>
                </input>
                <output bind="grdBook"/>
            </dso>
        </xml>
    </gw:data>
<!--------------------------------------------------------------------------------------------------->
    
    <gw:data id="datSLSum" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080100_mon_bal_sum">
                  <input bind="grdSum">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtEmp_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>
                    <input bind="txttab"/>
                </input>
                <output bind="grdSum"/>
                <output bind="txtrate"/>
            </dso>
        </xml>
    </gw:data>
 <!--------------------------------------------------------------------------------------------------->
   
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
    <tr height='2%'>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="2%"></td>
                    <td width="8%"></td>
                    
                    <td width="11%"></td>
                    <td width="15%"></td>
                    <td width="10%"></td>
                    <td width="19%"></td>
                    <td width="7%"></td>
                    <td width="10%"></td>
                </tr>  
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCompany" styles='width:100%'/></td>
                    <td align="right"><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account code</a></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:30%;' csstype="mandatory"/>
                                                <gw:textbox id="txtAC_NM" styles='width:70%;' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right">Currency</td>
                    <td><gw:list id="lstCcy" onchange="OnChangeCurrent()" styles='width:100%'/></td>
                </tr> 
                <tr>
                    <td align="right">Proposed Date</td>
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><a title="Click here to show customer" onclick="onGetEmployee()" href="#tips" >Employee Name&nbsp;</a></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtEmp_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtEmp_ID" styles='width:30%;'csstype="mandatory"/>
                                                <gw:textbox id="txtEmp_NM" styles='width:70%;' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="onResetEmployee()" /></td>
                            </tr>
                        </table>
                    </td>
                   <td align="right"></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="right">Slip Status</td>
                    <td colspan="3"><gw:radio id="rdoSTATUS" value="0" onchange="OnSearch()" >
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>
                                    </gw:radio ></td>
                    <td align="right">Report</td>
                    <td colspan="2">
                        <gw:list id="lstReport" styles='width:100%'/>
                    </td>
                    <td></td>
                    <td align="left" style="display:inline;">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="OnSearch()" /></td>
                                   <td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"    onclick="OnReport()" /></td> 
                                </tr>
                            </table>
                    </td>
                    <td align="left"></td>
                </tr> 
            </table>
        </td>
    </tr>
    <tr height='80%'>
        <td width="100%">
        <gw:tab id="idTab_Child" onpageactivate="onSetDataList()">
	        <table name="Transaction" style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					
					<gw:grid id='grdEmployee'
                        header='VHR_EMP_PK|TAC_ABACCTCODE_PK|EMP_ID|FULL_NAME|ACCD|CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                        format='0|0|0|0|0|0|1|1|1|1|1|1|1|1'
                        aligns='0|0|0|0|0|0|3|3|3|3|3|3|3|3'
                        defaults='|||||||||||||'
                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths='0|0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                        sorting='F'
                        oncelldblclick ="OnShowDetail()"
                        styles='width:100%; height:100%'
                    />

					</td>
				</tr>
			</table>
			
			 <table name="Booking" style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					
					<gw:grid id='grdBook'
                        header='VHR_EMP_PK|TAC_ABACCTCODE_PK|EMP_ID|FULL_NAME|ACCD|CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                        format='0|0|0|0|0|0|1|1|1|1|1|1|1|1'
                        aligns='0|0|0|0|0|0|3|3|3|3|3|3|3|3'
                        defaults='|||||||||||||'
                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths='0|0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                        sorting='F'
                        oncelldblclick ="OnShowDetail()"
                        styles='width:100%; height:100%'
                    />

					</td>
				</tr>
			</table>
			
			
			</gw:tab>
        </td>
        
        
       
        
        
    </tr>
    <tr height='18%'>
		<td width="100%">
		
		    <gw:grid id='grdSum'
                header='CCY|OPEN_FBALD|OPEN_FBALC|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|CLOSE_FBALD|CLOSE_FBALC'
                format='0|1|1|1|1|1|1|1|1'
                aligns='0|3|3|3|3|3|3|3|3'
                defaults='||||||||'
                editcol='0|0|0|0|0|0|0|0|1'
                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000'
                 sorting='F'
                styles='width:100%; height:100%'
                />
		</td>
	</tr>
</table>
<!--------------------------------------------------------------------------------------------------->

<gw:textbox id="txtrate" styles="display:none;" ></gw:textbox>

<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txt_date" style="display: none" />
<gw:textbox id="txt_row" style="display: none" />
<gw:textbox id="txtSUM"   style="display:none"/>
<gw:textbox id="txttab"  style="display:none" />
  <gw:radio id="rdoAMOUNT" value="2" onchange="OnChangeAmountType()"  style="display:none;">
                                    <span value="1">Trans & Book&nbsp;</span>
                                    <span value="2">Trans</span>
                                    </gw:radio >
<!---------------------------------------------------------------------------------------------------->
<gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
</body>
</html>