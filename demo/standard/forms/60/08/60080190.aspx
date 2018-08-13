
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Expense PL Unit</title>
	
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    txtLang.text="<%=Session("SESSION_LANG") %>"; 
    BindingData(); 
   System.Translate(document); 
	txtUser_Pk.text = g_user_pk;
	dso_getCompany.Call();
  
}
//------------------------------------------------------------------------
function BindingData()
{
        
    var ls_data = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    lstCompany.SetDataText(ls_data);
   lstCompany.value="<%=session("company_pk") %>"; 
    txtACCD.SetEnable(false);
    txtACNM.SetEnable(false);
    txtPLC_CD.SetEnable(false);
    txtPLC_NM.SetEnable(false);
    txtPLCD.SetEnable(false);
    txtPLNM.SetEnable(false);
   var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstBookCcy.SetDataText(ls_data3);
    lstReportType.SetDataText(ls_data2);
    MergeGridPL();
    MergeGridAccd(); 
    MergeGridPLCenter(); 
    //dtTranFrom.value='20090101';
    //lstCompany.value='2';

}
//------------------------------------------------------------------------

function OnResetAccount()
{
	txtACPK.text ='';
	txtACCD.text ='';
	txtACNM.text ='';
}

function OnResetPLCenter()
{
	txtPLC_PK.text ='';
	txtPLC_CD.text ='';
	txtPLC_NM.text ='';
}

function OnResetPLUnit()
{
	txtPLPK.text ='';
	txtPLCD.text ='';
	txtPLNM.text ='';
}
    
function OnPopUp(pname)
{
    if (pname=='ACCT')
   {
         var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_SEL_60080190_ACCD_PL";
	var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtACPK.SetDataText(object[3]);
        txtACCD.SetDataText(object[0]);
        txtACNM.SetDataText(object[1]);
    }
   }
    if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_gfka00220_1.Call();
                }            
            }        
   }
    if (pname=='PL')
   {
          
          var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plunit.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                   txtPLPK.text=object;     // Center PK
                    dat_gfka00220_2.Call();
                }            
            }    
   }
    
}

function onDataErr(ojb)
{
    alert("Error at " +ojb.id);
}

function OnSearch()
{
   if ((txtACPK.text =="") && (txtPLPK.text=="") && (txtPLC_PK.text==""))
   {
        
        alert("Please choose An Account or PL or PL Center!")
   }
   else
   {
        datExpenseTabPL.Call("SELECT");
   } 
   
   
  
}

