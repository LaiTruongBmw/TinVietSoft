<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Item Combination</title>
</head>

<script>

var G_MASTER_PK		= 0,
	G_FR_ITEM_ID	= 1,
	G_FR_ITEM_NAME  = 2,
	G_TO_ITEM_ID	= 3,
	G_TO_ITEM_NAME	= 4,
	G_DATA_FROM		= 5,
	G_DATA_TO		= 6,
	G_REASON		= 7,
	G_USER			= 8,
	G_EXE_DATE		= 9,
	G_DETAIL		= 10;
	
//===========================================================
 function BodyInit()
 {
    System.Translate(document); 
	
    txtItemCD1.SetEnable(false);
    txtItemNM1.SetEnable(false);
    txtItemCD2.SetEnable(false);
    txtItemNM2.SetEnable(false);
 } 
//===========================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Item1':
            var path = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
	        var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
	        if(object!=null)
	        {
	            txtItemPK1.text=object[0];
	            txtItemCD1.text=object[1];
	            txtItemNM1.text=object[2];
	        } 
        break;
        
        case 'Item2':
            var path = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
	        var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
	        if(object!=null)
	        {
	            txtItemPK2.text=object[0];
	            txtItemCD2.text=object[1];
	            txtItemNM2.text=object[2];
	        }  
        break;
    }
}
//==========================================================================
function OnProcess()
{
    var v_data = "", v_valid = "";
    var	v_valid = 'Y'    ;
	
    if ( txtItemPK1.text == "" || txtItemPK2.text =="" || txtItemPK1.text == txtItemPK2.text )
    {
        alert("Please, Check From Item and To item feilds")
        v_valid ='N';
    }
	else
    {
        v_data = v_data + chkOther.value + chkAdj.value + chkClosing.value;
		v_data = v_data + chkSaleOrder.value + chkProdIncome.value +  chkGoodsDeli.value +  chkProdAss.value + chkProdOutgo.value;
		v_data = v_data + chkQuot.value + chkPR.value + chkPO.value + chkIncome.value + chkOutgo.value;
		v_data = v_data + chkIReturn.value + chkOReturn.value + chkTransfer.value + chkExch.value + chkDisc.value;
		
        if ( v_data.indexOf("Y") == -1 )
        {
            alert("You must select at least one place that you want to combine data!");
            v_valid ='N';
        }		 
    } 
	    
    if ( v_valid =='Y')
    {	 
        if ( confirm("Are you sure you want to combine data?"))
        { 
           pro_agci00190.Call();
        }
    }
} 
//==========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_agci00190':
            alert(txtReturnValue.text)
            data_agci00190.Call('SELECT')
        break;
		
        case 'data_agci00190':
            lblRecord.text = (grdDetail.rows -1) + " record(s)."
			
			if (grdDetail.rows>1)
			{
				grdDetail.SetCellBold( 1, G_FR_ITEM_ID, grdDetail.rows - 1, G_FR_ITEM_ID, true);
				grdDetail.SetCellBold( 1, G_TO_ITEM_ID, grdDetail.rows - 1, G_TO_ITEM_ID, true);
				
				grdDetail.SetCellBgColor( 1, G_FR_ITEM_ID, grdDetail.rows - 1, G_TO_ITEM_NAME, 0xCCFFFF )
			}
        break;
    }
}
//=============================================================================== 
function OnSearch()
{
    data_agci00190.Call('SELECT');
}
//=============================================================================== 
function OnAddNew(pos)
{
	switch(pos)
	{
		case 'Item':
			txtItemPK1.text = '';
			txtItemCD1.text = '';
			txtItemNM1.text = '';
			
			txtItemPK2.text = '';
			txtItemCD2.text = '';
			txtItemNM2.text = '';	
			
			chkQuot.value		= 'Y';
			chkPR.value			= 'Y';	
			chkPO.value			= 'Y';
			chkIncome.value		= 'Y';
			chkOutgo.value		= 'Y';
			chkIReturn.value	= 'Y';
			chkOReturn.value	= 'Y';
			chkTransfer.value	= 'Y';
			chkExch.value		= 'Y';
			chkDisc.value		= 'Y';
			chkOther.value		= 'Y';
			chkAdj.value		= 'Y';
			chkClosing.value	= 'Y';
			chkSaleOrder.value	= 'Y';
			chkProdIncome.value	= 'Y';
			chkGoodsDeli.value 	= 'Y';
			chkProdAss.value 	= 'Y';
			chkProdOutgo.value 	= 'Y';
		break;
	}
}
 
