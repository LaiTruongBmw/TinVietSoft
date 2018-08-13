<!-- #include file="../../../system/lib/form.inc"  -->
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
<%  ESysLib.SetUser("crm")%>
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
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM comm.TCO_company  where del_if=0")%>";   
    lstCompany.SetDataText(data);
    dat_jabs00020_sea.Call("SELECT");
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
    	imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else{
    	left.style.display="";
    	imgArrow.status = "expand";
		left.style.width="20%";
   		right.style.width="80%";
    	imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}
//======================================================================
function OnClick(obj){
    switch(obj)
    {
        case "ibtnInsert":
            grdContent.AddRow();
            grdContent.SetGridText(grdContent.rows-1,1,grdContent.rows-1);
            grdContent.SetGridText(grdContent.rows-1,16,lstCompany.GetData());
        break;
        case "ibtnUpdate":
            if(CheckData())
                dat_jabs00020_sel.Call();
        break;
        case "ibtnDelete":
            if(grdContent.rows > 1){
                if(confirm("Are you sure to delete!"))
                    grdContent.DeleteRow();
            } else alert("No data for delete");
        break;
        case "ibtnSearch":
            dat_jabs00020_sea.Call("SELECT");
        break;
        case "grdContent":
            var cl = event.col;
            var fpath, object;
            if(cl == 7 || cl == 8){
                //fpath = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +  lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                fpath = System.RootURL + "/form/ja/bs/jabs00020_popup1.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +  lstCompany.GetData() + '&dsqlid=CRM.sp_sel_jabs00020_popup1&col_code=' + "Cost Center Code" + '&col_nm=' + "Cost Center Name";
                object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes'); 
                if (object != null){
                    grdContent.SetGridText(grdContent.row,6,object[2]);
                    grdContent.SetGridText(grdContent.row,7,object[0] + ' - ' + object[1]);
                    grdContent.SetGridText(grdContent.row,8,object[3] + ' - ' + object[4]);
                }
            }
            else if (cl == 10){
                fpath = System.RootURL + "/form/ja/bs/jabs00020_popup2.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=CRM.sp_sel_jabs00020_popup2";
                object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes'); 
                
                if (object != null){
                    grdContent.SetGridText(grdContent.row,9,object[0]);
                    grdContent.SetGridText(grdContent.row,10,object[2]+ ' - ' + object[3]);
                }
            }else if (cl == 12){
                fpath = System.RootURL + "/form/ja/bs/jabs00020_popup2.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=CRM.sp_sel_jabs00020_popup2";
                object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes'); 
                
                if (object != null){
                    grdContent.SetGridText(grdContent.row,11,object[0]);
                    grdContent.SetGridText(grdContent.row,12,object[2]+ ' - ' + object[3]);
                }
            }else if (cl == 14){
                fpath = System.RootURL + "/form/ja/bs/jabs00020_popup2.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=CRM.sp_sel_jabs00020_popup2";
                object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes'); 
                
                if (object != null){
                    grdContent.SetGridText(grdContent.row,13,object[0]);
                    grdContent.SetGridText(grdContent.row,14,object[2]+ ' - ' + object[3]);
                }
            }else return false;
        break;
    }
}
//======================================================================
function CheckData()
{
    for(var i=1;i<grdContent.rows;i++){
        if(grdContent.GetGridData(i,2) == ""){alert("Please input 'Item code' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,3) == ""){alert("Please input 'Item name' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,6) == ""){alert("Please choose 'PL name' or 'PLC name' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,9) == ""){alert("Please choose 'Ac name' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,11) == ""){alert("Please choose 'VAT Account' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,13) == ""){alert("Please choose 'Cash Account' -> No: "+ i);return false;}
        if(grdContent.GetGridData(i,16) == ""){grdContent.SetGridText(i,12,lstCompany.GetData());}
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
<gw:data id="dat_jabs00020_sea"> 
    <xml> 
        <dso id="1" type="grid" function="crm.sp_sel_jabs00020_item" > 
            <input  >
                <input bind="txtItem"/>
                <input bind="lstCompany"/>
            </input>
            <output bind="grdContent" /> 
        </dso> 
    </xml> 
</gw:data>
<!----------------------------------------------------------------------------------------------->
<gw:data id="dat_jabs00020_sel"  onreceive="OnDataReceive"> 
    <xml> 
        <dso  type="grid"   parameter="0,2,3,4,5,6,9,11,13,15,16" function="crm.sp_sel_jabs00020_pk" procedure="crm.sp_upd_jabs00020"> 
            <input bind="idgrid">
                <input bind="txtMasterPK" />
                <input bind="lstCompany"/>
            </input> 
            <output bind="grdContent"></output>
        </dso> 
    </xml> 
</gw:data>
<!--------------------------------------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand; position: absolute; left: 3; top: 7;" onclick="OnClick('imgArrow')" />
<table border="0" style="width: 100%; height: 100%; background-color:#CCCCCC" cellpadding="0" cellspacing="0">
	<tr>
        <td style="width:100%;background:#f7f8fc;padding:5px 5px 5px 15px;" id="right" valign="top" align="center">
            <fieldset style="padding: 2; width: 100%; height: 5%">
                <table style="width:100%">
                    <tr>
                        <td style="width:25%"></td>
                        <td align="right"  style="width:7%">Company</td>
                        <td align="left" style="width:18%"><gw:list id="lstCompany" styles="width:100%;" onchange="OnClick('ibtnSearch');" /></td>
                        <td align="right"  style="width:7%">Item</td>
                        <td style="width:18%"><gw:textbox id="txtItem" styles='width:100%' onenterkey="OnClick('ibtnSearch');" /></td>
                        <td><gw:imgbtn id="ibtnSearch" img="search" width="100%"    alt="search"    onclick="OnClick('ibtnSearch');"    /></td>
                        <td><gw:imgbtn id="ibtnInsert" img="new"    width="100%"    alt="new"       onclick="OnClick('ibtnInsert');"    /></td>
                        <td><gw:imgbtn id="ibtnUpdate" img="save"   width="100%"    alt="save"      onclick="OnClick('ibtnUpdate');"    /></td>
                        <td><gw:imgbtn id="ibtnDelete" img="delete" width="100%"    alt="report"    onclick="OnClick('ibtnDelete');"    /></td>
                        <td style="width:25%"></td>
                    </tr>
                </table>
            </fieldset>
            <table style="width:100%;height:95%">
                <tr>
                    <td>
                        <gw:grid id="grdContent" header="_pk|No|Item code|Item name|_Item lname|_Item fname|_tac_abplcenter_pk|Cost Center|Biz Center|_tac_abacctcode_pk|Account Name|_tac_abacctcode_vat_pk|VAT Account|_tac_abacctcode_amt_pk|Cash Account|Active|_p_tco_company_pk"
                            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0" 
                            aligns  ="0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0" 
                            defaults="||||||||||||||||" 
                            editcol ="0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0"
                            widths="0|800|1100|1500|1500|1500|0|2900|2900|0|2900|0|2900|0|2900|500|0" 
                            styles="width:100%; height:100%"
                            sorting="T"
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