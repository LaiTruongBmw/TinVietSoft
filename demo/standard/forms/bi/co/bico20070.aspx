<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Department</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       
        
    var G1_CHK  				= 0,
        G1_BRANCH   			= 1,
        G1_MONTH    			= 2,
        G1_COST_TYPE  			= 3,
		G1_MONTH_COST_2M    	= 4,        
        G1_DAILY_COST_2M    	= 5,
		G1_MONTH_COST_1M		= 6,
		G1_DAILY_COST_1M		= 7,
        G1_this_MONTH_COST    	= 8,
		G1_Working_Days    		= 9,
		G1_Daily_Cost			= 10,
		G1_Version				= 11,
		G1_PK					= 12,
		G1_tac_abplcenter_pk	= 13,
		G1_Flexible				= 14,
		G1_Fixed				= 15;

		var arr_FormatNumber = new Array();
 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);
     
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
//===============================================================================
 function FormatGrid()
 {

	var data = "" ;
		
	data = "<%=ESysLib.SetListDataSQL("SELECT tac_abplcenter_pk, PLC_NM || ' * ' || PL_NM FROM VLG_AC_PLCENTER a WHERE a.tac_abplcenter_pk IN (SELECT b.tac_abplcenter_pk FROM TLG_CO_DL_BRANCH_ORG b WHERE b.del_if = 0) ORDER BY PLC_NM" )%>||";    
    lstBranch.SetDataText(data); 
	
	var ctr = grdDetail.GetGridControl(); 
          
    ctr.ColFormat(G1_MONTH_COST_2M) 	= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_DAILY_COST_2M) 	= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_MONTH_COST_1M) 	= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_DAILY_COST_1M) 	= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_this_MONTH_COST) 	= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_Daily_Cost) 		= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_Flexible) 			= "#,###,###,###,###,###R";
	ctr.ColFormat(G1_Fixed) 			= "#,###,###,###,###,###R";
	
	arr_FormatNumber[G1_MONTH_COST_2M]= 2;
 }
 
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_bico20070.Call("SELECT");
            break;     
      }  
 }


//===============================================================================
function OnAddNew(pos)
{
    switch (pos)         
    {		                
        case 'grdDetail' :       
			var fpath = System.RootURL + '/form/bi/co/bico20071.aspx';
			var aValue  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes');
            //  grdDetail.ddRow();	 
			//  grdDetail.SetGridText( grdDetail.rows-1, G1_BRANCH_PK, lstBranch.value );	           
        break;
    }  
}
 
//===============================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_bico20070.Call();
            break;
      }  

 }

//===============================================================================

 function OnDelete()
 {
		if ( grdDetail.GetGridData( grdDetail.row, G1_OTHER_COST_D_PK ) == "" ) 
	    {						
				grdDetail.RemoveRow();					
		}			
		else 
		{
			if ( confirm( "Do you want to mark this row to delete?" ) ) 
			{
				grdDetail.DeleteRow();
			}
		}
 }
 
//===============================================================================

 function OnUnDelete()
 {
        grdDetail.UnDeleteRow();
 }
 
//===============================================================================
 function CheckInput()
 {   
    var col, row;
    
    col = event.col;
    row = event.row;
    /*
    if ( col == G1_ITEM_AMOUNT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }         
        //------------------------
    } /**/
 }
  
//===============================================================================
 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdDetail' :
	             var row  = event.row;
	             var col  = event.col;
                 if (col == G1_EXP_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_EXP_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_EXP_ACC,aValue[2]); 
                        }		               
                 }                
            break;
       }     
 }  
 
//===============================================================================
 function OnDataReceive(obj)
 {
	OnMergeHeader();
    switch (obj.id)
    {
        case 'data_bico20070':
			/*
            if (grdDetail.rows > 1)
            {				
				grdDetail.SetCellBgColor( 1, G1_ITEM_AMOUNT, grdDetail.rows - 1, G1_ITEM_AMOUNT, 0xCCFFFF );
            }/**/
 			//alert('test');
			
			//alert('test2');			
        break;
    }
 }   
