<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Facilities</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var acc_pk = 1;
function BodyInit()
{
        System.Translate(document);
        dso_search.Call("SELECT"); 
} 
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "Grid_Facilities_left" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, acc_pk );
            if(event.row > 0 && ( !CheckDataExist(Grid_Facilities_right,col_val)))
            {
                SetRowBackGroundColor(oGrid, col_val, 0x0000FF);
		        Grid_Facilities_right.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          Grid_Facilities_right.SetGridText(Grid_Facilities_right.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
		        
            }
      }
      countItem();
}   
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=Grid_Facilities_right.rows-1 + " record(s)."
}    
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, acc_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function GetAll()
{
        var col_val ;
            for (i = 1; i< Grid_Facilities_left.rows; i++)
            {
            //  Grid_Facilities_left.SetGridText(i,0, "-1");
                col_val = Grid_Facilities_left.GetGridData(i,acc_pk);
                
                if( !CheckDataExist(Grid_Facilities_right,col_val))
                {
                    
                            SetRowBackGroundColor(Grid_Facilities_left,col_val,0x0000FF);
		                    Grid_Facilities_right.AddRow();
		                    for(var j=0;j<Grid_Facilities_left.cols;j++)
		                    {
		                      Grid_Facilities_right.SetGridText(Grid_Facilities_right.rows-1,j,Grid_Facilities_left.GetGridData(i,j));
		                    }
		        } 
            }
           countItem(); 
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function UnGetAll()
{
            OnRemoveAll();
            countItem();
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnRemoveAll()
{
   var col_val;
    for(var i=1;i<Grid_Facilities_right.rows;i++)
    {
        col_val = Grid_Facilities_right.GetGridData(i,1);
        SetRowBackGroundColor(Grid_Facilities_left,col_val,0x000000); 
    }
    Grid_Facilities_right.SetData("");
    countItem();
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(Grid_Facilities_right.row > 0)
  {
    var col_val = Grid_Facilities_right.GetGridData( Grid_Facilities_right.row, acc_pk);
    
    Grid_Facilities_right.RemoveRowAt(Grid_Facilities_right.row);
    
    SetRowBackGroundColor(Grid_Facilities_left,col_val,0x000000); 
    
    countItem()
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
   
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, acc_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
</script>
<body>
<gw:data id="dso_search" >
        <xml>
            <dso type="grid" function="pm_sel_61020010_Facilities" >
                <input bind="Grid_Facilities_left">
                        <input bind="txtTemp"/>
                </input>
                <output bind="Grid_Facilities_left"/>
            </dso>
        </xml>
    </gw:data>
    
    <table style="width:100%;height:100%;background-color:White" cellpadding="0" cellspacing="0">
                <tr style="height:1%">
                            <td width="100%" colspan="3">
                                        <table cellpadding="0" cellspacing="0" width="100%" >
                                                <tr>
                                                             <td width="100%" align="center"><gw:label id="lblCount" styles='width:100%;color:red;font-weight:600' /></td>
                                                            <td><gw:imgbtn id="btSv" img="select" alt="Select"  onclick="OnSelect(Grid_Facilities_right)" /></td> 
                                                </tr>
                                        </table>
                            </td>
                            
                </tr>
                <tr style="height:99%">
                            <td width="50%">
                                        <gw:grid   
                                        id="Grid_Facilities_left"  
                                        header="Facilities Code|Facilities Name|_pk"   
                                        format  ="0|0|0"  
                                        aligns  ="0|0|0"  
                                        defaults="||"  
                                        editcol ="0|0|0"  
                                        widths  ="2500|3000|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"   
                                        oncelldblclick= "OnGridCellDoubleClick(this)" /> 
                            </td>
                            <td style="width: 1%; white-space: nowrap;background-color:#BDE9FF" align="center">
                                      <table >
                                                <tr>
                                                            <td><gw:imgbtn id="btnFirt" img="first" alt="UnGet All Records" styles="cursor: hand; position:center" onclick="UnGetAll()" /></td>
                                                </tr>
                                                <tr>
                                                            <td><gw:imgbtn id="btnFirst" img="last" alt="Get All Records" styles="cursor: hand; position:center" onclick="GetAll()" /></td>
                                                </tr> 
                                      </table>
                            </td>

                            <td width="49%" >
                                        <gw:grid   
                                        id="Grid_Facilities_right"  
                                        header="Facilities Code|Facilities Name|_pk"   
                                        format  ="0|0|0"  
                                        aligns  ="0|0|0"  
                                        defaults="||"  
                                        editcol ="0|0|0"  
                                        widths  ="2500|3000|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"   
                                        oncelldblclick="OnRemove()" 
                                         /> 
                            </td>
                </tr>
    </table>
    <gw:textbox id="txtTemp" styles='width:100%;display:none' />
</body>
</html>
