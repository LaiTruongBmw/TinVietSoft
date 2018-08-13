<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>Stock Checking</title>
</head>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    
    var vPage = 0;
    
    var G_ROW_NUM      = 0 ,           
        G_Warehouse    = 1 ,
        G_Group        = 2 ,
        G_ST_Item      = 3 ,
        G_ST_Qty       = 4 ,
        G_Item_Name    = 5 ,
        G_UOM          = 6 ,
        G_Spec_1       = 7 ,
        G_Spec_2       = 8 ,
        G_Spec_3       = 9 ,
        G_Spec_4       = 10 ,
        G_Spec_5       = 11 ,
        G_Lot_No       = 12 ,
        G_Stock_Qty    = 13 ,
        G_Cons_Qty     = 14 ,
        G_TO_Qty       = 15 ,
        G_Comm_Qty     = 16 ,
        G_PO_Qty       = 17 ,
        G_Expect_Stock = 18 ;
        
    var G1_ROW_NUM      = 0 ,
        G1_Group        = 1 ,
        G1_ST_Item      = 2 ,
        G1_ST_Qty       = 3 ,
        G1_Item_Name    = 4 ,
        G1_UOM          = 5 ,
        G1_Spec_1       = 6 ,
        G1_Spec_2       = 7 ,
        G1_Spec_3       = 8 ,
        G1_Spec_4       = 9 ,
        G1_Spec_5       = 10 ,
        G1_Stock_Qty    = 11 ,
        G1_Cons_Qty     = 12 ,
        G1_TO_Qty       = 13 ,
        G1_Comm_Qty     = 14 ,
        G1_PO_Qty       = 15 ,
        G1_Expect_Stock = 16 ;
        
  var   G2_GRP_NM           = 0 ,
        G2_Item_Code        = 1 ,
        G2_Item_Name        = 2 ,
        G2_UOM              = 3 ,
        G2_Item_Pk          = 4 ,
        G2_Stock_Qty        = 5 ,
        G2_Comm_Qty         = 7 ,
        G2_Reserve_Qty      = 6 ,
        G2_PO_Qty           = 8 ,
        G2_PO_Booked_qty    = 9 ,
        G2_PO_Comm_Qty      = 10 ;
   //-----------------------------------------------------

function BodyInit()
{
    //-----------------
    BindingDataList();
    OnFormatGrid() ;
    
    //----------------
    OnChangeGridFormat();
}

//------------------------------------------------------------------------
function BindingDataList()
{
	var data = '';
	
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and pur_yn = 'Y' ")%>|ALL|Select all";     
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL' ;
    
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, wh_id || ' - ' || wh_name FROM inv.tin_warehouse WHERE del_if = 0 ORDER BY wh_id ")%>|ALL|Select all";     
    lstWareHouse.SetDataText(data);
    lstWareHouse.value = 'ALL' ;   
    
    //-------------------        
    data = "DATA|0|Lot Stock|1|Stock|2|Reserve Status";

    lstFormat.SetDataText(data);
    lstFormat.value = '2';
}

//-----------------------------------------------------

