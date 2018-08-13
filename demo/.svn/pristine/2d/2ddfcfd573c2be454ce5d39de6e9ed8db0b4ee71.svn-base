<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Work PopUp</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var acc_pk = 1;
function BodyInit()
{
	System.Translate(document);
	var Prj = "<%=Request.querystring("Project_Pk")%>";
	txtProject_Pk.SetDataText(Prj);
	BindingDataList();
	//OnSearch();
}
//-------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
        var ls_Level = "<%=ESysLib.SetListDataFUNC("SELECT pm_A_GET_COMMONCODE('EACAB052') FROM DUAL")%>|ALL|All Level"; 
            lstLevel.SetDataText(ls_Level); 
            lstLevel.value = "ALL"; 
} 
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
    dso_Search.Call("SELECT");
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{  
    switch(obj.id)
    {
        case "dso_Search":
            var i;
            var ctl = Grid_Search.GetGridControl();
            ctl.OutlineBar = 5;
            var j;
            for(i=1;i<Grid_Search.rows;i++)
            {   
                j = Find_Heigher_Level(Grid_Search.GetGridData(i,3),i);
               ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;   
            }
        break;
    }
    
}  
//-------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( Grid_Search.GetGridData(row,3) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( Grid_Search.GetGridData(i,3) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
} 
function OnGridCellDoubleClick(oGrid)
{
		if(Grid_Search.GetGridData( Grid_Search.row , 4 ) == '0')
		{
            alert("Cannot select parent value!Please choose another value!");return false;
        }
      if(oGrid.id == "Grid_Search" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, acc_pk );
            if(event.row > 0 && ( !CheckDataExist(Grid_Bottom,col_val)))
            {
                SetRowBackGroundColor(oGrid, col_val, 0x0000FF);
		        Grid_Bottom.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          			Grid_Bottom.SetGridText(Grid_Bottom.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
		        
            }
      }
      countItem();
}   
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
function countItem()
{
    lblCount.text=Grid_Bottom.rows-1 + " record(s)."
}    
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
function UnGetAll()
{
            OnRemoveAll();
            countItem();
}
function OnRemoveAll()
{
   var col_val;
    for(var i=1;i<Grid_Bottom.rows;i++)
    {
        col_val = Grid_Bottom.GetGridData(i,1);
        SetRowBackGroundColor(Grid_Search,col_val,0x000000); 
    }
    Grid_Bottom.SetData("");
    countItem();
}
function OnRemove()
{
  if(Grid_Bottom.row > 0)
  {
    var col_val = Grid_Bottom.GetGridData( Grid_Bottom.row, acc_pk);
    
    Grid_Bottom.RemoveRowAt(Grid_Bottom.row);
    
    SetRowBackGroundColor(Grid_Search,col_val,0x000000); 
    
    countItem()
  }
}
</script>
<body>
<gw:data id="dso_Search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="pm_sel_61040040_popup" >
                <input bind="Grid_Search">
                    <input bind="txtLevel"/>
                    <input bind="txtProject_Pk"/> 
                </input> 
                <output bind="Grid_Search"/>
            </dso>
        </xml>
    </gw:data>  
            <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                            <tr style="height:2%">
                                     <td width="100%">
                                      		<fieldset style="padding:0">
                                            			<table cellpadding="0" cellspacing="0" width="100%">
                                                        		<tr>
                                                        		            <td align="right" width="5%">Level&nbsp;</td>
                                                                            <td width="55%"><gw:textbox id="txtLevel" onenterkey="OnSearch()" styles="width:100%;" /></td>
                                                                            <td width="40%"></td>
                                                        		</tr>
                                                        </table>
                                                </fieldset>
                                        </td>
                            </tr>
                           <tr style="height: 48%;width:100%">
                                      <td  valign="top" width="100%">
                                            <gw:grid   
                                            id="Grid_Search"  
                                            header="Level Code|Work Name|_pk|_Level|_LEAF"   
                                            format  ="0|0|0|0|0"  
                                             aligns ="0|0|0|0|0"  
                                            defaults="||||"  
                                            editcol ="0|0|0|0|0"  
                                            widths  ="3000|3000|0|0|0"  
                                            styles="width:100%; height:100%"   
                                            sorting="T" 
                                            oncelldblclick= "OnGridCellDoubleClick(this)" /> 
                                             /> 
                                      </td>
                         </tr>
                         <tr style="height:2%">
                         			  <td>
                                      		<fieldset style="padding:0">
                                            			<table cellpadding="0" cellspacing="0">
                                                        		<tr>
                                                                    <td style="width: 98%" align="center">
                                                                        <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                                                                    </td>
                                                                    <td style="width: 1%">
                                                                        <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="UnGetAll()" />
                                                                    </td>
                                                                    <td style="width: 1%">
                                                                        <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(Grid_Bottom)" />
                                                                    </td>
                                                                </tr>
                                                        </table>
                                            </fieldset>
                                      </td>
                         </tr>
                         <tr style="height: 48%;width:100%">
                                      <td  valign="top" width="100%">
                                            <gw:grid   
                                            id="Grid_Bottom"  
                                            header="Level Code|Work Name|_pk|_Level|_LEAF"   
                                            format  ="0|0|0|0|0"  
                                             aligns ="0|0|0|0|0"  
                                            defaults="||||"  
                                            editcol ="0|0|0|0|0"  
                                            widths  ="3000|3000|0|0|0"  
                                            styles="width:100%; height:100%"   
                                            sorting="T" 
                                            oncelldblclick="OnRemove()"
                                             /> 
                                      </td>
                         </tr>
            </table>
 <gw:textbox id="txtWorkName" styles='width:100%;display:none' />
    <gw:textbox id="lstLevel" styles='width:100%;display:none' />   
    <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />                     
</body>
</html>
