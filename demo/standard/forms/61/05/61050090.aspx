<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>3.1.8 Subcontract Request List</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var ITEM = 0,
    SPECIFICATION = 1,
    UNIT = 2,
    QTY = 3,
    M_UPRICE = 4,
    M_AMOUNT = 5,
    L_UPRICE = 6,
    L_AMOUNT = 7,
    E_UPRICE = 8,
    E_AMOUNT = 9,
    T_UPRICE = 10,
    T_AMOUNT = 11,
    REMARK = 12
//========================================================================================================
function BodyInit() 
{
    System.Translate(document);
    MerGrid();
    Grid_Detail.GetGridControl().FrozenCols = QTY;
    BindingDataList() ;
}
//========================================================================================================
function BindingDataList() 
{
    data = "<%=ESysLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tco_uom a where del_if=0" ) %> "; 
    Grid_Detail.SetComboFormat(UNIT,data);
    var ls_status = "<%=ESysLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='ACBG0010' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    lstStatus.SetDataText(ls_status);  
}
//========================================================================================================
function MerGrid() 
{
        if (Grid_Detail.rows < 2) 
        {
            Grid_Detail.AddRow();
        }
        var fg = Grid_Detail.GetGridControl();
        fg.FixedRows = 2
        fg.MergeCells = 5

        fg.MergeCol(ITEM) = true
        fg.Cell(0, 0, ITEM, 1, ITEM) = "WORK SCOPE/ITEM"

        fg.MergeCol(SPECIFICATION) = true
        fg.Cell(0, 0, SPECIFICATION, 1, SPECIFICATION) = "SPECIFICATION"

        fg.MergeCol(UNIT) = true
        fg.Cell(0, 0, UNIT, 1, UNIT) = "UNIT"

        fg.MergeCol(QTY) = true
        fg.Cell(0, 0, QTY, 1, QTY) = "QTY"

        fg.MergeRow(0) = true
        fg.Cell(0, 0, M_UPRICE, 0, M_AMOUNT) = "MATERIAL"
        fg.Cell(0, 1, M_UPRICE, 1) = "U-PRICE"
        fg.Cell(0, 1, M_AMOUNT, 1) = "AMOUNT"

        fg.Cell(0, 0, L_UPRICE, 0, L_AMOUNT) = "LABOR"
        fg.Cell(0, 1, L_UPRICE, 1) = "U-PRICE"
        fg.Cell(0, 1, L_AMOUNT, 1) = "AMOUNT"

        fg.Cell(0, 0, E_UPRICE, 0, E_AMOUNT) = "EQUIPMENT"
        fg.Cell(0, 1, E_UPRICE, 1) = "U-PRICE"
        fg.Cell(0, 1, E_AMOUNT, 1) = "AMOUNT"

        fg.Cell(0, 0, T_UPRICE, 0, T_AMOUNT) = "TOTAL"
        fg.Cell(0, 1, T_UPRICE, 1) = "U-PRICE"
        fg.Cell(0, 1, T_AMOUNT, 1) = "AMOUNT"

        fg.MergeCol(REMARK) = true
        fg.Cell(0, 0, REMARK, 1, REMARK) = "REMARK"
}
//========================================================================================================
function OnSearch()
{
    dso_master.Call('SELECT');
}
//========================================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_master':

        break;
        case 'dso_detail':
            MerGrid() ;
            Grid_Detail.Subtotal(0,2,0,"5!7!9!11","Total",true,8,"Grand Total");
            DSO_ATTACH_FILE.Call('SELECT');
        break;
        case 'DSO_ATTACH_FILE':
            var vendor = document.all("updating_info"); 
            if(Grid_Attach.rows>1)
            {
                vendor.style.display = "";
                imgup.src = "../../../system/images/up.gif";
            }
            else
            {
                vendor.style.display = "none";
                imgup.src = "../../../system/images/down.gif";
            }
        break;

    }
}

