<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Item : Tree Style</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var iCols_tco_item_pk       = 0 ;
var iColsPrice              = 7;

var vPage = 0 ;

 //---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }
 
//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    txtPartnerID.SetEnable(false);
	txtPartnerName.SetEnable(false);	
	
    var data = "";  
          
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    var data1 = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0 order by PARTNER_NAME ")%>"; 
    cboCompanyList.SetDataText(data1+"|ALL|SELECT ALL");
    cboCompanyList.value='ALL';
    
    dat_ItemGroupTree.Call('SELECT')
    txtInputPK.text = group_pk

	OnFormatGrid();
	setPage(vPage)
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    trl = idGrid.GetGridControl();	
    trl.ColFormat(iColsPrice)           = "###,###,###,###,###.##";    
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(iColsPrice)           = "###,###,###,###,###.##";        
}
//------------------------------------------------------------------------------------------------
function TabPopUp(fnameFile)
{
	var fpath = System.RootURL + "/form/fp/ab/" + fnameFile; 	
	var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	

	if ( aValue != null )  
	{
	    txtPartnerName.text = aValue[2];
		txtPartnerID.text = aValue[1];					
		txtPartnerPK.text = aValue[0];
	}
}
//----------------------------------------------------------------------
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode();       
   txtInputPK.SetDataText(obj.oid);
   OnSearch(1)
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
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
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
  countItem()
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
        break;
        case 'dat_ItemGroupTree':
            idGrid.ClearData();
            idGrid2.ClearData();
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

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="dsoGetItem" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00040_2" > 
                  <input bind="idGrid" > 
                    <input bind="txtPartnerPK" />
                    <input bind="txtInputPK" />
                    <input bind="txtItem" />
					<input bind="chkPUR_YN" />
					<input bind="txtPage" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="dsoGetItem_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso  type="process" procedure="st_lg_sel_fpab00040_3" > 
                  <input bind="idGrid" > 
                    <input bind="txtPartnerPK" />
                    <input bind="txtInputPK" />
                    <input bind="txtItem" />
					<input bind="chkPUR_YN" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="dat_ItemGroupTree" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="1" type="tree"  function="st_lg_sel_fpab00040_1" > 
            <input>
                <input bind="cboCompanyList"/>
                <input  bind="txtP_PK" />
                <input  bind="chkPUR_YN" />
            </input>
            <output bind="oTree" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td style="width: 30%" align="right">
                            Company</td>
                        <td style="width: 70%">
                            <gw:list id="cboCompanyList" styles="width:100%;" onchange="dat_ItemGroupTree.Call('SELECT');" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 20%" align="right">
                            <b>Purchase</b></td>
                        <td style="width: 5%" align="left">
                            <gw:checkbox id="chkPUR_YN" defaultvalue="Y|N" onchange="dat_ItemGroupTree.Call('SELECT')"></gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="6">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id="right">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%">
                        <td width="5%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="TabPopUp('PopUpGetPartner.aspx',1)">
                                Partner </b>
                        </td>
                        <td width="10%">
                            <gw:textbox id="txtPartnerID" styles="width:100%" />
                        </td>
                        <td width="20%">
                            <gw:textbox id="txtPartnerName" styles="width:100%" />
                        </td>
                        <td width="5%" align="right">
                            <b>Item</b>
                        </td>
                        <td width="25%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td colspan="9">
                            <table width="100%" style="height: 100%">
                                <tr align="right">
                                    <td style="width: 5%;" align="right">
                                    </td>
                                    <td style="width: 80%;" align="left">
                                        <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 3%;" align="right">
                                        <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                                    </td>
                                    <td width="3%" align="center" style="color: gray; cursor: none">
                                        <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                                        </u></b>
                                    </td>
                                    <td width="3%" align="center">
                                        <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                                        </b>
                                    </td>
                                    <td width="3%" align="center">
                                        <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                                        </b>
                                    </td>
                                    <td style="width: 3%;" align="left">
                                        <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td colspan="13">
                            <gw:grid id="idGrid" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_tac_abacctcode_pk|Acc Code|Acc Name|_HS_CODE|_cnv_ratio|_uom_packing|_tran_rate|_weight_rate"
                                format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|2000|4000|0|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                                sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td colspan="2" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td colspan="11" align="right">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="13">
                            <gw:grid id="idGrid2" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_tac_abacctcode_pk|Acc Code|Acc Name|_HS_CODE|_cnv_ratio|_uom_packing|_tran_rate|_weight_rate"
                                format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|2000|4000|0|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                                sorting="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" style="display: none" />
    <gw:textbox id="txtPage" styles="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <gw:textbox id="txtP_PK" text="" style="display: none" />
    <gw:textbox id="txtInputPK" style="display: none" />
    <!---------------------------------------------------------------->
    <!------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------->
</body>
</html>
