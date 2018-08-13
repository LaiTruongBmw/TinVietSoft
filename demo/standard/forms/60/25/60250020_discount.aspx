<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Guest Check out</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var PK                      = 0,
    NO                      = 1,
    ITEM                    = 2,
    DISCOUNT                = 3,
    REASON                  = 4,
    PK_ROOM_ALLOCATE        = 5;

var ITEMEXIST = false;
function  BodyInit()
{   
  InitForm();
  var caller = dialogArguments;
  var arrDisInfo = caller.GetDiscountInfo('<%=Request.QueryString("idx") %>');
  InitData(arrDisInfo);
}
function InitForm(){
    txtRoomNo.SetReadOnly(true);
    txtMemberName.SetReadOnly(true);
}
function InitData(arr){
    var tmp = new Array();
    tmp = arr;
    
    txtPK.text          = tmp[0];
    txtRoomNo.text      = tmp[1];
	txtMemberName.text  = tmp[2];
    
    //grdDiscount.SetComboFormat(ITEM, "#10;ROOM FEE|#20;MINIBAR FEE|#30;LAUNDRY FEE|#40;F&B FEE|#50;BAR FEE|#60;TELEPHONE FEE|#70;KARAOKE FEE|#80;MASSAGE FEE|#90;SPA FEE|#100;OTHER FEE");
    var data;
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT' AND USE_YN = 'Y'")%>";
    grdDiscount.SetComboFormat(ITEM, data);
    
    data_htfo00040_discount.Call("SELECT");
}
function OnNew(){
    if(ITEMEXIST){alert('Item discount already exist!'); return false;}
    grdDiscount.AddRow();
    grdDiscount.SetGridText(grdDiscount.rows - 1, NO                    , grdDiscount.rows - 1);
    grdDiscount.SetGridText(grdDiscount.rows - 1, PK_ROOM_ALLOCATE      , txtPK.text);
    grdDiscount.SetGridText(grdDiscount.rows - 1, DISCOUNT              , 0);
}
function OnSave(){
    for(var idx = 1; idx < grdDiscount.rows; idx ++)
       if(grdDiscount.GetGridData(idx, ITEM) == ""){alert("Please choose discount item for row => " + idx + "!"); return false;}
    
    if(ITEMEXIST){alert('Item discount already exist!'); return false;}
    
    for(var idx = 1; idx < grdDiscount.rows; idx ++){
        if(isNaN(Number(grdDiscount.GetGridData(idx, DISCOUNT))) || Number(grdDiscount.GetGridData(idx, DISCOUNT)) == 0)
        {alert("Column discount amount unvalid for row => "+idx+"!");return false;}
        /*switch(grdDiscount.GetGridData(idx, ITEM)){
            case "10":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtRoomFee.text))
                    {alert("Discount amount more than room fees!");return false;}
            break;
            case "20":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtMinibarFee.text))
                    {alert("Discount amount more than minibar fee!");return false;}
            break;
            case "30":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtLaundryFee.text))
                    {alert("Discount amount more than laundry fee!");return false;}
            break;
            case "40":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtFNBFee.text))
                    {alert("Discount amount more than f&b fee!");return false;}
            break;
            case "50":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtBarFee.text))
                    {alert("Discount amount more than bar fee!");return false;}
            break;
            case "60":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtTelephoneFee.text))
                    {alert("Discount amount more than telephone fee!");return false;}
            break;
            case "70":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtKaraokeFee.text))
                    {alert("Discount amount more than karaoke fee!");return false;}
            break;
            case "50":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtMassageFee.text))
                    {alert("Discount amount more than massage fee!");return false;}
            break;
            case "50":
                if(Number(grdDiscount.GetGridData(idx, DISCOUNT)) > Number(txtSpaFee.text))
                    {alert("Discount amount more than spa fee!");return false;}
            break;
        }*/
    }
    data_htfo00040_discount.Call();
}
function OnDelete(obj){
    var ctrl = grdDiscount.GetGridControl();
	var row  = ctrl.row;
	if (row > 0 )
		if (confirm("Do you want item this row to delete?")){ 
			grdDiscount.DeleteRow();
			data_htfo00040_discount.Call();}
 }
function OnValid(){
    if(event.col == ITEM){
        ITEMEXIST = OnDataValid(event.row);
        if(ITEMEXIST){alert('Item discount already exist!'); return false;}
    }else{
        if(ITEMEXIST){alert('Item discount already exist!'); return false;}
        return true;
    }
    return true;
}
function OnDataValid(row){
    for(var idx = 1; idx < grdDiscount.rows; idx ++){
        if(idx == row){}
        else if(grdDiscount.GetGridData(idx, ITEM) == grdDiscount.GetGridData(row, ITEM))
                return true;
    }
    return false;
}
function OnDataReceive(obj){}
function OnReport()
{
		 url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00040_discount.rpt&procedure=CRM.sp_rpt_htfo00040_discount&parameter="+txtPK.text+","+txtMemberName.GetData()+","+txtRoomNo.GetData();   
         System.OpenTargetPage(url);  
}
</script>
<body>
    <gw:data id="data_htfo00040_discount" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5" function="st_ht_sel_60250020_discount" procedure="st_ht_upd_60250020_discount">
                <input>
                    <input bind="txtPK" />
                </input>
                <output bind="grdDiscount" />
            </dso>
        </xml>
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr valign="top" style="height: 2%">
            <td align="center" colspan="4">
                <table style="height: 100%; width: 100%">
                    <tr style="height:20px;">
                        <td valign="middle" align="right" style="padding-left:3px;padding-right:3px;width:15%">Room No</td>
                        <td style="width:35%"><gw:textbox id="txtRoomNo" styles="width:100%" /></td>
                        <td valign="middle" align="right" style="padding-left:3px;padding-right:3px;width:15%">Guest Name</td>
                        <td style="width:35%"><gw:textbox id="txtMemberName" styles="width:100%" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:20px">
            <td style="width: 88%"></td>
            <td style="width: 3%"><gw:imgbtn id="idBtnNew" img="new" alt="New" text="New" styles='width:100%' onclick="OnNew();" /></td>
            <td style="width: 3%"><gw:imgbtn id="idBtnDel" img="delete" alt="Delete" text="Delete" styles='width:100%' onclick="OnDelete();" /></td>
            <td style="width: 3%"><gw:imgbtn id="idBtnSave" img="save" alt="Save" text="Save" styles='width:100%' onclick="OnSave();" /></td>
            <td width="3%" align="right">
				<gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
			</td>	
        </tr>
        <tr>
            <td style="height:100%" colspan="4">
                <gw:grid id='grdDiscount' 
                    header  ='_pk|No#|Item Discount|Discount Amt(VND)|Reason|_PK_Room'
                    format  ='0|0|0|-0|0|0' 
                    aligns  ='0|1|0|0|0|0' 
                    editcol ='0|0|1|1|1|0'
                    check   ='|||0-|0|'
                    autosize='T' 
                    sorting ='T' 
                    styles  ='width:100%; height:100%'
                    onafteredit ="OnValid();"
                />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtPK" styles="width:100%; display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
