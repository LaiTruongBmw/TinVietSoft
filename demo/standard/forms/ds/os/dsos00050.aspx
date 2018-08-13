<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Cons/Stock Shortage</title>
</head>

<script>
 var G_GROUP_CODE 	= 0,
     G_SPEC_01      = 1,
     G_SPEC_02      = 2,
     G_SPEC_03      = 3,
     G_SPEC_04      = 4,
     G_SPEC_05      = 5,
	 G_TCO_ITEM_PK	= 6,
	 G_ITEM_CODE    = 7,
     G_ITEM_NAME    = 8,
     G_STOCK_QTY    = 9,
	 G_PO_QTY		= 10,
	 G_EXPECT_QTY	= 11,	
	 G_REQ_QTY	    = 12,	
	 G_PRE_QTY      = 13,
	 G_SAFE_QTY     = 14;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //-------------------------

    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        var data ;
        data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||";   
        lstWH.SetDataText(data);
        lstWH.value = '' ;	
        
        data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
        lstItemGroup01.SetDataText(data);
        lstItemGroup01.value = '';	    	 
             
        grdDetail.GetGridControl().MergeCells  = 2 ;	
        grdDetail.GetGridControl().MergeCol(0) = true ;	
        grdDetail.GetGridControl().MergeCol(1) = true ;   	
        grdDetail.GetGridControl().MergeCol(2) = true ;	
        grdDetail.GetGridControl().MergeCol(3) = true ;
		grdDetail.GetGridControl().MergeCol(4) = true ;
		grdDetail.GetGridControl().MergeCol(5) = true ;
        //------------
        var ctrl = grdDetail.GetGridControl();

		
		ctrl.ColFormat(G_STOCK_QTY) = "###,###,###.##" ;
		ctrl.ColFormat(G_PO_QTY)    = "###,###,###.##" ;
		ctrl.ColFormat(G_EXPECT_QTY)= "###,###,###.##" ;
		ctrl.ColFormat(G_REQ_QTY)   = "###,###,###.##" ;
		ctrl.ColFormat(G_PRE_QTY)   = "###,###,###.##" ;
		ctrl.ColFormat(G_SAFE_QTY)  = "###,###,###.##" ;
		//------------
		
		grdDetail.GetGridControl().ColHidden(G_SPEC_01) = true ;
		grdDetail.GetGridControl().ColHidden(G_SPEC_02) = true ;
		grdDetail.GetGridControl().ColHidden(G_SPEC_03) = true ;
		grdDetail.GetGridControl().ColHidden(G_SPEC_04) = true ;
		grdDetail.GetGridControl().ColHidden(G_SPEC_05) = true ;	   
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'DETAIL':
            data_dsos00050.Call("SELECT");
        break;           
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_dsos00050' :
			    if ( grdDetail.rows > 1 )
		        { 					 					
					for (var i = 1 ; i < grdDetail.rows ; i++ ) 
					{	
						grdDetail.SetCellBgColor( 1, G_STOCK_QTY, grdDetail.rows - 1, G_EXPECT_QTY, 0xCCFFFF );
						grdDetail.SetCellBgColor( 1, G_REQ_QTY,   grdDetail.rows - 1, G_PRE_QTY,    0xFFFFCC );
											 
						if ( Number(grdDetail.GetGridData( i, G_PRE_QTY)) < Number(grdDetail.GetGridData( i, G_SAFE_QTY)) )
						{ 		            		
							grdDetail.SetCellFontColor(i, G_GROUP_CODE, i, G_SAFE_QTY, 0x3300cc);      	            
		            	}	
					}		            		             		            
		        }    
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport()
{         

     var url =System.RootURL + '/standard/reports/ds/os/rpt_dsos00050.aspx?p_ware_house='+ lstWH.value +'&p_item_group='+ lstItemGroup01.value +'&p_item='+ txtItem.text +'&p_bal_yn='+chkbal.value;
     window.open(url);                
 
} 
//=============================================================================
function OnColView(pos)
{
	switch(pos)
	{
		case "SPEC01":
			if ( chkSpec01.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_01) = false ;				 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_01) = true ;				 	
			}
			//--------	
		break;
		
		case "SPEC02":
			if ( chkSpec02.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_02) = false ;				 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_02) = true ;				 	
			}
			//--------	
		break;
		
		case "SPEC03":
			if ( chkSpec03.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_03) = false ;				 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_03) = true ;				 	
			}
			//--------	
		break;		
		
		case "SPEC04":
			if ( chkSpec04.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_04) = false ;				 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_04) = true ;				 	
			}
			//--------	
		break;	
		
		case "SPEC05":
			if ( chkSpec05.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_05) = false ;				 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_SPEC_05) = true ;				 	
			}
			//--------	
		break;		
		
		case "ITEM":
			if ( chkItem.value == 'Y' )
			{
				grdDetail.GetGridControl().ColHidden(G_ITEM_CODE) = false ;		
				grdDetail.GetGridControl().ColHidden(G_ITEM_NAME) = false ;		 
			}
			else
			{
				grdDetail.GetGridControl().ColHidden(G_ITEM_CODE) = true ;	
				grdDetail.GetGridControl().ColHidden(G_ITEM_NAME) = true ;			 	
			}
			//--------	
		break;			
	}		
}
//================================================================================

