<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Monitering Display : Line Hour Result</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
var G_Line_ID       = 0,        
    G_Style         = 1,
	G_Target_Qty    = 2,
    G_Prod_Qty      = 3,
    G_01            = 4,
    G_02            = 5,
    G_03            = 6,
    G_04            = 7,
    G_05            = 8,
    G_06            = 9,
    G_07            = 10,
    G_08            = 11,
    G_09            = 12,
	G_10            = 13,
	G_11            = 14,
	G_12            = 15,
	G_13            = 16,
    G_Bal_Qty       = 17,
    G_Prod_Percent  = 18;
//==============================================================================    
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    
    GridFormat();
    
	OnToggle();
	
    OnRefreshHeader();	
}
//==============================================================================
function BindingDataList()
{    
    var data="";    
                    
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, group_id || ' - ' || GROUP_NAME FROM prod.pb_line_group WHERE del_if = 0 ORDER BY group_id ") %>|ALL|Select ALL" ;    
    lstLineGroup.SetDataText(data);
    lstLineGroup.value = 'ALL';    
	
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, component_id || ' - ' || component_NAME FROM prod.pt_component WHERE del_if = 0 and use_yn = 'Y' and ( COMPONENT_TYPE = '10' or COMPONENT_TYPE = '30' ) ORDER BY component_id ") %>||" ;    
    lstComponent.SetDataText(data);
    lstComponent.value = '';   	
}    
//==============================================================================
function GridFormat()
{
      var trl ;
      
      trl = grdView.GetGridControl();
      
      trl.MergeCells = 2;
      trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
          	
      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
      trl.ColFormat(G_Prod_Qty)  = "###,###,###,###,###";
      trl.ColFormat(G_01)       = "###,###,###,###,###"; 
      trl.ColFormat(G_02)       = "###,###,###,###,###";     
      trl.ColFormat(G_03)      = "###,###,###,###,###";
      trl.ColFormat(G_04)     = "###,###,###,###,###";
      trl.ColFormat(G_05)     = "###,###,###,###,###";
      trl.ColFormat(G_06)     = "###,###,###,###,###";
      trl.ColFormat(G_07)     = "###,###,###,###,###";
      trl.ColFormat(G_08)     = "###,###,###,###,###";
	  trl.ColFormat(G_09)     = "###,###,###,###,###";
	  trl.ColFormat(G_10)     = "###,###,###,###,###";
	  trl.ColFormat(G_11)     = "###,###,###,###,###";
	  trl.ColFormat(G_12)     = "###,###,###,###,###";
	  trl.ColFormat(G_13)     = "###,###,###,###,###";
      trl.ColFormat(G_Bal_Qty)   = "###,###,###,###,###";
      
      trl = grdDefect.GetGridControl();

      trl.MergeCells = 2;
      trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
            	
      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
      trl.ColFormat(G_Prod_Qty)  = "###,###,###,###,###";
      trl.ColFormat(G_01)       = "###,###,###,###,###"; 
      trl.ColFormat(G_02)       = "###,###,###,###,###";     
      trl.ColFormat(G_03)      = "###,###,###,###,###";
      trl.ColFormat(G_04)     = "###,###,###,###,###";
      trl.ColFormat(G_05)     = "###,###,###,###,###";
      trl.ColFormat(G_06)     = "###,###,###,###,###";
      trl.ColFormat(G_07)     = "###,###,###,###,###";
      trl.ColFormat(G_08)     = "###,###,###,###,###";
	  trl.ColFormat(G_09)     = "###,###,###,###,###";
	  trl.ColFormat(G_10)     = "###,###,###,###,###";
	  trl.ColFormat(G_11)     = "###,###,###,###,###";
	  trl.ColFormat(G_12)     = "###,###,###,###,###";
	  trl.ColFormat(G_13)     = "###,###,###,###,###";	  
       trl.ColFormat(G_Bal_Qty)   = "###,###,###,###,###";
      
      
}
//==============================================================================
function OnSearch()
{                  
    if ( chkShowDetail.value == 'N' )
    {
        grdView.GetGridControl().ColHidden(G_Style)   = true ;
        grdDefect.GetGridControl().ColHidden(G_Style) = true ;
    }
    else
    {
        grdView.GetGridControl().ColHidden(G_Style)   = false ;
        grdDefect.GetGridControl().ColHidden(G_Style) = false ;
    } 

    data_fpgm00065.Call("SELECT");   
}
//==============================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'pro_fpgm00065' :
            OnSearch();
        break;                         
        
        case 'data_fpgm00065' :
            if ( grdView.rows > 1)
            {
                grdView.GetGridControl().Cell(12, 1, G_Line_ID, grdView.rows-1, G_Line_ID ) = 11;
                
                grdView.GetGridControl().Cell( 7, 1, G_Style,    grdView.rows-1, G_Style )     = 0x3300cc;
                grdView.GetGridControl().Cell( 7, 0, G_Prod_Qty,  grdView.rows-1, G_Prod_Qty ) = 0xCC00CC;
                grdView.GetGridControl().Cell( 7, 0, G_Bal_Qty, grdView.rows-1, G_Bal_Qty  ) = 0xCC00CC;
            
                grdView.GetGridControl().Cell( 7, 1, G_01, grdView.rows-1, G_13 ) = 0x3300cc;
                
                grdView.SetCellBold( 1, 0, grdView.rows-1, grdView.cols-1, true);
                //-------------------
                
                for ( var i=1; i < grdView.rows; i=i+2 )
                {
                     grdView.SetCellBgColor( i, 0, i, grdView.cols - 1, 0xCCFFFF );                             
                }                                
                
                //------------------- 
                grdView.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13!14!15!16!17', '###,###,###');
            }
            
			if ( document.all("img1").status == "expand" ) 
			{
            	data_fpgm00065_1.Call("SELECT");   
			}	         
        break ; 
        
        case 'data_fpgm00065_1' :
        
            if ( grdDefect.rows > 1)
            {
                grdDefect.GetGridControl().Cell(12, 1, G_Line_ID, grdDefect.rows-1, G_Line_ID ) = 11;
                
                grdDefect.GetGridControl().Cell( 7, 1, G_Style,    grdDefect.rows-1, G_Style )     = 0x3300cc;
                grdDefect.GetGridControl().Cell( 7, 0, G_Prod_Qty,  grdDefect.rows-1, G_Prod_Qty ) = 0xCC00CC;
                grdDefect.GetGridControl().Cell( 7, 0, G_Bal_Qty, grdDefect.rows-1, G_Bal_Qty  ) = 0xCC00CC;
            
                grdDefect.GetGridControl().Cell( 7, 1, G_01, grdDefect.rows-1, G_13 ) = 0x3300cc;
                
                grdDefect.SetCellBold( 1, 0, grdDefect.rows-1, grdDefect.cols-1, true);
                //-------------------
                
                for ( var i=1; i < grdDefect.rows; i=i+2 )
                {
                     grdDefect.SetCellBgColor( i, 0, i, grdDefect.cols - 1, 0xCCFFFF );                             
                }                                
                
                //------------------- 
                grdDefect.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13!14!15!16!17', '###,###,###');
            }        
        break;            
                  
    }       
} 
//==========================================================================
function OnPreviousDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),-1));
    OnSearch();
}

