<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Sale Summary</title>
</head>

<script>

var G1_1_PARTNER_PK	= 0,
	G1_1_PARTNER_ID	= 1,
	G1_1_PARTNER_NM	= 2,
	G1_1_REQ_AMOUNT	= 3,
	G1_1_IN_AMOUNT	= 4;
	
var G1_2_DEPT_NAME       	= 0,
	G1_2_DATE   	     	= 1,
	G1_2_ITEM_PK   			= 2,
    G1_2_ITEM_CODE       	= 3,
    G1_2_ITEM_NAME       	= 4,
    G1_2_PO_UOM         	= 5,
	G1_2_PO_U_PRICE			= 6,
    G1_2_REQ_QTY         	= 7,
    G1_2_REQ_AMOUNT       	= 8,
	G1_2_IN_UOM         	= 9,
	G1_2_IN_U_PRICE			= 10,
    G1_2_IN_QTY          	= 11, 
	G1_2_IN_AMOUNT			= 12,
	G1_2_DIFF_QTY			= 13,
	G1_2_DIFF_AMOUNT		= 14,
	G1_2_QUO_PO_PRICE		= 15,
    G1_2_QUO_IN_PRICE		= 16,	
	G1_2_PO_SUPPLIER_PK		= 17,
	G1_2_PO_SUPPLIER_NAME	= 18,
	G1_2_IN_SUPPLIER_PK		= 19,
	G1_2_IN_SUPPLIER_NAME	= 20;

var G2_1_PARTNER_PK	= 0,
	G2_1_PARTNER_ID	= 1,
	G2_1_PARTNER_NM	= 2,
	G2_1_REQ_AMOUNT	= 3,
	G2_1_IN_AMOUNT	= 4;
	
	
var G2_2_PARTNER_PK	= 0,
	G2_2_PARTNER_ID	= 1,
	G2_2_PARTNER_NM	= 2,
	G2_2_REQ_AMOUNT	= 3,
	G2_2_IN_AMOUNT	= 4;	
	
