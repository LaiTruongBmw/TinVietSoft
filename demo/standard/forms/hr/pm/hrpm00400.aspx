<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    var t1;
    idGrid.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    menu_id.text=System.Menu.GetMenuID();
    <%=CtlLib.SetGridColumnComboFormat( "idGrid" , 3 , "select code,code_nm from vhr_hr_code where id='HR0033' order by code_nm " ) %>; 
    
    t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0033', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lst_tax_kind.SetDataText(t1);
    
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
        
            datTax_Detail.Call("SELECT");
            
       }
}
function OnAdd()
{
     var ctrl=idGrid.GetGridControl();
        idGrid.AddRow();
		idGrid.SetGridText(idGrid.rows-1,3,lst_tax_kind.value);
		ctrl.TopRow = ctrl.rows;
}
function OnSave()
{
    datTax_Detail.Call();
}
function OnDel()
{
    if(confirm("Do you want to delete?\nBạn đã chắc chắn xóa?"))
        idGrid.DeleteRow();
}
function onSearch()
{
    datTax_Detail.Call("SELECT");
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
<gw:data id="datTax_Detail" onreceive="" > 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5" function="ST_HR_SEL_HRPM00400_0" procedure="ST_HR_UPD_HRPM00400_0"> 
                <input bind="idGrid" >
                   <input bind="lst_tax_kind" /> 
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<table cellpadding="0" cellspacing="0" style="width:100%;height:100%" class="eco_line">
    <tr style="width:100%;height:100%" valign="top">
        <td>
			<div style="width:100%;height:7%;" class="eco_bg">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=10 width="10%" style="border:0" align="center" >Tax Kind</td>
						<td colspan=15 width="15%" style="border:0"> 
							<gw:list  id="lst_tax_kind" onchange="onSearch()" maxlen = "100" styles='width:100%' />
						</td>
						<td colspan=30 width="30%" style="border:0" align="left" >
						    <table style="height:100%" border="0" cellpadding="2" cellspacing="1">
						        <tr>
						            <td><gw:button img="new" text="Add New" id="idBtnNew"   alt="Add"  onclick="OnAdd()"/></td>
						            <td><gw:button img="delete" text="Delete" id="idBtnDelete"  alt="Delete" onclick="OnDel()" /></td>
						            <td><gw:button id="idBtnSave" text="Save" img="save" alt="Save" onclick="OnSave()" /></td>
						        </tr>
						    </table>
						</td>
						<td colspan=20 width="20%" style="border:0" align="center" >
							
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							
						<td colspan=5 width="5%" style="border:0" align="left" >

						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							
						</td>
					</tr>
				</table>
			</div>
			<div  style="width:100%;height:93%" class="eco_line_t">
				<table  cellpadding="0" cellspacing="0" style="height:100%" width="100%" border="0">
					<tr valign="top">
						<td  style="width:100%;height:100%;"> 
							<gw:grid
							id="idGrid"
							header="Tax ID|Amount|Rate(%)|Tax Kind|Remark|_pk"
							format="0|1|1|0|0|0"
							aligns="1|0|0|1|0|0"
							defaults="|||||"
							editcol="1|1|1|1|1|0"
							widths="1500|2000|1500|2000|5000|0"
							styles="width:100%;height:100%"
							sorting="F"
							onafteredit=""
							oncellclick = ""
							acceptNullDate="T"
							param="0,1,2,3,4,5" oncelldblclick = ""/>
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
