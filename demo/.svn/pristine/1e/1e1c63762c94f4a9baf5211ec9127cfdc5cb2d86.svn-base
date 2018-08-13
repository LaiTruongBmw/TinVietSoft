<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Slip Inquiry C.F</title>
</head>
<%CtlLib.SetUser("acnt")%>
<script type="text/javascript" language="javascript">
var report_type = 0;//AS:10, NKC:20
var form_type = 20; //Trans+ book 10; book :20
var tab_index = 0;
function BodyInit()
{
    BindingDataList();
    txtAc_level.text= "<%=session("ACNT_LEVEL")%>";
     txtSesion_company.text = "<%=session("company_pk")%>";
     var _company;
     if(txtAc_level.text=='6')
     {
        _company = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM comm.tco_company where del_if=0")%>"; 
        lstCompany.SetDataText(_company);
        //cboOrganization.value= 'ALL';
     }
     else if(txtAc_level.text=='3')
     {
        datCompany.Call();
     }
}

function BindingDataList()
{
     System.Translate(document);
     var data ;
     var arr;
     data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
     lstStatus.SetDataText(data+ "|9|Select ALL");
     lstStatus.SetDataText("9");
     data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.sf_a_get_company('') FROM DUAL")%>";   
     lstCompany.SetDataText(data);
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
     lstVCType.SetDataText(data+ "|ALL|Select ALL");
     lstVCType.SetDataText("ALL");
     var ls_report = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('GFQC0016') FROM DUAL")%>";
	 lstReport.SetDataText(ls_report);
	 data= "DATA|1|Trans. Date|2|Created Date|3|Modified Date";  
	 lstdatetype.SetDataText(data);
     
}
//------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Trans':
            var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.GetData();
            aValue = System.OpenModal(path ,850 , 500 ,  'resizable:yes;status:yes');
            if ( aValue != null )
	        {
		        var tmp = aValue[0];
		        if (tmp[1] != null)
		        {
		            txtTransPK.text         = tmp[0];
		            txtTransID.text = tmp[1];
		            txtTransNM.text = tmp[2];
		           
		        }
		    }    
        break;
                                                              
    }	       
}

function onSearch()
{
    dat_gfhg00080_1.Call("SELECT");
}

function OnSelectAll()
{	
    var ctrl=grdDetail.GetGridControl();
    if( chkSelectAll.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
           grdDetail.SetGridText(i,0,"-1");
    }
	else
	{
        for(var i=1;i<ctrl.rows;i++)
            grdDetail.SetGridText(i,0,"0");
    }        

}

function rownum()
{
    var ctrl=grdDetail.GetGridControl();
    for(var i=1;i<ctrl.rows;i++) grdDetail.SetGridText(i,1,i);
       
}