function OnOpenFile(){        var img_pk = Grid_Attach.GetGridData(Grid_Attach.GetGridControl().row,0)	;        var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TECPS_SUBCTREQUESTD_FILE";	        window.open(url);}    
//========================================================================================================
function OnSelect()
{
    txtProject_Cd.text = Grid_Mst.GetGridData(Grid_Mst.row, 1);
    txtProject_Nm.text = Grid_Mst.GetGridData(Grid_Mst.row, 2);
    txtNatureWork.text = Grid_Mst.GetGridData(Grid_Mst.row, 3);
    txtProject_Pk.text = Grid_Mst.GetGridData(Grid_Mst.row, 14);
    txtp_tecps_orderingconttype_Pk.text = Grid_Mst.GetGridData(Grid_Mst.row, 15);
    txtTECPS_SUBCTREQUEST_pk.text = Grid_Mst.GetGridData(Grid_Mst.row, 16);
    dso_detail.Call('SELECT');
}

function OnPrint()
{
     var url ='/reports/61/05/rpt_61050070.aspx?From='+dtTransDate_Fr.value+'&To='+ dtTransDate_To.value + '&Status='+lstStatus.value;
     System.OpenTargetPage( System.RootURL+url , 'newform' );
}

function OnShow() 
{
    var vendor = document.all("updating_info"); 
 
    if ( vendor.style.display == "none" )
    {
        vendor.style.display = "";
        imgup.src = "../../../system/images/up.gif";
    }
    else
    {
        vendor.style.display = "none";
        imgup.src = "../../../system/images/down.gif";
    }
}
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'project':				
			var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
			var obj = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
					
			if ( obj != null )
			{
				txtProjectPK.text 		= obj[0];
				txtProjectCd.text 		= obj[1];
				txtProjectNm.text 		= obj[2];
			}
		break;
    }
}
function OnApprove()
{
    if(txtProjectPK.text != '')
    {
        if(txtTECPS_SUBCTREQUEST_pk.text!='')
        {
            if(confirm('Are you sure you want to approve ?'))
            {
                dso_approve.Call();
            }
        }
        else
        {
            alert('Please select a row master to approve !!');
        }
    }
    else
    {
        alert('Please select Project !!');
    }
}
</script>
<body>
<gw:data id="dso_master" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="pm_sel_61050090"> 
				<input bind="Grid_Mst"> 
                    <input bind="txtProjectPK" /> 
                    <input bind="dtTransDate_Fr" /> 
                    <input bind="dtTransDate_To" />                    
					<input bind="lstStatus" /> 
				</input> 
				<output bind="Grid_Mst" /> 
			</dso> 
		</xml> 
	</gw:data>    

<gw:data id="dso_detail" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="pm_sel_61050090_dtl"> 
				<input bind="Grid_Detail"> 
                    <input bind="txtProject_Pk" /> 
                    <input bind="txtp_tecps_orderingconttype_Pk" /> 
				</input> 
				<output bind="Grid_Detail" /> 
			</dso> 
		</xml> 
	</gw:data>  
    
 <gw:data id="DSO_ATTACH_FILE" onreceive="OnDataReceive(this)">
  <xml>
    <dso id="1" type="grid" parameter="0"  function="pm_sel_61050090_file" >
      <input bind="Grid_Attach" >
      <input bind="txtTECPS_SUBCTREQUEST_pk" />
      </input>
      <output bind="Grid_Attach" />
    </dso>
  </xml>
</gw:data>
      
