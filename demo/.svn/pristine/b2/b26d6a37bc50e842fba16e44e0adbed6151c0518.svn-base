<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>IQC Request Entry</title>
	
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 //============================================================================
 var GS_PK  = 0 ;
 
var G1_IREQ_D_PK    = 0,
    G1_IREQ_M_PK    = 1,
    G1_SEQ          = 2,
    G1_PO_ITEM_PK   = 3,
    G1_PO_ITEM_CODE = 4,
    G1_PO_ITEM_NAME = 5,
    G1_ITEM_PK      = 6,
    G1_ITEM_CODE    = 7,
    G1_ITEM_NAME    = 8,
    G1_REQ_QTY_01   = 9,
    G1_REQ_UOM_01   = 10,
    G1_REQ_QTY_02   = 11,
    G1_REQ_UOM_02   = 12,
    G1_LOT_NO       = 13,
    G1_LOT_QTY      = 14,
    G1_REF_NO       = 15,
    G1_PO_D_PK      = 16,
    G1_REMARK       = 17;
     
 var flag ; // 'view', 'save'
 //============================================================================
function OnToggle()
{ 
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if ( imgArrow.status == "expand" )
    {
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}
 //============================================================================

 function BodyInit()
 { 
    txtRequesterName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtPLName.SetEnable(false);
    //------------------------------
    dtbSearchFrom.SetDataText(System.AddDate(dtbSearchFrom.GetData(),-30));
    //------------------------------
    
    FormatGrid();
    OnToggleGrid();
    
    OnAddNew('Master');
 }
 //============================================================================

 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat( G1_REQ_QTY_01 ) = "###,###,###,###,###.##";
      trl.ColFormat( G1_REQ_QTY_02 ) = "###,###,###,###,###.##";
      trl.ColFormat( G1_LOT_QTY )    = "###,###,###,###,###.##";
 } 
 //============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Requester':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequester.text   = obj[2];
                txtRequesterPK.text = obj[0];
            }
        break; 
                        
        case 'Supplier' :
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplierName.text     = object[2];                
	         }
        break;  
        
        case 'PL': // PL
            fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
           var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[0]; 
                txtPLName.text = oValue[2];
            }
        break;                    
    }
}        
        
//===========================================================================================
  
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'Master' :
            data_fpfo00060_1.StatusInsert();
            flag="view";
            //-------------------------------------------
            txtVoucherNo.text = "*** New IQC Req ***";
            txtRequesterName.text = "<%=Session("USER_NAME")%>";
            txtRequesterPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();                                 
        break;
        
        case 'PO' :        
            var fpath = System.RootURL + "/form/fp/ab/fpab00020.aspx?type=IQC";
            var oValue = System.OpenModal( fpath , 1000 , 650 , 'resizable:yes;status:yes', this);

            if ( oValue != null )
            {
                   for ( var i=0; i<oValue.length;i++)
                    {
                        var aTemp = oValue[i];
                        grdDetail.AddRow();

                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_IREQ_M_PK, txtMasterPK.text); // Master PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_D_PK, aTemp[5]); //_po_d_pk
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_PK,   aTemp[7]); // Item PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_CODE, aTemp[8]); // Item Code
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_NAME, aTemp[9]); // Item Name
                                                
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_PK,   aTemp[7]); // Item PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_CODE, aTemp[8]); // Item Code
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_NAME, aTemp[9]); // Item Name
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_QTY_01, aTemp[12]); // Req Qty 1
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_UOM_01, aTemp[13]); // Req UOM 1
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_QTY_02, aTemp[16]); // Req Qty 2
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_UOM_02, aTemp[17]); // Req UOM 2
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REF_NO, aTemp[1]); // PO No
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REMARK, 'P/O');                                                                        
                    }
            }        
        break;
        
        case 'SS' :        
            var fpath = System.RootURL + "/form/fp/fo/fpfo00063.aspx";
            var oValue = System.OpenModal( fpath , 1000 , 650 , 'resizable:yes;status:yes', this);

            if ( oValue != null )
            {
                   for ( var i=0; i<oValue.length;i++)
                    {
                        var aTemp = oValue[i];
                        grdDetail.AddRow();

                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_IREQ_M_PK, txtMasterPK.text); // Master PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_D_PK, aTemp[5]); //_po_d_pk
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_PK,   aTemp[7]); // Item PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_CODE, aTemp[8]); // Item Code
                        grdDetail.SetGridText(grdDetail.rows-1, G1_PO_ITEM_NAME, aTemp[9]); // Item Name
                                                
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_PK,   aTemp[7]); // Item PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_CODE, aTemp[8]); // Item Code
                        grdDetail.SetGridText(grdDetail.rows-1, G1_ITEM_NAME, aTemp[9]); // Item Name
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_QTY_01, aTemp[12]); // Req Qty 1
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_UOM_01, aTemp[13]); // Req UOM 1
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_QTY_02, aTemp[16]); // Req Qty 2
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REQ_UOM_02, aTemp[17]); // Req UOM 2
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REF_NO, aTemp[4]); // PO No
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_REMARK, 'SEA STOCK');                                                                       
                    }
            }        
        break;        
    }    
}  