function OnExcel()
{
    var url =System.RootURL + '/reports/fp/bp/fpbp00010.aspx?wh_pk=' + lstWareHouse.value  + '&group_pk=' +lstGroup.value+ '&item=' + txtItem.text + '&lot='+ chkIncludeWH.value;
    window.open(url); 
}
//----------------------------------------------------
function OnFormatGrid()
{
    var trl = grdDetail.GetGridControl(); ;
        	
    trl.ColFormat( G_ST_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G_Stock_Qty )           = "###,###,###,###,###.##";
    trl.ColFormat( G_Cons_Qty )            = "###,###,###,###,###.##";
    trl.ColFormat( G_Cons_Qty )            = "###,###,###,###,###.##";
    trl.ColFormat( G_TO_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G_Comm_Qty )            = "###,###,###,###,###.##";  
    trl.ColFormat( G_PO_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G_Expect_Stock )        = "###,###,###,###,###.##";

    trl = grdDetail_1.GetGridControl(); 
        	
    trl.ColFormat( G1_ST_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G1_Stock_Qty )           = "###,###,###,###,###.##";
    trl.ColFormat( G1_Cons_Qty )            = "###,###,###,###,###.##";
    trl.ColFormat( G1_Cons_Qty )            = "###,###,###,###,###.##";
    trl.ColFormat( G1_TO_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G1_Comm_Qty )            = "###,###,###,###,###.##";  
    trl.ColFormat( G1_PO_Qty )              = "###,###,###,###,###.##";
    trl.ColFormat( G1_Expect_Stock )        = "###,###,###,###,###.##";  
    
    trl = grdDetail_2.GetGridControl(); 
    
    trl.ColFormat( G2_Stock_Qty )               = "###,###,###,###,###.##";
    trl.ColFormat( G2_Comm_Qty )                = "###,###,###,###,###.##";
    trl.ColFormat( G2_Reserve_Qty )             = "###,###,###,###,###.##"; 
    trl.ColFormat( G2_PO_Qty )                  = "###,###,###,###,###.##";
    trl.ColFormat( G2_PO_Booked_qty )           = "###,###,###,###,###.##";
    trl.ColFormat( G2_PO_Comm_Qty )             = "###,###,###,###,###.##";   
    //----------------
    grdDetail.GetGridControl().MergeCells = 2 ; 
    
    grdDetail.GetGridControl().MergeCol(0) = true ; 
    grdDetail.GetGridControl().MergeCol(1) = true ; 
    grdDetail.GetGridControl().MergeCol(2) = true ; 
    grdDetail.GetGridControl().MergeCol(3) = true ;
    grdDetail.GetGridControl().MergeCol(4) = true ;
    grdDetail.GetGridControl().MergeCol(5) = true ;
    grdDetail.GetGridControl().MergeCol(6) = true ;

    //----------------
    grdDetail_1.GetGridControl().MergeCells = 2 ; 
    
    grdDetail_1.GetGridControl().MergeCol(0) = true ; 
    grdDetail_1.GetGridControl().MergeCol(1) = true ; 
    grdDetail_1.GetGridControl().MergeCol(2) = true ; 
    grdDetail_1.GetGridControl().MergeCol(3) = true ;
    grdDetail_1.GetGridControl().MergeCol(4) = true ;
    grdDetail_1.GetGridControl().MergeCol(5) = true ;
    
     //----------------
    grdDetail_2.GetGridControl().MergeCells = 2 ; 
    
    grdDetail_2.GetGridControl().MergeCol(0) = true ; 
    grdDetail_2.GetGridControl().MergeCol(1) = true ; 
    grdDetail_2.GetGridControl().MergeCol(2) = true ; 
    grdDetail_2.GetGridControl().MergeCol(3) = true ;
    grdDetail_2.GetGridControl().MergeCol(4) = true ;
    grdDetail_2.GetGridControl().MergeCol(5) = true ;
    //----------------
    grdDetail.GetGridControl().FrozenCols  = G_Item_Name ;   
    //----------------
    grdDetail_1.GetGridControl().FrozenCols  = G1_Item_Name ;
     //----------------
    grdDetail_2.GetGridControl().FrozenCols  = G2_Item_Name ;
                                           
}
//-----------------------------------------------------
function OnChangeGridFormat()
{
    if ( lstFormat.value == '0' )
    {
        grdDetail.style.display   = ""     ;
        grdDetail_1.style.display = "none" ;
        grdDetail_2.style.display = "none" ;
    }
    else if ( lstFormat.value == '1' )
    {
        grdDetail.style.display   = "none" ;
        grdDetail_1.style.display = ""     ;
        grdDetail_2.style.display = "none" ;    
    }
    else if ( lstFormat.value == '2' )
    {
        grdDetail.style.display   = "none" ;
        grdDetail_1.style.display = "none" ;  
        grdDetail_2.style.display = ""     ;     
    } 
       
    //OnSearch('pro_count');
}
//-----------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'pro_count' :
            if ( lstFormat.value == '0' )
            {
                pro_fpbp00010.Call();
            }
            else if ( lstFormat.value == '1' )
            {
                pro_fpbp00010_1.Call();   
            }
            else if ( lstFormat.value == '2' )
            {
                pro_fpbp00010_2.Call();   
            } 
        break;
        
        case 'data_grid' :
            if ( lstFormat.value == '0' )
            {
                data_fpbp00010.Call("SELECT");
            }
            else if ( lstFormat.value == '1' )
            {
                data_fpbp00010_1.Call("SELECT");   
            }
            else if ( lstFormat.value == '2' )
            {
                data_fpbp00010_2.Call("SELECT"); 
            }        
        break;        
    }
}