var G2_3_DEPT_NAME       	= 0,
	G2_3_DATE   	     	= 1,
	G2_3_ITEM_PK   			= 2,
    G2_3_ITEM_CODE       	= 3,
    G2_3_ITEM_NAME       	= 4,
    G2_3_PO_UOM         	= 5,
	G2_3_PO_U_PRICE			= 6,
    G2_3_REQ_QTY         	= 7,
    G2_3_REQ_AMOUNT       	= 8,
	G2_3_DELI_QTY			= 9,
	G2_3_DELI_AMOUNT		= 10,
	G2_3_IN_UOM         	= 11,
	G2_3_IN_U_PRICE			= 12,
    G2_3_IN_QTY          	= 13, 
	G2_3_IN_AMOUNT			= 14,
	G2_3_DIFF_QTY			= 15,
	G2_3_DIFF_AMOUNT		= 16,
	G2_3_QUO_PO_PRICE		= 17,
    G2_3_QUO_IN_PRICE		= 18,	
	G2_3_PO_SUPPLIER_PK		= 19,
	G2_3_PO_SUPPLIER_NAME	= 20,
	G2_3_IN_SUPPLIER_PK		= 21,
	G2_3_IN_SUPPLIER_NAME	= 22;	
  
 //============================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }
  
 //===============================================================
 function BodyInit()
 { 
 	System.Translate(document);  // Translate to language session
 	//----------------
	 
    FormatGrid();
    //----------------  
 }
 //===============================================================

 function FormatGrid()
 {
 
	  var now = new Date(); 
      var lmonth, ldate;
    
      ldate=dtFromTab1.value ;         
      ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
      dtFromTab1.value=ldate ;	
	
	//----------------------------------	
 	  grdDetailTab1.GetGridControl().MergeCells  = 2 ;	
      grdDetailTab1.GetGridControl().MergeCol(0) = true ;	
      grdDetailTab1.GetGridControl().MergeCol(1) = true ;   	
      grdDetailTab1.GetGridControl().MergeCol(2) = true ;
	  grdDetailTab1.GetGridControl().MergeCol(3) = true ;
	  grdDetailTab1.GetGridControl().MergeCol(4) = true ;
	   
	  var ctr = grdSearchTab1.GetGridControl(); 
	    
	  ctr.ColFormat(G1_1_REQ_AMOUNT)    = "#,###,###,###,###,###.##";   
	  ctr.ColFormat(G1_1_IN_AMOUNT) 	= "#,###,###,###,###,###.##";  
	   
	  ctr = grdDetailTab1.GetGridControl(); 
	  
	  ctr.ColFormat(G1_2_PO_U_PRICE)  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G1_2_REQ_QTY) 	  = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G1_2_REQ_AMOUNT)  = "#,###,###,###,###,###";  
	  ctr.ColFormat(G1_2_IN_U_PRICE)  = "#,###,###,###,###,###.##"; 
      ctr.ColFormat(G1_2_IN_QTY)  	  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G1_2_IN_AMOUNT)   = "#,###,###,###,###,###";    
	  ctr.ColFormat(G1_2_DIFF_QTY)    = "#,###,###,###,###,###.##";
	  ctr.ColFormat(G1_2_DIFF_AMOUNT) = "#,###,###,###,###,###"; 
	  ctr.ColFormat(G1_2_QUO_PO_PRICE)= "#,###,###,###,###,###.##";
	  ctr.ColFormat(G1_2_QUO_IN_PRICE)= "#,###,###,###,###,###.##"; 
	  
	  ctr = grdDetailTab2.GetGridControl(); 
	  
	  ctr.ColFormat(G2_3_PO_U_PRICE)  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G2_3_REQ_QTY) 	  = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G2_3_REQ_AMOUNT)  = "#,###,###,###,###,###";  
	  ctr.ColFormat(G2_3_DELI_QTY) 	  = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G2_3_DELI_AMOUNT) = "#,###,###,###,###,###";  
	  ctr.ColFormat(G2_3_IN_U_PRICE)  = "#,###,###,###,###,###.##"; 
      ctr.ColFormat(G2_3_IN_QTY)  	  = "#,###,###,###,###,###.##"; 
	  ctr.ColFormat(G2_3_IN_AMOUNT)   = "#,###,###,###,###,###";    
	  ctr.ColFormat(G2_3_DIFF_QTY)    = "#,###,###,###,###,###.##";
	  ctr.ColFormat(G2_3_DIFF_AMOUNT) = "#,###,###,###,###,###"; 
	  ctr.ColFormat(G2_3_QUO_PO_PRICE)= "#,###,###,###,###,###.##";
	  ctr.ColFormat(G2_3_QUO_IN_PRICE)= "#,###,###,###,###,###.##"; 
	  
	  //-----------------------------
	  ctr = grdGroupTab2.GetGridControl(); 
	    
	  ctr.ColFormat(G2_1_REQ_AMOUNT)  	= "#,###,###,###,###,###.##";   
	  ctr.ColFormat(G2_1_IN_AMOUNT)		= "#,###,###,###,###,###.##";

	  //-----------------------------
	  ctr = grdPartnerTab2.GetGridControl(); 
	    
	  ctr.ColFormat(G2_2_REQ_AMOUNT)  	= "#,###,###,###,###,###.##";   
	  ctr.ColFormat(G2_2_IN_AMOUNT)		= "#,###,###,###,###,###.##";	  
	 //--------DEPT 
	var data;
	  
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
	lstWHTypeTab1.SetDataText(data);
	lstWHTypeTab1.value = '';
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
	lstWHTypeTab2.SetDataText(data);
	lstWHTypeTab2.value = '';	
		
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y' ORDER BY wh_id  ASC" )%>||SELECT ALL";    
    lstWarehouseTab1.SetDataText(data);
	lstWarehouseTab1.value = '';	
	
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y' ORDER BY wh_id  ASC" )%>||SELECT ALL";    
    lstWarehouseTab2.SetDataText(data);
	lstWarehouseTab2.value = '';	
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-') || ' ' || a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and a.group_type is not null connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd " )%>||SELECT ALL";       
    lstGroupTab1.SetDataText(data);
	lstGroupTab1.value = ''; 
	
	    data = "data|10|Grand Total|20|W/H Subtotal";
        lstGridTypeTab1.SetDataText(data);  
        lstGridTypeTab1.value = '20'; 
		
	    data = "data|10|Grand Total|20|W/H Subtotal";
        lstGridTypeTab2.SetDataText(data);  
        lstGridTypeTab2.value = '20'; 		
		
 }

 //===============================================================
 function OnSearch(pos)
 { 
 	switch (pos)
	{
		case 'Detail_Tab1' :
			if ( grdSearchTab1.row > 0 )
			{
				txtPartnerPKTab1.text = grdSearchTab1.GetGridData( grdSearchTab1.row, G1_1_PARTNER_PK );	
				
				data_epbp00390_1_2.Call("SELECT");
			}
			else
			{
				grdDetailTab1.ClearData();
			}
			
		break;
		
		case 'Search_Tab1' :		 
			data_epbp00390_1_1.Call("SELECT");
		break;
		
		case 'Search_Tab2' :		 
			data_epbp00390_2_1.Call("SELECT");
		break;
		
		case 'Partner_Tab2' :
			if ( grdGroupTab2.row > 0 )
			{
				txtPartnerGroupTab2.text = grdGroupTab2.GetGridData( grdGroupTab2.row, G2_1_PARTNER_PK );	
				
				data_epbp00390_2_2.Call("SELECT");
			}
			else
			{
				grdPartnerTab2.ClearData();
			}
			
		  	
		break;
		
		case 'Detail_Tab2':
		
			if ( grdPartnerTab2.row > 0 )
			{
				txtPartnerPKTab2.text = grdPartnerTab2.GetGridData( grdPartnerTab2.row, G2_2_PARTNER_PK );	
				
				data_epbp00390_2_3.Call("SELECT");
			}
			else
			{
				grdDetailTab2.ClearData();
			}
						
		break;
				 		
	}       
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
			case 'data_epbp00390_1_1':
				if (grdSearchTab1.rows >1)
				{
					grdSearchTab1.Subtotal( 1, 2, -1, '3!4');
				}
			break;
			
	  		case 'data_epbp00390_1_2':
				if ( grdDetailTab1.rows > 1 )
                {                   
					grdDetailTab1.SetCellBgColor( 1, G1_2_ITEM_CODE, grdDetailTab1.rows-1, G1_2_ITEM_NAME, 0xCCFFFF );
					
					grdDetailTab1.SetCellBgColor( 1, G1_2_PO_U_PRICE, grdDetailTab1.rows-1, G1_2_REQ_AMOUNT, 0xCCFFFF );
					grdDetailTab1.SetCellBgColor( 1, G1_2_IN_U_PRICE, grdDetailTab1.rows-1, G1_2_IN_AMOUNT,  0xCCFFFF );
					
					grdDetailTab1.GetGridControl().Cell( 7, 1, G1_2_DIFF_QTY,  	grdDetailTab1.rows - 1, G1_2_DIFF_QTY	  )   = 0x3300cc; 
					grdDetailTab1.GetGridControl().Cell( 7, 1, G1_2_QUO_PO_PRICE,  grdDetailTab1.rows - 1, G1_2_QUO_IN_PRICE )  = 0x3300cc; 
					
					
					if ( lstGridTypeTab1.value == '20' )
		            {
		                grdDetailTab1.Subtotal( 1, 2,0, '7!8!9!10!13!14!15!16');
		            }
		            else  
		            {
		                grdDetailTab1.Subtotal( 1, 2, -1, '7!8!9!10!13!14!15!16');
		            }
					
					
                }  
			break;
			
			case 'data_epbp00390_2_3':
				if ( grdDetailTab2.rows > 1 )
                {                   
					grdDetailTab2.SetCellBgColor( 1, G2_3_ITEM_CODE,  grdDetailTab2.rows-1, G2_3_ITEM_NAME, 0xCCFFFF );
					
					grdDetailTab2.SetCellBgColor( 1, G2_3_PO_U_PRICE, grdDetailTab2.rows-1, G2_3_REQ_AMOUNT, 0xCCFFFF );
					grdDetailTab2.SetCellBgColor( 1, G2_3_IN_U_PRICE, grdDetailTab2.rows-1, G2_3_IN_AMOUNT,  0xCCFFFF );
					
					grdDetailTab2.GetGridControl().Cell( 7, 1, G2_3_DIFF_QTY,  	  grdDetailTab2.rows - 1, G2_3_DIFF_QTY	  )   = 0x3300cc; 
					grdDetailTab2.GetGridControl().Cell( 7, 1, G2_3_QUO_PO_PRICE, grdDetailTab2.rows - 1, G2_3_QUO_IN_PRICE ) = 0x3300cc; 
					
					
					if ( lstGridTypeTab2.value == '20' )
		            {
		                grdDetailTab2.Subtotal( 1, 2,0, '7!8!9!10!13!14!15!16');
		            }
		            else  
		            {
		                grdDetailTab2.Subtotal( 1, 2, -1, '7!8!9!10!13!14!15!16');
		            }
					
					
                }  
			break;
			
            case 'data_epbp00390_2_1' :
				if ( grdGroupTab2.rows > 1 )
				{
			  		grdGroupTab2.Subtotal( 1, 2, -1, '3!4');
				}	
            break; 
			
            case 'data_epbp00390_2_2' :
				if ( grdPartnerTab2.rows > 1 )
				{				
			  		grdPartnerTab2.Subtotal( 1, 2, -1, '3!4');
				}	
            break;			 
			
			case "pro_epbp00390":
				alert(txtReturnValue.text);
			break;		         	            
      }	 
 }
 
 
 //=================================================================
 
 function OnProcess(pos)
 {
 	switch(pos)
	{
		case 'COLLECT_REQ':
			if ( confirm("Do you want to make collection request ?") )
			{
				txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
				
				pro_epbp00390.Call();
			}			
		break;
	}
 }
 //================================================================= 
 
 function OnReport(pos)
 {
 	switch(pos)
	{
		case 'FOSE01':		 
				var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00390_FOSE01.aspx?p_from_dt='+ dtFromTab1.value +'&p_to_dt='+dtToTab1.value +'&p_wh_type=' + lstWHTypeTab1.value +'&p_wh_pk=' + lstWarehouseTab1.value +'&p_group_pk=' + lstGroupTab1.value +'&p_item=' + txtItemTab1.text +'&p_partner_pk=' + txtPartnerPKTab1.text ;
		   
				System.OpenTargetPage(url); 		 	
		break;
		
		case 'FOSE02':		 
				var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00390_FOSE02.aspx?p_from_dt='+ dtFromTab2.value +'&p_to_dt='+dtToTab2.value +'&p_wh_type=' + lstWHTypeTab2.value +'&p_wh_pk=' + lstWarehouseTab2.value +'&p_item=' + txtItemTab2.text +'&p_partner_pk=' + txtPartnerPKTab2.text +'&p_partner_group_pk=' + txtPartnerGroupTab2.text;
		   
				System.OpenTargetPage(url); 		 	
		break;

		case 'FOSE03':		 
				var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00390_FOSE03.aspx?p_from_dt='+ dtFromTab1.value +'&p_to_dt='+dtToTab1.value +'&p_wh_type=' + lstWHTypeTab1.value +'&p_wh_pk=' + lstWarehouseTab1.value +'&p_group_pk=' + lstGroupTab1.value +'&p_item=' + txtItemTab1.text +'&p_partner_pk=' + txtPartnerPKTab1.text ;
		   
				System.OpenTargetPage(url); 			 	
		break; 	

		case 'FOSE04':		 
				var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00390_FOSE04.aspx?p_from_dt='+ dtFromTab1.value +'&p_to_dt='+dtToTab1.value +'&p_wh_type=' + lstWHTypeTab1.value +'&p_wh_pk=' + lstWarehouseTab1.value +'&p_group_pk=' + lstGroupTab1.value +'&p_item=' + txtItemTab1.text +'&p_partner_pk=' + txtPartnerPKTab1.text ;
		   
				System.OpenTargetPage(url); 	 		 	
		break;

		case 'FOSE05':		 
				var url = System.RootURL + '/standard/reports/ep/bp/rpt_epbp00390_FOSE05.aspx?p_from_dt='+ dtFromTab1.value +'&p_to_dt='+dtToTab1.value +'&p_wh_type=' + lstWHTypeTab1.value +'&p_wh_pk=' + lstWarehouseTab1.value +'&p_group_pk=' + lstGroupTab1.value +'&p_item=' + txtItemTab1.text +'&p_partner_pk=' + txtPartnerPKTab1.text ;
		   
				System.OpenTargetPage(url); 	 		 	
		break; 		
	}
 }
 //=========================================================================
