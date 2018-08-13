<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET MANY SPEC</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
	
var G_No            = 0,
    G_Spec_Grp      = 1,
    G_tco_spec_pk   = 2,
    G_Spec_ID       = 3,
    G_Spec_Name     = 4,
    G_Description   = 5;	

var group_type    = "<%=request.QueryString("group_type") %>"  ;
var specgrp_pk    = "<%=request.QueryString("specgrp_pk") %>"  ;
var tco_stitem_pk = "<%=request.QueryString("tco_stitem_pk") %>"  ;

//=======================================================================
function BodyInit()
{
	System.Translate(document);
    if ( group_type == 1 )
    {
        data = "<%=CtlLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 and ( grp_type = 1 or grp_type = 0 ) order by specgrp_nm ")%>";                 
    }
    else if ( group_type == 2 ) 
    {
        data = "<%=CtlLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 and ( grp_type = 2 or grp_type = 0 ) order by specgrp_nm ")%>";             
    }
    else
    {
        data = "<%=CtlLib.SetListDataSQL("SELECT pk, specgrp_nm FROM tlg_it_specgrp WHERE del_if = 0 order by specgrp_nm ")%>";         
    }
    
    lstSpecGrp.SetDataText(data);

    if ( Number(specgrp_pk) > 0 )
    {     
        lstSpecGrp.SetEnable(false); 
        lstSpecGrp.value = specgrp_pk ;
    }
               
    if ( Number(tco_stitem_pk) > 0 )
    {
        txtSTItemPK.text = tco_stitem_pk;
        pro_fpab00470.Call();
    }                     
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00470.Call('SELECT')
 }
   
//=======================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}

//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case'pro_fpab00470':
            OnSearch();
        break;
        
        case 'data_fpab00470' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, 0, grdDetail.rows - 1, 0, 0xCCFFFF );
            }
        break;
    }    
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_tco_spec_pk);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}   
}

//=======================================================================

function CheckDataExist(p_oGrid,p_value)
{  
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
	  
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_tco_spec_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//=======================================================================

function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_tco_spec_pk);
    
    idGrid2.RemoveRowAt(idGrid2.row);
  }
}
//=======================================================================

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdDetail" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_tco_spec_pk );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
}

//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpab00470" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_fpab00470" > 
                <input>
                    <input bind="txtSTItemPK" /> 
                </input> 
                <output>
                    <output bind="lstSpecGrp" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00470" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00470"  > 
			    <input bind="grdDetail" >
			        <input bind="txtSTItemPK" /> 
			        <input bind="lstSpecGrp" />	
			        <input bind="txtSpec" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Spec Group
            </td>
            <td style="width: 85%">
                <gw:list id="lstSpecGrp" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 9%">
            </td>
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="4">
				<gw:grid id='grdDetail' header='No|_Spec Grp|_tco_spec_pk|Spec ID|Spec Name|Description'
                    format='0|0|0|0|0|0' aligns='1|0|0|0|0|0' editcol='0|0|0|0|0|0' widths='600|2000|0|2000|4000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)"  />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="4">
                <table>
                    <tr>
                        <td style="width: 96%" align="center">
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                           <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="Y" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="4">
				<gw:grid id='idGrid2' header='No|_Spec Grp|_tco_spec_pk|Spec ID|Spec Name|Description'
                    format='0|0|0|0|0|0' aligns='1|0|0|0|0|0' editcol='0|0|0|0|0|0' widths='600|2000|0|2000|4000|1000'
                    sorting='T' styles='width:100%; height:100%'   />
					
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtSTItemPK" text="" styles="display:none" />
<gw:textbox id="txtSpec" text="" styles="display:none" />
<!---------------------------------------------------------------------->
</html>
