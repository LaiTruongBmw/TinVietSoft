<!-- #include file="../../../../system/lib/form.inc"  -->
<script LANGUAGE="JavaScript" SRC="/ESYS/system/lib/ajax.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Item</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var IsSelectItem ;
function BodyInit()
{
    System.Translate(document);  // Translate to language session
       
    txtPartnerID.SetEnable(false);
	txtPartnerName.SetEnable(false);	
	
    var data = "";    
        
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_nm from TLG_IT_ITEMGRP where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' ")%>|ALL|Select all"; 
    cboGroup.SetDataText(data);
    cboGroup.value = 'ALL' ;
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    var type = "<%=request.QueryString("type")%>";
    IsSelectItem = "<%=request.QueryString("IsSelectItem")%>";
    
    if (type!='')
        cboType.value=type;
    OnTypeChange();
    if ( group_pk != '' )
    {
        cboGroup.value = group_pk ;
        cboGroup.SetEnable(false);
    }
    
    if (IsSelectItem=='1')
    {
        idGrid2.style.display="none";
        ibtnRemove.style.display="none";
        lblCount.style.display="none";
        var ctl = idGrid.GetGridControl(); 
        ctl.style.height="500";
    }
        
	SetGridFormat();
}
//------------------------------------------------------------------------------------------------
function TabPopUp(fnameFile)
{
	var fpath = System.RootURL + "/standard/forms/60/09/" + fnameFile; 	
	var a = new Array();
	aValue  = System.OpenModal(  fpath , 800 , 550 , 'resizable:no;status:yes');	
	if ( aValue != null )  
	{
	    txtPartnerName.text = aValue[2];
		txtPartnerID.text = aValue[1];					
		txtPartnerPK.text = aValue[0];
	}
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{ 
//    if (txtPartnerPK.text=="")
//    {
//        alert("Please, select a partner!")
//    }else
//    {
	    dsoGetItem.Call("SELECT");
//	}
}
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(IsSelectItem=='1')
   {    
       var arrTemp=new Array();
             
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(oGrid.row,j);
         }
         
         arr_data[arr_data.length]= arrTemp;        
   }
   else
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
 //---------------------------------------------------------------------------------------
    function SetGridFormat()
     {
        var ctr = idGrid.GetGridControl(); 
        ctr.ColFormat(6) = "#,###,###,###,###,###.##";                
        ctr = idGrid2.GetGridControl(); 
        ctr.ColFormat(6) = "#,###,###,###,###,###.##";        
     }
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData(idGrid2.row,0);
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
      if(p_oGrid.GetGridData(i,0) == p_col_val)
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
      if(p_oGrid.GetGridData(i,0) == p_value)
      {
         return true;
      }
   }
   return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid")
  {
    var col_val = oGrid.GetGridData(event.row,0);
    
    if(IsSelectItem=='1')
    {
        OnSelect(idGrid);
    }
    
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
function OnTypeChange()
{	

	var t=new Date()
	var url =  System.RootURL + "/standard/forms/ep/gm/GetGroupType.aspx?type=" + cboType.value;
	
	ajax_test = null;
	ajax_test = GetXmlHttpRequest(return_result);
	ajax_test.open("GET", url , true);
	ajax_test.send(null);
}

//-----------------------------------------------

function return_result()
{	
	if(GetRequestState(ajax_test))
	{
	    strdata = ajax_test.responseText;		   	      
	    cboGroup.SetDataText(strdata);
	   // lstGroup.value= 'ALL';
	}
}
</script>

<body>
    <gw:data id="dsoGetItem" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="ac_sel_60090010_item2_popup" > 
                  <input bind="idGrid" > 
                    <input bind="txtPartnerPK" />
                    <input bind="cboGroup" />
                    <input bind="txtItem" /> 
                    <input bind="cboType" />                     
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="datGetGroupType" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="3" type="control" user="inv" parameter="0,1" function = "ac_sel_60090010_item2_1_popup"> 
                <input >
                    <input bind="cboType" />
                </input>
                <output>
                    <output bind="cboGroup" /> 
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <table width="100%">
        <tr>
            <td width="5%" align="right">
                <b style="color: #1b2ff2; cursor: hand" onclick="TabPopUp('60090010_vendor_popup.aspx',1)">
                    Partner </b>
            </td>
            <td width="8%">
                <gw:textbox id="txtPartnerID"  styles="width:100%" />
            </td>
            <td width="15%">
                <gw:textbox id="txtPartnerName" styles="width:100%" />
            </td>
            <td width="5%" align="right">
                <b>Type</b>
            </td>
            <td width="12%">
                <gw:list id="cboType" styles="width:100%" value='ALL' onchange="OnTypeChange()" >
                    <data>Data|ALL|Select All|PUR|PURCHASE|PROD|PRODUCT|SALE|SALE </data>
                </gw:list > 
            </td>
            <td width="5%" align="right">
                <b>Group</b>
            </td>
            <td width="30%">
                <gw:list id="cboGroup" styles="width:100%" value='ALL' onchange="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <b>Item</b>
            </td>
            <td width="15%">
                <gw:textbox id="txtItem" styles="width:100%"  onenterkey="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td width="5%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr>
            <%--0._PK|1.Item Code|2.Item Name|3._tco_itemgrp_pk|4.Item Group|5.Unit|6.Stock Qty.|7.Price
                |8._LisPrice|9._StPrice|10._LmPrice|11._MkPrice|12._pur_type|13._volume|14._tin_warehouse_pk
                |15._partner_pk|16._partner_id|17._partner_name|18.Description|19._HS_CODE|20._cnv_ratio"--%>
            <td colspan="13">
                <gw:grid id="idGrid" 
                    header="_tco_item_pk|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|Price|Acc.Cd|Acc.Nm|_tac_abacctcode_pk|_tin_warehouse_pk|WH"
                    format="0|0|0|0|0|0|1|0|0|0|0|0" 
                    aligns="0|0|0|0|0|1|3|1|0|0|0|2"
                    defaults="|||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1500|3000|0|2500|800|1000|1000|2000|0|0|1400" 
                    styles="width:100%; height:250"
                    sorting="T" 
                    param="0,1,2,3,4,5,5,6,7,8,9,10,11" 
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="11" align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
        </tr>
        <tr>
            <td colspan="13">
                <gw:grid id="idGrid2"             
                    header="_tco_item_pk|Item Code|Item Name|_tco_itemgrp_pk|Item Group|Unit|Price|Acc.Cd|Acc.Nm|_tac_abacctcode_pk|_tin_warehouse_pk|WH"
                    format="0|0|0|0|0|0|1|0|0|0|0|0" 
                    aligns="0|0|0|0|0|1|3|1|0|0|0|0"
                    defaults="|||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1500|3000|0|2500|800|1000|1000|2000|0|0|1400" 
                    styles="width:100%; height:250"
                    sorting="T" 
                    param="0,1,2,3,4,5,5,6,7,8,9,10,11" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtPartnerPK" style="display: none" />
    <gw:textbox id="txtDeliveryTerm" style="display: none" />
</body>
</html>
