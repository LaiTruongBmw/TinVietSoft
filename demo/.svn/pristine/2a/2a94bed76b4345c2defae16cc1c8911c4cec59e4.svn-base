<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock OutGoing Request</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script src="../../../../system/lib/ajax.js"></script>

<script language="javascript" type="text/javascript">
//--------------------------------------

var flag;

var G1_PK    = 0 ;

var G2_DETAIL_PK    = 0 ,
    G2_MASTER_PK    = 1 ,
    G2_SEQ          = 2 ,
    G2_REF_NO       = 3 ,
    G2_ST_ITEM_PK   = 4 ,
    G2_ST_CODE      = 5 ,
    G2_ST_NAME      = 6 ,
    G2_ITEM_PK      = 7 ,
    G2_ITEM_CODE    = 8 ,
    G2_ITEM_NAME    = 9 ,
    G2_REQ_QTY   	= 10 ,
    G2_REQ_UOM   	= 11 ,
	G2_REF_QTY   	= 12 ,
    G2_REF_UOM   	= 13 ,
    G2_LOT_NO       = 14 ,
    G2_REMARK       = 15 ,
	G2_TABLE_PK		= 16 ,
	G2_TABLE_NAME   = 17 ;
	
var arr_FormatNumber = new Array(); 	
   
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }
 
//----------------------------------------------------------------------------------------
function BodyInit()
 {    
    System.Translate(document);  // Translate to language session
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;    
    txtStaffName.SetEnable(false);
    txtRequester.SetEnable(false);
    txtVoucherNo.SetEnable(false);
    txtParnerName.SetEnable(false);
    //-----------------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;          
    dtFrom.value=ldate ; 
    //-------------------------
    
    BindingDataList();    
    SetGridFormat();       
    //OnToggleGrid(); 
    //------------------------- 
    OnAddNew('Master');  
 }
//---------------------------------------------------------------------------------------------------
 function BindingDataList()
 {  
     var data;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn = 'Y' order by wh_id ")%>||";   
     cboWH.SetDataText(data);
	 cboWH.value = "";
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn = 'Y' order by wh_id ")%>||";   
     lstWH2.SetDataText(data);
     lstWH2.value = "";
     
     data = "<%=CtlLib.SetListDataSQL("SELECT PK, LINE_NAME FROM tlg_pb_LINE Where Del_if=0 order by LINE_NAME ")%>||";  
     cboLine.SetDataText(data); 
     cboLine.value = "" ;          
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGIN0309') FROM DUAL" )%>||";    
     lstReqType.SetDataText(data); 
	 lstReqType.value = ""; 
 }
 
 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
	
    ctr.ColFormat(G2_REQ_QTY) = "#,###,###,###,###,###.###";
	ctr.ColFormat(G2_REF_QTY) = "#,###,###,###,###,###.###";
	
    arr_FormatNumber[G2_REQ_QTY] = 3;
    arr_FormatNumber[G2_REF_QTY] = 3;
	 	
 }

