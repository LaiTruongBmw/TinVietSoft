<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var ctlGroup;
var bChange_All=false;
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
var  g_user_id = "<%=Session("USER_ID")%>" ;
var startTime,interval_time
function BodyInit()
{ 	
    if (v_language!="ENG"){
        System.Translate(document);
    }		
		Reports.mnReport[0].checked=true;
		dtArrivalListTo.SetDataText(System.AddDate(dtArrivalListFrom.GetData(),3));
		dtDepartureTo.SetDataText(System.AddDate(dtDeparturelListFrom.GetData(),3));
        dtRevenueDaily.SetDataText(System.AddDate(dtRevenueDaily.GetData(),-1)); 
		dtNackBarAcademy.SetDataText(System.AddDate(dtNackBarAcademy.GetData(),-1)); 
		dtHseAssignmentFrom.SetDataText(System.AddDate(dtHseAssignmentFrom.GetData(),-1)); 
		dtHseAssignmentTo.SetDataText(System.AddDate(dtHseAssignmentTo.GetData(),-1)); 
		dtRevenueDaily_usd.SetDataText(System.AddDate(dtRevenueDaily_usd.GetData(),-1));
		dtRevenueDaily_usd2.SetDataText(System.AddDate(dtRevenueDaily_usd2.GetData(),-1));
		dtfrmGolfTourFees.SetDataText(System.AddDate(dtfrmGolfTourFees.GetData(),-7));
		dtroom_occupiedfrm.SetDataText(System.AddDate(dtroom_occupiedfrm.GetData(),-1));
		dtBkingSrcStaticFrm.SetDataText(System.AddDate(dtBkingSrcStaticFrm.GetData(),-1));
		dt_nationality_frm.SetDataText(System.AddDate(dt_nationality_frm.GetData(),-1)); 
		dt_company_frm.SetDataText(System.AddDate(dt_company_frm.GetData(),-1));
		var	data;	
		data = "data |1|1|2|2|3|3|4|4|5|5|6|6";
        lstWeekly.SetDataText(data); 
		lstWeekly.value=1;
		//var l_dtRoomAdjustFrm=(dtRoomAdjustFrm.GetData());
		//var l_get_dt_frm_adj=l_dtRoomAdjustFrm.substring(0,6)+"01";
		//dtRoomAdjustFrm.value=l_get_dt_frm_adj;
		var l_dtFnBAdjustFrm=(dtFnBAdjustFrm.GetData());
		var l_get_fnb_frm_adj=l_dtFnBAdjustFrm.substring(0,6)+"01";
		dtFnBAdjustFrm.value=l_get_fnb_frm_adj;
		//chk_Monthly_Revenue_VND_a3.value='Y';
		//chk_Monthly_Revenue_USD_a3.value='Y';
		txtExRate.text = "<%=CtlLib.SetDataSQL("SELECT to_char(sf_get_current_sell_ex_rate("+ Session("COMPANY_PK") +",'USD'),'999,999,999') from dual")%> VND";
		data = "data|10|ROOM FEE|20|FnB FEE|30|GREEN FEE|40|CADDIE FEE|50|CART FEE|60|MINI BAR FEE|70|OTHERS|80|DEBIT FROM ADVANCE|ALL|Select All";
		
}

//------------------------------------
function OnChangeOption(form,obj)
{
    form.optMonthReport[obj-1].checked=true;
}
//------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:360;edge:sunken;scroll:no;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstDept_Code_1.value=obj;
        lstDept_Code_3.value=obj;
    }
    
}

//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    var obj;
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//------------------------------------


function SetDeptAll()
{
    if(txtHr_level.text=="6")
            txtDeptData.text=txtDeptData.text+"|ALL|Select All";
    bChange_All=true;
    lstDept_Code_1.SetDataText(txtDeptData.text);
    txtDept.text=lstDept_Code_1.value;
    
}
//-----------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "datDeptData":
        {
               SetDeptAll();
               break;
        }
		    case "datFind_Report":
		    {
		        if (Reports.optMonthReport[0].checked)
                {
                    //var url=System.RootURL+ '/reports/ch/ae/' + txtReport_tmp.text + '?l_tco_dept_pk=' + lstDept_Code_1.value + '&l_dept_nm=' + lstDept_Code_1.GetText() + '&l_thr_group_pk=' + lstGrp_Code_1.value + '&l_status=' + lstStatus_1.value + '&l_emp_id=' + txtEmp_ID_1.text + '&l_work_mon=' + dtMonth.value ;
		        }
		        window.open(url);
		    }   
		    break;
    }
	
}

