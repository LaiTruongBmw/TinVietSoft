<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Prod Incoming Checking</title>
</head>

<script>

 var G_WAREHOUSE = 0,
     G_IN_DATE   = 1,
     G_SLIP_NO   = 2,
     G_REF_NO    = 3,
     G_SEQ       = 4,
     G_ITEM_CODE = 5,
     G_ITEM_NAME = 6,
     G_IN_QTY    = 7,
     G_IN_UOM    = 8,
     G_LOT_NO    = 9,
	 G_LINE		 = 10,
	 G_CHARGER	 = 11,
     G_REMARK    = 12;
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
    OnChangeTab('radType');
    ChangeColorItem(lstWH.GetControl()); 
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        data = "<%=ESysLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='fppr00140_dc' order by nvl(v.NUM_VALUE1,0)")%>";
        lstReportType.SetDataText(data); 

        data = "data|10|Grand Total|20|W/H Subtotal|30|W/H-Date Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
        
        data = "data|1|Save|2|Submit|3|Approve|0|Select All";
        lstStatus.SetDataText(data);
        lstStatus.value='3';  
             
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
        ctrl.ColFormat(G_IN_QTY) = "###,###,###.###" ;       
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_fppr00140.Call("SELECT");
        break;

        case 'Sum':
            data_fppr00140_2.Call("SELECT");
        break;
        
        case 'Group':
            grdGroup.GridRefresh();
            data_fppr00140_1.Call("SELECT");
        break;        
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_fppr00140' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WAREHOUSE, grdItem.rows-1, G_WAREHOUSE, true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_LOT_NO,    grdItem.rows-1, G_LOT_NO,    true);
		             
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
			
			case 'data_fppr00140_2' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WAREHOUSE, grdItem.rows-1, G_WAREHOUSE, true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_LOT_NO,    grdItem.rows-1, G_LOT_NO,    true);
		             
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
    var url =System.RootURL + '/reports/fp/pr/'+lstReportType.value+'?p0='+ lstWH.value + '&p1='+ dtFrom.value +'&p2='+ dtTo.value +'&p3='+ txtRefNo.text+'&p4='+txtItem.text+'&p5='+lstWH.GetText()+'&p6='+lstStatus.value+'&p7='+txtCharger.text;
            window.open(url);  
}
 //===============================================================
 function OnChangeTab(pos)
 {
    switch(pos)
    {
        case 'radType':
            var strRad = radType.GetData();
                     
	        switch (strRad)
	        {
		        case 'Item':        		    
		            grdItem.style.display  = "";        		      
		            grdGroup.style.display = "none";	
					
					grdItem.GetGridControl().ColHidden(G_IN_DATE) = false ;	
					grdItem.GetGridControl().ColHidden(G_SLIP_NO) = false ;	
					grdItem.GetGridControl().ColHidden(G_REF_NO)  = false ;	
					grdItem.GetGridControl().ColHidden(G_SEQ   )  = false ; 
					
					grdItem.GetGridControl().ColHidden(G_CHARGER) = false ;
					grdItem.GetGridControl().ColHidden(G_REMARK ) = false ; 					 	     
                break;
                
				case 'Sum':        		    
		            grdItem.style.display  = "";        		      
		            grdGroup.style.display = "none";	
					
					grdItem.GetGridControl().ColHidden(G_IN_DATE) = true ;	
					grdItem.GetGridControl().ColHidden(G_SLIP_NO) = true ;	
					grdItem.GetGridControl().ColHidden(G_REF_NO)  = true ;	
					grdItem.GetGridControl().ColHidden(G_SEQ   )  = true ;
					
					grdItem.GetGridControl().ColHidden(G_CHARGER) = true ;
					grdItem.GetGridControl().ColHidden(G_REMARK ) = true ;  
                break;
				
                case 'Group':
		            grdItem.style.display  = "none";        		      
		            grdGroup.style.display = "";			    	   		    
                break;	
            }                
        break;
    } 
 }

