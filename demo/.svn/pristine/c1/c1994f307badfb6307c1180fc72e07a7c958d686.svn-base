<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POPUP TASK ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    var _selectItem = '';
    
    var G_PK                    = 0,
        G_MA_TASK_ID            = 1,
        G_MA_TASK_NAME          = 2,
        G_MA_TASK_TYPE          = 3,
        G_DESCRIPTION           = 4
        G_NEW_SELECT            = 5;
 
//=================================================================================

function BodyInit()
{
    System.Translate(document);
    _selectItem = "<%=request.QueryString("tmpVal")%>";
	
    BindingDataList();
    
    //----------------------------
    OnSearch(grdTaskList);
	
    grdTaskList2.SetEnable(false);
    
}
//=================================================================================
function BindingDataList()
{      
    var data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1120') FROM DUAL")%>|ALL|SELECT ALL";  //payment term
    lstTaskType.SetDataText(data);
    lstTaskType.value = 'ALL' ;      

    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdTaskList.SetComboFormat(G_MA_TASK_TYPE,data);
    grdTaskList2.SetComboFormat(G_MA_TASK_TYPE,data);
}
//=================================================================================

function OnGridCellDblClick(objGrid)
{
  if(objGrid.id == "grdTaskList" && event.row > 0 )
  {
    var col_val = objGrid.GetGridData(event.row, G_PK );
    
    if(event.row > 0 && ( !CheckDataExist(grdTaskList2,col_val)) )
    {
        SetRowBackGroundColor(objGrid,col_val,0x0000FF);
		grdTaskList2.AddRow();
		for(var i=0;i<objGrid.cols;i++)
		{		 
		  grdTaskList2.SetGridText(grdTaskList2.rows-1,i,objGrid.GetGridData(event.row,i));
		}// A6FFDA
		grdTaskList2.SetGridText(grdTaskList2.rows-1,G_NEW_SELECT,1);
		grdTaskList2.SetCellBgColor(grdTaskList2.rows-1,0, grdTaskList2.rows-1, grdTaskList2.cols-1,0xDAFFA6);
     }
  }
  countItem()
}   

//======================================================================
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//================================================================================================
function CheckDataExist(p_oGrid,p_value)
{
    if(p_value=='')
    {
        alert('');
        return false;
    }
    for(var i=1;i<p_oGrid.rows;i++)
    {
      if(p_oGrid.GetGridData(i, G_PK) == p_value)
      {
         return true;
      }
    }
    return false;
}
//================================================================================================

function countItem()
{
    lblCount.text=grdTaskList2.rows-1 + " item(s)."
}
                   
//=================================================================================
function OnSave()
{  
	data_fpma00011.Call();
}
//=================================================================================
function OnAddNew(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdTaskList':
            objGrid.AddRow();
        break;
        default:
        break;
     }
}
//=================================================================================
function OnDataReceive(obj)
{
   switch(obj.id)
    {
        case 'data_fpma00011':
            lblRecordTask.text = grdTaskList.rows -1 + " record(s).";
            var gctrl = grdTaskList;
            if(gctrl.rows >0)
            { 
               grdTaskList2.ClearData();
               if(_selectItem == '') return;
                var arr= new Array();
                arr = _selectItem.split("|");
                if(arr.length > 0)
                {
                    for(var j = 0; j < arr.length; j++)
                    {
                        for(var i = 1; i < gctrl.rows; i++)
                        {
                            if(gctrl.GetGridData(i, G_PK) == arr[j])
                            {
                                var col_val = gctrl.GetGridData(i, G_PK );
                                SetRowBackGroundColor(gctrl,col_val,0x0000FF);
		                        grdTaskList2.AddRow();
		                        for(var h=0;h<gctrl.cols;h++)
		                        {                    		 
		                          grdTaskList2.SetGridText(grdTaskList2.rows-1,h,gctrl.GetGridData(i,h));
		                        }
                            }
                        }
                    }
                }
                countItem();
            }
        break;
        default:
        break;
     }
}
//=================================================================================
function OnDelete(index) 
{
      var ctrl = grdTaskList.GetGridControl();

      var row  = ctrl.row;
    	        	        
      if ( grdTaskList.GetGridData( ctrl.row, G_PK ) == "" ) 
      {						  		
	        grdTaskList.RemoveRow();					
      }			
      else 
      {
	        grdTaskList.DeleteRow();
      }	
}
//=================================================================================
function OnUnDelete(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdTaskList':
            objGrid.UnDeleteRow();
        break;
        default:
        break;
    }
}  