//===========================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fpfo00060.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_fpfo00060_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_PK );
                    }
                    else
                    {
                        txtMasterPK.text = '' ;
                    }
                    
                    flag = 'view' ;
                    data_fpfo00060_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                flag = 'view' ;
                data_fpfo00060_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fpfo00060_2.Call("SELECT");
        break;
    }
}
//===========================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpfo00060_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_IREQ_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_IREQ_M_PK, txtMasterPK.text);
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
        
        case "data_fpfo00060_2":
            if ( grdDetail.rows > 1 )
            {
                 grdDetail.SetCellBgColor( 1, G1_LOT_NO,    grdDetail.rows-1, G1_LOT_NO,    0xCCFFFF );
                 grdDetail.SetCellBgColor( 1, G1_PO_ITEM_CODE, grdDetail.rows-1, G1_PO_ITEM_NAME, 0xCCFFFF );
                 
                 grdDetail.SetCellBold( 1, G1_LOT_NO,     grdDetail.rows-1, G1_LOT_NO,     true );  
                 grdDetail.SetCellBold( 1, G1_ITEM_CODE,  grdDetail.rows-1, G1_ITEM_CODE,  true ); 
                 grdDetail.SetCellBold( 1, G1_REQ_QTY_01, grdDetail.rows-1, G1_REQ_QTY_01, true ); 
                 grdDetail.SetCellBold( 1, G1_REQ_QTY_02, grdDetail.rows-1, G1_REQ_QTY_02, true );
                 
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_PO_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_PO_ITEM_PK) != grdDetail.GetGridData( i, G1_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_ITEM_CODE, i, G1_ITEM_NAME ) = 0x3300cc;
                    }
                }                  
            }
        break;       
    }
}

//===========================================================================================

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_fpfo00060_1.StatusDelete();
                data_fpfo00060_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G1_IREQ_D_PK ) == '' )
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

//===========================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData(i, G1_REQ_QTY_01)) == 0)
        {
            alert("Input IQC Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    //----------------
    return true;
}
//===========================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate())
            {
                data_fpfo00060_1.Call();
                flag='save';
            }            
        break;
        case 'Detail':        
            data_fpfo00060_2.Call();
        break;
    }
}

//===========================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_REQ_QTY_01 || col == G1_REQ_QTY_02 || col == G1_LOT_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {   
                grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(2)); 
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
    }
}
        
//===========================================================================================
 function OnChangePage()
 {
    var strRad = radSearchPage.GetData();
	
	switch (strRad)
	{
		case '2':  
            //----------------------------------------------------------- 
			grdDetail.GetGridControl().ColHidden(G1_Item_Name)    = true ;
			grdDetail.GetGridControl().ColHidden(G1_Unit)         = true ;
			grdDetail.GetGridControl().ColHidden(G1_Vendor)       = true ;
			grdDetail.GetGridControl().ColHidden(G1_Receiver_From)= true ;			
			grdDetail.GetGridControl().ColHidden(G1_Invoice_No)   = true ;
			grdDetail.GetGridControl().ColHidden(G1_Trading_Type) = true ;
			               
			grdDetail.GetGridControl().ColHidden(G1_Spec1) = false ;
			grdDetail.GetGridControl().ColHidden(G1_Spec2) = false ;
			grdDetail.GetGridControl().ColHidden(G1_Spec3) = false ;
			grdDetail.GetGridControl().ColHidden(G1_Spec4) = false ;
			grdDetail.GetGridControl().ColHidden(G1_Spec5) = false ;

			//--------------------------
        break;
        case '1':
                
			grdDetail.GetGridControl().ColHidden(G1_Item_Name)    = false ;
			grdDetail.GetGridControl().ColHidden(G1_Unit)         = false ;
			grdDetail.GetGridControl().ColHidden(G1_Vendor)       = true ;
			grdDetail.GetGridControl().ColHidden(G1_Receiver_From)= false ;			
			grdDetail.GetGridControl().ColHidden(G1_Invoice_No)   = false ;
			grdDetail.GetGridControl().ColHidden(G1_Trading_Type) = false ;			

			grdDetail.GetGridControl().ColHidden(G1_Spec1) = true ;
			grdDetail.GetGridControl().ColHidden(G1_Spec2) = true ;
			grdDetail.GetGridControl().ColHidden(G1_Spec3) = true ;
			grdDetail.GetGridControl().ColHidden(G1_Spec4) = true ;
			grdDetail.GetGridControl().ColHidden(G1_Spec5) = true ;
			//--------------------------
        break; 
    }
}
      
