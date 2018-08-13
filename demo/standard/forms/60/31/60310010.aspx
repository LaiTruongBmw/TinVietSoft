<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK CLOSING</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------
 
var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,    
    G1_SEQ          = 2,
    G1_ITEM_PK      = 3,
    G1_ITEM_CODE    = 4,
    G1_ITEM_NAME    = 5,
    G1_UOM          = 6,   
    G1_LOT_NO       = 7,
    G1_PRICE        = 8,
    G1_BEGIN_QTY    = 9,
    G1_BEGIN_AMOUNT = 10,
    G1_IN_QTY       = 11,
    G1_IN_AMOUNT    = 12,
    G1_OUT_QTY      = 13,   
    G1_OUT_AMOUNT   = 14,
    G1_END_QTY      = 15,
    G1_END_AMOUNT   = 16,
    G1_REMARK       = 17;
    
    var arr_FormatNumber = new Array();

//===================================================================================
function OnPopup()
{
	var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_customer.aspx";
	var object = System.OpenModal(fpath , 700 , 600 , 'resizable:yes;status:yes'); 
	if ( object != null ) 
	{
		if (object[0] != "")
		{
			txtPartnerPK.text   = object[0];
			txtPartnerID.text   = object[1];
			txtPartnerName.text = object[2];   
		}
	}
}
//===================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=Session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
   var ls_TYPE = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACAB6010') FROM DUAL")%>";
   lstType.SetDataText(ls_TYPE);
   var ls_TYPE_S = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACAB6010') FROM DUAL")%>||ALL";
   lsTypeS.SetDataText(ls_TYPE_S); 
   lsTypeS.value="";   
   
   var ls_CCY = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   lstCCY.SetDataText(ls_CCY);
   //lstStatusS.SetDataText(ls_CCY);
   
   var ls_CCY_S = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||ALL";
   lstCCY_S.SetDataText(ls_CCY_S); 
   lstCCY_S.value="";
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     //lstWarehouse.SetDataText(data);
     
     //lsTypeS.SetDataText(data);         
     //-----------------------                   
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {
                //txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
                pro_bimc00050.Call();
            }    
        break;    
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_bimc00050_2.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;   
        
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {
                pro_bimc00050_1.Call();
            }
            else
            {
                alert('Pls select data');
            }    
        break;
        
        case 'Price':
            pro_bimc00050_3.Call();
        break;
		
		case 'PO-PRICE':
			if ( confirm('Are you sure to get P/O price ?') )
			{
            	pro_bimc00050_4.Call();
			}	
        break;
             
     }
}

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdVouchers':
            data_bimc00050.Call("SELECT");
        break;
		case 'Master':
			txtMasterPK.text = grdVouchers.GetGridData(grdVouchers.row, 0);
            data_bimc00050_1.Call("SELECT");
        break;
		case 'grdDetail':
            data_bimc00050_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bimc00050_1": 
            OnSearch('grdDetail');                
        break; 		
   }            
}

//===================================================================================
function OnSave()
{
    if ( txtMasterPK.text != '' )
    {
        data_bimc00050_2.Call();        
    }
    else
    {
        alert('Pls select data first.');
    }
} 
//===================================================================================
function OnDelete()
{
    grdDetail.DeleteRow();
}
//===================================================================================
function OnReport()
{ 
    
    
} 
//===================================================================================
function OnNew()
{
	var path="";
    if(txtPartnerPK.text !="")
	{
		 path = System.RootURL + '/standard/forms/60/31/60310011.aspx?p_partner_pk='+txtPartnerPK.text+ '&p_type='+lstType.value+ '&p_ccy='+lstCCY.value+ '&p_master_pk='+txtMasterPK.text; 
		var object = System.OpenModal( path ,1050 , 500 , 'resizable:yes;status:yes',this); 	
	}
	else
	{
		alert("Please select partner to add new.");
		return;
	}
}

</script>