//==========================================================================

</script>

<body>
    <gw:data id="pro_agci00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00190" > 
                <input>
                     <input bind="dtFrom" />
                     <input bind="dtTo" />
                     <input bind="txtItemPK1" />
					 <input bind="txtItemCD1" />
					 <input bind="txtItemNM1" />
                     <input bind="txtItemPK2" />
					 <input bind="txtItemCD2" />
					 <input bind="txtItemNM2" />                           
                     <input bind="chkQuot" />        
                     <input bind="chkPR" />                    
                     <input bind="chkPO" />
                     <input bind="chkIncome" />
                     <input bind="chkOutgo" />
                     <input bind="chkIReturn" />
                     <input bind="chkOReturn" />
                     
                     <input bind="chkTransfer" />
                     <input bind="chkExch" />                     
                     <input bind="chkDisc" />
                     <input bind="chkOther" />
                     <input bind="chkAdj" />
					 <input bind="chkClosing" />
					 <input bind="chkSaleOrder" />
					 <input bind="chkProdIncome" />
					 <input bind="chkGoodsDeli" />
					 <input bind="chkProdAss" />
					 <input bind="chkProdOutgo" />
					 
                     <input bind="txtReason" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"   function="st_lg_sel_agci00190" > 
                <input bind="grdDetailCode" >
                    <input bind="txtSFItem" />
                    <input bind="txtSTItem" />
                </input>
                <output  bind="grdDetail" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%"  >
        <tr style="height: 1%">
			 <td colspan="4">
				<table  style="width: 100%; height: 100%; border: 2px solid #034D72" >
					<tr>
						<td colspan=5>
							<table style="width: 100%; height: 100%">
								<tr style="height: 1%">
						            <td align="right" style="width: 5%; white-space: nowrap">
						                Period
						            </td>			 
						            <td style="width: 45%" align="left" >
						                <gw:datebox id="dtFrom" styles='width:100%' lang="<%=Application("Lang")%>" mode="01"  />  ~ 
						                <gw:datebox id="dtTo" styles='width:100%'  lang="<%=Application("Lang")%>" mode="01" />
						            </td>
									<td style="width: 5%; white-space: nowrap" align='right'>
										<gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnAddNew('Item')" />
									</td>
						            <td align='center' style="width: 45%; white-space: nowrap">
						                 <gw:icon id="btnEx" img="2" text="Execute" onclick="OnProcess()" /> 										 
						                 <gw:icon id="btnCancel" img="3" text="Execute" styles="display:none" onclick="OnCancel()" /> 
						            </td>
						        </tr>
						        <tr style="height: 1% ">
						            <td align="right" style="width: 5%; white-space: nowrap">
						                <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('Item1')">From Item</b>
						            </td>
						            <td style="width: 45%;white-space:nowrap">
						                <gw:textbox id="txtItemPK1" styles='display:none' csstype="mandatory" />
						                <gw:textbox id="txtItemCD1" styles='width:30%' csstype="mandatory" />
						                <gw:textbox id="txtItemNM1" styles='width:70%' csstype="mandatory" />
						            </td>
						            <td align="right" style="width: 5%; white-space: nowrap">
						                <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('Item2')">To Item</b>
						            </td>
						            <td style="width: 45%;white-space:nowrap">
						                <gw:textbox id="txtItemPK2" styles='display:none' csstype="mandatory" />
						                <gw:textbox id="txtItemCD2" styles='width:30%' csstype="mandatory" />
						                <gw:textbox id="txtItemNM2" styles='width:70%' csstype="mandatory" />
						            </td>
						        </tr>       
						        <tr style="height: 1%  ">
						            <td align="right" style="width: 5%; white-space: nowrap" >
						                Reason
						            </td>
						            <td colspan="3">
						                <gw:textbox id="txtReason" styles='width:100%'  />
						            </td>
						        </tr>
							</table>
						</td>
					</tr>					
					<tr style="background-color:#ccffff">						
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">						 
							<gw:checkbox id="chkAdj"  defaultvalue="Y|N" csstype="mandatory">Adj</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">
							<gw:checkbox id="chkClosing"  defaultvalue="Y|N" csstype="mandatory">Closing</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">																				 						
						</td>
						<td align="left" >   
						</td>
						<td align="left" >   
						</td>
						<td align="left" >   
						</td>						
					</tr>		
					<tr style="background-color:#ffffcc">
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">						
							<gw:checkbox id="chkSaleOrder" defaultvalue="Y|N" csstype="mandatory">Sale Order</gw:checkbox>							 							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">						 
							<gw:checkbox id="chkProdIncome"  defaultvalue="Y|N" csstype="mandatory">Prod Income</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap;">						 
							<gw:checkbox id="chkGoodsDeli"  defaultvalue="Y|N" csstype="mandatory">Goods Delivery</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap;">						 
							<gw:checkbox id="chkProdAss"  defaultvalue="Y|N" csstype="mandatory">Prod Assembly</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">						 
							<gw:checkbox id="chkProdOutgo"  defaultvalue="Y|N" csstype="mandatory">Prod Outgo</gw:checkbox>							
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">						 							 				
						</td>
					</tr>								
					<tr style="background-color:#ccffff">
					    <td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">   
							<gw:checkbox id="chkQuot"  defaultvalue="Y|N"  csstype="mandatory">Quotation</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">   
							<gw:checkbox id="chkPR"  defaultvalue="Y|N"  csstype="mandatory">P/R</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">
							<gw:checkbox id="chkPO"  defaultvalue="Y|N"  csstype="mandatory">P/O</gw:checkbox>    
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap">
							<gw:checkbox id="chkIncome"  defaultvalue="Y|N" csstype="mandatory">Stock Incoming</gw:checkbox>    
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 
							<gw:checkbox id="chkOutgo"  defaultvalue="Y|N" csstype="mandatory">Stock Outgoing</gw:checkbox>  
						</td> 
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 							
						</td> 						
					</tr>
					
					<tr style="background-color:#ffffcc">
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 
							<gw:checkbox id="chkIReturn"  defaultvalue="Y|N" csstype="mandatory">In. Return</gw:checkbox> 
						</td> 
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 
							<gw:checkbox id="chkOReturn"  defaultvalue="Y|N" csstype="mandatory">Out. Return</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 
							<gw:checkbox id="chkTransfer"  defaultvalue="Y|N" csstype="mandatory">Transfer</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap"> 
							<gw:checkbox id="chkExch"  defaultvalue="Y|N" csstype="mandatory">Exchange</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap;"> 
							<gw:checkbox id="chkDisc"  defaultvalue="Y|N" csstype="mandatory">Discard</gw:checkbox> 
						</td>
						<td align="left" style="border: 1px solid #034D72;width: 15%;white-space:nowrap;"> 
							<gw:checkbox id="chkOther"  defaultvalue="Y|N" csstype="mandatory">Other I/O</gw:checkbox> 
						</td> 						
					</tr>										
				</table>
			 </td>
                   
        </tr>		 
        <tr style="height: 5%">
            <td colspan ="4">
                <table style="height:100%; width:100%">
                    <tr>
                          <td align="right" style="width: 10%;">
                                From Item
                            </td>
                            <td style="width: 20%">                
                                <gw:textbox id="txtSFItem" styles='width:70%' />
                            </td>
                          <td align="right" style="width: 10%; ">
                                To Item
                            </td>
                           <td style="width: 20%">                
                                <gw:textbox id="txtSTItem" styles='width:70%' />
                          </td>
                          <td align="right">
                            <gw:label id="lblRecord" styles="color:red" text="record(s)."/>
                          </td>
                           <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
           
        </tr>
        <tr style="height: 50%">
            <td colspan="4">
               <gw:grid id='grdDetail'
                header='_PK|From Item ID|From Item Name|To Item ID|To Item Name|Data From|To|Reason|User|Execute Date|Detail'
                format='0|0|0|0|0|4|4|0|0|0|0'
                aligns='0|0|0|0|0|1|1|0|0|1|0'
                check='||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0'
                widths='0|1500|2500|1500|2500|1200|1200|1500|1500|2500|1000'
                sorting='T'         
                styles='width:100%; height:100%'			 
                />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