//===============================================================================
function OnReport()
{
	var url =System.RootURL + "/reports/ep/bp/rpt_bico20070.aspx"; 
	System.OpenTargetPage(url); 
}
//===============================================================================
function OnMergeHeader()
{

	if(grdDetail.rows == 1)
		grdDetail.AddRow();
	
	var fg = grdDetail.GetGridControl();
	fg.FixedRows = 2; 
	fg.Cell(13, 1, 0, 1, fg.Cols - 1) = true ;    
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;   
	
	fg.MergeCol(0) = true;

	fg.MergeCol(G1_CHK) = true ;
	fg.Cell(0, 0, G1_CHK, 1, G1_CHK) = 'Chk';   
	
	fg.MergeCol(G1_BRANCH) = true ;
	fg.Cell(0, 0, G1_BRANCH, 1, G1_BRANCH) = 'Branch';   
	
	fg.MergeCol(G1_MONTH) = true ;
	fg.Cell(0, 0, G1_MONTH, 1, G1_MONTH) = 'Month';	
	
	fg.MergeCol(G1_COST_TYPE) = true ;		
	fg.Cell(0, 0, G1_COST_TYPE, 1, G1_COST_TYPE) = 'Cost Type' ;
	
	//fg.MergeCol(g_CalcAmount) = true ;		
	fg.Cell(0, 0, G1_MONTH_COST_2M, 0, G1_DAILY_COST_2M) = '-2M';
	
	fg.Cell(0, 1, G1_MONTH_COST_2M, 1, G1_MONTH_COST_2M) = 'Month Cost';
	
	fg.Cell(0, 1, G1_DAILY_COST_2M, 1, G1_DAILY_COST_2M) = 'Daily Cost';

	fg.Cell(0, 0, G1_MONTH_COST_1M, 0, G1_DAILY_COST_1M) = '-1M';
	
	fg.Cell(0, 1, G1_MONTH_COST_1M, 1, G1_MONTH_COST_1M) = 'Month Cost';
	
	fg.Cell(0, 1, G1_DAILY_COST_1M, 1, G1_DAILY_COST_1M) = 'Daily Cost';
	
	fg.MergeCol(G1_this_MONTH_COST) = true ;		
	fg.Cell(0, 0, G1_this_MONTH_COST, 1, G1_this_MONTH_COST) = 'this Month Cost';

	fg.MergeCol(G1_Working_Days) = true ;		
	fg.Cell(0, 0, G1_Working_Days, 1, G1_Working_Days) = 'Working Days';
	
	fg.MergeCol(G1_Daily_Cost) = true ;		
	fg.Cell(0, 0, G1_Daily_Cost, 1, G1_Daily_Cost) = 'Daily Cost';

	fg.MergeCol(G1_Version) = true ;		
	fg.Cell(0, 0, G1_Version, 1, G1_Version) = 'Version';

	fg.MergeCol(G1_Flexible) = true ;		
	fg.Cell(0, 0, G1_Flexible, 1, G1_Flexible) = 'Flexible';
	
	fg.MergeCol(G1_Fixed) = true ;		
	fg.Cell(0, 0, G1_Fixed, 1, G1_Fixed) = 'Fixed';
}
//===============================================================================
function OnSelectAll()
{
	var i;
	if(chkCheckAll.value == "T")
	{
		for(i = 2; i < grdDetail.rows; i++)
		{
			grdDetail.SetGridText(i, G1_CHK, '-1');
		}
	}
	else
	{
		for(i = 2; i < grdDetail.rows; i++)
		{
			grdDetail.SetGridText(i, G1_CHK, '0');
		}	
	}	
}
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico20070" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="" function="<%=l_user%>lg_sel_bico20071"  procedure="<%=l_user%>lg_upd_bico20070" > 
                <input> 
                    <input bind="dtFrom" />                     
					<input bind="lstBranch" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 10%" align="right">
                Branch
            </td>
            <td style="width: 30%" align="right">
                <gw:list id="lstBranch" styles="width:100%;" />
            </td>
            <td style="width: 5%" align="right">
                Month
            </td>
            <td style="width: 15%" align="left">
                <gw:datebox id="dtFrom" lang="1" type="month" />               
            </td>
			<td style="width: 10%" align="left">
				<gw:textbox id="txtWDays" value="25" />
			</td>	
            <td style="width: 10%" align="left">Working Days</td>            
			<td style="width: 10%" align="right">
				<td><gw:icon id="btnProcess" text="Process" onclick="OnProcess()" style="display:none;" /></td>
			</td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" style="display:none;" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete()" style="display:none;" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" style="display:none;" />
            </td>			 
        </tr>
		<tr>
			<td align="right"><gw:checkbox id="chkCheckAll" value="F" onchange="OnSelectAll()" /></td>
			<td align="left">Select All</td>
		</tr>		
        <tr style="height: 94%">
            <td colspan="13">
                <gw:grid id="grdDetail" 
					header='Chk|Branch|Month|Cost Type|Month Cost|Daily Cost|Month Cost|Daily Cost|this Month Cost|Working days|Daily Cost|Version|_PK|_tac_abplcenter_pk|Flexible|Fixed'
                    format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|2|1|1|3|3|3|3|3|3|3|1|0|0|3|3' 
					defaults='|||||||||||||||' 
					editcol='1|0|0|0|0|0|0|0|0|1|1|1|0|0|0|0'
                    widths='500|1600|900|1400|1500|1500|1500|1500|1500|1500|1500|800|0|0|1500|1500'
					styles='width:500; height:100%'
                    sorting="T" onafteredit="CheckInput()" />
            </td>
        </tr>
    </table>
    
</body>
<gw:datebox id="dtTo" lang="1" style="display:none;" /> 
</html>
