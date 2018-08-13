<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Select Item</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

var iCols_tco_item_pk       = 0 ;
var iColsPrice              = 7;
var vPage = 0 ;
var p_wh_pk = '';
var p_tr_date = '';
//------------------------------------------------------------------------------------------------
function BodyInit()
{
    txtPLID.SetEnable(false);
	txtPLName.SetEnable(false);	
	
	p_wh_pk = "<%=Request.querystring("tin_wh_pk")%>";
	p_tr_date = "<%=Request.querystring("tr_date")%>";
	p_company = "<%=Request.querystring("company")%>";
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name as wh_name FROM tlg_in_warehouse WHERE del_if = 0 AND use_yn = 'Y' ORDER BY wh_name ASC" )%>||ALL";;  
    lstWH.SetDataText(data);     
    lstWH.value = p_wh_pk; 
    dtFrom.value = p_tr_date;
    dtTo.value = p_tr_date;   
	OnFormatGrid();
	//setPage(vPage)
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(4)           = "###,###,###,###,###.##R"; // Quantity   
}

//------------------------------------------------------------------------------------------------
function TabPopUp(fnameFile)
{
  	var fpath = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code=&comm_nm=&company=" + p_company + "&dsqlid=AC_SEL_PL_POPUP&col_code=" +" CODE" + "&col_nm=" + " NAME";	
	var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	

	if ( aValue != null )  
	{
	    txtPLName.text = aValue[1];
		txtPLID.text = aValue[0];					
		txtPLPK.text = aValue[2];
	}
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    dsoMasterSlip.Call("SELECT");
}
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
    if(idGrid.GetGridData(idGrid.row, 0) == '-1')
    {
        var arr_data = new Array();
        var i, j;
        for( i = 1; i < idGrid2.rows ; i++)
        {
            var arrTemp = new Array();
            for(j = 0; j < idGrid2.cols; j++)
            {
                arrTemp[j] = idGrid2.GetGridData(i, j);            
            }
            arr_data[arr_data.length] = arrTemp ;
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
       /*
       if(oGrid.rows > 1)
       {   
          for(var i = 1;i < oGrid.rows; i++)
          {
             var arrTemp = new Array();
             
             for(var j = 1; j<oGrid.cols; j++)
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
       }*/	  	          
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, iCols_tco_item_pk);
    
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
      if(p_oGrid.GetGridData( i, iCols_tco_item_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid, p_value)
{
  for(var i = 1; i < p_oGrid.rows; i++)
   {
      if(p_oGrid.GetGridData(i, iCols_tco_item_pk) == p_value)
      {
         return true;
      }
   }
   return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, iCols_tco_item_pk );    
    if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
    {
        SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		idGrid2.AddRow();
		for(var i=0;i<oGrid.cols;i++)
		{
		  idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		}
     }
  }
  //countItem();
}
//------------------------------------------------------------------------------------------------
/*function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
*/
//--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
/*
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
*/
//---------------------------------------------------------------------------------------------------
/*
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
*/
/*function PrevPage()
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
     
}*/
/*function NextPage()
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
    
}*/
//----------------------------------------------------------------------
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
//----------------------------------------------------------------------
function OnReceiveData(iObj)
{
	switch(iObj.id)
	{
		case "dsoMasterSlip":
		    
		break ;
	}
}
//----------------------------------------------------------------------
function OnCopy()
{
	var i, j;
	for(i = 1; i < idGrid.rows; i++)
	{
		if(idGrid.GetGridData(i, 0)=="-1")
		{
			idGrid2.AddRow();
			for(j = 1; j < idGrid.cols ; j++)
			{
				idGrid2.SetGridText(idGrid2.rows - 1, j, idGrid.GetGridData(i, j));
			}
		}
	}	
	j = 1;	
	i = j;
	while(i >= j && i < idGrid.rows)
	{
		if(idGrid.GetGridData(i, 0)=='-1')
		{
			idGrid.RemoveRowAt(i);
			j = i;
		}
		else
		{
			i++;
		}
	}			
}
//----------------------------------------------------------------------
function OnShowDetails()
{
    var v_row = 0;
    var v_mst_pk = 0;
    
    v_row = idGrid.row
    v_mst_pk = idGrid.GetGridData(v_row, 5); // master pk
    if(v_row > 0)
    {
        v_mst_pk = idGrid.GetGridData(v_row, 5); // master pk
        txtMstPK.SetDataText(v_mst_pk);
        dsoDetailSlip.Call("SELECT");
    }
    else
    {
        idGrid2.ClearData();
    }
}

