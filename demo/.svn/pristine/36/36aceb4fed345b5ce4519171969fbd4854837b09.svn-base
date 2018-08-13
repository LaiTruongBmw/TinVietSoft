<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>Reserve Inquiry</title>
</head>

<script>
/*Start Check if it call from fpbp00010.aspx form*/
  var pop_stitem_name = "<%=Request.querystring("item_nm")%>"; 
  
  var reserve_type = "<%=Request.querystring("reserve_type")%>"; 

/*End*/
 //---------------------------------------------------------
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session

    //----------------
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-60));
    //----------------
    BindingDataList();
    FormatGrid();
    
    if ( reserve_type != "" )
    {
        txtItem.text   = pop_stitem_name ;               
        
        if ( reserve_type == "STOCK" )
        {
            tab.SetPage(0);
            cboStatus.value = 'TS' ;
        }    
        else
        {
            tab.SetPage(1);
            cboStatus.value = 'CF' ;
        }    
        OnSearch();
    }    
        
 }
  //---------------------------------------------------------

 function FormatGrid()
 {
        grdMatBooking.GetGridControl().FrozenCols  = 4 ;
        grdPOBooking.GetGridControl().FrozenCols   = 4 ;
        //------------
        grdMatBooking.GetGridControl().ColFormat(10)  = "###,###,###.##" ;
        grdMatBooking.GetGridControl().ColFormat(11)  = "###,###,###.##" ;
        grdPOBooking.GetGridControl().ColFormat(10)   = "###,###,###.##" ; 
        grdPOBooking.GetGridControl().ColFormat(11)   = "###,###,###.##" ;     
        
        grdMatBooking.GetGridControl().MergeCells = 2 ; 
    
        grdMatBooking.GetGridControl().MergeCol(0) = true ; 
        grdMatBooking.GetGridControl().MergeCol(1) = true ; 
        grdMatBooking.GetGridControl().MergeCol(2) = true ; 
        grdMatBooking.GetGridControl().MergeCol(3) = true ;   
        
        grdPOBooking.GetGridControl().MergeCells = 2 ; 
    
        grdPOBooking.GetGridControl().MergeCol(0) = true ; 
        grdPOBooking.GetGridControl().MergeCol(1) = true ; 
        grdPOBooking.GetGridControl().MergeCol(2) = true ; 
        grdPOBooking.GetGridControl().MergeCol(3) = true ;            
 }
 
 //---------------------------------------------------------
 
 function BindingDataList()
 {   
       var data ;
       
       data = "<%=ESysLib.SetListDataSQL("select 'ALL' code, 'Select ALL' code_nm from dual union all select code, code_nm from tco_abcode,tco_abcodegrp where   tco_abcodegrp.pk=tco_abcode.tco_abcodegrp_pk   and UPPER(tco_abcodegrp.id) like UPPER('PRAB0090') and tco_abcode.use_if='1'")%>" ;
       cboStatus.SetDataText(data);
       //-------------       
 }

 //----------------------------------------------
 
 function OnSearch()
 {
    if ( tab.GetCurrentPageNo() == 0 )
    {       
	    fpbp00040.Call('SELECT');
	}
	else
	{
	    fpbp00040_1.Call('SELECT');
	}    
 }

//------------------------------------------------------------------
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {	
            case 'fpbp00040_1':                       
            
            break;                            
      }	 
 }
 
//------------------------------------------------------------------  

</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="fpbp00040" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="prod.sp_sel_fpbp00040" > 
                <input bind="grdMatBooking" >    
				    <input bind="dtFrom" />
				    <input bind="dtTo" />
				    <input bind="txtBookNo" />
				    <input bind="cboStatus" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdMatBooking" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="fpbp00040_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="prod.sp_sel_fpbp00040_1" > 
                <input bind="grdPOBooking" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />
				    <input bind="txtBookNo" />
				    <input bind="cboStatus" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdPOBooking" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            <b>Book Date</b></td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%" align="right">
                            Book No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtBookNo" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:list id="cboStatus" styles="width:100%;" onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            <b>Item</b>
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:tab id="tab">
                    <table name="Mat Booking" style="width: 100%; height: 100%"  >
                        <tr>
                            <td>                                    
                                 <gw:grid id='grdMatBooking'
                                    header='_TCO_ITEM_PK|Item Code|Item Name|UOM|_PK|Book No|Prod Code|Prod name|UOM|Book Date|Book Qty|Reserve Qty|Stock WH|Reserve WH|_CHARGER_EMP_PK|Employee'
                                    format='0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0'
                                    aligns='0|0|0|1|0|0|0|0|1|1|3|3|0|0|0|0'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='1000|1500|3000|800|1000|1500|1500|1500|800|1200|1200|1200|1500|1500|1000|1000'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                    />                        
                            </td>
                        </tr>
                    </table>                 
                    <table name="PO Booking" style="width: 100%; height: 100%"  >
                        <tr>
                            <td>
                                <gw:grid id='grdPOBooking'
                                    header='_TCO_ITEM_PK|Item Code|Item Name|UOM|_PK|Book No|Prod Code|Prod name|UOM|Book Date|Book Qty|Reserve Qty|_CHARGER_EMP_PK|Employee'
                                    format='0|0|0|0|0|0|0|0|0|4|0|0|0|0'
                                    aligns='0|0|0|1|0|0|0|0|1|1|3|3|0|0'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='1000|1500|3000|800|1000|1500|1200|1200|800|1200|1200|1200|1000|1000'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                    />                                                    
                            </td>
                        </tr>
                    </table> 
                </gw:tab>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
