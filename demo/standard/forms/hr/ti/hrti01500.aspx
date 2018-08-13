<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtUser_PK.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
   if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
     datUser_info.Call(); 
   else  
  ChangeLocation();
    
}
function OnAdd()
{
     var ctrl=idGrid.GetGridControl();
        idGrid.AddRow();
		ctrl.TopRow = ctrl.rows;
		idGrid.SetGridText(ctrl.rows-1,6,lstCompany.value)
		
		}
function OnSave()
{
    if(confirm("Do you want to save?\nBạn đã chắc chắn save?"))
        datWork_Group_Entry.Call();
}
function OnDel()
{
    if(confirm("Do you want to delete?\nBạn đã chắc chắn xóa?"))
        idGrid.DeleteRow();
}
function onSearch()
{
    datWork_Group_Entry.Call("SELECT");
}

function OnDataReceive(obj)
{
    if(obj.id=="datUser_info")
     datWork_Group_Entry.Call("SELECT");
  
}
function OnDataError(obj) 
{
	switch (obj.id) 
	{
		default: return false;
		case datWork_Group_Entry.id:
			System.Menu.OnGetError(eval(obj).errmsg);
			break;
	}
}
function ChangeLocation()
{
	datWork_Group_Entry.Call("SELECT");
}  
    
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="txtUser_PK" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<gw:data id="datWork_Group_Entry" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6" function="ST_HR_SEL_HRTI01500_0" procedure="ST_HR_UPD_HRTI01500_0">
                <input bind="idGrid"> 
                <input bind="lstCompany"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<table id="main" style="width:100%;height:100%" cellpadding="0" cellspacing="0" class="eco_line">
    <tr style="height:2%" class="eco_bg">
        <td colspan="2">
            <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                <tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=12 width="12%" style="border:0" align="left" >Company</td>
					<td colspan=20 width="20%" style="border:0"> 
						<gw:list  id="lstCompany"  maxlen = "100" styles='width:70%'onchange="ChangeLocation()" >
							<data>
								<%= CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
							</data>
						</gw:list>
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button img="new" id="idBtnNew" text="Add New"  alt="Add"  onclick="OnAdd()"/>
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button id="idBtnSave" img="save" text="Save" alt="Save" onclick="OnSave()" />
					</td>
					
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button img="delete" id="idBtnDelete" text="Delete" alt="Delete" onclick="OnDel()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="center" >
						
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						
					</td>
					<td colspan=15 width="15%" style="border:0" align="left" >
						
					</td>
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:98%">
        <td colspan="2" class="eco_line_t">
            <gw:grid
				id="idGrid"
				header="WorkGroup ID|Work Group Name|Work Group VName|Remark|Seq|_pk|_p_company_pk"
				format="0|1|1|0|0|0|0"
				aligns="1|2|2|0|0|0|0"
				defaults="|||||||"
				editcol="1|1|1|1|1|0|0"
				widths="2000|3000|3000|3000|1000|0|100"
				styles="width:100%;height:100%"
				sorting="F"
				onafteredit=""
				oncellclick = ""
				acceptNullDate="T"
				 oncelldblclick = ""/>
        </td>
    </tr>
</table>
    
<gw:textbox id="txtpk" styles="display:none"/>
<gw:textbox id="txtfrom" styles="display:none"/>
<gw:textbox id="txtto" styles="display:none"/>
<gw:textbox id="txtflag" styles="display:none"/>
<gw:textbox id="txtresult" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtUser_PK" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
</body>
</html>
