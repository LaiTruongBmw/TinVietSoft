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
    G_WP_NAME       = 1,
    G_AVG_TIME      = 2,
    G_OP_SEQ        = 3,
    G_OP_MP         = 4,
    G_OP_SEQ_TIME   = 5,
    G_TASK_SEQ      = 6,
    G_TASK_SEQ_TIME = 7,
    G_PB_TASK_PK    = 8,
    G_TASK_ID       = 9,
    G_TASK_NAME     = 10,
    G_TASK_TIME     = 11,
    G_HR_COST       = 12,
    G_POINT_TIME    = 13;

//=========================================================================
  
function BodyInit()
{
    System.Translate(document);
    p_style_pk  = "<%=request.QueryString("style_pk") %>" ;
    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";
    
    txtStylePK.text = p_style_pk ;
    //-----------
    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;	
    grdDetail.GetGridControl().MergeCol(3) = true ;
    grdDetail.GetGridControl().MergeCol(4) = true ;
    grdDetail.GetGridControl().MergeCol(5) = true ; 
       /* grdDetail.GetGridControl().MergeCol(6) = true ;   */
    
    grdDetail.GetGridControl().ColFormat(G_AVG_TIME)      = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_OP_SEQ_TIME)   = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_TASK_SEQ_TIME) = "###,###,###,###,###.##"; 
    grdDetail.GetGridControl().ColFormat(G_TASK_TIME)     = "###,###,###,###,###.##";  
    grdDetail.GetGridControl().ColFormat(G_HR_COST)       = "###,###,###,###,###.##"; 
    grdDetail.GetGridControl().ColFormat(G_POINT_TIME)    = "###,###,###,###,###.##";      
    grdDetail.GetGridControl().ColFormat(G_OP_MP)    = "###,###,###,###,###.##";  
    //----------------------------------------   
    OnSearch('STYLE');
    //----------------------------------------      
}
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'STYLE':
            pro_fpib00012.Call("SELECT");
        break;
        
        case 'LIST_WP':
            pro_fpib00012_1.Call();
        break;
        
        case 'DETAIL':
            data_fpib00012.Call("SELECT");
        break;
    }
     
}
//=========================================================================
function OnPrint(pos)
{
    switch(pos)
    {
        case 'DETAIL':
            var url =System.RootURL + '/reports/fp/ib/rpt_fpib00012.aspx?style_pk=' + txtStylePK.text + '&lang=' + lstLang.value ;
	        System.OpenTargetPage(url);                        
        break;
    }
}
//=========================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'pro_fpib00012':
	        OnSearch('LIST_WP');
	    break;
	    	
	    case 'pro_fpib00012_1':
	        OnSearch('DETAIL');
	    break;
	    
		case 'data_fpib00012' :
			if ( grdDetail.rows > 1 )
		    {
		        grdDetail.SetCellBold( 1, G_WP_ID,    grdDetail.rows-1, G_WP_ID,    true);
		        grdDetail.SetCellBold( 1, G_TASK_ID,  grdDetail.rows-1, G_TASK_ID,  true); 
		        grdDetail.SetCellBold( 1, G_OP_SEQ,   grdDetail.rows-1, G_OP_SEQ,   true);
		        grdDetail.SetCellBold( 1, G_TASK_SEQ, grdDetail.rows-1, G_TASK_SEQ, true);
		        
		        grdDetail.SetCellBgColor( 1, G_OP_SEQ,   grdDetail.rows-1, G_OP_SEQ,    0xCCFFFF ); 
		        grdDetail.SetCellBgColor( 1, G_TASK_SEQ, grdDetail.rows-1, G_TASK_SEQ,  0xCCFFFF );
		        grdDetail.SetCellBgColor( 1, G_TASK_ID,  grdDetail.rows-1, G_TASK_NAME, 0xCCFFFF );
		        grdDetail.SetCellBgColor( 1, G_WP_ID,    grdDetail.rows-1, G_WP_NAME,   0xCCFFFF );
		        
		        grdDetail.Subtotal( 0, 2, 0, '10!11'); 
            }
		break;
    }
}
//=========================================================================
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="pro_fpib00012" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fpib00012"  > 
                <inout> 
                    <inout bind="txtStylePK" />
                    <inout bind="lblStyleName" />
                   <inout bind="lblTtTime" /> 
                    <inout bind="lblTtMp" /> 
                   <inout bind="lblAvgTime" /> 
                  <inout bind="lblMaxTime" /> 
                  <inout bind="lblTimeRatio" />   
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpib00012_1" > 
                <input>
                    <input bind="txtStylePK" /> 
                </input> 
                <output>
                    <output bind="lstWP" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <gw:data id="data_fpib00012" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpib00012" > 
                  <input bind="grdDetail" > 
                    <input bind="txtStylePK" />
                    <input bind="lstLang" />	
                    <input bind="lstWP" />	                    			                 
                  </input>
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td colspan="9">
                            <table>
                                <tr>
                                    <td>
                                        R.TT.Time</td>
                                    <td style="width: 15%">
                                        <gw:label id="lblTtTime" styles='width:100%;color:cc0000;font:10pt' text='style' />
                                    </td>
                                    <td>
                                        R.TT.MP</td>
                                    <td style="width: 15%">
                                        <gw:label id="lblTtMp" styles='width:100%;color:cc0000;font:10pt' text='style' />
                                    </td>
                                    <td>
                                        R.AVG.TIME</td>
                                    <td style="width: 15%">
                                        <gw:label id="lblAvgTime" styles='width:100%;color:cc0000;font:10pt' text='style' />
                                    </td>
                                    <td>
                                        R.MAX.TIME</td>
                                    <td style="width: 15%">
                                        <gw:label id="lblMaxTime" styles='width:100%;color:cc0000;font:10pt' text='style' />
                                    </td>
                                    <td>
                                        R.TIME.RATIO</td>
                                    <td style="width: 15%">
                                        <gw:label id="lblTimeRatio" styles='width:100%;color:cc0000;font:10pt' text='style' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Style
                        </td>
                        <td style="width: 45%">
                            <gw:label id="lblStyleName" styles='width:100%;color:cc0000;font:10pt' text='style' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            W/P</td>
                        <td style="width: 25%; white-space: nowrap" align="right">
                            <gw:list id="lstWP" styles='width:100%' onchange="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Lang</td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 3%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint1" img="excel" alt="Excel" onclick="OnPrint('DETAIL')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <gw:grid id='grdDetail' header='W/P ID|W/P Name|Avg Time|O/P Seq|O/P MP|O/P Time|Task Seq|Task Time|_PB_TASK_PK|Task ID|Task Name|ST Time|M/P(%)|Point Time'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|3|1|3|3|1|3|0|1|0|3|3|3' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1500|2000|1200|1000|1200|1200|1000|1200|0|1500|2500|1200|1200|1000' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txtStylePK" text="" styles="display:none" />
</body>
</html>
