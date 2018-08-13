<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One STItem</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var vPage = 0 ;

var G_PK                = 0,
    G_STItem_Code       = 1,
    G_STItem_Name       = 2,
    G_tco_itemgrp_pk    = 3,
    G_Item_Group        = 4,
    G_Unit              = 5,
    G_Lot_Qty           = 6,
    G_Price             = 7,
    G_LisPrice          = 8,
    G_StPrice           = 9,
    G_LmPrice           = 10,
    G_MkPrice           = 11,
    G_pur_type          = 12,
    G_volume            = 13,
    G_tin_warehouse_pk  = 14,
    G_partner_pk        = 15,
    G_partner_id        = 16,
    G_partner_name      = 17,
    G_Description       = 18,
    G_LOT_UOM           = 19,
    G_WT_UOM            = 20,
    G_Lot_WT            = 21,
    G_Weight            = 22,
    G_LName             = 23,
    G_FName             = 24;
//-------------------------------------------

function BodyInit()
{
    System.Translate(document);	

	//-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN = {0} or PUR_YN = {1} or PROD_YN = {2} or SEMI_PROD_YN = {3} or MAT_YN = {4} or SUB_MAT_YN = {5} ) order by grp_nm ", Request.querystring("group_type")) %>";     
    lstGroup.SetDataText(data);   
    
    //-------------------------    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
    
	//-------------------------	
	setPage(vPage);
    
	//----------------------------------
}

//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                data_fpab00080.Call();
        break;
        case 2:
	            data_fpab00080_1.Call("SELECT");
        break;
    }
   
}
//======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

//======================================================================
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    for( j=0 ; j < oGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//======================================================================

function OnReceiveData(obj)
{
   switch(obj.id)
    {
        case 'data_fpab00080':
            vPage = Math.ceil(lblRecord2.text / 50) 
            setPage(vPage)
            lblRecord2.text = lblRecord2.text + " record(s)";
            txtPage.text = 1;
            page1.innerText = '1';
            currentPage = 1;
            LoadDataPage(page1,1)
        break;
      }
}
//======================================================================

function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    ObjectStatus(page1,0)
                    ObjectStatus(page2,1)
                    ObjectStatus(page3,1)
                    currentPage =1
                }
            break;
            case 'page2':
                ObjectStatus(page1,1)
                ObjectStatus(page2,0)
                ObjectStatus(page3,1)
                currentPage =2
            break;
            case 'page3':
                ObjectStatus(page1,1)
                ObjectStatus(page2,1)
                ObjectStatus(page3,0)
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
     
        ObjectStatus(pagePrev,2)
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,2)
                 ObjectStatus(pageNext,2)
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,0)   
                 ObjectStatus(pageNext,2)   
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 ObjectStatus(pageNext,2)   
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 ObjectStatus(pageNext,2)   
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                ObjectStatus(pageNext,1)            
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
                ObjectStatus(pageNext,1)
            }
             if (page1.innerText == 1)
            {
                ObjectStatus(pagePrev,2)
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
                ObjectStatus(pageNext,2)
                }
             if (page1.innerText != '1')
            {
                ObjectStatus(pagePrev,1)
            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
          ObjectStatus(obj,0)
    }else
    {
        ObjectStatus(obj,1)
    }
}
function ObjectStatus(obj,status)
{
    if (status==0)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        if (status==1)
        {
            obj.style.cursor ='hand';
            obj.style.color = 'blue';
        }else
        {
            obj.style.cursor ='none';
            obj.style.color = 'gray';
        }
    }
}
//======================================================================


</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00080_1" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00080_1" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="txtPage" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00080" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso  type="process" procedure="st_lg_sel_fpab00080" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 44%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 43%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
                <table style="width: 100%; height: 100%">
                    <tr align="right">
                        <td style="width: 80%;" align="left">
                            <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 3%;" align="right">
                            <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u>
                            </b>
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
                            <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u>
                            </b>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 98%">
            <td colspan="7">
                <gw:grid id="idGrid" header="_PK|STItem Code|STItem Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_LOT UOM|_WT UOM|_Lot WT|_Weight|_item_lname|_item_fname"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|2500|1500|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtPage" styles="display: none" />
    <gw:textbox id="txtRecords" styles="display: none" />
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
