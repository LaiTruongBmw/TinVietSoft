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
  	  G1_MEASURE_TYPE = 5;
  //--------grdMeasure--------
  var G2_MEA_PK   = 0,  	  
  	  G2_CON_UOM  = 1,   // unit want to convert
  	  G2_CON_RATE = 2,   // rate
  	  G2_UOM_CODE = 3,  
  	  G2_UOM_PK   = 4;
   
  
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
    
    var ctr = grdMeasure.GetGridControl(); 
    ctr.ColFormat(G2_CON_RATE)    = "###,###.#####";
	
	arr_FormatNumber[G2_CON_RATE] = 5; 
    
    var data =""
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, code_nm FROM tlg_lg_code a, tlg_lg_code_group b  WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIT0220' " ) %> ";       
    grdUOM.SetComboFormat(G1_MEASURE_TYPE,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT uom_code, uom_code  FROM tlg_it_uom WHERE del_if = 0   " ) %> ";       
    grdMeasure.SetComboFormat(G2_CON_UOM,data);
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGIT0220') FROM DUAL" )%>||ALL";  // measure
  	lstMeasuretype.SetDataText(data);
	lstMeasuretype.value ='';
 }
//============================================================================ 
function OnAddNew(index)
{
   switch(index)
   {
        case 'UOM' :
            grdUOM.AddRow();
        break;
		
        case 'MEASURE' :
            var tmp = grdUOM.row;
			
            if ( tmp < 1 )
            {
                alert("You should select unit first");
            }
            else
            {                               						
                grdMeasure.AddRow(); 

                grdMeasure.SetGridText( grdMeasure.rows-1, G2_UOM_CODE, grdUOM.GetGridData( grdUOM.row, G1_UOM_CODE ));	                	
                grdMeasure.SetGridText( grdMeasure.rows-1, G2_UOM_PK, grdUOM.GetGridData( grdUOM.row, G1_UOM_PK ));	                	
            }    
        break;		 
   }
}
//============================================================================ 
function OnSave(index)
{  
    switch(index)
    {
        case 'UOM' :                                         // save unit
             data_agci00220.Call();                           
        break;
		
        case 'MEASURE' :               
             data_agci00220_1.Call();                                  
        break;
		 
    }
}
 
//============================================================================ 
function OnEdit()
{
    var  row, col;
    row = grdMeasure.row;
    col = grdMeasure.col;
	
    if ( col == G2_CON_RATE )
    {
        var dQuantiy = grdMeasure.GetGridData( row, col);
		
     	if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdMeasure.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdMeasure.SetGridText(row,col,"")
             }
        }
		else
		{
        	grdMeasure.SetGridText(row,col,"")
		}	
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
            data_agci00220.Call("SELECT");
        break;
		
        case 'MEASURE' : //Search Converst Rate		
		    if ( grdUOM.row > 0 ) 
			{
            	txtUOM_PK.text = grdUOM.GetGridData( grdUOM.row, G1_UOM_PK   );                        
            	lblUNIT.text   = grdUOM.GetGridData( grdUOM.row, G1_UOM_CODE );
			}
			else
			{
            	txtUOM_PK.text = '' ;                        
            	lblUNIT.text   = '';			
			}
			
            data_agci00220_1.Call("SELECT");
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
    }
  
}

//============================================================================ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_agci00220':
             grdMeasure.ClearData();  
        break;
		 
    }    
}

//============================================================================ 
</script>

<html>
<body>
    <!--------------------------------------------------------------->
    <gw:data id="data_agci00220" onreceive="OnDataReceive(this)">
	    <xml>
	        <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_agci00220" procedure="st_lg_upd_agci00220" >
	            <input bind="grdUOM" >
	                <input bind="lstMeasuretype"/>
	            </input>
	            <output bind="grdUOM" />
	        </dso>
	    </xml>
	</gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_agci00220_1" onreceive="OnDataReceive(this)">
	    <xml>
	        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6" function="st_lg_sel_agci00220_1" procedure="st_lg_upd_agci00220_1">
	            <input bind="grdMeasure" >
	                <input bind="txtUOM_PK" />                                
	            </input>
	            <output bind="grdMeasure" />
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
                            <gw:grid id="grdUOM" header="_PK|Unit Code|Unit Name|F Name 01|F Name 02|Measure Type"
                                format="0|0|0|0|0|0" aligns="0|0|0|0|0|0" defaults="|||||" editcol="0|1|1|1|1|1"
                                widths="0|1200|1500|1500|1500|1500" styles="width:100%;height:100%"
                                oncellclick="OnSearch('MEASURE')" param="0,1,2,3,4,5" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="50%">
                <table width="100%" style="height: 100%">
                    <tr style="height: 1%">
                        <td width="40%" align="center">                        
                         </td>
                        <td width="40%">
                            <gw:label id="lblUNIT" styles="width:100%;font-weight:bold; color:red" ></gw:label>
                        </td>
                        <td width="3%">
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="new" alt="New" onclick="OnAddNew('MEASURE')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete(grdMeasure)" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="udelete" alt="UnDelete" onclick="OnUnDelete(grdMeasure)" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="save" alt="Save" onclick="OnSave('MEASURE')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td width="50%" colspan="7">
                            <gw:grid id="grdMeasure" header="_PK|Conversion To|Conversion Factor|_uom_code|_tco_uom_pk|Desc|Default YN "
                                format="0|0|1|0|0|0|3" aligns="0|0|0|0|0|0|0" defaults="||||||" editcol="0|1|1|1|0|0|0"
                                widths="0|1500|2000|0|0|2000|800" styles="width:100%;height:100%" oncellclick="OnSearch('MEA-ITEM')"
                                onafteredit="OnEdit()" param="0,1,2,3" />
                        </td>
                    </tr>                                         
                </table>
            </td>
        </tr>
    </table>
</body>
 
 
<gw:textbox id="txtUOM_PK" styles="display: none" />
</html>