function onReport()
{
    var url='';
    if(lstReport.value=='370')
    {
       
            url = '/standard/reports/gf/hg/rpt_gfhg00080_1.aspx?p_Company='+lstCompany.GetData()+'&p_from='+db_from.GetData()+'&p_to='+db_to.GetData();
            url= url+'&p_Status='+lstStatus.GetData()+'&p_VCNo='+txtVCNo.GetData()+'&p_Seq='+txtSeq.GetData()+'&p_VCType='+lstVCType.GetData();
            url=url+'&p_TransPK='+txtTransPK.GetData()+ '&p_Desc='+txtDesc.GetData()+ '&p_amount='+txtAmount.GetData();
            url=url+'&p_fromtext='+db_from.text+ '&p_tottext='+db_to.text+'&p_statustext=' + escape(lstStatus.GetText()) + '&p_datetype=' + lstdatetype.GetData();
     }
     else if(lstReport.value=='360')
      {      
            var ctrl=grdDetail.GetGridControl();
            var tmp='';
            var l_seq='';
            for(var i=1;i<ctrl.rows;i++){
             if(grdDetail.GetGridData(i,0)=='-1')
             {
                tmp= grdDetail.GetGridData(i,2);
                l_seq = l_seq + ',' + tmp;
                   
             }  
            } 
            if(l_seq.length > 0)
            {
                l_seq = l_seq.substr(1);
            }
            if(l_seq==''){
                alert('You should select voucher(s) to print first.');
                return false;
            }    
            txtseqp.text= l_seq;
            url = '/standard/reports/gf/hg/rpt_gfhg00080_2.aspx?seq=' + l_seq;
      } 
       else if(lstReport.value=='350')
       {
                     var ctrl=grdDetail.GetGridControl();
            var tmp='';
            var l_seq='';
            for(var i=1;i<ctrl.rows;i++)
            {
                     if(grdDetail.GetGridData(i,0)=='-1')
                     {
                        tmp= grdDetail.GetGridData(i,2);
                        l_seq = l_seq + ',' + tmp;
                        
                     }  
            } 
            if(l_seq.length > 0)
            {
                l_seq = l_seq.substr(1);
                
            }
            if(l_seq=='')
            {
                alert('You should select voucher(s) to print first.');
                return false;
            }    
            txtseqp.text= l_seq;
                   //alert(l_seq); 
                     //    url =  "/system/ReportEngine.aspx?export_pdf=Y&file=gf/hg/rpt_gfhg00080_pkt.rpt&procedure=acnt.rpt_sel_gfhg00010_pkt2|rpt_sel_gfhg00010_pkt3&parameter="+l_seq+"|"+l_seq;   
                    //     url =  "/system/ReportEngine.aspx?export_pdf=Y&file=gf/hg/Copy of rpt_gfhg00010_pkt.rpt&procedure=acnt.TEST_GRP&parameter="+l_seq;   
                     var url = '/standard/reports/gf/hg/gfhg00080_pkt.aspx?seq='+l_seq + '&comp=' +lstCompany.value ;
                       //  alert(url);
      
    }    
    System.OpenTargetPage( System.RootURL+url , 'newform' ); 
}

function OnPopupSlipEntry()
{
    var ctrl 	= grdDetail.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = grdDetail.GetGridData(ctrl.row, 2);
			var status  = grdDetail.GetGridData(ctrl.row, 10);
			var ls_arr = "";
		
			var fpath   = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			this.name = "gfhg00080";
			var object = System.OpenModal(fpath, wWidth, wHeight, features,window);
			  //var object = System.OpenModal( fpath ,800 , 600 , 'resizable:yes;status:yes');
			// 'resizable:yes;status:yes'
	    }
    }
}
//-----------------------------------------------------------------
function GetRowPK(row_index){
    if((row_index < grdDetail.rows) && (row_index > 0)){
        return grdDetail.GetGridData(row_index, 2);
    }
    return -1;
}
//-----------------------------------------------------------------

</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------->
<gw:data id="dat_gfhg00080_1"  onreceive="rownum()" > 
    <xml> 
        <dso id="1" type="grid"  function="acnt.sp_sel_gfhg00080_1"  > 
            <input bind="grdDetail">                    
                <input bind="lstCompany" /> 
                <input bind="db_from" /> 
                <input bind="db_to" />
                <input bind="lstStatus" />
                <input bind="txtVCNo" />
                <input bind="txtSeq" />
                <input bind="lstVCType" />
                <input bind="txtTransPK" />
                <input bind="txtDesc" />
                <input bind="txtAmount" />
				<input bind="lstdatetype" />
             </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>
<!---------------------------------------------------------->
<gw:data id="datCompany" onreceive=""  > 
        <xml>
            <dso  type="list" procedure="acnt.sp_lst_get_company"  > 
                <input>
                    <input bind="txtSesion_company" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<fieldset style="padding: 2;" >
