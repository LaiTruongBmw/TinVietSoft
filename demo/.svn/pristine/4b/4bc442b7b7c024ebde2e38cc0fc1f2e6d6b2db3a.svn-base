<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">


var click_dr = 0;
var click_cr = 0;
var _book_rate = 0;
var _Book_CCY = "VND";
var _book_col_format = "###,###.##R";
var AdminYN;
var flag_select = false;
//alert(txtProposedByUserPk.text);
AdminYN ="<%=Session("CODEADMIN_YN")%>";
var lang = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
   System.Translate(document);
   BindingData();
   ShowHideControl();
   OnUpdateBookRate();
   txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   //alert(txtProposedByUserPk.text);
}
function OnchangeLstType()
{
    ShowHideControl();
}
function BindingData()
{
     var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
     lstCompany.SetDataText(ls_data);
     lstCompanySearch.SetDataText(ls_data);
     var ls_data1    = "<%=CtlLib.SetListDataSQL("SELECT A.PK, A.org_NM FROM TCO_org A WHERE (A.END_DATE >= '20080101' OR A.END_DATE IS NULL)")%>";
     lstDept.SetDataText(ls_data1);
     var ls_data2    = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
     lstVoucherTypeSearch.SetDataText(ls_data2);
     lstType.SetDataText(ls_data2);
     var dataStatus = "Data|0|Save|1|Approved|2|Confirmed|3|Cancel";
     lstStatusSearch.SetDataText(dataStatus);
     lstStatus.SetDataText(dataStatus);
     var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
	dtFr.SetDataText(ls_date_fr);
	dtTo.SetDataText(ls_date_to);
	//dtDateTypeChange.SetDataText(ls_date_fr);
	//dtDate1.SetDataText(ls_date_fr);
	//table3.style.width="0%";
	//alert(dtFr.value);
	txtLang.SetDataText(lang);
}   
//---------------------------------------------------------------------  
function ShowHideControl()
{
    var x=document.getElementById("tr1");
    var y=document.getElementById("tr2");
    var z=document.getElementById("tr3");
    //table4.style.display=
   if(lstType.value == "RV" || lstType.value == "BN" || lstType.value == "BC" || lstType.value == "PV" ){
        x.style.display = "";
        y.style.display = "";
        z.style.display = "";
        if(lstType.value == "RV")
        {
            lblRecord_D.text="Receipt";
        }
        else if(lstType.value == "BN")
        {
            lblRecord_D.text="Pay(Bank)";
        }
        else if(lstType.value == "BC")
        {
            lblRecord_D.text="Recv(Bank)";
        }
        else if(lstType.value == "PV")
        {
            lblRecord_D.text="Pay(Cash)";
        }
    }
    else
    {
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "none";
    }
}
function OnToggle(index)
{
    switch(index)
    {
        case 0:
          var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

             if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../system/images/left1.gif";
            }
            else{
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../system/images/right1.gif";
            }
        break;
        case 1:
            var Debit  = document.all("Debit");    
            var idGridItem = document.all("idGridItem");   
            var img_idGridItem = document.all("img_idGridItem");   
          if(img_idGridItem.status == "expand"){
                idGridItem.style.display="none";
                img_idGridItem.status = "collapse";
                Debit.style.height="100%";
                img_idGridItem.src = "../../../system/images/up.gif";
            }
            else if(img_idGridItem.status == "collapse"){
                img_idGridItem.status = "expand";
                Debit.style.height="50%";
                idGridItem.style.display="";
                img_idGridItem.src = "../../../system/images/down.gif";
            }
        break; 
        case 2:
            var Credit  = document.all("Credit");    
            var Credit_ctr2 = document.all("Credit_ctrl");   
            var img_Credit_ctrl1 = document.all("img_Credit_ctrl");   
            
             if(img_Credit_ctrl1.status == "expand"){
                Credit_ctr2.style.display="none";
                img_Credit_ctrl1.status = "collapse";
                Credit.style.height="100%";
                img_Credit_ctrl1.src = "../../../system/images/up.gif";
            }
            else if(img_Credit_ctrl1.status == "collapse"){
                img_Credit_ctrl1.status = "expand";
                Credit.style.height="50%";
                 Credit_ctr2.style.display="";
                img_Credit_ctrl1.src = "../../../system/images/down.gif";
            }
        break;   
    }
}
//
function OnSearch()
{
    dso_Search.Call("SELECT");
}
function GridOnCellClick()
{
    if ( grid_search.row > 0 )
    {
       
        txtseq.text = grid_search.GetGridData( grid_search.row,0);
       // gSave = false;
        dso_SlipEntryV1.Call("SELECT");
        grdDebit1.SetData("");
       // grdCredit3.SetData("");
    }
}
function OnPopUp()
{
    var path = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
    var object = System.OpenModal( path ,800 , 630 , 'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtCustomerPK.text = object[0];
            txtCustomerCD.text = object[1];
            txtCustomerNM.text = object[2];
        }
    }
}
/*function OnTransactionPopUp()
{
    var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.GetData();
        aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
        if ( aValue != null )
	    {
		    var tmp = aValue[0];
		    if (tmp[1] != null)
		    {
		        txtTrTypePK.text = tmp[0];
		        txtTrTypeCD.text = tmp[1];
		        txtTrTypeNM.text = tmp[2];
		        txtDesc.text = tmp[3];
                txtLDesc.text = tmp[4];
		    }
	    }
}*/
function OnAutoYN()
{
    if (chkauto_YN.GetData() != 'T')
    {
        txtvoucher_auto.SetEnable(true);
        txtvoucher_auto.SetDataText('');
    }
    else
    {
        txtvoucher_auto.SetEnable(false);
    }
}
function SetButtonEnable()
{
    if (lstStatus.GetData() == 1) // Save
    {
        btnConfirm.SetEnable(true);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        SetButtonCtl(true);
    }
    else if (lstStatus.GetData() == 2) // Comfirm
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(true);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        SetButtonCtl(false);
    }
    else if (lstStatus.GetData() == 3) // Cancel
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(true);
        btnCopy.SetEnable(false);
        SetButtonCtl(false);
    }
    else if (lstStatus.GetData() == '') // New
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        SetButtonCtl(true);
    }
    else if (lstStatus.GetData() == 0) // Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        SetButtonCtl(false);
    }
    else if (lstStatus.GetData() == 4) // No Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        SetButtonCtl(false);
    }
}
function SetDataToGriDebitItem()
{
    var col1="",col2="",col3="",col4="",col5="",col6="",col7="",col8="",col9="",
        col10="",col11="",col12="",col13="",col14="",col15="",col16="",col17="",col18="",col19="";
    var col1_2="",col2_2="",col3_2="",col4_2="",col5_2="",col6_2="",col7_2="",col8_2="",col9_2="",
        col10_2="",col11_2="",col12_2="",col13_2="",col14_2="",col15_2="",col16_2="",col17_2="",col18_2="",col19_2="";
            
         col1=grdDebitTMP.GetGridData(1, 1);
         col2=grdDebitTMP.GetGridData(2, 1);
         col3=grdDebitTMP.GetGridData(3, 1);
         col4=grdDebitTMP.GetGridData(4, 1);
         col5=grdDebitTMP.GetGridData(5, 1);
         col6=grdDebitTMP.GetGridData(6, 1);
         col7=grdDebitTMP.GetGridData(7, 1);
         col8=grdDebitTMP.GetGridData(8, 1);
         col9=grdDebitTMP.GetGridData(9, 1);
         col10=grdDebitTMP.GetGridData(10, 1);
         col11=grdDebitTMP.GetGridData(11, 1);
         col12=grdDebitTMP.GetGridData(12, 1);
         col13=grdDebitTMP.GetGridData(13, 1);
         col14=grdDebitTMP.GetGridData(14, 1);
         col15=grdDebitTMP.GetGridData(15, 1);
         col16=grdDebitTMP.GetGridData(16, 1);
         col17=grdDebitTMP.GetGridData(17, 1);
         col18=grdDebitTMP.GetGridData(18, 1);
         col19=grdDebitTMP.GetGridData(19, 1);
         
         col1_2=grdDebitTMP.GetGridData(1, 2);
         col2_2=grdDebitTMP.GetGridData(2, 2);
         col3_2=grdDebitTMP.GetGridData(3, 2);
         col4_2=grdDebitTMP.GetGridData(4, 2);
         col5_2=grdDebitTMP.GetGridData(5, 2);
         col6_2=grdDebitTMP.GetGridData(6, 2);
         col7_2=grdDebitTMP.GetGridData(7, 2);
         col8_2=grdDebitTMP.GetGridData(8, 2);
         col9_2=grdDebitTMP.GetGridData(9, 2);
         col10_2=grdDebitTMP.GetGridData(10, 2);
         col11_2=grdDebitTMP.GetGridData(11, 2);
         col12_2=grdDebitTMP.GetGridData(12, 2);
         col13_2=grdDebitTMP.GetGridData(13, 2);
         col14_2=grdDebitTMP.GetGridData(14, 2);
         col15_2=grdDebitTMP.GetGridData(15, 2);
         col16_2=grdDebitTMP.GetGridData(16, 2);
         col17_2=grdDebitTMP.GetGridData(17, 2);
         col18_2=grdDebitTMP.GetGridData(18, 2);
         col19_2=grdDebitTMP.GetGridData(19, 2);
         
            if(col1=="")
            {
                grdDebit1.GetGridControl().ColHidden(1) = true;
            }
            else
            {
                grdDebit1.AddRow();
                grdDebit1.SetGridText(0, 1,col1);
                //alert(col1_2);
                grdDebit1.SetGridText(1, 1,col1_2);
            }
            if(col2=="")
            {
                grdDebit1.GetGridControl().ColHidden(2) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 2,col2);
                grdDebit1.SetGridText(1, 2,col2_2);
            }
            if(col3=="")
            {
                grdDebit1.GetGridControl().ColHidden(3) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 3,col3);
                grdDebit1.SetGridText(1, 3,col3_2);
            }
            if(col4=="")
            {
                grdDebit1.GetGridControl().ColHidden(4) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 4,grdDebitTMP.GetGridData(4, 1));
                grdDebit1.SetGridText(1, 4,grdDebitTMP.GetGridData(4, 2));
                
            }
            if(col5=="")
            {
                grdDebit1.GetGridControl().ColHidden(5) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 5,grdDebitTMP.GetGridData(5, 1));
                grdDebit1.SetGridText(1, 5,grdDebitTMP.GetGridData(5, 2));
            }
            if(col6=="")
            {
                grdDebit1.GetGridControl().ColHidden(6) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 6,grdDebitTMP.GetGridData(6, 1));
                grdDebit1.SetGridText(1, 6,grdDebitTMP.GetGridData(6, 2));
            }
            if(col7=="")
            {
                grdDebit1.GetGridControl().ColHidden(7) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 7,grdDebitTMP.GetGridData(7, 1));
                grdDebit1.SetGridText(1, 7,grdDebitTMP.GetGridData(7, 2));
            }
            if(col8=="")
            {
                grdDebit1.GetGridControl().ColHidden(8) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 8,grdDebitTMP.GetGridData(8, 1));
                grdDebit1.SetGridText(1, 8,grdDebitTMP.GetGridData(8, 2));
            }
            if(col9=="")
            {
                grdDebit1.GetGridControl().ColHidden(9) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 9,grdDebitTMP.GetGridData(9, 1));
                grdDebit1.SetGridText(1, 9,grdDebitTMP.GetGridData(9, 2));
            }
            if(col10=="")
            {
                grdDebit1.GetGridControl().ColHidden(10) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 10,grdDebitTMP.GetGridData(10, 1));
                grdDebit1.SetGridText(1, 10,grdDebitTMP.GetGridData(10, 2));
            }
            if(col11=="")
            {
                grdDebit1.GetGridControl().ColHidden(11) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 11,grdDebitTMP.GetGridData(11, 1));
                grdDebit1.SetGridText(1, 11,grdDebitTMP.GetGridData(11, 2));
            }
            if(col12=="")
            {
                grdDebit1.GetGridControl().ColHidden(12) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 12,grdDebitTMP.GetGridData(12, 1));
                grdDebit1.SetGridText(1, 12,grdDebitTMP.GetGridData(12, 2));
            }
            if(col13=="")
            {
                grdDebit1.GetGridControl().ColHidden(13) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 13,grdDebitTMP.GetGridData(13, 1));
                grdDebit1.SetGridText(1, 13,grdDebitTMP.GetGridData(13, 2));
            }
            if(col14=="")
            {
                grdDebit1.GetGridControl().ColHidden(14) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 14,grdDebitTMP.GetGridData(14, 1));
                grdDebit1.SetGridText(1, 14,grdDebitTMP.GetGridData(14, 2));
            }
            if(col15=="")
            {
                grdDebit1.GetGridControl().ColHidden(15) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 15,grdDebitTMP.GetGridData(15, 1));
                grdDebit1.SetGridText(1, 15,grdDebitTMP.GetGridData(15, 2));
            }
            if(col16=="")
            {
                grdDebit1.GetGridControl().ColHidden(16) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 16,grdDebitTMP.GetGridData(16, 1));
                grdDebit1.SetGridText(1, 16,grdDebitTMP.GetGridData(16, 2));
            }
            if(col17=="")
            {
                grdDebit1.GetGridControl().ColHidden(17) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 17,grdDebitTMP.GetGridData(17, 1));
                grdDebit1.SetGridText(1, 17,grdDebitTMP.GetGridData(17, 2));
            }
            if(col18=="")
            {
                grdDebit1.GetGridControl().ColHidden(18) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 18,grdDebitTMP.GetGridData(18, 1));
                grdDebit1.SetGridText(1, 18,grdDebitTMP.GetGridData(18, 2));
            }
            if(col19=="")
            {
                grdDebit1.GetGridControl().ColHidden(19) = true;
            }
            else
            {
                grdDebit1.SetGridText(0, 19,grdDebitTMP.GetGridData(19, 1));
                grdDebit1.SetGridText(1, 19,grdDebitTMP.GetGridData(19, 2));
            }
}
function SetDataToGriCreditItem()
{
    var col1="",col2="",col3="",col4="",col5="",col6="",col7="",col8="",col9="",
        col10="",col11="",col12="",col13="",col14="",col15="",col16="",col17="",col18="",col19="";
    var col1_2="",col2_2="",col3_2="",col4_2="",col5_2="",col6_2="",col7_2="",col8_2="",col9_2="",
        col10_2="",col11_2="",col12_2="",col13_2="",col14_2="",col15_2="",col16_2="",col17_2="",col18_2="",col19_2="";
            
         col1=grdCreditTMP.GetGridData(1, 1);
         col2=grdCreditTMP.GetGridData(2, 1);
         col3=grdCreditTMP.GetGridData(3, 1);
         col4=grdCreditTMP.GetGridData(4, 1);
         col5=grdCreditTMP.GetGridData(5, 1);
         col6=grdCreditTMP.GetGridData(6, 1);
         col7=grdCreditTMP.GetGridData(7, 1);
         col8=grdCreditTMP.GetGridData(8, 1);
         col9=grdCreditTMP.GetGridData(9, 1);
         col10=grdCreditTMP.GetGridData(10, 1);
         col11=grdCreditTMP.GetGridData(11, 1);
         col12=grdCreditTMP.GetGridData(12, 1);
         col13=grdCreditTMP.GetGridData(13, 1);
         col14=grdCreditTMP.GetGridData(14, 1);
         col15=grdCreditTMP.GetGridData(15, 1);
         col16=grdCreditTMP.GetGridData(16, 1);
         col17=grdCreditTMP.GetGridData(17, 1);
         col18=grdCreditTMP.GetGridData(18, 1);
         col19=grdCreditTMP.GetGridData(19, 1);
         
         col1_2=grdCreditTMP.GetGridData(1, 2);
         col2_2=grdCreditTMP.GetGridData(2, 2);
         col3_2=grdCreditTMP.GetGridData(3, 2);
         col4_2=grdCreditTMP.GetGridData(4, 2);
         col5_2=grdCreditTMP.GetGridData(5, 2);
         col6_2=grdCreditTMP.GetGridData(6, 2);
         col7_2=grdCreditTMP.GetGridData(7, 2);
         col8_2=grdCreditTMP.GetGridData(8, 2);
         col9_2=grdCreditTMP.GetGridData(9, 2);
         col10_2=grdCreditTMP.GetGridData(10, 2);
         col11_2=grdCreditTMP.GetGridData(11, 2);
         col12_2=grdCreditTMP.GetGridData(12, 2);
         col13_2=grdCreditTMP.GetGridData(13, 2);
         col14_2=grdCreditTMP.GetGridData(14, 2);
         col15_2=grdCreditTMP.GetGridData(15, 2);
         col16_2=grdCreditTMP.GetGridData(16, 2);
         col17_2=grdCreditTMP.GetGridData(17, 2);
         col18_2=grdCreditTMP.GetGridData(18, 2);
         col19_2=grdCreditTMP.GetGridData(19, 2);
         
            if(col1=="")
            {
                Credit1.GetGridControl().ColHidden(1) = true;
            }
            else
            {
                Credit1.AddRow();
                Credit1.SetGridText(0, 1,col1);
                //alert(col1_2);
                Credit1.SetGridText(1, 1,col1_2);
            }
            if(col2=="")
            {
                Credit1.GetGridControl().ColHidden(2) = true;
            }
            else
            {
                Credit1.SetGridText(0, 2,col2);
                Credit1.SetGridText(1, 2,col2_2);
            }
            if(col3=="")
            {
                Credit1.GetGridControl().ColHidden(3) = true;
            }
            else
            {
                Credit1.SetGridText(0, 3,col3);
                Credit1.SetGridText(1, 3,col3_2);
            }
            if(col4=="")
            {
                Credit1.GetGridControl().ColHidden(4) = true;
            }
            else
            {
                Credit1.SetGridText(0, 4,grdDebitTMP.GetGridData(4, 1));
                Credit1.SetGridText(1, 4,grdDebitTMP.GetGridData(4, 2));
                
            }
            if(col5=="")
            {
                Credit1.GetGridControl().ColHidden(5) = true;
            }
            else
            {
                Credit1.SetGridText(0, 5,grdDebitTMP.GetGridData(5, 1));
                Credit1.SetGridText(1, 5,grdDebitTMP.GetGridData(5, 2));
            }
            if(col6=="")
            {
                Credit1.GetGridControl().ColHidden(6) = true;
            }
            else
            {
                Credit1.SetGridText(0, 6,grdDebitTMP.GetGridData(6, 1));
                Credit1.SetGridText(1, 6,grdDebitTMP.GetGridData(6, 2));
            }
            if(col7=="")
            {
                Credit1.GetGridControl().ColHidden(7) = true;
            }
            else
            {
                Credit1.SetGridText(0, 7,grdDebitTMP.GetGridData(7, 1));
                Credit1.SetGridText(1, 7,grdDebitTMP.GetGridData(7, 2));
            }
            if(col8=="")
            {
                Credit1.GetGridControl().ColHidden(8) = true;
            }
            else
            {
                Credit1.SetGridText(0, 8,grdDebitTMP.GetGridData(8, 1));
                Credit1.SetGridText(1, 8,grdDebitTMP.GetGridData(8, 2));
            }
            if(col9=="")
            {
                Credit1.GetGridControl().ColHidden(9) = true;
            }
            else
            {
                Credit1.SetGridText(0, 9,grdDebitTMP.GetGridData(9, 1));
                Credit1.SetGridText(1, 9,grdDebitTMP.GetGridData(9, 2));
            }
            if(col10=="")
            {
                Credit1.GetGridControl().ColHidden(10) = true;
            }
            else
            {
                Credit1.SetGridText(0, 10,grdDebitTMP.GetGridData(10, 1));
                Credit1.SetGridText(1, 10,grdDebitTMP.GetGridData(10, 2));
            }
            if(col11=="")
            {
                Credit1.GetGridControl().ColHidden(11) = true;
            }
            else
            {
                Credit1.SetGridText(0, 11,grdDebitTMP.GetGridData(11, 1));
                Credit1.SetGridText(1, 11,grdDebitTMP.GetGridData(11, 2));
            }
            if(col12=="")
            {
                Credit1.GetGridControl().ColHidden(12) = true;
            }
            else
            {
                Credit1.SetGridText(0, 12,grdDebitTMP.GetGridData(12, 1));
                Credit1.SetGridText(1, 12,grdDebitTMP.GetGridData(12, 2));
            }
            if(col13=="")
            {
                Credit1.GetGridControl().ColHidden(13) = true;
            }
            else
            {
                Credit1.SetGridText(0, 13,grdDebitTMP.GetGridData(13, 1));
                Credit1.SetGridText(1, 13,grdDebitTMP.GetGridData(13, 2));
            }
            if(col14=="")
            {
                Credit1.GetGridControl().ColHidden(14) = true;
            }
            else
            {
                Credit1.SetGridText(0, 14,grdDebitTMP.GetGridData(14, 1));
                Credit1.SetGridText(1, 14,grdDebitTMP.GetGridData(14, 2));
            }
            if(col15=="")
            {
                Credit1.GetGridControl().ColHidden(15) = true;
            }
            else
            {
                Credit1.SetGridText(0, 15,grdDebitTMP.GetGridData(15, 1));
                Credit1.SetGridText(1, 15,grdDebitTMP.GetGridData(15, 2));
            }
            if(col16=="")
            {
                Credit1.GetGridControl().ColHidden(16) = true;
            }
            else
            {
                Credit1.SetGridText(0, 16,grdDebitTMP.GetGridData(16, 1));
                Credit1.SetGridText(1, 16,grdDebitTMP.GetGridData(16, 2));
            }
            if(col17=="")
            {
                Credit1.GetGridControl().ColHidden(17) = true;
            }
            else
            {
                Credit1.SetGridText(0, 17,grdDebitTMP.GetGridData(17, 1));
                Credit1.SetGridText(1, 17,grdDebitTMP.GetGridData(17, 2));
            }
            if(col18=="")
            {
                Credit1.GetGridControl().ColHidden(18) = true;
            }
            else
            {
                Credit1.SetGridText(0, 18,grdDebitTMP.GetGridData(18, 1));
                Credit1.SetGridText(1, 18,grdDebitTMP.GetGridData(18, 2));
            }
            if(col19=="")
            {
                Credit1.GetGridControl().ColHidden(19) = true;
            }
            else
            {
                Credit1.SetGridText(0, 19,grdDebitTMP.GetGridData(19, 1));
                Credit1.SetGridText(1, 19,grdDebitTMP.GetGridData(19, 2));
            }
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_get_exrate_list":
            _book_rate = GetBookExRate(_Book_CCY);
            lblBRate.text = _book_rate;
        break;
        case "dso_get_exrate_list1":
            _book_rate = GetBookExRate1(_Book_CCY);
            txtPerson.text = _book_rate;
        break;
         case "dso_sel_trans_debit":
            txt_DRCR.SetDataText('C');
            dso_sel_trans_credit.Call('SELECT');
         break;
         case "dso_SlipEntryV1":
//            if (flag_select == true)
//            {
                txt_drcr_type.SetDataText('D');
                dso_upd_grd_dtl_slip_entry_dr.Call('SELECT');
                
           // }
         break;
         case "dso_upd_grd_dtl_slip_entry_dr":

                txt_drcr_type.SetDataText('C');
                dso_upd_grd_dtl_slip_entry_cr.Call("SELECT");
                //dso_grdDebitTMP.Call('SELECT');

//            for (i=1;i<=grdDebit.rows-1;i++)
//            {
//                grdDebit.SetCellBgColor(i,17,i,17,Number(0XCDFAFF));
//            }  
        break;
        case "dso_upd_grd_dtl_slip_entry_cr":
            dso_grdDebitTMP.Call('SELECT');
        break;   
        case "dso_grdDebitTMP":
            SetDataToGriDebitItem();
        break;  
//        case "dso_grdDebitTMP":
//            SetDataToGriDebitItem();
//        break; 
    }
}
function OnUpdateBookRate(){
    dso_get_exrate_list.Call();
}
function OnUpdateBookRate1(){
    dso_get_exrate_list1.Call();
}
function GetBookExRate(p_ccy){
    lstBookExRate.value = p_ccy;
    var sTemp = lstBookExRate.GetText();
    
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ dtDate1.GetData() +".");
        return;
    }
    
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    
    return book_rate;
}
function GetBookExRate1(p_ccy){
    lstBookExRate1.value = p_ccy;
    var sTemp = lstBookExRate1.GetText();
    
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ dtDateTypeChange.GetData() +".");
        return;
    }
    
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    
    return book_rate;
}
function OnSave()
{
    dso_SlipEntryV1.Call();
}
function OnNew()
{
    if (dso_SlipEntryV1.GetStatus() != 20)
    {
        dso_SlipEntryV1.StatusInsert();
    }
//    grdDebit.ClearData();
//    grdCredit.ClearData();
//    idGridItem.SetData("");
//    idGridTempItem.SetData("");
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
//    dso_ctl_getProposedBy.Call("SELECT");
//    SetButtonCtl(true);
//    SetButtonEnable();
//    btnTreament.SetEnable(false);
//    OnCtrToggleRight();
    txtsum_chk_dr_famt.SetDataText('');
    txtsum_chk_dr_amt.SetDataText('');
    txtsum_chk_cr_famt.SetDataText('');
    txtsum_chk_cr_amt.SetDataText('');
    txtsum_total_dr_famt.SetDataText('');
    txtsum_total_dr_amt.SetDataText('');
    txtsum_total_cr_famt.SetDataText('');
    txtsum_total_cr_amt.SetDataText('');
    //btnReplicate.SetEnable(false);
    txtTrTypeCD.SetDataText('');
    //txtTrTypeCD.SetDataText('');
    txtDescription.SetDataText('');
    txtDesc.SetDataText('');
    txtLDesc.SetDataText('');
    var ls_data7    = "<%=CtlLib.SetDataSQL("SELECT DECODE(B.CODE, 'Y', 'T', 'F') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB004' AND B.DEF_YN = 'Y' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    chkauto_YN.SetDataText(ls_data7);
    if (ls_data7 == 'T')
    {
        txtvoucher_auto.SetEnable(false);
        txtvoucher_auto.SetDataText('');
    }
    else
    {
        txtvoucher_auto.SetEnable(true);
        txtvoucher_auto.SetDataText('');
    }
    txtTrTypeCD.GetControl().focus();
}
function OnTransactionPopUp()
{
    /*if (lstStatus.GetData() != '')
    {
        alert('You canot change Transaction Type!!!'+'\n'+'Bạn không thể thay đổi loại giao dịch');
        return;
    }*/
    txtTrTypeCD.text = "";
    txtTrTypeNM.text = "";
    txtDesc.text      = "";
    txtLDesc.text = "";
    
    grdDebit.ClearData();
    grdCredit.ClearData();
    var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.GetData();
    aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
    if ( aValue != null )
	{
		var tmp = aValue[0];
		if (tmp[1] != null)
		{
		    txtTrTypePK.text = tmp[0];
		    txtTrTypeCD.text = tmp[1];
		    txtTrTypeNM.text = tmp[2];
		    txtDesc.text      = tmp[3];
            txtLDesc.text = tmp[4];
		}
		if(aValue.length < 2)
		{
		    txt_DRCR.SetDataText('D');
			dso_sel_trans_debit.Call('SELECT');
		}
		else if (aValue.length > 1)
		{		
			for(i=1;i<aValue.length;i++)
			{
			    var tmp1= aValue[i];
			    if (tmp1[0] == "D")
				{
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1,  3, '1' );
					grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp1[2] ); //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp1[5] ); //Account Code
					grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp1[6] ); //Account Name
					grdDebit.SetGridText( grdDebit.rows - 1, 10, txtDesc.text);         //Desc Eng
					grdDebit.SetGridText( grdDebit.rows - 1, 11, txtLDesc.text);    //Desc Local
					grdDebit.SetGridText( grdDebit.rows - 1, 13, txtseq.text);
					grdDebit.SetRowEditable(grdDebit.rows - 1, false);
					grdDebit.SetGridText( grdDebit.rows - 1, 17, GetBookExRate(_Book_CCY));
					
				}
				else if (tmp1[0] == "C")
				{
					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1,  3, '1' );
					grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp1[2] ); //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp1[5] ); //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp1[6] ); //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 10, txtDescription.text );       //Desc Eng
					grdCredit.SetGridText( grdCredit.rows - 1, 11, txtLocalDescription.text );  //Desc Local
					grdCredit.SetGridText( grdCredit.rows - 1, 13, txtseq.text);
					grdCredit.SetRowEditable(grdCredit.rows - 1, false);
					grdCredit.SetGridText( grdCredit.rows - 1, 17, GetBookExRate(_Book_CCY));
				}
			}
		}
	}
}
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
function OnEnterTrans_Code()
{
    if (lstStatus.GetData() != '')
    {
        alert('You canot change Transaction Type!!!'+'\n'+'Bạn không thể thay đổi loại giao dịch');
        txtTrTypeCD.text = txttrans_code_tmp.GetData();
        return;
    }
    txtTrTypeNM.SetDataText('');
    txt_DRCR.SetDataText('D');
    dso_sel_trans_debit.Call('SELECT');
}
function OnSaveDr()
{
//    if(!CheckDataIsValid()) return;
//    
//     SetItemToGridTmp();
    
    if ((txt_drcr_type.GetData() == 'D') && (grdDebit.rows > 1))
    {
        for (i = 1; i < grdDebit.rows; i++)
        {
            if ((grdDebit.GetGridData(i, 13) == "") && (grdDebit.GetGridData(i, 9) != ''))
            {
                grdDebit.SetGridText(i, 13, txtseq.GetData());
                grdDebit.SetRowStatus(i, 0x20);
            }            
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetGridText(i, 13, txtseq.GetData());
                grdDebit.SetGridText(i, 8, 0);
                grdDebit.SetGridText(i, 9, 0);
            }
            grdDebit.SetGridText(i, 15, 'D');
            if (grdDebit.GetGridData(i, 10) == "")
            {
                grdDebit.SetGridText(i, 10, txtDesc.GetData());
            }
            if (grdDebit.GetGridData(i, 11) == "")
            {
                grdDebit.SetGridText(i, 11, txtLDesc.GetData());
            }
        }
        var j = 0;
        for (i = 1; i < grdDebit.rows; i++)
        {
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetRowStatus(i, 0x40);
                j = j + 1;
            }
            else
            {
                if (grdDebit.GetGridData(i, 9) == '')
                {
                    grdDebit.SetGridText(i, 13, txtseq.GetData());
                }
                grdDebit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdDebit.selrow;
        dso_upd_grd_dtl_slip_entry_dr.Call();
    }
}
function OnNewDr()
{
   if (txtTrTypeCD.GetData() != '')
    {
       // OnCtrToggleRight();
        Popup_OnNew('D');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    } 
}
function Popup_OnNew(p_data)
{
    var i = 0;
    var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTrTypeCD.GetData() + "&val1=" + txtTrTypeNM.GetData() + "&val2=" + p_data + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW_DRCR";
    aValue      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for(i=0; i<aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[1] != 0)
                {
                    if (p_data == 'D')
                    {
                        grdDebit.AddRow();
                        grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D' );
					    grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp[1]);    //ACPK
					    grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp[4]);    //Account Code
					    grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp[5]);    //Account Name
					    if (grdDebit.rows > 2)
					    {
					        var ls_curr = grdDebit.GetGridData(grdDebit.rows - 2, 6);
					        var ls_rate = grdDebit.GetGridData(grdDebit.rows - 2, 7);
					        var ls_ref  = grdDebit.GetGridData(grdDebit.rows - 2, 3);
					        grdDebit.SetGridText( grdDebit.rows - 1, 6, ls_curr);       //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 7, ls_rate);       //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, ls_ref);
					    }
					    else
					    {
					        grdDebit.SetGridText( grdDebit.rows - 1, 7, '1');           //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, '1' );
					    }
					    grdDebit.SetGridText( grdDebit.rows - 1, 10, txtDesc.text );         //Desc Eng
					    grdDebit.SetGridText( grdDebit.rows - 1, 11, txtLDesc.text );    //Desc Local
					    grdDebit.SetGridText( grdDebit.rows - 1, 13, txtseq.text );                 //SEQ
					    grdDebit.SetRowEditable(grdDebit.rows - 1, false);
					    click_dr = 0;					    					    					    
                        grdDebit.SetGridText( grdDebit.rows - 1, 17, GetBookExRate(_Book_CCY));
                    }
                    else if (p_data == 'C')
                    {
                        grdCredit.DeselectRow(grdCredit.selrow);
                        grdCredit.AddRow();
                        grdCredit.SelectRow(grdCredit.rows - 1);
                        grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C' );
					    grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp[1]);  //ACPK
					    grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp[4]);  //Account Code
					    grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp[5]);  //Account Name
					    if (grdCredit.rows > 2)
					    {
					        var ls_curr = grdCredit.GetGridData(grdCredit.rows - 2, 6);
					        var ls_rate = grdCredit.GetGridData(grdCredit.rows - 2, 7);
					        var ls_ref  = grdCredit.GetGridData(grdCredit.rows - 2, 3);
					        grdCredit.SetGridText( grdCredit.rows - 1, 6, ls_curr);       //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 7, ls_rate);       //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref);
					    }
					    else
					    {
					        grdCredit.SetGridText( grdCredit.rows - 1, 7, '1');           //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 3, '1' );
					    }
					    var ls_ref;
					    if (grdDebit.selrow != -1)
					    {
					        ls_ref = grdDebit.GetGridData(grdDebit.selrow, 3);
					    }
					    else
					    {
					        ls_ref = 1;
					    }
					    grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref );
                        //onSetData_CR(ls_ref);
					    grdCredit.SetGridText( grdCredit.rows - 1, 10, txtDesc.text );         //Desc Eng
					    grdCredit.SetGridText( grdCredit.rows - 1, 11, txtLDesc.text );    //Desc Local
					    grdCredit.SetGridText( grdCredit.rows - 1, 13, txtseq.text);                 //SEQ
					    grdCredit.SetRowEditable(grdCredit.rows - 1, false);
					    grdCredit.SetGridText( grdCredit.rows - 1, 17, GetBookExRate(_Book_CCY));
					    click_cr = 0;
                    }
                }
            }
        }
    }
}
function onSetData_CR(p_ref)
{
	var l_sum_dr = 0;
	var l_sum_cr = 0;
	for (i = 1; i < grdDebit.rows; i++)
	{
        if (grdDebit.GetGridData(i, 3) == p_ref)
        {
            l_sum_dr = l_sum_dr + Number(grdDebit.GetGridData(i, 9));
        }
	}
	for (i = 1; i < grdCredit.rows; i++)
	{
        if ((grdCredit.GetGridData(i, 3) == p_ref) && (grdCredit.selrow != click_cr))
        {
            l_sum_cr = l_sum_cr + Number(grdCredit.GetGridData(i, 9));
        }
	}
	//grdCredit.SetGridText( grdCredit.rows - 1, 9, l_sum_dr - l_sum_cr);
	for (i = 1; i < grdCredit.rows; i++)
    {
        if (grdCredit.selrow == i)
        {
            grdCredit.SetCellBold(i,1,i,17,true);
            grdCredit.SetRowEditable(i, true);
        }
        else
        {
            grdCredit.SetCellBold(i,1,i,17,false);
            grdCredit.SetRowEditable(i, false);
        }
    }
}
function OnNewCr()
{
    if (txtTrTypeCD.GetData() != '')
    {
        //OnCtrToggleRight();
        Popup_OnNew('C');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
}
function OnSaveCr()
{
   // if(!CheckDataIsValid()) return;
    
     //SetItemToGridTmp();
    
    if ((txt_drcr_type.GetData() == 'C') && (grdCredit.rows > 1))
    {
        for (i = 1; i < grdCredit.rows; i++)
        {
            if ((grdCredit.GetGridData(i, 13) == "") && (grdCredit.GetGridData(i, 9) != ''))
            {
                grdCredit.SetGridText(i, 13, txtseq.GetData());
                grdCredit.SetRowStatus(i, 0x20);
            }
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetGridText(i, 13, txtseq.GetData());
                grdCredit.SetGridText(i, 8, 0);
                grdCredit.SetGridText(i, 9, 0);
            }
            grdCredit.SetGridText(i, 15, 'C');
            if (grdCredit.GetGridData(i, 10) == "")
            {
                grdCredit.SetGridText(i, 10, txtDesc.GetData());
            }
            if (grdCredit.GetGridData(i, 11) == "")
            {
                grdCredit.SetGridText(i, 11, txtLDesc.GetData());
            }
        }
        var j = 0;
        for (i = 1; i < grdCredit.rows; i++)
        {
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetRowStatus(i, 0x40);
                j = j + 1;
            }
            else
            {
                if (grdCredit.GetGridData(i, 9) == '')
                {
                    grdCredit.SetGridText(i, 13, txtseq.GetData());
                }
                grdCredit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdCredit.selrow;
        dso_upd_grd_dtl_slip_entry_cr.Call();
    }
}
//onsave grid debit
function DBPopupClick_DR()
{
    if (event.col == 10)
	{
	   //alert();
	    Popup_OnSelect_Acc('D');
    }
}
/*function RowClick_DR()
{
    if (grdDebit.rows < 2)
    {
        return;
    }
	else
	{
	    if (grdDebit.selrow < 1)
	    {
	        return;
	    }
	    if (event.col == 9){
        
          var col_3='';
          col_3 = grdDebit.GetGridData(grdDebit.row,3);
         
          if(txtEACAB032.GetData()=='N' && col_3==1 ){
             grdDebit.row=-1;
            return;
           } 
        }
	    if ((grdDebit.rows > 1) && (grdDebit.selrow < grdDebit.rows) && (grdDebit.selrow != click_dr))
	    {
            for (i = 1; i < grdDebit.rows; i++)
            {
                if (grdDebit.selrow == i)
                {
	                grdDebit.SetCellBold(i,1,i,15,true);
	                grdDebit.SetRowEditable(i, true);
                }
                else
                {
	                grdDebit.SetCellBold(i,1,i,15,false);
	                grdDebit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 1));
            txthgtrd.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
            txt_rowclick.text = grdDebit.selrow;
            txt_drcr_type.SetDataText('D');
            idGridItem.SetData("");
            click_dr = grdDebit.selrow;
            click_cr = 0;
            dso_upd_ctl_item.Call("SELECT");
        }
        
        OnCheckSumDR();
    }
}*/
function OnCheckSumDR()
{
	var ctrl 	    = grdDebit.GetGridControl();
	var sum_dr_famt = 0;
	var sum_dr_amt  = 0;
	for (i=1; i < ctrl.rows; i++)
	{
		var tmp = grdDebit.GetGridData(i, 2);
		if (tmp == '-1')
		{
			sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8));
			sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9));
		}
	}
	txtsum_chk_dr_famt.SetDataText(''   + sum_dr_famt);
	txtsum_chk_dr_amt.SetDataText(''    + sum_dr_amt);
	OnSumDR();
}
function OnCheckSumCR()
{
	var ctrl 	    = grdCredit.GetGridControl();
	var sum_cr_famt = 0;
	var sum_cr_amt  = 0;
	for (i=1; i < ctrl.rows; i++)
	{
		var tmp = grdCredit.GetGridData(i, 2);
		if (tmp == '-1')
		{
			sum_cr_famt = Number(sum_cr_famt) + Number(grdCredit.GetGridData(i, 8));
			sum_cr_amt  = Number(sum_cr_amt)  + Number(grdCredit.GetGridData(i, 9));
		}
	}
	txtsum_chk_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_chk_cr_amt.SetDataText(''  + sum_cr_amt);
	OnSumCR();
}
function OnSumCR()
{
    var ctrl = grdCredit.GetGridControl();
    var sum_cr_famt = 0; 
    var sum_cr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_cr_famt = sum_cr_famt + Number(grdCredit.GetGridData(i, 8));
	     sum_cr_amt  = sum_cr_amt  + Number(grdCredit.GetGridData(i, 9));
	}
	txtsum_total_cr_famt.text = "" + System.Round(sum_cr_famt,2);
	txtsum_total_cr_amt.text = "" + System.Round(sum_cr_amt,2);
}
function RowEditDR()
{
    var dr_famt = 0;
    var dr_bamt = 0;
    var dr_rate = 0;
    var book_rate = 1;
    
    _book_rate = grdDebit.GetGridData(event.row, 17);
    if (event.col == 6 || event.col == 8 || event.col == 7 || event.col == 17)
    {
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        //alert(event.col);
        dr_famt = Number(grdDebit.GetGridData(event.row, 8));
        dr_bamt = Number(grdDebit.GetGridData(event.row, 9));
        grdDebit.SetGridText(event.row, 18, Math.round(Number((dr_bamt/dr_famt)*_book_rate)));
        
        book_rate = GetBookExRate(txtcur.text);
       if(event.col == 6)
       {
            grdDebit.SetGridText(event.row, 7, book_rate);
       }
        dr_rate = Number(grdDebit.GetGridData(event.row, 7));
        //alert('book_rate=' + book_rate + '  ,dr_famt=' + dr_famt + ',dr_bamt=' + dr_bamt);
       
        
        if(_book_col_format.indexOf(".")>0)
        {
            var book_amt = (Number(dr_famt*(dr_rate/_book_rate)));
            book_amt = System.Round(book_amt,2);
            grdDebit.SetGridText(event.row, 9, book_amt);
        }
        else
        {
            grdDebit.SetGridText(event.row, 9, Math.round(Number(dr_famt*(dr_rate/_book_rate))));
        }
      
    }
    OnSumDR();
}
function OnSumDR()
{
    var ctrl = grdDebit.GetGridControl();
    var sum_dr_famt = 0;
    var sum_dr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8));
	     sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9));
	}
	txtsum_total_dr_famt.text = "" + System.Round(sum_dr_famt,2);
	txtsum_total_dr_amt.text = "" + System.Round(sum_dr_amt,2);
}
function OnCloseData()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 14, i);
        grdDebit.SetRowEditable(i, false);
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 14, i);
        grdCredit.SetRowEditable(i, false);
    }
}
function DBPopupClick_CR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('C');
    }
}
function RowClick_CR()
{
   
              
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.row, 1));
            txthgtrd.SetDataText(grdDebit.GetGridData(grdDebit.row, 0));
            txt_drcr_type.SetDataText('C');
           // alert(txtacpk.text+"-"+txthgtrd.text);
            grdCredit1.SetData("");
            dso_upd_ctl_item_Credit.Call("SELECT");
        OnCheckSumCR();
}
function RowEditCR()
{
    var cr_famt = 0;
    var cr_bamt = 0;
    var cr_rate = 0, book_rate = 1;
    _book_rate = grdCredit.GetGridData(event.row, 17);
    
    if (event.col == 6 || event.col == 8 || event.col == 7 || event.col == 17){
       
        cr_bamt = grdCredit.GetGridData(event.row, 9);
        cr_famt = Number(grdCredit.GetGridData(event.row, 8));       
        grdCredit.SetGridText(event.row, 18, Math.round(Number((cr_bamt/cr_famt)*_book_rate)));
        ///alert(Math.round(Number((cr_bamt/cr_famt)*_book_rate)));
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        
        book_rate = GetBookExRate(txtcur.text);
        if(event.col == 6){
        grdCredit.SetGridText(event.row, 7, book_rate);}
        cr_rate = Number(grdCredit.GetGridData(event.row, 7));
         
        if(_book_col_format.indexOf(".")>0){
            var book_amt = (Number(cr_famt*(cr_rate/_book_rate)));
            book_amt = System.Round(book_amt,2);
            grdCredit.SetGridText(event.row, 9, book_amt);
        }
        else{
            grdCredit.SetGridText(event.row, 9, Math.round(Number(cr_famt*(cr_rate/_book_rate))));
        }
    }
    OnSumCR();
}
function RowClick_DR()
{

	   if(grdDebit.rows > 1) 
	   {
	           
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.row, 1));
            txthgtrd.SetDataText(grdDebit.GetGridData(grdDebit.row, 0));
            txt_drcr_type.SetDataText('D');
           // alert(txtacpk.text+"-"+txthgtrd.text);
           grdDebit1.SetData("");
           dso_upd_ctl_item_Debit.Call("SELECT");
        }
    OnCheckSumDR();
}
function ItemStyle()
{
    //dso_upd_ctl_item.Call("SELECT");
}
function OnTreament1()
{
  if(txt_drcr_type.GetData() == 'C'){
    OnSaveCr();
  }
}
function OnTreament()
{
  if(txt_drcr_type.GetData() == 'D'){
    OnSaveDr();
  }
}
function CanChange(){
    switch(lstStatus.GetData()){
        case "0":alert("This voucher was approved. So you can not change !.\n Số phiếu này đã được approve. Bạn không thể thay đổi !");
               return false;
        break;
        case "1": return true;
        case "2":alert("This voucher was confirmed. So you can not change !.\n Số phiếu này đã được xác nhận. Bạn không thể thay đổi !");
                 return false;
        break;
        case "3": return true;
        break;
        case "4": alert("This voucher was approved. So you can not change !.\n Số phiếu này đã được approve. Bạn không thể thay đổi !");
               return false;
        break;
    }
    return true;
}
function ClickItemControl()
{    
	var flg = "0";
	var ctrl = idGridItem.GetGridControl();
	alert(idGridItem.GetGridData( ctrl.row, 2));
	/*if (idGridItem.GetGridData( ctrl.row, 2) == '-1')
	{
		flg = "2";
		var path = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
		var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		if ( object != null )
		{
		    if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row,  9, object[1]);//customer id
		        idGridItem.SetGridText(ctrl.row,  10, object[2]);//customer name
		        idGridItem.SetGridText(ctrl.row,  11, "TCO_BUSPARTNER");//table name
		        idGridItem.SetGridText(ctrl.row, 12, object[0]);//customer pk
		        
		        for (i = 1; i < idGridItem.rows; i++)
		        {
//		            if (idGridItem.GetGridData(i, 8) == 'CUSTOMER NAME')
//		            {
//		                idGridItem.SetGridText(i, 10, object[2]);//cuatomer name
//		                idGridItem.SetGridText(i,  9, object[1]);//cuatomer id
//		            }
		            if (idGridItem.GetGridData(i, 8) == 'SERIAL NO')
		            {
		                idGridItem.SetGridText(i,  9, object[7]);
		            }
		            if (idGridItem.GetGridData(i, 8) == 'TAX CODE')
		            {
		                idGridItem.SetGridText(i,  9, object[6]);
		            }
		        }
		    }
        }
	}
	else if (idGridItem.GetGridData( ctrl.row, 2) == '-2')
	{
	    var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row,  9, object[1]) ;//pl name
                idGridItem.SetGridText(ctrl.row, 10, object[3]) ;//cost center name
                idGridItem.SetGridText(ctrl.row,  11, "TAC_ABPLCENTER") ;//
                idGridItem.SetGridText(ctrl.row,  12, object[2]) ;//table pk			
            }
        } 
	}
	else if(idGridItem.GetGridData(idGridItem.row, 8) == 'CONTRACT NOAR'){
	    var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002007.aspx?contract_type=SALE&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE(contract no)
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME(customer name)
            idGridItem.SetGridText(idGridItem.row, 11, "TEX_CONTR_MST") ;//TABLE NAME 
            idGridItem.SetGridText(idGridItem.row, 12, object[0]) ;//TABLE PK 
            for(var i=1;i<idGridItem.rows;i++){
                if ((idGridItem.GetGridData(i, 8) == 'CUSTOMER') && (Trim(idGridItem.GetGridData(i, 9)) == "")){
                    idGridItem.SetGridText(i,  9, object[3]);//customer id
                    idGridItem.SetGridText(i, 10, object[4]);//customer name
                    idGridItem.SetGridText(i,  11, "TCO_BUSPARTNER");//TABLE NAME
                    idGridItem.SetGridText(i,  12, object[8]);//TABLE PK
                }
                if (idGridItem.GetGridData(i, 8) == 'SERIAL NO'){
                    idGridItem.SetGridText(i,  9, object[10]);
                }
                if (idGridItem.GetGridData(i, 8) == 'PL UNIT'){
                    idGridItem.SetGridText(i,  9, object[12]);
                    idGridItem.SetGridText(i,  10, object[13]);
                    idGridItem.SetGridText(i,  12, object[11]);
                }
             
            }
        } 
    }    
    else if(idGridItem.GetGridData( idGridItem.row, 8) == 'CONTRACT NOAP'){
	    var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002007.aspx?contract_type=BUY&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME
            idGridItem.SetGridText(idGridItem.row, 11, "TIM_CONTR_MST") ;//TABLE NAME 
            idGridItem.SetGridText(idGridItem.row, 12, object[0]) ;//TABLE PK 
            
            for(var i=1;i<idGridItem.rows;i++){
                if ((idGridItem.GetGridData(i, 8) == 'CUSTOMER') && (Trim(idGridItem.GetGridData(i, 9)) == "")){
                    idGridItem.SetGridText(i,  9, object[3]);//customer id
                    idGridItem.SetGridText(i, 10, object[4]);//customer name
                    idGridItem.SetGridText(i,  11, "TCO_BUSPARTNER");//TABLE NAME
                    idGridItem.SetGridText(i,  12, object[8]);//TABLE PK
                }
                if (idGridItem.GetGridData(i, 8) == 'SERIAL NO'){
                    idGridItem.SetGridText(i,  9, object[10]);
                }
                if (idGridItem.GetGridData(i, 8) == 'TAX CODE'){
                    idGridItem.SetGridText(i,  9, object[9]);
                }
                if (idGridItem.GetGridData(i, 8) == 'PL UNIT'){
                    idGridItem.SetGridText(i,  9, object[12]);
                    idGridItem.SetGridText(i,  10, object[13]);
                    idGridItem.SetGridText(i,  12, object[11]);
                }
            }
        } 
	}
	else
	{
		if ((idGridItem.GetGridData( ctrl.row, 3) == 'T') || (idGridItem.GetGridData(ctrl.row, 3) == 'C'))
		{
			if (idGridItem.GetGridData( ctrl.row, 3) == 'C')
			{
				var ls_str = idGridItem.GetGridData(ctrl.row, 8);
				var temp = new Array();
                temp = ls_str.split(' ');
				var ls_temp = temp[0];
				
				var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
                var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                //get from TAC_ABITEMCODE
                if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        idGridItem.SetGridText(ctrl.row,  9, object[0]) ;// item code
                        idGridItem.SetGridText(ctrl.row, 10, object[1]) ;//item name
                        idGridItem.SetGridText(ctrl.row, 11, "TAC_ABITEMCODE") ; //table name
                        idGridItem.SetGridText(ctrl.row, 12, object[2]) ; //table pk
                    }
                } 
			}
			else
			{
				if (idGridItem.GetGridData(ctrl.row, 4) != '')
				{
				//
				}
				else
				{
					if ( idGridItem.GetGridData( ctrl.row, 8 )== "Bank Account No." || idGridItem.GetGridData( ctrl.row, 8 )== "DEPOSIT ACCOUNT NO" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NUMBER" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NO.")
					{
					    var ls_ccy
					    if (txt_drcr_type.GetData() == 'D')
					    {
					        ls_ccy = grdDebit.GetGridData(click_dr, 6);
					    }
					    else if (txt_drcr_type.GetData() == 'C')
					    {
					        ls_ccy = grdCredit.GetGridData(click_cr, 6);
					    }
					    var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_BANK_POPUP&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
                        var object  =   System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                        if (object != null)
                        {
                            if (object[0] != 0)
                            {
                                idGridItem.SetGridText(ctrl.row,  9, object[1]);//BANK ID
                                idGridItem.SetGridText(ctrl.row, 10, object[0]);//BANK NAME(PARTNER NAME)
                                idGridItem.SetGridText(ctrl.row, 11, "TAC_ABDEPOMT");// TABLE NAME 
                                idGridItem.SetGridText(ctrl.row, 12, object[2]);// TABLE PK 
                            }
                        }
					}
					else
					{
						
						if (idGridItem.GetGridData( ctrl.row, 8 )== "EMPLOYEE NAME")
						{
							//var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002003.aspx";
							var fpath   = System.RootURL + "/standard/forms/gf/ma/gfma00010_3.aspx";
                            var object  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                            if ( object != null )  
                            {
                                if (object[0] != 0)
                                {
                                    idGridItem.SetGridText(ctrl.row,  9, object[1]) ; //Employee ID
                                    idGridItem.SetGridText(ctrl.row, 10, object[2]) ; //Employee Name 
                                    idGridItem.SetGridText(ctrl.row, 11, "TAC_EMPLOYEE_ADV") ; //table name
                                    idGridItem.SetGridText(ctrl.row, 12, object[0]) ; //TABLE PK    
                                }
                            }
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT" || idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT NAME" )
						{
							flg = "-3";
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "CONTRACT NO")
						{
							flg = "-4";
						}
					}
				}
			}
		}
	}*/
}
</script>

