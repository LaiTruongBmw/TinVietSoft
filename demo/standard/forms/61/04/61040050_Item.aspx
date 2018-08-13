<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Item</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

var G_TECPS_UNDERTAKELEVELCODE_PK   = 0
    G_LEVEL_CD                      = 1
    G_LEVEL_NM                      = 2
    G_TCO_ITEM_PK                   = 3
    G_ITEM_CODE                     = 4
    G_ITEM_NAME                     = 5
    G_UOM                           = 6;

var vPage = 0 ;
var vStatus;

function BodyInit()
{
    var data = ""; 
           
    //setPage(vPage)
	txtProject_Pk.text  = "<%=Request.querystring("p_project_pk")%>" ;
	txtProject_Cd.text  = "<%=Request.querystring("p_project_cd")%>" ;
	txtProject_Nm.text  = "<%=Request.querystring("p_project_nm")%>" ;
    txtLevelPK.text     = "<%=Request.querystring("p_level_pk")%>" ;
    vStatus             = "<%=Request.querystring("p_status")%>" ;
    
    OnSearch(2);
}

//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
         dsoGetItem_1.Call();
	    break;
        case 2:
          dsoGetItem.Call("SELECT");
	    break;
    }
   
}
//-----------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData(idGrid2.row, 3);
    idGrid2.RemoveRowAt(idGrid2.row);
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    countItem()
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i, 3) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i, 3) == p_value)
      {
         return true;
      }
   }
   return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
    if (vStatus == 'ADD')
    {
        row_event = event.row ;
        col_event = event.col ;

        if(oGrid.id == "idGrid" && row_event > 0 )
        {
            var col_val = oGrid.GetGridData(row_event, 3);

            if(row_event > 0 && ( !CheckDataExist( idGrid2, col_val)) )
            {
                SetRowBackGroundColor( oGrid, col_val,0x0000FF);
                idGrid2.AddRow();
                
                for(var i=0;i<oGrid.cols;i++)
                {
                    idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(row_event,i));
                }
            }
        }
        countItem();
    }
    else 
    {
        if (idGrid2.rows > 1) return;
        
        row_event = event.row ;
        col_event = event.col ;

        if(oGrid.id == "idGrid" && row_event > 0 )
        {
            var col_val = oGrid.GetGridData(row_event, 3);

            if(row_event > 0 && ( !CheckDataExist( idGrid2, col_val)) )
            {
                SetRowBackGroundColor( oGrid, col_val,0x0000FF);
                idGrid2.AddRow();
                
                for(var i=0;i<oGrid.cols;i++)
                {
                    idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(row_event,i));
                }
            }
        }
        countItem();
    }
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}

function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'dsoGetItem_1':
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;
        case 'dsoGetItem':
            if (idGrid.rows > 1)
            {
                lblRecord2.text = idGrid.rows - 1 + ' record(s)';
                txtLevel_Cd.text = idGrid.GetGridData(1, G_LEVEL_CD);
                txtLevel_Nm.text = idGrid.GetGridData(1, G_LEVEL_NM);
            }
        break;
    }
}
//--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    page1.style.cursor = 'none' ;
                    page1.style.color = 'red';
                    page2.style.cursor = 'hand' ;
                    page2.style.color = 'blue';
                    page3.style.cursor = 'hand' ;
                    page3.style.color = 'blue';
                    currentPage =1
                }
            break;
            case 'page2':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'none' ;
                page2.style.color = 'red';
                page3.style.cursor = 'hand' ;
                page3.style.color = 'blue';
                currentPage =2
            break;
            case 'page3':
                page1.style.cursor = 'hand' ;
                page1.style.color = 'blue';
                page2.style.cursor = 'hand' ;
                page2.style.color = 'blue';
                page3.style.cursor = 'none' ;
                page3.style.color = 'red';
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        OnSearch(2)
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
       pagePrev.style.cursor = 'none' ;
       pagePrev.style.color = 'gray';
       
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'gray';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 page1.style.cursor ='none';
                 page1.style.color = 'red';
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 pageNext.style.cursor ='none';
                 pageNext.style.color = 'gray';
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';
            
        }
}
////////////////////////////////////////////////////////////////////////////////
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                pageNext.style.cursor ='hand';
                pageNext.style.color = 'blue';

            }
             if (page1.innerText == 1)
            {
                pagePrev.style.cursor = 'none' ;
                pagePrev.style.color = 'gray';

            }
        }
     
}
//////////////////////////////////////////////////////////////////////////////////////
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                pageNext.style.cursor ='none';
                pageNext.style.color = 'gray';

            }
             if (page1.innerText != '1')
            {
                pagePrev.style.cursor ='hand';
                pagePrev.style.color = 'blue';

            }
        }
    
}
///////////////////////////////////////////////////////////////////////////////////////
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        obj.style.cursor ='hand';
        obj.style.color = 'blue';
    }
}
////////////////////////////////////////////////////////////////////////////////////////
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Project':
		    var path = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProject_Pk.text = object[0];
                txtProject_Cd.text = object[1];
                txtProject_Nm.text = object[2]; 
			 }
	    break;
	    
    }
    
}
</script>

