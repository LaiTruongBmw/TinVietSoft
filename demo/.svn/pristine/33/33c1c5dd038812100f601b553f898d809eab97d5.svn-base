<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
    var l_formtype =  "<%=Request.querystring("p_formtype")%>"; 
    txt_formtype.text = l_formtype;

	OnSearch();
}
function OnSearch()
{
    dsoDuplicate.Call("SELECT");
}
function SetColor(){
    var old_vl='', new_vl, ctrl, rows, idx = 0;
    ctrl = idGrid.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 0){
	    for (i = 1; i <= rows; i++){
	        new_vl = idGrid.GetGridData(i, 0);
	        if(old_vl == new_vl){ 
				if(idx%2 == 0){
						idGrid.SetCellBgColor(i, 0, i, 2, 0xFF3333);
						idGrid.SetCellBgColor(i-1, 0, i-1, 2, 0xFF3333);
				}else{
						idGrid.SetCellBgColor(i, 0, i, 2, 0x66FF99);
						idGrid.SetCellBgColor(i-1, 0, i-1, 2, 0x66FF99);
				}
			}else{idx++;}
	        old_vl = new_vl;
	    }
	}
}
</script>

<body>
    <gw:data id="dsoDuplicate" onreceive ="SetColor()"> 
        <xml> 
           <dso type="grid" function="ac_sel_60080020_popup6" > 
                  <input bind="idGrid" > 
                    <input bind="txt_formtype"/> 
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>

 <table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:100%">
      <!--0.Chk|1.User ID|2.Emp ID|3.Employee Name|4.Department|5.tco_bsuser_pk|TAC_ABTRTYPE_pk-->
	  <td height="80%">   
		<gw:grid   
		    id="idGrid"  
		    header="Account Code|Sequence|Formular"
		    format="0|0|0"
		    aligns="0|0|0"  
		    defaults="||"  
		    editcol="0|0|0"  
		    widths="2000|2000|2000"  
		    styles="width:100%; height:100%"   
		    sorting="T"   
		    />
        </td>
  </tr>
</table>
<gw:textbox id="txt_formtype"   text="" style="display: none" />
</body>
</html>