//-----------------------------------------------------

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "pro_fpbp00010" :
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;

        case "pro_fpbp00010_1" :
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;
        
         case "pro_fpbp00010_2" :
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;
        
        case "data_fpbp00010" :
             //---------------
             if ( grdDetail.rows > 1 )
             {
                 grdDetail.SetCellBold( 1, G_ST_Qty,       grdDetail.rows - 1 , G_ST_Qty   ,    true);
                 grdDetail.SetCellBold( 1, G_Stock_Qty,    grdDetail.rows - 1 , G_Stock_Qty,    true);
                 grdDetail.SetCellBold( 1, G_Comm_Qty,     grdDetail.rows - 1 , G_Comm_Qty,     true);
                 grdDetail.SetCellBold( 1, G_Expect_Stock, grdDetail.rows - 1 , G_Expect_Stock, true);
                 //-------------------
                 grdDetail.GetGridControl().Cell( 7, 0, G_PO_Qty, grdDetail.rows - 1, G_PO_Qty ) = 0x3300cc;
             }    
             //---------------
        break;
        
        case "data_fpbp00010_1" :
             //---------------
             if ( grdDetail_1.rows > 1 )
             {             
                 grdDetail_1.SetCellBold( 1, G1_ST_Qty,       grdDetail_1.rows - 1, G1_ST_Qty   ,    true);
                 grdDetail_1.SetCellBold( 1, G1_Stock_Qty,    grdDetail_1.rows - 1, G1_Stock_Qty,    true);
                 grdDetail_1.SetCellBold( 1, G1_Comm_Qty,     grdDetail_1.rows - 1, G1_Comm_Qty,     true);
                 grdDetail_1.SetCellBold( 1, G1_Expect_Stock, grdDetail_1.rows - 1, G1_Expect_Stock, true);
                 //--------------------
                 grdDetail_1.GetGridControl().Cell( 7, 0, G1_PO_Qty, grdDetail_1.rows - 1, G1_PO_Qty ) = 0x3300cc;
             }
             //---------------
        break;      
        
         case "data_fpbp00010_2" :
             //---------------
             if ( grdDetail_2.rows > 1 )
             {             
                 grdDetail_2.SetCellBold( 1, G2_Stock_Qty, grdDetail_2.rows - 1, G2_Stock_Qty, true);
                 grdDetail_2.SetCellBold( 1, G2_PO_Qty,    grdDetail_2.rows - 1, G2_PO_Qty,    true);
                //--------------------
                 grdDetail_2.GetGridControl().Cell( 7, 0, G2_Reserve_Qty,   grdDetail_2.rows - 1, G2_Reserve_Qty   ) = 0x3300cc;
                 grdDetail_2.GetGridControl().Cell( 7, 0, G2_PO_Booked_qty, grdDetail_2.rows - 1, G2_PO_Booked_qty ) = 0x3300cc;                 
             }
             //---------------
        break;          
    }    
}
//--------------------------------------------------------------------
function OnCellDoubleClick(oGrid)
{
    var event_col = event.col ;
    var event_row = event.row ;
                
    switch (oGrid.id)         
    {		        
        case "grdDetail" :

              if ( event_col ==  G_PO_Qty )
              {
                 var url =System.RootURL + '/form/ep/bp/epbp00040.aspx?item_nm='+ grdDetail.GetGridData( event_row, G_Item_Name);
                 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
              }
              else if ( event_col == G_TO_Qty )
              {
                 var url =System.RootURL + '/form/ep/fm/epfm00060.aspx?item_nm='+ grdDetail.GetGridData( event_row, G_Item_Name);
                 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
              }
        break ;     

        case "grdDetail_1" :
              if ( event_col ==  G1_PO_Qty )
              {
                 var url =System.RootURL + '/form/ep/bp/epbp00040.aspx?item_nm='+ grdDetail_1.GetGridData( event_row, G1_Item_Name);
                 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
              }
              else if ( event_col == G1_TO_Qty )
              {
                 var url =System.RootURL + '/form/ep/fm/epfm00060.aspx?item_nm='+ grdDetail_1.GetGridData( event_row, G1_Item_Name);
                 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
              }
        break ;
        
        case "grdDetail_2" :
              if ( event_col ==  G2_Reserve_Qty )
              {
                 var url =System.RootURL + '/form/fp/bp/fpbp00040.aspx?item_nm='+ grdDetail_2.GetGridData( event_row, G2_Item_Name) +'&reserve_type=STOCK';
                 var obj = System.OpenModal( url ,1100 , 600 ,  'resizable:yes;status:yes'); 
              }
              else if ( event_col == G2_PO_Booked_qty )
              {
                 var url =System.RootURL + '/form/fp/bp/fpbp00040.aspx?item_nm='+ grdDetail_2.GetGridData( event_row, G2_Item_Name) +'&reserve_type=PO';
                 var obj = System.OpenModal( url ,1100 , 600 ,  'resizable:yes;status:yes'); 
              }              
              else if ( event_col == G2_PO_Qty )
              {
                 var url =System.RootURL + '/form/ep/bp/epbp00040.aspx?item_nm='+ grdDetail_2.GetGridData( event_row, G2_Item_Name);
                 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
              }
        break ;        
    }  
}
//--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    page1.style.cursor = 'none' ;
                    page1.style.color = 'red';
                    page2.style.cursor = 'hand' ;
                    page2.style.color = 'blue';
                    page3.style.cursor = 'hand' ;
                    page3.style.color = 'blue';
                    currentPage =1
                }
            break;
            case 'page2':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'none' ;
                page2.style.color = 'red';
                page3.style.cursor = 'hand' ;
                page3.style.color = 'blue';
                currentPage =2
            break;
            case 'page3':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'hand' ;
                page2.style.color = 'blue';
                page3.style.cursor = 'none' ;
                page3.style.color = 'red';
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        OnSearch('data_grid')
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
       pagePrev.style.cursor = 'none' ;
       pagePrev.style.color = 'gray';
       
        switch(pPage) 
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'gray';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'red';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';
            
        }
}
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';

            }
             if (page1.innerText == 1)
            {
                pagePrev.style.cursor = 'none' ;
                pagePrev.style.color = 'gray';

            }
        }
     
}
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                pageNext.style.cursor ='none';
                pageNext.style.color = 'gray';

            }
             if (page1.innerText != '1')
            {
                pagePrev.style.cursor ='hand';
                pagePrev.style.color = 'blue';

            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        obj.style.cursor ='hand';
        obj.style.color = 'blue';
    }
}
//------------------------------------------------------------

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpbp00010" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso  type="process" procedure="PROD.sp_pro_fpbp00010" > 
                  <input bind="idGrid" > 
                        <input bind="lstWareHouse" />
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpbp00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso  type="process" procedure="PROD.sp_pro_fpbp00010_1" > 
                  <input bind="idGrid" > 
                        <input bind="lstWareHouse" />
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpbp00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso  type="process" procedure="PROD.sp_pro_fpbp00010_2" > 
                  <input bind="idGrid" > 
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>        
    <!-------------------------------------------------------------------->
    <gw:data id="data_fpbp00010" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00010" > 
                    <input bind="grdDetail" > 
                        <input bind="lstWareHouse" />
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
					    <input bind="txtPage" />
					</input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="data_fpbp00010_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00010_1" > 
                    <input bind="grdDetail_1" > 
                        <input bind="lstWareHouse" />
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
					    <input bind="txtPage" />
					</input> 
                    <output bind="grdDetail_1" /> 
                </dso> 
            </xml> 
     </gw:data>     
    <!-------------------------------------------------------------------->
    <gw:data id="data_fpbp00010_2" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00010_2" > 
                    <input bind="grdDetail_2" > 
                        <input bind="lstGroup" />
                        <input bind="txtItem" />
					    <input bind="txtPage" />
					</input> 
                    <output bind="grdDetail_2" /> 
                </dso> 
            </xml> 
     </gw:data>          
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 8%" align="right">
                            <b>WareHouse</b>
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstWareHouse" styles="width:100%" value='ALL' onchange="OnSearch('pro_count')" />
                        </td>
                        <td style="width: 5%" align="right">
                            <b>Group</b>
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstGroup" styles="width:100%" value='ALL' onchange="OnSearch('pro_count')" />
                        </td>
                        <td style="width: 5%" align="right">
                            <b>Item</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('pro_count')" />
                        </td>
                        <td style="width: 19%" align="center">
                            <table width="100%" style="height: 100%">
                                <tr align="right">
                                    <td style="width: 5%;" align="right">
                                    </td>
                                    <td style="width: 80%;" align="center">
                                        <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 3%;" align="right">
                                        <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                                    </td>
                                    <td width="3%" align="center" style="color: gray; cursor: none">
                                        <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                                        </u></b>
                                    </td>
                                    <td width="3%" align="center">
                                        <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                                        </b>
                                    </td>
                                    <td width="3%" align="center">
                                        <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                                        </b>
                                    </td>
                                    <td style="width: 3%;" align="left">
                                        <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 3%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('pro_count')" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="btnExcel" img="excel" alt="Report" onclick="OnExcel()" />
                        </td>
                        <td style="width: 8%" align="right">
                            <gw:list id="lstFormat" styles="color:blue;width:100%" onchange="OnChangeGridFormat()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdDetail' header='_ROW_NUM|Warehouse|Group|ST Item|ST Qty|_Item Name|UOM|Spec 1|Spec 2|_Spec 3|_Spec 4|_Spec 5|Lot No|Stock Qty|Cons Qty|T/O Qty|Comm Qty|PO Qty|Expect Stock'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|3|0|1|0|0|0|0|0|0|3|3|3|3|3|3'
                    defaults='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1500|1500|3000|1200|2000|800|1200|1200|1000|1000|1000|1500|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles="width:100%;height:100%" oncelldblclick="OnCellDoubleClick(this)" />
                <gw:grid id='grdDetail_1' header='_ROW_NUM|Group|ST Item|ST Qty|_Item Name|UOM|Spec 1|Spec 2|_Spec 3|_Spec 4|_Spec 5|Stock Qty|Cons Qty|T/O Qty|Comm Qty|PO Qty|Expect Stock'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|3|0|1|0|0|0|0|0|3|3|3|3|3|3'
                    defaults='||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|2000|3000|1200|1000|800|1500|1000|1000|1000|1000|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles="width:100%;height:100%" oncelldblclick="OnCellDoubleClick(this)" />
                <gw:grid id='grdDetail_2'
                    header='GRP NM|Item Code|Item Name|UOM|_TCO_ITEM_PK|Stock Qty|Stock Reserve|Stock Comm|PO Qty|PO Reserve|PO Comm'
                    format='0|0|0|0|0|1|1|1|1|1|1'
                    aligns='0|0|0|1|0|0|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0'
                    widths='1500|1500|2500|1000|0|1500|1500|1500|1500|1500|1500'
                    sorting='T'styles='width:100%; height:100%'oncelldblclick='OnCellDoubleClick(this)'
                />
                               
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------->
    <gw:textbox id="txtPage" styles="display: none" />
    <!-------------------------------------------------------->
</body>
</html>
