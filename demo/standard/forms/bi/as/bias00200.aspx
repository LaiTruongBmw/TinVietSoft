<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Stock Others In/Out Checking</title>
</head>

<script>

 var G_TR_TYPE	 = 0,
	 G_OUTDATE   = 1,
     G_SLIP_NO   = 2,
     G_REF_NO    = 3,
     G_SEQ       = 4,
     G_ITEM_CODE = 5,
     G_ITEM_NAME = 6,
     G_OUT_QTY   = 7,
     G_OUT_UOM   = 8,      
     G_OUT_WH    = 9,     
     G_OUT_PL    = 10,   
     G_CHARGER   = 11,	 
     G_Remark    = 12;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    //----------------
    
    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn='Y' order by wh_id ")%>||";   
        lstTrWH.SetDataText(data);
        lstTrWH.value = '' ;
		
		data = 'DATA|I130|OTHERS IN|O130|OTHERS OUT||';
     	lstTrType.SetDataText(data); 
	 
        data = "data|10|Type 1";
        lstReportType.SetDataText(data);  
        lstReportType.value = '10'; 

        data = "data|10|Grand Total|20|W/H Subtotal|30|W/H-Date Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
        
		//---------------------
		data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';   
	    //---------------------
		 
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
        ctrl.ColFormat(G_OUT_QTY) = "###,###,###.###" ;        
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Detail':
            data_bias00200.Call("SELECT");
        break;     
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bias00200' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_OUT_WH,    grdItem.rows-1, G_OUT_WH,     true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_OUT_QTY,    grdItem.rows-1, G_OUT_QTY,  true); 		             
		            
		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '7');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '7');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdItem.Subtotal( 0, 2, 1, '7');
		            } 	
		        }    
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport()
{     
    switch (lstReportType.value)
    {
        case '10' :               
            var url =System.RootURL + '/reports/bi/as/rpt_bias00200_ST01.aspx?p_tr_type='+ lstTrType.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_group_pk='+ lstGroup.value +'&p_item='+txtItem.text +'&p_tr_wh_pk='+ lstTrWH.value ;
            window.open(url);                
        break;                  
    }     
} 
 //===============================================================

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bias00200" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00200" > 
                <input bind="grdItem" >    
					<input bind="lstTrType" />                
				    <input bind="dtFrom" />
                    <input bind="dtTo" />     
					<input bind="lstGroup" />           
                    <input bind="txtItem" />
					<input bind="lstTrWH" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>     
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Tr W/H
                        </td>
                        <td style="width: 35%; white-space: nowrap" colspan=3 >
                            <gw:list id="lstTrWH" styles="width:100%;" />	
                        </td>
						 
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Report
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr>
					    <td style="width: 5%; white-space: nowrap" align="right">
                             Tr Type 
                        </td>
						<td style="width: 20%; white-space: nowrap" >  
							<gw:list id="lstTrType" styles="width:100%;" />	                       
                        </td>	
                        <td style="width: 5%; white-space: nowrap" align="right" >  
							Item                         
                        </td>						                        
                        <td style="width: 30%; white-space: nowrap" colspan=2 >						
                            <gw:list id="lstGroup" styles='width:100%;' /> 			 
                        </td>                       					     
                        <td style="width: 15%; white-space: nowrap"  >   
							<gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />	                         							 
                        </td>				
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Sub Total
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="left" colspan="7">                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdItem' header='Tr Type|Slip Date|Slip No|Ref No|Seq|Item Code|Item Name|Tr Qty|UOM|Tr W/H|Tr P/L|Charger|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|1|0|0|1|0|0|3|1|0|0|0|0'
                    check='||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|1200|1200|1200|800|2000|3000|1200|1000|2000|2000|2000|1000'
                    sorting='T' styles='width:100%; height:100%' />                 
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
