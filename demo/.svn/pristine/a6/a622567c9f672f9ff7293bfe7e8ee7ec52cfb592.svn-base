<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Plan for W/I Process Issue</title>
</head>

<script>
    
var G1_COMP_PK          = 0,
    G1_COMP_ID         	= 1,
	G1_COMP_NAME		= 2,
    G1_SPEC01_PK        = 3,
    G1_SPEC01_ID        = 4,
    G1_SPEC02_PK        = 5,
    G1_SPEC02_ID        = 6,
    G1_SPEC03_PK        = 7,
    G1_SPEC03_ID        = 8,
    G1_SPEC04_PK        = 9,
    G1_SPEC04_ID        = 10,
    G1_SPEC05_PK        = 11,
    G1_SPEC05_ID        = 12;
 //===============================================================
 var callerWindowObj = dialogArguments;
 
 function BodyInit()
 {
     //----------------------       
     txtOrdPlanPK.text = callerWindowObj.txtOrdPlanPK.text //neu du lieu co ky tu dac biet 
     
     //----------------------
     FormatGrid();
     //----------------------
	 OnHiddenGrid();
     OnSearch('header');      
 } 

//===================================================================

 function FormatGrid()
 { 
      //-------------------------------------------------
      
      grdDetail.GetGridControl().MergeCells = 2;
      grdDetail.GetGridControl().MergeCol(0) = true;
      grdDetail.GetGridControl().MergeCol(1) = true;
      grdDetail.GetGridControl().MergeCol(2) = true; 
        
      //-------------------------------------------------       
      var data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_get_logistic_codename('LGPC0101') FROM DUAL")%>||"; 
      lstGroup.SetDataText(data);  
      lstGroup.value = '' ;	                                             
 }        
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		
			case 'header':
				data_fpfo00044_header.Call('SELECT');
			break;
				          
            case 'grdDetail' :
                data_fpfo00044.Call("SELECT");
            break;
            
            case 'STYLE': 
                pro_fpfo00044_1.Call("SELECT");
            break;                 
      }  
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
//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {	
	  		case 'data_fpfo00044_header':
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
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col4);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC04_ID) = false ;
	                    
	                }
	                if (dis_col5!=0)
	                {
	                    grdDetail.SetGridText(0,G1_SPEC05_ID,col5);
	                    grdDetail.GetGridControl().ColHidden(G1_SPEC05_ID) = false ;
	                    
	                }
				}
				OnSearch('STYLE');
			break;
					        
            case 'pro_fpfo00044_1':
                OnSearch('grdDetail');
            break;  
            
            case 'data_fpfo00044':                
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_COMP_ID, grdDetail.rows - 1, G1_COMP_ID, true);                
                }  
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
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
                                  
            window.returnValue =  arr_data;
            window.close();
            
        break;              
    }        
}

//=========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpfo00044_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfo00044_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfo00044_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fpfo00044_1"  > 
                <inout> 
                    <inout bind="txtOrdPlanPK" />
                    <inout bind="lblStyleName" />
                    <inout bind="lblPONo"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpfo00044" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpfo00044" > 
                <input> 
                    <input bind="txtOrdPlanPK" />
                    <input bind="lstGroup" />                    
                    <input bind="txtComponent" />
					<input bind="txtSpec" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">  
			<td style="width: 5%" align="right">
                P/O
            </td>
            <td>
                <gw:label id="lblPONo" styles='width:100%;color:cc0000;font:10pt' text='PO' />
            </td>		          
            <td style="width: 5%" align="right">
                Style
            </td>
            <td colspan=6 >
                <gw:label id="lblStyleName" styles='width:100%;color:cc0000;font:10pt' text='style' />
            </td>            
        </tr>
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
               Group
            </td>
            <td style="width: 25%">
                <gw:list id="lstGroup" styles='width:100%' onchange="OnSearch('grdDetail')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtComponent" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>
			 <td style="width: 5%; white-space: nowrap" align="right">
                Spec
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch('grdDetail')" />
            </td>			
            <td align="center" style="white-space: nowrap; width: 8%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect01" img="select" alt="Select" onclick="OnSelect('ALL')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="9">
                <gw:grid id='grdDetail' 
                    header='_COMP_PK|Comp ID|Comp Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|1|0|1|0|1|0|1|0|1'
                    defaults='||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|2000|2000|0|1500|0|1500|0|1500|0|1500|0|1500'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnSelect('ALL')"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
     <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none;' />
	 <!------------------------------------------------------------------> 
	 	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>	
</body>
</html>
