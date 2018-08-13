<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Contract List</title>
</head>
<script>
function BodyInit()
{

}
function OnSearch()
{
    datGetContracList.Call("SELECT");
}
function OnSelect()
{

    var obj = new Array();
    
    if (grdContract.row > 0){
       for(var i=0;i<grdContract.cols;i++){
            obj[obj.length]=grdContract.GetGridData(grdContract.row,i);
       }
    }
	window.returnValue = obj; 
	window.close();
}
function OnGridCellDblClick(obj){
    OnSelect();
}
</script>
<body>
<gw:data id="datGetContracList"> 
    <xml> 
        <dso  type="grid" function="pm_sel_61030100_contract"> 
            <input bind="grdContract" >
                <input bind="txtContractType" />  
                <input bind="dtFrom" /> 
                <input bind="dtTo" /> 
                <input bind="txtContractNo" /> 
                <input bind="txtPartner" /> 
            </input> 
            <output bind="grdContract" /> 
        </dso> 
   </xml> 
</gw:data> 
<table width="100%" style="height:100%">
	<tr style="height:2%">
	    <td width="100%">
	     <fieldset style="width: 100%; height: 100%; padding: 2">
	        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
              <td width="15%">Contract date</td>
              <td width="10%"><gw:datebox id="dtFrom" lang="<%=session("lang") %>" /></td>
              <td width="2%">~</td>
              <td width="10%"><gw:datebox id="dtTo" lang="<%=session("lang") %>" /></td>
              <td width="10%">Contract No</td>
              <td width="15%"><gw:textbox id="txtContractNo" /></td>
              <td width="10%"><a href="#" onclick="OnGetPartner()">Partner</a></td>
              <td width="15%"><gw:textbox id="txtPartner" /></td>
              <td width="3%"></td>
              <td width="5%"><gw:imgbtn id="btnSearch" img="search" onclick="OnSearch()" /></td>
              <td width="5%"><gw:imgbtn id="btnSelect" img="select" onclick="OnSelect()" /></td>
            </table>  
         </fieldset>
       </td> 
	</tr>		   
	<tr style="height:98%"> 
	<!--0_PK|1.CONTRACT NO|2.CONTRACT DATE|3.PARTNER ID|4.PARTNER NAME|5.TOT AMT|6.SHIP TO ADDR|7.PAY TO ADDR|8_TCO_BUSPARTNER_PK
	    |9_TAX_CODE|10_SERIAL_NO|11_tac_abplcenter_pk|12_pl_cd_pl_nm|13. tac_abcenter_cd
	-->
	    <td  >
  		    <gw:grid id='grdContract'
                header='_PK|CONTRACT NO|CONTRACT DATE|PARTNER ID|PARTNER NAME|TOT AMT|SHIP TO ADDR|PAY TO ADDR|_TCO_BUSPARTNER_PK|_TAX_CODE|_SERIAL_NO|_tac_abplcenter_pk|_pl_cd_pl_nm|_tac_abcenter_cd'
                format='0|0|4|0|0|0|0|0|0|0|0|0'
                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                defaults='|||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1000|1500|1600|1500|3000|1500|2000|2000|0|0|0|0|0|0'
                sorting='T'
                styles='width:100%; height:100%'
                oncelldblclick='OnGridCellDblClick(this)'
             />
  	    </td>
    </tr>
</table>
<gw:textbox id="txtContractType" text="<%=Request.QueryString("contract_type") %>"
</body>
</html>