<body style="margin: 0; padding: 0;">
    <gw:data id="dso_upd_ctl_item_Debit" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" parameter="0,1,2,9,10,11,12" function="ac_sel_grd_ctl_item_call1" procedure="ac_upd_grd_item_ctl_slip_entry">
                <input bind="grdDebit1">
                    <input bind="txthgtrd"/>
                    <input bind="txtacpk"/>
                    <input bind="txt_drcr_type"/>
                </input> 
                <output bind="grdDebit1"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_grdDebitTMP" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_00010_v1">
                <input bind="grdDebitTMP">
                </input> 
                <output bind="grdDebitTMP"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_grdCreditTMP" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_00010_1_v1">
                <input bind="grdCreditTMP">
                </input> 
                <output bind="grdCreditTMP"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_sel_trans_debit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="ac_sel_account_drcr">
                <input bind="grdDebit">
                    <input bind="txtTrTypeCD"/>
                    <input bind="txtTrTypeNM"/>
                    <input bind="txt_DRCR"/>
                    <input bind="lstCompany"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_sel_trans_credit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="ac_sel_account_drcr">
                <input bind="grdCredit">
                    <input bind="txtTrTypeCD"/>
                    <input bind="txtTrTypeNM"/>
                    <input bind="txt_DRCR"/>
                    <input bind="lstCompany"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_grd_dtl_slip_entry_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18" function="ac_sel_grd_dtl_slip_entry" procedure="ac_upd_grd_dtl_slip_entry">
                <input bind="grdDebit" >
                    <input bind="txtseq"/>
                    <input bind="txt_drcr_type"/> 
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit" />
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_grd_dtl_slip_entry_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18" function="ac_sel_grd_dtl_slip_entry" procedure="ac_upd_grd_dtl_slip_entry">
                <input bind="grdCredit">
                    <input bind="txtseq"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_Search" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ac_sel_gfhg00010_v1">
            <input bind="grid_search">
                <input bind="lstCompanySearch"/>
                <input bind="dtFr"/>
                <input bind="dtTo"/>
                <input bind="lstVoucherTypeSearch"/>
                <input bind="lstStatusSearch"/>
                <input bind="txtVoucherNoSearch"/>
                <input bind="txtDesSearch"/>
            </input>
            <output bind="grid_search"/>
        </dso>
    </xml>
