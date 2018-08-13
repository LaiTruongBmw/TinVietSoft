<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var v_company_pk="<%=Session("COMPANY_PK")%>";
function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document); 
	iduser_pk.text = "<%=session("USER_PK")%>";
	lstCompany.SetDataText("<%=CtlLib.SetListDataSQL("select PK,PARTNER_NAME from TCO_COMPANY where DEL_IF = 0 AND ACTIVE_YN='Y'")%>");
	lstCompany.value=v_company_pk;
  	txtCompanyPk.text         =   lstCompany.GetData();
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
<body  bgcolor='#F5F8FF'>
<gw:data id="datDeptTree"   > 
        <xml> 
            <dso id="1" type="tree" function="ac_sel_60140110_org_tree" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="iduser_pk" /> 
                </input> 
                <output bind="treDept" /> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------->
<table  width="100%"  cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr>
                    <td width="20%" align="left"><font color="black" ><b>Company</b></font></td>
                    <td width="50%">
                         <gw:list id="lstCompany" styles='width:100%' onchange="OnChange_com()"> 
	                         <data></data> 
                         </gw:list> 
                    </td>
                    <td width="15%" align="right"><gw:imgBtn id="btnSearch" img="search"  alt="search" onclick="OnSearch()" /> </td>
                    <td width="15%" align="right"><gw:imgBtn id="btnSearch" img="select"  alt="Select" onclick="OnSelect()" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
	    <td > 
	        <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr>
                    <td>
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

</body>
</html>