function onDataRec(obj)
{
    switch (obj.id)
   {
        case "datExpenseTabPL":
                for(i=1;i<grdPLTab.rows;i++)
               {
                    grdPLTab.SetGridText(i,0,i);
               } 
               //grdPLTab.Subtotal (0,2 ,'3', '8!9!10!11','','','3','troi oi','','',true);
               grdPLTab.Subtotal (0,2 ,4, '10!11!12!13!14!15!16!17!18!19!20!21!22','',true,4,'Total');
               grdPLTab.Subtotal (0,2 ,'-1', '10!11!12!13!14!15!16!17!18!19!20!21!22');
               for(i=2;i<grdPLTab.rows;i++)
               {
                    if (grdPLTab.GetGridData(i,0)==grdPLTab.GetGridData(i-1,0))
                    {
                        grdPLTab.SetGridText(i,0,"");
                        grdPLTab.SetCellBgColor(i,0,i,4,0xabcdef);
                    }
               }
               datExpenseAccountCode.Call("SELECT");
        break;
        case "datExpenseAccountCode":
                for(i=1;i<grdPLAccd.rows;i++)
               {
                    grdPLAccd.SetGridText(i,0,i);
               } 
               grdPLAccd.Subtotal (0,2 ,4, '10!11!12!13!14!15!16!17!18!19!20!21!22','',true,4,'Total');
               grdPLAccd.Subtotal (0,2 ,'-1', '10!11!12!13!14!15!16!17!18!19!20!21!22');
               for(i=2;i<grdPLAccd.rows;i++)
               {
                    if (grdPLAccd.GetGridData(i,0)==grdPLAccd.GetGridData(i-1,0))
                    {
                        grdPLAccd.SetGridText(i,0,"");
                        grdPLAccd.SetCellBgColor(i,0,i,4,0xabcdef);
                    }
               }
            datExpensePLCenter.Call("SELECT");
            break;
        case "datExpensePLCenter": 
            for(i=1;i<grdPLCenter.rows;i++)
               {
                    grdPLCenter.SetGridText(i,0,i);
               } 
               //grdPLTab.Subtotal (0,2 ,'3', '8!9!10!11','','','3','troi oi','','',true);
               grdPLCenter.Subtotal (0,2 ,4, '10!11!12!13!14!15!16!17!18!19!20!21!22','',true,4,'Total');
               grdPLCenter.Subtotal (0,2 ,'-1', '10!11!12!13!14!15!16!17!18!19!20!21!22');
               for(i=2;i<grdPLCenter.rows;i++)
               {
                    if (grdPLCenter.GetGridData(i,0)==grdPLCenter.GetGridData(i-1,0))
                    {
                        grdPLCenter.SetGridText(i,0,"");
                        grdPLCenter.SetCellBgColor(i,0,i,4,0xabcdef);
                    }
               }
            break;
        
   } 
}
function MergeGridPL()
{
/*
    if(grdPLTab.rows <2)
   {
        grdPLTab.AddRow();
   } 
   */
    var fg=grdPLTab.GetGridControl();
    fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.FrozenCols = 6;
	fg.Cell(0, 0, 0, 0, 0) = "No";  
	fg.Cell(0, 0, 4, 0, 4) = "P/L Unit Code";  
	fg.Cell(0, 0, 5, 0, 5) = "P/L Unit Name";  
	fg.Cell(0, 0, 6, 0, 6) = "P/L Center Code";  
	fg.Cell(0, 0, 7, 0, 7) = "P/L Center Name";  
	fg.Cell(0, 0, 8, 0, 8) = "Account Code";  
	fg.Cell(0, 0, 9, 0, 9) = "Account Name";  
	fg.Cell(0, 0, 10, 0, 10) = "Accumulate";  
	fg.Cell(0, 0, 11, 0, 11) = "Jan";  
	
	fg.Cell(0, 0, 12, 0, 12) = "Feb";  
	fg.Cell(0, 0, 13, 0, 13) = "Mar";  
	fg.Cell(0, 0, 14, 0, 14) = "Apr";  
	fg.Cell(0, 0, 15, 0, 15) = "May";  
	fg.Cell(0, 0, 16, 0, 16) = "Jun";  
	fg.Cell(0, 0, 17, 0, 17) = "Jul";  
	fg.Cell(0, 0, 18, 0, 18) = "Aug";  
	fg.Cell(0, 0, 19, 0, 19) = "Sep";  
	fg.Cell(0, 0, 20, 0, 20) = "Oct";  
	fg.Cell(0, 0, 21, 0, 21) = "Nov";  
	fg.Cell(0, 0, 22, 0, 22) = "Dec";  
	
	
	
	fg.ColWidth(0)=500;
	fg.ColWidth(1)=0;
	fg.ColWidth(2)=0;
	fg.ColWidth(3)=0;
	fg.ColWidth(4)=1800;
	fg.ColWidth(5)=1800;
	fg.ColWidth(6)=1800;
	fg.ColWidth(7)=1800;
	fg.ColWidth(8)=1800;
	fg.ColWidth(9)=1800;
	
	fg.ColWidth(10)=1500;
	fg.ColWidth(11)=1500;
	fg.ColWidth(12)=1500;
	fg.ColWidth(13)=1500;
	fg.ColWidth(14)=1500;
	fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	fg.ColWidth(17)=1500;
	fg.ColWidth(18)=1500;
	fg.ColWidth(19)=1500;
	fg.ColWidth(20)=1500;
	fg.ColWidth(21)=1500;
	fg.ColWidth(22)=1500;
	
    fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	fg.ColAlignment(17) = flexAlignRightCenter;
	fg.ColAlignment(18) = flexAlignRightCenter;
	fg.ColAlignment(19) = flexAlignRightCenter;
	fg.ColAlignment(20) = flexAlignRightCenter;
	fg.ColAlignment(21) = flexAlignRightCenter;
	fg.ColAlignment(22) = flexAlignRightCenter;
    
   if (lstBookCcy.value=="VND")
	{
	    fg.ColFormat(10) = "#,###,###,###,###";
	    fg.ColFormat(11) = "#,###,###,###,###";
	    fg.ColFormat(12) = "#,###,###,###,###";
	    fg.ColFormat(13) = "#,###,###,###,###";
	    fg.ColFormat(14) = "#,###,###,###,###";
	    fg.ColFormat(15) = "#,###,###,###,###";
	    fg.ColFormat(16) = "#,###,###,###,###";
	    fg.ColFormat(17) = "#,###,###,###,###";
	    fg.ColFormat(18) = "#,###,###,###,###";
	    fg.ColFormat(19) = "#,###,###,###,###";
	    fg.ColFormat(20) = "#,###,###,###,###";
	    fg.ColFormat(21) = "#,###,###,###,###";
	    fg.ColFormat(22) = "#,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(10) = "#,###,###,###,###.##";
	    fg.ColFormat(11) = "#,###,###,###,###.##";
	    fg.ColFormat(12) = "#,###,###,###,###.##";
	    fg.ColFormat(13) = "#,###,###,###,###.##";
	    fg.ColFormat(14) = "#,###,###,###,###.##";
	    fg.ColFormat(15) = "#,###,###,###,###.##";
	    fg.ColFormat(16) = "#,###,###,###,###.##";
	    fg.ColFormat(17) = "#,###,###,###,###.##";
	    fg.ColFormat(18) = "#,###,###,###,###.##";
	    fg.ColFormat(19) = "#,###,###,###,###.##";
	    fg.ColFormat(20) = "#,###,###,###,###.##";
	    fg.ColFormat(21) = "#,###,###,###,###.##";
	    fg.ColFormat(22) = "#,###,###,###,###.##";
	} 
	
	
}

