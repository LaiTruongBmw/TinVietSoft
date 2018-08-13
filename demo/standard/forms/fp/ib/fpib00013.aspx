<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Task Time</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_WP_ID         = 0,    
    G_AVG_TIME      = 1,
    G_OP_SEQ        = 2,
    G_OP_SEQ_TIME   = 3,
    G_TASK_SEQ      = 4,
    G_TASK_SEQ_TIME = 5,
    G_PB_TASK_PK    = 6,
    G_TASK_ID       = 7,
    G_TASK_NAME     = 8,
    G_TASK_TIME     = 9,
    G_HR_COST       = 10,
    G_POINT_TIME    = 11,
    G_POINT_PK      = 12,
    G_LINE_PK       = 13,
    G_TASK_PK       = 14;
//=========================================================================
  
function BodyInit()
{
    System.Translate(document);
    //---------    
    var data ;

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
    lstFactory.SetDataText( data);
    
    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;	
    grdDetail.GetGridControl().MergeCol(3) = true ;
    grdDetail.GetGridControl().MergeCol(4) = true ;
    grdDetail.GetGridControl().MergeCol(5) = true ; 
    grdDetail.GetGridControl().MergeCol(6) = true ;
    
    grdDetail.GetGridControl().ColFormat(G_AVG_TIME)      = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_OP_SEQ_TIME)   = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_TASK_SEQ_TIME) = "###,###,###,###,###.##"; 
    grdDetail.GetGridControl().ColFormat(G_TASK_TIME)     = "###,###,###,###,###.##";  
    grdDetail.GetGridControl().ColFormat(G_HR_COST)       = "###,###,###,###,###.##"; 
    grdDetail.GetGridControl().ColFormat(G_POINT_TIME)    = "###,###,###,###,###.##";   
    //--------
    p_style_pk  = "<%=request.QueryString("style_pk") %>" ;
    
    txtStylePK.text = p_style_pk ;
    
    OnSearch('STYLE');
    //----------------------------------------      
}
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'STYLE':
            pro_fpib00013.Call("SELECT");
        break;        
        
        case 'DETAIL':
            data_fpib00013.Call("SELECT");
        break;
        
        case 'LINE':
            pro_fpib00013_1.Call(); 
        break;   
        
        case 'POINT':
            pro_fpib00013_2.Call(); 
        break;      
    }
     
}
//=========================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'pro_fpib00013':
	        OnSearch('LINE');
	    break;
	    	
	    case 'pro_fpib00013_1':
	        OnSearch('POINT');
	    break;
	    
	    case 'pro_fpib00013_2':
            var t = txtPointList.text;
            
            var s="";
            
            t=t.substring(5,t.length);
            
            var arr=t.split("|");
            var i=0;
            
            while(i<arr.length)
            {
                s+="#"+arr[i]+";"+arr[i+1]+"|";
                i+=2;
            }
            s = s.substring(0,s.length-1);
            
            grdDetail.SetComboFormat( G_POINT_PK, s);                
            //------------------------       		
	    
	        OnSearch('DETAIL');
	    break;
	    	    
		case 'data_fpib00013' :
			if ( grdDetail.rows > 1 )
		    {
		        grdDetail.SetCellBold( 1, G_WP_ID,    grdDetail.rows-1, G_WP_ID,    true);
		        grdDetail.SetCellBold( 1, G_TASK_ID,  grdDetail.rows-1, G_TASK_ID,  true); 
		        grdDetail.SetCellBold( 1, G_OP_SEQ,   grdDetail.rows-1, G_OP_SEQ,   true);
		        grdDetail.SetCellBold( 1, G_TASK_SEQ, grdDetail.rows-1, G_TASK_SEQ, true);
		        
		        grdDetail.SetCellBgColor( 1, G_OP_SEQ,   grdDetail.rows-1, G_OP_SEQ,    0xCCFFFF ); 
		        grdDetail.SetCellBgColor( 1, G_TASK_SEQ, grdDetail.rows-1, G_TASK_SEQ,  0xCCFFFF );
		        grdDetail.SetCellBgColor( 1, G_TASK_ID,  grdDetail.rows-1, G_TASK_NAME, 0xCCFFFF );
		        grdDetail.SetCellBgColor( 1, G_WP_ID,    grdDetail.rows-1, G_WP_ID,     0xCCFFFF );
		        
		        grdDetail.GetGridControl().Cell( 7, 0, G_POINT_PK, grdDetail.rows-1, G_POINT_PK) = 0x3300cc;
            }
		break;
    }
}
//=========================================================================
function OnSave(pos)
{
    switch(pos)
    {
        case 'DETAIL':
            data_fpib00013.Call();
        break;
    }
}
//=========================================================================

</script>

<body>
    <!--------------------------------------------->
    <gw:data id="pro_fpib00013" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fpib00013"  > 
                <inout> 
                    <inout bind="txtStylePK" />
                    <inout bind="lblStyleName" />
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00013_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpib00013_1" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <gw:data id="data_fpib00013" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="12,13,14" function="<%=l_user%>lg_sel_fpib00013" procedure="<%=l_user%>lg_upd_fpib00013" > 
                  <input bind="grdDetail" > 
                    <input bind="txtStylePK" />	
                    <input bind="lstLine" />				                 
                  </input>
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpib00013_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" user="sale" procedure="<%=l_user%>lg_pro_fpib00013_2" > 
                <input> 
                    <input bind="lstLine" />                                   
                </input>
                <output> 
                    <output bind="txtPointList" />
                </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Style
                        </td>
                        <td style="width: 50%">
                            <gw:label id="lblStyleName" styles='width:100%;color:cc0000;font:10pt' text='style' />
                        </td>
                        <td style="width: 5%" align="left">
                            Fac
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch('LINE')" />
                        </td>
                        <td style="width: 5%" align="left">
                            Line
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstLine" styles='width:100%' onchange="OnSearch('POINT')" />
                        </td>
                        <td style="width: 3%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idBtnSave" img="save" alt="Save" text="Save" onclick="OnSave('DETAIL')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <gw:grid id='grdDetail' header='W/P ID|Avg Time|O/P Seq|O/P Time|Task Seq|Task Time|_PB_TASK_PK|Task ID|Task Name|ST Time|M/P(%)|Point Time|Point ID|_Line_PK|_Task_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='1|3|1|3|1|3|0|1|0|3|3|3|1|0|0' 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0'
                    widths='1500|1200|1000|1200|1000|1200|0|1500|2500|1200|1200|1200|1200|0|0' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txtStylePK" text="" styles="display:none" />
    <gw:textbox id="txtPointList" text="" styles="display:none" />
</body>
</html>
