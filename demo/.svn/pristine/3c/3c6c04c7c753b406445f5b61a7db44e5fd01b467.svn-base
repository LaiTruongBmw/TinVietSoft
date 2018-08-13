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
    
var G1_ORDPLAN_PK       = 0,
    G1_PO_No            = 1,
    G1_STYLE_PK         = 2,
    G1_STYLE_ID         = 3,
    G1_STYLE_NAME       = 4,  
    G1_SPEC01_PK        = 5,
    G1_Spec_01          = 6,
    G1_SPEC02_PK        = 7,
    G1_Spec_02          = 8,
    G1_SPEC03_PK        = 9,
    G1_Spec_03          = 10,
    G1_SPEC04_PK        = 11,
    G1_Spec_04          = 12,
    G1_SPEC05_PK        = 13,
    G1_Spec_05          = 14,
    G1_Plan_Qty         = 15,
    G1_Prod_Qty         = 16,
    G1_Bal_Qty          = 17,
	G1_Time				= 18;
 //===============================================================
 
 function BodyInit()
 {
    System.Translate(document); 
     var p_work_process_pk = "<%=Request.querystring("work_process_pk")%>";
     
     txtWProcessPK.text = Number(p_work_process_pk);
     //----------------------
     FormatGrid();
	 
	 btnSearch.SetEnable(false);
	 OnShowTime();
     //----------------------
     OnHiddenGrid();
     OnSearch('header');           
 } 

//===================================================================

 function FormatGrid()
 {  
      var data="";    
        
      data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
      lstFactory.SetDataText( data);
      lstFactory.value = '' ;	
	
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      trl.FrozenCols = G1_SPEC01_PK ;
      
      trl.ColFormat(G1_Plan_Qty) = "###,###,###,###,###";
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
      trl.MergeCol(14)= true;        
      //-------------------------------------------------                                                  
 }        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fppr00013.Call("SELECT");
            break;
            
            case 'WP':
                pro_fppr00013.Call("SELECT");
            break;  
			
			case 'WorkTime':
				data_fppr00013_1.Call("SELECT");
			break;
			 
            case 'header':
                data_fpip00100_Header.Call("SELECT");
            break;                   
      }  
 }
 
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		          
            case 'data_fpip00100_Header':
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
                    grdDetail.SetGridText(0,G1_Spec_01,col1);
                    grdDetail.GetGridControl().ColHidden(G1_Spec_01) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G1_Spec_02,col2);
                    grdDetail.GetGridControl().ColHidden(G1_Spec_02) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G1_Spec_03,col3);
                    grdDetail.GetGridControl().ColHidden(G1_Spec_03) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G1_Spec_04,col4);
                    grdDetail.GetGridControl().ColHidden(G1_Spec_04) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G1_Spec_05,col5);
                    grdDetail.GetGridControl().ColHidden(G1_Spec_05) = false ;
                    
                }
                OnSearch('WP');
            }
        break;          
            case 'data_fppr00013':
                 
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_PO_No, grdDetail.rows - 1, G1_PO_No, true);
                    grdDetail.SetCellBold( 1, G1_Plan_Qty, grdDetail.rows - 1, G1_Bal_Qty,  true);
                    
                    grdDetail.Subtotal( 0, 2, -1, '15!16!17','###,###,###');                    
                }  
            break; 
			
			case 'pro_fppr00013':
				OnSearch("WorkTime");
			break; 
			
			case 'data_fppr00013_1':
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
                if ( grdDetail.GetGridControl().isSelected(i) == true && grdDetail.GetGridData(i,G1_ORDPLAN_PK) != '' )
                {
                     //---------------------------------------                                       
					 var t_check = 0;	
					 
					 for ( var t = 1; t < grdWorkTime.rows; t++)
					 {					 	  						  
					 	  if ( grdWorkTime.GetGridData(t,0) == -1 )
						  {		
						  		 t_check = 1;					  		 
						  		 grdDetail.SetGridText( i, G1_Time,grdWorkTime.GetGridData(t,1) );
								 
								 var arrTemp = new Array();
								  					                           
			                     for( var j = 0; j < grdDetail.cols; j++ )
			                     {					 	  
			                          arrTemp[arrTemp.length] = grdDetail.GetGridData(i,j);
			                     }
								 
								 arr_data[arr_data.length] = arrTemp;
						  }							  						  	
					 }
					 //-----
					 if ( t_check == 0 )
					 {
							 var arrTemp = new Array();
								  					                           
		                     for( var j = 0; j < grdDetail.cols; j++ )
		                     {					 	  
		                          arrTemp[arrTemp.length] = grdDetail.GetGridData(i,j);
		                     }
							 
							 arr_data[arr_data.length] = arrTemp;					 	
					 }
					 //-----					 											  						                        					 						  		 
                }
            }
                                  
            window.returnValue = arr_data;
            window.close();
            
        break;              
    }        
}
//=========================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G1_Spec_01) = true ;
	grdDetail.GetGridControl().ColHidden(G1_Spec_02) = true ;
	grdDetail.GetGridControl().ColHidden(G1_Spec_03) = true ;
	grdDetail.GetGridControl().ColHidden(G1_Spec_04) = true ;
	grdDetail.GetGridControl().ColHidden(G1_Spec_05) = true ;
}
//=========================================================

function OnShowTime()
{   
    var right = document.all("t-right");
        
    if  ( chkTime.value == "N" )
    {
        right.style.display    = "none";	
    }
	else
    {
        right.style.display    = "";
    }
}

//=========================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpip00100_Header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00100_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00013" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fppr00013"  > 
                <inout> 
                    <inout bind="txtWProcessPK" />
                    <inout bind="lblWProcess" />
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00013" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00013" > 
                <input> 
					<input bind="lstFactory" />
                    <input bind="txtWProcessPK" /> 
                    <input bind="txtPOStyle" />
                    <input bind="txtSpec" />                 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00013_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00013_1" > 
                <input>                
                </input> 
                <output bind="grdWorkTime" /> 
            </dso> 
        </xml> 
    </gw:data>	
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                W/P
            </td>
            <td style="width: 25%; white-space: nowra">
                <gw:label id="lblWProcess" styles='width:300%;color:cc0000;font:10pt' text='style' />
            </td>
			<td style="width: 5%; white-space: nowrap" align="right">
                Factory
            </td>
            <td style="width: 15%">
                <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtPOStyle" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Spec
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
            <td align="center" style="white-space: nowrap; width: 8%">
				Time
                <gw:checkbox id="chkTime" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnShowTime()"></gw:checkbox>			
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect01" img="select" alt="Select" onclick="OnSelect('ALL')" />
            </td>
        </tr>
        <tr style="height: 99%">
			<td colspan="11" >
				<table style="width: 100%; height: 100%">
					<tr>
			            <td  style="width: 90%" id="t-left">
			                <gw:grid id='grdDetail' header='_PP_ORDPLAN_PK|P/O No|_Style_PK|Style ID|Style Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Plan Qty|Prod Qty|Bal Qty|_Time'
			                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|0'
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|2000|0|1500|2500|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|0'
			                    sorting='T' styles='width:100%; height:100%' />
			            </td>			
						<td  style="width: 10%" id="t-right" > 
						   <gw:grid id='grdWorkTime' header='Chk|Time'
			                    format='3|0' aligns='0|1' editcol='1|0' widths='500|100'
			                    sorting='T' styles='width:100%; height:100%' acceptnulldate='T'   />
						</td>					
					</tr>
				</table>
			</td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWProcessPK" styles='width:100%;display:none;' />
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
</body>
</html>
