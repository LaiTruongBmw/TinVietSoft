<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
      System.Translate(document);
      BindingDataList();
	  Merge_Grid();
	 // dso_masterinfo.Call();
}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
       Grid_Contract.GetGridControl().WordWrap = true;
      Grid_Contract.GetGridControl().RowHeight(0) = 450 ;
	
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
									Grid_SummaryStatus.ClearData();
									Grid_Contract.ClearData();
									Grid_Co.ClearData();									
                                    dso_masterinfo.Call(); 
                            } 
                break;
               
        } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
	if(idTab.GetCurrentPageNo()==0)//tab1
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab1.Call("SELECT");
	}
	if(idTab.GetCurrentPageNo()==1)//tab2
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab2.Call("SELECT");
	}
	if(idTab.GetCurrentPageNo()==2)//tab3
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab3.Call("SELECT");
	}
}

function Merge_Grid()
{
	if (Grid_SummaryStatus.rows < 2)
		{
			
			Grid_SummaryStatus.AddRow();
		}
	var fg=Grid_SummaryStatus.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
 
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Srvc Type"
		
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Order W. Div."
	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Order W. Div. Name"
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Order Exp. Mth."
		
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Order Exp. (Cont.) Amt"
		
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Cont. Co."
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 6, 0, 9) = "Future Order Plan"  
		fg.Cell(0, 1, 6, 1 ) 	= lblNo1.text;
		fg.Cell(0, 1, 7, 1) 	=  lblNo2.text;
		fg.Cell(0, 1, 8, 1) 	=  lblNo3.text;
		fg.Cell(0, 1, 9, 1) 	= "Afterwards"
//===============================================		
		if (Grid_Contract.rows < 2)
		{
			
			Grid_Contract.AddRow();
		}
	var fg=Grid_Contract.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
 
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Code"
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Order W. Div. Name"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Prog. Status"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Details S/No."
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "SubCont. Name"
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Currency"
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "BCWS(Adj.)"
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Cont. Adw. Amt Orig. Cont. Amt"
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Change Cont. Amt"
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "Settle. (Y/N)"
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Reg. W. Div."
		fg.MergeCol(11) = true
		fg.Cell(0, 0, 11, 1, 11) = "Cont. Type"
		fg.MergeCol(12) = true
		fg.Cell(0, 0, 12, 1, 12) = "Start Date"
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Exp. Date"
}
function OnchangeTab()
{
	if(idTab.GetCurrentPageNo()==0)//tab1
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab1.Call("SELECT");
	}
	if(idTab.GetCurrentPageNo()==1)//tab2
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab2.Call("SELECT");
	}
	if(idTab.GetCurrentPageNo()==2)//tab3
	{
		if(txtProject_Pk.text=="")
		{
			alert("Please,choose project to search!!!");
			return;
		}
		dso_tab3.Call("SELECT");
	}
}
function OnPrint()
{
	if(idTab.GetCurrentPageNo()==0)
	{
		if(Grid_SummaryStatus.rows > 2)                                                             
		 {
			 var url = '/reports/61/10/rpt_61100020_summary_status.aspx?p_tecps_projectsumm_pk='+ txtProject_Pk.text+'&p_no1='+txtNo1.text +'&p_bcws='+txtBCWS.text+'&p_no2='+txtNo2.text+'&p_cont_amt='+txtCont_Amt.text+'&p_may_1='+txt3Mth.text+'&p_june1='+txt4Mth.text+'&p_july1='+txt5Mth.text+'&p_afterwards1='+txtAfterwards.text+'&p_may_2='+txt3Mth_Amt.text+'&p_june2='+txt4Mth_Amt.text+'&p_july2='+txt5Mth_Amt.text+'&p_afterwards2='+txtAfterwards_Amt.text+'&p_month1='+lblNo1.text+'&p_month2='+lblNo2.text+'&p_month3='+lblNo3.text;
			 
				 System.OpenTargetPage( System.RootURL+url , "newform" );  ;
				 System.OpenTargetPage( System.RootURL+url , "newform" );  
		}
	}
	if(idTab.GetCurrentPageNo()==1)
	{
		if(Grid_Contract.rows > 1)                                                 
		 {
			 var url = '/reports/61/10/rpt_61100020_contract_status.aspx?p_tecps_projectsumm_pk='+ txtProject_Pk.text;
				 System.OpenTargetPage( System.RootURL+url , "newform" );
		}
	}
	if(idTab.GetCurrentPageNo()==2) 
	{
		if(Grid_Co.rows > 1)                                                 
		 {
			  var url = '/reports/61/10/rpt_61100020_subcontractor_info.aspx?p_tecps_projectsumm_pk='+ txtProject_Pk.text;
				 System.OpenTargetPage( System.RootURL+url , "newform" );
		}
	}
}
</script>

