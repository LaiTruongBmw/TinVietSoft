<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    txtUser.text="<%=Session("User_ID") %>"; 
    BindingData(); 
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    //dso_ctl_getProposedBy.Call("SELECT");
	dso_getCompany.Call();
    
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
	var ls_possum = "DATA|Y|Posting|N|Summary||";
	var ls_FS = "<%=CtlLib.SetListDataSQL(" SELECT CODE, CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0020' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and code like 'A%' order by a.DEF_YN desc , code ")%>";

       lstCompany.SetDataText(ls_data);
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
	dataStatus = "Data|1H|Operating cost 1|17|Operating cost 2"; 
    lstReport.SetDataText(dataStatus); 
    lstPS.SetDataText(ls_possum); 
	lstFS.SetDataText(ls_FS); 
}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
   {
        var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60080150_accd_pl";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
    {
        txtACPK.SetDataText(object[3]);
        txtACCD.SetDataText(object[0]);
        txtACNM.SetDataText(object[1]);
    }
   }
   if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00220_plcenter.aspx?";
        var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLC_PK.text = object;     // Center PK
				dat_gfka00220_1.Call();
			}            
		}        
   }
   if (pname=='PL')
   {
       var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
       var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
	   var tmp;
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLPK.text=object;     // Center PK
				dat_gfka00220_2.Call();
			}            
		}    
   }
    
}
//------------------------------------------------------------------------------------------
function OnSearch()
{
   dso_sel_pl.Call("SELECT");
}
//-------------------------------------------------------------------------------------------

