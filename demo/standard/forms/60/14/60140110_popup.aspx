<!-- #include file="../../../../system/lib/form.inc"  -->

<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    System.Translate(document);
     var user_id = "<%=Session("LOGIN_ID")%>"; 
    txtUser_id.SetDataText(user_id); 
    var ls_compk = "<%=Request.querystring("compk")%>";
    txt_compk.SetDataText(ls_compk);
   

	var AdminYN    = "<%=Session("CODEADMIN_YN")%>";
    txt_useyn.text = AdminYN;
    if (AdminYN == 'Y')
    {
        var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0070' AND A.USE_IF = 1 ORDER BY ORD")%>";
    }
    else if (AdminYN == 'N')
    { 
        var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0070' AND A.USE_IF = 1 AND A.SYS_YN = 'N' ORDER BY ORD")%>";
    }
    lstTrans_Group.SetDataText(ls_data);
    lstTrans_Group.SetDataText('');
    OnSearch();
  
  	
}
//-------------------------------------------
function OnSearch()
{
    
	dso_sel_trans.Call("SELECT");
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dso_sel_trans":
            
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
        
        code_data[0] = idgrid.GetGridData( ctrl.row , 0 );
        
		code_data[1] = idgrid.GetGridData( ctrl.row , 1 );
		code_data[2] = idgrid.GetGridData( ctrl.row , 2 );
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
    
}

</script>
<body  >
 <gw:data id="dso_sel_trans">
        <xml>
            <dso type="grid"  function="ac_sel_60140110_1">
                <input bind="idgrid" >
                    <input bind="lstTrans_Group"/>
                    <input bind="txtTrans"/>
                   
                    <input bind="txt_compk"/>
                    <input bind="txt_useyn"/>
                    <input bind="txtUser_id"/>
                </input>
                <output bind="idgrid"/>
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
				            <td align="right" width="15%">Trans.Group</td> 
				            <td width="85%"><gw:list id="lstTrans_Group" onchange="OnSearch()"  styles="width:100%" /></td>
				            <td><gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()"/></td>
				    </tr>
					<tr>
						<td align="right" width="15%">Transaction</td>
						<td width="85%"><gw:textbox id="txtTrans" onenterkey="OnSearch()" text="" styles="width:100%" /></td>
					   
						<td><gw:imgbtn id="btnSearch3" img="select" width="100%" img="in" text="Process" onclick="OnSelect()" /></td>
					</tr>
				</table>
			  </fieldset>
			</td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
               <gw:grid id="idgrid" header="_pk|Trans Code|Trans Name"
				format="0|0|0" 
				aligns="1|0|0" 
				defaults="|||" 
				editcol="0|0|0"
				widths="1000|2000|3000" 
				styles="width:100%; height:100%"
				sorting="T"  oncelldblclick="OnSelect()"/>
                   
            </td>
        </tr>
    </table>
<gw:textbox id="txt_compk"  styles="width:100%;display:none"/>
<gw:textbox id="txt_useyn"  styles="width:100%;display:none"/>
<gw:textbox id="txtUser_id"    style="display:none" />

</body>
</html>