//==========================================================================
function OnNextDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),+1));
    OnSearch();
}

//==============================================================================
function OnToggle()
{
    var trDefect = document.all("Defect"); 
    var imgArrow = document.all("img1"); 

    if ( imgArrow.status == "expand")
    {
        trDefect.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up_orange.gif";
    }
    else
    {
        trDefect.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down_orange.gif";
    }
}
//==============================================================================

function OnProcecss(pos)
{
    switch (pos)
    {
        case 'LoadLine':
            pro_fpgm00065.Call();
        break;
    }
}
//==============================================================================
function OnRefreshHeader()
{
    if (lstShift.value =='1' )
     {
        grdView.SetGridText(0,G_01,'08:30');
        grdView.SetGridText(0,G_02,'09:30');
        grdView.SetGridText(0,G_03,'10:30');
        grdView.SetGridText(0,G_04,'11:30');
        grdView.SetGridText(0,G_05,'12:30');
        grdView.SetGridText(0,G_06,'13:30');
        grdView.SetGridText(0,G_07,'14:30');
        grdView.SetGridText(0,G_08,'15:30');
        grdView.SetGridText(0,G_09,'16:30');
		grdView.SetGridText(0,G_10,'17:30');
		grdView.SetGridText(0,G_11,'18:30');
		grdView.SetGridText(0,G_12,'19:30');
		grdView.SetGridText(0,G_13,'20:30');
        
        grdDefect.SetGridText(0,G_01,'08:30');
        grdDefect.SetGridText(0,G_02,'09:30');
        grdDefect.SetGridText(0,G_03,'10:30');
        grdDefect.SetGridText(0,G_04,'11:30');
        grdDefect.SetGridText(0,G_05,'12:30');
        grdDefect.SetGridText(0,G_06,'13:30');
        grdDefect.SetGridText(0,G_07,'14:30');
        grdDefect.SetGridText(0,G_08,'15:30');
        grdDefect.SetGridText(0,G_09,'16:30');
		grdDefect.SetGridText(0,G_10,'17:30');
		grdDefect.SetGridText(0,G_11,'18:30');
		grdDefect.SetGridText(0,G_12,'19:30');
		grdDefect.SetGridText(0,G_13,'20:30');
        
     }
    else if (lstShift.value =='2' )  
    {
        grdView.SetGridText(0,G_01,'17:30');
        grdView.SetGridText(0,G_02,'18:30');
        grdView.SetGridText(0,G_03,'19:30');
        grdView.SetGridText(0,G_04,'20:30');
        grdView.SetGridText(0,G_05,'21:30');
        grdView.SetGridText(0,G_06,'22:30');
        grdView.SetGridText(0,G_07,'23:30');
        grdView.SetGridText(0,G_08,'00:30');
        grdView.SetGridText(0,G_09,'01:30');
		grdView.SetGridText(0,G_10,'02:30');
		grdView.SetGridText(0,G_11,'03:30');
		grdView.SetGridText(0,G_12,'04:30');
		grdView.SetGridText(0,G_13,'05:30');
        
        grdDefect.SetGridText(0,G_01,'17:30');
        grdDefect.SetGridText(0,G_02,'18:30');
        grdDefect.SetGridText(0,G_03,'19:30');
        grdDefect.SetGridText(0,G_04,'20:30');
        grdDefect.SetGridText(0,G_05,'21:30');
        grdDefect.SetGridText(0,G_06,'22:30');
        grdDefect.SetGridText(0,G_07,'23:30');
        grdDefect.SetGridText(0,G_08,'00:30');
        grdDefect.SetGridText(0,G_09,'01:30');
		grdDefect.SetGridText(0,G_10,'02:30');
		grdDefect.SetGridText(0,G_11,'03:30');
		grdDefect.SetGridText(0,G_12,'04:30');
		grdDefect.SetGridText(0,G_13,'05:30');         
    }
    else if (lstShift.value =='3' )
    {
        grdView.SetGridText(0,G_01,'01:30');
        grdView.SetGridText(0,G_02,'02:30');
        grdView.SetGridText(0,G_03,'03:30');
        grdView.SetGridText(0,G_04,'04:30');
        grdView.SetGridText(0,G_05,'05:30');
        grdView.SetGridText(0,G_06,'06:30');
        grdView.SetGridText(0,G_07,'07:30');
        grdView.SetGridText(0,G_08,'08:30');
        grdView.SetGridText(0,G_09,'09:30');
		grdView.SetGridText(0,G_10,'10:30');
		grdView.SetGridText(0,G_11,'11:30');
		grdView.SetGridText(0,G_12,'12:30');
		grdView.SetGridText(0,G_13,'13:30'); 
        
        grdDefect.SetGridText(0,G_01,'01:30');
        grdDefect.SetGridText(0,G_02,'02:30');
        grdDefect.SetGridText(0,G_03,'03:30');
        grdDefect.SetGridText(0,G_04,'04:30');
        grdDefect.SetGridText(0,G_05,'05:30');
        grdDefect.SetGridText(0,G_06,'06:30');
        grdDefect.SetGridText(0,G_07,'07:30');
        grdDefect.SetGridText(0,G_08,'08:30');
        grdDefect.SetGridText(0,G_09,'09:30');
		grdDefect.SetGridText(0,G_10,'10:30');
		grdDefect.SetGridText(0,G_11,'11:30');
		grdDefect.SetGridText(0,G_12,'12:30');
		grdDefect.SetGridText(0,G_13,'13:30'); 
    } 
	  
    OnSearch();
}
//==============================================================================
</script>