function OnPrint()
{
	
    var url ='/standard/reports/60/08/60080150.aspx?Company_Pk=' + lstCompany.value +'&FROM_DATE=' + txtFROM_DATE.value + '&TO_DATE=' + txtTO_DATE.value + '&Status='+lstStatus.value + '&p_Acc_Cd=' + txtACCD.text + '&PS=' + lstPS.value + '&FS=' + lstFS.value + '&Report_Type=' + lstReport.value;
    System.OpenTargetPage( System.RootURL+url , 'newform' );
      
}
function OnDataReceive(obj)
{
		var ctrl = grdDetail.GetGridControl();
        if(obj.id=='dso_sel_pl')
        {
			if(ctrl.Rows>0)
			{
				grdDetail.SetGridText(0,11,grdDetail.GetGridData(1,111));
				grdDetail.SetGridText(0,12,grdDetail.GetGridData(1,112));
				grdDetail.SetGridText(0,13,grdDetail.GetGridData(1,113));
				grdDetail.SetGridText(0,14,grdDetail.GetGridData(1,114));
				grdDetail.SetGridText(0,15,grdDetail.GetGridData(1,115));
				grdDetail.SetGridText(0,16,grdDetail.GetGridData(1,116));
				grdDetail.SetGridText(0,17,grdDetail.GetGridData(1,117));
				grdDetail.SetGridText(0,18,grdDetail.GetGridData(1,118));
				grdDetail.SetGridText(0,19,grdDetail.GetGridData(1,119));
				grdDetail.SetGridText(0,20,grdDetail.GetGridData(1,120));
				
				grdDetail.SetGridText(0,21,grdDetail.GetGridData(1,121));
				grdDetail.SetGridText(0,22,grdDetail.GetGridData(1,122));
				grdDetail.SetGridText(0,23,grdDetail.GetGridData(1,123));
				grdDetail.SetGridText(0,24,grdDetail.GetGridData(1,124));
				grdDetail.SetGridText(0,25,grdDetail.GetGridData(1,125));
				grdDetail.SetGridText(0,26,grdDetail.GetGridData(1,126));
				grdDetail.SetGridText(0,27,grdDetail.GetGridData(1,127));
				grdDetail.SetGridText(0,28,grdDetail.GetGridData(1,128));
				grdDetail.SetGridText(0,29,grdDetail.GetGridData(1,129));
				grdDetail.SetGridText(0,30,grdDetail.GetGridData(1,130));
				
				grdDetail.SetGridText(0,31,grdDetail.GetGridData(1,131));
				grdDetail.SetGridText(0,32,grdDetail.GetGridData(1,132));
				grdDetail.SetGridText(0,33,grdDetail.GetGridData(1,133));
				grdDetail.SetGridText(0,34,grdDetail.GetGridData(1,134));
				grdDetail.SetGridText(0,35,grdDetail.GetGridData(1,135));
				grdDetail.SetGridText(0,36,grdDetail.GetGridData(1,136));
				grdDetail.SetGridText(0,37,grdDetail.GetGridData(1,137));
				grdDetail.SetGridText(0,38,grdDetail.GetGridData(1,138));
				grdDetail.SetGridText(0,39,grdDetail.GetGridData(1,139));
				grdDetail.SetGridText(0,40,grdDetail.GetGridData(1,140));
				
				grdDetail.SetGridText(0,41,grdDetail.GetGridData(1,141));
				grdDetail.SetGridText(0,42,grdDetail.GetGridData(1,142));
				grdDetail.SetGridText(0,43,grdDetail.GetGridData(1,143));
				grdDetail.SetGridText(0,44,grdDetail.GetGridData(1,144));
				grdDetail.SetGridText(0,45,grdDetail.GetGridData(1,145));
				grdDetail.SetGridText(0,46,grdDetail.GetGridData(1,146));
				grdDetail.SetGridText(0,47,grdDetail.GetGridData(1,147));
				grdDetail.SetGridText(0,48,grdDetail.GetGridData(1,148));
				grdDetail.SetGridText(0,49,grdDetail.GetGridData(1,149));
				grdDetail.SetGridText(0,50,grdDetail.GetGridData(1,150));
				
				grdDetail.SetGridText(0,51,grdDetail.GetGridData(1,151));
				grdDetail.SetGridText(0,52,grdDetail.GetGridData(1,152));
				grdDetail.SetGridText(0,53,grdDetail.GetGridData(1,153));
				grdDetail.SetGridText(0,54,grdDetail.GetGridData(1,154));
				grdDetail.SetGridText(0,55,grdDetail.GetGridData(1,155));
				grdDetail.SetGridText(0,56,grdDetail.GetGridData(1,156));
				grdDetail.SetGridText(0,57,grdDetail.GetGridData(1,157));
				grdDetail.SetGridText(0,58,grdDetail.GetGridData(1,158));
				grdDetail.SetGridText(0,59,grdDetail.GetGridData(1,159));
				grdDetail.SetGridText(0,60,grdDetail.GetGridData(1,160));
				
				grdDetail.SetGridText(0,61,grdDetail.GetGridData(1,161));
				grdDetail.SetGridText(0,62,grdDetail.GetGridData(1,162));
				grdDetail.SetGridText(0,63,grdDetail.GetGridData(1,163));
				grdDetail.SetGridText(0,64,grdDetail.GetGridData(1,164));
				grdDetail.SetGridText(0,65,grdDetail.GetGridData(1,165));
				grdDetail.SetGridText(0,66,grdDetail.GetGridData(1,166));
				grdDetail.SetGridText(0,67,grdDetail.GetGridData(1,167));
				grdDetail.SetGridText(0,68,grdDetail.GetGridData(1,168));
				grdDetail.SetGridText(0,69,grdDetail.GetGridData(1,169));
				grdDetail.SetGridText(0,70,grdDetail.GetGridData(1,170));
				
				grdDetail.SetGridText(0,71,grdDetail.GetGridData(1,171));
				grdDetail.SetGridText(0,72,grdDetail.GetGridData(1,172));
				grdDetail.SetGridText(0,73,grdDetail.GetGridData(1,173));
				grdDetail.SetGridText(0,74,grdDetail.GetGridData(1,174));
				grdDetail.SetGridText(0,75,grdDetail.GetGridData(1,175));
				grdDetail.SetGridText(0,76,grdDetail.GetGridData(1,176));
				grdDetail.SetGridText(0,77,grdDetail.GetGridData(1,177));
				grdDetail.SetGridText(0,78,grdDetail.GetGridData(1,178));
				grdDetail.SetGridText(0,79,grdDetail.GetGridData(1,179));
				grdDetail.SetGridText(0,80,grdDetail.GetGridData(1,180));
				
				grdDetail.SetGridText(0,81,grdDetail.GetGridData(1,181));
				grdDetail.SetGridText(0,82,grdDetail.GetGridData(1,182));
				grdDetail.SetGridText(0,83,grdDetail.GetGridData(1,183));
				grdDetail.SetGridText(0,84,grdDetail.GetGridData(1,184));
				grdDetail.SetGridText(0,85,grdDetail.GetGridData(1,185));
				grdDetail.SetGridText(0,86,grdDetail.GetGridData(1,186));
				grdDetail.SetGridText(0,87,grdDetail.GetGridData(1,187));
				grdDetail.SetGridText(0,88,grdDetail.GetGridData(1,188));
				grdDetail.SetGridText(0,89,grdDetail.GetGridData(1,189));
				grdDetail.SetGridText(0,90,grdDetail.GetGridData(1,190));
				
				grdDetail.SetGridText(0,91,grdDetail.GetGridData(1,191));
				grdDetail.SetGridText(0,92,grdDetail.GetGridData(1,192));
				grdDetail.SetGridText(0,93,grdDetail.GetGridData(1,193));
				grdDetail.SetGridText(0,94,grdDetail.GetGridData(1,194));
				grdDetail.SetGridText(0,95,grdDetail.GetGridData(1,195));
				grdDetail.SetGridText(0,96,grdDetail.GetGridData(1,196));
				grdDetail.SetGridText(0,97,grdDetail.GetGridData(1,197));
				grdDetail.SetGridText(0,98,grdDetail.GetGridData(1,198));
				grdDetail.SetGridText(0,99,grdDetail.GetGridData(1,199));
				grdDetail.SetGridText(0,100,grdDetail.GetGridData(1,200));
				
				grdDetail.SetGridText(0,101,grdDetail.GetGridData(1,201));
				grdDetail.SetGridText(0,102,grdDetail.GetGridData(1,202));
				grdDetail.SetGridText(0,103,grdDetail.GetGridData(1,203));
				grdDetail.SetGridText(0,104,grdDetail.GetGridData(1,204));
				grdDetail.SetGridText(0,105,grdDetail.GetGridData(1,205));
				grdDetail.SetGridText(0,106,grdDetail.GetGridData(1,206));
				grdDetail.SetGridText(0,107,grdDetail.GetGridData(1,207));
				grdDetail.SetGridText(0,108,grdDetail.GetGridData(1,208));
				grdDetail.SetGridText(0,109,grdDetail.GetGridData(1,209));
				grdDetail.SetGridText(0,110,grdDetail.GetGridData(1,210));
				//var _Header;
				/*for(i=0;i<ctrl.Cols;i++)
				{
					if(i>60 && i<=110)
					{
						_Header = grdDetail.GetGridData(1,i);
					}
					if(i>10 && i<61)
					{
						grdDetail.SetGridText(0,i,_Header);
					}
				}
				var _Header;
				for(i=61;i<=110;i++)
				{
					_Header = grdDetail.GetGridData(1,i);
				}
				_Header = grdDetail.GetGridData(1,i);
				for(j=10;j<61;j++)
				{
					grdDetail.SetGridText(0,j,_Header);
				}*/
				for(i=0;i<ctrl.Cols;i++)
				{
					if(grdDetail.GetGridData(1,i)=='')
					{
						ctrl.ColWidth(i)=0;
					}
					if(i>110 && i<=210)
					{
						ctrl.ColWidth(i)=0;
					}
					if(grdDetail.GetGridData(0,i)=='')
					{
						ctrl.ColWidth(i)=0;
					}
				}
				OnChangeColor();
			}
       } 
}

