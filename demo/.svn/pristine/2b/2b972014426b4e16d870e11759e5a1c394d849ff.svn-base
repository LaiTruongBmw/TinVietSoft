<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MEMBER ITEM</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
    function BodyInit() 
    {
        System.Translate(document);
        txtProjPK.text =  "<%=Request.querystring("p_project_pk")%>";
        data_fpfa10010.Call('SELECT');
    }
    //=======================================================================
    function OnSelect(oGrid) 
    {
        var arr_data = new Array();

        if (oGrid.rows > 1) {
            for (var i = 1; i < oGrid.rows; i++) {
                if ( oGrid.GetGridControl().isSelected(i) == true )
                    {
                    var arrTemp = new Array();

                    for (var j = 0; j < oGrid.cols; j++) {
                        arrTemp[arrTemp.length] = oGrid.GetGridData(i, j);
                    }

                    arr_data[arr_data.length] = arrTemp;
                }
            }
            if (arr_data != null) {
                window.returnValue = arr_data;
                window.close();
            }
            else {
                alert("You have not selected data yet.");
            }
        }

    }

    function OnSearch()
    {
        data_fpfa10010.Call('SELECT');
    }

    function OnDataReceive()
    {
        if ( grdDetail.rows > 1 )
        {
                grdDetail.SetCellBold( 1, 1, grdDetail.rows - 1, 1,  true);
	            grdDetail.SetCellBold( 1, 10, grdDetail.rows - 1, 10,  true);       
        }         
    }
    //=======================================================================
</script>
<body>
    <gw:data id="data_fpfa10010" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>LG_SEL_fpfa10010"	>	
				<input>
					<input	bind="txtProjPK"	/>	
                    <input	bind="txtSearch"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <table border="0" style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%">
                Search
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 100%">
            </td>
            <td style="font-size: large; color: Blue" align="right">
                <gw:imgbtn img="select" alt="Select Multi Item" id="btnSelect1" onclick="OnSelect(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td align="center" colspan="4">
                <gw:grid id='grdDetail' header='_PK|Item Name|Dwg No|IDMK|_Mark|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Bom Qty|MateriaL'
                    format='0|0|0|0|0|0|0|0|0|0|1|0' aligns='1|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||'
                    editcol='1|1|1|1|1|1|1|1|1|1|1|1' widths='500|2000|1000|1000|1000|1200|1200|1200|1200|1200|1500|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(this)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtProjPK" styles="width:100%; display:none" />
</html>
