<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POP UP View Detail </title>
</head>

<script type="text/javascript" language="javascript">

    var G_OUT_SEQ = 0,
	G_WPROCESS = 1,
	G_OUT_PRO_PK = 2,
	G_OUT_COMP = 3,
	G_OUT_QTY = 4,
	G_OUT_MPART = 5,
	G_IN_SEQ = 6,
	G_IN_PRO_PK = 7,
	G_IN_COMP = 8,
	G_IN_QTY = 9,
	G_IN_RATIO = 10,
	G_IN_MPART = 11;

    var arr_FormatNumber = new Array();

    var callerWindowObj = dialogArguments;

    var save = 0;
    //===========================================================
    function BodyInit() 
	{
	    System.Translate(document);
        FormatGrid();

        txtStylePK.text = callerWindowObj.txtStylePK.text;
        lblStyleName.text = callerWindowObj.txtStyleCode.text + ' - ' + callerWindowObj.txtStyleName.text;

        data_fpdp00126.Call("SELECT");
    }
    //===========================================================
    function FormatGrid() 
	{
        var ctrl = grdDetail.GetGridControl();

        ctrl.MergeCells = 2;

        ctrl.MergeCol(0) = true;
        ctrl.MergeCol(1) = true;
        ctrl.MergeCol(2) = true;
        ctrl.MergeCol(3) = true;
        ctrl.MergeCol(4) = true;
        ctrl.MergeCol(5) = true;

        ctrl = grdDetail.GetGridControl();

        ctrl.ColFormat(G_OUT_QTY) = "###,###,###,###,###.#####";
        ctrl.ColFormat(G_IN_QTY) = "###,###,###,###,###.#####";
        ctrl.ColFormat(G_IN_RATIO) = "###,###,###,###,###.##";

        arr_FormatNumber[G_OUT_QTY] = 5;
        arr_FormatNumber[G_IN_QTY] = 5;

        arr_FormatNumber[G_IN_RATIO] = 2;
    }
    //===========================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_fpdp00126':
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold(1, G_WPROCESS, grdDetail.rows - 1, G_WPROCESS, true);
                    grdDetail.SetCellBold(1, G_IN_QTY, grdDetail.rows - 1, G_IN_QTY, true);
                    grdDetail.SetCellBold(1, G_OUT_QTY, grdDetail.rows - 1, G_OUT_QTY, true);

                    grdDetail.SetCellBgColor(1, G_OUT_COMP, grdDetail.rows - 1, G_OUT_QTY, 0xCCFFFF);
                    grdDetail.SetCellBgColor(1, G_IN_COMP, grdDetail.rows - 1, G_IN_QTY, 0xFFFFCC);
                }
                break;

            case 'pro_fpdp00126':
                alert(txtReturnValue.text);
                data_fpdp00126.Call("SELECT");
                break;
        }
    }
    //===========================================================
    function OnSearch() 
	{
        data_fpdp00126.Call("SELECT");
    }
    //===========================================================
    function OnSave() 
	{
        data_fpdp00126.Call();
    }
    //=========================================================== 
    function CheckInput() 
	{
        row = event.row;
        col = event.col;

        if (col == G_OUT_QTY || col == G_IN_QTY || col == G_IN_RATIO) 
		{
            var dQuantiy;

            dQuantiy = grdDetail.GetGridData(row, col)

            if (Number(dQuantiy)) 
			{
                grdDetail.SetGridText(row, col, System.Round(dQuantiy, arr_FormatNumber[col]));
            }
            else 
			{
                grdDetail.SetGridText(row, col, "")
            }
        }
    }
    //===========================================================
    function OnProcess() 
	{
		if ( confirm('Do you want to calculate Input Ratio for component ?') )
		{
        	pro_fpdp00126.Call();
		}	
    }
	//===========================================================	 
</script>

<body>
  	<!---------------------------------------------------------------------->
	<gw:data id="pro_fpdp00126" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpdp00126"> 
                <input> 
			        <input bind="txtStylePK" />  		
			    </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00126" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpdp00126" procedure="<%=l_user%>lg_upd_fpdp00126" >
                <input>
                    <input bind="txtStylePK" />
                    <input bind="txtCompIn" />
                    <input bind="txtCompOut" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Style
            </td>
            <td colspan="4">
                <gw:textbox id="txtStylePK" styles="display:none" />
                <gw:label id="lblStyleName" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="2">
                <gw:icon id="idBtnProcess" img="2" text="Process" styles='width:100%' onclick="OnProcess()" />
            </td>
            <td>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp Out
            </td>
            <td style="width: 40%">
                <gw:textbox id="txtCompOut" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp In
            </td>
            <td style="width: 40%">
                <gw:textbox id="txtCompIn" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 8%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 55%">
            <td colspan="7">
                <gw:grid id='grdDetail' header='Seq|W/Process|_OUT_PRO_PK|OUT Component|OUT Qty|M/Part|Seq|_IN_PRO_PK|IN Component|IN Qty|Input Ratio|M/Part'
                    format='0|0|0|0|0|3|0|0|0|0|0|3' aligns='1|0|0|0|3|0|1|0|0|3|3|0' check='|||||||||||'
                    editcol='0|0|0|0|1|1|1|0|0|1|1|1' widths='800|2500|0|2500|1200|1000|800|0|2500|1200|1200|1000'
                    sorting='T' onafteredit="CheckInput()" styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" csstype="mandatory" styles="width:100%;display:none"/>
</html>
