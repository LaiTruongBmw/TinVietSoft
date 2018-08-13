<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var v_company_pk="<%=Session("COMPANY_PK")%>";
var init_from;
function BodyInit()
{
	System.Menu.LoadDictionaryForPopup(System.Menu.OnGetID(window.location.toString()));
	init_from = setInterval(function(){ if(System.Menu.init_lang == "Y")BodyProcess(); }, 1000);
}

function BodyProcess(){
	clearInterval(init_from);
	System.Translate_V2(document, System.Menu.GetMenuPS());
	txtLanguage.text = v_language;
	iduser_pk.text = "<%=session("USER_PK")%>";
	
	lstCompany.SetDataText("<%=CtlLib.SetListDataSQL("select PK, DECODE('" + Session("SESSION_LANG").ToString() + "','ENG', PARTNER_NAME, PARTNER_LNAME) from TCO_COMPANY where DEL_IF = 0 AND ACTIVE_YN='Y'")%>");
	//lstCompany.value=v_company_pk;
  	//txtCompanyPk.text         =   lstCompany.GetData();
	
  	datDeptTree.Call("SELECT");
}

//-------------------------------------------
function OnSearch()
{
    
	datDeptTree.Call("SELECT");
}
//-------------------------------------------
function OnSelect()
{
    
    var obj = treDept.GetCurrentNode()
    if (obj!=null)
       window.returnValue = obj.oid; 
    else
       window.returnValue = null; 
	window.close();
    
}
//-------------------------------------------
function EXITOnClick()
{
	OnSelect();
}
/*------------------------------*/
function OnChange_com()
{
	datDeptTree.Call("SELECT");
}

//-------------------------------------------
function treeItemOnclick()
{
    OnSelect();
}
//-------------------------------------------
</script>
<body bgcolor='#FFFFFF' style="overflow:hidden;">
<gw:data id="datDeptTree"   > 
        <xml> 
            <dso id="1" type="tree" function="ST_HR_SEL_CO_ORG_TREE" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="iduser_pk" /> 
                    <input bind="txtLanguage" /> 
                </input> 
                <output bind="treDept" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
<table width="100%" height="100%"  cellpadding="0" cellspacing="0" border="0">
    <tr class="eco_bg" height="30px">
        <td align="center">
            <table cellpadding="3" cellspacing="2" width="100%" class="eco_line">
                <tr>
                    <td align="left" style="white-space:nowrap"><font color="black" ><b>Company</b></font></td>
                    <td style="width:85%">
                         <gw:list id="lstCompany" styles='width:100%' onchange="OnChange_com()" /> 
                    </td>
                </tr>
				<tr>
					<td colspan="2" align="right">
						<table cellpadding="3" cellspacing="2">
							<% 
								IF Session("CODEADMIN_YN").ToString() = "Y" AND Session("SESSION_LANG").ToString() = "ENG" THEN
							%>
								<td><gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" /></td>
							<% END IF %>
							<td ><gw:button id="btnSearch" img="search"  alt="search" onclick="OnSearch()" /></td>
							<td ><gw:button id="btnSelect" img="select"  alt="Select" onclick="OnSelect()" /></td>
						</table>
					</td>
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:100%">
	    <td > 
	        <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" >
                <tr>
                    <td valign="top">
	                    <gw:tree  id="treDept" onclicknode="treeItemOnclick()" style="width:100%; height:100%;overflow:auto;"  >
		                </gw:tree>  
		           </td>
		       </tr>
		    </table>
	    </td>
    </tr>	
    
</table>
<gw:textbox id="txtDeptPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtUpperDeptPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtCompanyPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtCountDepId" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtLanguage" styles="display:none"/>
</body>
</html>
