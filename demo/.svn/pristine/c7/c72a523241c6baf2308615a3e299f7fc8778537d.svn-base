<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Quotation entry</title>
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

var G1_QUO_PK    = 0 ;

var G2_MASTER_PK    	 = 0 ,
    G2_ITEM_PK           = 1 ,
    G2_ITEM_CD           = 2 ,
    G2_ITEM_NM           = 3 ,
    G2_UNIT              = 4 ,
    G2_REQ_QTY           = 5 ,
    G2_QUOTATION_D_PK    = 6 ,
    G2_PARTNER_PK        = 7 , 
    G2_PARTNER_ID        = 8 ,   
    G2_PARTNER_NM        = 9 ,
    G2_UNIT_PRICE        = 10 ,
	G2_AMOUNT			 = 11 ,
    G2_CCY               = 12 ,
    G2_PAY_TERM          = 13 , 
    G2_PAY_METHOD        = 14 ,
	G2_PRICE_TYPE        = 15 , 
    G2_LEAD_DAY          = 16 , 
    G2_AGREE_YN          = 17 ,
    G2_DESC              = 18 ,
    G2_ARR_PK            = 19 ;
	
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
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }
 
//----------------------------------------------------------------------------------------
function BodyInit()
 {    
    System.Translate(document);  // Translate to language session
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;  
	  
    txtChargerName.SetEnable(false);   
    txtSlipNo.SetEnable(false);
    txtRecommend.SetReadOnly(true);
    //-----------------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;          
    dtFrom.value=ldate ; 
    //-------------------------
    SetGridFormat();  
     //------------------------- 
    OnAddNew('Master');  
 } 
 
 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var  data = "";
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";           
	grdDetail.SetComboFormat(G2_PAY_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
    grdDetail.SetComboFormat(G2_PAY_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0130' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
    grdDetail.SetComboFormat(G2_PRICE_TYPE,data); 	
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
    grdDetail.SetComboFormat(G2_CCY,data);  
     
    data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' - '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstDept.SetDataText(data);  
    lstDept.value = '' ;
	
    data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' - '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstSeDept.SetDataText(data);  
    lstSeDept.value = '' ;
    
    var ctrl = grdDetail.GetGridControl();  
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    
    var ctr = grdDetail.GetGridControl();     
    ctr.ColFormat(G2_REQ_QTY)    = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.##";
	ctr.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##";
	ctr.ColFormat(G2_LEAD_DAY)   = "#,###,###,###,###,###";
		
	arr_FormatNumber[G2_REQ_QTY]    = 2;
	arr_FormatNumber[G2_UNIT_PRICE] = 2;
	arr_FormatNumber[G2_AMOUNT]     = 2;
	arr_FormatNumber[G2_LEAD_DAY]   = 0;
	
	grdDetail.GetGridControl().Cell( 7, 0, G2_AGREE_YN, 0, G2_AGREE_YN) = 0x3300cc; 
 }

//--------------------------------------------------------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdQuot':
            data_epbp00190.Call("SELECT");
        break;
    
        case 'Master':
        
            if ( data_epbp00190_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdQuot.row > 0 )
                    {
                        txtMasterPK.text = grdQuot.GetGridData( grdQuot.row, G1_QUO_PK );
                    }
                    flag = 'view' ;
                    data_epbp00190_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdQuot.row > 0 )
                {
                    txtMasterPK.text = grdQuot.GetGridData( grdQuot.row, G1_QUO_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_epbp00190_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_epbp00190_2.Call("SELECT");
        break;
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00190_1": 
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
        
        case "data_epbp00190_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_PARTNER_ID, grdDetail.rows - 1, G2_PARTNER_ID, true);
				grdDetail.SetCellBold( 1, G2_ITEM_CD,    grdDetail.rows - 1, G2_ITEM_CD,    true);
				
				grdDetail.GetGridControl().Cell( 7, 1, G2_UNIT_PRICE, grdDetail.rows - 1, G2_UNIT_PRICE) = 0x3300cc; 
                //--------------------------------
            }   			
	 
	        var v_color = 0xCCFFCC;
	        var v_item  = "";
			
	        for( var i = 1 ; i<grdDetail.rows; i++ )
	        {
	            if ( v_item != grdDetail.GetGridData(i,G2_ITEM_PK) )
	            {
	                if ( v_color == 0xCCFFCC )
	                {
	                    v_color = 0xFFFFFF;
	                }
					else
	                {
	                    v_color = 0xCCFFCC;
	                }
					
	                v_item = grdDetail.GetGridData(i,G2_ITEM_PK);
	            }
				
	            grdDetail.SetCellBgColor( i, G2_ITEM_PK, i, G2_ARR_PK, v_color );   
	            
	        }		     
        break;
        
        case 'pro_epbp00190':
            alert(txtReturnValue.text);
        break;   
        
        case 'pro_epbp00190_2':
            alert(txtReturnValue.text);
        break; 
        case 'pro_epbp00190_1':
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
        
        case 'Charger':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;
        
        case 'Supplier' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
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
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to Submit this Slip ?'))
                {
                    pro_epbp00190.Call();
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
                        pro_epbp00190_2.Call();
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
            data_epbp00190_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'ITEM':
             var path = System.RootURL + '/standard/formsep/bp/epbp00192.aspx?group_type=Y|Y|Y|Y|Y|Y';
             var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CD,    arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NM,    arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT,       arrTemp[3]);//unit	  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY,    arrTemp[4]);//qty	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_PK,  arrTemp[5]);//partner_pk	                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_ID, arrTemp[6]);//partner_id	                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_NM, arrTemp[7]);//partner_nm 
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[8]);//unit_price 
							
							var t_amount = Number(arrTemp[4])*Number(arrTemp[8]);							
							t_amount = System.Round( t_amount+"" , arr_FormatNumber[G2_AMOUNT] );
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_AMOUNT, t_amount);
							
                            grdDetail.SetGridText( grdDetail.rows-1, G2_CCY       , arrTemp[9]);//ccy
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PAY_TERM,   arrTemp[10]);//pay_term 
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PAY_METHOD, arrTemp[11]);//pay method	
                            grdDetail.SetGridText( grdDetail.rows-1, G2_LEAD_DAY,   arrTemp[12]);//lead_day	
                             
                    }		            
             }        
        break;
       
       case 'PR':
             var path = System.RootURL + '/standard/formsep/bp/epbp00191.aspx';
             var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CD,    arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NM,    arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT,       arrTemp[3]);//unit	  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY,    arrTemp[4]);//qty	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_PK, arrTemp[5]);//partner_pk	                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_ID, arrTemp[6]);//partner_id	                           
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PARTNER_NM, arrTemp[7]);//partner_nm 
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[8]);//unit_price 
							
							var t_amount = Number(arrTemp[4])*Number(arrTemp[8]);							
							t_amount = System.Round( t_amount+"" , arr_FormatNumber[G2_AMOUNT] );
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_AMOUNT, t_amount);
							
                            grdDetail.SetGridText( grdDetail.rows-1, G2_CCY       , arrTemp[9]);//ccy 
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PAY_TERM,   arrTemp[10]);//pay_term 
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PAY_METHOD, arrTemp[11]);//pay method
                            	
                            grdDetail.SetGridText( grdDetail.rows-1, G2_LEAD_DAY,   arrTemp[12]);//lead_day	
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ARR_PK,     arrTemp[15]);//larr_day	
                           
                          
                    }		            
             }      
        break;  
        case 'FREE':
             grdDetail.AddRow();  
             grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                  
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
                data_epbp00190_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_epbp00190_2.Call();
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
                data_epbp00190_1.StatusDelete();
                data_epbp00190_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_QUOTATION_D_PK ) == '' )
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
        var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00191_IBC.aspx?p_master_pk='+ txtMasterPK.text;
        window.open(url);          
    }
}
//------------------------------------------------------------------------------------------
function OnPrint2()
{
    if(txtMasterPK.text=="")
    {
        alert("Please select Voucher !!!");
    }
    else
    {    
        var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00191.aspx?p_master_pk='+ txtMasterPK.text;
        window.open(url);          
    }
}
//-----------------------------------------------

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_REQ_QTY || col == G2_UNIT_PRICE || col == G2_AMOUNT || col == G2_LEAD_DAY )
    {
        var dQuantiy = 0 ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ) );
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
    if ( col == G2_REQ_QTY || col == G2_UNIT_PRICE )
    {
        dQuantiy = grdDetail.GetGridData( row, G2_REQ_QTY) ;
        dPrice   = grdDetail.GetGridData( row, G2_UNIT_PRICE) ;
        
        if(dQuantiy!=""&& dPrice!="")
        {    
            var dAmount = dQuantiy * dPrice;
            
            grdDetail.SetGridText( row, G2_AMOUNT, System.Round( dAmount, arr_FormatNumber[G2_AMOUNT] ) );
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
    var v_col = oGrid.col;
    var v_row = oGrid.row;
	
    if ( v_col == G2_PARTNER_ID || v_col == G2_PARTNER_NM )
    {
        var path = System.RootURL + '/standard/formsfp/ab/fpab00120.aspx';
        var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');

        if ( object != null )
        {
            oGrid.SetGridText( v_row, G2_PARTNER_PK , object[0]);
            oGrid.SetGridText( v_row, G2_PARTNER_ID , object[1]);
            oGrid.SetGridText( v_row, G2_PARTNER_NM , object[2]);                    
        }
    } 
	else if ( v_col == G2_ITEM_CD || v_col == G2_ITEM_NM )
	{
		var path = System.RootURL + '/standard/formsfp/ab/fpab00020.aspx?item_pk='+ oGrid.GetGridData( v_row, G2_ITEM_PK ) ;
        var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px'); 
	}	
}   

//=======================================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00190" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdQuot---------------------------------------->
    <gw:data id="data_epbp00190" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_epbp00190" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtNoSearch" />                    
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstSeDept" />
					<input bind="txtItemSearch" />
                </input> 
                <output bind="grdQuot" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00190_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_epbp00190_1"  procedure="st_lg_upd_epbp00190_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />                     
                     <inout  bind="txtSlipNo" />
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="dtQuotDate" />
                     <inout  bind="lbStatus" />
                     <inout  bind="txtRemark" />  
                     <inout  bind="lstDept" />                                      
                     <inout  bind="txtWorkDesc" />    
                     <inout  bind="txtRecommend" />                                      
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00190_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00190_2"   procedure="st_lg_upd_epbp00190_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%">
                            Date
                        </td>
                        <td style="width: 79%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                            ~
                            <gw:datebox id="dtTo" lang="1" width="10%" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdQuot')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 20%">
                            No.
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtNoSearch" style="width: 100%" onenterkey="OnSearch('grdQuot')" />
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdQuot')">User
							</gw:checkbox>
                        </td>
                    </tr>
					<tr style="height: 2%">
                        <td style="width: 20%">
                           Item
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtItemSearch" style="width: 100%" onenterkey="OnSearch('grdQuot')" />
                        </td>                        
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 20%">
                            Dept
                        </td>
                        <td style="width: 100%" colspan="2">
                            <gw:list id="lstSeDept" styles='width:100%;' />
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="3">
                            <gw:grid id="grdQuot" header="_PK|Quot Date|Slip No|Status|Dept" format="0|4|0|0|0" aligns="0|1|0|1|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1500" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%"  >
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" onkeypress="ChangeUpper()" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%" colspan="2">
                            Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtQuotDate" lang="1" />
                        </td>
                        <td style="width: 20%" align="center" colspan=2 >
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>						 
                        <td style="width: 1%">
                            <gw:button id="idBtnSubmit" img="Submit" text="Submit" onclick="OnProcess('Submit')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnPrint2" img="excel" alt="Print" text="Print" onclick="OnPrint2()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" colspan="2" style="width: 5%; white-space: nowrap">
                            Dept
                        </td>
                        <td style="width: 30%"  colspan="4" >
                            <gw:list id="lstDept" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="text-decoration: none;
                                color=#0000ff">Charger</a>
                        </td>
                        <td style="width: 60%" colspan="7">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        
                        <td align="right" style="width: 5%" colspan=2 >
                            Remark
                        </td>
                        <td style="width: 60%" colspan="12">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height:20%">
                        <td align="right" colspan="2" style="width: 5%; white-space: nowrap">
                            Work Desc
                        </td>
                        <td style="width: 60%" colspan="12">
                            <gw:textarea id="txtWorkDesc" styles="width:100%;height:95%" />
                        </td>
                    </tr>
                     <tr style="height:10%">
                        <td align="right" colspan="2" style="width: 5%; white-space: nowrap">
                           Recommend
                        </td>
                        <td style="width: 60%" colspan="12">
                            <gw:textarea id="txtRecommend" styles="width:100%;height:90%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="center" style="width: 1%">
                                    </td>
                                    <td style="width: 94%">
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnPO" img="P/R" text="P/R"onclick="OnAddNew('PR')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="idBtnItem" img="Item" text="Item" onclick="OnAddNew('ITEM')" />
                                    </td>
                                      <td style="width: 1%">
                                        <gw:button id="btnNewItem" img="new" alt="New" text="New" onclick="OnAddNew('FREE')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnUnDelete" img="UnDelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 60%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' 
								header='_QUOTATION_M_PK|_ITEM_PK|Item Code|Item Name|UOM|Req Qty|_PK|_BUSPARTNER_PK|Partner ID|Partner Name|U/Price|Amount|CCY|Payment Term|Pay Method|Price Type|Lead days|Agree YN|Remark|_PR_D_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|3|0|0|0|0|3|3|1|0|0|0|3|1|0|0'
                                check='|||||||||||||||||||' 
								editcol='0|0|0|1|1|1|0|0|0|0|1|1|1|1|1|1|1|1|1|0' 
								widths='0|0|1500|2000|800|1500|0|0|1500|2000|1500|1500|800|1500|1500|1500|1200|1000|1500|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()"
                                oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
<!------------------------------------------------------------------------------------>
</html>
