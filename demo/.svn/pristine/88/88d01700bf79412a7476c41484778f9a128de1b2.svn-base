<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Incoming Request</title>
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
    G2_REQ_QTY_01   = 10 ,
    G2_REQ_UOM_01   = 11 ,
    G2_UNIT_PRICE   = 12 ,
    G2_AMOUNT       = 13 ,
    G2_LOT_NO       = 14 ,
    G2_REMARK       = 15 ;
   
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
    //System.Translate(document);  // Translate to language session
	System.Translate_V2(document, System.Menu.GetMenuPS());
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>";  
	txt_lang.text = "<%=Session("SESSION_LANG")%>";
    txtChargerName.SetEnable(false);
    txtReqEmpName.SetEnable(false);
    txtVoucherNo.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtPLName.SetEnable(false);
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
     //data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>";   
     data = '<%=CtlLib.SetListDataSQL("SELECT pk, " + "decode(\'" + Session("SESSION_LANG").ToString() + "\',\'VIE\', wh_lname, wh_name)" + " FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>';
     cboWH.SetDataText(data);
                    
 }
 
 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    ctr.ColFormat(G2_REQ_QTY_01) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##";
 }

//--------------------------------------------------------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdVouchers':
            data_bini00190.Call("SELECT");
        break;
    
        case 'Master':
        
            if ( data_bini00190_1.GetStatus() == 20 && grdDetail.rows > 1 )
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
                    data_bini00190_1.Call("SELECT");
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
                data_bini00190_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bini00190_2.Call("SELECT");
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bini00190_1": 
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
        
        case "data_bini00190_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_REQ_QTY_01, grdDetail.rows - 1, G2_REQ_QTY_01, true);
                grdDetail.SetCellBold( 1, G2_AMOUNT,     grdDetail.rows - 1, G2_AMOUNT,     true);
	            
                grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE, true);
                grdDetail.SetCellBold( 1, G2_LOT_NO,    grdDetail.rows - 1, G2_LOT_NO,    true);
                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                //--------------------------------
            }     
        break;
        
        case 'pro_bini00190':
            alert(txtReturnValue.text);
        break;   
        
        case 'pro_bini00190_2':
            alert(txtReturnValue.text);
        break; 
        case 'pro_bini00190_1':
            alert(txtReturnValue.text);
            flag = 'view' ;
            OnSearch('Master');
        break;         
    }
}
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Requester':
		
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtReqEmpName.text = obj[2];
                txtReqEmpPK.text   = obj[0];
            }
        break;
        
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;
        
        
        case 'PL': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[6]; 
                txtPLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;
        
        case 'Supplier' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplierName.text = object[2];                
	         }
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
                    pro_bini00190.Call();
                } 
            }                       
        break;
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to Submit this Slip ?'))
                {
                    pro_bini00190_1.Call();
                } 
            }  
            else
            {
                alert("Please Select one Slip to Submit !!")
            }                     
        break;
        case 'InCome':
            if ( txtMasterPK.text != '' )
            {        
                if(lbStatus.text=="SUBMITTED")
                {
                    if ( confirm('Do you want to make Income for this Slip ?'))
                    {
                        pro_bini00190_2.Call();
                    }
                }
                else
                {
                    alert("This Slip not yet Submit!");
                } 
            }  
            else
            {
                alert("Please Select one Slip to make Income !!")
            }                     
        break;
    }
}
//===================================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bini00190_1.StatusInsert();
            
            txtVoucherNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM_01, arrTemp[5]);//item_uom                          
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM_01, arrTemp[5]);//item_uom                          
                    }		            
             }                
        break;  
        
        case 'STOCK':
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM_01, arrTemp[5]);//item_uom  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY_01, "");//qty
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO, "");//lot no                         
                    }		            
             }          
        break;
       
       case 'PO':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00020.aspx?type=INCOME';
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            

                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                                                          
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,  arrTemp[1]);//Ref No  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[7]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE,  arrTemp[8]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME,  arrTemp[9]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM_01, arrTemp[13]);//item_uom  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY_01, arrTemp[12]);//qty                            
                            //----------------
                            if ( arrTemp[20] != '' && arrTemp[20] != txtSupplierPK.text && txtSupplierPK.text == '' )
                            {
                                txtSupplierPK.text = arrTemp[20] ;
                            }  
                            //----------------
                            if ( arrTemp[21] != '' && arrTemp[21] != txtPLPK.text && txtPLPK.text == '' )
                            {
                                txtPLPK.text = arrTemp[21] ;
                            }                             
                            //----------------
                            if ( txtRefNo.text != arrTemp[1] && arrTemp[1] != '' )
                            {
                                if ( txtRefNo.text == '' )
                                {
                                    txtRefNo.text = arrTemp[1];
                                } 
                                else
                                {
                                    txtRefNo.text = txtRefNo.text + ',' + arrTemp[1];
                                }   
                            }
                            //-----------------                                                                                            
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
                data_bini00190_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_bini00190_2.Call();
        break;
    }
}
//-------------------------------------------------------------------------------------
function Validate()
{        
    for(var i=0; i< grdDetail.rows; i++)
    {
        if(Number(grdDetail.GetGridData( i, G2_REQ_QTY_01 ))==0)
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
                data_bini00190_1.StatusDelete();
                data_bini00190_1.Call();
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
        var url =System.RootURL + '/standard/reports/bi/ni/rpt_bini00190_0.aspx?p_master_pk='+ txtMasterPK.text;
        window.open(url);          
    }
}
 