function MergeGridAccd()
{
/*
    if(grdPLTab.rows <2)
   {
        grdPLTab.AddRow();
   } 
   */
    var fg=grdPLAccd.GetGridControl();
    fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.FrozenCols = 6;
	fg.Cell(0, 0, 0, 0, 0) = "No";  
	fg.Cell(0, 0, 4, 0, 4) = "Account Code";  
	fg.Cell(0, 0, 5, 0, 5) = "Account Name";  
	fg.Cell(0, 0, 6, 0, 6) = "P/L Unit Code";  
	fg.Cell(0, 0, 7, 0, 7) = "P/L Unit Name";  
	fg.Cell(0, 0, 8, 0, 8) = "P/L Center Code";  
	fg.Cell(0, 0, 9, 0, 9) = "P/L Center Name";  
	fg.Cell(0, 0, 10, 0, 10) = "Accumulate";  
	fg.Cell(0, 0, 11, 0, 11) = "Jan";  
	
	fg.Cell(0, 0, 12, 0, 12) = "Feb";  
	fg.Cell(0, 0, 13, 0, 13) = "Mar";  
	fg.Cell(0, 0, 14, 0, 14) = "Apr";  
	fg.Cell(0, 0, 15, 0, 15) = "May";  
	fg.Cell(0, 0, 16, 0, 16) = "Jun";  
	fg.Cell(0, 0, 17, 0, 17) = "Jul";  
	fg.Cell(0, 0, 18, 0, 18) = "Aug";  
	fg.Cell(0, 0, 19, 0, 19) = "Sep";  
	fg.Cell(0, 0, 20, 0, 20) = "Oct";  
	fg.Cell(0, 0, 21, 0, 21) = "Nov";  
	fg.Cell(0, 0, 22, 0, 22) = "Dec";  
	
	
	
	fg.ColWidth(0)=500;
	fg.ColWidth(1)=0;
	fg.ColWidth(2)=0;
	fg.ColWidth(3)=0;
	fg.ColWidth(4)=1800;
	fg.ColWidth(5)=1800;
	fg.ColWidth(6)=1800;
	fg.ColWidth(7)=1800;
	fg.ColWidth(8)=1800;
	fg.ColWidth(9)=1800;
	
	fg.ColWidth(10)=1500;
	fg.ColWidth(11)=1500;
	fg.ColWidth(12)=1500;
	fg.ColWidth(13)=1500;
	fg.ColWidth(14)=1500;
	fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	fg.ColWidth(17)=1500;
	fg.ColWidth(18)=1500;
	fg.ColWidth(19)=1500;
	fg.ColWidth(20)=1500;
	fg.ColWidth(21)=1500;
	fg.ColWidth(22)=1500;
	
    fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	fg.ColAlignment(17) = flexAlignRightCenter;
	fg.ColAlignment(18) = flexAlignRightCenter;
	fg.ColAlignment(19) = flexAlignRightCenter;
	fg.ColAlignment(20) = flexAlignRightCenter;
	fg.ColAlignment(21) = flexAlignRightCenter;
	fg.ColAlignment(22) = flexAlignRightCenter;
    
   if (lstBookCcy.value=="VND")
	{
	    fg.ColFormat(10) = "#,###,###,###,###";
	    fg.ColFormat(11) = "#,###,###,###,###";
	    fg.ColFormat(12) = "#,###,###,###,###";
	    fg.ColFormat(13) = "#,###,###,###,###";
	    fg.ColFormat(14) = "#,###,###,###,###";
	    fg.ColFormat(15) = "#,###,###,###,###";
	    fg.ColFormat(16) = "#,###,###,###,###";
	    fg.ColFormat(17) = "#,###,###,###,###";
	    fg.ColFormat(18) = "#,###,###,###,###";
	    fg.ColFormat(19) = "#,###,###,###,###";
	    fg.ColFormat(20) = "#,###,###,###,###";
	    fg.ColFormat(21) = "#,###,###,###,###";
	    fg.ColFormat(22) = "#,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(10) = "#,###,###,###,###.##";
	    fg.ColFormat(11) = "#,###,###,###,###.##";
	    fg.ColFormat(12) = "#,###,###,###,###.##";
	    fg.ColFormat(13) = "#,###,###,###,###.##";
	    fg.ColFormat(14) = "#,###,###,###,###.##";
	    fg.ColFormat(15) = "#,###,###,###,###.##";
	    fg.ColFormat(16) = "#,###,###,###,###.##";
	    fg.ColFormat(17) = "#,###,###,###,###.##";
	    fg.ColFormat(18) = "#,###,###,###,###.##";
	    fg.ColFormat(19) = "#,###,###,###,###.##";
	    fg.ColFormat(20) = "#,###,###,###,###.##";
	    fg.ColFormat(21) = "#,###,###,###,###.##";
	    fg.ColFormat(22) = "#,###,###,###,###.##";
	} 
	
	
}

