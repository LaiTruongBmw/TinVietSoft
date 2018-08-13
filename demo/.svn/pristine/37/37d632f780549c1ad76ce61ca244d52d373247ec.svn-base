<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>STOCK INCOMING</title>
</head>

<script>

 var G_WH		 = 0,		 	
 	 G_IN_DATE   = 1,
     G_SLIP_NO   = 2,	  
     G_REF_NO    = 3,
     G_SEQ       = 4,
     G_ITEM_CODE = 5,
     G_ITEM_NAME = 6,     
     G_IN_UOM    = 7,
	 G_LOT_NO	 = 8,
	 G_IN_QTY    = 9,
     G_UPRICE    = 10,
     G_ITEM_AMT  = 11,
     G_VAT_RATE  = 12,
     G_VAT_AMT   = 13,
     G_TOTAL_AMT = 14,
     G_CCY       = 15,    
     G_SUPPLIER  = 16,   
	 G_PL		 = 17, 
	 G_CHARGER   = 18,
     G_REMARK    = 19,
	 G_TR_PK	 = 20;
	 	    
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
        var data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||Select ALL";   
        lstWH.SetDataText(data);
        lstWH.value = '' ;
                 
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
		
        ctrl.ColFormat(G_IN_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_UPRICE)    = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_RATE)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_AMT)   = "###,###,###.###" ;
        ctrl.ColFormat(G_TOTAL_AMT) = "###,###,###.###" ;        
		
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Detail':
            data_fpma00131.Call("SELECT");
        break;                     
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_fpma00131' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WH,        grdItem.rows-1, G_WH,        true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_ITEM_AMT,  grdItem.rows-1, G_ITEM_AMT,  true);
		            grdItem.SetCellBold( 1, G_TOTAL_AMT, grdItem.rows-1, G_TOTAL_AMT, true);		                                         
		        }    
            break;    
			
			case 'pro_fpma00131':
				alert(txtValueReturn.text);
			break;        	            
      }	 
 }  
 
 //===============================================================
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

//====================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		case 'POP':		 
                    
        break; 
	}
}		
//====================================================================================
function OnProcess(pos)
{
	switch(pos)
	{
		case 'AutoInsert':
			if ( confirm('Do you want auto create Asset ?') && grdItem.row > 0 )
			{
				txtIncomeTrPK.text = grdItem.GetGridData( grdItem.row, G_TR_PK );
				pro_fpma00131.Call();
			}
		break;
	}
}
//====================================================================================
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fpma00131" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00131" > 
                <input bind="grdItem" >                  
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoSupplier" />
                    <input bind="txtItem" /> 
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_fpma00131" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_fpma00131"> 
                <input> 
			        <input bind="txtIncomeTrPK" />
			        <input bind="chkQty" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
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
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:list id="lstWH" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No/Supplier
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:textbox id="txtRefNoSupplier" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 8%" align="right">
                            <gw:checkbox id="chkQty" styles="color:blue" defaultvalue="Y|N" value="Y">Group</gw:checkbox>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnProcess" img="2" text="Process" styles='width:50' onclick="OnProcess('AutoInsert')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdItem' header='W/H|In Date|Slip No|Ref No|Seq|Item Code|Item Name|UOM|Lot No|In Qty|U/P|Amount|VAT(%)|VAT Amt|Total Amt|CCY|Supplier|P/L|Charger|Remark|_TR_PK'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|1|0|0|1|1|3|3|3|3|3|3|1|3|0|0|0|0'
                    check='||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='2000|1200|1200|1200|800|1500|2500|800|1200|1200|1200|1200|1200|1200|1200|800|2000|2000|1500|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtIncomeTrPK" styles="width:100%;display:none" />
    <gw:textbox id="txtValueReturn" styles="width:100%;display:none" />
</body>
</html>
