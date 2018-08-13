<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SALE ORDER ENTRY</title>
</head>
<script type="text/javascript">

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	
    var arr_FormatNumber = new Array();     
    
	var G1_MASTER_PK			= 0;
	    
    var G2_DETAIL_PK            = 0,   
        G2_MASTER_PK            = 1,   
        G2_SO_ITEM_NO           = 2,   
        G2_SEQ_NUM              = 3,   
        G2_ITEM_PK              = 4,   
        G2_ITEM_CODE            = 5,   
        G2_ITEM_NAME            = 6,          
        G2_CUST_ITEM         	= 7,   
        G2_ST_QTY               = 8,   
        G2_ST_UOM               = 9, 
        G2_ORD_UNIT             = 10,   
        G2_ORD_QTY              = 11,   
        G2_ORD_UOM              = 12,   
        G2_LOT_UNIT             = 13,   
        G2_LOT_QTY              = 14,   
        G2_LOT_UOM              = 15,   
        G2_UNIT_PRICE           = 16, 
		G2_ITEM_AMOUNT			= 17,
		G2_TAX_AMOUNT  			= 18,
        G2_TOTAL_AMOUNT         = 19,   
        G2_ITEM_ETD             = 20,   
        G2_ITEM_ETA             = 21,           
        G2_REMARK               = 22;
		
 var t_view = 'false';       
 //============================================================================

 //===================================================================================
 function BodyInit()
 {
      System.Translate(document); 
      txtEmp_PK.text="<%=Session("EMPLOYEE_PK")%>";
       var left  = document.all("left");    
        var right  = document.all("right"); 
        left.style.display="none";     
        right.style.width="100%";
      dtOrderDate.SetEnable(false);
      txtSoNo.SetEnable(false);
      txtStyleID.SetEnable(false);
      txtStyleName.SetEnable(false);
      txtDeliToCode.SetEnable(false);
      txtDeliToName.SetEnable(false);
      txtBillToCode.SetEnable(false);
      txtBillToName.SetEnable(false);
      txtDeliLocName.SetEnable(false);
      lstExNation.SetEnable(false);
      lstDestNation.SetEnable(false);
      txtPONum.SetEnable(false);
      lstExPort.SetEnable(false);
      lstDestPort.SetEnable(false);
      dtPODate.SetEnable(false);
      lstOrderType.SetEnable(false);
      lstPriceType.SetEnable(false);
      txtEmpCode.SetEnable(false);
      txtEmpName.SetEnable(false);
      txtOrdAmt.SetEnable(false);
      lstPaymentMethod.SetEnable(false);
      txtSaleRep.SetEnable(false);
      txtTaxAmt.SetEnable(false);
      lstPaymentTerm.SetEnable(false);
      txtBuyReq.SetEnable(false);
      txtTotalAmt.SetEnable(false);
      lstTaxRate.SetEnable(false);
      lstCurrency.SetEnable(false);
      txtExchangeRate.SetEnable(false);
      lstOrdPriority.SetEnable(false);
      txtAtt01.SetEnable(false);
      lstProductionType.SetEnable(false);
      txtAtt02.SetEnable(false);
      lstStockType.SetEnable(false);
      
      txtAtt03.SetEnable(false);
      txtRemark.SetEnable(false);
      txtAtt04.SetEnable(false);
      dtETD.SetEnable(false);
      dtETA.SetEnable(false);
      lstDeliMethod.SetEnable(false);
      lstDeliTerm.SetEnable(false);
	  //-----------------------------
      OnChangeTab();
      //-----------------------------       
      FormatGrid();  
      //-----------------------------  
	  //AddOnClick('Master');

	  txtMasterPK.text = "<%=Request.querystring("SO_pk")%>";
      var _btnAction = "<%=Request.querystring("BtnAction")%>";
  
      if(_btnAction == 'POConfirm')
      {
        btnApprove.style.display = '';
      }
      else
      {
        btnApprove.style.display = 'none';
      }
      if(_btnAction == 'POApprove')
      {
        btnCancel.style.display = '';
       }
       else
       {
        btnCancel.style.display = 'none';
       }
      OnChangeTab();   
      grd_order_master.Call('SELECT');
 }

  //==========================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat(G2_ST_QTY )     = "###,###,###,###,###";
	  trl.ColFormat(G2_ORD_UNIT)    = "###,###,###,###,###.###";
      trl.ColFormat(G2_ORD_QTY )    = "###,###,###,###,###";
      trl.ColFormat(G2_LOT_UNIT)    = "###,###,###,###,###.###";
      trl.ColFormat(G2_LOT_QTY)     = "###,###,###,###,###"; 
          
      trl.ColFormat(G2_UNIT_PRICE)  = "###,###,###,###,###.######";
	  trl.ColFormat(G2_ITEM_AMOUNT) = "###,###,###,###,###.##";
      trl.ColFormat(G2_TAX_AMOUNT)  = "###,###,###,###,###.##";
      trl.ColFormat(G2_TOTAL_AMOUNT)= "###,###,###,###,###.##";      
      
      trl.FrozenCols = G2_ITEM_NAME ;
      
      arr_FormatNumber[G2_ST_QTY]     = 0;
	  arr_FormatNumber[G2_ORD_UNIT]   = 3;
      arr_FormatNumber[G2_ORD_QTY]    = 0;
      arr_FormatNumber[G2_LOT_UNIT]   = 3;
      arr_FormatNumber[G2_LOT_QTY]    = 0;
     
      arr_FormatNumber[G2_UNIT_PRICE]   = 6;
	  arr_FormatNumber[G2_ITEM_AMOUNT]  = 2;
      arr_FormatNumber[G2_TAX_AMOUNT]   = 2;      
      arr_FormatNumber[G2_TOTAL_AMOUNT] = 2;
	  
		var data="";    
            
        data = "DATA|1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL||";
        lstStatusSearch.SetDataText(data);
        lstStatusSearch.value = '' ;
      
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0250') FROM DUAL" )%>";    
        lstDeliMethod.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0260') FROM DUAL" )%>";    
        lstDeliTerm.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0210') FROM DUAL" )%>"; 
        lstExNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0220') FROM DUAL" )%>"; 
        lstDestNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1030') FROM DUAL" )%>";    
        lstProductionType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1020') FROM DUAL" )%>";    
        lstOrderType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL" )%>";    
        lstPaymentMethod.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1040') FROM DUAL" )%>"; 
        lstOrdPriority.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0120') FROM DUAL" )%>";    
        lstPaymentTerm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('IEBS0020') FROM DUAL" )%>";    
        lstExPort.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('IEBS0021') FROM DUAL" )%>";    
        lstDestPort.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>";    
        lstPriceType.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1050') FROM DUAL" )%>";    
        lstStockType.SetDataText(data);        

		data = "data|0|0 %|5|5 %|10|10 %|15|15 %||";
    	lstTaxRate.SetDataText(data);     
    	lstTaxRate.value = '';                              
		//--------------------------				    	        
 } 
 
 //==========================================================
 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_Deli_Info       = document.all("Tab-Deli-Info");    
    var tab_Sale_Term       = document.all("Tab-Sale-Term");    
    var tab_Extension_Info  = document.all("Tab-Extension-Info"); 
         
	switch (strRad)
	{
		case '1':
		    tab_Deli_Info.style.display      = "";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "none";
		    
		    document.all("Deli-Info").style.color      = "cc0000"; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = ""; 
        break;
        
        case '2':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "";
		    tab_Extension_Info.style.display = "none"; 
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "cc0000";
		    document.all("Extension-Info").style.color = "";       
        break;	
        
        case '3':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "";
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = "cc0000";         
        break;        
    } 
 }
  
  //============================================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        		
        case 'MASTER' :  
            if ( grd_order_master.GetStatus() == 20 && t_view != 'true' )
            {								
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('MASTER');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData(grdSearch.row,0);
                    }  
					              
                    grd_order_master.Call("SELECT");
                }                
            } 
            else
            {	
				t_view = '';
				
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
				else
				{
					txtMasterPK.text = '' ;
				}
				
                grd_order_master.Call("SELECT");
            }                       
        break;       
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
        case "grd_order_master" :
            if ( p_update == 1 )
            {
                p_update = 0 ;
				
                for ( var i = 1; i < grdDetail.rows ; i++ )
       		 	{
            		if ( grdDetail.GetGridData(i,G2_MASTER_PK) == "" )
            		{
                		grdDetail.SetGridText( i ,G2_MASTER_PK , txtMasterPK.text ) ;
           			}
        		}
				
                SetItemSequence();
				
                OnSave('DETAIL');
            }
            else
            {
                data_dsbs00200_2.Call('SELECT');
            } 
           
        break;
        
        case "data_dsbs00200_2" :     
            //------------------------------
            if (grdDetail.rows > 1) 
			{
				grdDetail.SetCellBold( 1, G2_ST_QTY,  grdDetail.rows - 1, G2_ST_QTY,  true);
            	grdDetail.SetCellBold( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_ORD_QTY, true);
				grdDetail.SetCellBold( 1, G2_LOT_QTY, grdDetail.rows - 1, G2_LOT_QTY, true);
			
            	grdDetail.SetCellBgColor( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_NAME, 0xCCFFFF );			
				grdDetail.SetCellBgColor( 1, G2_ORD_UNIT,  grdDetail.rows - 1, G2_ORD_UOM,   0xFFFFCC );
				
				lblTotalItem.text = grdDetail.rows-1 ;
				
				var total_qty = 0 ;
				
				for (var i=1 ; i<grdDetail.rows; i++)
				{
					total_qty = total_qty + Number(grdDetail.GetGridData( i, G2_ORD_QTY ));
				}

				lblTotalQty.text = total_qty;
            }
        break;     
		
        case 'pro_dsbs00020':
             alert(txtReturnValue.text);	
             window.returnValue =  1;
		     window.close();             
        break;        
		 
         case 'pro_dsbs00020':
             alert(txtReturnValue.text);	
             window.returnValue =  1;
		     window.close();  
         break;
      }  
 }
 //---------------------------------------------------------
    var p_update = 0 ;

 
 var gPreviousRow = -1 ;

 //=====================================================================================
 
 function TotalAmount()
 {
	   var vItemAmt = 0,vVatAmt = 0,vTotalAmt = 0, vOrdQty = 0 ;
	
       for (var i = 1; i<grdDetail.rows  ; i++)
       {
			//-----------------------------	   
            vItemAmt  =  vItemAmt  + Number(grdDetail.GetGridData(i, G2_ITEM_AMOUNT ));
            vVatAmt   =  vVatAmt   + Number(grdDetail.GetGridData(i, G2_TAX_AMOUNT  ));
            vTotalAmt =  vTotalAmt + Number(grdDetail.GetGridData(i, G2_TOTAL_AMOUNT));
			
			vOrdQty   =  vOrdQty   + Number(grdDetail.GetGridData(i, G2_ORD_QTY));                   
       }       
	   
       txtOrdAmt.text   = vItemAmt  ;
       txtTaxAmt.text   = vVatAmt   ;
       txtTotalAmt.text = vTotalAmt ;
	   
	   lblTotalQty.text = vOrdQty;
 }
 
  //==================================================================================

