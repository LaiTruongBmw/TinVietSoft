<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Beneficiary Bank List</title>
</head>
<script>
var compk = "<%=Session("company_pk")%>"; 
function BodyInit()
{
  
    txtCompanyPK.text  = compk ;
}
function OnSearch()
{
    datGetBeneBankList.Call("SELECT");
}
function OnSelect()
{

    var obj = new Array();
    
    if (grdBeneBank.row > 0){
       for(var i=0;i<grdBeneBank.cols;i++){
            obj[obj.length]=grdBeneBank.GetGridData(grdBeneBank.row,i);
       }
    }
	window.returnValue = obj; 
	window.close();
}
function OnGridCellDblClick(obj){
    OnSelect();
}
function onCustPopUp(){
    
    
    var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
	if ( object != null ){
		if (object[0] != 0){
            txtcustpk.text = object[0];//pk
            txtcustid.text = object[1];//cust id
            txtcustnm.text = object[2];//cust name
        }
    }
}
function onCustReset(){
    txtcustpk.text = "";
    txtcustid.text = "";
    txtcustnm.text = "";
}
</script>
<body>
<gw:data id="datGetBeneBankList"> 
    <xml> 
        <dso  type="grid" function="pm_sel_61060060_popup2"> 
            <input bind="grdBeneBank" >
                <input bind="txtBeneBank" />  
                <input bind="txtAccountNo" /> 
                <input bind="txtcustpk" />
                <input bind="txtCompanyPK" /> 
                <input bind="txtCcy" /> 
                 
            </input> 
            <output bind="grdBeneBank" /> 
        </dso> 
   </xml> 
</gw:data> 
<table width="100%" style="height:100%">
	<tr style="height:2%">
	    <td width="100%">
	     <fieldset style="width: 100%; height: 100%; padding: 2">
	        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
              <td width="10%" align=Right><a href="#" onClick="onCustPopUp()">Partner</a></td>
              <td width="37%"><gw:textbox id="txtcustid" styles="width:30%" /><gw:textbox id="txtcustnm" styles="width:69%"/></td>
              <td width="" align="left"><gw:imgbtn id="btnResetCust" img="reset" alt="Reset" onclick="onCustReset()" /></td>
              <td width="10%" align=Right>BeneBank</td>
              <td width="15%"><gw:textbox id="txtBeneBank"  onenterkey="OnSearch()"  /></td>
              <td width="10%" align=Right>Account No</td>
              <td width="15%"><gw:textbox id="txtAccountNo"  onenterkey="OnSearch()"  /></td>
              <td width="3%"></td>
              <td width=""><gw:imgbtn id="btnSearch" img="search" onclick="OnSearch()" /></td>
              <td width=""><gw:imgbtn id="btnSelect" img="select" onclick="OnSelect()" /></td>
            </table>  
         </fieldset>
       </td> 
	</tr>		   
	<tr style="height:98%"> 
	
	    <td  >
  		    <gw:grid id='grdBeneBank'
                header='Beneficiary Name|Account No|_table pk|_PARTNER ID|Partner Name|Currency|Branch'
                format='0|0|0|0|0|0|0'
                aligns='0|0|0|0|0|0|0'
                defaults='||||||'
                editcol='0|0|0|0|0|0|0'
                widths='2000|2000|1600|1500|3000|1500|1000'
                sorting='T'
                styles='width:100%; height:100%'
                oncelldblclick='OnGridCellDblClick(this)'
             />
  	    </td>
    </tr>
</table>

<gw:textbox id="txtCompanyPK"   text="" styles="display:none" />
<gw:textbox id="txtCcy"   text="" styles="display:none" />
<gw:textbox id="txtcustpk" styles="display:none" />
</body>
</html>
