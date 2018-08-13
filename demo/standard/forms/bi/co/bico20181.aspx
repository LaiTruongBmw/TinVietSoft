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
        
    var G1_OTHER_COST_D_PK  = 0,
        G1_TR_DATE   		= 1,
        G1_BRANCH_PK    	= 2,
        G1_COST_TYPE  		= 3,
		G1_ITEM_AMOUNT    	= 4,        
        G1_PROCESS_YN    	= 5,
		G1_VALID_FROM		= 6,
		G1_VALID_TO			= 7,
        G1_REMARK    		= 8;

		var arr_FormatNumber = new Array();
 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);
     
      //--------------  
      FormatGrid();
      //--------------
      //OnSearch('grdDetail');
 }
 
//===============================================================================
 function FormatGrid()
 {

	var data = "" ;
	
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT tac_abplcenter_pk, PLC_NM || ' * ' || PL_NM FROM VLG_AC_PLCENTER a WHERE a.tac_abplcenter_pk IN (SELECT b.tac_abplcenter_pk FROM TLG_CO_DL_BRANCH_ORG b WHERE b.del_if = 0) ORDER BY PLC_NM " )%>" ;
    grdDetail.SetComboFormat( G1_BRANCH_PK, data);
	
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE,a.CODE || ' * ' || a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGCO0103' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ;
    grdDetail.SetComboFormat( G1_COST_TYPE, data);
	
	data = "<%=ESysLib.SetListDataSQL("select v.tac_abplcenter_pk, v.pl_nm from v_abplcenter v where v.plc_cd = 'BR' order by v.pl_nm asc" )%>||ALL";    
    lstBranch.SetDataText(data); 
	
	var ctr = grdDetail.GetGridControl(); 
          
    ctr.ColFormat(G1_ITEM_AMOUNT) 	= "#,###,###,###,###,###.##";
	
	arr_FormatNumber[G1_ITEM_AMOUNT]= 2;
 }
 
//===============================================================================
function OnClick(obj){
	switch(obj){
		case "new":
			var fpath = System.RootURL + '/form/bi/co/bico20181.aspx';
			var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
		break;
	}
}
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
             
              grdDetail.AddRow();	 
			  
			  grdDetail.SetGridText( grdDetail.rows-1, G1_BRANCH_PK, lstBranch.value );	           
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
    }
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
    switch (obj.id)
    {
        case 'data_bico20070':
            if (grdDetail.rows > 1)
            {				
				grdDetail.SetCellBgColor( 1, G1_ITEM_AMOUNT, grdDetail.rows - 1, G1_ITEM_AMOUNT, 0xCCFFFF );
            }
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
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico20070" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_bico20070"  procedure="<%=l_user%>lg_upd_bico20070" > 
                <input> 
                    <input bind="dtMonth" /> 
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
            <td style="width: 15%" align="right">
                <gw:list id="lstBranch" styles="width:100%;" />
            </td>
            <td style="width: 5%" align="right">
                Month
            </td>
            <td style="width: 30%" align="left">
			   <gw:datebox id="dtMonth" type="month" lang="1" />
            </td>
            <td style="width: 15%" align="right">
				<table style="height: 100%;width:1%" border="0">
					<tr>
						<td width="1%"><gw:button img="search"     	alt="Processing"    id="btnProcessing"  	onclick="OnClick('search')" /> </td>
						<td width="1%"><gw:button img="all"  		alt="Select All" 	id="btnAll"  			onclick="OnClick('all')" /> </td>
						<td width="1%"><gw:button img="save"     	alt="Save & Close"  id="btnSave"  			onclick="OnClick('save')" /> </td>
						<td width="1%"><gw:button img="cancel"     	alt="Cancel"     	id="btnCancel"  		onclick="OnClick('cancel')" /> </td>
					</tr>
				</table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" 
					header='_PK|CHK|BRANCH|MONTH|COST TYPE|MONTH COST|DAILY COST|MONTH COST|DAILY COST|THIS MONTH|WORKING DAYS|DAILY COST|VERSION|VALID'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					defaults='|||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1000|3000|1000|2000|2000|2000|2000|2000|2000|2000|2000|1000|1000'
					styles='width:500; height:100%'
                    sorting="T" />
            </td>
        </tr>
    </table>
    
</body>
</html>