//--------------------------------------------------------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdVouchers':
            data_bini00150.Call("SELECT");
        break;
    
        case 'Master':
        
            if ( data_bini00150_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdVouchers.row > 0 )
                    {
                        txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G1_PK );
                    }
                    flag = 'view' ;
                    data_bini00150_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdVouchers.row > 0 )
                {
                    txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G1_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_bini00150_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bini00150_2.Call("SELECT");
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bini00150_1": 
            if ( flag == 'save')
            {
                for(var i=0; i<grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_MASTER_PK, txtMasterPK.text);
                    }    
                }
                 OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }            
        break;
        
        case "data_bini00150_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_REQ_QTY, grdDetail.rows - 1, G2_REQ_QTY,  true);
	            
                grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE, true);
                grdDetail.SetCellBold( 1, G2_LOT_NO,    grdDetail.rows - 1, G2_LOT_NO,    true);
                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                
                //--------------------------------
            }     
        break;
        
        case 'pro_bini00150':
            alert(txtReturnValue.text);
        break;      
        case 'pro_bini00150_1':
            alert(txtReturnValue.text);
            flag = 'view' ;
            OnSearch('Master');
        break; 
        case 'pro_bini00150_2':
            alert(txtReturnValue.text);
        break;       
    }
}
//===================================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'POP_REQ':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to make POP Req?'))
                {
                    pro_bini00150.Call();
                } 
            }                       
        break;
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to Submit this Slip?'))
                {
                    pro_bini00150_1.Call();
                } 
            }  
            else
            {
                alert("Please Select one Slip to Submit !");
            }                     
        break;
        case 'Outgo':
            if ( txtMasterPK.text != '' )
            {
                if(lblStatus.text=="SUBMITTED")
                {        
                    if ( confirm('Do you want to make Outgo for this Slip?'))
                    {
                        pro_bini00150_2.Call();
                    }
                } 
                else
                {
                    alert("This Slip not yet Submit!");
                }
            }  
            else
            {
                alert("Please Select one Slip to Make Outgo !");
            }                     
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;
            
        case 'Requester':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequester.text = obj[2];
                txtReqEmpPK.text  = obj[0];
            }
        break;
        
        case 'PL': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 600 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[0]; 
                txtPLName.text = oValue[2] + ' - ' + oValue[5];
            }
        break; 
		
        case 'PO': // Array P/O No
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00330.aspx";
            oValue = System.OpenModal( fpath , 800 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtArraySOPK.text  = oValue[0]; 
                txtRefNo.text      = oValue[1];
            }
        break; 

		case 'Req_Type':
			 
			 var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0309";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		break;	

		case 'Report':
			if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/ni/bini00154.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }		
		break;	
		

    }	       
}
//--------------------------------------------------------------------------------------------------
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bini00150_1.StatusInsert();
            
            txtVoucherNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE,  arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME,  arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM, arrTemp[5]);//item_uom                          
                    }		            
             }        
        break;
        
        case 'STITEM' :
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00210.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ST_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ST_CODE,    arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ST_NAME,    arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM, arrTemp[5]);//item_uom                          
                    }		            
             }                
        break;  
        
        case 'STOCK':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[3]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE,  arrTemp[4]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME,  arrTemp[5]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM, arrTemp[6]);//item_uom  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY, arrTemp[8]);//qty
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO, arrTemp[10]);//lot no                         
                    }		            
             }          
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_bini00150_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_bini00150_2.Call();
        break;
    }
}
//-------------------------------------------------------------------------------------
function Validate()
{        
    for(var i=0; i< grdDetail.rows; i++)
    {
        if(Number(grdDetail.GetGridData( i, G2_REQ_QTY ))==0)
        {
            alert("Input req Qty. at " + i + ",pls!")
            return false;
        }
    }
    return true;
}
//--------------------------------------------------------------------------------------------------
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}
//--------------------------------------------------------------------------------------------------
function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_bini00150_1.StatusDelete();
                data_bini00150_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}

//------------------------------------------------------------------------------------------
function OnPrint()
{
    if(txtMasterPK.text=="")
    {
        alert("Please select Voucher !!!");
    }
    else
    {
    //var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ep/fm/rpt_bini00150.rpt&procedure=INV.sp_rpt_bini00150_1|INV.sp_rpt_bini00150_2&parameter=" + txtMasterPK.text +"|"+ txtMasterPK.text;  
     var url =System.RootURL + '/standard/reports/bi/ni/rpt_bini00150.aspx?p_master_pk='+txtMasterPK.text;
        window.open(url); 
    }
}
 
 //-----------------------------------------------
 /*
function OnChangeCompany()
{	
    dat_bini00150_4.Call('SELECT');
	var t=new Date()
	var url =  System.RootURL + "/standard/forms/ep/fm/epfm00000_loadWarehouse.aspx?com_pk=" + cboCompany.value;
	ajax_test = null;
	ajax_test = GetXmlHttpRequest(return_result);
	ajax_test.open("GET", url , true);
	ajax_test.send(null);
}

//-----------------------------------------------
function return_result()
{	
	if(GetRequestState(ajax_test))
	{
	    strdata = ajax_test.responseText;			   
	    grdDetail.SetComboFormat(4,strdata);
	}
}
*/
//-----------------------------------------------

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_REQ_QTY || col == G2_REF_QTY )
    {
        var dQuantiy
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col]) );
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText(row,col,"");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }     
    }

}

 //=======================================================================================
  
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                if ( event_col == G2_REQ_UOM )
                {
                    var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                if ( obj != null )
	                {
	                    grdDetail.SetGridText( event_row, event_col, obj[1]);
	                }	
                }
				else if ( event_col == G2_REQ_QTY )
				{
					var path = System.RootURL + '/standard/forms/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G2_DETAIL_PK ) + '&p_table_name=TLG_ST_OUTGO_REQ_D&p_io_type=O'  ;
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');                      					  
				}
            break;             
      }         
}   
//======================================================================
function OnToggleGrid(obj)
{
    if(obj.id == "idBtnStandard"){
        idBtnExtend.style.display = "";
        grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = false;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = false ;
    }else{
        idBtnStandard.style.display = "";
        grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = true ;
    }
    obj.style.display = "none";
    
    /*
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G2_ST_CODE) = false;
		grdDetail.GetGridControl().ColHidden(G2_ST_NAME) = false ;
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
    /**/
}

//=================================================================================
function OnReport(pos)
{
    switch(pos)
    {
       
		
		case 'ST01':
			var url =System.RootURL + '/standard/reports/bi/ni/rpt_bini00150_ST01.aspx?master_pk=' + txtMasterPK.text ;
            window.open(url, "_blank");   
		break;		
         
    }
}