function MergeGridPLCenter()
{
/*
    if(grdPLTab.rows <2)
   {
        grdPLTab.AddRow();
   } 
   */
    var fg=grdPLCenter.GetGridControl();
    fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.FrozenCols = 6;
	fg.Cell(0, 0, 0, 0, 0) = "No";  
	fg.Cell(0, 0, 4, 0, 4) = "P/L Center Code";  
	fg.Cell(0, 0, 5, 0, 5) = "P/L Center Name";  
	fg.Cell(0, 0, 6, 0, 6) = "P/L Unit Code";  
	fg.Cell(0, 0, 7, 0, 7) = "P/L Unit Name";  
	fg.Cell(0, 0, 8, 0, 8) = "Account Code";  
	fg.Cell(0, 0,9, 0, 9) = "Account Name";  
	fg.Cell(0, 0, 10, 0, 10) = "Accumulate";  
	fg.Cell(0, 0, 11, 0, 11) = "Jan";  
	
	fg.Cell(0, 0, 12, 0, 12) = "Feb";  
	fg.Cell(0, 0, 13, 0, 13) = "Mar";  
	fg.Cell(0, 0, 14, 0, 14) = "Apr";  
	fg.Cell(0, 0, 15, 0, 15) = "May";  
	fg.Cell(0, 0, 16, 0, 16) = "Jun";  
	fg.Cell(0, 0, 17, 0, 17) = "Jul";  
	fg.Cell(0, 0, 18, 0, 18) = "Aug";  
	fg.Cell(0, 0, 19, 0, 19) = "Sep";  
	fg.Cell(0, 0, 20, 0, 20) = "Oct";  
	fg.Cell(0, 0, 21, 0, 21) = "Nov";  
	fg.Cell(0, 0, 22, 0, 22) = "Dec";  
	
	
	
	fg.ColWidth(0)=500;
	fg.ColWidth(1)=0;
	fg.ColWidth(2)=0;
	fg.ColWidth(3)=0;
	fg.ColWidth(4)=1800;
	fg.ColWidth(5)=1800;
	fg.ColWidth(6)=1800;
	fg.ColWidth(7)=1800;
	fg.ColWidth(8)=1800;
	fg.ColWidth(9)=1800;
	
	fg.ColWidth(10)=1500;
	fg.ColWidth(11)=1500;
	fg.ColWidth(12)=1500;
	fg.ColWidth(13)=1500;
	fg.ColWidth(14)=1500;
	fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	fg.ColWidth(17)=1500;
	fg.ColWidth(18)=1500;
	fg.ColWidth(19)=1500;
	fg.ColWidth(20)=1500;
	fg.ColWidth(21)=1500;
	fg.ColWidth(22)=1500;
	
    fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	fg.ColAlignment(17) = flexAlignRightCenter;
	fg.ColAlignment(18) = flexAlignRightCenter;
	fg.ColAlignment(19) = flexAlignRightCenter;
	fg.ColAlignment(20) = flexAlignRightCenter;
	fg.ColAlignment(21) = flexAlignRightCenter;
	fg.ColAlignment(22) = flexAlignRightCenter;
    
   if (lstBookCcy.value=="VND")
	{
	    fg.ColFormat(10) = "#,###,###,###,###";
	    fg.ColFormat(11) = "#,###,###,###,###";
	    fg.ColFormat(12) = "#,###,###,###,###";
	    fg.ColFormat(13) = "#,###,###,###,###";
	    fg.ColFormat(14) = "#,###,###,###,###";
	    fg.ColFormat(15) = "#,###,###,###,###";
	    fg.ColFormat(16) = "#,###,###,###,###";
	    fg.ColFormat(17) = "#,###,###,###,###";
	    fg.ColFormat(18) = "#,###,###,###,###";
	    fg.ColFormat(19) = "#,###,###,###,###";
	    fg.ColFormat(20) = "#,###,###,###,###";
	    fg.ColFormat(21) = "#,###,###,###,###";
	    fg.ColFormat(22) = "#,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(10) = "#,###,###,###,###.##";
	    fg.ColFormat(11) = "#,###,###,###,###.##";
	    fg.ColFormat(12) = "#,###,###,###,###.##";
	    fg.ColFormat(13) = "#,###,###,###,###.##";
	    fg.ColFormat(14) = "#,###,###,###,###.##";
	    fg.ColFormat(15) = "#,###,###,###,###.##";
	    fg.ColFormat(16) = "#,###,###,###,###.##";
	    fg.ColFormat(17) = "#,###,###,###,###.##";
	    fg.ColFormat(18) = "#,###,###,###,###.##";
	    fg.ColFormat(19) = "#,###,###,###,###.##";
	    fg.ColFormat(20) = "#,###,###,###,###.##";
	    fg.ColFormat(21) = "#,###,###,###,###.##";
	    fg.ColFormat(22) = "#,###,###,###,###.##";
	} 
	
}