</gw:data>
    <gw:data id="dso_SlipEntryV1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="ac_sel_gfhg00010_1_v1"  procedure="ac_upd_gfhg00010_1_v1"> 
                <inout>             
                     <inout  bind="txtseq" />
                     <inout  bind="txtvoucher_no" />
                     <inout  bind="dtDate1" />
                     <inout  bind="lstCompany" />                          
                     <inout  bind="txtTrTypePK" />
                     <inout  bind="txtTrTypeCD" />
                     <inout  bind="txtTrTypeNM" />
                     <inout  bind="txtDesc" />
                     <inout  bind="lstStatus" />
                     <inout  bind="txtProposedByUserID" /> 
                     <inout  bind="chkauto_YN" />
                     <inout  bind="txtLDesc" />
                     <inout  bind="txtEndClose" />   
                     <inout  bind="lstDept" />  
                     <inout  bind="lstType" />  
                     <inout  bind="txtvoucher_auto" />
                     <inout  bind="txtProposedByUserPk" />
                     <inout  bind="dtDateTypeChange" />  
                     <inout  bind="txtCustomerPK" /> 
                     <inout  bind="txtCustomerCD" />  
                     <inout  bind="txtCustomerNM" />  
                     <inout  bind="txtDescription" />    
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_confirm" onreceive="SetButtonEnable()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_gfhg00010_v1" > 
                <input> 
                     <input bind="txtseq"/>
                     <input bind="lstCompany"/>
                </input>  
                <output>  
                     <output bind="lstStatus"/>
                     <output bind="txtvoucher_auto"/>
                     <output bind="txtvoucher_no"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_sel_tac_abexrates_list"> 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtDate1" />
                </input>
                <output>
                     <output bind="lstBookExRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_get_exrate_list1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_sel_tac_abexrates_list1"> 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtDateTypeChange" />
                </input>
                <output>
                     <output bind="lstBookExRate1"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <table border="1" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td id="left" width="27%" rowspan="8" align="justify" valign="top">
                <table border="0" width="100%" id="table1" cellpadding="0" cellspacing="0">
                    <tr height="12%">
                        <td width="94%">
                            <fieldset style="padding: 2">
                                <table border="0" width="100%" id="table2" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            Company</td>
                                        <td colspan="4">
                                            <gw:list id="lstCompanySearch" onchange="OnSearch()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" align="right">
                                            <a title="Entry date" style="color=#ffff00"><font color="#000000">Date</font></a></td>
                                        <td width="30%" align="left">
                                            <gw:datebox id="dtFr" lang="1" styles="width:90%;" />
                                        </td>
                                        <td width="5%" align="center">
                                            ~
                                        </td>
                                        <td width="5%" colspan="2" align="right">
                                            <gw:datebox id="dtTo" lang="1" styles="width:90%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" align="right">
                                            <a title="Voucher type" style="color=#ffff00"><font color="#000000">Type</font></a></td>
                                        <td width="60%" colspan="4">
                                            <gw:list id="lstVoucherTypeSearch" onchange="OnChangeVoucher()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" align="right">
                                            <a title="Voucher status" style="color=#ffff00"><font color="#000000">Status</font></a></td>
                                        <td width="60%" colspan="4">
                                            <gw:list id="lstStatusSearch" onchange="OnChangeVoucher()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" align="right">
                                            <a title="Voucher No" style="color=#ffff00"><font color="#000000">VC.No</font></a></td>
                                        <td width="60%" colspan="4">
                                            <gw:textbox id="txtVoucherNoSearch" onchange="OnChangeVoucher()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" align="right">
                                            <a title="Voucher No" style="color=#ffff00"><font color="#000000">Desc</font></a></td>
                                        <td width="59%" colspan="3">
                                            <gw:textbox id="txtDesSearch" onchange="OnChangeVoucher()" styles="width:100%" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr height="88%">
                        <td colspan="5">
                            <table class="table" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                <tr>
                                    <td>
                                        <gw:grid id="grid_search" header="Seq|Voucher No.|Entry Date|_Company|Trs Type|Trs Name|Amount|Description|Status|Prps By"
                                            format="0|0|4|0|0|0|0|0|2|0" aligns="1|1|1|0|1|0|3|0|0|0" defaults="|||||||||"
                                            editcol="0|0|0|0|0|0|0|0|0|0" widths="1000|1400|1200|1300|800|2500|2000|2000|900|0"
                                            styles="width:100%; height:100%" acceptnulldate="T" sorting="T" oncellclick="GridOnCellClick()"
                                            oncelldblclick="Select()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" width="70%" align="justify" valign="top">
                <table border="0" width="100%" id="table3" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%" colspan="20">
                            <fieldset style="padding: 2" id="fs">
                                <table border="0" width="100%" id="table4" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="10%">
                                            Company</td>
                                        <td width="40%" colspan="5">
                                            <gw:list id="lstCompany" styles="width:100%;" />
                                        </td>
                                        <td width="3%" align="right">
                                            Seq</td>
                                        <td width="10%">
                                            <gw:textbox id="txtseq" styles="width:100%" onenterkey="CheckKeySeq()" onkeypress="CheckNumeric()" />
                                        </td>
                                        <td width="11%" align="right">
                                            <a title="Proposed By" style="color=#ffff00"><font color="#000000">Prop. by</font></a></td>
                                        <td width="12%" colspan="2">
                                            <gw:textbox id="txtProposedByUserID" styles="width:100%" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnNewMST" img="new" alt="New" onclick="OnNew()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnSaveMST" img="save" alt="Save" onclick="OnSave()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnDelMST" img="delete" alt="Delete" onclick="OnDelete()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnCopyMST" img="copy" alt="Copy" onclick="OnCopy()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnReplicateMST" img="revert" alt="Replicate" onclick="OnReplicate()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnCancelMST" img="cancel" alt="Cancel" onclick="OnCancel()" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnPrintMST" img="excel" alt="Print Accounting Slip" onclick="OnPrint(0)" />
                                        </td>
                                        <td width="1%" align="right">
                                            <gw:imgbtn id="btnPrint2lMST" img="excel" alt="Print Receiving Voucher" onclick="OnPrint(1)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="10%">
                                            <a title="Department" style="color=#ffff00"><font color="#000000">Dept.</font></a></td>
                                        <td width="30%" colspan="5">
                                            <gw:list id="lstDept" styles="width:100%;" />
                                        </td>
                                        <td width="10%" align="right">
                                            Type</td>
                                        <td width="40%" colspan="4">
                                            <gw:list id="lstType" styles="width:100%;" onchange="OnchangeLstType()" />
                                        </td>
                                        <td width="10%" align="right" colspan="3">
                                            Status</td>
                                        <td width="30%" colspan="9">
                                            <gw:list id="lstStatus" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="10%">
                                            <a title="Transaction date" style="color=#ffff00"><font color="#000000">Date</font></a></td>
                                        <td width="10%" colspan="2">
                                            <gw:datebox id="dtDate1" lang="1" onchange="OnUpdateBookRate()" />
                                        </td>
                                        <td width="10%" colspan="1">
                                            <a title="Booking Exchange rate" style="color=#ffff00"><font color="#000000">B.Rate
                                                :</font></a></td>
                                        <td width="10%" colspan="2">
                                            <gw:label text="" id="lblBRate" styles="width:100%;" />
                                        </td>
                                        <td width="10%" align="right">
                                            <a onclick="OnTransactionPopUp()" href="#tips" title="Get Transaction type">Trs. type</a></td>
                                        <td width="10%" colspan="">
                                            <gw:textbox id="txtTrTypeCD" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td width="30%" colspan="12">
                                            <gw:textbox id="txtTrTypeNM" styles="width:100%;" csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="10%">
                                            <a title="Transaction date" style="color=#ffff00"><font color="#000000">VC.No</font></a></td>
                                        <td width="15%" colspan="2">
                                            <gw:textbox id="txtvoucher_no" styles="width:100%;" />
                                        </td>
                                        <td width="5%" colspan="">
                                            <gw:textbox id="txtvoucher_auto" styles="width:100%;" />
                                        </td>
                                        <td width="1%" colspan="">
                                            <gw:checkbox id="chkauto_YN" value="T" onclick="OnAutoYN()" />
                                        </td>
                                        <td width="1%" colspan="1">
                                            Auto</td>
                                        <td width="10%" align="right">
                                            <a title="Description" style="color=#ffff00"><font color="#000000">Desc.</font></a></td>
                                        <td width="40%" colspan="13">
                                            <gw:textbox id="txtDesc" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="10%">
                                            <a title="Enclose" style="color=#ffff00"><font color="#000000">Enclose</font></a></td>
                                        <td width="40%" colspan="5">
                                            <gw:textbox id="txtEndClose" lang="1" onchange="OnUpdateBookRate()" />
                                        </td>
                                        <td width="10%" colspan="1" align="right">
                                            <a title="Local Description" style="color=#ffff00"><font color="#000000">L.Desc.</font></a></td>
                                        <td width="40%" colspan="13">
                                            <gw:textbox id="txtLDesc" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr id="tr1">
                                        <td width="10%">
                                            <gw:label img="new" id="lblRecord_D" style="font-weight: bold; color: red; font-size: 12"
                                                text="RV.Date" />
                                        </td>
                                        <td width="10%" colspan="1">
                                            <gw:datebox id="dtDateTypeChange" lang="1" onchange="OnUpdateBookRate1()" />
                                        </td>
                                        <td width="10%" colspan="1" align="right">
                                            <a title="Booking Exchange rate" style="color=#ffff00"><font color="#000000">Person</font></a></td>
                                        <td width="10%" colspan="17">
                                            <gw:textbox text="" id="txtPerson" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr id="tr2">
                                        <td width="10%">
                                            <a title="Click here to show customer" onclick="OnPopUp()" href="#tips"><b>Customer</b></a></td>
                                        <td width="10%" colspan="2">
                                            <gw:textbox id="txtCustomerCD" lang="1" onchange="OnUpdateBookRate()" />
                                        </td>
                                        <td width="10%" colspan="18">
                                            <gw:textbox text="" id="txtCustomerNM" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr id="tr3">
                                        <td width="10%">
                                            <a title="Customer" style="color=#ffff00"><font color="#000000">Description</font></a></td>
                                        <td width="10%" colspan="20">
                                            <gw:textbox id="txtDescription" lang="1" onchange="OnUpdateBookRate()" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="20">
                            <table>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="9%" align="left" colspan="">
                            Ctr.Item</td>
                        <td width="1%" align="left">
                            <img status="expand" id="img_idGridItem" src="../../../../system/images/down.gif" style="cursor: hand;"
                                onclick="OnToggle(1)" />
                        </td>
                        <td colspan="15" align="right">
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnNew_Dr" img="new" alt="New" onclick="OnNewDr()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnSave_Dr" img="save" alt="Save" onclick="OnSaveDr()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnDel_Dr" img="delete" alt="Delete" onclick="OnDelDr()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="20">
                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="10%">
                                        <a href="#tips">Debit</a></td>
                                    <td width="18%" colspan="3">
                                        <gw:textbox id="txtsum_chk_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td width="18%" colspan="4">
                                        <gw:textbox id="txtsum_chk_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td width="11%" align="center" colspan="2">
                                        <a href="#tips">Total</a></td>
                                    <td width="13%">
                                        <gw:textbox id="txtsum_total_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td width="13%">
                                        <gw:textbox id="txtsum_total_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td width="13%" colspan="3">
                                        <gw:textbox id="txtsum_total_dr_amt2" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td width="2%">
                                        <gw:icon id="btnUp_Dr" onclick="OnUpDr()"><img src="../../../../system/images/up.gif"/></gw:icon>
                                    </td>
                                    <td width="2%" align="left">
                                        <gw:icon id="btnDown_Dr" onclick="OnDownDr()"><img src="../../../../system/images/down.gif"/></gw:icon>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="Debit" width="100%" colspan="20">
                            <gw:grid id="grdDebit" header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|_Tmp Rate"
                                format="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0" aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|0"
                                defaults="||||||VND||||||||||||" editcol="0|0|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|1|1"
                                widths="0|0|250|300|1000|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1200"
                                styles="width:100%; height:188" sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
                                oncelldblclick="DBPopupClick_DR()" oncellclick="RowClick_DR()" onafteredit="RowEditDR()"
                                onselchange="RowClick_DR()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="19">
                            <b>Control Item</b></td>
                        <td align="right">
                            <gw:icon id="btnTreament" img="in" text="Treatment" onclick="OnTreament()" styles="width:100%" />
                        </td>
                    </tr>
                    <tr>
                        <td id="idGridItem" width="100%" colspan="20">
                            <gw:grid id="grdDebit1" header="_pk|Table Name1|Table Name2|Table Name3|Table Name4|Table Name5|Table Name6|Table Name7|Table Name8|Table Name9|Table Name10|Table Name11|Table Name12|Table Name13|Table Name14|Table Name15|Table Name16|Table Name17|Table Name18|Table Name19"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800"
                                styles="width:100%; height:100" sorting="F" oncelldblclick="ClickItemControl()" 
                                autosize='T'/>
                        </td>
                    </tr>
                    <tr>
                        <td width="10%">
                            Ctr.Item<img status="expand" id="img_Credit_ctrl" src="../../../../system/images/down.gif"
                                style="cursor: hand;" onclick="OnToggle(2)" />
                        </td>
                        <td>
                            <a href="#tips">Credit</a></td>
                        <td width="11%" colspan="4">
                            <gw:textbox id="txtsum_chk_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                        </td>
                        <td width="10%" colspan="4">
                            <gw:textbox id="txtsum_chk_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                        </td>
                        <td width="10%" colspan="2" align="center">
                            <a href="#tips">Total</a></td>
                        <td width="16%">
                            <gw:textbox id="txtsum_total_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtsum_total_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnNew_D1r" img="new" alt="New" onclick="OnNewCr()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnSave_Dr1" img="save" alt="Save" onclick="OnSaveCr()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnDel_Dr1" img="delete" alt="Delete" onclick="OnDelCr()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:icon id="btnUp_Dr1" onclick="OnUpDr()"><img src="../../../../system/images/up.gif"/></gw:icon>
                        </td>
                        <td width="3%" align="right">
                            <gw:icon id="btnDown_Dr1" onclick="OnDownDr()"><img src="../../../../system/images/down.gif"/></gw:icon>
                        </td>
                    </tr>
                    <tr>
                        <td id="Credit" width="100%" colspan="20">
                            <gw:grid id="grdCredit" header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|_Tmp Rate"
                                format="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0" aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|0"
                                defaults="||||||VND||||||||||||" editcol="0|0|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|1|0"
                                widths="0|0|250|300|1000|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|0"
                                styles="width:100%; height:188" sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
                                oncelldblclick="DBPopupClick_CR()" oncellclick="RowClick_CR()" onafteredit="RowEditCR()"
                                onselchange="RowClick_CR()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="19">
                            <b>Control Item</b></td>
                        <td align="right">
                            <gw:icon id="btnTreament1" img="in" text="Treatment" onclick="OnTreament1()" styles="width:100%" />
                        </td>
                    </tr>
                    <tr>
                        <td id="Td1" width="100%" colspan="20">
                            <gw:grid id="Credit1" header="_pk|Table Name1|Table Name2|Table Name3|Table Name4|Table Name5|Table Name6|Table Name7|Table Name8|Table Name9|Table Name10|Table Name11|Table Name12|Table Name13|Table Name14|Table Name15|Table Name16|Table Name17|Table Name18|Table Name19"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800|2800"
                                styles="width:100%; height:100" sorting="F" oncelldblclick="ClickItemControl()" 
                                autosize='T'/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <img status="expand" id="imgArrow" src="../../../../system/images/right1.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle(0)" />
