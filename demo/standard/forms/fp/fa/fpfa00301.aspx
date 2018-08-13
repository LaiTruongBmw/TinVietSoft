<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
	//=======================================================================
    function BodyInit() 
    {
        System.Translate(document);
        txtProjPK.text =  "<%=Request.querystring("p_project_pk")%>";
        data_fpfa00301.Call('SELECT');
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
        data_fpfa00301.Call('SELECT');
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
	 <!-------------------------------------------------------------------------------->
     <gw:data id="data_fpfa00301" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>LG_SEL_FPFA00301"	>	
				<input>
					<input	bind="txtProjPK"	/>	
                    <input	bind="txtItem"	/>	
                     <input	bind="txtIDMK"	/>	
                     <input	bind="txtSpec1"	/>	
                    <input	bind="txtSpec2"	/>	
                    <input	bind="txtSpec3"	/>	
                    <input	bind="txtSpec4"	/>	
                    <input	bind="txtSpec5"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
	<!-------------------------------------------------------------------------------->
    <table border="0" style="height: 100%; width: 100%">
       <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Item
            </td>
			
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td> 
               
            <td style="width: 5%" align="right">
                Mark/IDMK
            </td>
			
            <td style="width: 8%">
                <gw:textbox id="txtIDMK" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>   
			
            <td style="width: 5%" align="right">
                Spec
            </td>
			
            <td style="width: 8%">
                <gw:textbox id="txtSpec1" styles="width:100%" onenterkey="OnSearch(1)" />
            </td> 
            <td style="width: 2%"> - </td>            
             <td style="width: 8%">
                <gw:textbox id="txtSpec2" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 8%">
                <gw:textbox id="txtSpec3" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 8%">
                <gw:textbox id="txtSpec4" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
             <td style="width: 2%"> x </td>    
             <td style="width: 10%">
                <gw:textbox id="txtSpec5" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>  
              <td style="width: 5%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
              <td style="font-size: large; color: Blue" align="right">
                <gw:imgbtn img="select" alt="Select Multi Item" id="btnSelect1" onclick="OnSelect(grdDetail)" />
            </td>
        </tr>      
        <tr style="height: 99%">
            <td colspan="18">   
                <gw:grid id='grdDetail' header='_PK|Item Name|Dwg No|IDMK|Mark|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Bom Qty|MateriaL'
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
