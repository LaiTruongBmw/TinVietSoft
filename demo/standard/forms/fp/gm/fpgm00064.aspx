<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>P/O Component Shortage</title>
</head>

<script>
    
var G_RG			= 0,
	G_PO_NO			= 1,
	G_STYLE			= 2,
	G_SPEC			= 3,
	G_COMP			= 4,
	G_PLAN_QTY		= 5,
	G_TOTAL_PRE_QTY	= 6,
	G_TOTAL_SEW_QTY	= 7,
	G_SEW_TARGET	= 8,
	G_CURR_PRE_QTY	= 9,
	G_CURR_SEW_QTY	= 10,
	G_SHORT_QTY		= 11,
	G_01			= 12,
	G_02			= 13,
	G_03			= 14,
	G_04			= 15,
	G_05			= 16,
	G_06			= 17,
	G_07			= 18,
	G_08			= 19,
	G_09			= 20,
	G_10			= 21,
	G_11			= 22,
	G_12			= 23,
	G_13			= 24;
    
 //========================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //-----------------------------------------------------
    FormatGrid();	    
}

//========================================================================
function FormatGrid()
{    
    var data="";    
        
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
    lstFactory.SetDataText( data);
	
    var ctrl = grdOrdPlan.GetGridControl();
    
    ctrl.ColFormat(G_PLAN_QTY)      = "###,###,###,###";
    ctrl.ColFormat(G_TOTAL_PRE_QTY) = "###,###,###,###"; 
    ctrl.ColFormat(G_TOTAL_SEW_QTY) = "###,###,###,###";         
    ctrl.ColFormat(G_SEW_TARGET)    = "###,###,###,###";
    ctrl.ColFormat(G_CURR_PRE_QTY)  = "###,###,###,###";
	ctrl.ColFormat(G_CURR_SEW_QTY)  = "###,###,###,###";
	ctrl.ColFormat(G_SHORT_QTY)     = "###,###,###,###";
	ctrl.ColFormat(G_01)            = "###,###,###,###";
	ctrl.ColFormat(G_02)            = "###,###,###,###";
	ctrl.ColFormat(G_03)            = "###,###,###,###";
	ctrl.ColFormat(G_11)            = "###,###,###,###";
	ctrl.ColFormat(G_05)            = "###,###,###,###";
	ctrl.ColFormat(G_06) 			= "###,###,###,###";
	ctrl.ColFormat(G_07) 			= "###,###,###,###";
	ctrl.ColFormat(G_08) 			= "###,###,###,###";
	ctrl.ColFormat(G_09) 			= "###,###,###,###";
	ctrl.ColFormat(G_10) 			= "###,###,###,###";
	ctrl.ColFormat(G_11) 			= "###,###,###,###";
	ctrl.ColFormat(G_12) 			= "###,###,###,###";
	ctrl.ColFormat(G_13) 			= "###,###,###,###";
    //-----------------------------------    

    grdOrdPlan.GetGridControl().MergeCells  = 2 ;	
    grdOrdPlan.GetGridControl().MergeCol(0) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(1) = true ;   	
    grdOrdPlan.GetGridControl().MergeCol(2) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(3) = true ;	
    grdOrdPlan.GetGridControl().MergeCol(4) = true ;
    grdOrdPlan.GetGridControl().MergeCol(5) = true ;
    grdOrdPlan.GetGridControl().MergeCol(6) = true ;
    
	grdOrdPlan.GetGridControl().FrozenCols = G_PLAN_QTY ;    
    //-----------------------------------
}     

 //========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {
            case 'grdOrdPlan' :
                data_fpgm00064.Call("SELECT");
            break; 
       }  
 }

 //========================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "data_fpgm00064" :                
                if ( grdOrdPlan.rows > 1 )
                {
                    grdOrdPlan.SetCellBold( 1, G_PO_NO,      grdOrdPlan.rows - 1, G_STYLE,      true);
                    grdOrdPlan.SetCellBold( 1, G_PLAN_QTY,   grdOrdPlan.rows - 1, G_PLAN_QTY,   true);
					grdOrdPlan.SetCellBold( 1, G_SEW_TARGET, grdOrdPlan.rows - 1, G_SEW_TARGET, true);
					grdOrdPlan.SetCellBold( 1, G_SHORT_QTY,  grdOrdPlan.rows - 1, G_SHORT_QTY,  true);
					
					grdOrdPlan.SetCellBgColor( 1, G_PLAN_QTY,   grdOrdPlan.rows - 1, G_TOTAL_SEW_QTY, 0xCCFFFF );
					grdOrdPlan.SetCellBgColor( 1, G_SEW_TARGET, grdOrdPlan.rows - 1, G_CURR_SEW_QTY,  0xFFFFCC );
					
					grdOrdPlan.GetGridControl().Cell( 7, 0, G_SHORT_QTY,  grdOrdPlan.rows-1, G_SHORT_QTY ) = 0xCC00CC;
                }   
                //------------------- 
                
                grdOrdPlan.Subtotal( 0, 2, 0, '11!12!13!14!15!16!17!18!19!20!21!22!23!24','###,###,###');               
            break;     		       
      }
 }       
   
//========================================================================
 function OnReport(pos) 
 {
        switch (pos) 
		{           
            case '10':				 		
                var url = System.RootURL + '/reports/fp/gm/rpt_fpgm00064.aspx?factory_pk=' + lstFactory.value + '&factory_name=' + lstFactory.GetText();
                window.open(url);									 			 
            break;
		}
}			  
//========================================================================			     
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00064" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fpgm00064" > 
                <input> 
                    <input bind="lstFactory" />
                    <input bind="txtPOStyle" />
					<input bind="txtComponent" />
					<input bind="txtSpec" />
					<input bind="chkMainPart" />
					<input bind="chkShortage" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Total">
        <tr style="height: 1%">			 
            <td style="width: 5%; white-space: nowrap" align="right">
                Factory</td>
            <td style="width: 20%">
                <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
            </td>
           
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 18%">
                <gw:textbox id="txtPOStyle" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right">
                Comp
            </td>
            <td style="width: 10%">
                <gw:textbox id="txtComponent" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right">
                Spec
            </td>
            <td style="width: 10%">
                <gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch('grdOrdPlan')" />
            </td>						 
            <td style="width: 10%; white-space: nowrap" align="center">  
				 Main Part
                <gw:checkbox id="chkMainPart" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdOrdPlan')"></gw:checkbox>							               
            </td>
			<td style="width: 10%; white-space: nowrap" align="center">  
				 Shortage
                <gw:checkbox id="chkShortage" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdOrdPlan')"></gw:checkbox>							               
            </td>
            <td style="width: 1%" align="right">
				<gw:imgbtn id="btnReport" img="excel" onclick="OnReport('10')" />
            </td>             
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('grdOrdPlan')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="12">
					<gw:grid id='grdOrdPlan'
						header='R/G|P/O No|Style|Spec|Component|Plan Qty|Pre Qty|Sew Qty|Sew Target|Finish|Sew Qty|Shortage|08:30|09:30|10:30|11:30|12:30|13:30|14:30|15:30|16:30|17:30|18:30|19:30|20:30'
						format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='1|0|0|1|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
						check='||||||||||||||||||||||||'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='1000|1500|1500|1200|2000|1100|1100|1100|1100|1100|1100|1100|900|900|900|900|900|900|900|900|900|900|900|900|900'
						sorting='T'					 
						styles='width:100%; height:100%'
						/>
            </td>
        </tr>
    </table>	 
	 <!------------------------------------------------------------------>
</body>
</html>