<body>
    
    <!-------------------------------------------------------->
    <gw:data id="dsoGetItem" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="pm_sel_61040050_item_popup" > 
                  <input bind="idGrid" > 
                     <input bind="txtProject_Pk" />
                     <input bind="txtLevelPK" />
				     <input bind="txtItem" />
                 	<input bind="txtPage" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 5%">
			  <td align="right" width="5%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
		      <td width="25%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
				<td width="45%" colspan="4"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
				<td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
		</tr>
        <tr style="height: 5%">
			  <td align="right" width="5%">Level</td>
		      <td width="25%"><gw:textbox id="txtLevel_Cd" readonly="true" styles='width:100%' /></td>
				<td width="45%" colspan="4"><gw:textbox id="txtLevel_Nm" readonly="true" styles='width:100%' /></td>
				<td></td>
		</tr>
        <tr style="height: 5%">
            <td style="width: 5%" align="right">Item</td>
            <td style="width: 20%"><gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(2)" /></td>
            <td style="width: 5%" align="right"></td>
            <td style="width: 20%"></td>
            <td style="width: 23%" align="right">
                <table width="100%" style="height: 100%">
                    <tr align="right">
                        <td style="width: 5%;" align="right">
                        </td>
                        <td style="width: 80%;" align="left">
                            <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 3%;display:none" align="right">
                            <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                        </td>
                        <td width="3%" align="center" style="color: gray; cursor: none;display:none">
                            <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                            </u></b>
                        </td>
                        <td width="3%" align="center" style="display:none">
                            <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                            </b>
                        </td>
                        <td width="3%" align="center" style="display:none">
                            <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                            </b>
                        </td>
                        <td style="width: 3%;display:none" align="left">
                            <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(2)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr style="height: 45%">
            <td colspan="7">
                <gw:grid id="idGrid"
				    header="_levelcode_PK|_Levelcode|_Level Name|_tecps_item_pk|Item Code|Item Name|UOM"
                    format='0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0' 
                    defaults='||||||' 
					editcol='0|0|0|0|0|0|0' 
                    widths='0|1500|3500|0|1500|5000|500' 
					styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 5%">
            <td colspan="2" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="5" align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
        </tr>
        <tr style="height: 45%">
            <td colspan="7">
                <gw:grid id="idGrid2"  header="_levelcode_PK|_Levelcode|_Level Name|_tecps_item_pk|Item Code|Item Name|UOM"
                    format='0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0' 
                    defaults='||||||' 
					editcol='0|0|0|0|0|0|0' 
                    widths='0|1500|3500|0|1500|5000|500' 
					styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------->
    <gw:textbox id="txtPage" styles="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <gw:textbox id="txtLevelPK" styles="display: none" />
    <!-------------------------------------------------------->
</body>
</html>
