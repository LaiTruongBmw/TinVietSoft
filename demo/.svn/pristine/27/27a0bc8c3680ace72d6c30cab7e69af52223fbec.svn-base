<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>
</head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//----------grdProcess-----
var G1_PROCESS_PK          = 0,
    G1_PROCESS_SEQ         = 1,
    G1_PROCESS_ID          = 2,
    G1_PROCESS_NM          = 3,
    G1_USE_YN              = 4, 
    G1_PROCESS_TYPE        = 5, 
    G1_FEE_RATE            = 6,
	G1_WH_PK			   = 7,	
    G1_REMARK         	   = 8;
//---------------
 

//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //------------------
    //BindingDataList();
}

//=======================================================================
/*
function BindingDataList()
{
    var data=""; 
       
    data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' ) ORDER BY grp_cd")%>";   
    lstGroup.SetDataText(data);
    //----------------------
    
	
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_id  ASC" )%>|#;" ; 
    grdProcess.SetComboFormat(G1_WH_PK,data); 	
    
    var ctrl = grdProcess.GetGridControl();
    ctrl.ColFormat(G1_FEE_RATE) = "###,###,###.##" ;                          
}
*/
//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdProcess' :
			data_hrpr00200.Call('SELECT');
		break;
		
	}
}

//=======================================================================
function OnAddNew(pos)
{
	switch ( pos )
	{
		case 'grdProcess' :
			grdProcess.AddRow();
			
			grdProcess.SetGridText( grdProcess.rows-1, G1_PROCESS_SEQ, grdProcess.rows-1 );
			
			grdProcess.SetCellBgColor( grdProcess.rows-1, 0, grdProcess.rows-1, grdProcess.cols-1, 0xCCFFFF );						
		break;	
			
	}
}

//=======================================================================
function OnDelete(ogrid)
{
    if( confirm('Do you want to delete?'))
	{
		grdProcess.DeleteRow();
		data_hrpr00200.Call();
	}    
}



//=======================================================================
function OnSave(pos)
{
	switch ( pos )
	{
	
		case 'grdProcess' :
			data_hrpr00200.Call();			
		break;

		
	}
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_hrpr00200' :
	        OnSearch('grdWorkProcess');
	    break;
	    
		
    }
}
function OnDataError(obj) 
{
	
	if(obj.id == "data_hrpr00200")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
		grdProcess.UnDeleteRow();
    }
	
}


//==================================================================================
function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_FEE_RATE)
    {
        var dQuantiy ;
        
        dQuantiy =  grdProcess.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdProcess.SetGridText( row, col, System.Round( dQuantiy,2));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdProcess.SetGridText( row, col, "");
            }
        }
        else
        {
            grdProcess.SetGridText(row,col,"") ;
        }
    }
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------>
    <gw:data id="data_hrpr00200" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_hrpr00200" procedure="st_lg_upd_hrpr00200"> 
			    <input bind="grdProcess" > 
			        <input bind="txtProcess" />			
			    </input> 
			    <output bind="grdProcess" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    
   
    <table name="Process" class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%" align="right">
                            Process
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtProcess" text="" styles="width:100%" onenterkey="OnSearch('grdProcess')" />
                        </td>
                        <td style="width: 30%" align="right">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdProcess')" />
                        </td>
                        
                        <td style="width: 1%">
                            <gw:button id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdProcess')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDlete1" img="delete" alt="Delete" onclick="OnDelete(grdProcess)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave1" img="save" alt="Save" onclick="OnSave('grdProcess')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Seq|Process ID|Process Name|USE|Process Type|_Fee Rate|_W/H|Remark'
                    format='0|0|0|0|3|0|1|0|0' aligns='0|1|0|0|0|0|0|0|0' defaults='||||||||' editcol='0|1|1|1|1|1|1|1|1'
                    widths='1000|800|2000|3000|800|2000|1200|2000|1000' sorting='T' styles='width:100%; height:100%'
					autosize = true
                    onafteredit="CheckInput()"/>
            </td>
        </tr>
        
    </table>
    
   
    <!-- </gw:tab> -->
    <!----------------------------------------------------------->
    <gw:textbox id="txtProcessPK" text="" styles="display:none" />
    <gw:textbox id="txtSTItemPK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
