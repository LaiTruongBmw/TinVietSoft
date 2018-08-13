<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Subcontract List</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit() 
{
      System.Translate(document);
	  BindingDataList();
}  
//==========================================================================
function BindingDataList()
{
     Grid_Detail.GetGridControl().FrozenCols = 4;
	  ibtnsubctrctRqst.SetEnable(false);
	  Grid_Detail.GetGridControl().WordWrap = true;
      Grid_Detail.GetGridControl().RowHeight(0) = 450 ;
} 

//==========================================================================
function OnPopUp(pos)
{
    switch(pos) 
    {
        case 'project':
		    var path = System.RootURL + '/form/61/03/61030010_1.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProject_Pk.text = object[0];
                txtProject_Cd.text = object[1];
                txtProject_Nm.text = object[2]; 
			    OnSearch();
		    }
	    break;
		case 'order_w':
		  if (txtProject_Pk.GetData()!= '')
		   {
				var fpath = System.RootURL + "/form/61/04/61040050_Order_W_Div.aspx?p_project_pk=" + txtProject_Pk.text;
				var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
				if ((aValue != null)&&(aValue[0]!=""))
				{
					txtOrder_pk.text = aValue[0];
					txtOrder_Cd.text = aValue[1];
					txtOrder_nm.text = aValue[2];
				}
		   }else{
				alert('Please select project first.');
				return;
		   }
		break;
		case 'SubcontractRequest':
			if(Grid_Detail.rows > 2)//prog status=?--->open popup?
			{
				if(Grid_Detail.row !='-1')
				{
					System.Menu.NewWindow( "form/61/05/61050010_subcontract_request.aspx?p_pk="+Grid_Detail.GetGridData(Grid_Detail.row, 0)+"&p_code="+Grid_Detail.GetGridData(Grid_Detail.row, 1)+"&p_nuture_of_w="+Grid_Detail.GetGridData(Grid_Detail.row, 2)+"&p_project_pk="+txtProject_Pk.text+"&p_project_code="+txtProject_Cd.text+"&p_project_name="+txtProject_Nm.text+"&p_currency="+Grid_Detail.GetGridData(Grid_Detail.row, 6)+"&p_BCWS_adj="+Grid_Detail.GetGridData(Grid_Detail.row, 7)+"&p_service_type="+Grid_Detail.GetGridData(Grid_Detail.row, 16) , "Subcontract Request", "Subcontract Request", "Subcontract Request" );
					//var path = System.RootURL + "/form/kp/cs/kpcs311_subcontract_request.aspx?encode_yn=Y&p_pk="+url_encode(Grid_Detail.GetGridData(Grid_Detail.row, 0))+"&p_code="+url_encode(Grid_Detail.GetGridData(Grid_Detail.row, 1))+"&p_name="+url_encode(Grid_Detail.GetGridData(Grid_Detail.row, 2))+"&p_project_pk="+txtProject_Pk.text+"&p_project_code="+url_encode(txtProject_Cd.text)+"&p_project_name="+url_encode(txtProject_Nm.text)+"";  
					//var path = System.RootURL + "/form/kp/cs/kpcs311_subcontract_request.aspx?p_pk="+Grid_Detail.GetGridData(Grid_Detail.row, 0)+"&p_code="+Grid_Detail.GetGridData(Grid_Detail.row, 1)+"&p_nuture_of_w="+Grid_Detail.GetGridData(Grid_Detail.row, 2)+"&p_project_pk="+txtProject_Pk.text+"&p_project_code="+txtProject_Cd.text+"&p_project_name="+txtProject_Nm.text+"&p_currency="+Grid_Detail.GetGridData(Grid_Detail.row, 6)+"&p_BCWS_adj="+Grid_Detail.GetGridData(Grid_Detail.row, 7)+"&p_service_type="+Grid_Detail.GetGridData(Grid_Detail.row, 12); 			
					//var object = System.OpenModal( path ,900 , 780 , 'resizable:yes;status:yes');
				}
			}
	    break;
    }
}
function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
}
//==========================================================================
function OnSearch()
{
	if(txtProject_Pk.text != '')
	{
			dso_search.Call('SELECT');	
	}
	else
	{
			alert('Please select Project !!');	
	}
}
//--------------------------------------------------------------------------
function formfuntion(index)
{
	switch(index)
	{
		case "0":
			OnSearch();
		break;
		case "1": // confirm ordering
			dso_confirmorder.Call();
		break;
	}
}
//==========================================================================
function OnDataReceive(obj)
{
	switch(obj.id)
	{
	        case 'dso_cancel':
	                dso_search.Call('SELECT');
	        break;
	        case 'dso_confirm':
	                dso_search.Call('SELECT');
	        break;
			case 'dso_search':
				var bcws_amt = 0;
				var chang_amt = 0;
				var balance =0 ;
                for(var i=1; i<Grid_Detail.rows;i++)
				{
					bcws_amt = Grid_Detail.GetGridData(i,8);
					chang_amt = Grid_Detail.GetGridData(i,11);
					balance = System.Round( Number(bcws_amt),2) - System.Round( Number(chang_amt),2);
					Grid_Detail.Subtotal(1,2,1,"7!8!9!10!11!12","Total",true,5,"Total");
					
				}
			break;
			case 'dso_cancel_3':
			    dso_search.Call('SELECT');
			break;
	}
}

