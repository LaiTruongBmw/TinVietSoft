<!-- #include file="../../lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Grid Render</title>
</head>
<script>

function BodyInit(){
    
     
    txtGridID.text = "grdTest";
    txtWidth.text = 1000;
    txtaSQL.GetControl().focus();
}
function OnClear(){
 txtaSQL.SetDataText("");   
}
function OnRender(){
    var s=getGridHTML();
    //alert(s)
    if(s == ""){
        return;
    }
    divGrid.innerHTML=s;
    setTimeout("setDefaultGridData()",200);
        
    //alert(divGrid.innerHTML)
    
}
function setDefaultGridData(){
    for(var i=0;i<6;i++){
        grdTest.AddRow();
    }
    if(grdTest.rows > 5)
    {
        grdTest.SetGridText(1,0,"Format");
        grdTest.SetGridText(2,0,"Aligns");
        grdTest.SetGridText(3,0,"Check");
        grdTest.SetGridText(4,0,"Editcols");
        grdTest.SetGridText(5,0,"Widths");
		grdTest.SetGridText(6,0,"Params");
        
        for(var j=1;j<grdTest.cols-1;j++)
        {
            grdTest.SetGridText(1,j,"0");
            grdTest.SetGridText(2,j,"0");
            grdTest.SetGridText(4,j,"1");
            grdTest.SetGridText(5,j,txtWidth.text);
			grdTest.SetGridText(6,j,j-1);
        }
        
        grdTest.GetGridControl().FrozenCols = 1;
    }
}
function getGridHTML(){
    var sql = new String();
    var sTemp = new String();
    var sHTML = new String("");
    var arrCols = new Array();
    var arrTemp = new Array();
	var t = 1 ;
    var header="Header|",format="0|",aligns="0|",check="|",editcols="1|",widths="1000|",params="0,";
   
    sql = txtaSQL.GetData();
    
    if(Trim(sql) == ""){
        alert("Please input select sql.");
        return "";
    }
    else{
        sql = sql.toLowerCase();
        arrTemp = sql.split(" from ");
        if(arrTemp.length > 0){
            sTemp = arrTemp[0].toString();
            do{
                var x=sTemp.indexOf("(",1);
                var y=sTemp.indexOf(")",x);
                sTemp=sTemp.substr(0,x)+sTemp.substr(y,sTemp.length-x);
            }while(sTemp.indexOf("(",1)>-1)
            
            arrCols = sTemp.split(",");
        }
    }
    
    if(arrCols.length > 0)
	{
        for(var i=0;i<arrCols.length;i++)
		{
            sTemp = arrCols[i];
            sTemp=Trim(sTemp.toUpperCase());
            //in case of . 
            arrTemp = sTemp.split(".");
            if(arrTemp.length > 1){
                sTemp=arrTemp[1].toString();
                sTemp=Trim(sTemp.toUpperCase());
            }
            //in case of alias
            arrTemp = sTemp.split(" ");
            if(arrTemp.length > 1){
                sTemp=arrTemp[arrTemp.length-1].toString();
                sTemp=Trim(sTemp.toUpperCase());
            }
            
            header+=sTemp+"|";
            format+="0|";
            aligns+="0|";
            check+="|";
            editcols+="1|";
            widths+= txtWidth.text +"|";
        }
        header="header='"+header.substr(0,header.length-1)+"'";
        header=header.replace("\r\n","");
        format="format='"+format.substr(0,format.length-1)+"'";
        aligns="aligns='"+aligns.substr(0,aligns.length-1)+"'";
        check="check='"+check.substr(0,check.length-1)+"'";
        editcols="editcol='"+editcols.substr(0,editcols.length-1)+"'";
        widths="widths='"+widths.substr(0,widths.length-1)+"'";
        
        sHTML = "<gw:grid id='grdTest'\r\n" + header + "\r\n" + format + "\r\n" + aligns 
        + "\r\n" + check + "\r\n" + editcols + "\r\n" + widths + "\r\n" + "sorting='F'" 
        + "\r\n" + "styles='width:100%; height:140'" + "\r\n"+ "autosize='T' onafterresize='OnColResize()' />";
                    

    }
    else{
        alert("Invalid sql select.Please check your syntax sql.");
        return sHTML;
    }
    window.clipboardData.setData( "Text", sHTML);
    return sHTML;
}
function OnCopy(){
var sHTML="";
var header="",format="",aligns="",check="",editcols="",widths="";
var obj=grdTest.GetGridControl();

    for(var i=1;i<obj.cols-1;i++){
        header+=grdTest.GetGridData(0,i)+"|";
        format+=grdTest.GetGridData(1,i)+"|";
        aligns+=grdTest.GetGridData(2,i)+"|";
        check+=grdTest.GetGridData(3,i)+"|";
        editcols+=grdTest.GetGridData(4,i)+"|";
        widths+=grdTest.GetGridData(5,i)+"|";
    }
    header="header='"+header.substr(0,header.length-1)+"'";
    format="format='"+format.substr(0,format.length-1)+"'";
    aligns="aligns='"+aligns.substr(0,aligns.length-1)+"'";
    check="check='"+check.substr(0,check.length-1)+"'";
    editcols="editcol='"+editcols.substr(0,editcols.length-1)+"'";
    widths="widths='"+widths.substr(0,widths.length-1)+"'";
    var events = getEvents();
    sHTML = "<gw:grid id='" + txtGridID.text + "'\r\n" + header + "\r\n" + format + "\r\n" 
    + aligns + "\r\n" + check + "\r\n" + editcols + "\r\n" + widths + "\r\n"+ "sorting='T'" 
    + "\r\nautosize='T' \r\n" + "styles='width:100%; height:460'\r\n"+ events +"/>";
   
    window.clipboardData.setData( "Text", sHTML);
    //alert(sHTML)
}
function OnColResize(){
//alert(event.col)
    if(event.col <=0) return;
    var obj=grdTest.GetGridControl();
    grdTest.SetGridText(5,event.col,obj.ColWidth(event.col));
}
function getEvents(){
    var events="";
    
    if(chkClick.GetData() == "T"){
        events+="oncellclick='OnGridCellClick(this)'\r\n";
    }
    if(chkDblClick.GetData() == "T"){
        events+="oncelldblclick='OnGridCellDblClick(this)'\r\n";
    }
    if(chkSelChange.GetData() == "T"){
        events+="OnSelChange='OnGridSelChange(this)'\r\n";
    }
    if(chkBeforeEdit.GetData() == "T"){
        events+="onbeforeedit='OnGridCellBeforeEdit(this)'\r\n";
    }
    if(chkAfterEdit.GetData() == "T"){
        events+="onafteredit='OnGridCellAfterEdit(this)'\r\n";
    }
    if(chkBeforeSort.GetData() == "T"){
        events+="onbeforesort='OnGridBeforeSort(this)'\r\n";
    }
    if(chkAfterSort.GetData() == "T"){
        events+="onaftersort='OnGridAfterSort(this)'\r\n";
    }
    if(chkCellBtnClick.GetData() == "T"){
        events+="oncellbuttonclick='OnGridCellBtnClick(this)'\r\n";
    }
    return events;
}
function OnViewCode(){
    OnCopy();
    var url = System.RootURL + "/system/sde/ab/dlgPreview.aspx";
    System.OpenModal(url,700,500,"status:yes;resizable:yes");
}
</script>
<body>
    <table width="100%">
        <tr>
            <td width=20%>Input SQL Select</td>
            <td width=80% align=right><gw:icon id="icoClear" text="Clear" onclick="OnClear()" /></td>
        </tr>
        <tr>
            <td colspan=2>
                <gw:textarea id="txtaSQL" rows=10 styles="width:100%;" />
            </td>
        </tr>
    </table>
    <table width=100%>
        <tr>
            <td colspan=10><nobr>Format(0:String, 1:Number, 2:Combobox, 3:Checkbox, 4:Datebox); Align(0:Left, 1:Center, 2:Right); Edit(0:Not Editable, 1:Editable)</nobr></td>
        </tr>
        <tr>
            <td width=10%>Grid ID:</td>
            <td width=10%><gw:textbox id="txtGridID" styles="width:100%" /> </td>
            <td width=10%>Group_YN</td>
            <td width=5%><gw:checkbox id="chkGroup" defaultvalue="T|F" /></td>
            <td width=15%>Default width:</td>
            <td width=10%><gw:textbox id="txtWidth" styles="width:100%" /></td>
            <td width=25%></td>
            <td width=5%><gw:icon id="icoRender" text="Render" onclick="OnRender()" /></td>
            <td width=5%><gw:icon id="icoCopy" text="Copy" onclick="OnCopy()" /></td>
            <td width=5%><gw:icon id="icoViewCode" text="View code" onclick="OnViewCode()" /></td>
        </tr>
    </table>
    <table width=100%>
        <tr>
            <td><div id="divGrid"  style="width:100%; height:140"></div></td>
        </tr>
    </table>
    <table>
        <tr>
            <td width=8%>oncellclick</td>
            <td width=5%><gw:checkbox id="chkClick" defaultvalue="T|F" /></td>
            <td width=8%>oncelldblclick</td>
            <td width=5%><gw:checkbox id="chkDblClick" defaultvalue="T|F" /></td>
            <td width=8%>OnSelChange</td>
            <td width=5%><gw:checkbox id="chkSelChange" defaultvalue="T|F" /></td>
            <td width=8%>onbeforeedit</td>
            <td width=5%><gw:checkbox id="chkBeforeEdit" defaultvalue="T|F" /></td>
            <td width=8%>onafteredit</td>
            <td width=5%><gw:checkbox id="chkAfterEdit" defaultvalue="T|F" /></td>
            <td width=8%>onbeforesort</td>
            <td width=5%><gw:checkbox id="chkBeforeSort" defaultvalue="T|F" /></td>
            <td width=8%>onaftersort</td>
            <td width=5%><gw:checkbox id="chkAfterSort" defaultvalue="T|F" /></td>
            <td width=8%>oncellbuttonclick</td>
            <td width=5%><gw:checkbox id="chkCellBtnClick" defaultvalue="T|F" /></td>
        </tr>
    </table>
    
</body>
</html>

