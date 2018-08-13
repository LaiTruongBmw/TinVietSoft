<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
//header="_PK|Position Name|Major Name|Level A|Level B|Level C|Description"
var G_PK = 0,
	G_POSITION_TYPE = 1,
	G_MAJOR_TYPE = 2,
	G_LEVEL_A = 3,
	G_LEVEL_B = 4,
	G_LEVLE_C = 5,
	G_DESCRIPTION = 6;
	
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
    menu_id.text=System.Menu.GetMenuID();
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>| | ";
       idGrid.SetComboFormat(G_POSITION_TYPE,t1);
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0148' order by code_nm")%>| |";
       idGrid.SetComboFormat(G_MAJOR_TYPE,t1);
	
  
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPosition.SetDataText(data);
	lstPosition.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0148', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstMajor.SetDataText(data);
	lstMajor.value ="ALL";
	
    datCheck_View.Call();
}
function OnDataReceive(obj)
{
    if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                idBtnNew.style.display = "none";
                idBtnSave.style.display = "none";
                idBtnDelete.style.display = "none";
            }
        
            dat_hrpm01500_0.Call("SELECT");
            
       }
}
function OnAdd()
{
     var ctrl=idGrid.GetGridControl();
        idGrid.AddRow();
		//idGrid.SetGridText(idGrid.rows-1,3,lst_tax_kind.value);
		ctrl.TopRow = ctrl.rows;
}
function OnSave()
{
    dat_hrpm01500_0.Call();
}
function OnDel()
{
    if(confirm("Do you want to delete?\nBạn đã chắc chắn xóa?"))
        idGrid.DeleteRow();
}
function onSearch()
{
    dat_hrpm01500_0.Call("SELECT");
}

</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<gw:data id="datCheck_View" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_VIEW"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_hrpm01500_0" onreceive="" > 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6" function="ST_HR_SEL_HRPM01500_0" procedure="ST_HR_UPD_HRPM01500_0"> 
                <input bind="idGrid" >
                   <input bind="lstPosition" /> 
				   <input bind="lstMajor" /> 
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<table border="0" cellpadding=0 cellspacing=0 style="width:100%;height:100%" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="width:100%;height:7%;" class="eco_bg">
					<table width="100%"  style="height:100%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td align="center">Position</td>
							<td width="150px"> 
								<gw:list  id="lstPosition" onchange="onSearch()" maxlen = "100" styles='width:100%' />
							</td>
							<td align="center">Major</td>
							<td width="150px"> 
								<gw:list  id="lstMajor" onchange="onSearch()" maxlen = "100" styles='width:100%' />
							</td>
							<td>
							    <table style="height:100%" border="0" cellpadding="2" cellspacing="1">
							        <tr>
							            <td><gw:button img="search" text="Search" id="idBtnSearch"   alt="Search"  onclick="onSearch()"/></td>
							            <td><gw:button img="new" text="Add New" id="idBtnNew"   alt="Add"  onclick="OnAdd()"/></td>
							            <td><gw:button img="delete" text="Delete" id="idBtnDelete"  alt="Delete" onclick="OnDel()" /></td>
							            <td><gw:button id="idBtnSave" text="Save" img="save" alt="Save" onclick="OnSave()" /></td>
							        </tr>
							    </table>
							</td>
						</tr>
					</table>
				</div>
				<div  style="width:100%;height:93%" class="eco_line_t">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border="0">
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid
								id="idGrid"
								header="_PK|Position Name|Major Name|Level A|Level B|Level C|Description"
								format="0|2|2|-0|-0|-0|0"
								aligns="1|0|0|0|0|0|0"
								defaults="||||||"
								editcol="1|1|1|1|1|1|1"
								widths="1500|3000|3000|2000|2000|2000|2000"
								styles="width:100%;height:100%"
								sorting="F"
								onafteredit=""
								oncellclick = ""
								acceptNullDate="T"
								oncelldblclick = ""/>
							</td>
						</tr>
				   </table> 
				</div>
			</td>
        </tr>
</table>
   
<gw:textbox id="txtpk" styles="display:none"/>
    <gw:textbox id="txtfrom" styles="display:none"/>
    <gw:textbox id="txtto" styles="display:none"/>
    <gw:textbox id="txtflag" styles="display:none"/>
    <gw:textbox id="txtresult" styles="display:none"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
</body>
</html>