<table border="0" cellpadding=0 cellspacing=0 width="100%" id="table1">
	<tr>
		<td width="12%" colspan="2">Company</td>
		<td width="30%" colspan="3"><gw:list id="lstCompany" style="width:100%" onchange="onSearch()"  value="<%=Session("COMPANY_PK")%>"  /> </td>
		<td width="2%">&nbsp;</td>
		<td width="10%" align="right">Description</td>
		<td width="16%" colspan=3><gw:textbox id="txtDesc" style="width:100%" onenterkey="onSearch()" onchange="onSearch()"   /></td>
		<td width="10%" align=right>Status</td>
		<td width="20%"><gw:list id="lstStatus" style="width:100%" onchange="onSearch()"    /></td>
		<td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Print" onclick="onSearch()" /></td>
		<td ><gw:imgbtn id="btnPrint" img="excel" alt="Print as form" text="Print" onclick="onReport()" /></td>
		
	</tr>
	<tr>
		<td width="12%" colspan="2"><a title="Click here to select Transaction type" onclick="OnPopUp('Trans')" href="#tips"
                                     style="text-decoration: none; color=#0000ff"><b>Trans. type</b></a></td>
		<td width="5%" ><gw:textbox id="txtTransID" style="width:99%" onenterkey="onSearch()"   /><gw:textbox id="txtTransPK" style="width:99%;display:none"   /></td>
		<td width="25%" colspan=2><gw:textbox id="txtTransNM" readonly='true' style="width:100%"   /></td>
		<td width="2%">&nbsp;</td>
		<td width="10%" align="right">Voucher No</td>
		<td width="20%" colspan="3">
		                <table cellpadding="0" cellspacing="0" style="width:100%">
		                                <tr>
		                                                <td width="60%"><gw:textbox id="txtVCNo" onenterkey="onSearch()" style="width:100%"   /></td>
		                                                <td width="10%" align=right>Seq</td>
		                                                <td width="35%"><gw:textbox id="txtSeq" onenterkey="onSearch()" style="width:100%"   /></td>
		                                </tr>
		                </table>
		</td>
		<td width="6%" align=right>Amount</td>
		<td width="20%" colspan="3"><gw:textbox id="txtAmount" onenterkey="onSearch()" style="width:100%"   /></td>
		
		
	</tr>
	<tr>
		<td width="3%"><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll()" /></td>
		<td width="9%">Select All</td>
		<td width="10%" >Voucher type</td>
		<td width="25%" colspan=2><gw:list id="lstVCType" style="width:100%"  onchange="onSearch()"  /></td>
		<td width="2%">&nbsp;</td>
		<td width="10%" align="right"><gw:list id="lstdatetype" style="width:100%"   /></td>
		<td width="14%" align=left><gw:datebox id="db_from" lang=1 style="width:100%" onchange="onSearch()" lang="<%=Session("Lang")%>"  /></td>
		<td width="2%" align=center>~</td>
		<td width="14%" align=right><gw:datebox id="db_to" lang=1 style="width:100%" onchange="onSearch()" lang="<%=Session("Lang")%>"  /></td>
		<td width="5%" align="right">Reports</td>
		<td width="15%" colspan="3"><gw:list id="lstReport" style="width:100%"   /></td>
		
	</tr>
</table>
</fieldset>
<table border=0 cellpadding=0 cellspacing=0 style="width:100%;height:100%">      
        <tr style="height:100%" valign=top>
           <!--0Row|Select|2.Seq|3.Voucher No|4.Trans. date|5.Approval date|6.Amount|7.Description|8.Local description|9.Status|10._statusid-->
           <td>
                <gw:grid id='grdDetail' 
                    header='Select|Row|Seq|Voucher No|Trans. date|Approval date|Amount|Description|Local description|Status|_statusid|Enclose|Prps By|Created date|Modified date|Modified by|Sign date|Sign by|Cancel date|Cancel by|Cancel cause'
                    format='3|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='1|3|1|0|1|1|3|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='800|500|1000|2000|1400|1400|2000|2500|2500|1500|0|1200|800|1300|1300|1300|1300|1300|1300|1300|1300'
                    sorting='T'
                    acceptNullDate="T"                              
                    styles='width:100%; height:450'
                    oncelldblclick="OnPopupSlipEntry()"
                  />
            </td>
        </tr>
    </table>   
</body>
<gw:textbox id="txtseqp" style="width:100%;display:none"   />
<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
</html>