function OnPopUp_WH(obj_list,n)
{
//fpab00790   :  P0=USER_PK,P1=parent_pk,p2=not_in_wh_pk,p3=storage_type,p4=use_yn,p5=wh_type,p6=get_parent_yn
     var l_get_parent;
     if(n==1)
        l_get_parent='Y';
     else    
        l_get_parent='N';
    
    var path = System.RootURL + '/form/fp/ab/fpab00790.aspx?p0=0&p3=0'+'&p4=Y'+'&p5=0'+'&p6='+l_get_parent;
    var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
    if ( obj != null )
    {
        obj_list.value = obj[0];                 
    }
}

function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "FF00FF";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "0066CC";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF4500";  //FF3333
                    }
                }                
            }
        }
    } 
 
 //===============================================================

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%= l_user %>lg_sel_fppr00140" > 
                <input bind="grdItem" >
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
                    <input bind="txtItem" />
                    <input bind="lstStatus" />
                    <input bind="txtCharger" />
                    
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>	
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%= l_user %>lg_sel_fppr00140_2" > 
                <input bind="grdItem" >
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
                    <input bind="txtItem" />
                    <input bind="lstStatus" />
                    <input bind="txtCharger" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>	
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%= l_user %>lg_sel_fppr00140_1" > 
                <input bind="grdGroup" >
                    <input  bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdGroup" />
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
                        <td style="width: 30%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No/Line
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:textbox id="txtRefNo" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Report
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right"><b>W/H</b></td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:list  id="lstWH" value='ALL' maxlen = "100" styles='width:100%' onchange="OnSearch('BALANCE')" >
                            <data>
                                <%=ESysLib.SetListDataSQL("SELECT to_char(w.pk), w.wh_id||' * ' || w.wh_name wh_name FROM tlg_in_warehouse w WHERE w.del_if = 0 AND w.use_yn = 'Y' and NVL (w.parent_pk, 0) = 0 ORDER BY w.wh_id")%>|ALL|Select All
                            </data>
                            </gw:list>
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 30%; white-space: nowrap">
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
                        <td style="width: 5%" align="left" colspan="3">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_Item">by Slip</span> 
								<span value="Sum" id="tab_Sum">by Item</span> 
                                <span value="Group" id="tab_Group">Group</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 5%" align="left" colspan="4">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                        <td style="width: 25%" align="right">Slip Status</td>
                                        <td style="width: 25%; white-space: nowrap">
                                            <gw:list id="lstStatus" styles='width:100%;' />
                                        </td>
                                        <td style="width: 10%" align="left">Charger</td>
                                        <td style="width: 30%; white-space: nowrap">
                                            <gw:textbox id="txtCharger" styles="width:100%" onenterkey="OnSearch('Detail')" />
                                        </td>
                                        <td style="width: 10%; white-space: nowrap">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>     
                <gw:grid id='grdItem'
                header='W/H Name|In Date|Slip No|Ref No|Seq|Item Code|Item Name|In Qty|UOM|Lot No|Line|Charger|Remark'
                format='0|4|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|1|0|0|1|0|0|3|1|1|0|0|0'
                check='||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1500|1200|1200|1200|800|1500|3500|1500|800|1500|1500|1500|2000'
                sorting='T'
                styles='width:100%; height:100%'
                />      
                
				 <gw:grid id='grdGroup'
                header='W/H Name|In Date|Slip No|Ref No|Seq|Item Code|Item Name|In Qty|UOM|Lot No|Line|Charger|Remark'
                format='0|4|0|0|0|0|0|0|1|0|0|0|0'
                aligns='0|1|0|0|1|0|0|3|1|1|0|0|0'
                check='||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1500|1200|1200|1200|800|1500|3500|1500|800|1500|1500|1500|2000'
                sorting='T'
                styles='width:100%; height:100%'
				group ="T"
                /> 
				                         
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
