<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser("mafg")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Daily Report</title>
</head>

<script>
function BodyInit()
{
     System.Translate(document);
    //alert(Number(RemoveComma("12,345"))+Number(RemoveComma("6,789")));
    OnSearch();
}
function OnSearch()
{
    dsoTakeInOut.Call("SELECT");
   
    
    //dsoDailyStock.Call("SELECT"); 
}
function OnPrint()
{
    var  url= System.RootURL + "/reports/fp/ep/fpep00080.aspx?p_date="+dtFrom.GetData();
        System.OpenTargetPage( url, "_blank" );
}
function OnDataReceive(obj)
{

    switch(obj.id)
    {
        case 'dsoTakeInOut':
             dsoDailyStock.Call("SELECT"); 
             //--------------load data of dsoTakeInOut--------------
                txtTi_DlyCapsule.text=grdTakeInOut.GetGridData(1,0); 
                txtTi_MCapsule.text=grdTakeInOut.GetGridData(1,1);
                txtTi_TargetCapsule.text=grdTakeInOut.GetGridData(1,2);
                txtTi_Comparision.text=grdTakeInOut.GetGridData(1,3);
			    txtTo_DailyDmsticCapsule.text=grdTakeInOut.GetGridData(1,4);
			    txtTo_MDmsticCapsule.text=grdTakeInOut.GetGridData(1,5);
			    txtTo_TargetDmsticCapsule.text=grdTakeInOut.GetGridData(1,6);
                txtTo_DmsticComparision.text=grdTakeInOut.GetGridData(1,7);
                txtTo_DailyExpCapsule.text=grdTakeInOut.GetGridData(1,8);
			    txtTo_MDExpCapsule.text=grdTakeInOut.GetGridData(1,9);
			    txtTo_TargetExpCapsule.text=grdTakeInOut.GetGridData(1,10);
                txtTo_ExpComparision.text=grdTakeInOut.GetGridData(1,11);
                txtTo_DailyTotalCapsule.text=grdTakeInOut.GetGridData(1,12);
			    txtTo_MDTotalCapsule.text=grdTakeInOut.GetGridData(1,13);
			    txtTo_TargetTotalCapsule.text=grdTakeInOut.GetGridData(1,14);
                txtTo_TotalComparision.text=grdTakeInOut.GetGridData(1,15);
                txtOrder_DailyDmsticCapsule.text=grdTakeInOut.GetGridData(1,16);
			    txtOrder_MDmsticCapsule.text=grdTakeInOut.GetGridData(1,17);
			    txtOrder_TargetDmsticCapsule.text=grdTakeInOut.GetGridData(1,18);
                txtOrder_DmsticComparision.text=grdTakeInOut.GetGridData(1,19);
                txtOrder_DailyExpCapsule.text=grdTakeInOut.GetGridData(1,20);
			    txtOrder_MDExpCapsule.text=grdTakeInOut.GetGridData(1,21);
			    txtOrder_TargetExpCapsule.text=grdTakeInOut.GetGridData(1,22);
                txtTOrder_ExpComparision.text=grdTakeInOut.GetGridData(1,23);
                txtOrder_DailyTotalCapsule.text=grdTakeInOut.GetGridData(1,24);
			    txtOrder_MDTotalCapsule.text=grdTakeInOut.GetGridData(1,25);
			    txtOrder_TargetTotalCapsule.text=grdTakeInOut.GetGridData(1,26);
                txtTOrder_TotalComparision.text=grdTakeInOut.GetGridData(1,27);
                //-----------end load data of dsoTakeInOut-----------------
        break;
        case 'dsoDailyStock':
              dsoProductStock.Call("SELECT");
                txtTypeA.text=grdDailyStock.GetGridData(1,0); 
                txtTypeB.text=grdDailyStock.GetGridData(1,1); 
                txtTotal.text=grdDailyStock.GetGridData(1,2);
                txtPrePrintTaget.text=grdDailyStock.GetGridData(1,3);
			    txtPrePrintResult.text=grdDailyStock.GetGridData(1,4);
			    txtW_forPrintTaget.text=grdDailyStock.GetGridData(1,5);
			    txtW_forPrePrintResult.text=grdDailyStock.GetGridData(1,6);
                txtPrintingTaget.text=grdDailyStock.GetGridData(1,7);
                txtPrintingResult.text=grdDailyStock.GetGridData(1,8);
                txtW_forPackingTaget.text=grdDailyStock.GetGridData(1,9);
                txtW_forPackingResult.text=grdDailyStock.GetGridData(1,10);
              
        break;
        
        case 'dsoProductStock':
              dsoPrintingResult.Call("SELECT");
                txtPrintedDomestic.text=grdProductStock.GetGridData(1,0);
                txtPrintedExp.text=grdProductStock.GetGridData(1,1);
                txtPrintedTotal.text=grdProductStock.GetGridData(1,2); 
                txtPre_PrintingDomestic.text=grdProductStock.GetGridData(1,3);
			    txtPre_PrintingExp.text=grdProductStock.GetGridData(1,4);
			    txtPre_PrintingTotal.text=grdProductStock.GetGridData(1,5);
			    txtTotal1Domestic.text=grdProductStock.GetGridData(1,6);
                txtTotal1Exp.text=grdProductStock.GetGridData(1,7);
                txtTotal1Total.text=grdProductStock.GetGridData(1,8);
                txtTransDomestic.text=grdProductStock.GetGridData(1,9);
                txtTransdExp.text=grdProductStock.GetGridData(1,10);
                txtTransTotal.text=grdProductStock.GetGridData(1,11);
                txtOpacDomestic.text=grdProductStock.GetGridData(1,12);
                txtOpacExp.text=grdProductStock.GetGridData(1,13);
                txtOpacTotal.text=grdProductStock.GetGridData(1,14);
                txtTotal2Domestic.text=grdProductStock.GetGridData(1,15);
                txtTotal2Exp.text=grdProductStock.GetGridData(1,16);
                txtTotal2Total.text=grdProductStock.GetGridData(1,17);
                txtTypeADomestic.text=grdProductStock.GetGridData(1,18);
                txtTypeAExp.text=grdProductStock.GetGridData(1,19);
                txtTypeATotal.text=grdProductStock.GetGridData(1,20);
                txtTypeBDomestic.text=grdProductStock.GetGridData(1,21);
                txtTypeBExp.text=grdProductStock.GetGridData(1,22);
                txtTypeBTotal.text=grdProductStock.GetGridData(1,23);
                txtBlendingDomestic.text=grdProductStock.GetGridData(1,24);
                txtBlendingExp.text=grdProductStock.GetGridData(1,25);
                txtBlendingTotal.text=grdProductStock.GetGridData(1,26);
                txtTotal3Domestic.text=grdProductStock.GetGridData(1,27);
                txtTotal3Exp.text=grdProductStock.GetGridData(1,28);
                txtTotal3Total.text=grdProductStock.GetGridData(1,29);
        break;
        
        case 'dsoPrintingResult':
              dsoCapsuleStock.Call("SELECT");
                txtPQtyDaily.text=grdPrintingResult.GetGridData(1,0);
                txtPQtyMonthly.text=grdPrintingResult.GetGridData(1,1);
            
        break;
        
       case 'dsoCapsuleStock':
      // alert(grdCapsuleStock.GetGridData(1,3));
               for(var i=1; i<grdCapsuleStock.rows;i++)
                    {
                    if (grdCapsuleStock.GetGridData(i ,0)== '00E') 
					        {
						        txtTotalM_00E.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_00E.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_00E.text=grdCapsuleStock.GetGridData(i,3);
					        }		  
            
                            if (grdCapsuleStock.GetGridData(i ,0)== '00') 
					        {
						        txtTotalM_00.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_00.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_00.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '0E') 
					        {
						        txtTotalM_0E.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_0E.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_0E.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '0') 
					        {
						        txtTotalM_0.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_0.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_0.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '1') 
					        {
						        txtTotalM_1.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_1.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_1.text=grdCapsuleStock.GetGridData(i,3);
					        }
					         if (grdCapsuleStock.GetGridData(i ,0)== '2') 
					        {
						        txtTotalM_2.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_2.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_2.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '2E') 
					        {
						        txtTotalM_2E.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_2E.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_2E.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '3') 
					        {
						        txtTotalM_3.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_3.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_3.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        if (grdCapsuleStock.GetGridData(i ,0)== '4') 
					        {
						        txtTotalM_4.text=grdCapsuleStock.GetGridData(i,1); 
                                txtProDaily_4.text=grdCapsuleStock.GetGridData(i,2);
                                txtPrePrinting_4.text=grdCapsuleStock.GetGridData(i,3);
					        }
					        txtDailyRate.text=grdCapsuleStock.GetGridData(i,4);
                            txtMonthlyQty.text=grdCapsuleStock.GetGridData(i,5);
                            txtMonthlyRate.text=grdCapsuleStock.GetGridData(i,6);
                            txtMachine_Total.text=Number(RemoveComma(txtTotalM_00E.GetData()))+ Number(RemoveComma(txtTotalM_00.GetData()))+ Number(RemoveComma(txtTotalM_0E.GetData()))+ Number(RemoveComma(txtTotalM_0.GetData()))+ Number(RemoveComma(txtTotalM_1.GetData()))+ Number(RemoveComma(txtTotalM_2.GetData()))+ Number(RemoveComma(txtTotalM_2E.GetData()))+ Number(RemoveComma(txtTotalM_3.GetData()))+ Number(RemoveComma(txtTotalM_4.GetData()));
                            txtProduct_Total.text=Number(RemoveComma(txtProDaily_00E.GetData()))+ Number(RemoveComma(txtProDaily_00.GetData()))+ Number(RemoveComma(txtProDaily_0E.GetData()))+ Number(RemoveComma(txtProDaily_0.GetData()))+ Number(RemoveComma(txtProDaily_1.GetData()))+ Number(RemoveComma(txtProDaily_2.GetData()))+ Number(RemoveComma(txtProDaily_2E.GetData()))+ Number(RemoveComma(txtProDaily_3.GetData()))+ Number(RemoveComma(txtProDaily_4.GetData()));
                            txtpre_Printing_Total.text=Number(RemoveComma(txtPrePrinting_00E.GetData()))+ Number(RemoveComma(txtPrePrinting_00.GetData()))+ Number(RemoveComma(txtPrePrinting_0E.GetData()))+ Number(RemoveComma(txtPrePrinting_0.GetData()))+ Number(RemoveComma(txtPrePrinting_1.GetData()))+ Number(RemoveComma(txtPrePrinting_2.GetData()))+ Number(RemoveComma(txtPrePrinting_2E.GetData()))+ Number(RemoveComma(txtPrePrinting_3.GetData()))+ Number(RemoveComma(txtPrePrinting_4.GetData()));
		                }
        break;
    }
    
}
</script>

<body>
<!---grid TakeInOut-->
 <gw:data id="dsoTakeInOut" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_prod_inout_order" >  
                <input bind="grdTakeInOut"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdTakeInOut" /> 
            </dso> 
        </xml> 
    </gw:data>
<!---end grid TakeInOut-->

<!---grid Daily Stock-->
 <gw:data id="dsoDailyStock" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_daily_stock">  
                <input bind="grdDailyStock"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdDailyStock" /> 
            </dso> 
        </xml> 
    </gw:data>
<!---end grid Daily Stock-->

<!---grid product stock-->
 <gw:data id="dsoProductStock" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_product_stock">  
                <input bind="grdProductStock"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdProductStock" /> 
            </dso> 
        </xml> 
    </gw:data>
<!---end grid product stock-->

<!---grid print Result-->
 <gw:data id="dsoPrintingResult" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_printing_result" >  
                <input bind="grdPrintingResult"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdPrintingResult" /> 
            </dso> 
        </xml> 
    </gw:data>
<!---end grid print Result-->

<!---grid print Capsule stock-->
 <gw:data id="dsoCapsuleStock" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_prod_capsule_stock" >  
                <input bind="grdCapsuleStock"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdCapsuleStock" /> 
            </dso> 
        </xml> 
    </gw:data>
<!---end grid Capsule stock-->

<!--begin control PrintingResult-->
<gw:data id="dso_grdPrintingResult"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10" function="MAFG.sp_sel_printing_result"> 
        <inout>
            <inout  bind="txtPQtyDaily" /> 
            <inout  bind="txtPQtyMonthly" /> 
        </inout> 
        </dso> 
    </xml> 
</gw:data>
<!--end control PrintingResult-->
    <table width="100%" style="height: 100%">
        <tr>
            <td style="width: 100%" >
                <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                <!--begin tr of master search->
                <tr style="height: 2%">
                    <td>
                    <fieldset>
                        <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 10%">Date</td>
                                <td style="width: 10%"> <gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" /></td>
                                <td style="width: 70%" colspan="5"></td>
                                <td style="width: 5%">
                             <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                    </td>
                     <td style="width: 5%">
                           <gw:imgbtn id="btnPrint2" img="excel" alt="Print" onclick="OnPrint()" />
                     </td>
                            </tr>
                        </table>
                        </fieldset>
                    </td>
                </tr>
                <!--begin tr of master search->
                
                <!--begin tr1 of master 1->
                    <tr style="height: 40%">
                    <!--td1->
                        <td style="width: 35%" valign="top">
                        <fieldset>
                        <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 28%" rowspan="2" align="left" valign="middle" colspan="2">Section</td>
                                            <td style="background-color:#B4E7FF;width: 18%" align="left">Daily</td>
                                            <td style="background-color:#B4E7FF;width: 18%" align="left">Monthly Total</td>
                                            <td style="background-color:#B4E7FF;width: 36%" align="left" colspan="2">Comparision monthly result with target</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF" align="left">Genlatin Capsule</td>
                                            <td style="background-color:#B4E7FF" align="left">Genlatin Capsule</td>
                                            <td style="background-color:#B4E7FF;width: 18%" align="left">Target (G.Capsule)</td>
                                            <td style="background-color:#B4E7FF;width: 18%" align="left">Comparision(%)</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF" align="left" colspan="2">Take In</td>
                                            <td style="background-color:#ffffff" align="center"><gw:textbox id="txtTi_DlyCapsule" type="number" format="###,###,###,###,###" readonly="true" /></td>
                                            <td style="background-color:#ffffff" align="center"><gw:textbox id="txtTi_MCapsule" readonly="true" type="number" format="###,###,###,###,###"/></td>
                                            <td style="background-color:#ffffff" align="center"><gw:textbox id="txtTi_TargetCapsule" readonly="true" type="number" format="###,###,###,###,###" /></td>
                                            <td style="background-color:#ffffff" align="center"><gw:textbox id="txtTi_Comparision" readonly="true" type="number" format="###,###,###,###,###.##" /></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 14%" align="left" rowspan="3" valign="bottom">Take Out</td>
                                            <td style="background-color:#B4E7FF;width: 14%" align="left" valign="bottom">Domestic</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_DailyDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_MDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_TargetDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_DmsticComparision" type="number" format="###,###,###,###,###.##" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 14%" align="left" valign="bottom">Export</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_DailyExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_MDExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_TargetExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTo_ExpComparision" type="number" format="###,###,###,###,###.##" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;width: 14%" align="left" valign="bottom">Total</td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtTo_DailyTotalCapsule" type="number" format="###,###,###,###,###" readonly="true"  styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtTo_MDTotalCapsule" type="number" format="###,###,###,###,###" readonly="true"  styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtTo_TargetTotalCapsule" type="number" format="###,###,###,###,###" readonly="true"  styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtTo_TotalComparision" type="number" format="###,###,###,###,###.##" readonly="true"  styles="background-color:Yellow;"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" rowspan="3" valign="bottom">Order</td>
                                            <td style="background-color:#B4E7FF;" align="left" valign="bottom">Domestic</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_DailyDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_MDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_TargetDmsticCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_DmsticComparision" type="number" format="###,###,###,###,###.##" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 14%" align="left" valign="bottom">Export</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_DailyExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_MDExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtOrder_TargetExpCapsule" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtTOrder_ExpComparision" type="number" format="###,###,###,###,###.##" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;width: 14%" align="left" valign="bottom" >Total</td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtOrder_DailyTotalCapsule" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtOrder_MDTotalCapsule" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtOrder_TargetTotalCapsule" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow" align="center"><gw:textbox id="txtTOrder_TotalComparision" type="number" format="###,###,###,###,###.##" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </fieldset>
                        </td>
                         <!-- td1->
                        <td style="width: 15%" valign="top">
                       <fieldset>
                       <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 40%" align="left" valign="middle" colspan="2">Section</td>
                                            <td style="background-color:#B4E7FF;width: 60%" align="center">Quantity</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 20%" align="left" valign="middle" rowspan="3">Total</td>
                                            <td style="background-color:#B4E7FF;width: 20%;padding-left:2px" align="left" valign="bottom">Type A</td>
                                            <td style="background-color:#B4E7FF" align="left"><gw:textbox id="txtTypeA" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 20%;padding-left:2px" align="left" valign="bottom">Type B</td>
                                            <td style="background-color:#B4E7FF" align="left"><gw:textbox id="txtTypeB" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;width: 20%;padding-left:2px" align="left" valign="bottom" >Total</td>
                                            <td style="background-color:Yellow" align="left"><gw:textbox id="txtTotal" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>  
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div style="padding:35px"></div>
                        <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 40%" align="left" valign="middle">Section</td>
                                            <td style="background-color:#B4E7FF;width: 60%" align="center">Quantity</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF" align="left" valign="bottom">Printing Qty Daily</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPQtyDaily" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF" align="left" valign="bottom">Printing Qty Monthly</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPQtyMonthly" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                       </fieldset>
                        </td>
                        
                        <!--end td1->
                    </tr>
                    <!--end tr1 of master 1->
                    
                    <!--begin tr1 of master 2->
                    <tr style="height: 48%">
                        <td style="width: 25%" valign="top">
                        <fieldset>
                        <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 40%" align="left" valign="middle" colspan="2">Section</td>
                                            <td style="background-color:#B4E7FF;width: 30%" align="center">Target</td>
                                            <td style="background-color:#B4E7FF;width: 30%" align="center">Result</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width:20%;padding-left:2px" align="left" rowspan="4">WIP</td>
                                            <td style="background-color:#B4E7FF;width:20%" align="left">Unprinting</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPrePrintTaget" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPrePrintResult" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width:20%" align="left">Waiting for Printing</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtW_forPrintTaget" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtW_forPrePrintResult" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width:20%" align="left">Printing</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPrintingTaget" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtPrintingResult" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width:20%" align="left">Waiting for Packing</td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtW_forPackingTaget" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF" align="center"><gw:textbox id="txtW_forPackingResult" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div style="padding:2px"></div>
                        <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 40%" align="left" valign="middle" colspan="2">Section</td>
                                            <td style="background-color:#B4E7FF;width: 20%" align="center">Domestic</td>
                                            <td style="background-color:#B4E7FF;width: 20%" align="center">Export</td>
                                            <td style="background-color:#B4E7FF;width: 20%" align="center">Total</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 20%" rowspan="10" align="left" valign="middle">Finished Product</td>
                                            <td style="background-color:#B4E7FF;width: 20%" align="left" valign="middle">Printed</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrintedDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrintedExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrintedTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">Unprinting</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPre_PrintingDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPre_PrintingExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPre_PrintingTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;" align="left" valign="middle">Total</td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal1Domestic" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal1Exp" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal1Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">TransParent</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTransDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTransdExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTransTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">Opacity</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtOpacDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtOpacExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtOpacTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;" align="left" valign="middle">Total</td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal2Domestic" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal2Exp" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal2Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">Type A</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeADomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeAExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeATotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">Type B</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeBDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeBExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTypeBTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle">Blending</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtBlendingDomestic" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtBlendingExp" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtBlendingTotal" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:Yellow;" align="left" valign="middle">Total</td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal3Domestic" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal3Exp" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtTotal3Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </fieldset>
                        </td>
                        <!--begin tr=9  same tr= 7 and tr =8  of td near on left ->  
                        <td style="width: 25%" valign="top">
                        <fieldset>
                        <table style="width:100%">
                            <tr>
                                <td style="background-color:#cccccc">
                                    <table cellpadding="0" cellspacing="1" width="100%" style="line-height:18px">
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 25%" align="left" valign="middle" rowspan="3">Section</td>
                                            <td style="background-color:#B4E7FF;width: 50%" align="left" colspan="2">Equipment operation acording to type of Product/Production Result</td>
                                            <td style="background-color:#B4E7FF;width: 25%" align="left">Unprinting stock of Transparent Capsule</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left" valign="middle" colspan="3">Gelatin Capsule</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;width: 25%" align="left">Running Machine</td>
                                            <td style="background-color:#B4E7FF;width: 25%" align="left">Product Qty Daily</td>
                                            <td style="background-color:#B4E7FF;width: 25%" align="left">Unprinting Qty</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#00E</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_00E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_00E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_00E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#00</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_00" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_00" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_00" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#0E</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_0E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_0E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_0E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#0</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_0" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_0" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_0" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#1</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_1" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_1" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_1" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                         <tr>
                                            <td style="background-color:#B4E7FF;" align='left'>#2</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_2" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_2" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_2" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#2E</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_2E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_2E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_2E" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#3</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_3" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_3" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_3" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left">#4</td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtTotalM_4" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtProDaily_4" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                            <td style="background-color:#B4E7FF;" align="center"><gw:textbox id="txtPrePrinting_4" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                         <tr>
                                            <td style="background-color:Yellow;" align="left">Total</td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtMachine_Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtProduct_Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                            <td style="background-color:Yellow;" align="center"><gw:textbox id="txtpre_Printing_Total" type="number" format="###,###,###,###,###" readonly="true" styles="background-color:Yellow;"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left"  colspan="2">Daily Rate(%)</td>
                                            <td style="background-color:#B4E7FF;" align="left" colspan="2"><gw:textbox id="txtDailyRate" type="number" format="###,###,###,###,###.##" readonly="true" /></td>
                                        </tr>
                                             
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left"  colspan="2">Monthly Qty</td>
                                            <td style="background-color:#B4E7FF;" align="left" colspan="2"><gw:textbox id="txtMonthlyQty" type="number" format="###,###,###,###,###" readonly="true"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:#B4E7FF;" align="left"  colspan="2">Monthly Rate(%)</td>
                                            <td style="background-color:#B4E7FF;" align="left" colspan="2"><gw:textbox id="txtMonthlyRate" type="number" format="###,###,###,###,###.##" readonly="true"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                       
                        </fieldset>
                        </td>
                    </tr>
                    <!--end tr1 of master 2->
                </table>
            </td>
        </tr>
    </table>
    <!--begin grid grdTakeInOut->
    <gw:grid id="grdTakeInOut" header="1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="||||||||||||||||||||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    autosize="true"
                    sorting='T' styles="width:1%; height:1%" style="display: none"/>
     <!--end grid grdTakeInOut->
     <!--begin grid grdDailyStock->
    <gw:grid id="grdDailyStock" header="1|2|3|4|5|6|7|8|9|10|11|12"
                    format="0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="|||||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="0|0|0|0|0|0|0|0|0|0|0|0"
                    autosize="true"
                    sorting='T' styles="width:1%; height:1%" style="display: none"/>
     <!--end grid grdDailyStock->
     
      <!--grid grdProductStock->
    <gw:grid id="grdProductStock" header="1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="||||||||||||||||||||||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    autosize="true"
                    sorting='T' styles="width:1%; height:1%" style="display: none"/>
     <!--end grid grdProductStock->
     
      <!--grid grdPrintingResult->
    <gw:grid id="grdPrintingResult" header="1|2"
                    format="0|0" aligns="0|0" defaults="|"
                    editcol="0|0" widths="1000|1300"
                    autosize="true"
                    sorting='T' styles="width:1%; height:1%" style="display: none"/>
     <!--end grid grdPrintingResult->
     
      <!--grid grdCapsuleStock->
    <gw:grid id="grdCapsuleStock" header="1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="|||||||||||||||||||||||||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    autosize="true"
                    sorting='T' styles="width:1%; height:1%" style="display: none"/>
     <!--end grid grdCapsuleStock->
</body>
</html>
