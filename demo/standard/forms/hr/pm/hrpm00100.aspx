<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var dt1, dt2,flag_tmp
var v_language = "<%=Session("SESSION_LANG")%>";
var company_pk=0
var company_nm=1
var w_month=2
var times=3
var from=4
var to=5
var close_yn=6
var close_dt=7
var confirm_yn=8
var pk=9
var id=10
var kind_of_sal=11


function BodyInit()
{
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
		
	iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";	
	menu_id.text=System.Menu.GetMenuID();
    idBtnOpen.SetEnable(0);
    idBtnClose.SetEnable(0);
    
    BindingDataList();
	datCheck_View.Call();
}

function BindingDataList()
{
    var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lst_company.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY PERIOD', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lst_ID.SetDataText(data);
}

function OnCheck()
{
    idGrid.SetAllRowStatusModify()
    datMonth_close.Call();
}
function OnSave()
{
    datMonth_close.Call();
}

function OnDataReceive(obj)
{
    var flag=0;
       
	   if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                idBtnCheck.style.display = "none";
                idBtnSave.style.display = "none";
                idBtnOpen.style.display = "none";
                idBtnClose.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
            {				
                datCompany_info.Call(); 
            }
	        else
			{				
		        datMonth_close.Call("SELECT");
            }
       }
	   if (obj.id=="datCompany_info")
       {			
			datPeriod_info.Call();
	   }
	   if (obj.id=="datPeriod_info")
       {				
			datMonth_close.Call("SELECT");
	   }
       if (obj.id=="datOpenClose")
       {
            if(txtresult.text=='0')
            {
                alert(flag_tmp+" Successful."+"\n"+flag_tmp+" thành công.")
                datMonth_close.Call("SELECT");
             }   
             else   
                alert(flag_tmp+" unSuccessful."+"\n"+flag_tmp+" không thành công.")
                    
       }
      
       
}    

