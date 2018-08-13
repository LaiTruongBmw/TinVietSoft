<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Vina Genuwin</title>
    <style type="text/css">
		.bodyscrollbar{
		scrollbar-face-color: #ffffff;
		scrollbar-shadow-color: #A8A8A8;
		scrollbar-base-color : #ffffff;
		scrollbar-highlight-color: #A8A8A8;
		scrollbar-3dlight-color: #ffffff;
		scrollbar-darkshadow-color: #ffffff;
		scrollbar-track-color: #f8f8f8;
		scrollbar-arrow-color: #3366CC}
	</style>
</head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{   
	OnInitForm();
	OnInitData();
}
//======================================================================
function OnInitForm(){
	imgArrow.style.display = "none";
}
//======================================================================
function OnInitData(){
    var data="";
    data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
    lstCompany.SetDataText(data);
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT'" )%>"; 
	grdContent.SetComboFormat(1,data);
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT'") %>|ALL|Select All";	
	lstLocation.SetDataText(data);
	lstLocation.value="ALL";
    dat_jabs00020_sel.Call("SELECT");
}
//======================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 
    
    if(imgArrow.status == "expand"){
    	left.style.display="none";
    	imgArrow.status = "collapse";
		left.style.width="0%";
    	right.style.width="100%";
    	imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else{
    	left.style.display="";
    	imgArrow.status = "expand";
		left.style.width="20%";
   		right.style.width="80%";
    	imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
}
//======================================================================
function OnClick(obj){
    switch(obj)
    {
        case "ibtnInsert":
            grdContent.AddRow();
            grdContent.SetGridText(grdContent.rows-1,14,-1);
            grdContent.SetGridText(grdContent.rows-1,15,lstCompany.GetData());
        break;
        case "ibtnUpdate":
            if(CheckData())
            {
                dat_jabs00020_sel.Call(); 
            }
        break;
        case "ibtnDelete":
            if(grdContent.rows > 1){
                if(confirm("Are you sure to delete!"))
                    grdContent.DeleteRow();
                    dat_jabs00020_sel.Call();
            } else alert("No data for delete");
        break;
        case "ibtnSearch":
            dat_jabs00020_sel.Call("SELECT");
        break;
        case "grdContent":
            var cl = event.col;
            var fpath, object;
            if(cl == 4 || cl == 5){
                //fpath = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +  lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                fpath = System.RootURL + "/form/ja/bs/jabs00020_popup1.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +  lstCompany.GetData() + '&dsqlid=CRM.sp_sel_jabs00020_popup1&col_code=' + "Cost Center Code" + '&col_nm=' + "Cost Center Name";
                object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes'); 
                if (object != null){
                    grdContent.SetGridText(grdContent.row,3,object[2]);
                    grdContent.SetGridText(grdContent.row,4,object[0] + ' - ' + object[1]);
                    grdContent.SetGridText(grdContent.row,5,object[3] + ' - ' + object[4]);
                }
            }
            
        break;
    }
}
//======================================================================
function CheckData()
{
    for(var i=1;i<grdContent.rows;i++){
        if(grdContent.GetGridData(i,1) == ""){alert("Please input 'Item code' -> row: "+ i);return false;}
        if(grdContent.GetGridData(i,3) == ""){alert("Please choose 'Cost Center' or 'Biz Center' -> row: "+ i);return false;}
        if(grdContent.GetGridData(i,7) == ""){grdContent.SetGridText(i,7,lstCompany.GetData());}
    }
    return true;
}
//======================================================================
function CheckNum()
{
if (isNaN(String.fromCharCode(event.keyCode)))
        event.keyCode = "";
}
//======================================================================
function OnDataReceive(obj)
{
//    switch(obj.id)
//    {
//        case "dat_jabs00020_sel":
//            alert("fyzas");
//            dat_jabs00020_sea.Call("SELECT");
//        break;
//    }
}
</script>
<body>
<!----------------------------------------------------------------------------------------------->
<gw:data id="dat_jabs00020_sel"  onreceive="OnDataReceive"> 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6,7" function="ht_sel_60290050_pk" procedure="ht_upd_60290050_pk"> 
            <input bind="grdContent">
                <input bind="lstLocation" />
                <input bind="lstCompany"/>
            </input> 
            <output bind="grdContent"></output>
        </dso> 
    </xml> 
</gw:data>
<!--------------------------------------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand; position: absolute; left: 3; top: 7;" onclick="OnClick('imgArrow')" />
<table border="0" style="width: 100%; height: 100%; background-color:#CCCCCC" cellpadding="0" cellspacing="0">
	<tr>
        <td style="width:100%;background:#f7f8fc;padding:5px 5px 5px 15px;" id="right" valign="top" align="center">
            <fieldset style="padding: 2; width: 100%; height: 5%">
                <table style="width:100%">
                    <tr>
                        <td  style="width:12%">Company</td>
                        <td align="left" style="width:28%"><gw:list id="lstCompany" styles="width:100%;" onchange="OnClick('ibtnSearch');" /></td>
                        <td  style="width:7%">Location</td>
                        <td style="width:3%"></td>
                        <td style="width:38%"><gw:list id="lstLocation" styles="width:100%" onchange="OnClick('ibtnSearch')" /></td>
                        <td style="width:12%"></td>
                        <td><gw:imgbtn id="ibtnSearch" img="search" width="100%"    alt="search"    onclick="OnClick('ibtnSearch');"    /></td>
                        <td><gw:imgbtn id="ibtnInsert" img="new"    width="100%"    alt="new"       onclick="OnClick('ibtnInsert');"    /></td>
                        <td><gw:imgbtn id="ibtnUpdate" img="save"   width="100%"    alt="save"      onclick="OnClick('ibtnUpdate');"    /></td>
                        <td><gw:imgbtn id="ibtnDelete" img="delete" width="100%"    alt="report"    onclick="OnClick('ibtnDelete');"    /></td>
                    </tr>
                </table>
            </fieldset>
            <table style="width:100%;height:95%">
                <tr>
                    <td>
                        <gw:grid id="grdContent" header="_pk|Location Name|Location Code|_TAC_ABPLCENTER_PK|Cost Center|Biz Center|Active|_p_tco_company_pk"
                            format  ="0|0|0|0|0|0|3|0" 
                            aligns  ="0|0|0|0|0|0|0|0" 
                            styles="width:100%; height:437"
                            sorting="T"
                            autosize="T"
                            oncelldblclick="OnClick('grdContent');";
                            />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" style="display:none" />
<!--------------------------------------------------------------------------------------->
</body>
</html>