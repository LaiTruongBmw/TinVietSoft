<!-- #include file="../../../../system/lib/form.inc"  -->

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
   // if (v_language!="ENG")
   //     System.Translate(document); 
	//iduser_pk.text = "<%=session("USER_PK")%>";
	
  OnSearch();
  	
}
//-------------------------------------------
function OnSearch()
{
    
	txtpk.text= '<%=Request.QueryString("p_ppk")%>';
	dso_Bank.Call("SELECT");
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dso_Bank":
            
        break;
    }
}
//-------------------------------------------
function OnSelect()
{
    
    var code_data=new Array()
	var ctrl = idgrid.GetGridControl();
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an code.");
        return ;
    }
    else
	{
       
       code_data[1] = idgrid.GetGridData( ctrl.row , 16 );//pay: recei dt
      
		code_data[2] = idgrid.GetGridData( ctrl.row , 2 );
		 
		code_data[3] = idgrid.GetGridData( ctrl.row , 3 );
		code_data[4] = idgrid.GetGridData( ctrl.row , 18 );//remarks
		
		//alert(code_data[4]);
		
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
    
}

</script>
<body  >
<gw:data id="dso_Bank"   > 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60100050_itf_pop"  > 
                <input>
                    
                    <input bind="txtpk" /> 
                </input> 
                <output bind="idgrid" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
  <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
              <fieldset style="padding: 2; width: 100%; height: 100%">
				<table border="0" width="100%" id="table2">
					<tr>
						<td align="right" width="15%"></td>
						<td width="85%"></td>
					   <td></td>
						<td><gw:imgbtn id="btnSearch3" img="select" width="100%" img="in" alt="Select" onclick="OnSelect()" /></td>
					</tr>
				</table>
			  </fieldset>
			</td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
               <gw:grid id="idgrid" header="_tfn_eppaytrh_pk|voucher_no|pay_date|Sender|AC NO(Send)|Amount|CCY|Nation|Customer No|AC NO(Recei)|Recei Name|Recei Address|Recei Nation|Bank Name|Bic_CODE|Trans Type|Recei date|Recei Time|Remarks"
				format="0|0|0|0|0|-0|0|0|0|0|0|0|0|0|0|0|4|0|0" 
				aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
				defaults="||||||||||||||||||" 
				editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
				styles="width:100%; height:100%" autosize='T'
				sorting="T"  oncelldblclick="OnSelect()"/>     
            </td>
        </tr>
    </table>

			
         
        
        
<gw:textbox id="txtpk" styles="display:none; " />
</body>
</html>
