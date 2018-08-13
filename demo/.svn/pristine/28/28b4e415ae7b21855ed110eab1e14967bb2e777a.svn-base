<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var gSave = false;
var year = "<% =Request.QueryString("YEAR") %>";
var lang="<%=Session("Lang")%>";
var v_data = new Array();
var close_flag;
var v_language = "<%=Session("SESSION_LANG")%>";
var p_company_pk="<% =Request.QueryString("v_company_pk") %>";
var init_from;
function BodyInit()
{   
    System.Menu.LoadDictionaryForPopup(System.Menu.OnGetID(window.location.toString()));
	init_from = setInterval(function(){ if(System.Menu.init_lang == "Y")BodyProcess(); }, 1000);
}

function BodyProcess(){
	clearInterval(init_from);
	System.Translate_V2(document, System.Menu.GetMenuPS());
	idcompany_pk.text=p_company_pk;
   
    //if (v_language!="ENG")
        System.Translate(document);
   <%=CtlLib.SetGridColumnComboFormat("grdHoliday" , 3 , "SELECT A.CODE, A.CODE_NM   FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE B.ID = 'COAB0140'   AND A.TCO_ABCODEGRP_PK = B.PK AND A.DEL_IF = 0 AND B.DEL_IF = 0 union all select '','' from dual") 
   %> 
   dtYear.SetDataText(year,lang);
   close_flag = 0;
   OnSearch();
}
//-------------------------------------
function OnSearch()
{
   
   datHoliday.Call("SELECT");
}
//-------------------------------------
function OnSave()
{
    close_flag=1;
	datHoliday.Call();
	
}
//-------------------------------------
function CheckDataIsValid()
{
   for(var i=1;i<grdHoliday.rows;i++)
   {
      
         if((grdHoliday.GetRowStatus(i)>=16)&&(grdHoliday.GetRowStatus(i)<=48))
         {
            
            if(grdHoliday.GetGridData(i,3)== "")
            {
               alert("Please select holiday type !");
               return false;
            }
            if(Trim(grdHoliday.GetGridData(i,4))== "")
            {
               alert("Please input holiday comment!");
               return false;
            }            
            
         }
     
   }
   return true;
}
//-------------------------------------
function OnClose()
{
   window.returnValue = close_flag;
   window.close();      
}
//-------------------------------------
function EXITOnClick()
{
	OnClose();
}
</script>
<body bgcolor='#FFFFFF' style="overflow:hidden;">
<!------------main control---------------------->

<gw:data id="datHoliday" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRTI00201_0"  procedure="ST_HR_UPD_HRTI00201_0" parameter="0,1,3,4,5">   
                <input bind="grdHoliday">
                    <input bind="lstHolidayType" /> 
                    <input bind="dtYear" />
					<input bind="idcompany_pk" />
                </input> 
                <output bind="grdHoliday"/>
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table--------------------------------->
<table  style='margin-left:0px' width="100%" cellpadding="0"  cellspacing="0" border="0" style="height:100%;">
    <tr style="width:100%;height:100%">
        <td style="width:100%;height:100%">
            <table border="0" style="width:100%;height:100%" cellpadding="0"  cellspacing="0">
	            <tr style="height:30px" class="eco_bg">
	                <td colspan=15 width="15%" align=right style="border:0"><font color=black><b>Holiday Type</b></font></td>
	                <td colspan=20 width="20%" style="border:0">
	                     <gw:list id="lstHolidayType" value="ALL" styles="width:100%" onchange="OnSearch()" >
	                         <data><%= CtlLib.SetListDataSQL("SELECT A.CODE, A.CODE_NM   FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.ID = 'COAB0140' AND A.TCO_ABCODEGRP_PK = B.PK ORDER BY A.CODE_NM")%>|ALL|Select All</data>
	                     </gw:list>
	                </td>
	                <td colspan=15 width="15%" align=right style="border:0"><font color=black><b>Month</b></font></td>
	                <td colspan=20 width="20%" style="border:0"><gw:datebox id="dtYear" type="month" lang="<%=session("lang")%>" onchange="OnSearch()"/></td>
	                <td colspan=10 width="10%" style="border:0"><gw:textbox id="idcompany_pk" styles="display:none"/></td>
	                <td colspan=10 width="10%" style="border:0"><gw:button id="ibtnSave" img="save" text="Save" onclick="OnSave()" /></td>
	                <td colspan=9 width="9%" style="border:0"><gw:button id="ibtnClose" img="cancel" text="Close" onclick="OnClose()" /></td>
	                <% 
						IF Session("CODEADMIN_YN").ToString() = "Y" AND Session("SESSION_LANG").ToString() = "ENG" THEN
					%>
						<td colspan=1 width="1%" style="border:0"><gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" /></td>
					<% END IF %>
	            </tr>
	            <tr style="height:95%">
	                <td colspan=100 width="100%">
	                   <gw:grid   
					        id="grdHoliday"  
					        header="_PK|Date|Day Type|Holiday Type|Comment|Remark|_DEL_IF|_CRT_BY|_CRT_DT|_MOD_BY|_MOD_DT"   
					        format="0|4|0|2|0|0|0|0|0|0|0"  
					        aligns="0|0|0|2|0|0|0|0|0|0|0"  
					        defaults="|||||||||||"  
					        editcol="1|1|0|1|1|1|1|1|1|1|1"  
					        widths="0|1500|1500|2500|3000|2500|0|0|0|0|0"  
					        styles="width:100%; height:100%"   
					        sorting="T"   
					         /> 
	                </td>
	            </tr>
	        </table>
	    </td>
    </tr>
</body>

</html>