//===========================================================================================
function OnGridCellDoubleClick(oGrid)
{
    var  row, col ;
    
    row = event.row ;
    col = event.col ; 
    
    if ( col == G1_REQ_UOM_01 || col == G1_REQ_UOM_02 )
    {
           var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
           var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
           
           if ( obj != null )
           {
                grdDetail.SetGridText( row, col, obj[1]);
           }	    
    }
    /*else if ( col == G1_Roll_Num )
    {
        if ( txtMasterPK.text != '' )
        {
            if ( grdDetail.row > 0 )
            {
               var path = System.RootURL + '/form/fp/fo/fpfo00061.aspx?iqcreq_pk=' + txtMasterPK.text +'&iqcreq_no=' + txtVoucherNo.text + '&iqcreqd_pk=' + grdDetail.GetGridData( grdDetail.row, G1_Detail_PK);
            }
            else
            {
               var path = System.RootURL + '/form/fp/fo/fpfo00061.aspx?iqcreq_pk=' + txtMasterPK.text +'&iqcreq_no=' + txtVoucherNo.text ;            
            } 
            //----------   
            var obj = System.OpenModal( path , 900 , 550, 'resizable:yes;status:yes');
           
            if ( obj != null )
            {
                grdDetail.SetGridText( row, col, obj[1]);
            }
            //----------
        }
        else 
        {
            alert('Pls Save IQC Req first.');
        }  	    
    }*/
    else if ( col == G1_ITEM_CODE || col == G1_ITEM_NAME )
    {
           var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
           var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
           
           if ( object != null )
           {
                grdDetail.SetGridText( row, G1_ITEM_PK,   object[0] );
                grdDetail.SetGridText( row, G1_ITEM_CODE, object[1] );
                grdDetail.SetGridText( row, G1_ITEM_NAME, object[2] );
           }
    }      
}
//===================================================================================== 
function OnPrint(index)
{
    switch(index)
    {
        case 1:
            var url = System.RootURL + '/reports/fp/fo/fpfo00060.aspx?tpr_reqiqc_pk=' + txtMasterPK.text ;
            System.OpenTargetPage(url); 
        break;
        case 2:
            var url = System.RootURL + "/system/ReportEngine.aspx?file=fp/fo/rpt_fpfo00060.rpt&procedure=PROD.sp_rpt_fpfo00060&parameter=" + txtMasterPK.text ;              
            System.OpenTargetPage(url); 
        break;
        case 3:
            var url = System.RootURL + '/reports/fp/fo/fpfo00060_Posli.aspx?p_tpr_reqiqc_pk=' + txtMasterPK.text;
            System.OpenTargetPage(url); 
        break;  
    }
}
//===========================================import tai lieu huong dang lam IQC=========================================
function OnAttachDoc()
{
    if(txtMasterPK.text !="")
    {
          var path   = System.RootURL + '/form/fp/fo/fpfo00062.aspx?qc_ireq_m_pk=' + txtMasterPK.text;
          var object = System.OpenModal( path , 950 , 650, 'resizable:yes;status:yes');   
    }
    else
    {
        alert("Please, Select IQC request first!")
    }
}
 
//======================================================================
function OnUnDelete()
{
	grdDetail.UnDeleteRow();
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_PO_ITEM_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G1_PO_ITEM_NAME) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY_02)   = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM_02)   = true ;
		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_PO_ITEM_CODE) = false ;
		grdDetail.GetGridControl().ColHidden(G1_PO_ITEM_NAME) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY_02)   = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM_02)   = false ;				
		
        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//======================================================================   
function OnOpenLabel()
{
    if ( txtMasterPK.text != '' )
    {
        
        var path = System.RootURL + '/form/fp/fo/fpfo00061.aspx?iqcreq_pk=' + txtMasterPK.text +'&iqcreq_no=' + txtVoucherNo.text ;            
        //----------   
        var obj = System.OpenModal( path , 900 , 550, 'resizable:yes;status:yes');
        //----------
    }
    else 
    {
        alert('Pls Save IQC Req first.');
    }  	    
}  
//======================================================================
 
    </script>

