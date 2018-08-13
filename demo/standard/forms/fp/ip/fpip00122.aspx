<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Group</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 


var G_PK_Group         = 0,
    G_PK_St            = 1,
    G_PK_Item          = 2,
    G_ITEM_CODE        = 3, 
    G_ITEM_NAME        = 4, 
    G_FNAME_01         = 5, 
	G_FNAME_02         = 6, 	
    G_UOM              = 7,
    G_CRT_BY           = 8, 
    G_MOD_BY           = 9; 
 
var G1_LineGroup_PK = 0,
    G1_Factory      = 1,
    G1_Seq          = 2,
    G1_Group_ID     = 3,
    G1_Group_Name   = 4,
	G1_PROCESS_PK	= 5,
    G1_Work_Group   = 6,
    G1_REMARK       = 7;    

         
var t_open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    
    //OnToggle(); 
}
//====================================================================================
function BindingDataList()
{
    var  data ;           
        
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>|ALL|Select ALL";
    lstFactory.SetDataText( data);
    lstFactory.value = 'ALL' ; 
}
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top"); 
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        t_open = false;
        top.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up.gif";
    }
    else
    {
        t_open = true;
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
 }

 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdLineGroup':
            data_fpip00122.Call("SELECT");
        break;
        
        case '2':
           data_fpip00122_1.Call("SELECT");   
        break;
                    
    }        
 }

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
         
    }    
}

//==================================================================================

function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1 && grdLineGroup.rows >1)
   {   
      for(var t = 1; t <grdLineGroup.rows;t++)
      {
          if(grdLineGroup.GetGridData(t,2) == -1)
          {
              for(var i=1;i<oGrid.rows;i++)
              {
                 var arrTemp=new Array();
                 arrTemp[arrTemp.length]= grdLineGroup.GetGridData(t,0);
                 arrTemp[arrTemp.length]= grdLineGroup.GetGridData(t,5);
                for(var j=0;j<oGrid.cols;j++)
                 {
                    arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
                 }
                 
                 arr_data[arr_data.length]= arrTemp;
              }
          }
      }
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("Please select data!");
	  }
   }else
      {
        alert("Please select item and group line!");
      }
    
	  
}

//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItem2.row > 0)
  {
    var col_val = grdItem2.GetGridData( grdItem2.row, G_ITEM_CODE);
    
    grdItem2.RemoveRowAt(grdItem2.row);
    
    SetRowBackGroundColor(grdItem,col_val,0x000000); 
    
    countItem()
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_ITEM_CODE) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_ITEM_CODE) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdItem" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_ITEM_CODE );
            
            if(event.row > 0 && ( !CheckDataExist(grdItem2,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        grdItem2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          grdItem2.SetGridText(grdItem2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=grdItem2.rows-1 + " item(s)."
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_ITEM_CODE);		
		
        if ( row > 0 && ( !CheckDataExist( grdItem2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        grdItem2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            grdItem2.SetGridText( grdItem2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}
 //=================================================================

</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpip00122" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00122" > 
                <input bind="grdLineGroup" >
                    <input bind="lstFactory" /> 
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpip00122_1" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fpip00122_1"> 
                <input bind="grdItem" >
                     <input bind="radSearchPage" />
                     <input bind="txtItem" /> 
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Factory
                        </td>
                        <td style="width: 80%">
                            <gw:list id="lstFactory" styles="width:100%" onchange="OnSearch('grdLineGroup')" />
                        </td>
                        <td style="width: 4%">
                        </td>
                       
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdLineGroup')" />
                        </td>
                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdLineGroup' header='_PK|_Factory|Select|_Seq|Line Group ID|Line Group Name|Process|Work Group|Remark'
                                format='1|0|3|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0' 
								defaults='||||||||' 
								editcol='0|1|1|1|1|1|1|1|'
                                widths='1000|1500|600|800|1500|2000|2000|2000|1000' sorting='T' styles='width:100%; height:100%'
                                 />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%">
               <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td style="width: 5%; white-space: nowrap">
                            Item</td>
                        <td style="width: 55%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('2')"  />
                        </td>
                        <td style="width: 18%; white-space: nowrap">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnSearch('2')"> 
                                <span value="1">Item</span> 
                                <span value="2">ST Item</span> 
                                 <span value="3">Group</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('2')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Export to Excel" text="Export to Excel"
                                onclick="onExcel()" />
                        </td>
                        
                    </tr>
					
                     <tr style="height: 45%">
                        <td colspan="5">
                            	
								<gw:grid id='grdItem'
                                header='_PK_Group|_pk_ST|_pk_ITEM|Item Code|Item Name|F Name 01|F Name 02|UOM|Crt By|Mod By'
                                format='0|0|0|0|0|0|0|1|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|0|1500|3000|2000|2000|800|1000|1000'
                                sorting='T'
                               styles="width:100%; height:100%" oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                      <tr style="height: 1%">
                        <td colspan="5">
                        <table>
                            <tr>
                                <td style="width: 96%" align="center">
                                    <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                                </td>
                                <td style="width: 1%;white-space: nowrap">
                                    <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                                    Duplicate
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdItem)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdItem2)" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    
                     <tr style="height: 45%">
                        <td colspan="5">
                           <gw:grid id='grdItem2'
                                header='_PK_Group|_pk_ST|_pk_ITEM|Item Code|Item Name|F Name 01|F Name 02|UOM|Crt By|Mod By'
                                format='0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|1|0|0'
                                check='|||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|0|1500|3000|2000|2000|800|1000|1000'
                                sorting='T'
                               styles="width:100%; height:100%" 
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
