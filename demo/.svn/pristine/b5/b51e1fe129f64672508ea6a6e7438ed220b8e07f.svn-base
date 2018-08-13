<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

    //=======================================================================
    var l_master_pk = "";
    var callerWindowObj = dialogArguments;
	
    function BodyInit() 
	{
        System.Translate(document);
        l_master_pk = callerWindowObj.txtMasterPK.text;
        txtSlipNo.text = callerWindowObj.txtSlipNo.text;
        OnChangeTab();

        //-------------------------
    }
    //=======================================================================
    function OnReport() 
	{
        callerWindowObj.OnReport(txtReportID.text, radType.value)
        this.close();
    }
    //===========================================================
    function OnChangeTab() 
	{
		if(radType.value=='0')
		{
			txtReportID.text = 'rpt_dscd00070_ST_DW';
		}
		else if (radType.value=='1')
		{
			txtReportID.text = 'rpt_dscd00070_DW';
		}
		else if (radType.value=='2')
		{
			txtReportID.text = 'rpt_dscd00070_DW_02';
		}
		else if (radType.value=='3')
		{
			txtReportID.text = 'rpt_dscd00070_DW_03';
		}
		else if (radType.value=='4')
		{
			txtReportID.text = 'rpt_dscd00070_DW_04';
		}
		else if (radType.value=='5')
		{
			txtReportID.text = 'rpt_dscd00073';
		}
		else if (radType.value=='6')
		{
			txtReportID.text = 'rpt_dscd00074';
		}
		else if (radType.value=='9')
		{
			txtReportID.text = 'rpt_dscd00070_KB';
		}
		else if (radType.value=='10')
		{
			txtReportID.text = 'rpt_dscd00070_KB_03';
		}
		else if (radType.value=='11')
		{
			txtReportID.text = 'rpt_dscd00070_KB_01';
		}	
		else if (radType.value=='12')
		{
			txtReportID.text = 'rpt_dscd00070_KB_04';
		}
		else if (radType.value=='13')
		{
			txtReportID.text = 'rpt_dscd00070_DURING_01';
		}
		
        
        pro_dscd00075.Call();
    }
    //=======================================================================
    function OnDataReceive(obj) {
        switch (obj.id) {
            case 'pro_dscd00075':
                break;
        }

    }
    //=======================================================================
</script>
<body>
	<!--------------------------------------------------------------------------->
    <gw:data id="pro_dscd00075" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00075" > 
                <input>      
                    <input bind="txtReportID" />  
                    <input bind="txtSlipNo" />       
                </input> 
                <output>
                    <output bind="txtPrintTime" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------------------------------------->
    <table>
        <tr style="height: 20%">
            <td colspan="3" style="font-size: large; color: Blue" align="center">
                DELIVERY VOUCHER
            </td>
        </tr>
        <tr style="height: 10%">
            <td style="width: 30%;" align="right">
                Print No
            </td>
            <td style="width: 30%">
                <gw:textbox id='txtPrintTime' styles="width:100%" type='number' format="###.###.###" />
            </td>
            <td align="right" style="width: 40%">
                <gw:button id="idBtnOk" img="excel" text="Print Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td colspan="2" style="width: 60%">
			
				 
                <gw:radio id="radType" value="8" styles="width:100%" onchange="OnChangeTab()"> 
                    <span value="0">Delivery Voucher - Standard </span><br/><br/>
                    <!--<span value="1">HAPPY - Unit Price </span><br/><br/>
                    <span value="2">HAPPY - No Price</span><br/><br/>
                    <span value="1">Delivery Voucher (Type 1)</span> <br/>
                    <span value="2">Delivery Voucher (Type 2)</span> <br/>
                    <span value="3">Delivery Voucher (Type 3)</span> <br/>                                              
                    <span value="4">Delivery Voucher (Type 4)</span> <br/>
					<span value="5">Delivery Voucher (Type 5)</span> <br/>
					
                    <span value="7">Happy - New</span> <br/>
					<span value="8">Dorco</span> <br/>
					-->
					<span value="6" >Amount</span> <br/>
					<span value="9" >Debit Note (USD)</span> <br/>
					<span value="12">Debit Note (VND)</span> <br/>
					<span value="10">Delivery Voucher</span> <br/>
					<span value="11">Packing List</span> <br/>
					
					<span value="13">DR : Deli Voucher</span> <br/>
					<span value="14">Delivery Voucher (Kyungbang)</span> <br/>
                </gw:radio>
            </td>
            <td>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id='txtReportID' styles="width:100%;display:none" />
<gw:textbox id='txtSlipNo' styles="width:100%;display:none" />
<!---------------------------------------------------------------------->
</html>