<body>  
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00065" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00065"  > 
                <input> 
                    <input bind="lstLineGroup" />
		    		<input bind="lstComponent" />                       
                    <input bind="dtDate" /> 
                    <input bind="lstShift" />
		    		<input bind="chkShowDetail" />
                </input> 
                <output bind="grdView" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00065_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00065_1"  > 
                <input> 
                    <input bind="lstLineGroup" />
		    		<input bind="lstComponent" />                      
                    <input bind="dtDate" /> 
                    <input bind="lstShift" />
                    <input bind="chkShowDetail" />
                </input> 
                <output bind="grdDefect" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Line Group</td>
                        <td style="width: 30%">
                            <gw:list id="lstLineGroup" styles='width:100%' onchange="OnSearch()" csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
						Component
                        </td>
                        <td style="width: 30%">    
						<gw:list id="lstComponent" styles='width:100%' onchange="OnSearch()" csstype="mandatory" />                        
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtDate" lang="1" />
                        </td>
                        <td style="width: 2%" align="right">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/icons_button/back.gif"
                                style="cursor: hand" onclick="OnPreviousDate()" />
                        </td>
                        <td style="width: 2%" align="left">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/icons_button/next.gif"
                                style="cursor: hand" onclick="OnNextDate()" /></td>
                        <td style="width: 10%">
                             <gw:list id="lstShift" styles='width:100%' value='1' onchange="OnRefreshHeader()" csstype="mandatory">
                                <data>|1|08:30->20:30|2|17:30->05:30|3|01:30->13:30</data>
                             </gw:list>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td style="width: 100%">
                <gw:grid id='grdView' header='Line ID|Style|Target Qty|Prod Qty|08:30|09:30|10:30|11:30|12:30|13:30|14:30|15:30|16:30|17:30|18:30|19:30|20:30|Bal Qty|Finish(%)'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    defaults='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1500|1200|1200|900|900|900|900|900|900|900|900|900|900|900|900|900|1400|1400'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td align="left" style="width: 10%">
                            <img status="expand" id="img1" src="../../../system/images/down_orange.gif" style="cursor: hand;"
                                onclick="OnToggle()" /></td>
                        <td align="left" style="width:10%; white-space: nowrap">
                            <b style="color: Red">&nbsp;&nbsp;Defect Checking</b>
                        </td>
						<td align="center" style="width:10%"> 
					    </td>
                        <td style="width: 10%; white-space: nowrap"> 
			    			Show Detail
                            <gw:checkbox id="chkShowDetail" defaultvalue="Y|N" value="N" onchange="OnSearch()" />                                                        
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%" id='Defect'>
            <td style="width: 100%">
					<gw:grid id='grdDefect' header='Line ID|Style|Target Qty|Prod Qty|08:30|09:30|10:30|11:30|12:30|13:30|14:30|15:30|16:30|17:30|18:30|19:30|20:30|Bal Qty|Finish(%)'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    defaults='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1500|1200|1200|900|900|900|900|900|900|900|900|900|900|900|900|900|1400|1400'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
</html>