<gw:data id="dso_approve" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="pm_sel_61050090_approve" > 
                <input> 
                     <input  bind="txtProjectPK" />
                     <input  bind="txtTECPS_SUBCTREQUEST_pk" />
                </input>
                <output>
                     <output  bind="txtRtn" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
   <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
        <tr style="height:2%">
            <td>
                <fieldset style="width:100%;padding:0">
                    <table cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td width="15%" align="right"><a href="#" title="Click here to show Project" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                            <td style="width:65%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%"><gw:textbox id="txtProjectCd" styles="width: 100%"  readonly="T"/></td>
                                        <td width="60%"><gw:textbox id="txtProjectNm" styles="width: 100%"  readonly="T"/></td>
                                        <td width=""><gw:textbox id="txtProjectPK" styles="width: 100%;display:none" /></td>
                                        <td><gw:imgbtn id="btnonfirm" img="reset" alt="Reset" onclick="txtProjectCd.text='';txtProjectNm.text='';txtProjectPK.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="20%"></td>
                            <td><gw:imgbtn id="ibtnUpdte1" img="search" alt="Search" onclick="OnSearch()" /></td>
                            <td><gw:icon id="ibtnUpdte1" img="in" text="Approve" onclick="OnApprove()" /></td>
                            <td><gw:imgbtn id="ibtnUpdte1" img="excel" alt="Print" onclick="OnPrint()" /></td>
                        </tr>
                        <tr>
                            <td align="right" width="">Trans Date&nbsp;</td>
                            <td style="width:">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                            <td><gw:datebox id="dtTransDate_Fr" lang="1" /></td>
                                            <td>~</td>
                                            <td><gw:datebox id="dtTransDate_To" lang="1" /></td>
                                            <td align="right" width="40%">Status&nbsp;</td>
                                            <td width="60%" ><gw:list id="lstStatus" onchange="OnSearch()" styles='width:100%' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        
        <tr style="height:35%">
            <td colspan="">
            <!--header="0.No|1.Project Code|2.Project Name|3.Nature Work|4.Req. No|5.Req. Date|6.Approval Date|7.Approval By|8.Main Contract (A)|9.Budget (B)|10.From Date|11.To Date|12.Status|13.Remark"-->
                <gw:grid id="Grid_Mst" 
                	header="No|Project Code|Project Name|Nature Work|Req. No|Req. Date|Approval Date|Approval By|Main Contract (A)|Budget (B)|From Date|To Date|Status|Remark|_project_pk|_TECPS_ORDERINGCONTTYPE_PK|_TECPS_SUBCTREQUEST_pk"
                    format="0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0" 
                    aligns="1|0|0|0|1|1|1|0|0|0|1|1|1|0|0|0|0"
                    defaults="||||||||||||||||" 
                   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="700|1500|3000|3000|1500|1500|1500|2000|2000|2000|1500|1500|1000|2000|0|0|0"
                    styles="width:100%; height:100%" 
                    sorting="T" 
                    onafteredit=""
                    oncellclick="OnSelect()"
                    />
            </td>
        </tr>
        <tr style="height:2%">
            <td>
                <fieldset style="width:100%;padding:0">
                    <table cellpadding="0" cellspacing="0" style="width:100%">
                        <tr>
                            <td align="right" width="7%">Project&nbsp;</td>
                            <td width="13%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                            <td width="30%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                            <td style="display:none"><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%' /></td>
                            <td align="right" width="15%">Nature Work&nbsp;</td>
                            <td width="35%"><gw:textbox id="txtNatureWork" readonly="true" styles='width:100%' /></td>
                            <td style="display:none"><gw:textbox id="txtp_tecps_orderingconttype_Pk" readonly="true" styles='width:100%' /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        
        <tr style="height:35%">
            <td colspan="">
            <!--header="0.No|1.Project Code|2.Project Name|3.Nature Work|4.Req. No|5.Req. Date|6.Approval Date|7.Approval By|8.Main Contract (A)|9.Budget (B)|10.From Date|11.To Date|12.Status|13.Remark"-->
                <gw:grid id="Grid_Detail" 
                	header="WORK SCOPE/ITEM|SPECIFICATION|UNIT|QTY|U-PRICE|AMOUNT|U-PRICE|AMOUNT|U-PRICE|AMOUNT|U-PRICE|AMOUNT|REMARK"
                    format="0|0|0|1|1|1|1|1|1|1|1|1|0" 
                    aligns="0|0|1|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||" 
                   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="3000|2000|2000|1500|2000|2000|2000|2000|2000|2000|2000|2000|3000"
                    styles="width:100%; height:100%" 
                    sorting="T" 
                    onafteredit=""
                    oncellclick=""
                    />
            </td>
        </tr>
        <tr style="height:2%">
            <td width="100%" align="left"><img status="expand" id="imgup" src="../../../system/images/up.gif" style="cursor: hand;"  onclick="OnShow()" /></td>
        </tr>
        <tr height="24%" id="updating_info">
            <td colspan="">						<gw:grid   							id="Grid_Attach"  							header="_pk|_tecps_subctrequest_pk|Entry Date|File Name|Description"   							format  ="0|0|0|0|0"  							aligns  ="0|0|0|0|0"  							defaults="||||"  							editcol ="0|0|0|0|0"  							widths  ="0|0|2000|4000|2000" 							styles="width:100%; height:100%"   							sorting="T" oncelldblclick="OnOpenFile()"   						 /> 					</td>
        </tr>
   </table>
   <gw:textbox id="txtTECPS_SUBCTREQUEST_pk" readonly="true" styles='width:100%;display:none' />
   <gw:textbox id="txtRtn" readonly="true" styles='width:100%;display:none' />
   
</body>
</html>
