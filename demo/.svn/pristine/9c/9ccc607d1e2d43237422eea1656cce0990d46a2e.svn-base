<!-- #include file="../../../../system/lib/form.inc"  -->
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Return details</title>
</head>

<script>
    var G_TR_DATE 	 = 0,
        G_SLIP       = 1,
        G_TR_ITEM_PK = 2,
        G_ITEM_CODE  = 3,
        G_ITEM_NAME  = 4,
        G_UOM 		 = 5,      
        G_RETURN_QTY = 6;
    //=======================================================================================
	
    function BodyInit() 
	{
	    System.Translate(document); 
		//--------------------
        var callerWindowObj = dialogArguments;
		
        txt_PO_D_PK.text = callerWindowObj.txt_PO_D_PK.text ; 
		lblRefNo.text    = callerWindowObj.txt_Ref_No.text  ;
		//--------------------
		grdDetail.GetGridControl().ColFormat(G_RETURN_QTY) = "###,###,###,###,###.##";
		//--------------------
        data_epbp00102.Call('SELECT');
    }

    //=======================================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_epbp00102':
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold(1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
                    grdDetail.SetCellBgColor(1, G_RETURN_QTY, grdDetail.rows - 1, G_RETURN_QTY, 0xCCFFFF);
                }
            break;
        }
    }
    //=======================================================================================
</script>

<html>
<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_epbp00102" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"   function="st_lg_sel_epbp00102" > 
                <input> 
                    <input bind="txt_PO_D_PK" /> 
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
                <gw:grid id='grdDetail' header='Date|Slip No|_TR_ITEM_PK|Item Code|Item Name|UOM|Return Qty'
                    format='4|0|0|0|0|0|0' aligns='1|0|0|0|0|1|3' check='||||||' editcol='0|0|0|0|0|0|0'
                    widths='1200|1500|0|2000|4500|800|1200' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
	<!------------------------------------------------------------------>
    <gw:textbox id="txt_PO_D_PK" styles="width:100%; display:none" />
	<!------------------------------------------------------------------>
</body>
</html>