//--------------------------------
function OnReport()
{
    var arrOp = document.getElementsByTagName('input');
	var url = "";
	
	for(var idx=0; idx < arrOp.length; idx++){
		if(arrOp[idx].getAttribute('name') == "mnReport"){
			if(arrOp[idx].checked)
				switch(arrOp[idx].id){   
					case "opArrivalList"://arrival
						var url = '/standard/reports/ho/30/rpt_60300010.aspx?p_dt_frm='+ dtArrivalListFrom.value+'&p_dt_departure='+dtArrivalListTo.value+'&p_guest_name='+""+'&p_count_RM='+""+'&p_report_type='+"1";
						System.OpenTargetPage( System.RootURL+url , "newform" );
						 //url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00010_2.rpt&procedure=crm.sp_rpt_htfo00010&parameter="+dtArrivalListFrom.value+","+dtArrivalListTo.value;   
						//System.OpenTargetPage(url); 
					break;	
					case "opDepartureList"://Departure
						 var url = '/standard/reports/ho/30/rpt_60300020_departure.aspx?p_dt_frm='+ dtDeparturelListFrom.value+'&p_dt_departure='+dtDepartureTo.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );  
					break;	
					case "opInhouseList"://inhouse list		 
						 //var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00180_4.rpt&procedure=CRM.sp_rpt_htfo00180_2&parameter="+''+","+ ''+","+ '';   
						 //System.OpenTargetPage(url); 
						 var url = '/standard/reports/ho/30/rpt_60300020_inhouse_list2.aspx?p_room='+ ''+'&p_report_type='+'1';
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					
					case "opOutOfOrder"://Out Of Order	 
						var url = '/standard/reports/ho/30/rpt_60300010_ooo.aspx?p_no_parameter='+'';
						System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;	
					case "opHousekeepingAssignment"://opHousekeepingAssignment
						  var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00300.rpt&procedure=crm.sp_sel_htfo00300&parameter="+dtHseAssignmentFrom.value+","+dtHseAssignmentTo.value+","+'';   
						System.OpenTargetPage(url); 

					break;
					case "opRevenueDaily"://night audit vnd
						var url = '/reports/ja/ma/rpt_jama00150_Nigh_Audit_daily_VND.aspx?p_date='+dtRevenueDaily.value+'&p_ex_rate='+txtExRate.text;  //txtExRate.text
							System.OpenTargetPage( System.RootURL+url , "newform" );
						/*if(chkNightAuditVND.value =='Y')
						{
							var url = '/reports/ja/ma/rpt_jama00150_Nigh_Audit_daily_VND.aspx?p_date='+dtRevenueDaily.value+'&p_ex_rate='+txtExRate.text;  //txtExRate.text
							System.OpenTargetPage( System.RootURL+url , "newform" );
						}
						else
						{
							 var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/ma/jama00150_RevenueDaily.rpt&procedure=crm.SP_SEL_REVENUE_DAILY|crm.SP_SEL_VIP_INHOUSE_LIST|crm.SP_SEL_VIP_ARRIVAL_LIST|crm.SP_SEL_COMP_LIST|crm.SP_SEL_OOO_LIST|crm.sp_tmp_main_rpt_not_delete&parameter="+dtRevenueDaily.value+"|"+dtRevenueDaily.value+"|"+dtRevenueDaily.value+"|"+dtRevenueDaily.value+"|"+dtRevenueDaily.value+"|"+dtRevenueDaily.value+","+g_user_id;              
							 System.OpenTargetPage(url); 
						}*/
					break;	 
					case "opRevenueDaily_usd"://opRevenueDaily_usd    
						/*if(chkNightAuditUSD.value =='Y')
						{*/
							var url = '/standard/reports/ho/30/rpt_60300010_Nigh_Audit_daily_USD.aspx?p_date='+dtRevenueDaily_usd.value+'&p_ex_rate='+txtExRate.text;  //txtExRate.text;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						/*}
						else
						{
							 var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/ma/jama00150_RevenueDaily_usd.rpt&procedure=crm.sp_rpt_revenue_daily_usd|crm.SP_SEL_VIP_INHOUSE_LIST|crm.SP_SEL_VIP_ARRIVAL_LIST|crm.SP_SEL_COMP_LIST|crm.SP_SEL_OOO_LIST|crm.sp_tmp_main_rpt_not_delete&parameter="+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+","+g_user_id;              
							System.OpenTargetPage(url); 
						} */
					break;	
					case "opRevenueDaily_usd2"://opRevenueDaily_usd    
						/*if(chkNightAuditUSD.value =='Y')
						{*/
							var url = '/standard/reports/ho/30/rpt_60300010_Nigh_Audit_daily_USD.aspx?p_date='+dtRevenueDaily_usd2.value;  //txtExRate.text;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						/*}
						else
						{
							 var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/ma/jama00150_RevenueDaily_usd.rpt&procedure=crm.sp_rpt_revenue_daily_usd|crm.SP_SEL_VIP_INHOUSE_LIST|crm.SP_SEL_VIP_ARRIVAL_LIST|crm.SP_SEL_COMP_LIST|crm.SP_SEL_OOO_LIST|crm.sp_tmp_main_rpt_not_delete&parameter="+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+"|"+dtRevenueDaily_usd.value+","+g_user_id;              
							System.OpenTargetPage(url); 
						} */
					break;	
					case "opfnbdaily":
						url = '/reports/ja/ma/jama00150_Daily_FnB_Golf_Revenue.aspx?p_date='+ dtNackBarAcademy.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opfinalrevenue":
							var url = '/reports/ja/ma/rpt_jama00010_monthly_revenue_a3.aspx?p_month='+dtMonth.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						/*if(chk_Monthly_Revenue_VND_a3.value =='Y')
						{
							//alert("Not..Yet");
							var url = '/reports/ja/ma/rpt_jama00010_monthly_revenue_a3.aspx?p_month='+dtMonth.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						}
						else
						{
							url = "/system/ReportEngine.aspx?export_pdf=Y&file=ja/ma/rpt_jama00010_a3.rpt&procedure=crm.sp_sel_final_revenue_monthly&parameter=" + dtMonth.value;
							System.OpenTargetPage( System.RootURL+url);
						}*/
					break; 
					case "opfinalrevenueusd"://usd 
							var url = '/reports/ja/ma/rpt_jama00010_monthly_revenue_usd_lotus.aspx?p_month='+dtMonthUSD.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );	
					break; 
					case "opRoomRevenueDaily":
						url = "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00250.rpt&procedure=CRM.sp_rpt_htfo00250_2&parameter="+''+","+''+","+"N";
						System.OpenTargetPage( System.RootURL+url);
					break; 
					case "opGolfRevenueDaily":
						var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00050_cash_summary_daily.rpt&procedure=CRM.sp_sel_jart00050_report&parameter="+dtGolfRevenueDaily.GetData()+","+dtGolfRevenueDailyTo.GetData();   
						System.OpenTargetPage(url); 
					break; 
					case "opGolfOperationByPlayer":
						var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00130_new.rpt&procedure=CRM.sp_sel_jart00130_rpt&parameter=" + dtGolfOperationByPlayer.GetData();
						System.OpenTargetPage(url); 
					break;   
					case "opGolfOperationWeekly":
						var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00130_2.rpt&procedure=CRM.sp_rpt_jart00130&parameter=" + dtGolfOperationWeekly.GetData();
						System.OpenTargetPage(url); 
					break; 
					case "opMarshallDepartmentDaily":
						url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/st/jast00100_fast.rpt&procedure=CRM.sp_sel_jast00100&parameter="+dtMarshallDepartmentDaily.GetData();   
						System.OpenTargetPage(url); 
					break; 	
					case "opMarshallDepartmentMonthly":
						var url = '/reports/ja/st/rpt_jast00100.aspx?p_month='+dtMarshallDepartmentMonthly.GetData();  
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 		
					case "opWeeklyRevenue":
						
						var url = '/standard/reports/ho/30/rpt_60300010_WeeklyRevenue.aspx?p_Month='+dtWeeklyRevenue.GetData()+'&p_week='+lstWeekly.value;  
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 	
					case "opRoomFeeAdjust"://room fee adjust                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_fee_adjust_date_frm_to.aspx?p_dt_from='+dtRoomFeeAdjustFrm.value+ "&p_dt_to="+dtRoomFeeAdjustTo.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	 
					case "opOtherFeeList"://other fee list                                     
						  var url = '/standard/reports/ho/30/rpt_60300010_other_fee.aspx?p_dtfrom='+dtOtherFeeListFrm.value+ "&p_dtto="+dtOtherFeeListTo.value+ "&p_room_last_first_name="+''+ "&p_fee_type="+'ALL';
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	 
					   
					case "opFnBAdjust"://FnB Adjust    	                                     
						  url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/rpt_htrt00160.rpt&procedure=crm.sp_rpt_htrt00160&parameter="+''+","+dtFnBAdjustFrm.value+","+dtFnBAdjustTo.value;              
							System.OpenTargetPage(url); 
					break;	  
					
					case "opFnBRevenuve"://FnB Revenuve
						  url = '/standard/reports/ho/30/rpt_60300010_Revenue.aspx?p_fr=' + dtFnBRevenuveFrm.GetData() + '&p_to=' + dtFnBRevenuveTo.GetData() + '&p_loc=0&p_pay=0';
						  System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					
					case "opFnBSession"://FnB Session    	                                     
						  url = '/standard/reports/ho/30/rpt_60300010_Session.aspx?p_fr=' +dtFnBSessionFrm.value+'&p_to='+dtFnBSessionTo.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					case "opFnB_PL_Monthly"://sql chi get dc dong 0-->11
						var url = '/reports/ja/ma/rpt_jama00150_FnB_PL.aspx?p_month='+dtFnB_PL.GetData();  
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opdtMonthlyUSD_SR"://village monthly-->usd    
							var url = '/reports/ja/ma/rpt_jama00010_Monthly_Revenue_SR_USD.aspx?p_month='+dtMonthUSD_SR.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 	
					case "opRoomRevenueYearly"://Room Revenue Yearly   
							var url = '/reports/ja/ma/rpt_Room_Revenue_Yearly.aspx?p_year='+dtYear.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opFnbRevenueYearly"://Fnb Revenue Yearly   
							var url = '/reports/ja/ma/rpt_FnB_Revenue_Yearly.aspx?p_year='+dtYearFnB.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opGolfRevenueYearly"://golf Revenue Yearly   
							var url = '/reports/ja/ma/rpt_Golf_Revenue_Yearly.aspx?p_year='+dtYearGolf.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opProshopDvrRangeYearly"://Proshop Drv range Revenue Yearly   
							var url = '/reports/ja/ma/rpt_Proshop_drv_range_Revenue_Yearly.aspx?p_year='+dtYearProshopDvrRange.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opfinalrevenueusd_not_tax"://revenue monthly usd not tax   
							//alert("Not..Yet");
							var url = '/reports/ja/ma/rpt_jama00010_monthly_revenue_usd_nottax.aspx?p_month='+dtMonthUSDNotTax.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						
					break; 
					case "opfinalrevenueVND_not_tax"://revenue monthly vnd not tax   
							//alert("Not..Yet");
							var url = '/reports/ja/ma/rpt_jama00010_monthly_revenue_vnd_nottax.aspx?p_month='+dtMonthVNDNotTax.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
						
					break; 
					case "opMarketSegmentation"://Market Segmentation Yearly   
							var url = '/reports/ja/ma/rpt_jama00150_MarketSegmentation.aspx?p_year='+dtYearMarketSegmentation.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opfnb_sesion_yearly"://sesion_yearly     
							var url = '/reports/ja/ma/rpt_jama000150_fnb_sesion_yearly.aspx?p_year='+dtYearfnbSesionYearly.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opRevenueSummary"://Revenue Summary
						 var url = '/reports/ja/ma/rpt_jama00150_revenue_summary.aspx?p_dtfrm='+ dtFromRevenueSummary.value+'&p_dtto='+dtToRevenueSummary.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );  
					break;		  	
					case "opMonthAnalyzeMemberDaily"://Month Analyze MemberDaily 
							var url = '/reports/ja/ma/rpt_jama00150_analyze_member_daily.aspx?p_month='+dtMonthAnalyzeMemberDaily.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 	
					case "opYearAnalyzeMember"://Year Analyze Member  
							var url = '/reports/ja/ma/rpt_jama00150_analyze_member_year.aspx?p_year='+dtYearAnalyzeMember.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opGolfRevenueMonthly"://Golf Revenue Monthly		
							var url = '/reports/ja/ma/rpt_jama00150_Golf_Revenue_Monthly.aspx?p_month='+dtGolfRevenueMonthly.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opGuest_statistic_By_Hour"://Month Guest_statistic_By_Hour  
							var url = '/reports/ja/ma/rpt_jama00150_Guest_statistic_By_Hour.aspx?p_month='+dtGuest_statistic_By_Hour.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opGolfTourFees"://golf tour fees    	                                     
						  url = System.RootURL + '/reports/ja/ma/rpt_jama00150_golf_tour_fees.aspx?p_dt_from='+dtfrmGolfTourFees.value+'&p_dt_to='+dtToGolfTourFees.value;
							System.OpenTargetPage(url); 
					break;	
					case "opForcecast"://opForcecast    
							var url = '/reports/ja/ma/rpt_jama00150_forcecast.aspx?p_date='+dtForcecast.value;  //txtExRate.text;  
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					case "opCashDailySummary"://opCashDailySummary 
						var url = '/standard/reports/ho/30/rpt_60300010_cash_daily_summary2.aspx?p_date='+dtCashDailySummaryFrm.value+'&p_date_to='+dtCashDailySummaryTo.value+'&p_room='+''+'&p_payment_method='+'ALL'+'&p_partner_PK='+'' +"&p_time_frm=" +''+"&p_time_to=" +''+"&p_cashier=" +'';
						System.OpenTargetPage( System.RootURL+url , "newform" );      
						  //var url = '/reports/ht/fo/rpt_htfo00270_cash_daily_summary.aspx?p_checkout_date='+dtCashDailySummaryFrm.value+'&p_checkout_date_to='+dtCashDailySummaryTo.value+'&p_room_no='+''+'&p_pay_method='+'ALL'+'&p_tco_buspartner_pk='+''+ "&p_time_from=" +''+ "&p_time_to=" +''+ "&p_cashier=" +'';
							//System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					case "opPaymentReport"://PaymentReport                                     
						  var url = '/standard/reports/ho/30/rpt_60300010_cash_daily_summary2.aspx?p_date='+dtPaymentReport.value+'&p_room='+''+'&p_payment_method='+'ALL'+'&p_partner_PK='+''+"&p_time_frm=" +''+"&p_time_to=" +''+"&p_cashier=" +'';
						System.OpenTargetPage( System.RootURL+url , "newform" );   
					break;	
					case "opdaily_booking_source_statistic"://opdaily_booking_source_statistic                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_daily_bking_source_static.aspx?p_dtfrm='+dtBkingSrcStaticFrm.value+'&p_dtto='+dtBkingSrcStaticTo.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break; 
					case "opdaily_market_segment"://opdaily_market_segment                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_market_segment.aspx?p_dtfrm='+dtMarketSegmentFrm.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;	
					case "opdaily_room_occupied"://opdaily_room_occupied                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_room_occupied_static.aspx?p_dtfrm='+dtroom_occupiedfrm.value+'&p_dtto='+dtroom_occupiedto.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opdaily_nationality_statistic"://opdaily_nationality_statistic                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_nationality_static.aspx?p_dtfrm='+dt_nationality_frm.value+'&p_dtto='+dt_nationality_to.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opdaily_company_statistic"://opdaily_company_statistic                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_company_static.aspx?p_dtfrm='+dt_company_frm.value+'&p_dtto='+dt_company_to.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opdaily_house_use_statistic"://opdaily_house_use_statistic                                      
						  var url = '/standard/reports/ho/30/rpt_60300010_house_use.aspx?p_dtfrm='+dt_house_use_frm.value+'&p_dtto='+dt_house_use_to.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opdaily_complimentary_statistic"://opdaily_house_use_statistic                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_complimentary.aspx?p_dtfrm='+dt_complimentary_frm.value+'&p_dtto='+dt_complimentary_to.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case "opdaily_cancel_noshow"://opdaily_cancel_noshow                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_cancel_noshow.aspx?p_dtfrm='+dt_cancel_noshow_frm.value+'&p_dtto='+dt_cancel_noshow_to.value;
							System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;
					case "opDivisionRevenue"://usd 
							var url = '/standard/reports/ho/30/rpt_60300010_consolidate.aspx?p_monthly='+dtDivisionRevenue.value;  
							System.OpenTargetPage( System.RootURL+url , "newform" );	
					break; 
					case "opdaily_company_statistic_bk_by"://opdaily_company_statistic  
						if(g_user_id=="smquang")
						{						
						  var url = '/standard/reports/ho/30/rpt_60300010_company_static_bk.aspx?p_dtfrm='+dt_company_frm_bk_by.value+'&p_dtto='+dt_company_to_bk_by.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
						}
						else
						{///
						}
					break;
					case "opReservation_daily_report"://Reservation_daily_report                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_Reservation_daily_report.aspx?p_dtfrm='+Reservation_daily_report_from.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;
					case "opmarket_segment_from_to"://Market Segment report type date from to                                    
						  var url = '/standard/reports/ho/30/rpt_60300010_market_segment_date_from_to.aspx?p_dtfrm='+dtMarketSegment_frm.value+'&p_dtto='+dtMarketSegment_to.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;
					case "opmarket_room_type_from_to"://room type report --> date from - to                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_room_type_date_from_to.aspx?p_dtfrm='+dtRoom_Type_frm.value+'&p_dtto='+dtRoom_Type_to.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break; 
					case "opRoomRevenue_from_to"://room type report --> date from - to                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_room_revenue_monthly.aspx?p_dtfrm='+dtRoomRevenuefrm.value+'&p_dtto='+dtRoomRevenueTo.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;	
					
					case "opBookingSourceYearly"://room type report --> date from - to                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_nationality_customer_analysis.aspx?p_year='+dtBKSourceYearly.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;
					case "opMKTSegmentYearly"://room type report --> date from - to                                   
						  var url = '/standard/reports/ho/30/rpt_60300010_nationality_mkt_segment_yearly.aspx?p_year='+dtMKTSegmentYearly.value;
						  System.OpenTargetPage( System.RootURL+url , "newform" ); 
					break;
					 	 
				}         
			            	      
		}
	}
}




