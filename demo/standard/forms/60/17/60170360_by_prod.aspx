<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Allocation By Prod</title>
</head>

<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;      
	
	var G_PRO_BY_PK = 0 ,
		G_PRO_BY_TCO_ITEM_PK = 1 ,
		G_PRO_BY_Item = 2 ,
		G_PRO_BY_QTY = 3 ,
		G_PRO_BY_SALE_PRICE = 4 ,
		G_PRO_BY_RATIO = 5 ,
		G_PRO_BY_COST_PRICE = 6 ,
		G_PRO_BY_COST_AMT = 7 ,
		G_PRO_BY_STD_YM = 8 
		;
		
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();

}
//------------------------------------------------------------------------
function BindingDataList()
{
	var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data) ;
	l_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";
    lstBook_Ccy.SetDataText(l_data);	
	 var p_month  = "<%=Request.querystring("p_month")%>";
	 dtMonth.value = p_month;
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	
}
//------------------------------------------------------------------------
function OnFormatGrid()
{

	
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}	
//-----------------------------------------------------
function OnSearch()
{
	data_60170360.Call('SELECT');
}
//-----------------------------------------------------

function OnSave(){
	
	data_60170360.Call();
}
//-----------------------------------------------------
function OnProcess()
{
	
}		


//------------------------------------------
function OnEditDtl()
{
  
	var ratio = 0,  cost_price , amount;
	var qty = grdProBy.GetGridData(event.row, G_PRO_BY_QTY);
	var sale_price= grdProBy.GetGridData(event.row, G_PRO_BY_SALE_PRICE);
	var  ratio = grdProBy.GetGridData(event.row, G_PRO_BY_RATIO);
	
	    if(event.col == G_PRO_BY_RATIO  || event.col == G_PRO_BY_SALE_PRICE  )	
	    {
		   	
				if(sale_price  != ''){
				
					  cost_price = ( sale_price *ratio)/100;
				      grdProBy.SetGridText(event.row, G_PRO_BY_COST_PRICE,cost_price);
					if(lstBook_Ccy.value == 'VND')
					{
						amount = Math.round(cost_price * qty) ;
					}
					else
					{
						amount = Math.round(cost_price * qty) / 100;
					}
							
					  grdProBy.SetGridText(event.row, G_PRO_BY_COST_AMT,amount);
				}
		  
		   
	    }
		
}

</script>

<body>
   <!------------------------------------------------------------------>
	  <gw:data id="data_60170360" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60170360_BYPROD" procedure="ac_upd_60170360_BYPROD" > 
                <input>
					<input bind="lstCompany" />       
					<input bind="dtMonth" />       					
                </input> 
                <output bind="grdProBy" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	<!--------------------------------------------------------------------->
	
    <table    width="100%" style="height: 100%" border="1">
        <tr style="height: 100%">
            
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%" >
                    <tr style="height: 5%">
						<td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="lstCompany" styles="width:100%" onchange="lst_600100140_5.Call()"  />
                        </td>
						
                         <td style="width: 10%">
                            Month
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtMonth"   type="month" />
                        </td> 
						<td><gw:list id="lstBook_Ccy" styles="width:100%"  styles ="display:none;" /></td>
						
						<td style="width:50%"  align="right"> 
							 <table style="width: 20%; height: 100%" >
								<tr>
										
									<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
									<td style="width: 1%">
										 <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
									</td>                       
								   
									
									
								</tr>
							 </table>
						</td>
                         
                    <tr style="height: 95%">
                        <td colspan="8">
                            <gw:grid id='grdProBy'
                                header='_pk|_tco_item_pk|Item| Qty|Sales Price |Ratio|Apply price for Costing|Amount|_std_ym'
                                format='0|0|0|N|1|s|1|1|0'
                                aligns='0|0|0|0|0|0|0|0|0'
                                check='||||||||'
                                editcol='1|1|1|1|1|1|1|1|1'
                                widths='0|1500|1500|1500|1500|1500|2000|2000|0'
                                sorting='T'
                                styles='width:100%; height:100%'
								onafteredit="OnEditDtl()"
								
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

      
</body>
</html>