//=================================================================================

function OnSearch(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdTaskList':
            data_fpma00011.Call('SELECT');
        break;
        default:
        break;
    }
    
}
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'TaskType':        
            var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC1120";
	        var obj = System.OpenModal( path ,800 ,600 ,'scroll:no;resizable:yes;status:yes');
			
	         
        break;
        default:
        break;
   }
}
//======================================================================
function OnRemove()
{    
  if(grdTaskList2.row > 0)
  {
    var col_val = grdTaskList2.GetGridData( grdTaskList2.row, G_PK);
    
    grdTaskList2.RemoveRowAt(grdTaskList2.row);
    
    SetRowBackGroundColor(grdTaskList,col_val,0x000000); 
    
    countItem()
  }
}
//======================================================================
function OnSelect(oGrid)
{ 	
    switch(oGrid.id)
    {
        case 'grdTaskList2':
           var arr_data = new Array();           
           if(oGrid.rows > 1)
           {   
              for(var i=1;i<oGrid.rows;i++)
              {
                if(oGrid.GetGridData(i,G_NEW_SELECT) == '1')//Neu dong do da chon roi thi khong cho cho nua
                {
                     var arrTemp=new Array();
                     
                     for(var j=0;j<oGrid.cols;j++)
                     {
                        arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
                     }
                     
                     arr_data[arr_data.length]= arrTemp;
                 }
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
       break;
       default:
       break;
   }	  
	    
}

</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  function="<%=l_user%>lg_sel_fpma00011" parameter="0,1,2,3,4" procedure="<%=l_user%>lg_upd_fpma00011"  > 
                <input bind="grdTaskList" >
                    <input bind="lstTaskType" />
                    <input bind="txtTask" />
                </input>
                <output  bind="grdTaskList" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table name="Maintain Task" style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 15%; white-space: nowrap" align="right">
                
                <a title="Task Type" onclick="OnPopUp('TaskType')" href="#tips" style="color: #0000ff"><b>Task Type</b></a>
            </td>
            <td style="width: 20%">
                <gw:list id="lstTaskType" styles='width:100%' onchange="OnSearch(grdTaskList)" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                Task
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtTask" csstype="mandatory" text="" styles='width:100%' onenterkey="OnSearch(grdTaskList)" />
            </td>
            <td style="width: 25%" align="center">
                <gw:label img="new" id="lblRecordTask" style="font-weight: bold; color: red; font-size: 12"
                    text="0 record(s)." />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch(grdTaskList)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnNew" img="new" onclick="OnAddNew(grdTaskList)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnDelete" img="delete" onclick="OnDelete(grdTaskList)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnUnDelete" img="udelete" onclick="OnUnDelete(grdTaskList)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSave" img="save" onclick="OnSave(grdTaskList)" />
            </td>
        </tr>
        <tr style="height: 69%">
            <td colspan="10">
                <gw:grid id='grdTaskList' header='_PK|Task ID|Task Name|Task Type|Description' format='0|0|0|2|0'
                    aligns='0|0|0|0|0' defaults='||||' editcol='1|1|1|1|1' widths='1000|1000|3000|1000|3000|10'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDblClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%" align="center" colspan="8">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdTaskList2)" />
            </td>
        </tr>
        <tr style="height: 29%">
            <td colspan="10">
                <gw:grid id='grdTaskList2' header='_PK|Task ID|Task Name|Task Type|Description|_NewSelect' format='0|0|0|2|0'|0
                    aligns='0|0|0|0|0|0' defaults='|||||0' editcol='0|0|0|0|0|0' widths='1000|1000|3000|1000|3000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
</html>
