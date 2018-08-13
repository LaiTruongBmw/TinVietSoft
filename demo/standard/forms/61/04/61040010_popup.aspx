<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work Item</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
//=============================================================================
function BodyInit()
{
       
		
        System.Translate(document);
        BindingDataList();
       
		var _Project_pk = "<%=Request.querystring("Project_pk")%>"; 
        txtProject_Pk.text = _Project_pk;
        var _Work_Code = "<%=Request.querystring("Code")%>"; 
        txtOrderCode.text = _Work_Code;
        var _Pk = "<%=Request.querystring("MasterPk")%>"; 
        txtPk.text = _Pk;
		data_kpbm00011.Call("SELECT");
}   
//=============================================================================  
function BindingDataList()
{
        data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0009' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
        lstForeign.SetDataText(data); 
        data = "<%=ESysLib.SetListDataSQL("SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>"; 
        lstCurrency.SetDataText(data); 
        data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0010' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
        lstService.SetDataText(data); 
        data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0011' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
        lstContMed.SetDataText(data); 
        data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0017' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 
        lstTaxExeRt.SetDataText(data); 
        lstTaxExeRt.value='0';
        data = "DATA|Y|Yes|N|No";
		lstQuotation.SetDataText(data); 
}
//=============================================================================
function OnSearch()
{
    data_kpbm00011.Call("SELECT");
}
//=============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charge':
            var fpath = System.RootURL + "/form/61/04/61040010_popup_search_emp.aspx" ;
            var obj = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes;');
            if (obj!=null)
            {
                txtEmpPK.text=obj[0];
                txtEmpID.text=obj[1];
                txtEmpName.text=obj[2];
            }
        break;
        case 'LGCM0100':        
             var path = System.RootURL + "/form/61/04/61040010_popup_1.aspx?code=ACAB0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstCurrency.SetDataText(object[1]);
			 }
        break;
        case 'TPS0010':        
             var path = System.RootURL + "/form/61/04/61040010_popup_1.aspx?code=TPS0010";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstService.SetDataText(object[1]);
			 }
        break;
        case 'TPS0009':        
             var path = System.RootURL + "/form/61/04/61040010_popup_1.aspx?code=TPS0009";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstForeign.SetDataText(object[1]);
			 }
        break;
        case 'TPS0011':        
             var path = System.RootURL + "/form/61/04/61040010_popup_1.aspx?code=TPS0011";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstContMed.SetDataText(object[1]);
			 }
        break;
        case 'TPS0017':        
             var path = System.RootURL + "/form/61/04/61040010_popup_1.aspx?code=TPS0017";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstTaxExeRt.SetDataText(object[1]);
			 }
        break;
        
        
    }      
} 
//=============================================================================
function OnDataReceive()
{
}
//=============================================================================
function OnSave()
{
   		var i;
		//for(i = 1; i<Grid_Detail.rows; i++)
//		{
//				if(Grid_Detail.GetGridData(i, 0) == 'E')
//				{
//							
//				}
//		}
		
		//txtOrderCode.SetDataText(lstService.value + '00' );
    data_kpbm00011.Call();
}
//=============================================================================
function Cancel()
{
    this.close();
}
//=============================================================================
</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_kpbm00011"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="pm_sel_61040010_popup" procedure="pm_upd_61040010_popup">
                <input>
                    <inout bind="txtPk" />
                    <inout bind="txtOrderCode" />
                    <inout bind="txtOrderName" />
                    <inout bind="lstCurrency" />                    
                    <inout bind="lstService" />
                    
                    <inout bind="lstForeign" />
                    <inout bind="txtWorkCode" />   
                    <inout bind="lstContMed" />     
                    <inout bind="dtExpOrdDt" />                                
                    <inout bind="lstTaxExeRt" />
                    
                    <inout bind="txtEmpPK" /> 
                    <inout bind="txtEmpID" />
                    <inout bind="txtEmpName" />   
                    <inout bind="lstQuotation" />    
                    <inout bind="txtProject_Pk" />                                                                                                              
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
      <gw:data id="dso_search" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"   function="pm_sel_61040010_popup_2" > 
            <input bind="Grid_Detail">                    
                <input bind="txtProject_Pk" /> 
            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
    <table style="height: 100%; width: 100%" cellpadding="1" cellspacing="1">
        <tr style="height: 1%; width: 100%">
            <td width="95%" align="right">
                <gw:imgbtn id="btSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
            <td align="right">
                <gw:imgbtn id="btCancel" img="cancel" alt="Cancel" onclick="Cancel()" />
            </td>
        </tr>
        <tr style="height: 79%; width: 100%">
            <td width="100%" colspan="2">
                <table style="width: 100%; height: 100%" border="2">
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap"><a title="Placement Order Work Division Code" style="color:#333">
                            Order Work Div. Cde</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:textbox id="txtPk" readonly="true" styles='width:100%;display:none' />
                            <gw:textbox id="txtOrderCode"  styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap"><a title="Placement Order Work Division Name" style="color:#333">
                            Order Work Div. Name</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:textbox id="txtOrderName" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" style="text-decoration: none" onClick="OnPopUp('LGCM0100')">Currency&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstCurrency" readonly="true" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" style="text-decoration: none" onClick="OnPopUp('TPS0010')">Service Type&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstService" readonly="true" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" title="Registered Work Division" style="text-decoration: none" onClick="OnPopUp('TPS0009')">Reg. W. Div&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstForeign" readonly="true" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap"><a title="Safety Control Cost Application Rate" style="color:#333">
                            Sfty Cost Appl. Rate</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:textbox id="txtWorkCode" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" style="text-decoration: none" onClick="OnPopUp('TPS0011')">Contract Type&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstContMed" readonly="true" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a title="Quotation without Quantity  (Yes/No)" style="color:#333">Quotation W/O Q'ty (Yes/No)&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstQuotation"  styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a title="Placement Order Expected Year/Month" style="color:#333">Order Exp. Mth/Yr</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:datebox type="month" id="dtExpOrdDt" lang="1" styles='width:100%' nullaccept="T" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" style="text-decoration: none" onClick="OnPopUp('TPS0017')">Tax Exemption
                                Rate&nbsp;</a>
                        </td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:list id="lstTaxExeRt" readonly="true" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 35%; white-space: nowrap">
                            <a href="#" style="text-decoration: none" onClick="OnPopUp('Charge')">Person in Charge</a></td>
                        <td style="width: 65%; white-space: nowrap">
                            <gw:textbox id="txtEmpPK" readonly="true" styles='width:100%;display:none' />
                            <gw:textbox id="txtEmpID" readonly="true" styles='width:30%' />
                            <gw:textbox id="txtEmpName" readonly="true" styles='width:70%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr height="20%" style="display:none">
        			<td colspan="2">
                <!--header="0.Code|1.Order Work Division Name|2.Currency|3.Domestic / Foreign Equipment Description|4.Service Type|5.Registered Work Division|6.Refer to Headoffice's Safety Control Cost Rate|7.Placement Order Expected Year/Month|8.Contract Type|9.Tax Exemption Rate|10.Quotation without Quantity  (Yes/No)|11.Outsource Change Times (Serial No.)|12.Progress Status|13.Responsible Person|14._emp_pk|15._pro_pk|16._pk"   -->
                <gw:grid id="Grid_Detail" 
                header="Code|Order Work Division Name|Currency|Domestic / Foreign Equipment Description|Service Type|Registered Work Division|Refer to Headoffice's Safety Control Cost Rate|Placement Order Expected Month/Year|Contract Type|Tax Exemption Rate|Quotation without Quantity  (Yes/No)|Outsource Change Times (Serial No.)|Progress Status|Responsible Person|_emp_pk|_pro_pk|_pk"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|1|1|1|0|3|1|3|1|1|0|0|0|0|0|0"
                    defaults="||||||||||||||||" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" 
                    widths="2000|3000|1000|4000|1500|2500|4000|3500|1500|2500|3300|3200|1500|2500|0|0|0"
                    styles="width:100%; height:100%" 
                    sorting="T" 
                    oncelldblclick="" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
</body>
</html>