function OnChangeColor()
{
    var ctrl = grdDetail.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grdDetail.GetGridData(i,6)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, 0, i, 100, true);
        }
        else if (grdDetail.GetGridData(i,6)== "I")
        {
	        grdDetail.SetCellBold(i, 1, i, 100, false);
	        ctrl.Cell(14, i, 1, i, 18) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, 0, i, 200, false);
	    }
	    grdDetail.SetCellBgColor(i, 0, i, 200, Number(grdDetail.GetGridData(i, 7)));
	}
}
function OnFormat()
{
            var fg = grdDetail.GetGridControl();
            fg.ColFormat(2) = "###,###.##R"; 
            fg.ColFormat(3) = "###,###.##R"; 
            fg.ColFormat(4) = "###,###.##R"; 
            fg.ColFormat(5) = "###,###.##R"; 
            fg.ColFormat(6) = "###,###.##R"; 
            fg.ColFormat(7) = "###,###.##R"; 
            fg.ColFormat(8) = "###,###.##R"; 
            fg.ColFormat(9) = "###,###.##R";        
}
</script>
  <body>
     <!------------------------------------------------------------------------>
  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_pl" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_600800150_op_cost">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
					<input bind="txtTO_DATE"/>
					<input bind="lstStatus"/>
                    <input bind="txtACCD"/> 
					<input bind="lstPS"/> 
					<input bind="lstFS"/> 
					<input bind="lstReport"/> 
                </input>
                <output bind="grdDetail"/>
        </dso>
        </xml>
    </gw:data>
            <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="width:100;height:10%">
                   <td>
                        <fieldset >
                             <table width="100%" border="0" cellpadding="1" cellspacing="0" >
							   <tr >
									<td align="right" width="8%" >Company&nbsp;</td>
									<td  colspan="3" width=""><gw:list id="lstCompany" styles="width:100%" /></td>
									<td align="right" width="20%"><a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">Account Code</a></td>
									<td width="72%" colspan='5'>
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td  width="17%"><gw:textbox id="txtACCD" onenterkey="OnSearch()"  text="" styles="width:100%" /><gw:textbox id="txtACPK"  text="" styles="width:100%;display:none" /></td>
												<td width="38%" ><gw:textbox id="txtACNM" onenterkey="OnSearch()" text="" styles="width:100%" /></td>
												<td><gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="txtACCD.text='';txtACNM.text='';txtACPK.text='';" /></td>
												
												<td width="10%" align='right'><a title="Financial Statement" style='color:black' >F/S&nbsp;</a></td>
												<td width="35%"><gw:list id="lstFS" styles="width:100%" onchange="OnSearch()"/></td>
											</tr>
										</table>
									</td>
									<td align="right"  ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
									<td align="right"  ><gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" /></td>   
									     
								</tr>
								<tr>
									<td align="right" >Month&nbsp;</td> 
									<td><gw:datebox id="txtFROM_DATE" styles='width:100%'  lang="<%=Session("Lang")%>" type="month" /></td>  
									<td>~</td>
									<td > <gw:datebox id="txtTO_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>" type="month" /></td>  
									<td align="right">Status</td>
									<td  width="12%" ><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()"/></td>
									<td align="right" width="5%"><a title="Posting/Summary" style='color:black' >P/S</a></td> 
									<td  width="20%" ><gw:list id="lstPS" styles="width:100%" onchange="OnSearch()"/></td>
                                    <td align="right"  width="10%">Report&nbsp;</td>
									<td width="25%" colspan=''><gw:list id="lstReport" styles="width:100%" onchange="OnSearch()" /></td> 
									</td> 
							 	</tr>
							</table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:70%">
                    <td >
                    <!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
                                <gw:grid id='grdDetail'
                                    header='Account code|Account name|Account name (local)|Account name (foreign)|_Code|Header|_Font Style|_Color|_Group|_Count Total PL|Total|Num_1|Num_2|Num_3|Num_4|Num_5|Num_6|Num_7|Num_8|Num_9|Num_10|Num_11|Num_12|Num_13|Num_14|Num_15|Num_16|Num_17|Num_18|Num_19|Num_20|Num_21|Num_22|Num_23|Num_24|Num_25|Num_26|Num_27|Num_28|Num_29|Num_30|Num_31|Num_32|Num_33|Num_34|Num_35|Num_36|Num_37|Num_38|Num_39|Num_40|Num_41|Num_42|Num_43|Num_44|Num_45|Num_46|Num_47|Num_48|Num_49|Num_50|Num_51|Num_52|Num_53|Num_54|Num_55|Num_56|Num_57|Num_58|Num_59|Num_60|Num_61|Num_62|Num_63|Num_64|Num_65|Num_66|Num_67|Num_68|Num_69|Num_70|Num_71|Num_72|Num_73|Num_74|Num_75|Num_76|Num_77|Num_78|Num_79|Num_80|Num_81|Num_82|Num_83|Num_84|Num_85|Num_86|Num_87|Num_88|Num_89|Num_90|Num_91|Num_92|Num_93|Num_94|Num_95|Num_96|Num_97|Num_98|Num_99|Num_100|Name_1|Name_2|Name_3|Name_4|Name_5|Name_6|Name_7|Name_8|Name_9|Name_10|Name_11|Name_12|Name_13|Name_14|Name_15|Name_16|Name_17|Name_18|Name_19|Name_20|Name_21|Name_22|Name_23|Name_24|Name_25|Name_26|Name_27|Name_28|Name_29|Name_30|Name_31|Name_32|Name_33|Name_34|Name_35|Name_36|Name_37|Name_38|Name_39|Name_40|Name_41|Name_42|Name_43|Name_44|Name_45|Name_46|Name_47|Name_48|Name_49|Name_50|Name_51|Name_52|Name_53|Name_54|Name_55|Name_56|Name_57|Name_58|Name_59|Name_60|Name_61|Name_62|Name_63|Name_64|Name_65|Name_66|Name_67|Name_68|Name_69|Name_70|Name_71|Name_72|Name_73|Name_74|Name_75|Name_76|Name_77|Name_78|Name_79|Name_80|Name_81|Name_82|Name_83|Name_84|Name_85|Name_86|Name_87|Name_88|Name_89|Name_90|Name_91|Name_92|Name_93|Name_94|Name_95|Name_96|Name_97|Name_98|Name_99|Name_100'
                                    format='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    defaults='||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
                                   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='1300|2200|2200|2200|1500|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    sorting='T'
                                    styles='width:100%; height:100%'
									autosize="T"
									oncellclick=""
                                />
                            </td>
                </tr>
                 
            </table>
          
<gw:textbox id="txtUser"  text="" styles="width:100%;display:none" />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
  </body>
</html>