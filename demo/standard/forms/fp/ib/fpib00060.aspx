<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Emp Task Assignment</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//----------grdLine-----

var G1_Style_PK   = 0,
    G1_Style_ID   = 1,
    G1_Style_Name = 2;
   
var G2_WP_ID         = 0,
    G2_WP_NAME       = 1,
    G2_AVG_TIME      = 2,
    G2_OP_SEQ        = 3,
    G2_OP_SEQ_TIME   = 4,
    G2_TASK_SEQ      = 5,
    G2_TASK_SEQ_TIME = 6,
    G2_R_D_PK        = 7,
    G2_TASK_ID       = 8,
    G2_TASK_NAME     = 9,
    G2_TASK_TIME     = 10,
    G2_HR_COST       = 11,
    G2_POINT_TIME    = 12;
    
var G3_RP_PK        = 0,
    G3_Seq          = 1,
    G3_Point_ID     = 2,
    G3_Point_Name   = 3,
    G3_Point_Time   = 4,
    G3_Emp_PK       = 5,
    G3_Emp_Name     = 6;
    
var G4_EmpTask_PK   = 0,
    G4_Seq          = 1,
    G4_RP_PK        = 2, 
    G4_ROUTING_D_PK = 3,
    G4_PB_TASK_PK   = 4,
    G4_Task_ID      = 5,
    G4_Task_Name    = 6,   
    G4_Task_Time    = 7,
    G4_MP           = 8,
    G4_EMP_PK       = 9,
    G4_Emp_Name     = 10;  
  //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}    
//=======================================================================
function BodyInit()
{ 
    System.Translate(document);
    //------------------
    BindingDataList();
}

//=======================================================================
function BindingDataList()
{
    var data=""; 
       
    data = "<%=ESysLib.SetListDataSQL("select pk,GROUP_ID || ' - ' || GROUP_NAME from tlg_PB_LINE_GROUP v where del_if = 0 ORDER BY GROUP_ID")%>";   
    lstLineGroup.SetDataText(data);

    data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' ) ORDER BY grp_cd")%>";   
    lstGroup.SetDataText(data);
                            
    //-----------------------    
    grdRP.GetGridControl().Cell( 7, 0, G3_Point_Time, 0, G3_Point_Time) = 0x3300cc;
    
    grdRouting.GetGridControl().MergeCells  = 2 ;	
    grdRouting.GetGridControl().MergeCol(0) = true ;	
    grdRouting.GetGridControl().MergeCol(1) = true ;   	
    grdRouting.GetGridControl().MergeCol(2) = true ;	
    grdRouting.GetGridControl().MergeCol(3) = true ;
    grdRouting.GetGridControl().MergeCol(4) = true ;
    grdRouting.GetGridControl().MergeCol(5) = true ; 
    grdRouting.GetGridControl().MergeCol(6) = true ;
    
    grdRouting.GetGridControl().ColFormat(G2_AVG_TIME)      = "###,###,###,###,###.##";
    grdRouting.GetGridControl().ColFormat(G2_OP_SEQ_TIME)   = "###,###,###,###,###.##";
    grdRouting.GetGridControl().ColFormat(G2_TASK_SEQ_TIME) = "###,###,###,###,###.##"; 
    grdRouting.GetGridControl().ColFormat(G2_TASK_TIME)     = "###,###,###,###,###.##";  
    grdRouting.GetGridControl().ColFormat(G2_HR_COST)       = "###,###,###,###,###.##"; 
    grdRouting.GetGridControl().ColFormat(G2_POINT_TIME)    = "###,###,###,###,###.##";   
    
    grdEmpTask.GetGridControl().ColFormat(G4_Task_Time) = "###,###,###,###,###.##"; 
    grdEmpTask.GetGridControl().ColFormat(G4_MP)        = "###,###,###,###,###.##";          
     
    grdRP.GetGridControl().ColFormat(G3_Point_Time)        = "###,###,###,###,###.##";                              
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
	
		case 'grdStyle' :
			data_fpib00060.Call('SELECT');
	    break;
	    	
		case 'lstLine' :
			pro_fpib00060.Call('SELECT');
	    break;
	    	    
		case 'grdRP' :
		    data_fpib00060_1.Call('SELECT');							
	    break;
	    
        case 'grdRouting':
            if ( grdStyle.row > 0 )
		    {
			    txtStylePK.text = grdStyle.GetGridData( grdStyle.row, G1_Style_PK ) ;
			    data_fpib00060_2.Call("SELECT");
			}
			else
			{
			    txtStylePK.text = '' ;
			    grdRouting.ClearData();
			}		        
        break;	 
        
		case 'grdEmpTask' :
		    if ( grdRP.row > 0 )
		    {
		        txtRPPK.text = grdRP.GetGridData( grdRP.row, G3_RP_PK ) ;
		        data_fpib00060_3.Call('SELECT');							
		    }
		    else
		    {
		        txtRPPK.text = '';
		        grdEmpTask.ClearData();
		    }    
	    break;           	    
	}
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
		case 'data_fpib00060' :
		    grdRouting.ClearData();		
		break;
		
		case 'data_fpib00060_1' :
		     grdEmpTask.ClearData();
		break;	
		
		case 'data_fpib00060_2' :
			if ( grdRouting.rows > 1 )
		    {
		        grdRouting.SetCellBold( 1, G2_WP_ID,    grdRouting.rows-1, G2_WP_ID,    true);
		        grdRouting.SetCellBold( 1, G2_TASK_ID,  grdRouting.rows-1, G2_TASK_ID,  true); 
		        grdRouting.SetCellBold( 1, G2_OP_SEQ,   grdRouting.rows-1, G2_OP_SEQ,   true);
		        grdRouting.SetCellBold( 1, G2_TASK_SEQ, grdRouting.rows-1, G2_TASK_SEQ, true);
		        
		        grdRouting.SetCellBgColor( 1, G2_OP_SEQ,   grdRouting.rows-1, G2_OP_SEQ,    0xCCFFFF ); 
		        grdRouting.SetCellBgColor( 1, G2_TASK_SEQ, grdRouting.rows-1, G2_TASK_SEQ,  0xCCFFFF );
		        grdRouting.SetCellBgColor( 1, G2_TASK_ID,  grdRouting.rows-1, G2_TASK_NAME, 0xCCFFFF );
            }		     
		break;					
    }
}

