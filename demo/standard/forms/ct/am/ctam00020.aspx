﻿<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Menu Register</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag = "";
var comp_pk = "<%=Session("COMPANY_PK")%>";
var emp_pk = "<%=Session("EMPLOYEE_PK")%>";
var emp_name = "<%=Session("USER_NAME")%>";
var GS_MASTER_PK = 0,
    GS_SUPPLIER_PK = 1,
    GS_BRANCH_PK = 2;

//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_ITEM_PK          = 1,
    G1_UOM_CD		    = 2,
    G1_BOM_PK	        = 3,
    G1_GRP_PK		    = 4,
    G1_SEQ			    = 5,
    G1_ITEM_CD		    = 6,
    G1_ITEM_NM	        = 7,
    G1_UOM_NM		    = 8,
    G1_USE_YN           = 9,
    G1_CRT_BY           = 10,
    G1_CRT_DT           = 11,
	G1_MOD_BY           = 12,
	G1_MOD_DT			= 13,
	G1_BOM_NM			= 14,
	G1_MASTER_PK		= 15
	;
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session   
    txtCompanyPK.text = comp_pk;
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = emp_pk;
	txtLang.text = "<%=Session("SESSION_LANG")%>";

    if(txtCompanyPK.text == ""){
        alert("Tài khoản của bạn chưa được kết nối với công ty. \r\n Vui lòng liên hệ đội tư vấn để được hỗ trợ.");
        return;
    }
	
	txtSupplierID.SetEnable(false);
	txtSupplierName.SetEnable(false);
    txtStaffId.SetEnable(false);
    txtStaffName.SetEnable(false);
    
    BindingDataList();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
    DAT_CTBS00010_0.Call('SELECT');
 }

 function OnPopup(obj_type){
    var obj;
    var strcom = txtCompanyPK.text; 
    var param = "comp_pk=" + strcom + "&user_pk=" + txtUser_PK.text  + "&emp_pk=" + txtEmpPK.text + "&lang=" + txtLang.text;
    var fpath = System.RootURL;
	var arrTemp;
	var lNewRow, seqInit;
    switch(obj_type){
        case "SUPPLIERN":
            fpath += "/standard/forms/ct/bs/ctbs00011.aspx?" + param + "&mt_cd=LGGS0106&dt_cd=10&getdt=N";
            obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:30;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
            if ( obj != null ){
                //do some thing;
            }
        break;
		case "SUPPLIERY":
            fpath += "/standard/forms/ct/bs/ctbs00011.aspx?" + param + "&mt_cd=LGGS0106&dt_cd=10&getdt=Y";
            obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:30;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
            if ( obj != null ){
                txtSupplierPK.text = obj[0][0];
				txtSupplierID.text = obj[0][2];
				txtSupplierName.text = obj[0][3];
            }
        break;
		case "BRANCH":
            fpath += "/standard/forms/ct/bs/ctbs00011.aspx?" + param + "&mt_cd=LGGS0106&dt_cd=20&getdt=N";
            obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:30;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
            if ( obj != null ){
                //do some thing;
            }
        break;
		case 'CHARGER':
            fpath += '/standard/forms/co/lg/colg00100.aspx';
            obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:30;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
            if ( obj != null ){
                txtStaffName.text = obj[2];
				txtStaffId.text = obj[1];
                txtEmpPK.text   = obj[0];
            }
        break;
		case 'FREEITEM_MC':
			fpath += "/standard/forms/ct/bs/ctbs00012.aspx?" + param + "&mt_cd=MN&dt_cd=" + txtFreeItemCD_MC.text + "&getdt=Y";
			obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if ( obj != null ){
				for( var i=0; i < obj.length; i++)	  
				{
					seqInit = OnMaxSeq(grdMonChinh, G1_SEQ);
					seqInit = parseInt(seqInit) + 1;
					
					arrTemp = obj[i];
					if(!OnExits(grdMonChinh, G1_ITEM_PK, arrTemp[0])){
						grdMonChinh.AddRow();
						lNewRow = grdMonChinh.rows - 1;
						
						grdMonChinh.SetGridText(lNewRow, G1_ITEM_PK, arrTemp[0]); //ITEM PK
						grdMonChinh.SetGridText(lNewRow, G1_UOM_CD, arrTemp[6]); //UOM_CD
						grdMonChinh.SetGridText(lNewRow, G1_BOM_PK, ''); //BOM_PK
						grdMonChinh.SetGridText(lNewRow, G1_GRP_PK, arrTemp[7]); //GRP_PK
						grdMonChinh.SetGridText(lNewRow, G1_SEQ, seqInit); //GRP_PK
						grdMonChinh.SetGridText(lNewRow, G1_ITEM_CD, arrTemp[2]); //ITEM_CD
						grdMonChinh.SetGridText(lNewRow, G1_ITEM_NM, arrTemp[3]); //ITEM_NM
						grdMonChinh.SetGridText(lNewRow, G1_UOM_NM, arrTemp[4]); //UOM_NM
						grdMonChinh.SetGridText(lNewRow, G1_USE_YN, -1); //USE_YN
						grdMonChinh.SetGridText(lNewRow, G1_BOM_NM, ''); //BOM_NM
					}
				}
            }
		break;
		case 'FREEITEM_MP':
			fpath += "/standard/forms/ct/bs/ctbs00012.aspx?" + param + "&mt_cd=MN&dt_cd=" + txtFreeItemCD_MP.text + "&getdt=Y";
			obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if ( obj != null ){
				for( var i=0; i < obj.length; i++)	  
				{
					seqInit = OnMaxSeq(grdMonPhu, G1_SEQ);
					seqInit = parseInt(seqInit) + 1;
					
					arrTemp = obj[i];
					if(!OnExits(grdMonPhu, G1_ITEM_PK, arrTemp[0])){
						grdMonPhu.AddRow();
						lNewRow = grdMonPhu.rows - 1;
						
						grdMonPhu.SetGridText(lNewRow, G1_ITEM_PK, arrTemp[0]); //ITEM PK
						grdMonPhu.SetGridText(lNewRow, G1_UOM_CD, arrTemp[6]); //UOM_CD
						grdMonPhu.SetGridText(lNewRow, G1_BOM_PK, ''); //BOM_PK
						grdMonPhu.SetGridText(lNewRow, G1_GRP_PK, arrTemp[7]); //GRP_PK
						grdMonPhu.SetGridText(lNewRow, G1_SEQ, seqInit); //GRP_PK
						grdMonPhu.SetGridText(lNewRow, G1_ITEM_CD, arrTemp[2]); //ITEM_CD
						grdMonPhu.SetGridText(lNewRow, G1_ITEM_NM, arrTemp[3]); //ITEM_NM
						grdMonPhu.SetGridText(lNewRow, G1_UOM_NM, arrTemp[4]); //UOM_NM
						grdMonPhu.SetGridText(lNewRow, G1_USE_YN, -1); //USE_YN
						grdMonPhu.SetGridText(lNewRow, G1_BOM_NM, ''); //BOM_NM
					}
				}
            }
		break;
		case 'FREEITEM_MR':
			fpath += "/standard/forms/ct/bs/ctbs00012.aspx?" + param + "&mt_cd=MN&dt_cd=" + txtFreeItemCD_MR.text + "&getdt=Y";
			obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if ( obj != null ){
				for( var i=0; i < obj.length; i++)	  
				{
					seqInit = OnMaxSeq(grdMonRau, G1_SEQ);
					seqInit = parseInt(seqInit) + 1;
					
					arrTemp = obj[i];
					if(!OnExits(grdMonRau, G1_ITEM_PK, arrTemp[0])){
						grdMonRau.AddRow();
						lNewRow = grdMonRau.rows - 1;
						
						grdMonRau.SetGridText(lNewRow, G1_ITEM_PK, arrTemp[0]); //ITEM PK
						grdMonRau.SetGridText(lNewRow, G1_UOM_CD, arrTemp[6]); //UOM_CD
						grdMonRau.SetGridText(lNewRow, G1_BOM_PK, ''); //BOM_PK
						grdMonRau.SetGridText(lNewRow, G1_GRP_PK, arrTemp[7]); //GRP_PK
						grdMonRau.SetGridText(lNewRow, G1_SEQ, seqInit); //GRP_PK
						grdMonRau.SetGridText(lNewRow, G1_ITEM_CD, arrTemp[2]); //ITEM_CD
						grdMonRau.SetGridText(lNewRow, G1_ITEM_NM, arrTemp[3]); //ITEM_NM
						grdMonRau.SetGridText(lNewRow, G1_UOM_NM, arrTemp[4]); //UOM_NM
						grdMonRau.SetGridText(lNewRow, G1_USE_YN, -1); //USE_YN
						grdMonRau.SetGridText(lNewRow, G1_BOM_NM, ''); //BOM_NM
					}
				}
            }
		break;
		case 'FREEITEM_CA':
			fpath += "/standard/forms/ct/bs/ctbs00012.aspx?" + param + "&mt_cd=MN&dt_cd=" + txtFreeItemCD_CA.text + "&getdt=Y";
			obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if ( obj != null ){
				for( var i=0; i < obj.length; i++)	  
				{
					seqInit = OnMaxSeq(grdMonCanh, G1_SEQ);
					seqInit = parseInt(seqInit) + 1;
					
					arrTemp = obj[i];
					if(!OnExits(grdMonCanh, G1_ITEM_PK, arrTemp[0])){
						grdMonCanh.AddRow();
						lNewRow = grdMonCanh.rows - 1;
						
						grdMonCanh.SetGridText(lNewRow, G1_ITEM_PK, arrTemp[0]); //ITEM PK
						grdMonCanh.SetGridText(lNewRow, G1_UOM_CD, arrTemp[6]); //UOM_CD
						grdMonCanh.SetGridText(lNewRow, G1_BOM_PK, ''); //BOM_PK
						grdMonCanh.SetGridText(lNewRow, G1_GRP_PK, arrTemp[7]); //GRP_PK
						grdMonCanh.SetGridText(lNewRow, G1_SEQ, seqInit); //GRP_PK
						grdMonCanh.SetGridText(lNewRow, G1_ITEM_CD, arrTemp[2]); //ITEM_CD
						grdMonCanh.SetGridText(lNewRow, G1_ITEM_NM, arrTemp[3]); //ITEM_NM
						grdMonCanh.SetGridText(lNewRow, G1_UOM_NM, arrTemp[4]); //UOM_NM
						grdMonCanh.SetGridText(lNewRow, G1_USE_YN, -1); //USE_YN
						grdMonCanh.SetGridText(lNewRow, G1_BOM_NM, ''); //BOM_NM
					}
				}
            }
		break;
		case "NVL":
			fpath += "/standard/forms/ct/bs/ctbs00014.aspx?" + param + "&mt_cd=NVL&dt_cd=ALL&getdt=N&v=0";
			obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:40;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if ( obj != null ){
				//do something
            }
		break;
		case "BOM_MC":
			if (grdMonChinh.row > 0 && grdMonChinh.col == G1_BOM_NM){
				fpath += "/standard/forms/ct/bs/ctbs00013.aspx?" + param + "&it_pk=" + grdMonChinh.GetGridData(grdMonChinh.row, G1_ITEM_PK) + "&mt_cd=NVL&dt_cd=ALL&bom_pk=" + grdMonChinh.GetGridData(grdMonChinh.row, G1_BOM_PK);
				obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:45;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
				if ( obj != null ){
					for( var i=0; i < obj.length; i++){
						arrTemp = obj[i];
						grdMonChinh.SetGridText(grdMonChinh.row, G1_BOM_PK, arrTemp[0]);
						grdMonChinh.SetGridText(grdMonChinh.row, G1_BOM_NM, arrTemp[1]);
					}
				}
			}
		break;
		case "BOM_MP":
			if (grdMonPhu.row > 0 && grdMonPhu.col == G1_BOM_NM){
				fpath += "/standard/forms/ct/bs/ctbs00013.aspx?" + param + "&it_pk=" + grdMonPhu.GetGridData(grdMonPhu.row, G1_ITEM_PK) + "&mt_cd=NVL&dt_cd=ALL&bom_pk=" + grdMonPhu.GetGridData(grdMonPhu.row, G1_BOM_PK);
				obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:45;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
				if ( obj != null ){
					for( var i=0; i < obj.length; i++){
						arrTemp = obj[i];
						grdMonPhu.SetGridText(grdMonPhu.row, G1_BOM_PK, arrTemp[0]);
						grdMonPhu.SetGridText(grdMonPhu.row, G1_BOM_NM, arrTemp[1]);
					}
				}
			}
		break;
		case "BOM_MR":
			if (grdMonRau.row > 0 && grdMonRau.col == G1_BOM_NM){
				fpath += "/standard/forms/ct/bs/ctbs00013.aspx?" + param + "&it_pk=" + grdMonRau.GetGridData(grdMonRau.row, G1_ITEM_PK) + "&mt_cd=NVL&dt_cd=ALL&bom_pk=" + grdMonRau.GetGridData(grdMonRau.row, G1_BOM_PK);
				obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:45;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
				if ( obj != null ){
					for( var i=0; i < obj.length; i++){
						arrTemp = obj[i];
						grdMonRau.SetGridText(grdMonRau.row, G1_BOM_PK, arrTemp[0]);
						grdMonRau.SetGridText(grdMonRau.row, G1_BOM_NM, arrTemp[1]);
					}
				}
			}
		break;
		case "BOM_CA":
			if (grdMonCanh.row > 0 && grdMonCanh.col == G1_BOM_NM){
				fpath += "/standard/forms/ct/bs/ctbs00013.aspx?" + param + "&it_pk=" + grdMonCanh.GetGridData(grdMonCanh.row, G1_ITEM_PK) + "&mt_cd=NVL&dt_cd=ALL&bom_pk=" + grdMonCanh.GetGridData(grdMonCanh.row, G1_BOM_PK);
				obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:45;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
				if ( obj != null ){
					for( var i=0; i < obj.length; i++){
						arrTemp = obj[i];
						grdMonCanh.SetGridText(grdMonCanh.row, G1_BOM_PK, arrTemp[0]);
						grdMonCanh.SetGridText(grdMonCanh.row, G1_BOM_NM, arrTemp[1]);
					}
				}
			}
		break;
    }
 }

 function OnClick(obj_type){
    switch(obj_type){
        case "SAVE":
			if(OnValidation()){
                if(txtMasterPK.text != ""){
                    DAT_CTBS00010_1.StatusUpdate();
                    flag  = 'UPDATE';
                    DAT_CTBS00010_1.Call();
                }else{
                    DAT_CTBS00010_1.Call();
                }
            }
        break;
		case "SEARCH":
			DAT_CTBS00010_2.Call("SELECT");
		break;
		case "DELETE":
			if(txtMasterPK.text != ""){
				if(confirm("Bạn có muốn xóa dữ liệu?")){
					flag = "DELETE";
					DAT_CTBS00010_1.StatusDelete();
					DAT_CTBS00010_1.Call();
				}
			}
		break;
		case "DELETE_MC":
			if(confirm("Bạn có muốn xóa dữ liệu?"))
            {
                if ( grdMonChinh.GetGridData( grdMonChinh.row, G1_DETAIL_PK ) == '' )
                {
                    grdMonChinh.RemoveRow();
                }
                else
                {   
                    grdMonChinh.DeleteRow();
                }    
            }
		break;
		case "DELETE_MP":
			if(confirm("Bạn có muốn xóa dữ liệu?"))
            {
                if ( grdMonPhu.GetGridData( grdMonPhu.row, G1_DETAIL_PK ) == '' )
                {
                    grdMonPhu.RemoveRow();
                }
                else
                {   
                    grdMonPhu.DeleteRow();
                }    
            }
		break;
		case "DELETE_MR":
			if(confirm("Bạn có muốn xóa dữ liệu?"))
            {
                if ( grdMonRau.GetGridData( grdMonRau.row, G1_DETAIL_PK ) == '' )
                {
                    grdMonRau.RemoveRow();
                }
                else
                {   
                    grdMonRau.DeleteRow();
                }    
            }
		break;
		case "DELETE_CA":
			if(confirm("Bạn có muốn xóa dữ liệu?"))
            {
                if ( grdMonCanh.GetGridData( grdMonCanh.row, G1_DETAIL_PK ) == '' )
                {
                    grdMonCanh.RemoveRow();
                }
                else
                {   
                    grdMonCanh.DeleteRow();
                }    
            }
		break;
		case "MASTER":
			if(grdSearch.row > 0){
				flag = "SELECT";
				txtMasterPK.text = grdSearch.GetGridData(grdSearch.row, GS_MASTER_PK);
				DAT_CTBS00010_1.Call("SELECT");
			}
		break;
    }
 }
 
 function OnDataReceive(obj)
 {
	var L_MASTER_PK = "";
    switch(obj.id){
        case "DAT_CTBS00010_0":
            lstSBranch.SetDataText(txtReturnValue.text);
			lstBranch.SetDataText(txtReturnValue.text);
			txtReturnValue.text = "";
            OnInsert();
        break;
		case "DAT_CTBS00010_1":
			if(flag == 'DELETE'){
				OnInsert();
			}else{
				//Init Mon Chinh
				for (var i = 1; i < grdMonChinh.rows; i++)
				{
					if(grdMonChinh.GetGridData(i, G1_MASTER_PK) == ""){
						grdMonChinh.SetGridText(i, G1_MASTER_PK, txtMasterPK.text);
					}
				}
				
				//Init Mon Phu
				for (var i = 1; i < grdMonPhu.rows; i++)
				{
					if(grdMonPhu.GetGridData(i, G1_MASTER_PK) == ""){
						grdMonPhu.SetGridText(i, G1_MASTER_PK, txtMasterPK.text);
					}
				}
				
				//Init Mon Rau
				for (var i = 1; i < grdMonRau.rows; i++)
				{
					if(grdMonRau.GetGridData(i, G1_MASTER_PK) == ""){
						grdMonRau.SetGridText(i, G1_MASTER_PK, txtMasterPK.text);
					}
				}
				
				//Init Mon Canh
				for (var i = 1; i < grdMonCanh.rows; i++)
				{
					if(grdMonCanh.GetGridData(i, G1_MASTER_PK) == ""){
						grdMonCanh.SetGridText(i, G1_MASTER_PK, txtMasterPK.text);
					}
				}
				
				DAT_CTBS00010_3.Call();
			}
		break;
		case "DAT_CTBS00010_3":
			DAT_CTBS00010_4.Call();
		break;
		case "DAT_CTBS00010_4":
			DAT_CTBS00010_5.Call();
		break;
		case "DAT_CTBS00010_5":
			DAT_CTBS00010_6.Call();
		break;
		case "DAT_CTBS00010_6":
			flag == 'SELECT';
		break;
		case "DAT_CTBS00010_2":
			lbSRecords.text = grdSearch.rows - 1;
		break;
    }
 }
 
 function OnInsert(){
    DAT_CTBS00010_1.StatusInsert();
    flag  = 'INSERT';
    txtCompanyPK.text = comp_pk;
	txtEmpPK.text = emp_pk;
	txtStaffName.text = emp_name;
	chkActive.value = 'Y';
 }
 
 function OnMaxSeq(grd, cl_seq)
{
    var maxSeq = 0 ;
    if(grd.rows < 1)
    {
        return maxSeq;
    }
    else
    {
        for (var i = 1; i < grd.rows; i++)
        {
            if ( Number( grd.GetGridData(i,cl_seq) ) > maxSeq )
            {
                maxSeq = Number( grd.GetGridData(i,cl_seq) )
            }
        }
        return maxSeq;
    }
}

