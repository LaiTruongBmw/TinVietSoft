<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Allocation By Prod</title>
</head>

<script>
      
	
	
		
//------------------------------------------------------------------------
function BodyInit()
{
    //System.Translate(document);
    BindingDataList();
	OnSearch();

}
//------------------------------------------------------------------------
function BindingDataList()
{

  txtCodeGroupPK.text  = "<%=Request.querystring("CodeGroupPK")%>";
  txtpLcd.text  = "<%=Request.querystring("pL_cd")%>";
   txtmonth.text = "<%=Request.querystring("month")%>";
 
	
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	
}


function OnSearch()
{
	data_60170480_acount.Call("SELECT");
	
}



</script>

<body>
   <!------------------------------------------------------------------>
	 <gw:data id="data_60170480_acount" onreceive=""> 
        <xml> 
           <dso id="1" type="grid"  function="ac_sel_60170480_acount"  > 
                <input bind="grdAcc" >
                    <input bind="txtCodeGroupPK" /> 
					<input bind="txtmonth" /> 
					<input bind="txtpLcd" /> 
					<input bind="txtAcccd" /> 
					<input bind="txtAcNm" /> 
                </input> 
                <output bind="grdAcc" /> 
            </dso> 
        </xml> 
    </gw:data>
   
	<!--------------------------------------------------- -->
	
 <table  border="0" cellpadding="0" cellspacing="0" style="height:100%" >
  
	<tr style="height: 1%">
		 
		<td   style="width:10%;"  align="right">
			AC Code
		<td>
		<td   style="width:30%;" align="left">
				<gw:textbox id="txtAcccd" text="" styles="width:100%; "  />    
		</td>
		
		<td  width = "10%" align="right">
			AC Name
		<td>
		<td   style="width:30%;" >
				<gw:textbox id="txtAcNm" text="" styles="width:100%; "  />
		</td>
		
		<td style="width: 2%">
			<gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch()" />
		</td>
		
		
	</tr>
	<tr style="height: 99%">
		<td colspan="7" >
			
				
		<gw:grid id='grdAcc'
			header='PL_CD|PL_NM|CODE_TYPE_NM|AC_CD|AC_NM|ymd_drbooks'
			format='0|0|0|0|0|1'
			aligns='0|0|0|0|0|0'
			defaults='|||||'
			editcol='0|0|0|0|0|0'
			widths='1000|2000|2000|1500|2000|0'
			sorting='F'
			
			styles='width:100%; height:100%'
			/>
				
				
				
		</td>
	</tr>
                    
	</table>
    
<gw:textbox id="txtCodeGroupPK" text="" style="display: none" />	
<gw:textbox id="txtpLcd" text="" style="display: none" />	
<gw:textbox id="txtmonth" text="" style="display: none" />	

</body>
</html>