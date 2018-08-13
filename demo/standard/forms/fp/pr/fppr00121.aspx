<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Plan for Line Result</title>
</head>

<script>
    
var G1_GROUP_ID         = 0,
    G1_COMP_PK          = 1,
    G1_COMP_ID          = 2,
    G1_COMP_NAME        = 3,  
    G1_SPEC01_PK        = 4,
    G1_SPEC01_ID        = 5,
    G1_SPEC02_PK        = 6,
    G1_SPEC02_ID        = 7,
    G1_SPEC03_PK        = 8,
    G1_SPEC03_ID        = 9,
    G1_SPEC04_PK        = 10,
    G1_SPEC04_ID        = 11,
    G1_SPEC05_PK        = 12,
    G1_SPEC05_ID        = 13,
    G1_Plan_Qty         = 14,
    G1_NEED_QTY         = 15,
    G1_Prod_Qty         = 16,
    G1_Bal_Qty          = 17,
	G1_Time				= 18;
 //==============================================================
 
 function BodyInit()
 {
    System.Translate(document); 
     var p_pp_ordplan_pk = "<%=Request.querystring("pp_ordplan_pk")%>";
     var p_pb_line_pk    = "<%=Request.querystring("pb_line_pk")%>";
	 
     txtOrdPlanPK.text = Number(p_pp_ordplan_pk);
     //----------------------
     FormatGrid();
	 
	 btnSearch.SetEnable(false); 
     //----------------------
	 OnHiddenGrid();
     OnSearch('header');
      
 } 

//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();
      
      trl.ColFormat(G1_Plan_Qty) = "###,###,###,###,###";      
      trl.ColFormat(G1_NEED_QTY) = "###,###,###,###,###";
      trl.ColFormat(G1_Prod_Qty) = "###,###,###,###,###";
      trl.ColFormat(G1_Bal_Qty)  = "###,###,###,###,###"; 
      
      trl.MergeCells = 2;
      trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
      trl.MergeCol(2) = true;
      trl.MergeCol(3) = true;
      trl.MergeCol(4) = true;        
      trl.MergeCol(5) = true; 
      trl.MergeCol(6) = true; 
      trl.MergeCol(7) = true; 
      trl.MergeCol(8) = true; 
      trl.MergeCol(9) = true; 
      trl.MergeCol(10)= true; 
      trl.MergeCol(11)= true;
      trl.MergeCol(12)= true; 
      trl.MergeCol(13)= true;        
      //-------------------------------------------------                                                  
 }
 
 //=========================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G1_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = true ;
}        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fppr00121.Call("SELECT");
            break;
            
            case 'PP':
                pro_fppr00121.Call("SELECT");
            break; 
			
 			case 'WP':
                pro_fppr00121_1.Call("SELECT");
            break; 			 
			
            case 'header':
                data_fppr00121_header.Call("SELECT");
            break;								                  
      }  
 }
 
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		                    
            case 'data_fppr00121':
                lbRecord.text = grdDetail.rows-1 + " (s)";
                 
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_COMP_ID,  grdDetail.rows - 1, G1_COMP_ID, true);
                    grdDetail.SetCellBold( 1, G1_Plan_Qty, grdDetail.rows - 1, G1_Bal_Qty, true);
                    
                    grdDetail.Subtotal( 0, 2, -1, '14!15!16!17','###,###,###');                    
                }  
            break; 
			
            case 'data_fppr00121_header':
	            if(grdHeader.rows>1)
	            {
	                var col1=grdHeader.GetGridData(1,2);
	                var dis_col1=grdHeader.GetGridData(1,3);
	                var col2=grdHeader.GetGridData(1,4);
	                var dis_col2=grdHeader.GetGridData(1,5);
	                var col3=grdHeader.GetGridData(1,6);
	                var dis_col3=grdHeader.GetGridData(1,7);
	                var col4=grdHeader.GetGridData(1,8);
	                var dis_col4=grdHeader.GetGridData(1,9);
	                var col5=grdHeader.GetGridData(1,10);
	                var dis_col5=grdHeader.GetGridData(1,11);
	                if(dis_col1!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC01_ID,col1);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC01_ID) = false ;
	                    
	                }
	                if (dis_col2!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC02_ID,col2);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC02_ID) = false ;
	                    
	                }
	                if (dis_col3!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC03_ID,col3);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC03_ID) = false ;
	                    
	                }
	                if (dis_col4!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC04_ID,col4);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = false ;
	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col5);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = false ;
	                    
	                }
           		 }
				 
				 OnSearch("PP");
        	break;   	
			
			case 'pro_fppr00121':				
				OnSearch("WP");
			break; 
			
			case 'pro_fppr00121_1':
				btnSearch.SetEnable(true);
		    break;							                                            
      }  
 }

//=================================================================

function OnSelect(pos)
{
    switch (pos)
    {
        case 'ALL' :
                                               
            var arr_data = new Array();
            
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     //---------------------------------------                                       					 					 				 
					 var arrTemp = new Array();
						  					                           
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {					 	  
                          arrTemp[arrTemp.length] = grdDetail.GetGridData(i,j);
                     }
					 
					 arr_data[arr_data.length] = arrTemp;					 						  					 											  						                        					 						  		 
                }
            }
                                  
            window.returnValue = arr_data;
            window.close();            
            
        break;              
    }        
}
 
//=========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00121_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00121_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00121" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fppr00121"  > 
                <inout> 
                    <inout bind="txtOrdPlanPK" />
                    <inout bind="lblOrdPlan" />
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
 	<!---------------------------------------------------------------->
    <gw:data id="pro_fppr00121_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00121_1" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstWorkProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00121" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00121" > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
					<input bind="lstWorkProcess" />
                    <input bind="txtComp" />                 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>	
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                Ord Plan
            </td>
            <td style="width: 35%">
                <gw:label id="lblOrdPlan" styles='width:300%;color:cc0000;font:10pt' text='style' />
            </td>
			<td style="width: 5%; white-space: nowrap" align="right">
                W/P
            </td>
            <td style="width: 20%">
                <gw:list id="lstWorkProcess" styles="width: 100%" onchange="OnSearch('grdDetail')" />
            </td>			
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtComp" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td align="center" style="white-space: nowrap; width: 13%">
                <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
            </td>			 
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect01" img="select" alt="Select" onclick="OnSelect('ALL')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="10">				 
				<gw:grid id='grdDetail' header='Group ID|_COMP_PK|COMP ID|COMP NAME|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Plan Qty|Need Qty|Prod Qty|Bal Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|3'
                    defaults='|||||||||||||||||' 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='2000|0|1200|3000|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />				 	             
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none;' />
 
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />	
</body>
</html>