<body>
    <gw:data id="dso_masterinfo" onreceive="Merge_Grid()">
  <xml>
    <dso type="process"  procedure="pm_sel_61100020_master"  >
      <input>
		  <input bind="txtProject_Pk"/>
     </input>
	 <output>
          <output bind="lblNo1" /> 
          <output bind="lblNo2" /> 
          <output bind="lblNo3" />   
          <output bind="txtNo1" /> 
	      <output bind="txtBCWS" /> 
          <output bind="txtNo2" /> 
	      <output bind="txtCont_Amt" /> 
 	      <output bind="txt3Mth" /> 
	      <output bind="txt4Mth" /> 
	      <output bind="txt5Mth" /> 
	      <output bind="txtAfterwards" /> 
	      <output bind="txt3Mth_Amt" /> 
	      <output bind="txt4Mth_Amt" /> 
	      <output bind="txt5Mth_Amt" /> 
	      <output bind="txtAfterwards_Amt" />    
	</output>
    </dso>
  </xml>
</gw:data>
    <!-----------------------tab1-->
    <gw:data id="dso_tab1" onreceive="Merge_Grid()">    
	<xml> 
		<dso type="grid"  function="pm_sel_61100020_tab1" > 
			<input bind="Grid_SummaryStatus">
				<input bind="txtProject_Pk" />
			</input> 
			<output bind="Grid_SummaryStatus" /> 
		</dso> 
	</xml> 
</gw:data>
    <!-----------------------tab2-->
    <gw:data id="dso_tab2" onreceive="">    
	<xml> 
		<dso type="grid"  function="pm_sel_61100020_tab2" >  
			<input bind="Grid_Contract">
				<input bind="txtProject_Pk" />
			</input> 
			<output bind="Grid_Contract" /> 
		</dso> 
	</xml> 