//-----------------------------------------------

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_REQ_QTY_01 || col == G2_UNIT_PRICE || col == G2_AMOUNT )
    {
        var dQuantiy
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
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
    //----------------------Calculate Amount -----
    if ( col == G2_REQ_QTY_01 || col == G2_UNIT_PRICE )
    {
        dQuantiy = grdDetail.GetGridData( row, G2_REQ_QTY_01) ;
        dPrice   = grdDetail.GetGridData( row, G2_UNIT_PRICE) ;
        
        if(dQuantiy!=""&& dPrice!="")
        {    
            var dAmount = dQuantiy * dPrice;
            
            grdDetail.SetGridText( row, G2_AMOUNT, parseFloat(dAmount+"").toFixed(2));
        }
        else
        {
            grdDetail.SetGridText( row, G2_AMOUNT,"");
        }            
    }    
    //----------------------    
}

 //=======================================================================================
  
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                /*var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G2_REQ_UOM_01 )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }*/
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

		
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
    /**/
}
//=======================================================================================

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!---------------------------------------------------------------->
    <gw:data id="pro_bini00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00190" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bini00190_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00190_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bini00190_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00190_2" > 
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
    <gw:data id="data_bini00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_bini00190" > 
                <input> 
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bini00190_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="st_lg_sel_bini00190_1"  procedure="st_lg_upd_bini00190_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />                     
                     <inout  bind="txtVoucherNo" />
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="dtVoucherDate" />
                     <inout  bind="txtSupplierPK" />
                     <inout  bind="txtSupplierName" />
                     <inout  bind="cboWH" />
                     <inout  bind="txtReqEmpPK" /> 
                     <inout  bind="txtReqEmpName" />  
                     <inout  bind="txtRemark" />                     
                     <inout  bind="lbStatus" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="txtRefNo" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bini00190_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_bini00190_2"   procedure="st_lg_upd_bini00190_2"> 
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
                            <td><gw:button id="idBtnIncome" img="process" text="InCome" style="display:none" onclick="OnProcess('InCome')" /></td>
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
                                            <gw:datebox id="dtFrom" lang="1" />
                                            ~
                                            <gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>   
                                     <tr style="height: 2%">
                                        <td style="width: 50px">
                                            No.
                                        </td>
                                        <td colspan=2 style="width: 205px">
                                            <gw:textbox id="txtNoSearch" style="width: 100%" onenterkey="OnSearch('grdVouchers')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdVouchers" header="_PK|Date|Voucher No|Ref No" format="0|4|0|0" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1200|1200" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Slip Status : </td>
                                        <td style="width:100px"><gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Submit')" /></td>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" /></td>
										<td><gw:button id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0.5">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtVoucherDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="text-decoration: none;" class="eco_link">Charger</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtChargerName" styles="width:100%" />
                                            <gw:textbox id="txtChargerPK" styles="display:none" />
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
											<a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="text-decoration: none" class="eco_link">Supplier</a>
                                            
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSupplierPK" styles="width:100%;display:none" />
                                            <gw:textbox id="txtSupplierName" styles="width:100%" />
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
                                            Ref No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRefNo" styles="width:100%" />
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
                                            <a title="Requester" onclick="OnPopUp('Requester')" href="#tips" style="text-decoration: none;" class="eco_link">Requester</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtReqEmpName" styles="width:100%;" />
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
                                        <!--img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif" style="cursor: hand;display:none" onclick="OnToggleGrid()" /-->
                                        <td><gw:button id="idBtnStandard" img="extend" style="display:none" text="Standard" onclick="OnToggleGrid(this)" /></td>
                                        <td><gw:button id="idBtnExtend" img="extend" text="Extend" onclick="OnToggleGrid(this)" /></td>
                                        <td><gw:button id="idBtnPO" img="popup" text="P/O" onclick="OnAddNew('PO')" /></td>
                                        <td><gw:button id="idBtnItem" img="item" text="Item" onclick="OnAddNew('FreeItem')" /></td>
                                        <td><gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' header='_PK|_ST_OUTGO_REQ_M_PK|Seq|_Ref No|_ST_ITEM_PK|_ST Code|_ST Name|_ITEM_PK|Item Code|Item Name|Req Qty|UOM|U/P|Amount|Lot No|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|3|1|3|3|0|0'
                                check='||||||||||0n|||||' editcol='0|0|1|1|0|0|0|0|0|0|1|0|1|1|1|1' widths='0|0|800|1500|0|2000|2500|0|2000|2500|1200|1000|1200|1200|1500|1000'
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
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txt_lang" styles="width:100%; display:none" onenterkey="" />

<gw:textbox id="txtPLName" styles="width: 100%;display: none" />
<gw:textbox id="txtPLPK" styles="width: 100%;display: none" />
<gw:checkbox id="chkUser" styles="color:blue" styles="width: 100%;display: none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdVouchers')"></gw:checkbox>
<!------------------------------------------------------------------------------------>
</html>
s