function SetItemSequence()//reset item sequence when OrderNO thay doi
{
    var items = grdDetail.rows
    for(var i =1 ; i<items ; i ++)
    {
        var val = grdDetail.GetGridData(i,G2_SEQ_NUM)
        grdDetail.SetGridText(i,G2_SO_ITEM_NO,txtSoNo.text + '-' + (val<10?("00"+val):val<100?("0"+val):val))
    }
}
  
 //==============================================================================================  

function url_encode(s) 
{
	string = s.replace(/\r\n/g,"\n");
	var utftext = "";

	for (var n = 0; n < string.length; n++) 
	{

		var c = string.charCodeAt(n);

		if (c < 128) 
		{
			utftext += String.fromCharCode(c);
		}
		else if ((c > 127) && (c < 2048)) 
		{
			utftext += String.fromCharCode((c >> 6) | 192);
			utftext += String.fromCharCode((c & 63) | 128);
		}
		else 
		{
			utftext += String.fromCharCode((c >> 12) | 224);
			utftext += String.fromCharCode(((c >> 6) & 63) | 128);
			utftext += String.fromCharCode((c & 63) | 128);
		}
	}
	return escape(utftext);
}

 //================================================================================================
function OnProcess(obj)
{
    if(obj == 'Approve')
    {
	pro_dsbs00020.Call();
    }else
    {
        pro_dsbs00020_1.Call();
    }
}

