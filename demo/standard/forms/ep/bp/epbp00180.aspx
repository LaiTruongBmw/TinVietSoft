<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Purchase Summary (by Date)</title>
</head>

<script>
 
 var G1_SUPPLIER_PK		= 0,
 	 G1_SUPPLIER_ID		= 1,
	 G1_SUPPLIER_NAME	= 2;
	 
               
 var G2_SLIP_NO		    = 0,
 	 G2_IN_DATE	        = 1,
	 G2_REF_NO		    = 2,
	 G2_ITEM_CODE	    = 3,
	 G2_ITEM_NAME	    = 4,
	 G2_UOM             = 5,
	 G2_IN_QTY	        = 6,
	 G2_U_PRICE		    = 7,
	 G2_ITEM_AMOUNT	    = 8,
	 G2_VAT_AMOUNT	    = 9,
	 G2_TOTAL_AMOUNT    = 10,
	 G2_CCY			    = 11;
 
 var G3_PARTNER_ID		= 0,
 	 G3_PARTNER_NAME	= 1,
	 G3_ITEM_AMOUNT		= 2,
	 G3_VAT_AMOUNT		= 3,
	 G3_TOTAL_AMOUNT	= 4,
	 G3_CCY         	= 5;

 var G4_IN_TYPE	        = 0,
     G4_PARTNER_ID	    = 1,
     G4_PARTNER_NAME	= 2,
     G4_TOTAL_AMOUNT	= 3,
     G4_PAY_AMOUNT	    = 4,
     G4_BAL_AMOUNT		= 5,
     G4_CCY			    = 6;
  
 //============================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }
  
 //===============================================================
 function BodyInit()
 { 
 	System.Translate(document);  // Translate to language session
 	//----------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFromTab01.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFromTab01.value=ldate ;
	dtFromTab02.value=ldate ;
    //----------------
    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
      grdDetail.GetGridControl().ColFormat(G2_IN_QTY)  	    = "###,###,###,###,###.##";
	  grdDetail.GetGridControl().ColFormat(G2_U_PRICE) 		= "###,###,###,###,###.######";
      grdDetail.GetGridControl().ColFormat(G2_ITEM_AMOUNT)  = "###,###,###,###,###.##";
      grdDetail.GetGridControl().ColFormat(G2_VAT_AMOUNT)	= "###,###,###,###,###.##"; 
	  grdDetail.GetGridControl().ColFormat(G2_TOTAL_AMOUNT)	= "###,###,###,###,###.##";		
	  
	  grdSupplier.GetGridControl().ColFormat(G3_ITEM_AMOUNT)  = "###,###,###,###,###.##";	 
	  grdSupplier.GetGridControl().ColFormat(G3_VAT_AMOUNT)   = "###,###,###,###,###.##";	
	  grdSupplier.GetGridControl().ColFormat(G3_TOTAL_AMOUNT) = "###,###,###,###,###.##";	
	
 }

 //===============================================================
 function OnSearch(pos)
 {
 	switch (pos)
	{
		case 'Detail_Tab1' :
			if ( grdSearch.row > 0 )
			{
				txtPartnerPK.text = grdSearch.GetGridData( grdSearch.row, G1_SUPPLIER_PK );				
				data_epbp00180_1.Call("SELECT");
			}
			else
			{
				grdDetail.ClearData();
			}
			
		break;
		
		case 'Search_Tab1' :		 
			data_epbp00180.Call("SELECT");
		break;
		
		case 'Detail_Tab2' :
		  	data_epbp00180_2.Call("SELECT");
		break;
		
		case 'Detail_Tab3':
			data_epbp00180_3.Call("SELECT");
		break;
		
	}       
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
	  		case 'data_epbp00180_1':
				if (grdDetail.rows >1)
				{
					grdDetail.Subtotal( 0, 2, -1, '6!8!9!10');
				}
			break;
			
            case 'data_epbp00180_2' :
				if ( grdSupplier.rows > 1 )
				{
			  		grdSupplier.Subtotal( 0, 2, -1, '2!3!4');
				}	
            break; 					 
			
			case "pro_epbp00180":
				alert(txtReturnValue.text);
			break;		         	            
      }	 
 }
 
 
 //=================================================================
 
 function OnProcess(pos)
 {
 	switch(pos)
	{
		case 'PAYMENT_REQ':
			if ( confirm("Do you want to make collection request ?") )
			{
				txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
				
				pro_epbp00180.Call();
			}			
		break;
	}
 }
 //================================================================= 
 
 function OnReport(pos)
 {
 	switch(pos)
	{
		case 'SALE_SUM':
			var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00181.aspx?p_f_out_type='+ dtFromTab2.value +'&p_t_out_type='+dtToTab2.value +'&p_partner=' + txtSupplierTab2.text ;
		   
           System.OpenTargetPage(url); 		
		break;
		
		case 'DEBIT':
			var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00180.aspx?p_partner_pk='+ txtPartnerPK.text 
           + '&p_out_type=' + dtYearTab1.value + lstMonthTab1.value             
           + '&p_po=' + txtPOTab1.text
           + '&p_item=' + txtItemTab1.text;
		   
           System.OpenTargetPage(url); 		
		break;
	}
 }
 
 //===================================================================
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00180_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00180_2" > 
                <input bind="grdSupplier" >
				    <input bind="dtFromTab02" />              
				    <input bind="dtToTab02" /> 
					<input bind="txtSupplierTab2" />				
                </input>
                <output bind="grdSupplier" />
            </dso>
        </xml>
    </gw:data>   
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00180" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00180" > 
                <input bind="grdSearch" >
				    <input bind="dtFromTab01" /> 
				    <input bind="dtToTab01" /> 
					<input bind="txtCustTab1" />					 				
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00180_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00180_1" > 
                <input bind="grdDetail" >
                    <input bind="txtPartnerPK" />
				    <input bind="dtFromTab01" /> 
				    <input bind="dtToTab01" />      
                    <input bind="txtPOTab1" />  
					<input bind="txtItemTab1" />                       				 
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_epbp00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_epbp00180" > 
                <input>
                     <input bind="txtPartnerPK" /> 
					 <input bind="dtFromTab01" />
					 <input bind="dtToTab01" />
					 <input bind="txtChargerPK" />                      
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:tab>
    <table border="1" style="width: 100%; height: 100%" name="By One Supplier">
        <tr style="height: 2%">
            <td style="width: 30%" id='left' >
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 80%; white-space: nowrap" >
                          	<gw:datebox id="dtFromTab01" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtToTab01" lang="<%=Application("Lang")%>" mode="01" onchange="" />                       
                        </td>
						<td style="width: 10%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 10%" align="right">
                            Supplier
                        </td>
                        <td style="width: 90%; white-space: nowrap" colspan="3">
                            <gw:textbox id="txtCustTab1" styles='width:100%' onenterkey="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' header='_CUST_PK|Partner ID|Partner Name' format='0|0|0'
                                aligns='0|0|0' check='||' editcol='1|1|1' widths='0|1200|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Detail_Tab1')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id='right'>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%"> 
						<td style="width: 10%">
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle()" />
						</td> 
						<td style="width: 5%">
                            P/O
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPOTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>						                      
                        <td style="width: 5%">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItemTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>						 
                        <td style="width: 20%">                            
                        </td>
						<td style="width: 9%">
							<gw:button id="idBtnPayment" img="Payment Req" text="Payment Req" onclick="OnProcess('PAYMENT_REQ')" />
						</td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport('DEBIT')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">                                              
                                <gw:grid id='grdDetail'
									header='Slip No|In Date|Ref No|Item Code|Item Name|UOM|In Qty|Unit Price|Item Amount|Tax Amount|Total Amount|CCY'
									format='0|4|0|0|0|0|0|0|0|0|0|0'
									aligns='0|1|0|0|0|1|3|3|3|3|3|1'
									check='|||||||||||'
									editcol='0|0|0||0|0|0|0|0|0|0|0'
									widths='1000|1200|1000|1000|2000|800|1200|1200|1500|1500|1500|600'
									sorting='T'
									styles='width:100%; height:100%'
									/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="1" style="width: 100%; height: 100%" name="By All Supplier"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>									
			 						<td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 45%; white-space: nowrap" >
			                          	<gw:datebox id="dtFromTab02" lang="<%=Application("Lang")%>" mode="01" onchange="" />
			                            ~
			                            <gw:datebox id="dtToTab02" lang="<%=Application("Lang")%>" mode="01" onchange="" />                       
			                        </td>
									<td style="width: 5%">
			                            Supplier
			                        </td>
			                        <td style="width: 35%">
			                            <gw:textbox id="txtSupplierTab2" styles='width:100%' onenterkey="OnSearch('Detail_Tab2')" />
			                        </td>			                                               
			                        <td style="width: 8%">
			                           
			                        </td>
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab2')" />
			                        </td>	
									<td style="width: 1%">
			                            <gw:button id="ibtnExcel2" img="excel" alt="Report" text="Report" onclick="OnReport('SALE_SUM')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>               
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdSupplier' header='Partner ID|Partner Name|Item Amount|Vat Amount|Total Amount|CCY'
                                format='0|0|0|0|0|0' aligns='0|0|3|3|3|1' check='|||||' editcol='0|0|0|0|0|0'
                                widths='1500|4000|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>                
    </table>	 
    </gw:tab>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
</body>
</html>
