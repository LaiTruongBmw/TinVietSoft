<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

var vnt_Click = true;
var vnt_RefreshNode = null;
var vnt_Change = true;
var Insert      = 'F';

var col = 0;
var g_r_pk                      = col++,                    
    g_r_rpt_cd                  = col++,
    g_r_rpt_nm                  = col++,
    g_r_rpt_lnm                 = col++,
    g_r_rpt_fnm                 = col++,
    g_r_rpt_remark              = col++,
    g_r_rpt_share               = col++,
    g_r_rpt_active              = col++,
    g_r_rpt_type                = col++,
    g_r_rpt_path                = col++,
    g_r_tes_rpt_manager_grp_pk  = col++;

col = 0;
var g_p_pk                      = col++,
    g_p_seq                     = col++,
    g_p_form_ctrl_id            = col++,
    g_p_req_id                  = col++,
    g_p_use_yn                  = col++,
    g_p_require_yn              = col++,
    g_p_require_message         = col++,
    g_p_remarks                 = col++,
    g_p_tes_rpt_manager_pk      = col++;


var g_f_pk = 0,
    g_f_Seq = 1,
    g_f_Form_ID = 2,
    g_f_Form_Version = 3,
    g_f_Use_yn = 4,
    g_f_tes_rpt_manager_pk = 5;

var enuNewEdit = "SELECT";

function BodyInit() {
    System.Translate(document);
    BindingDataList();
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
}

function BindingDataList()
{   
    var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>"; 
    lst_tco_company.SetDataText(ls_data);


    ls_data      = "<%=CtlLib.SetListDataSQL("SELECT NULL, 'All' FROM DUAL UNION ALL SELECT T1.PK, T1.GRP_CD || '-' || T1.GRP_NM FROM TES_RPT_MANAGER_GRP T1 WHERE T1.DEL_IF = 0")%>"; 
    lstReportGroup.SetDataText(ls_data);

    ls_data      = "<%=CtlLib.SetListDataSQL("SELECT NULL, 'All' FROM DUAL UNION ALL SELECT T1.PK, T1.GRP_CD || '-' || T1.GRP_NM FROM TES_RPT_MANAGER_GRP T1 WHERE T1.DEL_IF = 0")%>"; 
    lstReportGroup2.SetDataText(ls_data);
    
    OnSearch();
}

function OnDataReceive(obj)
{
    switch (obj.id) {
        case "dataReport_Ctrl":
            dataParameter.Call("SELECT");
            //console.log(enuNewEdit);
            if (enuNewEdit == "DELETE") {
                grdReport.RemoveRow();
                
            }else if(enuNewEdit != "SELECT") {
                dataReport.Call("SELECT");
            }
            enuNewEdit = "";
            break;

        case "dataParameter":
                dataFormUse.Call("SELECT");
            break;
    }
}

function OnSearch() {
    dataReport.Call("SELECT");
}

function OnSaveReport() {
    if (ValidateData()) {
        dataReport_Ctrl.Call();
    }
}

function OnSearchCtrl() {
    var row = event.row;
    txtReportPK.text = grdReport.GetGridData(row, 0);
    enuNewEdit = "SELECT";
    dataReport_Ctrl.Call(enuNewEdit);
    
}


function OnNewReport() {
    dataReport_Ctrl.StatusInsert();
    txtRpt_CD.GetControl().focus();
    chkShare.value = 'Y';
    chkActive.value = 'Y';
    enuNewEdit = "INSERT";
}

function OnDeleteReport() {
    if (confirm("Are you sure you want to delete this report?")) {
        dataReport_Ctrl.StatusDelete();
        dataReport_Ctrl.Call();
        enuNewEdit = "DELETE";
    }
}


function OnNewPara() {
    grdParameter.AddRow();
    grdParameter.SetGridText(grdParameter.rows - 1, g_p_use_yn, -1);
    grdParameter.SetGridText(grdParameter.rows - 1, g_p_tes_rpt_manager_pk, txtReportPK.text);
}

