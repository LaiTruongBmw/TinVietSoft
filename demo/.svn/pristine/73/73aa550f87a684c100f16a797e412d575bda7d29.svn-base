<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Measurement Entry</title>
</head>
<script type="text/javascript">
   
  //--------grdUOM--------
  var G1_UOM_PK 	  = 0,
  	  G1_UOM_CODE 	  = 1,
  	  G1_UOM_NAME 	  = 2,
  	  G1_MEASURE_TYPE = 5,
	  G1_CNV_RATIO_01 = 6,
	  G1_CNV_UOM_01   = 7,
	  G1_CNV_RATIO_02 = 8,
	  G1_CNV_UOM_02   = 9,
	  G1_CNV_RATIO_03 = 10,
	  G1_CNV_UOM_03   = 11,
	  G1_CNV_RATIO_04 = 12,
	  G1_CNV_UOM_04   = 13,
	  G1_CNV_RATIO_05 = 14,
	  G1_CNV_UOM_05   = 15;
 
  //--------grdItem--------
  var G3_MEA_ITEM_PK = 0,  	  
  	  G3_ITEM_PK     = 1,  	 
  	  G3_ITEM_CODE   = 2,
  	  G3_ITEM_NAME   = 3,
	  G3_TRANS_UOM   = 4,
	  G3_TRANS_RATE  = 5,
	  G3_REMARK		 = 6;
	  
	  
 var arr_FormatNumber = new Array();
 
//============================================================================ 
function BodyInit()
{ 
    System.Translate(document); 
    BindingDataList();
	
   	OnSearch('UOM');
}
//============================================================================ 
 function BindingDataList()
 { 
    grdUOM.GetGridControl().WordWrap = true;
    grdUOM.GetGridControl().RowHeight(0) = 700 ;   
    
    var data =""
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, code_nm FROM tlg_lg_code a, tlg_lg_code_group b  WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIT0220' " ) %> ";       
    grdUOM.SetComboFormat(G1_MEASURE_TYPE,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT uom_code, uom_code  FROM tlg_it_uom WHERE del_if = 0   " ) %> ";       
    grdItem.SetComboFormat(G3_TRANS_UOM,data);
    
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT uom_code, uom_code  FROM tlg_it_uom WHERE del_if = 0   " ) %> ";       
    grdUOM.SetComboFormat(G1_CNV_UOM_01,data);
	grdUOM.SetComboFormat(G1_CNV_UOM_02,data);
	grdUOM.SetComboFormat(G1_CNV_UOM_03,data);
	grdUOM.SetComboFormat(G1_CNV_UOM_04,data);
	grdUOM.SetComboFormat(G1_CNV_UOM_05,data);
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGIT0220') FROM DUAL" )%>||ALL";  // measure
  	lstMeasuretype.SetDataText(data);
	lstMeasuretype.value ='';
	
	var ctr = grdUOM.GetGridControl();
	ctr.ColFormat(G1_CNV_RATIO_01) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_CNV_RATIO_02) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_CNV_RATIO_03) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_CNV_RATIO_04) = "#,###,###,###,###,###.#####";
	ctr.ColFormat(G1_CNV_RATIO_05) = "#,###,###,###,###,###.#####";
	
	var ctr = grdItem.GetGridControl();     
    ctr.ColFormat(G3_TRANS_RATE) = "#,###,###,###,###,###.#####";
	
	arr_FormatNumber[G1_CNV_RATIO_01] = 5;
	arr_FormatNumber[G1_CNV_RATIO_02] = 5;
	arr_FormatNumber[G1_CNV_RATIO_03] = 5;
	arr_FormatNumber[G1_CNV_RATIO_04] = 5;
	arr_FormatNumber[G1_CNV_RATIO_05] = 5;
	
 }
//============================================================================ 
function OnAddNew(index)
{
   switch(index)
   {
        case 'UOM' :
            grdUOM.AddRow();
        break;		                 
   }
}
//============================================================================ 
function OnSave(index)
{  
    switch(index)
    {
        case 'UOM' :                                         // save unit
             data_agci00030.Call();                           
        break;		       
    }
}
 
 
//============================================================================ 
function OnDelete(grid)
{     
   	if ( grid.GetGridData( grid.row, 0 ) == "" ) 
    {						
		grid.RemoveRow();					
	}			
	else 
	{
		if ( confirm( "Do you want to mark this row to delete?" ) ) 
		{
			grid.DeleteRow();
		}				
	}    
}
//============================================================================ 
function OnUnDelete(grid)
{
    grid.UnDeleteRow();
}
//============================================================================ 
function OnSearch(id)
{
    switch(id)
    {
        case 'UOM' : //Search Unit
            data_agci00030.Call("SELECT");
        break;
		        
        case 'MEA-ITEM' : //Search Converst Rate
            if ( grdUOM.row > 0 )
			{
            	txtUOM.text = grdUOM.GetGridData( grdUOM.row, G1_UOM_CODE );
			}
			else
			{
				txtUOM.text = '' ;
			}
			
            data_agci00030_2.Call("SELECT");
        break;
    }
        
}
//============================================================================ 
function OnPopUp(index)
{
    switch(index)
    {
         case "MeasureType":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIT0220";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                               
         break; 
		  
		 case "VIEW-DETAIL":
             var path = System.RootURL + "/standard/forms/ag/ci/agci00031.aspx";
	         var object = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes');		 
		 break;         
    }
  
}