function OnPopUp(pos)
{
	switch (pos)
	{		 
		case 'Report_Tab1':			 			
			var path = System.RootURL + '/standard/formsep/bp/epbp00393.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);					 
		break; 

		case 'Report_Tab2':			 			
			var path = System.RootURL + '/standard/formsep/bp/epbp00394.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);					 
		break; 		
	}	 
} 
 //===================================================================
</script>

<body>   
    
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00390_1_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00390_1_1" > 
                <input bind="grdSearchTab1" >
				    <input bind="dtFromTab1" /> 
				    <input bind="dtToTab1" /> 
					<input bind="lstGroupTab1" />					 				
                </input>
                <output bind="grdSearchTab1" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00390_1_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00390_1_2" > 
                <input bind="grdDetailTab1" >				 	 
                    <input bind="dtFromTab1" />
                    <input bind="dtToTab1" />                    
                    <input bind="lstWHTypeTab1" />
					<input bind="lstWarehouseTab1" />
					<input bind="lstGroupTab1" />					
                    <input bind="txtItemTab1" />
					<input bind="txtPartnerPKTab1" />					 			                                 			
                </input>
                <output bind="grdDetailTab1" />
            </dso>
        </xml>
    </gw:data>    
	<!---------------------------------------------------------------->
    <gw:data id="pro_epbp00390_1_3" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_EPBP00390_1_3" >
                <input>
                    <input bind="lstWHTypeTab1" />
                </input>
                <output>
                    <output bind="lstWarehouseTab1" />
                </output>
            </dso>
        </xml>
    </gw:data>		
	<!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00390_2_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00390_2_1" > 
                <input bind="grdGroupTab2" >
				    <input bind="dtFromTab2" /> 
				    <input bind="dtToTab2" /> 			 					 			
                </input>
                <output bind="grdGroupTab2" />
            </dso>
        </xml>
    </gw:data>	
	<!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00390_2_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00390_2_2" > 
                <input bind="grdPartnerTab2" >				 	 
                    <input bind="dtFromTab2" />
                    <input bind="dtToTab2" />                    
                    <input bind="txtPartnerGroupTab2" />					 			 			                                 		
                </input>
                <output bind="grdPartnerTab2" />
            </dso>
        </xml>
    </gw:data>  
	 <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00390_2_3" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00390_2_3" > 
                <input bind="grdDetailTab2" >				 	 
                    <input bind="dtFromTab2" />
                    <input bind="dtToTab2" />                    
                    <input bind="lstWHTypeTab2" />
					<input bind="lstWarehouseTab2" />					 			
                    <input bind="txtItemTab2" />
					<input bind="txtPartnerPKTab2" />	
					<input bind="txtPartnerGroupTab2" />		
                </input>
                <output bind="grdDetailTab2" />
            </dso>
        </xml>
    </gw:data>    
    <!-------------------------------------------------------------------------->
    <gw:tab>	
	
    <table border="1" style="width: 100%; height: 100%" name="Partner Group" >
		<tr style="height: 2%">
            <td style="width: 30%" id='left' >
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                         <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 94%" align="left"   >
                            <gw:datebox id="dtFromTab2" lang="<%=Session("Lang")%>"   />
                            ~<gw:datebox id="dtToTab2" lang="<%=Session("Lang")%>"   />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="ibtnSearchTab2" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab2')" />
                        </td>
                    </tr>                                       
                    <tr style="height: 29%">
                        <td colspan="4">
                            <gw:grid id='grdGroupTab2' header='_CUST_PK|Group|_Partner Name|P/O Amount|In Amount' 
								format='0|0|0|0|0'
                                aligns='0|0|0|3|3' 
								check='||||' 
								editcol='0|0|0|0|0' 
								widths='0|1800|1800|1800' 
								sorting='T' 
								styles='width:100%; height:100%'
                                oncellclick="OnSearch('Partner_Tab2')" />
                        </td>
                    </tr>					
					<tr style="height: 70%">
                        <td colspan="4">
                            <gw:grid id='grdPartnerTab2' header='_CUST_PK|Supplier|_Partner Name|P/O Amount|In Amount
								format='0|0|0|0|0'
                                aligns='0|0|0|3|3' 
								check='||||' 
								editcol='0|0|0|0|0' 
								widths='0|1800|1800|1800' 
								sorting='T' 
								styles='width:100%; height:100%'
                                oncellclick="OnSearch('Detail_Tab2')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id='right'>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%"> 
						<td style="width: 5%">
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle('TAB2')" />
						</td> 
						<td align="right" style="width: 5%; white-space: nowrap">
                            W/H
                        </td>
                        <td  style="width: 30%"  >
                            <gw:list id="lstWHTypeTab2" styles="width:100%" onchange="pro_EPBP00390_2_3.Call()"  />                         
                        </td>									
                        <td  style="width: 25%"  >
                            <gw:list id="lstWarehouseTab2" styles="width:100%" />                         
                        </td>					                      
                        <td style="width: 5%"  align="right" >
                            Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItemTab2" styles='width:100%' onenterkey="OnSearch('Detail_Tab2')" />
                        </td>	

						<td align="right" style="white-space: nowrap; width: 10%">
                            <gw:list id="lstGridTypeTab2" styles='width:100%;' />
                        </td>
						
                        <td style="width: 3%" align="right">                            
                        </td> 
						 
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPopUp('Report_Tab2')" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="ibtnSearchTab2_1" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab2')" />
                        </td>
						
                    </tr>
                    <tr>
                        <td colspan="12">
                            <gw:grid id='grdDetailTab2' 
								header='Dept Name|Date|_item_pk|Item Code|Item Name|UNIT|P/O Price|P/O Qty|P/O Amount|Supply Qty|Supply Amount|UNIT|In Price|In Qty|In Amount|Diff Qty|Diff Amount|_Quo P/O|_Quo In|_supplier_pk|P/O Supplier|_in_supplier|_In Supplier|Remark'
									format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
									aligns='0|1|0|0|0|1|3|3|3|3|3|1|3|3|3|3|3|3|3|0|0|0|0|0' 				 
									editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
									widths='2500|1200|0|1500|3000|800|1200|1200|1500|1200|1500|800|1200|1200|1500|1200|1500|1200|1200|0|2000|0|2000|2000'
									sorting='T' styles='width:100%; height:100%' acceptnulldate="T"/>
                        </td>
                    </tr>
                </table>							
            </td>
        </tr>	  				
	</table>
	
    <table border="1" style="width: 100%; height: 100%" name="By One Supplier">
        <tr style="height: 2%">
            <td style="width: 30%" id='left' >
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 94%" align="left"   >
                            <gw:datebox id="dtFromTab1" lang="<%=Session("Lang")%>" onchange="pro_EPBP00370_1.Call()" />
                            ~<gw:datebox id="dtToTab1" lang="<%=Session("Lang")%>" onchange="pro_EPBP00370_1.Call()" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="ibtnSearchTab1" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 5%" align="right">
                            Group
                        </td>
						<td style="width: 95%" align="right" colspan=2 >							
                            <gw:list id="lstGroupTab1" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="4">
                            <gw:grid id='grdSearchTab1' header='_CUST_PK|Partner ID|_Partner Name|P/O Amount|In Amount' 
								format='0|0|0|0|0'
                                aligns='0|0|0|3|3' 
								check='||||' 
								editcol='0|0|0|0|0' 
								widths='0|1800|1800|1800' 
								sorting='T' 
								styles='width:100%; height:100%'
                                oncellclick="OnSearch('Detail_Tab1')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id='right'>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%"> 
						<td style="width: 5%">
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle('TAB1')" />
						</td> 
						<td align="right" style="width: 5%; white-space: nowrap">
                            W/H
                        </td>
                        <td  style="width: 30%"  >
                            <gw:list id="lstWHTypeTab1" styles="width:100%" onchange="pro_EPBP00390_1_3.Call()"  />                         
                        </td>									
                        <td  style="width: 25%"  >
                            <gw:list id="lstWarehouseTab1" styles="width:100%" />                         
                        </td>					                      
                        <td style="width: 5%"  align="right" >
                            Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItemTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>	

						<td align="right" style="white-space: nowrap; width: 10%">
                            <gw:list id="lstGridTypeTab1" styles='width:100%;' />
                        </td>
						
                        <td style="width: 3%" align="right">                            
                        </td> 
						 
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPopUp('Report_Tab1')" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="ibtnSearchTab1_1" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab1')" />
                        </td>
						
                    </tr>
                    <tr>
                        <td colspan="12">
                            <gw:grid id='grdDetailTab1' 
								header='Dept Name|Date|_item_pk|Item Code|Item Name|UNIT|P/O Price|P/O Qty|P/O Amount|UNIT|In Price|In Qty|In Amount|Diff Qty|Diff Amount|_Quo P/O|_Quo In|_supplier_pk|P/O Supplier|_in_supplier|_In Supplier|Remark'
									format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
									aligns='0|1|0|0|0|1|3|3|3|1|3|3|3|3|3|3|3|0|0|0|0|0' 				 
									editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
									widths='2500|1200|0|1500|3000|800|1200|1200|1500|800|1200|1200|1500|1200|1500|1200|1200|0|2000|0|2000|2000'
									sorting='T' styles='width:100%; height:100%' acceptnulldate="T"/>
                        </td>
                    </tr>
                </table>							
            </td>
        </tr>
    </table>
   
    </gw:tab>  
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPKTab1" styles='width:100%;display:none' />
	<gw:textbox id="txtPartnerPKTab2" styles='width:100%;display:none' />
	<gw:textbox id="txtPartnerGroupTab2" styles='width:100%;display:none' />
	<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />	
</body>
</html>