</gw:data>
    <!-----------------------tab3-->
    <gw:data id="dso_tab3" onreceive="">    
	<xml> 
		<dso type="grid"  function="pm_sel_61100020_tab3" > 
			<input bind="Grid_Co">
				<input bind="txtProject_Pk" />
			</input> 
			<output bind="Grid_Co" /> 
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="10%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                    Project&nbsp;</a></td>
                            <td width="50%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="31%">
                            </td>
                            <td>
                                <gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
                            </td>
                            <td style="width: 3%" align="right">
                                <gw:button img="excel" alt="Print" text="Print" id="btnReport1" onclick="OnPrint()" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:tab id="idTab" onclick="OnchangeTab()">
								<table style="width: 100%; height:100%;overflow:scroll" name="Summary Status" id="Tab1"  cellpadding="0" cellspacing="0">
                                		<tr height="10%" valign="top">
                                        			<td>
                                                    			<table border="1" style="width:100%;height:" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
																		<tr height="20" style="background:#C5EFF1">
                                                                        			<td align="center" width="20%" colspan="2">Outsource Order Plan</td>
                                                                                    <td align="center" width="20%" colspan="2">Outsrc. Order A. Rslt</td>
                                                                                    <td align="center" width="60%" colspan="4">Future Order Plan</td>
                                                                        </tr>
                                                                        <tr height="20" style="background:#C5EFF1">
                                                                        			<td align="center" width="5%" >No.</td>
                                                                                    <td align="center" width="15%" >BCWS</td>
                                                                                    <td align="center" width="5%" >No.</td>
                                                                                    <td align="center" width="15%" >Cont. Amt</td>
                                                                                    <td align="center" width="15%" ><gw:label id="lblNo1"  styles='width:100%;text-align:center' />  </td>
                                                                                    <td align="center" width="15%" ><gw:label id="lblNo2"  styles='width:100%;text-align:center' /></td>
                                                                                    <td align="center" width="15%" ><gw:label id="lblNo3"  styles='width:100%;text-align:center' /></td>
                                                                                    <td align="center" width="15%" >Afterwards</td>
                                                                        </tr>
                                                                        <tr  height="20">
                                                                        			<td  width="5%"  rowspan="2"><gw:textbox id="txtNo1"  styles='width:100%;text-align:right' /></td>
                                                                                    <td width="15%"  rowspan="2"><gw:textbox id="txtBCWS"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                                                                    <td  width="5%"  rowspan="2"><gw:textbox id="txtNo2"  styles='width:100%;text-align:right' /></td>
                                                                                    <td  width="15%"  rowspan="2"><gw:textbox id="txtCont_Amt" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                                                                    <td width="60%" colspan="4">
                                                                                    		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                            		<tr>
                                                                                                    		<td  width="25%"  ><gw:textbox id="txt3Mth"  styles='width:100%;text-align:right' /></td>
                                                                                                            <td  width="25%" ><gw:textbox id="txt4Mth"  styles='width:100%;text-align:right' /></td>
                                                                                                            <td width="25%" ><gw:textbox id="txt5Mth"  styles='width:100%;text-align:right' /></td>
                                                                                                            <td  width="25%" ><gw:textbox id="txtAfterwards"  styles='width:100%;text-align:right' /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                    		<td  width="25%" ><gw:textbox id="txt3Mth_Amt" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                                                                                            <td  width="25%" ><gw:textbox id="txt4Mth_Amt"  type="number" format="###,###.##R" styles='width:100%' /></td>
                                                                                                            <td width="25%" ><gw:textbox id="txt5Mth_Amt" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                                                                                            <td  width="25%" ><gw:textbox id="txtAfterwards_Amt" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                                                                                    </tr>
                                                                                            </table>
                                                                                    </td>
                                                                        </tr>
                                                                </table>
                                                    </td>
                                        </tr>
                                        <tr style="height:90%;width:100%" valign="top">
                                        <!--header="0.Srvc Type|1.Order W. Div.|2.Order W. Div. Name|3.Order Exp. Mth.|4.Order Exp. (Cont.) Amt |5.Cont. Co.|6. 3Mth|7. 4Mth|8. 5Mth|9.Afterwards"-->
                                        			<td>
                                                    				<gw:grid id="Grid_SummaryStatus" 
                                                                    header="Srvc Type|Order W. Div.|Order W. Div. Name|Order Exp. Mth.|Order Exp. (Cont.) Amt |Cont. Co.|3Mth|4Mth|5Mth|Afterwards"
                                                                    format="0|0|0|0|1|0|1|1|1|1" 
                                                                    aligns  ="0|0|0|0|3|0|3|3|3|3"
                                                                    defaults="|||||||||" 
                                                                    editcol="0|0|0|0|0|0|0|0|0|0" 
                                                                    widths="1500|1500|2000|1500|2000|2000|2000|2000|2000|2000"
                                                                    styles="width:100%; height:100%" 
                                                                    sorting="T" 
                                                                     />
                                                    </td>
                                        </tr>
                              </table>
                              <table style="width: 100%; height:100%;overflow:scroll" name="Contract Status" id="Tab2"  cellpadding="0" cellspacing="0">
                                		<tr height="100%">
                                        <!--header="0.Code|1.Order W. Div. Name|2.Prog. Status|3.Details S/No.|4.SubCont. Name|5.Currency|6.BCWS(Adj.)|7.Cont. Adw. Amt Orig. Cont. Amt|8.Change Cont. Amt|9.Settle. (Y/N)|10.Reg. W. Div.|11.Cont. Type|12.Start Date|13.Exp. Date"-->
                                        			<td>
                                                    			<gw:grid id="Grid_Contract" 
                                                                    header="Code|Order W. Div. Name|Prog. Status|Details S/No.|SubCont. Name|Currency|BCWS(Adj.)|Cont. Adw. Amt Orig. Cont. Amt|Change Cont. Amt|Settle. (Y/N)|Reg. W. Div.|Cont. Type|Start Date|Exp. Date"
                                                                    format="0|0|0|0|0|0|1|1|1|0|0|0|4|4" 
                                                                    aligns  ="1|0|0|0|0|0|3|3|3|1|0|0|0|0"
                                                                    defaults="|||||||||||||" 
                                                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                                                    widths="1000|3000|1200|1200|2000|1000|2000|1500|2000|1000|2000|1500|1000|1000"
                                                                    styles="width:100%; height:100%" 
                                                                    sorting="T" 
                                                                     />
                                                    </td>
                                       </tr>
                            </table>
                            <table style="width: 100%; height:100%;overflow:scroll" name="Subcontractor Info." id="Tab3"  cellpadding="0" cellspacing="0"  >
                                		<tr height="100%">
                                        <!--header="0.Code|1.Order W. Div. Name|2.Prog. Status|3.Details S/No.|4.SubCont. Name|5.Currency|6.BCWS(Adj.)|7.Cont. Adw. Amt Orig. Cont. Amt|8.Change Cont. Amt|9.Settle. (Y/N)|10.Reg. W. Div.|11.Cont. Type|12.Start Date|13.Exp. Date"-->
                                        			<td>
                                                    			<gw:grid id="Grid_Co" 
                                                                    header="Bus. No.|SubCont. Name|Reg. W. Div.|CEO's Name|Tel. No.|Fax No.|Headoffice Address"
                                                                    format="0|0|0|0|0|0|0" 
                                                                    aligns  ="1|0|0|0|0|0|0"
                                                                    defaults="||||||" 
                                                                    editcol="0|0|0|0|0|0|0" 
                                                                    widths="1000|3000|1500|2000|1500|1500|2000"
                                                                    styles="width:100%; height:100%" 
                                                                    sorting="T" 
                                                                     />
                                                    </td>
                                       </tr>
                            </table>
                    </gw:tab>
            </td>
        </tr>
    </table>
</body>
</html>