//============================================================================ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_agci00030':
              
			 grdItem.ClearData(); 
        break;
    }    
}

//============================================================================ 

function CheckInput(obj)
{  	 
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_CNV_RATIO_01 || col == G1_CNV_RATIO_02 || col == G1_CNV_RATIO_03 || col == G1_CNV_RATIO_04 || col == G1_CNV_RATIO_05 )
    {
        var dQuantiy ;
        
        dQuantiy =  grdUOM.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdUOM.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {                 
                grdUOM.SetGridText( row, col, "");
            }
        }
        else
        {
            grdUOM.SetGridText(row,col,"") ;
        }          
    }
}

//============================================================================
   
</script>

<html>
<body>
    <!--------------------------------------------------------------->
    <gw:data id="data_agci00030" onreceive="OnDataReceive(this)">
	    <xml>
	        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_agci00030" procedure="st_lg_upd_agci00030" >
	            <input bind="grdUOM" >
	                <input bind="lstMeasuretype"/>
	            </input>
	            <output bind="grdUOM" />
	        </dso>
	    </xml>
	</gw:data>    
    <!---------------------------------------------------------------->
    <gw:data id="data_agci00030_2" onreceive="OnDataReceive(this)">
	    <xml>
	        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6" function="st_lg_sel_agci00030_2" procedure="st_lg_upd_agci00030_2">
	            <input bind="grdItem" >
	                <input bind="txtUOM" />                                	       
	                <input bind="txtItem" /> 
	            </input>
	            <output bind="grdItem" />
	        </dso>
	    </xml>
	</gw:data>
   <!---------------------------------------------------------------->  
    <table width="100%" style="background-color: #BDE9FF; height: 100%" cellspacing="2">
        <tr style="background-color: White; height: 100%">
            <td width="50%">
                <table width="100%" style="height: 100%">
                    <tr style="height: 5%">
                        <td width="20%" style="white-space: nowrap">
                            <a title="Click here to add new measure type" onclick="OnPopUp('MeasureType')" href="#tips"
                                style="text-decoration: none; color:#0000ff"><b>Measure type</b></a></td>
                        <td width="70%">
                            <gw:list id="lstMeasuretype" styles="width:100%;" onchange="OnSearch('UOM')"></gw:list>
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch('UOM')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="new" alt="New unit" onclick="OnAddNew('UOM')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete(grdUOM)" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="udelete" alt="UnDelete" onclick="OnUnDelete(grdUOM)" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="save" alt="Save" onclick="OnSave('UOM')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td width="100%" colspan="7">
                            <gw:grid id="grdUOM" header="_PK|Unit Code|Unit Name|F Name 01|F Name 02|Measure Type|Ratio 1|UOM 1|Ratio 2|UOM 2|Ratio 3|UOM 3|Ratio 4|UOM 4|Ratio 5|UOM 5"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|3|1|3|1|3|1|3|1|3|1" defaults="|||||||||||||||" editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|1200|1500|1500|1500|1500|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000" styles="width:100%;height:100%"
                                oncellclick="OnSearch('MEA-ITEM')" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" onafteredit="CheckInput(this)"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="50%">
                <table width="100%" style="height: 100%">                   
                    <tr style="height: 1%">
						<td width="20%" align="center" style="white-space: nowrap" >
                             <a title="Click here to view details" onclick="OnPopUp('VIEW-DETAIL')" href="#tips"
                                style="text-decoration: none; color:#0000ff"><b>View Detail</b></a>
                        </td>
                        <td width="20%" align="right" style="white-space: nowrap" >
                            Item
                        </td>
                        <td width="40%" align="left">
                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('MEA-ITEM')"></gw:textbox>
                        </td>
						<td width="19%">
                        </td>							 
                        <td width="1%">
                             <gw:imgbtn img="search" alt="Search" onclick="OnSearch('MEA-ITEM')" />
                        </td>						
                    </tr>
                    <tr style="height: 99%">
                        <td width="50%" colspan="10">
                            <gw:grid id='grdItem' 
								header='_PK|_ITEM_PK|Item Code|Item Name|Trans UOM|Trans Rate|Remark'
                                format='0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|3|0' 
								defaults='||||||' 
								editcol='0|0|0|0|0|0|0'
                                widths='0|0|2000|3000|1200|1500|1000' 
								sorting='T' 
								styles='width:100%; height:100%'
								  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtUOM" styles="display: none" />
</html>