</head>
<body>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00060" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%= l_user %>lg_sel_fpfo00060" > 
                <input bind="grdSearch" >
                    <input bind="txtSearchNo" />
				    <input bind="dtbSearchFrom" />
                    <input bind="dtbSearchTo" />
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00060_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="control" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%= l_user %>lg_sel_fpfo00060_1" procedure = "<%= l_user %>lg_upd_fpfo00060_1"> 
                <input>
                        <inout bind="txtMasterPK" />
                        <inout bind="dtVoucherDate" />
                        <inout bind="txtVoucherNo" />
                        <inout bind="dtDeliDate" />
                        <inout bind="txtRequesterPK" />                        
                        <inout bind="txtRequesterName" />
                        <inout bind="txtSupplierPK" />
                        <inout bind="txtSupplierName" />
                        <inout bind="txtPLPK" />
                        <inout bind="txtPLName" />
                        <inout bind="txtDescription" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00060_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="<%= l_user %>lg_sel_fpfo00060_2" procedure = "<%= l_user %>lg_upd_fpfo00060_2" > 
                <input bind="grdDetail" >
                    <input bind="txtMasterPK" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table border="1" style="height: 100%; width: 100%">
        <tr>
            <td style="width: 25%" id="left">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Date</td>
                        <td align="left" style="white-space: nowrap" colspan="2">
                            <gw:datebox id="dtbSearchFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbSearchTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            No</td>
                        <td style="width: 89%">
                            <gw:textbox id="txtSearchNo" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_pk|V/Date|Voucher No|Supplier" format="0|4|0|0"
                                aligns="0|0|0|0" defaults="||||" editcol="0|0|0|0" widths="0|1200|1800|0" styles="width:100%; height:100%"
                                sorting="F" oncellclick="OnSearch('grdMaster')" param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%" id="right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
                        <td style="width: 9%" align="right">
                            Req No</td>
                        <td style="width: 25%">
                            <gw:textbox id="txtVoucherNo" styles="width:100%" csstype="mandatory" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Voucher Date</td>
                        <td style="width: 10%">
                            <gw:datebox id="dtVoucherDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;background-color : #fffaaf;" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Deli Date
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtDeliDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;background-color : #fffaaf;" />
                        </td>
                        <td style="width: 5%">
                            <gw:icon id="idBtnLabel" img="2" text="Label" styles='width:100%' onclick="OnOpenLabel()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnExcel2" img="excel" alt="Excel" text="Excel" onclick="OnPrint(3)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnAddDoc" img="attach" alt="Attach IQC Document" onclick="OnAttachDoc()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" colspan="2" style="white-space: nowrap">
                            <a title="PL" onclick="OnPopUp('PL')" style="color: #0000ff; cursor: hand"><b>P/L Center</b></a>
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtPLPK" styles="width: 100%;display: none" />
                            <gw:textbox id="txtPLName" styles="width: 100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            <a onclick="OnPopUp('Supplier')" href="#tips" style="color=#0000ff">Supplier</a>
                        </td>
                        <td colspan="8">
                            <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtSupplierPK" styles="display=none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" colspan="2">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Requester')">Requester </b>
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtRequesterPK" styles="display:none;" />
                            <gw:textbox id="txtRequesterName" styles="width:100%;" />
                        </td>
                        <td align="right">
                            Remark
                        </td>
                        <td colspan="8">
                            <gw:textbox id="txtDescription" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="left" colspan="13">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 96%" align="left">
                                        <img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="ibtnItemPO" img="2" text="P/O" alt="P/O Item" onclick="OnAddNew('PO')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="ibtnItemSS" img="2" text="Sea Stock" alt="Sea Stock Item" onclick="OnAddNew('SS')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteD" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUDeleteD" img="udelete" alt="UnDelete" text="UnDelete" onclick="OnUnDeleteDetail()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' header='_PK|_QC_IREQ_M_PK|Seq|_PO_ITEM_PK|P/O Item Code|P/O Item Name|_TCO_ITEM_PK|Item Code|Item Name|Req Qty 1|UOM|Req Qty 2|UOM|Lot No|Lot Qty|Ref No|_PO_D_PK|Remark'
                                aligns='0|0|1|0|0|0|0|0|0|3|1|3|1|0|3|0|0|0' 
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||||||' editcol='0|0|1|0|0|0|0|0|0|1|0|1|0|1|1|0|0|1' widths='0|0|800|0|2000|2500|0|2000|2500|1200|800|1200|800|1500|1200|1500|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)"
                                onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none;" />
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