function onGetTab()
{
    
}
function OnPrint()
{
  
    

//    if ((txtACPK.text =="") && (txtPLPK.text=="") && (txtPLC_PK.text==""))
//   {
//        alert("Please choose An Account or PL or PL Center!");
//        return;     
//   }
   //url =System.RootURL +"/standard/reports/gf/ka/gfka00220.aspx?p_company=" +lstCompany.value ";
    var obj = lstReportType.value;
   
    switch (obj)
    {
        case "10" :
            if(Trim(txtPLPK.text) == "")
            {
                alert("Please choose the PL!!");
                return false;
            }

            var url = System.RootURL + "/standard/reports/gf/ka/gfka00220.aspx?p_tco_company_pk=" +lstCompany.value + "&p_tr_date=" + dtbMonth.value + "&p_status=" + rdoSlipStatus.value + "&p_ac_pk=" + txtACPK.text + "&p_tac_abcenter_pk=" + txtPLC_PK.text + "&p_tac_abpl_pk="+txtPLPK.text+"&p_lang=" + txtLang.text;
            System.OpenTargetPage(url);                    
        break;
        case "20":
            if(Trim(txtACPK.text) == "")
            {
                alert("Please choose the Account code!!");
                return false;
            }
            var url = System.RootURL + "/standard/reports/gf/ka/gfka00220_1.aspx?p_tco_company_pk=" +lstCompany.value + "&p_tr_date=" + dtbMonth.value + "&p_status=" + rdoSlipStatus.value + "&p_ac_pk=" + txtACPK.text + "&p_tac_abcenter_pk=" + txtPLC_PK.text + "&p_tac_abpl_pk="+txtPLPK.text+"&p_lang=" + txtLang.text;
            System.OpenTargetPage(url);                    
        break ;
        case "30" :
        if(Trim(txtPLC_PK.text) == "")
            {
                alert("Please choose the PL Center!!");
                return false;
            }
             var url = System.RootURL + "/standard/reports/gf/ka/gfka00220_2.aspx?p_tco_company_pk=" +lstCompany.value + "&p_tr_date=" + dtbMonth.value + "&p_status=" + rdoSlipStatus.value + "&p_ac_pk=" + txtACPK.text + "&p_tac_abcenter_pk=" + txtPLC_PK.text + "&p_tac_abpl_pk="+txtPLPK.text+"&p_lang=" + txtLang.text;
            System.OpenTargetPage(url);                    
        break ;

    }   
}
</script>