//=======================================================================================

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_bini00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00150" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_bini00150_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00150_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_bini00150_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00150_2" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtEmpPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_bini00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_bini00150" > 
                <input> 
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstWH2" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bini00150_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_bini00150_1"  procedure="st_lg_upd_bini00150_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />                     
                     <inout  bind="txtVoucherNo" />
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="dtVoucherDate" />
                     <inout  bind="cboLine" /> 
                     <inout  bind="txtParnerName" />
                     <inout  bind="cboWH" />
                     <inout  bind="txtReqEmpPK" /> 
                     <inout  bind="txtRequester" />  
                     <inout  bind="txtRemark" />                     
                     <inout  bind="lblStatus" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />					 
                     <inout  bind="txtRefNo" />
					 <inout  bind="txtArraySOPK" />
					 <inout  bind="lstReqType" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bini00150_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="st_lg_sel_bini00150_2"   procedure="st_lg_upd_bini00150_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">Records :</td>
                            <td align="left" style="width:25%">
                                <gw:label id="lbSearchRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td><gw:button id="idBtnOutgo" img="process" text="OutGo" onclick="OnProcess('Outgo')" /></td>
                            <td><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" /></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td>
                                            Date
                                        </td>
                                        <td style="white-space: nowrap">
                                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                                            ~
                                            <gw:datebox id="dtTo" lang="1" width="10%" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                         <td>
                                            W/H
                                        </td>
                                        <td colspan="2">
                                            <gw:list id="lstWH2" styles='width:100%' csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            No.
                                        </td>
                                        <td>
                                            <gw:textbox id="txtNoSearch" style="width: 100%" />
                                        </td>
                                        <td>
                                            <gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdVouchers')"></gw:checkbox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdVouchers" header="_PK|Date|Voucher No" format="0|4|0" aligns="0|1|0"
                                defaults="||" editcol="0|0|0" widths="0|1200|1200" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2" oncellclick="OnSearch('Master')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 75%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
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
                                        <td>
                                            <gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Submit')" />
                                        </td>
                                        <td>
                                            <gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                                        </td>
                                        <td>
                                            <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                                        </td>
                                        <td>
                                            <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                                        </td>
										<td>
							                <gw:button id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtVoucherDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="text-decoration: none;" class="eco_link"><b>Charger</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtStaffName" styles="width:100%" />
                                            <gw:textbox id="txtStaffPK" styles="display:none" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Voucher No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtVoucherNo" onkeypress="ChangeUpper()" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
											Line
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="cboLine" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="cboWH" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Ref No" onclick="OnPopUp('PO')" href="#tips" style="text-decoration: none;" class="eco_link"><b>Ref No</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtArraySOPK" styles="width:100%;display:none" />
                                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Remark
                                        </td>
                                        <td style="width: 35%">
                                           <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Requester" onclick="OnPopUp('Requester')" href="#tips" style="text-decoration: none;" class="eco_link"><b>Requester</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRequester" styles="width:100%;" />
                                            <gw:textbox id="txtReqEmpPK" styles="display=none" />
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
                    <table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;padding:2 5 1 5;" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lbDtRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="idBtnStandard" img="extend" style="display:none" text="Standard" onclick="OnToggleGrid(this)" /></td>
                                        <td><gw:button id="idBtnExtend" img="extend" text="Extend" onclick="OnToggleGrid(this)" /></td>
                                        <td>
                                            <gw:button id="idBtnStock" img="popup" text="Stock" onclick="OnAddNew('STOCK')" />
                                        </td>
                                        <td>
                                            <gw:button id="idBtnItem" img="item" text="Item" onclick="OnAddNew('FreeItem')" />
                                        </td>
                                        
                                        <td>
                                            <gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' header='_PK|_ST_OUTGO_REQ_M_PK|Seq|Ref No|_ST_ITEM_PK|ST Code|ST Name|_ITEM_PK|Item Code|Item Name|Req Qty|UOM|Ref Qty|UOM|Lot No|Remark|_Ref_Table_PK|_Ref_Table_Name'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|3|1|3|1|0|0|0|0' 
								check='|||||||||||||||||'
                                editcol='0|0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|0|0' 
								widths='0|0|800|1500|0|2000|2500|0|2000|2500|1500|800|1500|800|1500|1000|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="width:100%; display:none" onenterkey="" />
 
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
<gw:list id="lstReqType" styles="width:100%;display:none" onchange="" />
<gw:textbox id="txtParnerName" styles="width:100%;display:none" />
<gw:textbox id="txtPLName" styles="width:100%;display:none" />
<gw:textbox id="txtPLPK" styles="width: 100%;display: none" />
<!------------------------------------------------------------------------------------>
</html>
