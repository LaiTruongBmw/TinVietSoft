<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MEMBER ITEM</title>
</head>
<%  
    ESysLib.SetUser("SALE")
    Dim l_user As String
    l_user = "sale."
%>
<script>
    var G0_pl_pk = 0,
    G0_PL_NM = 1,
    G0_Item = 2;
	
    var 
	G_PK = 0,
	G_SEQ = 1,
	G_SUM_WEIGHT = 2,
	G_DWG_NO = 3,
	G_REV = 4,
	G_IDMK = 5,
	G_MARK = 6,
	G_SPEC1 = 7,
	G_SIGN1 = 8,
	G_SPEC2 = 9,
	G_SIGN2 = 10,
	G_SPEC3 = 11,
	G_SIGN3 = 12,
	G_SPEC4 = 13,
	G_SIGN4 = 14,
	G_SPEC5 = 15,
	G_LENGTH = 16,
	G_WIDTH	 = 17,
	G_HEIGHT = 18,	
	G_QTY = 19,
	G_SQUARE_QTY = 20,
	G_U_WT = 21,
	G_TOTAL_WT = 22,
	G_MATERIAL = 23,
	G_REMARK = 24;
    //==============================================================================================
    function BodyInit() {

    }

    //====================================================================
    function OnSearch(p_obj) 
	{
        if (p_obj == "grdSearch") 
		{
            idData_fpfa00460.Call("SELECT");

        } 
		else 
		{
            txtABPL_PK.text = grdSearch.GetGridData(grdSearch.row, G0_pl_pk);
			txtSearchProjectName.text = grdSearch.GetGridData(grdSearch.row, G0_PL_NM);
            txtItemName.text = grdSearch.GetGridData(grdSearch.row, G0_Item);
        
            idData_fpfa00460_1.Call("SELECT");
        }
    }
    //====================================================================

    function OnReport() 
	{
        if (txtABPL_PK.text == "") return;
		
        var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00460.aspx?p_proj_pk=' + txtABPL_PK.text + '&p_project_name=' + txtSearchProjectName.text + '&p_item_name=' + txtItemName.text + '&p_search_text=' + txtSeachText.text + '&p_spec_01=' + txtSpec1.text+ '&p_spec_02=' + txtSpec2.text+ '&p_spec_03=' + txtSpec3.text+ '&p_spec_04=' + txtSpec4.text+ '&p_spec_05=' + txtSpec5.text;
        System.OpenTargetPage(url);
    }

    //==============================================================================================
    function OnDataReceive(obj) {


        if (grdGrid.rows > 1) {
            grdGrid.SetCellBold(1, G_DWG_NO, grdGrid.rows - 1, G_DWG_NO, true);
            grdGrid.SetCellBold(1, G_SPEC1, grdGrid.rows - 1, G_LENGTH, true);
            grdGrid.SetCellBold(1, G_QTY, grdGrid.rows - 1, G_QTY, true);
            grdGrid.SetCellBold(1, G_TOTAL_WT, grdGrid.rows - 1, G_TOTAL_WT, true);
            grdGrid.SetCellBgColor(1, G_QTY, grdGrid.rows - 1, G_QTY, 0x99FFFF);

            lblTotalWeight.text = grdGrid.GetGridData(1, G_SUM_WEIGHT) + " kg";
        }



        lblRecored.text = (grdGrid.rows - 1) + " item(s)";
    }
	//==============================================================================================
	
	function OnDelete()
	{
		grdGrid.DeleteRow();
	}
	
	//==============================================================================================
	
	function OnUnDelete()
	{
		grdGrid.UnDeleteRow();
	}
	
	//==============================================================================================
	function OnSave()
	{
		if (confirm ("Do you want to save data?"))
		{
			idData_fpfa00460_1.Call();
		}
	}
    //==============================================================================================
    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }
    //==============================================================================================
    function OnToggle() {
        var left = document.all("t-left");
        var right = document.all("t-right");
        var imgArrow = document.all("imgArrow");

        if (imgArrow.status == "expand") {
            left.style.display = "none";
            right.style.display = "";

            imgArrow.status = "collapse";
            imgArrow.src = "../../../system/images/button/next.gif";
        }
        else {
            left.style.display = "";
            right.style.display = "";

            imgArrow.status = "expand";
            imgArrow.src = "../../../system/images/button/previous.gif";
        }
    }
	 //==============================================================================================
