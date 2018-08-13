<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>1.2.7 Main Contract Progress</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    System.Translate(document);
    MerGrid();
}
//================================================================================================

//================================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/right1.gif";

    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/left1.gif";

    }
}
//================================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
			case 'Level':
				var path = System.RootURL + '/form/61/03/61030030Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
				var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
						txtLevel_Pk.text = obj[2];
						txtLevel_Nm.text = obj[1];
						txtLevel_Cd.text = obj[0];
						dso_detail.Call('SELECT');
				}
		break;
        case 'project':
            var path = System.RootURL + '/form/61/03/61030010_1.aspx';
            var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
            if (obj != null) 
                {
                    txtProject_M.text = obj[1];
                    txtProject_Pk.text = obj[0];
                    OnSearch();
                }
            break;
		}
}
//================================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_detail':
            MerGrid();
            var ctrl = Grid_Detail.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++) {
                if (Grid_Detail.GetGridData(i, 13) == "F") {
                    Grid_Detail.SetCellBold(i, 0, i, 12, true);
                }
                else {
                    Grid_Detail.SetCellBold(i, 0, i, 12, false);
                }
            }
            if (Grid_Detail.rows > 2) {
                Grid_Detail.Subtotal(0, 2, '0!1', '5!7!9!11', '', true, 1, 'Grand Total');
                Grid_Detail.SetCellBgColor(Grid_Detail.rows - 1, 0, Grid_Detail.rows - 1, Grid_Detail.cols - 1, Number("0xabcdef"));
            }
            break;
	}
}
//================================================================================================
function MerGrid()
{
        if (Grid_Detail.rows < 2)
		{
			Grid_Detail.AddRow();
		}
		var fg=Grid_Detail.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5

		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "WORK SCOPE / ITEM"

		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "SPECIFICATION"
		
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "UNIT"
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "QTY"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "MATERIAL"
		fg.Cell(0, 1, 4, 1) = "U-PRICE"
		fg.Cell(0, 1, 5, 1) = "AMOUNT"
        		
		fg.Cell(0, 0, 6, 0, 7) = "LABOR"
		fg.Cell(0, 1, 6, 1) = "U-PRICE"
		fg.Cell(0, 1, 7, 1) = "AMOUNT"

		fg.Cell(0, 0, 8, 0, 9) = "EQUIPMENT"
		fg.Cell(0, 1, 8, 1) = "U-PRICE"
		fg.Cell(0, 1, 9, 1) = "AMOUNT"

		fg.Cell(0, 0, 10, 0, 11) = "TOTAL"
		fg.Cell(0, 1, 10, 1) = "U-PRICE"
		fg.Cell(0, 1, 11, 1) = "AMOUNT"

		fg.MergeCol(12) = true
		fg.Cell(0, 0, 12, 1, 12) = "REMARK"
}
//================================================================================================
function OnPrint()
{
    if(txtMasterPK.text != '')
	{
	    var url = System.RootURL + "/reports/kp/bp/kpbp127.aspx?Pk=" + txtMasterPK.text + '&Project_Pk=' + txtProject_Pk.text + '&From=' + dtFrom.value + '&To=' + dtTo.value;
			System.OpenTargetPage(url);       
	}
	else
	{
			alert('Please select Item to print report !!');	
	}
}
//================================================================================================
function OnClick()
{
    var obj = event.srcElement.GetCurrentNode();
    txtMasterPK.SetDataText(obj.oid);
    dso_detail.Call("SELECT");
}
//================================================================================================
function OnSearch()
{
    dso_tree.Call('SELECT');
}
var flag="";

</script>
<body>
<gw:data id="dso_tree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="pm_sel_61030080" > 
                <input>
                    <input bind="txtProject_M" />    
                    <input bind="txtLevel" />  
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="dso_detail" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid"  function="pm_sel_61030080_dt">
          <input bind="Grid_Detail" >
          <input bind="txtProject_Pk" />
          <input bind="txtMasterPK" />
          <input bind="dtFrom" />
          <input bind="dtTo" />
          </input>
          <output bind="Grid_Detail" />
        </dso>
      </xml>
    </gw:data>    
    
<table style="width: 100%; height: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1" cellpadding="0" cellspacing="0">
        <tr style="height:100%" valign="top">
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:4%">
                        <td>
                            <fieldset style="padding:0">
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                        <tr style="height: " >
                                            <td style="width: 20%" align="right"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                                            <td width="80%" colspan="2"><gw:textbox id="txtProject_M" styles="width: 100%" onenterkey="OnSearch()" /><gw:textbox id="txtProject_Pk" styles="width: 100%;display:none" /></td>
                                        </tr>
                                        <tr>
                                            <td width="20%" align="right">Level&nbsp;</td>
                                            <td width="80%"><gw:textbox id="txtLevel" styles="width: 100%" onenterkey="OnSearch()" /></td>
                                            <td ><gw:imgbtn id="btnNew" img="search" alt="Search" onclick="OnSearch()" /></td>
                                        </tr>
                                </table>
                              </fieldset>  
                        </td>
                    </tr>
                    <tr style="height: 96%" valign="top">
                        <td colspan="">
                            <gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree>
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" width="70%" valign="top" style="background:white">
            	<table cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                   <tr style="height:2%">
                        <td>
                            <fieldset style="padding:0">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style=""><gw:datebox id="dtFrom" lang="1" />~<gw:datebox id="dtTo" lang="1" onchange="dso_detail.Call('SELECT')" /></td>
                                        <td width="100%" align="right"><gw:imgbtn id="btnNew" img="excel" alt="Print" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                   </tr>
                    <tr height="98%">
                    	<td colspan="">
                            <gw:grid id='Grid_Detail' 
                            	header='0.ITEM|1.SPECIFICATION|2.UNIT|3.QTY|4.U-PRICE|5.AMOUNT|6.U-PRICE|7.AMOUNT|8.U-PRICE|9.AMOUNT|10.U-PRICE|11.AMOUNT|12.REMARK|_13.leaf_yn' 
							    format='0|0|0|1|1|1|1|1|1|1|1|1|0|0'
                                aligns='0|0|1|3|3|3|3|3|3|3|3|3|0|0' 
								check='|||||||||||||' 
							   editcol='0|0|0|0|0|0|0|0|0|1|0|0|0|0' 
								widths='3000|1500|1500|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|0' 
                                sorting='T'
                                styles='width:100%; height:100%' 
                                onafteredit=""
                                oncelldblclick="OnEditDetail()" />
                        </td>
                    </tr>
                   
                </table>
            </td>
<img status="expand" id="imgArrow" src="../../../system/images/left1.gif" style="cursor: hand;position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />  
<gw:textbox id="txtVersion_Pk" styles='width:100%;display:none' />         
<gw:textbox id="txtStatus" styles='width:100%;display:none' />         
       
 
</body>
</html>
