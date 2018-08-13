<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>SALE ORDER ENTRY</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var arr_data = new Array();
function BodyInit()
{
    System.Translate(document); 
   //idFDate.SetDataText("20040101");
   idFDate.SetDataText(System.AddDate(idFDate.GetData(),-7));
   //idData_Dsql_OrderSelect.Call();
}

//----------------------------------------------------------------
function SearchOnClick()
{
   dsbs00141.Call('SELECT');
}
//----------------------------------------------------------------
function SelectOrder()
{
   var ctrl = idGrid.GetGridControl();
   var pk;
   var Cust;
   if(ctrl.Rows > 0)
   {
      pk = idGrid.GetGridData(ctrl.Row,0);
	  num=idGrid.GetGridData(ctrl.Row,1);
	  ponum=idGrid.GetGridData(ctrl.Row,3);
	  Cust=idGrid.GetGridData(ctrl.Row,4)
	  arr_data[0] = pk;
	  arr_data[1] = num;
	  arr_data[2] = ponum;
	  arr_data[3] = Cust;
	  window.returnValue =  arr_data;
	  window.close();
   }	  
	  
}
//----------------------------------------------------------------
function OnGetCustomer()
{
  var url= System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx";
  
  var o = System.OpenModal(url,500,500,'satus:yes;resizable:yes');
  
  if(o != null)
  {
    txtShipTo.text = o[1];
  }
}
//---------------------------------------------------------------
function OnDataReceive(obj)
{

}
</script>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00141" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="SALE.sp_sel_dsbs00141_1" > 
                  <input bind="idGrid" > 
                    <input bind="idFDate" />
					<input bind="idTDate" />
					<input bind="idPONum" />  
					<input bind="txtShipTo" />
					<input bind="txtCode"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
	    <tr style="height: 1%">
		    <td style="width: 5%" >
		        <b>Date</b>
		    </td>
		    <td style="width:10%" >
		        <gw:datebox id="idFDate" lang="<%=Session("Lang")%>" onenterkey="SearchOnClick()"/>
		    </td>
		    <td style="width:2%" >
		        <b>~</b>
		    </td>
		    <td style="width:10%" >
		        <gw:datebox id="idTDate" lang="<%=Session("Lang")%>" onenterkey="SearchOnClick()"/>
		    </td>
		    <td style="width:7%" >
		        <nobr><b>Order Num</b></nobr>
		    </td>
		    <td style="width:25%" >
		        <gw:textbox id="idPONum" styles="width:100%" onenterkey="SearchOnClick()" />
		    </td>
		    <td style="width:7%" >
		        <nobr><b>Ship to</b></nobr>
		    </td>
		    <td style="width:12%" >
		        <gw:textbox id="txtShipTo" styles="width:95%" onenterkey="SearchOnClick()" />
		    </td>
		    <td style="width:7%" >
		        <nobr><b>Model</b></nobr>
		    </td>
		    <td style="width:20%" >
		        <gw:textbox id="txtCode" styles="width:95%" onenterkey="SearchOnClick()" />
		    </td>
		    <td style="width:1%" >
		        <gw:button id="ibtnGetCustomer" img="popup" alt="Get customer" onclick="OnGetCustomer()" />
		    </td>
		    <td style="width:1%" >
		        <gw:button id="idSearch" img="search" alt="Search" text="Search" onclick="SearchOnClick()" />
		    </td>					
	    </tr>
	    <tr style="height: 99%">
	        <td colspan="12">
	            <gw:grid id="idGrid" header="_PK|Order Num|Order Date|PO Num|Ship To"
	            format="0|0|4|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0"
	            widths="0|2000|1500|2000|0" styles="width:100%; height:100%"
	            sorting="T" oncelldblclick="SelectOrder()"
	            param="0,1,2,3,4" />
	        </td>
	    </tr>
    </table >
</body>
</html>