function OnValidation(){
    if(txtSupplierPK.text == ""){
        alert("Bạn chưa chọn nhà cung cấp"); 
        return false;
    }

    if(txtEmpPK.text == ""){
        alert("Bạn chưa chọn nhân viên"); 
        return false;
    }

    return true;
 }
 
 function OnExits(grd, cl_compare, data){
	return false;
	var flag = false;
	for (var i = 1; i < grd.rows; i++)
	{
		if(grd.GetGridData(i, cl_compare) == data){
			flag = true;
		}
		
		if(flag) i = grd.rows;
	}
	return flag;
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!--------------------------------------->
	<gw:data id="DAT_CTBS00010_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00010_0" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtUser_PK" />
                    <input bind="txtEmpPK" />
                    <input bind="txtLang" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5" function="ST_LG_SEL_CTBS00010_1" procedure="ST_LG_UPD_CTBS00010_1"> 
                <inout>
                    <inout bind="txtMasterPK" />
                    <inout bind="lstBranch" />
                    <inout bind="txtSupplierPK" />
                    <inout bind="chkActive" />
					<inout bind="txtEmpPK" />
					<inout bind="txtRemark" />
					<inout bind="txtStaffId" />
					<inout bind="txtStaffName" />
					<inout bind="txtSupplierID" />
					<inout bind="txtSupplierName" />
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00010_2" type="grid" parameter="" function="ST_LG_SEL_CTBS00010_2" procedure=""> 
                <input bind="grdSearch">
                    <input bind="txtSSupplierID" />
                    <input bind="txtSSupplierName" />
                    <input bind="lstSBranch" />
                </input> 
                <output bind="grdSearch" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00010_3" type="grid" parameter="0,1,2,3,4,9,15" function="ST_LG_SEL_CTBS00010_3" procedure="ST_LG_UPD_CTBS00010_3"> 
                <input bind="grdMonChinh">
                    <input bind="txtMasterPK" />
                    <input bind="txtFreeItemCD_MC" />
                </input> 
                <output bind="grdMonChinh" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00010_4" type="grid" parameter="0,1,2,3,4,9,15" function="ST_LG_SEL_CTBS00010_3" procedure="ST_LG_UPD_CTBS00010_3"> 
                <input bind="grdMonPhu">
                    <input bind="txtMasterPK" />
                    <input bind="txtFreeItemCD_MP" />
                </input> 
                <output bind="grdMonPhu" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00010_5" type="grid" parameter="0,1,2,3,4,9,15" function="ST_LG_SEL_CTBS00010_3" procedure="ST_LG_UPD_CTBS00010_3"> 
                <input bind="grdMonRau">
                    <input bind="txtMasterPK" />
                    <input bind="txtFreeItemCD_MR" />
                </input> 
                <output bind="grdMonRau" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00010_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00010_6" type="grid" parameter="0,1,2,3,4,9,15" function="ST_LG_SEL_CTBS00010_3" procedure="ST_LG_UPD_CTBS00010_3"> 
                <input bind="grdMonCanh">
                    <input bind="txtMasterPK" />
                    <input bind="txtFreeItemCD_CA" />
                </input> 
                <output bind="grdMonCanh" />
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">Tổng cộng :</td>
                            <td align="left" style="width:25%">
                                <gw:label id="lbSRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td></td>
                            <td><gw:button id="btnSearch" img="search" alt="Search" text="Tìm kiếm" onclick="OnClick('SEARCH')" /></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td style="white-space:nowrap">
                                            <a title="Supplier" onclick="OnPopup('SUPPLIERN')" href="#tips" class="eco_link"><b>Nhà cung cấp</b></a>
                                        </td>
                                        <td style="white-space: nowrap;width:100%">
										   <gw:textbox id="txtSSupplierID" styles="width:30%" />
                                           <gw:textbox id="txtSSupplierName" styles="width:70%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap">
                                            <a title="Charger" onclick="OnPopup('BRANCH')" href="#tips" class="eco_link"><b>Điểm nấu</b></a>
                                        </td>
                                        <td style="white-space: nowrap;width:100%">
                                           <gw:list id="lstSBranch" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" 
                                         header="_PK|Điểm nấu|Nhà cung cấp" 
                                         format="0|0|0"
                                         aligns="0|0|0" 
                                         editcol="0|0|0" 
                                         widths="0|4000|2500"
                                         styles="width:100%; height:100%" sorting="T"
                                         oncellclick="OnClick('MASTER')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%;display:none">
                                    <tr>
                                        <td>Slip Status : </td>
                                        <td style="width:100px"><gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="Thêm mới" onclick="OnInsert()" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Sao Lưu" onclick="OnClick('SAVE')" /></td>
										<td><gw:button id="btnPrint" img="excel" alt="Print" text="Báo cáo" onclick="OnClick('REPORT')" /></td>
										<td><gw:button id="btnNVL" img="" text="Nguyên VL" onclick="OnPopup('NVL')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            <a title="Branch" onclick="OnPopup('BRANCH')" href="#tips" class="eco_link"><b>Điểm nấu</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstBranch" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Supplier" onclick="OnPopup('SUPPLIERY')" href="#tips" class="eco_link"><b>Nhà cung cấp</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSupplierPK" styles="display:none" />
											<gw:textbox id="txtSupplierID" styles="width:30%" csstype="mandatory" />
                                            <gw:textbox id="txtSupplierName" styles="width:70%" csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Kích hoạt
                                        </td>
                                        <td style="width: 35%">
                                            <gw:checkbox id="chkActive" defaultvalue="Y|N" value="Y" />
                                        </td>
                                        
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopup('CHARGER')" href="#tips" class="eco_link"><b>Nhân viên</b></a>
                                        </td>
                                        <td style="width: 35%">
											<gw:textbox id="txtStaffId" styles="width:30%" />
                                            <gw:textbox id="txtStaffName" styles="width:70%" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Chú thích
                                        </td>
                                        <td colspan=3 style="width: 85%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr style="height: 96%">
            <td valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <gw:tab id="idTab">
                        <table style="width: 100%; height: 100%" name="Món chính" id="TabMonChinh" align="top" style="overflow: scroll">
                            <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                                <td align="right">
                                    <table style="height:100%;">
                                        <tr>
                                            <td><gw:button id="idBtnFreeItem_MC" img="item" text="Món ăn" onclick="OnPopup('FREEITEM_MC')" /></td>
                                            <td>
												<gw:button id="idBtnFreeItemDel_MC" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE_MC')" />
												<gw:textbox id="txtFreeItemCD_MC" text="MN-MC" styles="display:none;" />
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height:96%;">
                                <td valign="top" class="eco_line_t">
                                    <gw:grid id='grdMonChinh' 
								    header='_PK|_ITEM_PK|_UOM|_BOM_PK|_GRP_PK|STT|Mã món|Tên món|ĐVT|Kích hoạt|Tạo bởi|Tạo ngày|Cập nhật bởi|Cập nhật ngày|Định lượng|_MASTER_PK'
                                    format	='0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0'
                                    aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								    editcol	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                    widths	='0|0|0|0|0|800|1000|3000|1000|1000|1300|1300|1300|1300|1300|0'
                                    sorting='T' styles='width:100%; height:100%'
									oncelldblclick = "OnPopup('BOM_MC')"
                                    acceptnulldate='T' />
                                </td>
                            </tr>
                        </table>

                        <table style="width: 100%; height: 100%" name="Món phụ" id="TabMonPhu" align="top" style="overflow: scroll">
                            <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                                <td align="right">
                                    <table style="height:100%;">
                                        <tr>
                                            <td><gw:button id="idBtnFreeItem_MP" img="item" text="Món ăn" onclick="OnPopup('FREEITEM_MP')" /></td>
                                            <td>
												<gw:button id="idBtnFreeItemDel_MP" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE_MP')" />
												<gw:textbox id="txtFreeItemCD_MP" text="MN-MP" styles="display:none;" />
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height:96%;">
                                <td valign="top" class="eco_line_t">
                                    <gw:grid id='grdMonPhu' 
								    header='_PK|_ITEM_PK|_UOM|_BOM_PK|_GRP_PK|STT|Mã món|Tên món|ĐVT|Kích hoạt|Tạo bởi|Tạo ngày|Cập nhật bởi|Cập nhật ngày|Định lượng|_MASTER_PK'
                                    format	='0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0'
                                    aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								    editcol	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                    widths	='0|0|0|0|0|800|1000|3000|1000|1000|1300|1300|1300|1300|1300|0'
                                    sorting='T' styles='width:100%; height:100%'
									oncelldblclick = "OnPopup('BOM_MP')"
                                    acceptnulldate='T' />
                                </td>
                            </tr>
                        </table>

                        <table style="width: 100%; height: 100%" name="Món rau" id="TabMonRau" align="top" style="overflow: scroll">
                            <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                                <td align="right">
                                    <table style="height:100%;">
                                        <tr>
                                            <td><gw:button id="idBtnFreeItem_MR" img="item" text="Món ăn" onclick="OnPopup('FREEITEM_MR')" /></td>
                                            <td>
												<gw:button id="idBtnFreeItemDel_MR" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE_MR')" />
												<gw:textbox id="txtFreeItemCD_MR" text="MN-MR" styles="display:none;" />
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height:96%;">
                                <td valign="top" class="eco_line_t">
                                    <gw:grid id='grdMonRau' 
								    header='_PK|_ITEM_PK|_UOM|_BOM_PK|_GRP_PK|STT|Mã món|Tên món|ĐVT|Kích hoạt|Tạo bởi|Tạo ngày|Cập nhật bởi|Cập nhật ngày|Định lượng|_MASTER_PK'
                                    format	='0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0'
                                    aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								    editcol	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                    widths	='0|0|0|0|0|800|1000|3000|1000|1000|1300|1300|1300|1300|1300|0'
                                    sorting='T' styles='width:100%; height:100%'
									oncelldblclick = "OnPopup('BOM_MR')"
                                    acceptnulldate='T' />
                                </td>
                            </tr>
                        </table>

                        <table style="width: 100%; height: 100%" name="Món canh" id="TabMonCanh" align="top" style="overflow: scroll">
                            <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                                <td align="right">
                                    <table style="height:100%;">
                                        <tr>
                                            <td><gw:button id="idBtnFreeItem_CA" img="item" text="Món ăn" onclick="OnPopup('FREEITEM_CA')" /></td>
                                            <td>
												<gw:button id="idBtnFreeItemDel_CA" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE_CA')" />
												<gw:textbox id="txtFreeItemCD_CA" text="MN-CA" styles="display:none;" />
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height:96%;">
                                <td valign="top" class="eco_line_t">
                                    <gw:grid id='grdMonCanh' 
								    header='_PK|_ITEM_PK|_UOM|_BOM_PK|_GRP_PK|STT|Mã món|Tên món|ĐVT|Kích hoạt|Tạo bởi|Tạo ngày|Cập nhật bởi|Cập nhật ngày|Định lượng|_MASTER_PK'
                                    format	='0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0'
                                    aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								    editcol	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                    widths	='0|0|0|0|0|800|1000|3000|1000|1000|1300|1300|1300|1300|1300|0'
                                    sorting='T' styles='width:100%; height:100%'
									oncelldblclick = "OnPopup('BOM_CA')"
                                    acceptnulldate='T' />
                                </td>
                            </tr>
                        </table>
                    </gw:tab>
                </div>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtCompanyPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtLang" styles="width: 100%;display: none" />

<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
</html>