<body style="margin: 0; padding: 0;">
<gw:data id="dso_getCompany" onreceive=""> 
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

<gw:data id="datExpenseTabPL" onreceive="onDataRec(this)" onerror="onDataErr(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080190_exp_plunit_pl">
                <input bind="grdPLTab">
                    <input bind="lstCompany"/>
                    <input bind="dtbMonth"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdPLTab"/>
            </dso>
        </xml>
    </gw:data>
   <gw:data id="datExpenseAccountCode" onreceive="onDataRec(this)" onerror="onDataErr(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080190_exp_plunit_acc">
                <input bind="grdPLAccd">
                    <input bind="lstCompany"/>
                    <input bind="dtbMonth"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdPLAccd"/>
            </dso>
        </xml>
    </gw:data> 
   <gw:data id="datExpensePLCenter" onreceive="onDataRec(this)" onerror="onDataErr(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080190_exp_plunit">
                <input bind="grdPLCenter">
                    <input bind="lstCompany"/>
                    <input bind="dtbMonth"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdPLCenter"/>
            </dso>
        </xml>
    </gw:data> 
   <!------------------------------------------------------------------------> 

   <gw:data id="dat_gfka00220_1" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190"  > 
                <input>
                    <input bind="txtPLC_PK" />
                </input> 
                <output>
                    <output bind="txtPLC_CD" />
                    <output bind="txtPLC_NM" />
                </output>
            </dso> 
        </xml> 
   </gw:data><!------------------------------------------------------------------------> 
  
   <gw:data id="dat_gfka00220_2" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190_2"  > 
                <input>
                    <input bind="txtPLPK" />
                </input> 
                <output>
                    <output bind="txtPLCD" />
                    <output bind="txtPLNM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
 <!------------------------------------------>
    <table style="width:100%;height:100% " border="0" cellpadding="0" cellspacing="0" >
    <tr height='6%' >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                    <td width="10%"></td>
                    <td width="11%"></td>
                    <td width="2%"></td>
                    <td  width="11%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="20%"></td>
                    <td width="2%"></td>
                    <td width="6%"></td>
                    <td width="18%"></td>
                    <td width="2%"></td>
                </tr>
                <tr >
                    <td align="right" >Company</td>
                    <td  colspan="3" >
                        <gw:list id="lstCompany" styles="width:100%" />
                    </td>
                    <td align="right" ><a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">Account Code</a>&nbsp;</td>
                    <td  >
                        <gw:textbox id="txtACCD" text="" styles="width:100%" />
                    </td>
                    <td >
                        <gw:textbox id="txtACNM" text="" styles="width:100%" />
                    </td>
                    <td align="right"><gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="OnResetAccount()" /></td>
                    <td colspan="2"></td>                    
                    <td align="right"><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
                </tr>
                <tr>
                    <td align="right" >Month</td> 
                    <td colspan="3"><gw:datebox  id="dtbMonth" lang="1" type="month" onchange='OnSearch()' /></td>
                   <td align="right" styles="width: 100%"><a title="Click here to select PL Center" onclick="OnPopUp('CENTER')" href="#tips">PL Center</a>&nbsp;</td>
                    <td > <gw:textbox id="txtPLC_CD" text="" styles="width:100%" /></td>
                    <td ><gw:textbox id="txtPLC_NM" text="" styles="width:100%" /></td>
                    <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="OnResetPLCenter()" /></td> 
                    <td align="right" >Report</td>                    
                    <td ><gw:list id="lstReportType" styles="width:100%" /></td>            
                    <td align="right"><gw:imgbtn img="printer" alt="Print" id="btnPrint" onclick="OnPrint()" /></td>           
                </tr>
               <tr>
                    <td  align="right" >Slip Status</td>
                    <td colspan="3"> <gw:radio id="rdoSlipStatus"  value="0" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                   </td>
                   <td align="right" ><a title="Click here to select PL Unit" onclick="OnPopUp('PL')" href="#tips">PL Unit</a>&nbsp;</td>
                    <td  >
                        <gw:textbox id="txtPLCD" text="" styles="width:100%" />
                    </td>
                    <td >
                        <gw:textbox id="txtPLNM" text="" styles="width:100%" />
                    </td>
                    <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLUnit" onclick="OnResetPLUnit()" /></td>
                    <td colspan="3"></td>
               </tr> 
            </table>            
        </td>                     
    </tr>        