</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00020" > 
                <input>
                    <inout bind="txtMasterPK" />
                </input> 
                <output> 
                     <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
      <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00020_1" > 
                <input>
                     <input bind="txtMasterPK" />  
                     <input bind="txtEmpPK" />                       
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!------------------------------------------------------------------>
    <gw:data id="grd_order_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47" function="st_lg_sel_dsbs00200_1" procedure="st_lg_upd_dsbs00200_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
					
                    <inout bind="dtOrderDate" />  
                    <inout bind="txtSoNo" />
                    <inout bind="lstOrderStatus" />					
					<inout bind="txtStylePK" />
                    <inout bind="txtStyleID" />
					
                    <inout bind="txtStyleName" />					
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />           
                    <inout bind="txtDeliToPK" />
					
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />        
                    <inout bind="txtDeliLocPK" /> 
					 
                    <inout bind="txtDeliLocName" />  
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" />       
                    <inout bind="txtPONum" /> 
                    <inout bind="lstExPort" />
					
                    <inout bind="lstDestPort" />  
					<inout bind="dtPODate" />					
					<inout bind="lstOrderType" />
					<inout bind="lstPriceType" />
					<inout bind="lstPaymentMethod" />
					
					<inout bind="lstPaymentTerm" />					
					<inout bind="txtEmpPK" />
                    <inout bind="txtEmpCode"/>
                    <inout bind="txtEmpName"/>					
					<inout bind="txtOrdAmt" />
					
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />					
					<inout bind="lstTaxRate" />
					<inout bind="lstCurrency" />
					<inout bind="txtExchangeRate" />	
									
                    <inout bind="txtSaleRep" />
					<inout bind="txtBuyReq" />                    
					<inout bind="lstOrdPriority" />
                    <inout bind="lstProductionType" />
                    <inout bind="lstStockType" /> 
					
                    <inout bind="txtRemark" /> 
                    <inout bind="txtAtt01" />
                    <inout bind="txtAtt02" />
                    <inout bind="txtAtt03" />
                    <inout bind="txtAtt04" />	
									                    
                    <inout bind="dtETD" />
                    <inout bind="dtETA" />                                                       
                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="grd_order_default" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="st_lg_sel_dsbs00200_default" > 
                <inout> 
                    <inout bind="txtDeliToPK" />
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />  
                    
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />
                    
                    <inout bind="txtDeliLocPK" /> 
                    <inout bind="txtDeliLocName" /> 
                    
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" /> 
                    
                    
                    <inout bind="lstExPort" />
                    <inout bind="lstDestPort" />
                      
                    <inout bind="lstOrderType" />
					<inout bind="lstPriceType" />
					
					<inout bind="lstPaymentMethod" />
					<inout bind="lstPaymentTerm" />		
						  
                    <inout bind="lstCurrency" />  
                    <inout bind="lstOrdPriority" />
                    <inout bind="lstProductionType" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00200" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="st_lg_sel_dsbs00200" > 
                <input> 
                    <input bind="dtFromSearch" /> 
                    <input bind="dtToSearch" /> 
                    <input bind="txtPOSlipNoSearch" />       
					<input bind="txtStylePartnerSearch" />           
                    <input bind="lstStatusSearch" />
                    <input bind="txtEmp_PK" />
                    <input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00200_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_lg_sel_dsbs00200_2"  procedure="st_lg_upd_dsbs00200_2" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id='left' style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 30%">
                            <b>Date</b>
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtFromSearch" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtToSearch" lang="1" styles="width:100%" />
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>PO/SO No</b>
                        </td>
                        <td >
                            <gw:textbox id="txtPOSlipNoSearch" styles="width:100%" onenterkey="OnSearch('SOLIST')" />
                        </td>
                        <td style="width: 1%" align='left'>
                            <gw:button id="btnOrderNoSearch" img="search" onclick="OnSearch('SOLIST')" />
                        </td>
                    </tr>    
					<tr style="height: 1%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>Style/Partner</b>
                        </td>
                        <td >
                            <gw:textbox id="txtStylePartnerSearch" styles="width:100%" onenterkey="OnSearch('SOLIST')" />
                        </td>
                        <td style="width: 1%" align='left'>
                             
                        </td>
                    </tr>                       
                    <tr style="height: 1%">
                        <td align="right" style="width: 30%">
                            Status
                        </td>
                        <td >
                            <gw:list id="lstStatusSearch" styles='width:100%' onchange="OnSearch('SOLIST')" />
                        </td>
                        <td>
                             <gw:checkbox id="chkUser" defaultvalue="Y|N" value="Y" />User
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|SO/PO No|Date|Partner|Style" format="0|0|4|0|0" aligns="0|0|1|0|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|2000|1000" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" param="0,1,2,3,4" oncellclick="OnSearch('MASTER')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id='right' style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
								    <td style="width: 5%; white-space: nowrap" align="left">										
									</td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Ord Date</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:datebox id="dtOrderDate" lang="1" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>S/O No</b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtSoNo" styles='width:100%' csstype="mandatory" onenterkey="SetItemSequence()" />
                                    </td>
                                    <td style="width: 23%; white-space: nowrap" align="center" colspan="2">
                                        <gw:label id="lstOrderStatus" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                                    </td>  
									<td style="width: 1%" align="right">                                         
                                    </td>                                   
                                    <td style="width: 1%" align="left">                                        
                                    </td>
                                    <td style="width: 1%" align="right"> 
										
                                    </td>
									<td style="width: 1%" align="left">
										
                                    </td>
                                     <td style="width: 1%" align="right">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                        
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                        <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                                        <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                                        
                                    </td>                                                                        
                                </tr>                                
                            </table>
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF">
								<tr>
                                    <td style="white-space: nowrap;width: 40%" align="left">
                                        <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                            <span value="1" id="Deli-Info">Delivery Info</span> 
                                            <span value="2" id="Sale-Term">Sales Term Info</span> 
                                            <span value="3" id="Extension-Info">Extension Info</span>
                                        </gw:radio>
                                    </td>
                                    <td style="white-space: nowrap;width: 5%" align="right">
                                        <b>Style</b>
                                    </td>
                                    <td style="white-space: nowrap;width: 55%">
                                        <gw:textbox id="txtStylePK" styles='display:none' />
                                        <gw:textbox id="txtStyleID" styles='width:30%' />
                                        <gw:textbox id="txtStyleName" styles='width:70%' />
                                    </td>
                                </tr>
							</table>
						</td>
					</tr>		
                    <tr style="height: 1%">
                        <td valign="top">
                            <table id="Tab-Deli-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td colspan="6">
                                        <table style="width: 100%; height: 100%" border=0 >
                                            <tr>
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    <b>Deli To </b>
                                                </td>
                                                <td style="width: 45%; white-space: nowrap">
													<gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
                                                    <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    <b>Bill To </b>
                                                </td>
                                                <td style="width: 45%; white-space: nowrap;" >
													<gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
                                                    <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Deli Method
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDeliMethod" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Deli Term
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDeliTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Deli Loc
                                        </b>
                                    </td>
                                    <td style="width: 35%">
										<gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtDeliLocName" csstype="mandatory" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Ex Nation</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstExNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Dest Nation
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDestNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>P/O Num</b>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:textbox id="txtPONum" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Ex Port </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstExPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Dest Port
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDestPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>P/O Date</b>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:datebox id="dtPODate" lang="1" styles='width:80%' />
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Sale-Term" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Ord Type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOrderType" styles='width:100%' onchange="OnChangeList(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Price type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPriceType" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Employee </b>
                                    </td>
                                    <td style="width: 35%; white-space: nowrap" colspan=2 >
										<gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Order Amt</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtOrdAmt" styles='width:100%' csstype="mandatory" type="number"
                                            format="###,###.###" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Pay Method</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPaymentMethod" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Sale Rep</b>
                                    </td>
                                    <td style="width: 35%" colspan=2 >
                                        <gw:textbox id="txtSaleRep" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Tax Amt
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtTaxAmt" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory" onenterkey="OnChangeTextbox(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Pay Term</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPaymentTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b>Buy Rep</b>
                                    </td>
                                    <td style="width: 35%" colspan=2 >
                                        <gw:textbox id="txtBuyReq" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Total Amt </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtTotalAmt" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Tax Rate</b>
                                    </td>
                                    <td style="width: 25%"> 
										<gw:list id="lstTaxRate" styles='width:100%'  csstype="mandatory" />                                       
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ex-Rate
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
										<gw:list id="lstCurrency" styles='width:100%' />
									</td>
									<td style="width: 20%; white-space: nowrap">	
                                        <gw:textbox id="txtExchangeRate" csstype="mandatory" type="number" format="###,###.###"
                                            styles='width:100%' text='' />
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Extension-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Priority</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOrdPriority" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"> 
										Remark 1                                        
                                    </td>
                                    <td style="width: 25%" colspan=3 >                                    
                                        <gw:textbox id="txtAtt01" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Prod Type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstProductionType" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"  >
										Remark 2   
									</td>
									<td colspan=3>	                                  
                                        <gw:textbox id="txtAtt02" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Stock Type
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstStockType" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 3
                                    </td>
                                    <td style="width: 25%" colspan=3 >
										<gw:textbox id="txtAtt03" styles='width:100%' />                                                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtRemark" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%" align="right">
										Remark 4
                                    </td>
                                    <td style="width: 25%" colspan=3 >
                                    	<gw:textbox id="txtAtt04" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 2%">
                                
                                    <td style="width: 5%" align="right">
                                        ETD
                                    </td>
                                    <td style="width: 15%" align="left">
                                        <gw:datebox id="dtETD" lang="1" onchange="OnSetDate('ETD')" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        ETA
                                    </td>
                                    <td style="width: 15%" align="left">
                                        <gw:datebox id="dtETA" lang="1" onchange="OnSetDate('ETA')" />
                                    </td>                                    
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Items :
                                    </td>
                                    <td style="width: 20%; white-space: nowrap" align="center">
                                        <gw:label id="lblTotalItem" styles='width:100%;color:cc0000;font:9pt' text='' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Qty :
                                    </td>
                                    <td style="width: 20%; white-space: nowrap" align="center">
                                        <gw:label id="lblTotalQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###.###,###.##" />
                                    </td>
                                    <td style="width: 13%">
                                    </td>
                                    <td style="width: 1%">                                        
                                    </td>
                                    <td style="width: 1%">
									
                                    </td>
                                    <td style="width: 1%">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                    </td>
                                    <td style="width: 1%" align="right">
                                       
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td>
                            <gw:grid id='grdDetail' 
								header='_DETAIL_PK|_MASTER_PK|S/O Item No|Seq|_ITEM_PK|Item Code|Item Name|Cust Item|_Cust Qty|_UOM|_ORD UNIT|Ord Qty|UOM|_Lot Unit|_Lot QTY|_UOM|U/Price|Item Amt|Tax Amt|Total Amt|ETD|ETA|Remark'
                                format='0|0|0|0|0|0|0|2|0|2|0|0|2|2|0|2|0|0|0|0|4|4|0'
                                aligns='0|0|0|1|0|0|0|0|3|1|3|3|1|3|3|1|3|3|3|3|1|1|0'
                                editcol='0|0|0|1|0|1|1|1|1|0|1|1|0|1|1|0|1|1|1|1|1|1|1'
                                widths='0|0|1600|500|0|2000|3000|1500|1200|800|1000|1200|800|1000|1200|800|1200|1200|1200|1200|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate="T" 
                                oncelldblclick="OnPopUp('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    <!------------------------------------------------------>
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------>
	<gw:textbox id="txtEmp_PK" maxlen="100" styles='width:100%;display:none' /> 	

</body>
</html>