//--------------------------------------------------------------------------
function button_status(_p_status)
{
	switch(_p_status)
	{
		case "0":
			ibtnBOQ.SetEnable(true);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(true);
			ibtnCancel.SetEnable(false);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
		case "1":
			ibtnBOQ.SetEnable(true);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(true);
			ibtnCancel.SetEnable(false);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
		case "2":
			ibtnBOQ.SetEnable(true);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(false);
			ibtnCancel.SetEnable(true);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
		case "3":
			ibtnBOQ.SetEnable(false);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(false);
			ibtnCancel.SetEnable(true);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
        case "4":
            ibtnsubctrctRqst.SetEnable(false);
			ibtnBOQ.SetEnable(false);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(false);
			ibtnCancel.SetEnable(false);
			if (Grid_Detail.GetGridData(Grid_Detail.row,12) > 1)
			{
			  ibtnAdj.SetEnable(true);
			}else{
			  ibtnAdj.SetEnable(false);
            } 
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
        case "5":
			ibtnBOQ.SetEnable(false);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(true);
			ibtnCancel.SetEnable(false);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
		case "6":
			ibtnBOQ.SetEnable(false);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(true);
			ibtnCancel.SetEnable(false);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
        case "7":
			ibtnBOQ.SetEnable(false);
			ibtnIncrease.SetEnable(false);
			ibtnDecrease.SetEnable(false);
			ibtnConfirm.SetEnable(true);
			ibtnCancel.SetEnable(false);
			ibtnAdj.SetEnable(true);
			ibtnViewOrderdetail.SetEnable(true);
			ibtnSearch.SetEnable(true);
		break;
	}
}
//--------------------------------------------------------------------------
function RowClick()
{
	button_status(Grid_Detail.GetGridData(Grid_Detail.row,19));
	var code =  Grid_Detail.GetGridData(Grid_Detail.row, 1);
	txtCode.text =  code.substring(0,1);
	txtOrderingContType_Pk.text = Grid_Detail.GetGridData(Grid_Detail.row,0);
	if(Grid_Detail.GetGridData(Grid_Detail.row,4)=="")
	{
		ibtnsubctrctRqst.SetEnable(true);
	}
	else
	{
		ibtnsubctrctRqst.SetEnable(false);
	}
} 
//--------------------------------------------------------------------------
function ViewOrderDetail()
{
			if(Grid_Detail.row !="-1")
			{
				if(txtCode.text == 'E')
				{
					 var path = System.RootURL + '/form/61/05/61050010_popup_equipment.aspx?pk=' + txtOrderingContType_Pk.text + '&Project_Pk=' + txtProject_Pk.text;
					var object = System.OpenModal( path ,950 , 600 , 'resizable:yes;status:yes');
				}
				if(txtCode.text == 'S')
				{
						var path = System.RootURL + '/form/61/05/61050010_popup_const.aspx?pk=' + txtOrderingContType_Pk.text + '&Project_Pk=' + txtProject_Pk.text;
						var object = System.OpenModal( path ,900 , 500 , 'resizable:no;status:yes');
				}
			}
			else
			{
					alert('Please select a row !!');	
			}
			
			
}
//--------------------------------------------------------------------------
function Adj_Detail()
{
    if((Grid_Detail.GetGridData(Grid_Detail.row, 19)) == '2')
    {
        var path = System.RootURL + '/form/61/05/61050010_popup_adj.aspx?Code=' + txtCode.text + '&pk=' + txtOrderingContType_Pk.text + '&Project_Pk=' + txtProject_Pk.text;
		var object = System.OpenModal( path ,700 , 200 , 'resizable:no;status:yes;scrollbars:no');
		dso_search.Call('SELECT');	
    }
    else if((Grid_Detail.GetGridData(Grid_Detail.row, 19)) == '3')
    {
        var path = System.RootURL + '/form/61/05/61050010_popup_adj_3.aspx?Code=' + txtCode.text + '&pk=' + txtOrderingContType_Pk.text + '&Project_Pk=' + txtProject_Pk.text + '&Contract_No=' + Grid_Detail.GetGridData(Grid_Detail.row, 18);
		var object = System.OpenModal( path ,900 , 500 , 'resizable:no;status:yes;scrollbars:no');
		dso_search.Call('SELECT');
    }
}
//--------------------------------------------------------------------------
function OnConfirm()
{
			dso_confirm.Call();
}
function OnCancel()
{
    if(confirm('Are you sure you want to cancel ?'))
   {       
            if(Grid_Detail.GetGridData(Grid_Detail.row, 19) == 2)
            { 
                    dso_cancel.Call();
            }
            else
            {
                    dso_cancel_3.Call();
            } 
    } 
}
function OnPrint(obj) {
    switch (obj) {
        case '1':
            var url = '/reports/kp/cs/kpcs311_rpt.aspx?tecps_projectsumm_pk=' + txtProject_Pk.text;
            System.OpenTargetPage(System.RootURL + url);
            break;
        case 'BOQ':
            var url = '/reports/kp/cs/kpcs311_BOQ.aspx?Project_Pk=' + txtProject_Pk.text + '&Pk=' + txtOrderingContType_Pk.text;
            System.OpenTargetPage(System.RootURL + url);
            break;
    } 
}
</script>
<body>
    <gw:data id="dso_search" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"    function="sp_sel_kpcs311_new"    > 
				<input bind="Grid_Detail">                    
					<input bind="txtProject_Pk" /> 
					<input bind="txtOrder_pk" /> 
				</input> 
				<output bind="Grid_Detail" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------->
	 <gw:data id="dso_confirmorder" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"    function="sp_sel_kpcs311_new"    > 
				<input bind="Grid_Detail">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_Detail" /> 
			</dso> 
		</xml> 
	</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