function OnViewDetails()
{
	var item = "" ;
	
	if ( grdDetail.row > 0 )
	{
		item = grdDetail.GetGridData( grdDetail.row, G_ITEM_CODE);
	}
	 
	var path = System.RootURL + '/standard/forms/ds/os/dsos00051.aspx?item=' + url_encode(item);
   	var object = System.OpenModal( path ,1050 , 500 ,  'resizable:yes;status:yes');	 	 
}

	//==================================================================================================
	
	function url_encode(s) 
	{
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
	
		for (var n = 0; n < string.length; n++) 
		{
	
			var c = string.charCodeAt(n);
	
			if (c < 128) 
			{
				utftext += String.fromCharCode(c);
			}
			else if ((c > 127) && (c < 2048)) 
			{
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else 
			{
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
		}
		return escape(utftext);
	}		
//================================================================================	
</script>

<body>
    <!-------------------------------------------------------------------------->
        <gw:data id="data_dsos00050" onreceive="OnDataReceive(this)">
            <xml> 
                <dso id="1" type="grid" function="st_lg_sel_dsos00050" > 
                    <input bind="grdDetail" >  
						<input bind="chkItemMap"	/>
				        <input bind="lstWH" />
                        <input bind="lstItemGroup01" />                                    
					    <input bind="txtItem" />						
					    <input bind="chkbal" />		
						<input bind="chkSpec01" />
						<input bind="chkSpec02" />
						<input bind="chkSpec03" />
						<input bind="chkSpec04" />
						<input bind="chkSpec05" />
						<input bind="chkItem" />				
                    </input>
                    <output bind="grdDetail" />
                </dso>
            </xml>
        </gw:data>
        <!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 25%; white-space: nowrap">
                <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('DETAIL')" />
            </td>
			<td style="width: 5%" align="right">
                <gw:checkbox id="chkItemMap" styles="width:30%" defaultvalue="Y|N" value ="N" onchange="OnSearch('DETAIL')" />
                Map
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 25%" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" onchange="OnSearch('DETAIL')" />
            </td>           
            <td style="width: 10%; white-space: nowrap">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
            </td>            
            <td style="width: 17%; white-space: nowrap" align="center" >
                <gw:checkbox id="chkbal" styles="width:30%" defaultvalue="Y|N" value ="N" onchange="OnSearch('DETAIL')" />
                Bal
            </td>
			<td align="center" style="white-space: nowrap; width: 1%" >
				<gw:button id="idBtnViewDetail" img="Detail" text="Details" onclick="OnViewDetails()" />
			</td>
            <td align="right" style="white-space: nowrap; width: 1%">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('DETAIL')" />
            </td>
        </tr>
		<tr style="height: 1%">			 
			<td style="width: 10%; white-space: nowrap" align="center" colspan=18 >
				Spec 01<gw:checkbox id="chkSpec01" defaultvalue="Y|N" value="N" onclick="OnColView('SPEC01')"  />
				Spec 02<gw:checkbox id="chkSpec02" defaultvalue="Y|N" value="N" onclick="OnColView('SPEC02')"  />
				Spec 03<gw:checkbox id="chkSpec03" defaultvalue="Y|N" value="N" onclick="OnColView('SPEC03')"  />
				Spec 04<gw:checkbox id="chkSpec04" defaultvalue="Y|N" value="N" onclick="OnColView('SPEC04')"  />	
				Spec 05<gw:checkbox id="chkSpec05" defaultvalue="Y|N" value="N" onclick="OnColView('SPEC05')"  />	
				Item<gw:checkbox id="chkItem" defaultvalue="Y|N" value="Y" onclick="OnColView('ITEM')"  />				 
			</td>			 
		</tr>
        <tr style="height: 98%">
            <td colspan="20">
                <gw:grid id='grdDetail' header='Group|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|_tco_item_pk|Item Code|Item Name|Stock Qty|P/O Qty|Expect Qty|Req Qty|Pre Qty|Safe Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|3|3|3|3|3|3' 
					check='||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1200|1200|1200|1200|1200|0|1500|2500|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
