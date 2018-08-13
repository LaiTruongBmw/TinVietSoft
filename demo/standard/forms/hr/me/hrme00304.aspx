<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Popup Other Checking</title>
</head>
<script>
    var v_language = "<%=Session("SESSION_LANG")%>";
    var c_work_dt = 3;
    var c_time_in = 4;
    var c_meal_qty = 6;

function BodyInit() {
    idGrid.GetGridControl().ScrollTrack = true;
    if (v_language != "ENG")
        System.Translate(document);
    idemp_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    <%=CtlLib.SetGridColumnComboFormat("idGrid", 5, "select code,CODE_NM from vhr_hr_code where id='HR0191' order by code")%>;
    idGrid.GetGridControl().ColEditMask(c_time_in) = "99:99";
}
function Set_Enable(n) {
    ibtnSelect.SetEnable(n);
    chkSelect.SetEnable(n);
    ibtnSelectAll.SetEnable(n);
}

function OnDataReceive(obj) {
    if (obj.id == "datchrm00010_04_popup") {
        if (idGrid.rows > 1)
            //Set_Enable();
        idRecord.text = idGrid.rows - 1 + " Records.";
    }

}

function CheckNumber()
{
    var ctrl = idGrid.GetGridControl();
    var irow = ctrl.rows;
    var ival;

    if (irow == 1)
        return false;

    for(var i = 1; i < irow; i++)
    {
        ival = idGrid.GetGridData(i,c_meal_qty);
        if (isNaN(ival))
        {
            alert("Please enter is number at col meal qty and row " + i);
            return false;
        }
    }

    return true;
}

//--------------------------------------------------

function OnClickBtn(obj)
{
    switch (obj)
    {
        case 'search':
            datchrm00010_04_popup.Call("SELECT");
            break;

        case 'addnew':
            idGrid.AddRow();
            idGrid.SetGridText(idGrid.rows - 1, c_work_dt, dtFromDT.value);
            break;

        case 'save':
            if (confirm("Do you want to save? \n Bạn muốn lưu không?"))
            {
                if (CheckNumber())
                    datchrm00010_04_popup.Call();
            }
            
            break;

        case 'delete':
            if (confirm("Delete it?\nBạn muốn xóa?")) {
                idGrid.DeleteRow();
                datchrm00010_04_popup.Call();
            }
            break;

        case 'close':
            this.close();
            break;
    }

}

function On_AfterEdit() {
    var tmpIN, tmpDT, temp;
    cIdx = event.col;

    if (cIdx == c_time_in) {
        tmpIN = idGrid.GetGridData(event.row, cIdx)
        if (tmpIN.length == 0) {
            idGrid.SetGridText(event.row, cIdx, "")
            //return;
        }
        if ((tmpIN.length != 4) && (tmpIN.length != "")) {
            alert("Input In time is not correct type.(type: hh:mm)\nKiểu giờ in nhập không đúng")
            idGrid.SetGridText(event.row, cIdx, '')
            return;
        }
        if ((Number(tmpIN.substr(0, 2)) >= 24) || (Number(tmpIN.substr(0, 2)) < 0)) {
            alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiểu giờ in phải >=00 và <=23")
            idGrid.SetGridText(event.row, cIdx, '')
            return;
        }
        if ((Number(tmpIN.substr(2, 2)) >= 60) || (Number(tmpIN.substr(2, 2)) < 0)) {
            alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiểu phút phải >=00 và <=59")
            idGrid.SetGridText(event.row, cIdx, '')
            return;
        }
        if (tmpIN.length > 0) {
            tmpIN = tmpIN.substr(0, 2) + ":" + tmpIN.substr(2, 2)
            idGrid.SetGridText(event.row, cIdx, tmpIN)
        }

    }

}
</script>

<body>
<!------------main control---------------------->

<gw:data id="datchrm00010_04_popup" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7" function="dorco2.HR_sel_chrm00010_04" procedure="dorco2.HR_upd_chrm00010_04"> 
                <input bind="idGrid" >
                    <input bind="dtFromDT" />
                    <input bind="dtToDT" />
                    <input bind="idSearch" />
                    <input bind="idtxtTmp" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
	    <td>
	        <table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
		            <td align=right colspan=2 style="width:10%" >Work Date</td>
		            <td align=right colspan=3 style="width:15%"><gw:datebox id="dtFromDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" /></td>
                    <td align=center style="width:3%">~</td>
                    <td align=left colspan=3 style="width:15%"><gw:datebox id="dtToDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" /></td>
		            <td align=right colspan=2 style="width:10%">Search by</td>
		            <td align=left colspan=3 style="width:15%"><gw:list  id="idSearch" value="1" styles="width:98%" onChange="">
                                            <data>|1|Employee ID|2|Employee Name</data></gw:list></td>
		            <td align=left colspan=3 style="width:15%"><gw:textbox id="idtxtTmp" maxlen = "50" styles="width:90%" onenterkey="OnClickBtn('search')" /></td>
		            <td align=right style="width:3%"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnClickBtn('search')" /></td>
		            <td align=right style="width:3%"><gw:imgBtn id="ibtnAdd" img="new"   alt="Select All"  onclick="OnClickBtn('addnew')"/></td>
                    <td align=right style="width:3%"><gw:imgBtn id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnClickBtn('save')" /></td>
                    <td align=right style="width:3%"><gw:imgBtn id="ibtnDelete" alt="Delete" img="delete" text="Delete" onclick="OnClickBtn('delete')" /></td>
                    <td align=right style="width:3%"><gw:icon id="icoClose" img="in" text="Close" onclick="OnClickBtn('close')" /></td>
                </tr>	
                <tr style="height:6%;border:0">	
                    <td align=left colspan=17 style="width:70%" ></td>                   
		            <td align=right colspan=3 style="width:30%"><gw:label id="idRecord" text="0 record(s)" styles="width:100%;color:red" ></gw:label></td>
                </tr>	
	        </table>
	        <table id="tblMain" style="width:100%;height:88%" border=1 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td id="tdMaster" style="width:100%">
	                    <gw:grid   
				        id="idGrid"  
				        header="_pk|Employee ID|Full Name|Work Date|Time In|Meal Times|Meal Qty|Remark"   
				        format="0|0|0|4|0|2|-0|0"  
				        aligns="0|0|0|0|1|0|0|0"  
				        defaults="||||||||"  
				        editcol="0|1|1|1|1|1|1|1"  
				        widths="0|2000|3000|1500|1000|2000|1000|3000"  
				        styles="width:100%; height:100% "   
				        sorting="T"   
                        onafteredit="On_AfterEdit()"
				        oncellclick     = ""/>
	                </td>
	            </tr>
	        </table>
	    </td>
	</tr>
</table>

   <gw:textbox id="idemp_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>

</body>
</html>