</body>
<gw:grid id="grdDebitTMP" header="_pk|Table Name1|Item Code|Item name" format="0|0|0|0" aligns="0|0|0|0" defaults="|||"
    editcol="1|1|1|1" widths="0|2800|0|0" styles="width:100%; height:188" />
<gw:grid id="grdCreditTMP" header="_pk|Table Name1|Item Code|Item name" format="0|0|0|0" aligns="0|0|0|0" defaults="|||"
    editcol="1|1|1|1" widths="0|2800|0|0" styles="width:100%; height:188" />
<gw:textbox id="txtTrTypePK" style="display: none" />
<gw:textbox id="txtMasterPK" style="display: none" />
<gw:list id="lstBookExRate" styles="width:100%;display:none" />
<gw:list id="lstBookExRate1" styles="width:100%;display:none" />
<gw:textbox id="txtCustomerPK" styles="width:100%;display:none" />
<gw:textbox id="txtProposedByUserPk" styles="width:100%;display:none" />
<gw:textbox id="txt_DRCR" styles="width:100%;display:none" />
<gw:textbox id="txtLang" style="display: none" />
<gw:textbox id="txt_drcr_type" style="display: none" />
<gw:textbox id="txt_rowclick" style="display: none" />
<gw:textbox id="txtcur" style="display: none" />
<gw:textbox id="txtacpk" style="display: none" />
<gw:textbox id="txtEACAB032" style="display: none" />
<gw:textbox id="txthgtrd" style="display: none" />
<gw:textbox id="txt_row" style="display: none" />
</html>