//======================================================================
function OnAddNew(pos)
{
    switch(pos)
    {
        case 'grdEmpTask' :
            if ( grdRouting.row > 0 && grdRP.row > 0 )
            {
                grdEmpTask.AddRow();
                
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_Seq, grdEmpTask.rows-1 );
                
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_RP_PK,        grdRP.GetGridData( grdRP.row, G3_RP_PK) );
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_ROUTING_D_PK, grdRouting.GetGridData( grdRouting.row, G2_R_D_PK ) );
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_Task_ID, grdRouting.GetGridData( grdRouting.row, G2_TASK_ID ) );
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_Task_Name, grdRouting.GetGridData( grdRouting.row, G2_TASK_NAME ) );
                
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_Task_Time, grdRouting.GetGridData( grdRouting.row, G2_TASK_TIME ) );
                grdEmpTask.SetGridText( grdEmpTask.rows-1, G4_MP, grdRouting.GetGridData( grdRouting.row, G2_HR_COST ) );
            }
            else
            {
                alert('Pls select one Point and routing.');
            }    
        break;
    }
}
//======================================================================
function OnSave(pos)
{
    switch(pos)
    {
        case 'grdEmpTask' :
            data_fpib00060_3.Call();
        break;
    }
}
//======================================================================

function OnSelect()
{    
    if ( grdTask.row > 0 && event.col == G3_CHK )
    {        
        if ( grdTask.GetGridData( grdTask.row, G3_CHK ) == -1 )
        {
            var t_check = grdTask.row ;
            
            if ( grdResultPoint.row > 0 )
            {
                grdResultPoint.SetGridText( grdResultPoint.row, G2_TASK_PK , grdTask.GetGridData( grdTask.row, G3_TASK_PK ) );
                grdResultPoint.SetGridText( grdResultPoint.row, G2_TASK_ID , grdTask.GetGridData( grdTask.row, G3_TASK_ID ) );
            }
            //--------------------
            for (var i=1; i<grdTask.rows; i++ )  
            {
                if ( i != t_check )
                {
                    grdTask.SetGridText( i, G3_CHK, 0 );
                }    
            }
            //--------------------                          
        }    
        else if ( grdTask.GetGridData( grdTask.row, G3_CHK ) == 0 )
        {
            if ( grdResultPoint.row > 0 )
            {
                grdResultPoint.SetGridText( grdResultPoint.row, G2_TASK_PK, ''  );
                grdResultPoint.SetGridText( grdResultPoint.row, G2_TASK_ID, '' );
            }
        }
    }
}
//======================================================================
function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpib00060" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00060" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="<%=l_user%>lg_sel_fpib00060" > 
			    <input bind="grdStyle" > 
			         <input bind="lstGroup" />	
			         <input bind="txtItem" />			
			    </input> 
			    <output bind="grdStyle" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00060_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="11,12,13,14" function="<%=l_user%>lg_sel_fpib00060_1"     > 
			    <input bind="grdRP" > 
			        <input bind="lstLine" />        		
			    </input> 
			    <output bind="grdRP" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00060_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2" function="<%=l_user%>lg_sel_fpib00060_2" > 
			    <input bind="grdRouting" > 
			        <input bind="txtStylePK" />			        		
			    </input> 
			    <output bind="grdRouting" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00060_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fpib00060_3" procedure="<%=l_user%>lg_upd_fpib00060_3" > 
			    <input bind="grdEmpTask" > 
			        <input bind="txtRPPK" />	        		
			    </input> 
			    <output bind="grdEmpTask" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 50%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Group</td>
                        <td style="width: 45%">
                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('grdStyle')"></gw:list>
                        </td>
                        <td style="width: 5%" align="right">
                            Style</td>
                        <td style="width: 40%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdStyle')" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search for process List" onclick="OnSearch('grdStyle')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="5" style="width: 100%;">
                            <gw:grid id='grdStyle' header='_PK|Style Code|Style Name' format='0|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='1000|2000|3000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdRouting')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Group</td>
                        <td style="width: 45%">
                            <gw:list id="lstLineGroup" styles="width:100%;" onchange="OnSearch('lstLine')"></gw:list>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Line</td>
                        <td style="width: 40%">
                            <gw:list id="lstLine" styles="width:100%;" onchange="OnSearch('grdRP')"></gw:list>
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search for Style List" onclick="OnSearch('grdRP')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="5" style="width: 100%;">
                            <gw:grid id='grdRP' header='_PK|Seq|Point ID|Point Name|Point Time|_Emp_PK|Emp' format='0|0|0|0|0|0|0' aligns='0|1|0|0|3|0|0'
                                defaults='||||||' editcol='0|0|0|0|0|0|0' widths='0|1000|1500|2000|1200|0|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdEmpTask')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 50%" id="t-right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 50%">
                        <td colspan="6">
                            <gw:grid id='grdRouting' header='W/P ID|W/P Name|Avg Time|O/P Seq|O/P Time|Task Seq|Task Time|_PB_TASK_PK|Task ID|Task Name|ST Time|M/P(%)|Point Time'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|3|1|3|1|3|0|1|0|3|3|3' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|2000|1200|1000|1200|1000|1200|0|1500|2500|1200|1200|1000' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 95%" align="right">
                            <gw:imgbtn id="btnSearch3" img="search" alt="Search" onclick="OnSearch('grdEmpTask')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew3" img="new" alt="Add new" onclick="OnAddNew('grdEmpTask')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete3" img="delete" alt="Delete" onclick="OnDelete(grdEmpTask)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete3" img="udelete" alt="Undelete" onclick="OnUndelete(grdEmpTask)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave3" img="save" alt="Save" onclick="OnSave('grdEmpTask')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="6">
                            <gw:grid id='grdEmpTask' header='_PK|Seq|_RP_PK|_ROUTING_D_PK|_PB_TASK_PK|Task ID|Task Name|Task Time|M/P(%)|_EMP_PK|Emp'
                                format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|3|3|0|0' check='||||||||||'
                                editcol='0|1|0|0|0|0|0|0|1|0|0' widths='0|800|0|0|0|1500|2500|1200|1200|0|1000'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="alert()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtRPPK" text="" styles="display:none" />
    <gw:textbox id="txtStylePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