//----------------------------------------------------------------------
function OnCheckAll()
{
    var i;
    if(chkAll.value == 'T')
    {
        for( i = 1; i < idGrid.rows; i++)
        {
            idGrid.SetGridText(i, 0, '-1')
        }
    }
    else
    {
        for( i = 1; i < idGrid.rows; i++)
        {
            idGrid.SetGridText(i, 0, '0')
        }    
    }        
}
//----------------------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="dsoMasterSlip" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="ac_SEL_60170060_5" > 
                  <input bind="idGrid" >    
                    <input bind="txtCompk" />               
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtPLPK" />
					<input bind="txtSlipNo" />
					<input bind="txtItem" />
					<input bind="lstWH" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dsoDetailSlip" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="ac_SEL_60170060_6" > 
                  <input bind="idGrid2" >    
                    <input bind="txtMstPK" />               
                  </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>

    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 5%">
			<td colspan="7" >
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="5%" align="right">From date</td>
						<td width="15%" align="left"><gw:datebox id="dtFrom" lang="1" styles="width:100%;"/></td>
						<td width="2%" align="left">~</td>
						<td width="15%" align="left"><gw:datebox id="dtTo" lang="1" styles="width:100%;"/></td>
						<td width="5%" align="right">
							<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
						</td>
						<td width="5%" align="right">
							<gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
						</td>		
						<td width="10%" align="right">Check All</td>				
						<td width="5%" align="left"><gw:checkbox id="chkAll" onclick="OnCheckAll()" /></td>				
						<td width="3%" align="right">WH</td>				
						<td width="25%" align="left"><gw:list id="lstWH" /></td>
					</tr>
				</table>
			</td>
        </tr>	
        <tr style="height: 5%">
            <td width="5%" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="TabPopUp()">PL</b>
            </td>
            <td width="10%">
                <gw:textbox id="txtPLID" styles="width:100%" />
            </td>
            <td width="20%">
                <gw:textbox id="txtPLName" styles="width:100%" />
            </td>
            <td width="5%" align="right">
                <b>Slip No</b>
            </td>
            <td width="20%">
                <gw:textbox id="txtSlipNo" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td width="5%" align="right">
                <b>Item</b>
            </td>
            <td width="25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 40%">
            <td colspan="13">
                <gw:grid id="idGrid" 
					header="Select|Slip No|Takein Date|WH Name|PO No|_mst_pk"
                    format="3|0|4|0|0|0" 
					aligns="1|1|1|2|1|0"
                    defaults="|||||" 
					editcol="1|0|0|0|0|0"
                    widths="800|1800|1400|1600|1500|0" 
					styles="width:100%; height:100%"
					
                    sorting="T" 
                    oncellclick="OnShowDetails()"
                    />
            </td>
        </tr>
        <tr style="height: 5%">
            <td colspan="2" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="11" align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
        </tr>
        <tr style="height: 40%">
            <td colspan="13">
                <gw:grid id="idGrid2" 
					header="Slip No|Item Code|Item Name|UOM|Q'ty|WH Name|Takein Date|PO No|Partner Code|Partner Name|_WH_PK|_TCO_ITEM_PK|_Acc_PK|Acct. Code|Acct. Name|_TIN_STOCKTR_PK"
                    format="0|0|0|0|0|0|4|0|0|0|0|0|0|0" 
					aligns="1|1|2|1|3|2|4|1|0|0|0|0|0|0"
                    defaults="|||||||||||||" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="1700|1500|2000|800|1500|1500|1500|1500|0|0|0|1400|1800|0" 
					styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtPLPK" style="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <gw:textbox id="txtCompk" styles="display: none" />
    <gw:textbox id="txtMstPK" styles="display: none" />
    <gw:icon id="btnCopy" alt="Copy" text="Copy" style="display:none;" onclick="OnCopy()" />
    <!---------------------------------------------------------------->
</body>
</html>