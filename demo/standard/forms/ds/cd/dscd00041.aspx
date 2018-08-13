<!-- #include file="../../../../system/lib/form.inc"  -->
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Outgoing details</title>
</head>

<script>
    var G_TR_DATE 	 = 0,
        G_SLIP       = 1,
        G_TR_ITEM_PK = 2,
        G_ITEM_CODE  = 3,
        G_ITEM_NAME  = 4,
        G_UOM 		 = 5,
        G_OUT_QTY 	 = 6;
    //=======================================================================================
	
    function BodyInit() 
	{
	    System.Translate(document); 
		//--------------------
        var callerWindowObj = dialogArguments;
		
        txtTSA_SALEORDER_D_PK.text = callerWindowObj.txt_SO_D_PK.text ; 
		lblRefNo.text              = callerWindowObj.txt_Ref_No.text  ;
		//--------------------
		grdDetail.GetGridControl().ColFormat(G_OUT_QTY)    = "###,###,###,###,###.##";
		//--------------------
        data_dscd00041.Call('SELECT');
    }

    //=======================================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_dscd00041':
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold(1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
                    grdDetail.SetCellBgColor(1, G_OUT_QTY, grdDetail.rows - 1, G_OUT_QTY, 0xCCFFFF);
                }
            break;
        }
    }
    //=======================================================================================
</script>

<html>
<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_dscd00041" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_dscd00041" > 
                <input> 
                    <input bind="txtTSA_SALEORDER_D_PK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width:5%;white-space:nowrap">
                Ref No :
            </td>
            <td style="white-space:nowrap">
                <gw:label id="lblRefNo" styles="color: red"></gw:label>
            </td>
        </tr>
        <tr style="height: 100%">
            <td colspan="2">
                <gw:grid id='grdDetail' header='Date|Deli No|_TR_ITEM_PK|Item Code|Item Name|UOM|Out Qty'
                    format='4|0|0|0|0|0|0' aligns='1|0|0|0|0|1|3' check='||||||' editcol='0|0|0|0|0|0|0'
                    widths='1200|1500|0|2000|4500|800|1200' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
	<!------------------------------------------------------------------>
    <gw:textbox id="txtTSA_SALEORDER_D_PK" styles="width:100%; display:none" />
	<!------------------------------------------------------------------>
</body>
</html>