</script>
<html>
<body>
    <!------------------------------------------------------------------------------------------>
    <gw:data id="idData_fpfa00460" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00460" > 
                <input bind="grdSearch">                 
                  	<input bind="txtProjectName" />   
					<input bind="txtItem" />  
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
 	</gw:data>
    <!------------------------------------------------------------------------------------------>
    <gw:data id="idData_fpfa00460_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" function="<%=l_user%>lg_sel_fpfa00460_1" procedure="<%=l_user%>LG_UPD_FPFA00460_1" > 
                <input bind="grdGrid">                 
                  	<input bind="txtABPL_PK" />
					<input bind="txtItemName" />  
					<input bind="txtSeachText" /> 
					<input bind="txtSpec1" />  
					<input bind="txtSpec2" />  
					<input bind="txtSpec3" />  
					<input bind="txtSpec4" />  
					<input bind="txtSpec5" />  
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data>
    <!------------------------------------------------------------------------------------------>
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Project
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtProjectPK" styles="width: 100%;display:none" onenterkey="OnSearch('grdSearch')" />
                            <gw:textbox id="txtProjectName" styles="width: 100%" onenterkey="OnSearch('grdSearch')"
                                readonly="true" />
                        </td>
                        <td width="2%">
                            <gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            Item Name
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_pk|Project|Item Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|2000|1500' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="left">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td width="10%" align="right">
                            <b>Search Text</b>
                        </td>
                        <td width="20%">
                            <gw:textbox id="txtSeachText" styles="width:100%" onenterkey="SearchOnClick()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Spec
                        </td>
                        <td style="width: 8%">
                            <gw:textbox id="txtSpec1" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 2%">
                            -
                        </td>
                        <td style="width: 8%">
                            <gw:textbox id="txtSpec2" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 2%">
                            x
                        </td>
                        <td style="width: 8%">
                            <gw:textbox id="txtSpec3" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 2%">
                            x
                        </td>
                        <td style="width: 8%">
                            <gw:textbox id="txtSpec4" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 2%">
                            x
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtSpec5" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="height: 5%" align="right">
                            <gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td width="2%">
                            <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="left">
                        </td>
                        <td width="10%" align="right">
                        </td>
                        <td width="20%"><gw:label id="lblRecored" styles='width:100%;color:cc0000;font:9pt;align:right' />
                        </td>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 8%">
                        </td>
                        <td style="width: 10%" colspan="4">
                            <gw:label id="lblTotalWeight" styles='width:100%;color:cc0000;font:9pt;align:right' />
                        </td>
                        <td style="width: 2%">
                        </td>
                        <td style="width: 8%">
                        </td>
                        <td style="width: 2%">
                        </td>
                        <td style="width: 10%" align="right" >
                            <gw:imgbtn img="delete" alt="delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
						<td style="width: 10%" align="right">
                            <gw:imgbtn img="udelete" alt="undelete" id="btnunDelete" onclick="OnUnDelete()" />
                        </td>
						<td style="width: 10%" >
                            <gw:imgbtn img="save" alt="save" id="btnSave" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="16">
                            <gw:grid id='grdGrid' header='_PK|SEQ|_WT|DWG No|Rev|IDMK|_MARK|Spec 1|-|Spec 2|-|Spec 3|-|Spec 4|-|Spec 5|Length|Width|Height|Bom Qty|Square Qty|Unit WT|Total WT|Material|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|0|0|0|0|0'
                                check='||||||||||||||||||||||||' 
								editcol='1|1|0|1|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|0|2000|1500|800|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                                sorting='T' autosize='T' acceptnulldate="true" styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtABPL_PK" styles="display:none;" />
<gw:textbox id="txtSearchProjectName" styles="display:none;" />
<gw:textbox id="txtItemName" styles="display:none;" />
</html>