</script>
<style type="text/css">
<!--
.textColor {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 11px;
}
-->
</style>

<style>
.top { border-top:1px solid #034D72; }
.topright { border-top :1px solid #034D72;
			border-right: 1px solid #034D72;;padding-right:10px
			}
.topleft {border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			}
.left { border-left:1px solid #034D72; }
.right { border-right:1px solid #034D72;padding-right:10px }
.bottomright { border-bottom:1px solid #034D72; 
				border-right:1px solid #034D72; padding-right:10px
				}
.bottomleft {  border-bottom:1px solid #034D72; 
				border-left:1px solid #034D72;}
.bottom { border-bottom:1px solid #034D72; }

.topleftbottom { border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.topbottom {border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.toprightbottom { border-right:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }
	
#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }

</style>

<body>
<!------------main control---------------------->


<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="hr.sp_pro_find_report" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<form name="Reports" id="form2" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:50%"   valign="middle" border="0" >
	 <tr >
	    <td  style="width:100%;height:100%" align="center">
			 <table style="width:650px;" border="0" style="background-color:034D72">
				<tr>
					<td style="background-color:white;" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
							<tr style="width:100%;height:24px" > 
								<td width="25%" align="center" colspan="2"  style="border-right:0"style="color:#0099cc; font-size:13">Report Name</td>
								<td width="25%" align="center"  style="border-left:0;border-right:0"><a style="font-size:13">Date</a></td>
								<td width="10%" align="center"  style="border-left:0" style="color:#0099cc; font-size:13"><gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" /></td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opArrivalList" value="1" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Arrival List</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtArrivalListFrom" lang="1" />
									~<gw:datebox id="dtArrivalListTo" lang="1" /></td>
								<td align="center" valign="middle" >&nbsp;</td>
							</tr>
	 
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opInhouseList" value="3" checked></td> 
								<td valign="middle" style="font-size:12" width="23%" >
									 Inhouse List</td>
								<td align="left" valign="middle" >
								</td>			
								<td align="center" valign="middle" >&nbsp;</td>
							</tr> 
							
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opDepartureList" value="2" checked></td> 
								<td valign="middle" style="font-size:12" width="23%" >
									 Departure List</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtDeparturelListFrom" lang="1" />
									~<gw:datebox id="dtDepartureTo" lang="1" /></td>
								<td align="center" valign="middle" >&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opOutOfOrder" value="8" checked></td> 
								<td valign="middle" style="font-size:12" width="23%" >
									 Out Of Order</td>
								<td align="left" valign="middle" >
									
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr> 
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opHousekeepingAssignment" value="10" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Housekeeping Assignment</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtHseAssignmentFrom" lang="1" />
									~<gw:datebox id="dtHseAssignmentTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRevenueDaily" value="4" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Night Audit Daily(VND) </td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtRevenueDaily" lang="1" style="width:100%" /><gw:checkbox id="chkNightAuditVND" styles="display:none" defaultvalue="Y|N"  /></td>
								<td align="left" valign="middle" style="padding-top:10px;border-left:0"></td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRevenueDaily_usd" value="11" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Night Audit Daily(USD) </td>
								<td align="left" valign="middle" >
									<!--gw:datebox id="dtRevenueDaily_usd" lang="1" style="width:60%" /><gw:checkbox id="chkNightAuditUSD" defaultvalue="Y|N"  />Excel</td-->
									<gw:datebox id="dtRevenueDaily_usd" lang="1" style="width:100%" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRevenueDaily_usd2" value="51" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Night Audit Daily(VND) </td>
								<td align="left" valign="middle" >
									<!--gw:datebox id="dtRevenueDaily_usd" lang="1" style="width:60%" /><gw:checkbox id="chkNightAuditUSD" defaultvalue="Y|N"  />Excel</td-->
									<gw:datebox id="dtRevenueDaily_usd2" lang="1" style="width:100%" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opWeeklyRevenue" value="25"></td>
								<td valign="middle" style="font-size:12" width="23%" >Weekly Revenue</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtWeeklyRevenue"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  />Week</td>
								<td align="left"  style="padding-top:10px;border-left:0"><gw:list id="lstWeekly" style="width:50%"  /></td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top" style="display:none" > 
								<td width="2%" valign="middle" style="display:none" > 
										<input name="mnReport" type="radio" id="opfinalrevenueusd" value="7"></td>
								<td style="display:none" valign="middle" style="font-size:12" width="23%" >Revenue Monthly_A3 (VND)</td>
								<td align="left" valign="middle" class="" style="display:none" >
									<gw:datebox id="dtMonthUSD"  text=""  style="width:100%" type="month" lang="<%=Session("Lang")%>"  /><gw:checkbox id="chk_Monthly_Revenue_USD_a3" styles="display:none" defaultvalue="Y|N" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opfnbdaily" value="5" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									Daily F&B Golf Revenue</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtNackBarAcademy" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRoomRevenueDaily" value="9" checked></td> 
								<td valign="middle" style="font-size:12" width="23%" >
									 Room Revenue Summary</td>
								<td align="left" valign="middle" >
									
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr> 
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opfinalrevenue" value="6"></td>
								<td valign="middle" style="font-size:12" width="23%" >Revenue Monthly_A3 (VND)</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMonth"  text=""  style="width:100%" type="month" lang="<%=Session("Lang")%>"  /><gw:checkbox id="chk_Monthly_Revenue_VND_a3" styles="display:none" defaultvalue="Y|N" /></td> 
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							
							
							
							
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opGolfRevenueDaily" value="20"></td>
								<td valign="middle" style="font-size:12" width="23%" >Golf Revenue Daily</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtGolfRevenueDaily" lang="1" />~<gw:datebox id="dtGolfRevenueDailyTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opGolfOperationByPlayer" value="21"></td>
								<td valign="middle" style="font-size:12" width="23%" >Golf Operation By Player</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtGolfOperationByPlayer" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opGolfOperationWeekly" value="22"></td>
								<td valign="middle" style="font-size:12" width="23%" >Golf Operation Weekly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtGolfOperationWeekly" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opMarshallDepartmentDaily" value="23"></td>
								<td valign="middle" style="font-size:12" width="23%" >Marshall's Department Daily</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMarshallDepartmentDaily" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opMarshallDepartmentMonthly" value="24"></td>
								<td valign="middle" style="font-size:12" width="23%" >Marshall's Department Monthly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMarshallDepartmentMonthly"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRoomFeeAdjust" value="25" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Room Fee Adjust</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtRoomFeeAdjustFrm" lang="1" />  
									~<gw:datebox id="dtRoomFeeAdjustTo" lang="1" />
									</td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">
								
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opOtherFeeList" value="25" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Other Fee List</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtOtherFeeListFrm" lang="1" />  
									~<gw:datebox id="dtOtherFeeListTo" lang="1" />
									</td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">
								
							</tr>
							
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opFnBAdjust" value="26" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 POS Adjust</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtFnBAdjustFrm" lang="1" /> 
									~<gw:datebox id="dtFnBAdjustTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" ><input name="mnReport" type="radio" id="opFnBRevenuve" value="26" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >F&B Revenuve</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtFnBRevenuveFrm" lang="1" /> 
									~<gw:datebox id="dtFnBRevenuveTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opFnBSession" value="26" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 F&B Session</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtFnBSessionFrm" lang="1" /> 
									~<gw:datebox id="dtFnBSessionTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opFnB_PL_Monthly" value="27"></td>
								<td valign="middle" style="font-size:12" width="23%" >F&B Profit and Lost</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtFnB_PL"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdtMonthlyUSD_SR" value="28"></td>
								<td valign="middle" style="font-size:12" width="23%" >Revenue Monthly_SR (USD)</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMonthUSD_SR"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top">  
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opRoomRevenueYearly" value="29"></td>
								<td valign="middle" style="font-size:12" width="23%" >Room Revenue Yearly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtYear"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top">  
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opFnbRevenueYearly" value="30"></td>
								<td valign="middle" style="font-size:12" width="23%" >FnB Revenue Yearly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtYearFnB"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opGolfRevenueYearly" value="31"></td>
								<td valign="middle" style="font-size:12" width="23%" >Golf Revenue Yearly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtYearGolf"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opProshopDvrRangeYearly" value="32"></td>  
								<td valign="middle" style="font-size:12" width="23%" >Proshop & Dvr. Range Yearly</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtYearProshopDvrRange"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opfinalrevenueusd_not_tax" value="33"></td>
								<td valign="middle" style="font-size:12" width="23%" >Revenue Monthly USD (Not Tax)</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMonthUSDNotTax"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opfinalrevenueVND_not_tax" value="36"></td>
								<td valign="middle" style="font-size:12" width="23%" >Revenue Monthly VND (Not Tax)</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtMonthVNDNotTax"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opMarketSegmentation" value="34"></td>
								<td valign="middle" style="font-size:12" width="23%" >Market Segmentation</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtYearMarketSegmentation"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opfnb_sesion_yearly" value="35"></td>
								<td valign="middle" style="font-size:12" width="23%" >F&B Yearly Forcasting</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtYearfnbSesionYearly"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opRevenueSummary" value="37" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Revenue Summary</td>
								<td align="left" valign="middle" >
									<gw:datebox id="dtFromRevenueSummary" lang="1" />
									~<gw:datebox id="dtToRevenueSummary" lang="1" /></td>
								<td align="center" valign="middle" >&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opMonthAnalyzeMemberDaily" value="38"></td>
								<td valign="middle" style="font-size:12" width="23%" >Analyze Member Daily</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtMonthAnalyzeMemberDaily"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opYearAnalyzeMember" value="39"></td>
								<td valign="middle" style="font-size:12" width="23%" >Analyze Member Year</td>   
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtYearAnalyzeMember"  text=""  style="width:60%" type="year" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opGolfRevenueMonthly" value="40"></td> 
								<td valign="middle" style="font-size:12" width="23%" >Golf Revenue Monthly</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtGolfRevenueMonthly"  text=""  style="width:60%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >     
										<input name="mnReport" type="radio" id="opGuest_statistic_By_Hour" value="41"></td>
								<td valign="middle" style="font-size:12" width="23%" >Guest Statistic By Hour</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtGuest_statistic_By_Hour"  text=""  style="width:100%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opGolfTourFees" value="42"></td>
								<td valign="middle" style="font-size:12" width="23%" >Golf Tour Fees </td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dtfrmGolfTourFees" lang="1" />~<gw:datebox id="dtToGolfTourFees" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opForcecast" value="50" checked></td>
								<td valign="middle" style="font-size:12" width="23%" >
									 Reservation Status </td>
								<td align="left" valign="middle" >
									<!--gw:datebox id="dtRevenueDaily_usd" lang="1" style="width:60%" /><gw:checkbox id="chkNightAuditUSD" defaultvalue="Y|N"  />Excel</td-->
									<gw:datebox id="dtForcecast" lang="1" style="width:100%" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opCashDailySummary" value="51"></td>
								<td valign="middle" style="font-size:12" width="23%" >Cash Daily Summary </td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtCashDailySummaryFrm" lang="1" />~<gw:datebox id="dtCashDailySummaryTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;;display:none"  valign="top"> 
								<td width="2%" valign="middle" >
									<input name="mnReport" type="radio" id="opPaymentReport" value="52" checked></td>
								<td valign="middle" style="font-size:12" width="23%" > 
									 Payment Report </td>
								<td align="left" valign="middle" >
									<!--gw:datebox id="dtRevenueDaily_usd" lang="1" style="width:60%" /><gw:checkbox id="chkNightAuditUSD" defaultvalue="Y|N"  />Excel</td-->
									<gw:datebox id="dtPaymentReport" lang="1" style="width:100%" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">  
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_booking_source_statistic" value="53"></td>
								<td valign="middle" style="font-size:12" width="23%" >DAILY BOOKING SOURCE STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtBkingSrcStaticFrm" lang="1" />~<gw:datebox id="dtBkingSrcStaticTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">  
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_market_segment" value="54"></td>
								<td valign="middle" style="font-size:12" width="23%" >MARKET SEGMENT STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtMarketSegmentFrm" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_room_occupied" value="55"></td>
								<td valign="middle" style="font-size:12" width="23%" >ROOM OCCUPIED STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtroom_occupiedfrm" lang="1" />~<gw:datebox id="dtroom_occupiedto" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_nationality_statistic" value="56"></td>
								<td valign="middle" style="font-size:12" width="23%" >NATIONALITY STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dt_nationality_frm" lang="1" />~<gw:datebox id="dt_nationality_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_company_statistic" value="57"></td>
								<td valign="middle" style="font-size:12" width="23%" >COMPANY STATISTIC</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dt_company_frm" lang="1" />~<gw:datebox id="dt_company_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_house_use_statistic" value="58"></td>
								<td valign="middle" style="font-size:12" width="23%" >HOUSE USE STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dt_house_use_frm" lang="1" />~<gw:datebox id="dt_house_use_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_complimentary_statistic" value="59"></td>
								<td valign="middle" style="font-size:12" width="23%" >COMPLIMENTARY STATISTIC</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dt_complimentary_frm" lang="1" />~<gw:datebox id="dt_complimentary_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opdaily_cancel_noshow" value="60"></td>
								<td valign="middle" style="font-size:12" width="23%" >Cancellation - No show</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dt_cancel_noshow_frm" lang="1" />~<gw:datebox id="dt_cancel_noshow_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top"> 
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opDivisionRevenue" value="61"></td>
								<td valign="middle" style="font-size:12" width="23%" >Division revenue</td>
								<td align="left" valign="middle" class="" >
									<gw:datebox id="dtDivisionRevenue"  text=""  style="width:100%" type="month" lang="<%=Session("Lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" >
										<input name="mnReport" type="radio" id="opdaily_company_statistic_bk_by" value="57"></td>
								<td valign="middle" style="font-size:12" width="23%" >COMPANY STATISTIC(BK By)</td>
								<td align="left" valign="middle" class="" > 
									<gw:datebox id="dt_company_frm_bk_by" lang="1" />~<gw:datebox id="dt_company_to_bk_by" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opReservation_daily_report" value="60"></td>
								<td valign="middle" style="font-size:12" width="23%" >Reservation daily report</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="Reservation_daily_report_from" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opmarket_segment_from_to" value="61"></td>
								<td valign="middle" style="font-size:12" width="23%" >MARKET SEGMENT(2)</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtMarketSegment_frm" lang="1" /> ~ <gw:datebox id="dtMarketSegment_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opmarket_room_type_from_to" value="62"></td>
								<td valign="middle" style="font-size:12" width="23%" >Room Type Revenue</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtRoom_Type_frm" lang="1" /> ~ <gw:datebox id="dtRoom_Type_to" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opRoomRevenue_from_to" value="63"></td>
								<td valign="middle" style="font-size:12" width="23%" >Room Revenue</td>
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtRoomRevenuefrm" lang="1" /> ~ <gw:datebox id="dtRoomRevenueTo" lang="1" /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opBookingSourceYearly" value="64"></td>
								<td valign="middle" style="font-size:12" width="23%" >Nation & Booking Source Yearly</td> 
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtBKSourceYearly" type="year" lang="<%=session("lang")%>"  /></td>
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
							<tr height="height:24px" style="width:100%;"  valign="top">   
								<td width="2%" valign="middle" > 
										<input name="mnReport" type="radio" id="opMKTSegmentYearly" value="64"></td>
								<td valign="middle" style="font-size:12" width="23%" >Nation & MKT.Segment Yearly</td> 
								<td align="left" valign="middle" class="" >  
									<gw:datebox id="dtMKTSegmentYearly" type="year" lang="<%=session("lang")%>"  /></td> 
								<td align="center" valign="middle" style="padding-top:10px;border-left:0">&nbsp;</td>
							</tr>
						</table>             
					</td>        
				</tr>
            </table>
	    </td>
	</tr>	
 </table>
</form>
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="idemp_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/> 
<gw:textbox id="txtResult" styles="display:none"/> 
<gw:textbox id="txtReport_tmp" styles="display:none"/> 
<gw:textbox id="txtExRate" styles="display:none"/> 

</body>
</html>