<body>
   
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_bimc00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>ac_sel_60310010_search" > 
                <input>                      
                    <input bind="txtPartnerS" />      
                    <input bind="txtTaxCodeS" /> 
                    <input bind="lsTypeS" />
					<input bind="lstStatusS" />
					<input bind="lstCCY_S" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->	
	 <gw:data id="data_bimc00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="ac_sel_60310010_1_mst" procedure=""> 
                <inout> 
                    <inout bind="txtMasterPK" />					
                    <inout bind="txtPartnerPK" /> 
					<inout bind="txtPartnerID" />					
                    <inout bind="txtPartnerName" /> 		
                    <inout bind="lstCCY" /> 
					<inout bind="txtCreditLine" />					
                    <inout bind="txtBalance" /> 
					<inout bind="txtDelReqBalance" />					
                    <inout bind="txtTaxCode" /> 		
                    <inout bind="txtTel" /> 
					<inout bind="txtAddress" /> 		
                    <inout bind="txtEmail" />
                </inout>
            </dso> 
			  
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bimc00050_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>ac_sel_60310010_1_dtl" procedure=""> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bimc00050" > 
                <input>
                     <input bind="txtBalance" />
                     <input bind="txtBalance" />
					 <input bind="txtBalance" />												 
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bimc00050_1" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bimc00050_2" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>  
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bimc00050_3" > 
                <input>
                     <input bind="txtBalance" />
                     <input bind="txtBalance" />	
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
	<!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bimc00050_4" > 
                <input>
                     <input bind="txtMasterPK" />              
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
	<!--------------------------------------------------------------------> 
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    
					<tr style="height: 1%">
                        <td style="width: 5%" align="right"> 
                            Partner
                        </td>
                        <td style="width: 85%">
                            <gw:textbox id="txtPartnerS" styles="width:100%" onenterkey="OnSearch('grdVouchers')" />
                        </td>
						 <td style="width: 10%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Tax Code
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtTaxCodeS" styles="width:100%" onenterkey="OnSearch('grdVouchers')" />
                        </td>
						
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right"> 
                            Type
                        </td>
                        <td colspan="2">
                            <gw:list id="lsTypeS" styles="width:100%;" />
                        </td>
						
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td colspan="2">
                            <gw:list id="lstStatusS" styles="width:100%;" />
                        </td>
						 <td style="width: 1%">
                            
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            CCY
                        </td>
                        <td colspan="2">
                            <gw:list id="lstCCY_S" styles="width:100%;" />
                        </td>
						 <td style="width: 1%">
                            
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|No|Partner ID|Partner Name|CCY|Credit Line|Balance|Del.Req.Balance|Tax Code" 
								format="0|0|0|0|0|-0|-0|-0|0" aligns="0|0|0|0|0|0|0|0|0"
                                defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0" widths="0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                                sorting="T"  oncellclick="OnSearch('Master')" autosize="T" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
			
			
			
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 7%" align="right">
											<a title="Click here to select partner" onclick="OnPopup()" href="#tips">Partner</a>
                                    </td>
                                    <td style="width: 20%">
										<gw:textbox id="txtPartnerID" styles="width:100%" /> 
                                    </td>
									<td style="width: 30%">
										<gw:textbox id="txtPartnerName" styles="width:100%" />
                                    </td>									
									<td  style="width: 5%" align="right">Type</td>		
                                    <td style="width: 17%" align="center">
										<gw:list id="lstType" styles="width:100%;" />																			
                                    </td>
                                    <td style="width: 7%" align="right">
                                        CCY
                                    </td>
                                    <td style="width: 11%">
                                        <gw:list id="lstCCY" styles="width:100%;" />
                                    </td>
									<td style="width: 1%">
										<gw:imgBtn id="ibtnNew" img="new" alt="New" onclick="OnNew()" />
									</td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="ibtnReport" styles="display:;" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">	
						 <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
								
									<td align="right" style="width: 7%">
										Credit Line
									</td>
									<td style="width: 20%"> 
										<gw:textbox id="txtCreditLine" styles="width:100%" type="number" format="###,###,###,###.#" />
									</td>
									<td align="right" style="width: 14%; white-space: nowrap">
										Balance
									</td>
									<td style="width: 15%">
										<gw:textbox id="txtBalance" styles="width:100%" type="number" format="###,###,###,###.#" />
									</td>                       
									<td align="right" style="width: 28%">
										Delivery Request Balance
									</td>
									<td style="width: 16%">
										<gw:textbox id="txtDelReqBalance" styles="width:100%" type="number" format="###,###,###,###.#" />
									</td>
								</tr>
							</table>																
						</td>
                    </tr> 
					<tr style="height: 2%">	
						 <td style="background-color: #B4E7FF" colspan="11"> 
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
								
									<td align="right" style="width: 7%">
										Tax Code
									</td>
									<td style="width: 20%"> 
										<gw:textbox id="txtTaxCode" styles="width:100%" />
									</td>
									<td align="right" style="width: 14%; white-space: nowrap">
										Tel
									</td>	
									<td style="width: 16%">
										<gw:textbox id="txtTel" styles="width:100%" />
									</td>                       
									<td align="right" style="width: 6%">
										Address
									</td>
									<td style="width: 16%">
										<gw:textbox id="txtAddress" styles="width:100%" />
									</td>
									<td align="right" style="width: 5%">
										Email
									</td>
									<td style="width: 18%">
										<gw:textbox id="txtEmail" styles="width:100%" />
									</td>
								</tr>
							</table>																
						</td>
                    </tr> 
                    <tr style="height: 2%"> 
						<td>
							<table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td style="width: 5%" align="left">
			                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
			                                style="cursor: hand" onclick="OnToggle()" />
			                        </td>
			                        <td align="right" style="width: 5%; white-space: nowrap">
			                          Tr.Date 
			                        </td>
			                        <td align="right" style="width: 20%" >
			                            <gw:datebox id="dtFrom" lang="1" />
										~<gw:datebox id="dtTo" lang="1" />
			                        </td>
			                        <td  style="width: 1%" >
			                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('detail')" />
			                        </td>
			                        <td style="width: 21%" >
			                            
			                        </td>										
									<td style="width: 46%">			                            
			                        </td>																			
									<td style="width: 1%">
			                          
			                        </td>																		 
			                        <td align="right" style="width: 1%">
										
			                        </td>										
								</tr>
							</table>	
						</td>                       																
                    </tr>
                    <tr style="height: 94%">
                        <td>
                            <gw:grid id='grdDetail' header='_PK|_M_PK|Seq|Tr.Date|Tr.Type|Tr.Amount|Credit Line|Balance|Del.Req.Bal|Charger|Remark|ccy'
                                format='0|0|0|4|0|-2|-2|-2|-2|0|0|0' 
								aligns='0|0|0|0|0|3|3|3|3|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1' widths='0|0|800|1200|1500|1500|1500|1500|1500|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' autosize="F" onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtNumFormat" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtPartnerPK" styles="width: 100%;display: none" />
</html>
