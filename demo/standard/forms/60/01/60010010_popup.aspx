<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

var arr_data = new Array();
 function BodyInit()
 {
    System.Translate(document);
    OnSearch();
 }
function BindingDataList()
{ 
   
    
}
function OnSearch()
{
    Dso_ABPL_Unit.Call("SELECT");
}

function OnSelectPartner()
{
    var arr_data = new Array()
    if (idGrid.rows > 0)
    {
		
		arr_data[0] = idGrid.GetGridData(event.row,4);   //Pk
		arr_data[1] = idGrid.GetGridData(event.row, 0);   // cust code
		arr_data[2] = idGrid.GetGridData(event.row, 1);   // name
		
	    window.returnValue =  arr_data;
	    window.close();
	}
}

function OnClose()
{
    this.close();
}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {               
        case "Dso_ABPL_Unit":
            lblRecord.text=idGrid.rows-1 + " record(s).";
        break;
    }
}
</script>
 
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0">

<gw:data id="Dso_ABPL_Unit"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ac_SEL_60010010_ABPL_POPUP">
            <input bind="idGrid" >                    
                <input bind="txt_PARTNER_ID" />
                <input bind="txt_PARTNER_NAME" />
                <input bind="txt_TAX_CODE" />
            </input>
            <output bind="idGrid" />
        </dso>                    
    </xml>
</gw:data>

    
<!------------------------ Main Table -------------------------->    
    
<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
    <tr valign="top">
        <td>
            <table width="100%">
                <tr>
                    <td width="8%" align="right">Code</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PARTNER_ID"  text=""  styles="width:100%" onenterkey="OnSearch()"/></td>
                    <td width="8%" align="right">Name</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PARTNER_NAME"  text=""  styles="width:100%"onenterkey="OnSearch()" /></td>
                    <td width="8%" align="right">Tax Code</td>
                    <td width="8%" align="left"><gw:textbox id="txt_TAX_CODE"  text=""  styles="width:100%" onenterkey="OnSearch()"/></td>
                    <td width="10%" align="center" ><gw:label id="lblRecord"   text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight:bold" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnCan" img="cancel"   alt="Close" 	 onclick="OnClose()" /></td> 
                </tr>
            </table>
        </td> 
    </tr>
    
    <tr>
        <td align = top  height="100%" border="">
        <!--header   = "_PK|Partner ID|Partner name|Add|Tax code"-->
            <div style="width:100%; height:96%; overflow:scroll;">
		        <gw:datagrid   
			        id="idGrid"  
			        header   = "Partner ID|Partner name|Add|Tax code|_PK"
			        format   = "0|0|0|0|0"
			        aligns   = "0|0|0|0|0"
			        defaults = "||||||" 
			        editcol  = "0|0|0|0|0"   
			        widths   = "100|400|500|200|0"
			        styles   = "width:100%; height:100%"   
			        sorting  = "T"
                    paging="true" pageview="15"
			        oncelldblclick="OnSelectPartner()"
                    />
            </div>
	    </td>
    </tr>    
</table>

    
  
</body>

</html>