function onSearch()
{   
    datMonth_close.Call("SELECT");
}
function on_click()
{
   if(idGrid.GetGridData(event.row,close_yn)=='Y')
    {
        idBtnOpen.SetEnable(1);
        idBtnClose.SetEnable(0);
    }   
    else
    {
        idBtnOpen.SetEnable(0);
        idBtnClose.SetEnable(1);
    }
    dt1=idGrid.GetGridData(event.row,from)
    dt2=idGrid.GetGridData(event.row,to)
    
}
function on_afteredit()
{
    if(idGrid.GetGridData(event.row,close_yn)=='Y')
    {
        if(event.col==from||event.col==to)
        {
            alert((v_language =="ENG")?"You can't change when the month is closed.":"Bạn không thể thay đổi khi dữ liệu đã đóng.")
            idGrid.SetGridText(event.row,from,dt1);
            idGrid.SetGridText(event.row,to,dt2);
        }
    }
}
//----------------------------------------------------------------------
function OnOpen_Close(n)
{
    var ctrl=idGrid.GetGridControl();
    if(ctrl.SelectedRows<1)
        return;
    if(ctrl.SelectedRows>1)
    {
        alert((v_language =="ENG")?"Only one row accept.":"Bạn chỉ được phép chọn 1 dòng.")
        return;
    }
    flag_tmp=n;
    if(confirm((v_language =="ENG")?"Do you want to ":"Bạn có muốn " +n+"?"))
    {
        if(n=='OPEN')
            txtflag.text='N'
        else
            txtflag.text='Y'
			
        txtwork_mon.text=idGrid.GetGridData(ctrl.SelectedRow(0),w_month);       
        txtfrom.text=idGrid.GetGridData(ctrl.SelectedRow(0),from);
        txtto.text=idGrid.GetGridData(ctrl.SelectedRow(0),to);
        txtpk.text=idGrid.GetGridData(ctrl.SelectedRow(0),pk);
        txtKind_of_sal.text=idGrid.GetGridData(ctrl.SelectedRow(0),kind_of_sal);
		txtPeriod_id.text=idGrid.GetGridData(ctrl.SelectedRow(0),id);
        datOpenClose.Call();
    }
}
//-------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function onChange_Company()
{
	//alert(lst_company.value);
	datPeriod_info.Call();
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
<!-------------------data control----------------------->
<gw:data id="datCompany_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lst_company" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:data id="datPeriod_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_PERIOD_LIST"  > 
                <input>
                    <input bind="lst_company" />
                </input> 
                <output>
                    <output bind="lst_ID" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datMonth_close" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,2,3,4,5,6,7,8,9,10,11" function="ST_HR_SEL_HRPM00100_0" procedure="ST_HR_UPD_HRPM00100_0"> 
                <input bind="idGrid" >
                    <input bind="lst_ID" />
                    <input bind="IDYear" />
					<input bind="lst_company" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datOpenClose" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00100_0" > 
                <input>
                    <input bind="txtpk" /> 
                    <input bind="txtwork_mon" /> 
                    <input bind="txtfrom" /> 
                    <input bind="txtto" /> 
                    <input bind="txtflag" />
                    <input bind="txtKind_of_sal" />
                    <input bind="lst_company" />
					<input bind="txtPeriod_id" />
					
					
                </input> 
                <output>
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="width:100%;height:7%;" class="eco_bg">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=10 width="10%" style="border:0" align="center" >Company</td>
							<td colspan=15 width="15%" style="border:0"> 
								<gw:list  id="lst_company" value="" onchange="onChange_Company()" maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=10 width="10%" style="border:0" align="center" >
								Year
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:datebox id="IDYear" onchange="onSearch()"  maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=year />
							</td>
							
							<td colspan=10 width="10%" style="border:0" align="center" >
								Period
							</td>
							<td colspan=20 width="20%" style="border:0" align="center" >
								<gw:list  id="lst_ID" onchange="onSearch()" maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="idBtnCheck" img="confirm" text="Confirm" onclick="OnCheck()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="idBtnSave" img="save" text="Save" onclick="OnSave()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="idBtnOpen" img="lock_open" text="Open" onclick="OnOpen_Close('OPEN')" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="idBtnClose" img="lock" text="Close" onclick="OnOpen_Close('CLOSE')" />
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
								header="_Company_pk|Company Name|Month|Times|From|To|Close Y/N|Close DT|Confirm Y/N|_pk|PERIOD ID|_k_of_Salary"
								format="0|0|0|0|4|4|0|4|0|0|0|0"
								aligns="0|0|0|1|1|1|0|1|0|0|0|0"
								defaults="|||||||||||"
								editcol="0|0|0|0|1|1|0|0|0|0|0|0"
								widths="1000|4000|1000|1500|2000|2000|1500|1500|1500|500|500|500"
								styles="width:100%;height:100%"
								sorting="T"
								onafteredit="on_afteredit()"
								oncellclick = "on_click()"
								acceptNullDate="T"
								autosize = true
								param="0,1,2,3,4,5,6,7,8,9,10,11" oncelldblclick = ""/>

							</td>
						</tr>
				   </table> 
				</div>
			</td>
        </tr>
    </table>
   

<gw:textbox id="txtpk" styles="display:none"/>
<gw:textbox id="txtwork_mon" styles="display:none"/>
    <gw:textbox id="txtfrom" styles="display:none"/>
    <gw:textbox id="txtto" styles="display:none"/>
    <gw:textbox id="txtflag" styles="display:none"/>
    <gw:textbox id="txtresult" styles="display:none"/>
	<gw:textbox id="iduser_pk" styles="display:none"/>
	<gw:textbox id="txtHr_level" styles="display:none"/>
	<gw:textbox id="txtKind_of_sal" styles="display:none"/>
	<gw:textbox id="txtPeriod_id" styles="display:none"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</body>
</html>
