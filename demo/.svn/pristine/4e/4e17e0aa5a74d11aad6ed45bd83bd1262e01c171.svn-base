<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>CHECK PRICE</title>
</head>
<script type="text/javascript">

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    var  user_id    = "<%=Session("EMP_ID")%>" ;        
	    
    var G2_DETAIL_PK            = 0,           
        G2_SEQ_NUM              = 1, 
		G2_REF_NO			    = 2,	
        G2_ITEM_PK              = 3,   
        G2_ITEM_CODE            = 4,   
        G2_ITEM_NAME            = 5,          
        G2_CUST_ITEM         	= 6,     
        G2_ORD_QTY              = 7,   
        G2_ORD_UOM              = 8,           
        G2_UNIT_PRICE           = 9, 
		G2_ITEM_AMOUNT			= 10,
		G2_DISC_AMOUNT			= 11,
		G2_TAX_AMOUNT  			= 12,
        G2_TOTAL_AMOUNT         = 13,   
        G2_ST_PRICE             = 14,           
        G2_REMARK               = 15; 
  
 //===================================================================================
 function BodyInit()
 {
      System.Translate(document);      
      //-----------------------------
	  txtCancelChargerPK.text="<%=Session("EMPLOYEE_PK")%>"; 
	  
	  txtMasterPK.text = "<%=Request.querystring("sale_order_m_pk")%>"; 
	  //-----------------------------
	  FormatGrid();
	  
	  OnSearch('DETAIL');
        
 }
//===========================================================
function BindingDataList()
{
    	   
                            
		 
}
//==========================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	      
      trl.ColFormat(G2_ORD_QTY )    = "###,###,###.##";      
          
      trl.ColFormat(G2_UNIT_PRICE)  = "###,###,###.#####";  
	  trl.ColFormat(G2_ITEM_AMOUNT) = "###,###,###.##";  
	  trl.ColFormat(G2_DISC_AMOUNT) = "###,###,###.##";  
      trl.ColFormat(G2_TAX_AMOUNT)  = "###,###,###.##";  
      trl.ColFormat(G2_TOTAL_AMOUNT)= "###,###,###.##"; 

	  trl.ColFormat(G2_ST_PRICE)    = "###,###,###.#####"; 	      
	  	   		    	       
 }   
  
 //============================================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		                 
        case 'DETAIL' :  
             			
            data_dsbs00025.Call("SELECT");
                                 
        break;       
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
       
        case "data_dsbs00025" :     
            //------------------------------
            if (grdDetail.rows > 1) 
			{
				grdDetail.SetCellBold( 1, G2_UNIT_PRICE, grdDetail.rows - 1, G2_UNIT_PRICE, true);             
				grdDetail.SetCellBold( 1, G2_ST_PRICE,   grdDetail.rows - 1, G2_ST_PRICE,   true);
			
            	grdDetail.SetCellBgColor( 1, G2_UNIT_PRICE, grdDetail.rows - 1, G2_UNIT_PRICE, 0xCCFFFF );			
				grdDetail.SetCellBgColor( 1, G2_ST_PRICE,   grdDetail.rows - 1, G2_ST_PRICE,   0xFFFFCC );	
				
				for (var i=1; i<grdDetail.rows; i++)
				{
					if (Number(grdDetail.GetGridData( i, G2_UNIT_PRICE)) != Number(grdDetail.GetGridData( i, G2_ST_PRICE)) ) 
					{					
						grdDetail.GetGridControl().Cell( 7, i, 1, i, grdDetail.cols-1 ) = 0x3300cc;
					}
				}	
            }
        break;
		
		case "pro_dsbs00025":
			alert(txtReturnValue.text);
			
			window.close();   
		break;
       
      }  
 }
  
//=================================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
		case 'Approve':
			if ( confirm('Are you sure to approve this sale order?') )
			{
				pro_dsbs00025.Call();
			}				
		break;

		case 'Cancel':
			 
		    window.close();   
		break;	
    } 
}
 
 //================================================================================================
 
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00025" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00025" > 
                <input>
                    <inout bind="txtMasterPK" />
					<input bind="txtCancelChargerPK" />
                </input> 
                <output> 
                     <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>          
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00025" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_dsbs00025"   > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>  
    <!------------------------------------------------------------------>
   
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
								     
                                    <td style="width: 45%">                                         
                                    </td>                                      
									<td style="width: 5%" align="right">  
										<gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                                    </td>                                                                        
                                    <td style="width: 5%" align="right">                                        
                                        <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                                    </td> 
									<td style="width: 45%">                                         
                                    </td>
									
                                </tr>                                
                            </table>
                        </td>
                    </tr>					 
                    <tr style="height: 99%">
                        <td>						 
                            <gw:grid id='grdDetail' 
								header='_DETAIL_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|Cust Item|Ord Qty|UOM|U/Price|Item Amt|Dist Amt|Tax Amt|Total Amt|ST Price|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|1|0|0|0|0|0|3|1|3|3|3|3|3|3|0'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|500|1200|0|1500|3000|1200|1200|800|1200|1200|1200|1200|1200|1200|0'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate="T" />
                        </td>
                    </tr>
                </table>
             
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />       
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />	  
	<!--------------------------------------------------------------------->  
	<gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none'>	 
</body>
</html>