<gw:data id="dso_confirm" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_kpcs311_confirmdetail"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="txtOrderingContType_Pk"/>
                </input>
                <output>
                     <output bind="txtReturn_Pk"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------------------>  
<gw:data id="dso_cancel" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_kpcs311_cancel"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="txtOrderingContType_Pk"/>
                </input>
                <output>
                     <output bind="txtReturn_Pk"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
<!------------------------------------------------------------------------------------------------------------------> 
<gw:data id="dso_cancel_3" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_kpcs311_status3_cancel"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="txtOrderingContType_Pk"/>
                </input>
                <output>
                     <output bind="txtReturn_Pk"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="84%"></td>
							<td><gw:icon id="ibtnsubctrctRqst" img="in" text="Subcontract Request" onclick="OnPopUp('SubcontractRequest')"  style="width: 100%" /></td>
							<td width="2%"></td>
                            <td><gw:icon id="ibtnBOQ" img="in" text="BOQ" onclick="OnPrint('BOQ')"  style="width: 100%" /></td>
                            <td width="2%"></td>
							<td><gw:icon id="ibtnIncrease" img="in" text="Increase S/No" onclick=""  style="width: 100%" /></td>
                            <td width="2%"></td>
							<td ><gw:icon id="ibtnDecrease" img="in" text="Decrease S/No" onclick=""  style="width: 100%" /></td>
                            <td width="2%"></td>
                            <td><gw:icon id="ibtnConfirm" img="in" text="Confirm" onclick="OnConfirm()"  style="width: 100%" /></td>
                            <td width="2%"></td>
							<td><gw:icon id="ibtnCancel" img="in" text="Cancel" onclick="OnCancel()"  style="width: 100%" /></td>
                            <td width="2%"></td>
  						    <td><gw:icon id="ibtnAdj" img="in" text="Create subcontract" onclick="Adj_Detail()" style="width: 100%"  /></td>
                            <td width="2%"></td>
                            <td><gw:icon id="ibtnViewOrderdetail" img="in" text="View order Detail" onclick="ViewOrderDetail()"  style="width: 100%" /></td>
                            <td width="2%"></td>
						    <td><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                           
                        </tr>
						<tr>
							<td width="100%" colspan="16"> 
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
									    <td align="right" width="6%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                                        <td width="40%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="54%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td width="3%">
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
										 <td width="3%"><gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint('1')" /></td>
                                    </tr>
                                </table>
                            </td>
						</tr>
						<tr>
							<td width="100%" colspan="16"> 
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
									    <td align="right" width="6%"><a title="Click here to show outside order work" href="#" style="text-decoration: none" onClick="OnPopUp('order_w')">Order work&nbsp;</a></td>
                                        <td width="40%">
                                            <gw:textbox id="txtOrder_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="54%" colspan="2">
                                            <gw:textbox id="txtOrder_nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtOrder_pk" styles='width:100%;display:none' />
                                        </td>
                                        <td width="3%">
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtOrder_Cd.text='';txtOrder_nm.text='';txtOrder_pk.text='';" />
                                        </td>
									
                                    </tr>
                                </table>
                            </td>
						</tr>
						
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <!-- 0_PK|1.Code|2.Order W. Div. Name|3.Prog. Status|4.Cont. S/No.|5.SubCont. Name|6.Curr.|7.BCWS(Adj.)|8.Subcontract amount|9.Chg. Subcontract amount|10.Balance|11.Reg. W. Div.|12.Service Type|13.Quotation W/O Q'ty  (Yes/No)|14.Start Date|15.Exp. Date|16.Contract No|17_status"   -->
                	<gw:grid id="Grid_Detail" 
                	header="_PK|Code|Order W. Div. Name|Prog. Status|Cont. S/No.|SubCont. Name|Curr.|BCWS(Adj.)(1)|BCWS.(book)(2)|Subct. amt.(Trs. ccy-Orginal)(3)|Subcontract amt.(book.)(4)|Subct. amt(book.-final)(5)|Balance((6)=(2)-(5))|Reg. W. Div.|Service Type|Quotation W/O Q'ty  (Yes/No)|Start Date|Exp. Date|Contract No|_status"
                    format="0|0|0|0|0|0|0|1|1|1|1|1|1|0|0|0|4|4|0|0" 
                    aligns ="0|0|0|1|1|0|1|3|3|3|3|3|3|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0" 
                    widths="0|1000|2500|1800|1000|2000|800|1500|2000|2000|2000|2000|2000|2200|2000|2000|2000|2000|2000|0"
                    styles="width:100%; height:100%" 
                    sorting="T" 
					oncellclick="RowClick()" 
					/>
            </td>
        </tr>
    </table>
<gw:textbox id="txtCode" styles='width:100%;display:none' />    
<gw:textbox id="txtOrderingContType_Pk" styles='width:100%;display:none' />    
<gw:textbox id="txtReturn_Pk" styles='width:100%;display:none' />    
</body>

</html>