function OnSavePara() {
    dataParameter.Call();
}

function OnDeletePara() {
    if (confirm("Are you sure you want to delete this parameter?")) {
        grdParameter.DeleteRow();
        dataParameter.Call();
    }
}

function OnNewForm() {
    grdFormUse.AddRow();
    grdFormUse.SetGridText(grdFormUse.rows - 1, g_f_Use_yn, -1);
    grdFormUse.SetGridText(grdFormUse.rows - 1, g_f_tes_rpt_manager_pk, txtReportPK.text);
}

function OnSaveForm() {
    dataFormUse.Call();
}


function OnDeleteForm() {
    if (confirm("Are you sure you want to delete this parameter?")) {
        grdFormUse.DeleteRow();
        dataFormUse.Call();
    }
}

function ValidateData() {
    if (txtRpt_CD.text == "") {
        alert("Report Code is not null !");
        txtRpt_CD.GetControl().focus();
        return false;
    }
    return true;
}

</script>
 
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0">
<!-------------------------------------------------->        
<gw:data id="dataReport" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="" function="ac_sel_60010200" procedure=""> 
            <input> 
                <input bind="lst_tco_company" />
                <input bind="txtReport" />
                <input bind="lstShare" />
                <input bind="lstActive" />
                <input bind="lstReportGroup" />
                <input bind="txtForm" /> 
             </input>
            <output  bind="grdReport"/>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dataReport_Ctrl" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="ac_sel_60010200_1" procedure="ac_upd_60010200_1" > 				
			<inout>
				<inout bind="txtReportPK" /> 
                <inout bind="txtRpt_CD" /> 
                <inout bind="txtRpt_NM" /> 
                <inout bind="txtRpt_LNM" /> 
                <inout bind="txtRpt_FNM" />
                <inout bind="txtRemark" /> 
                <inout bind="chkShare" /> 
                <inout bind="chkActive" /> 
                <inout bind="lstReportType" /> 
                <inout bind="txtPath" /> 
                <inout bind="lstReportGroup2" /> 
                <inout bind="lst_tco_company" /> 
			</inout>
		</dso> 
	</xml> 
</gw:data>
    
    
<gw:data id="dataParameter" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ac_sel_60010200_para" procedure="ac_upd_60010200_para"> 
            <input> 
                <input bind="txtReportPK" />
             </input>
            <output  bind="grdParameter"/>
        </dso> 
    </xml> 
</gw:data>

    
<gw:data id="dataFormUse" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,5" function="ac_sel_60010200_form" procedure="ac_upd_60010200_form"> 
            <input> 
                <input bind="txtReportPK" />
             </input>
            <output  bind="grdFormUse"/>
        </dso> 
    </xml> 
</gw:data>