<tr height='94%'  valign="top">
    <td>
        <gw:tab id="idTab_Child" onpageactivate="onGetTab()">
                    <table name="PL"  cellspacing='0' cellpadding='0' border='0'  width="100%" height='100%'>
                        <tr>
                            <td >
                                <gw:grid id='grdPLTab'
header='STT|TAC_ABACCTCODE_PK|TAC_ABPL_PK|TAC_ABCENTER_PK|PL_CD|PL_NM|PLC_CD|PLC_NM|AC_CD|AC_NM|AMT_ACCUM|JAN_AMT|FEB_AMT|MAR_AMT|APR_AMT|MAY_AMT|JUN_AMT|JUL_AMT|AUG_AMT|SEP_AMT|OCT_AMT|NOV_AMT|DEC_AMT'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3'
defaults='||||||||||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='F'
styles='width:100%; height:100%'
/>
                            </td>
                        </tr>
                    </table>
                    
                    <table name="Account Code"  cellspacing='0' cellpadding='0' border='0' height='100%' width="100%">
                        <tr>
                            <td >
                                <gw:grid id='grdPLAccd'
header='STT|TAC_ABACCTCODE_PK|TAC_ABPL_PK|TAC_ABCENTER_PK|AC_CD|AC_NM|PL_CD|PL_NM|PLC_CD|PLC_NM|AMT_ACCUM|JAN_AMT|FEB_AMT|MAR_AMT|APR_AMT|MAY_AMT|JUN_AMT|JUL_AMT|AUG_AMT|SEP_AMT|OCT_AMT|NOV_AMT|DEC_AMT'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|2|2|2|2|2|2|2|2|2|2|2|2|2'
defaults='||||||||||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='F'
styles='width:100%; height:100%'
/>
                            </td>
                        </tr>
                    </table>
                    
                     <table name="PL Center"  cellspacing='0' cellpadding='0' border='0' height='100%' width="100%">
                        <tr>
                            <td >
                                <gw:grid id='grdPLCenter'
header='STT|TAC_ABACCTCODE_PK|TAC_ABPL_PK|TAC_ABCENTER_PK|PLC_CD|PLC_NM|PL_CD|PL_NM|AC_CD|AC_NM|AMT_ACCUM|JAN_AMT|FEB_AMT|MAR_AMT|APR_AMT|MAY_AMT|JUN_AMT|JUL_AMT|AUG_AMT|SEP_AMT|OCT_AMT|NOV_AMT|DEC_AMT'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|2|2|2|2|2|2|2|2|2|2|2|2|2'
defaults='||||||||||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='F'
styles='width:100%; height:100%'
/>
                            </td>
                        </tr>
                    </table>
                    
                    </gw:tab>
    </td>
</tr>
</table>            

<gw:textbox id="txtACPK" styles="display:none; " />
<gw:textbox id="txtPLPK" styles="display:none; " />
<gw:textbox id="txtPLC_PK" styles="display:none; " />
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtLang" styles="display:none; " text="<%=Session("SESSION_LANG") %>"/>
<gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
</body>
</html>
