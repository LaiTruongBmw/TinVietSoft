<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Monitoring Display : Line Daily Result</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
var G_Line_ID       = 0, 
	G_PO_STYLE		= 1,   
    G_Target_Qty    = 2,
    G_Prod_Qty      = 3,
    G_D1            = 4,
    G_D2            = 5,
    G_D3            = 6,
    G_D4            = 7,
    G_D5            = 8,
    G_D6            = 9,
    G_D7            = 10,
    G_D8            = 11,
    G_D9            = 12,
    G_Bal_Qty       = 13,
    G_Prod_Percent  = 14;
//==============================================================================    
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    
    GridFormat();
}
//==============================================================================
function BindingDataList()
{    
    var data="";    
                    
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, group_id || ' - ' || GROUP_NAME FROM prod.pb_line_group WHERE del_if = 0 ORDER BY group_id ") %>||" ;    
    lstLineGroup.SetDataText(data);
    lstLineGroup.value = '';    
}    
//==============================================================================
function GridFormat()
{
      var trl ;
      
      trl = grdProduct.GetGridControl();
          	
      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
      trl.ColFormat(G_Prod_Qty)    = "###,###,###,###,###";
      trl.ColFormat(G_D1)          = "###,###,###,###,###"; 
      trl.ColFormat(G_D2)          = "###,###,###,###,###";     
      trl.ColFormat(G_D3)          = "###,###,###,###,###";
      trl.ColFormat(G_D4)          = "###,###,###,###,###";
      trl.ColFormat(G_D5)          = "###,###,###,###,###";
      trl.ColFormat(G_D6)          = "###,###,###,###,###";
      trl.ColFormat(G_D7)          = "###,###,###,###,###";
      trl.ColFormat(G_D8)          = "###,###,###,###,###";
      trl.ColFormat(G_Bal_Qty)     = "###,###,###,###,###";
	  
	  trl.MergeCells  = 2 ;	
      trl.MergeCol(0) = true ;
	  //-----------------------------------          	
      
      trl = grdDefect.GetGridControl();
            	
      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
      trl.ColFormat(G_Prod_Qty)    = "###,###,###,###,###";
      trl.ColFormat(G_D1)          = "###,###,###,###,###"; 
      trl.ColFormat(G_D2)          = "###,###,###,###,###";     
      trl.ColFormat(G_D3)          = "###,###,###,###,###";
      trl.ColFormat(G_D4)          = "###,###,###,###,###";
      trl.ColFormat(G_D5)          = "###,###,###,###,###";
      trl.ColFormat(G_D6)          = "###,###,###,###,###";
      trl.ColFormat(G_D7)          = "###,###,###,###,###";
      trl.ColFormat(G_D8)          = "###,###,###,###,###";
      trl.ColFormat(G_Bal_Qty)     = "###,###,###,###,###";   
	  
	  trl.MergeCells  = 2 ;	
      trl.MergeCol(0) = true ;	           
}
//==============================================================================
function OnSearch()
{
     data_fpgm00068_2.Call("SELECT");
}
//==============================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'pro_fpgm00068' :
            OnSearch();
        break;
        
        case 'data_fpgm00068_2':
            SetHeader();
            
            data_fpgm00068.Call("SELECT");
        break;
        
        case 'data_fpgm00068' :
            if ( grdProduct.rows > 1)
            {
                grdProduct.GetGridControl().Cell(13, 1, G_Line_ID, grdProduct.rows-1, G_Line_ID ) = 11;
                
                grdProduct.GetGridControl().Cell( 7, 0, G_Target_Qty,  grdProduct.rows-1, G_Prod_Qty ) = 0xCC00CC;
                grdProduct.GetGridControl().Cell( 7, 0, G_Bal_Qty, grdProduct.rows-1, G_Bal_Qty  ) = 0xCC00CC;
                            
                //-------------------
                
                for ( var i=1; i < grdProduct.rows; i=i+2 )
                {
                     grdProduct.SetCellBgColor( i, 1, i, grdProduct.cols - 1, 0xCCFFFF );                             
                }                                
                
                //------------------- 
                grdProduct.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13', '###,###,###');
            }
            
            data_fpgm00068_1.Call("SELECT");            
        break ; 
        
        case 'data_fpgm00068_1' :
        
            if ( grdDefect.rows > 1)
            {
                grdDefect.GetGridControl().Cell(13, 1, G_Line_ID, grdDefect.rows-1, G_Line_ID ) = 11;
                
                grdDefect.GetGridControl().Cell( 7, 0, G_Target_Qty,  grdDefect.rows-1, G_Prod_Qty ) = 0xCC00CC;
                grdDefect.GetGridControl().Cell( 7, 0, G_Bal_Qty, grdDefect.rows-1, G_Bal_Qty  ) = 0xCC00CC;
                            
                //-------------------
                
                for ( var i=1; i < grdDefect.rows; i=i+2 )
                {
                     grdDefect.SetCellBgColor( i, 1, i, grdDefect.cols - 1, 0xCCFFFF );                             
                }                                
                
                //------------------- 
                grdDefect.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13', '###,###,###');
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

function OnProcess(pos)
{
    switch (pos)
    {
        case 'LoadLine':
            
        break;
    }
}
//==============================================================================
function SetHeader()
{
     for( var j = 0; j < grdTmp.cols-1; j++ )
     {
          //------------------------
          if ( grdTmp.GetGridData( 1, j ) == "SUNDAY" ) // Bat buoc phai co khoang trong phia sau cua chu SUNDAY
          {       
                grdProduct.GetGridControl().Cell( 7, 0, j + 4, 0, j + 4) = 0x3300cc;
                grdDefect.GetGridControl().Cell(  7, 0, j + 4, 0, j + 4) = 0x3300cc;                        
          }
          else
          {
                grdProduct.GetGridControl().Cell( 7, 0, j + 4, 0, j + 4) = 0x000000;
                grdDefect.GetGridControl().Cell(  7, 0, j + 4, 0, j + 4) = 0x000000;
          }
          
          //------------------------      
          grdProduct.GetGridControl().Cell( 0, 0, j + 4, 0, j + 4 ) = grdTmp.GetGridData( 2, j );
          grdDefect.GetGridControl().Cell(  0, 0, j + 4, 0, j + 4 ) = grdTmp.GetGridData( 2, j );
          //------------------------
     }     
}
//==========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00068" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00068"  > 
                <input> 
                    <input bind="lstLineGroup" /> 
                     <input bind="dtDate" />                   
                </input> 
                <output bind="grdProduct" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00068_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00068_1"  > 
                <input> 
                    <input bind="lstLineGroup" />
                     <input bind="dtDate" /> 
                </input> 
                <output bind="grdDefect" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00068_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00068_2"  > 
                <input> 
                    <input bind="dtDate" /> 
                </input> 
                <output bind="grdTmp" /> 
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
                        </td>
                        <td style="width: 30%">                             
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 2%" align="right">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/icons_button/back.gif"
                                style="cursor: hand" onclick="OnPreviousDate()" />
                        </td>
                        <td style="width: 1%">
                            <gw:datebox id="dtDate" lang="1" />
                        </td>
                        <td style="width: 2%" align="left">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/icons_button/next.gif"
                                style="cursor: hand" onclick="OnNextDate()" /></td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 4%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td style="width: 100%">
                <gw:grid id='grdProduct' header='Line ID|PO/Style|Plan Qty|Prod Qty|D1|D2|D3|D4|D5|D6|D7|D8|D9|Bal Qty|Finish (%)'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|3|3|3|3|3|3|3|3|3|3|3|3|3' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|2000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td style="width: 5%">
                            <img status="expand" id="img1" src="../../../system/images/down_orange.gif" style="cursor: hand;"
                                onclick="OnToggle()" /></td>
                        <td align="left" style="width: 90%">
                            <b style="color: Red">&nbsp;&nbsp;Defect Checking</b>
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%" id='Defect'>
            <td style="width: 100%">
                <gw:grid id='grdDefect' header='Line ID|PO/Style|Plan Qty|Defect Qty|D1|D2|D3|D4|D5|D6|D7|D8|D9|_Bal Qty|Defect (%)'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|3|3|3|3|3|3|3|3|3|3|3|3|3' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|2000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:grid id='grdTmp' 
    header='D1|D2|D3|D4|D5|D6|D7|D8|D9' 
    format='0|0|0|0|0|0|0|0|0'
    aligns='0|0|0|0|0|0|0|0|0' 
    editcol='1|1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' 
    sorting='T' styles='width:100%;display:none' />
<!------------------------------------------------------->
</html>
