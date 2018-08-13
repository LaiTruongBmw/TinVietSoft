<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>PO Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script language="javascript" >
/*grdPOChecking*/
var G1_pk= 0,
    G1_No = 1,
    G1_Incoterm = 4,
    G1_PO_Type =5,
    G1_PO_Pay_Form =6,
    G1_PO_Pay_Term =7,
    G1_PO_Amt =8,
    G1_Vat_Amt =9,
    G1_Total_Amt =10,
    G1_PO_Status =11,
    G1_PO_Close = 12,
    G1_PO_Closed = 14;
/*grdDetail*/    
var G2_Lot_Qty =3,
    G2_Po_Qty =5,
    G2_Po_TakeIn =6,
    G2_Po_BL_Qty = 7,
    G2_Po_Price =8,
    G2_Po_Amt =9,
    G2_Vat_Amt = 11,
    G2_Item_Status = 15;
    
      function BodyInit()
    {
        System.Translate(document);  // Translate to language session
        
        var ldate, data;
                
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, INITCAP(code_nm)  FROM tco_abcode a, tco_abcodegrp b  WHERE a.tco_abcodegrp_pk = b.pk  AND b.ID = 'COCI0200' AND a.use_if = 1 AND a.del_if = 0 AND b.del_if = 0 ORDER BY code_nm")%>";       
        grdPOChecking.SetComboFormat(G1_Incoterm,data); 
        
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, INITCAP(code_nm)  FROM tco_abcode a, tco_abcodegrp b  WHERE a.tco_abcodegrp_pk = b.pk  AND b.ID = 'COCI0150' AND a.use_if = 1 AND a.del_if = 0 AND b.del_if = 0 ORDER BY code_nm")%>";       
        grdPOChecking.SetComboFormat(G1_PO_Type,data);     

        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, INITCAP(code_nm)  FROM tco_abcode a, tco_abcodegrp b  WHERE a.tco_abcodegrp_pk = b.pk  AND b.ID = 'ACCR0020' AND a.use_if = 1 AND a.del_if = 0 AND b.del_if = 0 ORDER BY code_nm")%>";       
        grdPOChecking.SetComboFormat(G1_PO_Pay_Form,data); 
        
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, INITCAP(code_nm)  FROM tco_abcode a, tco_abcodegrp b  WHERE a.tco_abcodegrp_pk = b.pk  AND b.ID = 'ACCR0140' AND a.use_if = 1 AND a.del_if = 0 AND b.del_if = 0 ORDER BY code_nm")%>";       
        grdPOChecking.SetComboFormat(G1_PO_Pay_Term,data); 
        
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, INITCAP(code_nm)  FROM tco_abcode a, tco_abcodegrp b  WHERE a.tco_abcodegrp_pk = b.pk  AND b.ID = 'PRCP0020' AND a.use_if = 1 AND a.del_if = 0 AND b.del_if = 0 ORDER BY code_nm")%>";       
        grdPOChecking.SetComboFormat(G1_PO_Status,data); 
        
        data = "<%=CtlLib.SetGridColumnDataSQL("select a.CODE,  a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='PRCP0100' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>";       
        grdDetail.SetComboFormat(G2_Item_Status,data); 
   
        BindingDataList();
       
        ldate=dtPOFrom.value;         
        ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;              
        dtPOFrom.value=ldate ; 
        
        grdPOChecking.GetGridControl().FrozenCols = G1_PO_Type;
        grdDetail.GetGridControl().FrozenCols = G2_Po_Qty;
        SetGridFormat();
    }
    //-----------------------------------------------------------------------------------------------------------
    function BindingDataList()
    {   
         var data1 = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>|ALL|Select All";            
         var data2 = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('PRCP0020','','') FROM DUAL")%>|ALL|Select All";  //status
                 
         cboCompany.SetDataText(data1); 
         cboCompany.value="ALL";                 
         cboStatus.SetDataText(data2);
         cboStatus.value="ALL";
    }
    //-----------------------------------------------------------------------------------------------------------
    function onSearch()
    {
        dat_epbp00060.Call("SELECT");
    }
    //-----------------------------------------------------------------------------------------------------------
    function onSave()
    {
        dat_epbp00060.Call("");
    }
    
    function OnDataReceive(obj)
    {
        switch(obj.id)
        {
            case 'dat_epbp00060':
                OnSetOrder(grdPOChecking,G1_No);
            break;
        }
        
    }
    //---------------------------------------------------------------------------------------------------
     function SetGridFormat()
     {
        var ctr = grdPOChecking.GetGridControl(); 
        ctr.ColFormat(G1_PO_Amt) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G1_Vat_Amt) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G1_Total_Amt) = "#,###,###,###,###,###.##";
        
        ctr = grdDetail.GetGridControl(); 
        ctr.ColFormat(G2_Po_Qty) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G2_Po_TakeIn) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G2_Po_BL_Qty) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G2_Po_Price) = "#,###,###,###,###,###.##";
        ctr.ColFormat(G2_Po_Amt) = "#,###,###,###,###,###.##";
     }
    //--------------------------------------------------------------------------------------------------
    function OnGridCellClick()
    {
        txtPOPK.text=grdPOChecking.GetGridData(grdPOChecking.row, G1_pk);
        dat_epbp00060_1.Call('SELECT');
                
      
    }
    function OnEdit()
    {
         if (grdPOChecking.col==G1_PO_Close)
         {
               if((grdPOChecking.GetGridData(grdPOChecking.row,G1_PO_Closed)=='Y')&& (grdPOChecking.GetGridData(grdPOChecking.row,G1_PO_Close)=='0'))
                {
                    
                    alert("This PO is closed in monthly closing! Please check monthly closing again!");
                    grdPOChecking.SetGridData(grdPOChecking.row,G1_PO_Close,-1)
                }
         }
         
    }
        //-------------------------------------------------------------------------
  function openPopup(index)
     {
     
	    var fpath = '';
	    switch(index)
	    {	        
	         
           case 1:// vendor
	            var fpath = System.RootURL + "/standard/formsfp/ab/PopUpGetPartner.aspx?partner_type=AR";
                aValue = System.OpenModal( fpath , 700 , 500, 'resizable:yes;status:yes');
	            if ( aValue != null )
	            {      
	                txtVendor.SetDataText(aValue[2]); 
	                txtVendorPK.SetDataText(aValue[0]);  
	            }	
	       break;	       
	    }
    }
     //---------------------------------------------------------
     function OnToggle()
     {   
        var left  = document.all("bottom");    
        var right = document.all("content");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.height="100%";
            imgArrow.src = "../../../../system/images/up.gif";
        }
        else{
            left.style.display="";
            imgArrow.status = "expand";
            right.style.height="50%"
            imgArrow.src = "../../../../system/images/down.gif";
        }
     }
   function OnSetOrder(grid,col)
   {
      if(grid.rows>1)
      {
        for(var i =1 ; i < grid.rows; i++)
        {
            grid.SetGridText(i,col,i);
         }
      }
   } 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dat_epbp00060"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso id="1" type="grid" parameter="0,12" function="st_lg_sel_epbp00060"   procedure="st_lg_upd_epbp00060"> 
                    <input bind="grdPOChecking">                    
                        <input bind="cboCompany" /> 
                        <input bind="txtVendor" /> 
                        <input bind="cboStatus" /> 
                        <input bind="dtPOFrom" /> 
                        <input bind="dtPOTo" /> 
                        <input bind="txtPONoSearch" /> 
                        <input bind="txtItem" /> 
                    </input> 
                    <output bind="grdPOChecking" /> 
                </dso> 
            </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <gw:data id="dat_epbp00060_1"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso id="1" type="grid" parameter="0,12" function="st_lg_sel_epbp00060_1"> 
                    <input bind="grdDetail">                    
                        <input bind="txtPOPK" /> 
                    </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">   
        <table border=1 width="100%" height="100%">
            <tr height="10%">
                <td>
                    <table border=0 cellpadding=0 cellspacing=0>
                        <tr>
                            <td width="7%">Company</td>
                            <td width="25%" colspan ="3"><gw:list id="cboCompany" styles="width:98%;"></gw:list></td>
                            <td width="5%"><a title="Click here to select Vendor" onclick="openPopup(1)" href="#tips" style="text-decoration : none; color=#0000FF"><b>Vendor</b></a></td>
                            <td width="1%"></td>
                            <td width="30%"><gw:textbox id="txtVendor" styles="width:100%;" csstype="filter" onenterkey=""/><gw:textbox id="txtVendorPK" styles="display=none" /></td>
                            <td width="1%"></td>
                            <td width="4%">Status</td>
                            <td width="1%"></td>
                            <td width="20%"><gw:list id="cboStatus" styles="width:100%;" onchange="" ></gw:list></td>                            
                            <td width="5%"></td>
                            <td width="1%"><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" /></td>
                            <td width="1%"><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;P/O Date</td>
                            <td width="8%"><gw:datebox id="dtPOFrom" lang="1" csstype="filter"/></td>
                            <td width="3%">~</td>
                            <td width="14%" ><gw:datebox id="dtPOTo" lang="1" csstype="filter"/></td>
                            <td >P/O No</td>
                            <td></td>
                            <td ><gw:textbox id="txtPONoSearch" csstype="filter" styles="width:100%;" /></td>
                            <td></td>
                            <td >Item</td>
                            <td></td>
                            <td colspan="4"><gw:textbox id="txtItem" csstype="filter" styles="width:100%;" /></td>   
                        </tr>    
                             
                    </table>
                </td>
            </tr> 
            <tr id="content" valign=top height="50%">
                <td>
                    <gw:grid id='grdPOChecking'
                        header='_PK|NO|PARTNER NAME|PO NO|INCOTERM|PO TYPE|PAYMENT FORM|PAYMENT TERM|PO AMT|VAT AMT|TOTAL AMT|PO STATUS|PO CLOSE YN|DESCRIPTION|_CLOSE_YN'
                        format='0|0|0|0|2|2|2|2|0|0|0|2|3|0|0'
                        aligns='0|1|0|1|0|1|0|0|3|3|3|0|0|0|0'
                        defaults='||||||||||||||'
                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|1|0'
                        widths='0|500|2500|1400|2500|1500|1800|2000|1600|1400|1800|2000|1200|2000|0'
                        sorting='T'
                        styles='width:100%; height:100%'
                        oncellclick='OnGridCellClick()'
                        onafteredit='OnEdit()'
                        />
                </td>
            </tr>
            <tr style="height:2%">
            <td>
                <img status="expand" id="imgArrow" src="../../../../system/images/down.gif" style="cursor:hand;" onclick="OnToggle()"  />  PO Details
            </td>
            </tr>
            <tr id="bottom" valign=top height="38%">
                <td colspan="10">
                    <gw:grid id="grdDetail"
                        header="ITEM CODE|ITEM NAME|PUR LOT|LOT QTY|UNIT|PO QTY|TAKE IN QTY|BL QTY|ITEM PRICE|PO AMT|VAT RATE(%)|VAT AMT|ETD DATE|ETA DATE|DESCRIPTION|ITEM STATUS"
                        format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                        aligns="0|0|0|0|1|3|3|3|3|3|3|3|0|0|0|0"
                        defaults="|||||||||||||||"
                        editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                        widths="1300|3200|1000|1100|1000|1000|1000|1000|1500|1600|1300|1000|1000|1000|2500|1000"
                        sorting='T'
                        styles='width:100%; height:100%'
                        />
                </td>
            </tr> 
        </table>
        
    </form>
</body>
</html>
<gw:textbox id="txtPOPK" text= '' style="display:none"></gw:textbox>