<!------------------------ Main Table -------------------------->    
<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
    <tr valign="top" style="height:100%">    
        <td style="width: 25%;height: 100%" align ="top" >
            <table width="100%" height="100%" align="top">
            <tr style="height: 1%">
                <td width="25%" align="left">Company</td>
	            <td width="70%" align="left"  valign="top" colspan="3">
	                <gw:list id="lst_tco_company" value="" styles="width:100%" ></gw:list></td>
                <td style="width: 5%"></td>
            </tr>

            <tr  style="height: 1%">
                <td width="10%" align="left">Code/Name</td>
	            <td valign="top" colspan="3">
	                <gw:textbox id="txtReport"  text=""  styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" /></td>
                <td style="width: 5%"></td>
            </tr>
            <tr  style="height: 1%">
                <td width="25%" align="left">Share</td>
	            <td width="25%" align="left"  valign="top"><gw:list id="lstShare"  value="" styles="width:100%" onchange="OnSearch()"><data>data||All|Y|Yes|N|No</data></gw:list></td>
                <td align="right" style="width: 20%">Active</td>
                <td style="width: 25%"><gw:list id="lstActive"  value="" styles="width:100%" onchange="OnSearch()"><data>data||All|Y|Yes|N|No</data></gw:list></td>
                <td style="width: 5%"></td>
            </tr>
            <tr  style="height: 1%">
                <td> Report Group</td>
                <td colspan="3"><gw:list id="lstReportGroup"></gw:list></td>
                <td></td>
            </tr>
            <tr  style="height: 1%">
                <td>Form</td>
                <td colspan="3"><gw:textbox id="txtForm"  text=""  styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" /></td>
                <td><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
            </tr>
            <tr style="height: 90%">
                <td colspan="5" style="width: 100%">
                    <gw:grid   
			            id="grdReport"  
			            header   = "_pk|Report ID|Report Name|Local Name|Forei Name|Remark|Share Y/N|Active Y/N|Type|Path|_tes_rpt_manager_grp_pk"
			            format   = "0|0|0|0|0|0|3|3|0|0|0"
			            aligns   = "0|0|0|0|0|0|0|0|0|0|0"
			            defaults = "|||||||||||" 
			            editcol  = "0|0|1|0|0|0|0|0|0|0|0"   
			            widths   = "0|1500|2000|2000|2000|2000|1000|1000|1000|2000|2000"
			            styles   = "width:100%; height:100%"   
                        oncellclick="OnSearchCtrl()"
			            sorting  = "T"
			            param    = "0,1,2,3,4,5,6,7,8,9"/> 
                </td>
            </tr>
        </table>
        </td>
        
        <td style="width: 75%; height: 100%">
            <table style="width: 100%; height: 100%">
                <tr valign="top" style="width:100%;height:0%">
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>

                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    
                    <td style="width: 5%"></td>
                    <td style="width: 5%"></td>
                    
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>

                    <td style="width: 7%"></td>
                    <td style="width: 1%"></td>
                    <td style="width: 1%"></td>
                    <td style="width: 1%"></td>
                </tr>        
                <tr valign="top" style="width:100%;height:2%">
                    <td width="10%" align="left">Code</td>
	                <td width="10%" align="left"><gw:textbox id="txtRpt_CD"  text=""  styles="width:100%" onenterkey=""/></td>
	                <td align="center">Share<gw:checkbox id="chkShare"  value="N" defaultvalue="Y|N" onclick=""/></td>
                    <td align="center">Active<gw:checkbox id="chkActive"  value="N" defaultvalue="Y|N" onclick=""/></td>
                    <td></td>
                    <td align="left">Type</td>
                    <td><gw:list id="lstReportType"  value="" styles="width:100%" onchange="OnSearch()"><data>data|xls|Excel|PDF|PDF</data></gw:list></td>
                    <td colspan="4"></td>
                    <td ><gw:imgBtn img="new"  alt="New"    id="btnNewReport" 	styles="width:100%" onclick="OnNewReport()" /></td>
	                <td ><gw:imgBtn img="save"       alt="Save"    id="btnUpdateReport" 	styles="width:100%" onclick="OnSaveReport()" /></td>
			        <td ><gw:imgBtn img="delete"     alt="Delete"  id="btnDeleteReport" 	styles="width:100%" onclick="OnDeleteReport()" /></td> 
                </tr>
                <tr style="width: 100%; height: 2%">
                    <td align="left">Name</td>
	                <td align="left" colspan="3"><gw:textbox id="txtRpt_NM"  text=""  styles="width:100%" onenterkey=""/></td>                
                </tr>
                <tr style="width: 100%; height: 2%">
                    <td align="left">Local Name</td>
	                <td align="left" colspan="3"><gw:textbox id="txtRpt_LNM"  text=""  styles="width:100%" onenterkey=""/></td>      
                    <td></td>
                    <td align="left">&nbsp;&nbsp;Remark</td>
	                <td align="left" colspan="3"><gw:textbox id="txtRemark"  text=""  styles="width:100%" onenterkey=""/></td>                          
                </tr>
                <tr style="width: 100%; height: 2%">
                    <td align="left">Foreign Name</td>
	                <td align="left" colspan="3"><gw:textbox id="txtRpt_FNM"  text=""  styles="width:100%" onenterkey=""/></td> 
                    <td></td>               
                    <td align="left">&nbsp;&nbsp;Path</td>
	                <td align="left" colspan="3"><gw:textbox id="txtPath"  text=""  styles="width:100%" onenterkey=""/></td>                
                </tr>
                <tr style="height: 2%">
                    <td> Report Group</td>
                    <td colspan="3"><gw:list id="lstReportGroup2"></gw:list></td>
                    <td colspan="9"></td>
                </tr>
                <tr style="height: 2%">
                    <td><b>Report Parameter</b></td>
                    <td colspan="10"></td>
                    <td ><gw:imgBtn img="new"  alt="New"    id="btnNewPara" 	styles="width:100%" onclick="OnNewPara()" /></td>
	                <td ><gw:imgBtn img="save"       alt="Save"    id="btnUpdatePara" 	styles="width:100%" onclick="OnSavePara()" /></td>
			        <td ><gw:imgBtn img="delete"     alt="Delete"  id="btnDeletePara" 	styles="width:100%" onclick="OnDeletePara()" /></td> 
                </tr>
                <tr style="height: 43%">
                    <td style="width: 100%" colspan="14">		            
		                <gw:grid   
			                id="grdParameter"  
			                header   = "_pk|Seq|Form Control ID|Requet ID|Use Y/N|Require Y/N|Require Message|Remark|_tes_rpt_manager_pk"
			                format   = "0|0|0|0|3|3|0|0|0"
			                aligns   = "0|0|1|0|0|0|0|0|0"
			                defaults = "|||||||||" 
			                editcol  = "1|1|1|1|1|1|1|1|1"   
			                widths   = "0|1000|2000|2000|2000|2000|2500|2000|2000"
			                styles   = "width:100%; height:100%"   
			                sorting  = "T"
			                param    = "0,1,2,3,4,5,6,7,8,9"/> 
	                </td>
                </tr>            
                <tr style="height: 5%">
                    <td style="width: 10%" align="left"><b>&nbsp;Form Use</b></td>
                    <td colspan="10"></td>
                    <td ><gw:imgBtn img="new"  alt="Save"    id="idBtnNew" 	styles="width:100%" onclick="OnNewForm()" /></td>
	                <td ><gw:imgBtn img="save"       alt="Save"    id="idBtnUpdate" 	styles="width:100%" onclick="OnSaveForm()" /></td>
			        <td ><gw:imgBtn img="delete"     alt="Delete"  id="idBtnDelete" 	styles="width:100%" onclick="OnDeleteForm()" /></td> 
			        <td align="right"><b>&nbsp;</b></td>
                </tr>                                             
                <tr style="height: 40%">
                    <td colspan="14" style="width: 100%; height: 100%">		            
		                <gw:grid   
			                id="grdFormUse"  
			                header   = "_pk|Seq|Form ID|Form Version|Use Y/N|_tes_rpt_manager_pk"
			                format   = "0|0|0|0|3|0"
			                aligns   = "0|0|0|0|0|0"
			                defaults = "||||"
			                editcol  = "1|1|1|1|1|1"   
			                widths   = "2000|2000|2200|1500|0"
			                styles   = "width:100%; height:100%"   
			                sorting  = "T"
			                param    = "0,1,2,3,4,5,6,7"  /> 
	                </td>
                </tr>            
            </table>
        </td>
    </tr>
</table>

<gw:textbox id="txtReportPK" styles='display:none' />

<gw:textbox id="txtAc_level" styles='display:none' />
<gw:textbox id="txtSesion_company" styles='display:none' />
<gw:textbox id="txtUser_Pk"  styles='display:none' />

</body>

</html>