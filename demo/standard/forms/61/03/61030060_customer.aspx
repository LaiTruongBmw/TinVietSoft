<!-- Popup dung de get customer tuong tu popupgetpartnet.aspx -->
<!-- #include file="../../../system/lib/form.inc"  -->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _selected = false;
function BodyInit()
{  
    System.Translate(document);
    
}
function OnSearch()
{
    datGetCustomer.Call("SELECT");
}

function OnSelect()
{
    
    var code_data=new Array();
	

	if(idGrid.row <= 0)
    {
	    alert("Please select a row in the grid.");
		
        return ;
    }
    else
	{
            for(var j=0;j< idGrid.cols -1; j++)
        	{
		        code_data[code_data.length] = idGrid.GetGridData(idGrid.row , j );
		       
	        }        
		
	}

	window.returnValue = code_data; 
	this.close(); 	
}

function OnResetCust()
{
    txtCustomerName.text = "";
    txtCustomerID.text = "";
}

</script>
<body style="margin:0; padding:0;">
    <gw:data id="datGetCustomer"  onreceive="" > 
    <xml> 
           <dat id="1" type="grid" function="pm_sel_61030060_customer" > 
                  <input bind="idGrid" > 
                    <input bind="txtCustomerID" /> 
                    <input bind="txtCustomerName" /> 
                    <input bind="chkAR_YN" />
                    <input bind="chkAP_YN" />
                    <input bind="chkCO_YN" />
                  </input> 
                <output bind="idGrid" /> 
            </dat> 
        </xml> 
    </gw:data> 
    
    <table  width=100%>
	<tr>
	    <td width=5%><b>Partner</b>
		<td width=40%>
		    <table width=100% border = 0 cellpadding= 0 cellspacing= 0 >
		    <tr>
		        <td width=35%><gw:textbox id="txtCustomerID"    styles="width:100%" 	csstype="mandatory" onenterkey="OnSearch();"/></td>
        		<td width=50%><gw:textbox id="txtCustomerName"  styles="width:100%" 	csstype="mandatory" onenterkey="OnSearch();"/></td>
        		<td align="left"><gw:imgBtn id="btnResetCust"   img="reset"             alt="Reset"         onclick="OnResetCust();"/></td>
		    </tr>
		    </table>
		</td>
		
		
		<td width=10%><b>Vendor<b></td>
		<td width=5%><gw:checkbox id="chkAR_YN" defaultvalue="Y|N" value="Y" /></td>
		<td width=10%><b>Customer<b></td>
		<td width=5%><gw:checkbox id="chkAP_YN" defaultvalue="Y|N" value="N" /></td>
		<td width=10%><b>Company<b></td>
		<td width=5%><gw:checkbox id="chkCO_YN" defaultvalue="Y|N" value="N" /></td>
		<td width=15%></td>
		<td width=5%><gw:imgBtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" /></td>	
		<td width=5%><gw:imgBtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" /></td>					
	</tr>
	<tr>
	    <td colspan=12>
			<gw:grid   
			id="idGrid"  
			header="_c.PK|Cust ID|Cust Name|Local Name|_FOREIGN_NM|_PARTNER_TYPE|TAX CODE|SERIAL NO|FORM NO|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_EMAIL|_FAX|_WEBSITE|_SALE_PRESENT|_COM_YN|_CUS_YN|_CUS_ACTIVE_YN|_VEN_YN|_VEN_ACT_YN|_ACT_YN|_VALID_F|_VALID_T|_DESCRIPT"   
			format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			defaults="||||||||||||||||||||||||||"  
			editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
			widths="0|1000|3000|4000|0|0|0|1000|1000|1000|4000|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			styles="width:100%; height:530"   
			sorting="T"   
			
			oncelldblclick="OnSelect()"
			
			/> 
	    </td>
	</tr>
</table >
</body>
</html>
