<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">
    <title>Barcode Stock Inquiry</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>"   ;
    
    var flag = 0 , vPage = 0;
    
    var iColYYMMDD          = 0,
        iColBC_Type         = 1 ,
        iColtco_item_pk     = 2,
        iColItem_Code       = 3,
        iColItem_Name       = 4,
        iColLot_UOM         = 5,
        iColtpr_lot_no_pk   = 6,
        iColLot_No          = 7,
        iColtpr_bcprint_pk  = 8,
        iColtpr_itembcm_pk  = 9,
        iColItem_BC         = 10,
        iColSeq             = 11,
        iColBC_Qty          = 12,
        iColItem_Weight     = 13,
        G_Weight_UOM        = 14,
        G_WH_ID             = 15,
        G_WH_Loc_ID         = 16;
        

 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
    grdSearch.GetGridControl().FrozenCols = 10 ;
    //--------------------
    var ctrl = grdSearch.GetGridControl();
    
    ctrl.ScrollTrack = true;
    
    ctrl.ColFormat(iColBC_Qty)      = "###,###,###.##" ;
    ctrl.ColFormat(iColItem_Weight) = "###,###,###.##" ;
    //--------------------
    setPage(vPage);
    //--------------------    
 }
 
 //-------------------------------------------------------------
 function CheckValid()
 {
     var col, row,value
    col = event.col
    row = event.row
    if ( col == iColtpr_itembcm_pk || col == iColSeq || col == iColItem_Weight )
    {
         value = grdPrintBCList.GetGridData(row ,col ) ;
         
         if ( !Number(value) )
         {
            grdPrintBCList.SetGridText(row,col,"")
         }
    }
 }

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
             fpcw00030.Call("SELECT");
        break;   
        case 2:
            fpcw00030_1.Call();
        break;      
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		
        case "fpcw00030" :
                //--------------------------------
                grdSearch.GetGridControl().AutoSize( iColYYMMDD, G_WH_Loc_ID, false, 0 ); 
         
                //--------------------------------
                if ( grdSearch.GetGridControl().Rows < 2 )
                {
                    lblItemUOM.text      = '';
                    lblWeightQtyUOM.text = '';
                                                            
                    return;
                }
                else
                {
                    lblItemUOM.text      = grdSearch.GetGridData( 1, iColLot_UOM  );
                    lblWeightQtyUOM.text = grdSearch.GetGridData( 1, G_Weight_UOM );
                }
                //--------------------------------                
          break;
          
          case "fpcw00030_1" : 
                vPage = Math.ceil(lblRecord2.text / 200) 
                setPage(vPage)
                lblRecord2.text = lblRecord2.text + " record(s)";
                txtPage.text = 1;
                page1.innerText = '1';
                currentPage = 1
                LoadDataPage(page1,1)
           break;
      }  
 }

 //---------------------------------------------------------
    var p_update = 0 ;
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 1 :
            break;
      }  
 }
 
  //---------------------------------------------------------

function OnDelete(obj)
 {
    var ctrl = obj.GetGridControl();
	var row  = ctrl.row;
	  if ( row > 0 ) 
	{
		if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		{						
			obj.RemoveRow();					
		}		
		else 
		{
			if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			{
				obj.DeleteRow();
			}
		}
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
                currentPage = 3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        OnSearch(1)
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
    <!------------------------------------------------------------------>
    <gw:data id="fpcw00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3" function="prod.sp_sel_fpcw00030" > 
                <input> 
                    <input bind="txtItem" /> 
                    <input bind="txtItemBC" />  
                    <input bind="txtStockNo" /> 
                    <input bind="txtWHLocation" />
                    <input bind="txtPage" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpcw00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="process" procedure="prod.sp_sel_fpcw00030_1" > 
                <input> 
                    <input bind="txtItem" /> 
                    <input bind="txtItemBC" />  
                    <input bind="txtStockNo" /> 
                    <input bind="txtWHLocation" />
                </input> 
                <output>
                    <output bind="lblRecord2" /> 
                    <output bind="txtTotalBCQty" /> 
                    <output bind="txtTotalWeightQty" /> 
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
        <table width="100%" border="1" style="height: 100%">
            <tr style="height: 1%">
                <td>
                    <table width="100%" style="height: 100%">
                        <tr align="left" style="height: 50%">
                            <td style="width: 5%" align="right">
                                Item
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" />
                            </td>
                            <td style="width: 5%" align="right">
                                Item BC
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtItemBC" styles="width:100%" />
                            </td>
                            <td style="width: 5%" align="right">
                                Stock No
                            </td>
                            <td style="width: 15%">
                                <gw:textbox id="txtStockNo" styles="width:100%" />
                            </td>
                            <td style="width: 5%" align="right">
                                Location
                            </td>
                            <td style="width: 15%">
                                <gw:textbox id="txtWHLocation" styles="width:100%" />
                            </td>
                            <td style="width: 5%" align="right">
                                <gw:imgbtn id="btnSearch" img="search" onclick='OnSearch(2)' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 1%">
                <td>
                    <table width="100%" style="height: 100%">
                        <tr>
                            <td style="width: 40%" align="left">
                                Total :
                                <gw:textbox id="txtTotalBCQty" styles="width:25%" type="number" format="#,###,###,###,###.##R" />
                                (<gw:label id="lblItemUOM" styles='width:1%' text='M' />) /
                                <gw:textbox id="txtTotalWeightQty" styles="width:25%" type="number" format="#,###,###,###,###.##R" />
                                (<gw:label id="lblWeightQtyUOM" styles='width:1%' text='KG' />)
                            </td>
                            <td style="width: 40%" align="right">
                                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                            </td>
                            <td style="width: 20%" align="right">
                                <table width="100%" style="height: 100%">
                                    <tr align="right">
                                        <td style="width: 80%;" align="right">
                                            <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                                        </td>
                                        <td width="5%" align="center" style="color: gray; cursor: none">
                                            <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                                            </u></b>
                                        </td>
                                        <td width="5%" align="center">
                                            <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                                            </b>
                                        </td>
                                        <td width="5%" align="center">
                                            <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                                            </b>
                                        </td>
                                        <td style="width: 5%;" align="left">
                                            <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 98%">
                <td>
                    <gw:grid id="grdSearch" header="YYMMDD|BC Type|_tco_item_pk|Item Code|Item Name|Lot UOM|_tpr_lot_no_pk|Stock No|_tpr_bcprint_pk|_tpr_itembcm_pk|Item BC|Seq|BC Qty|Item Weight|W. UOM|WH ID|WH Loc ID|_Batch Num|_Close YN|_Close Remark|SO No|Item Birth Date|Grade|_Att04|_Att05|_Att06|_Att07|_Att08|_Att09|_Att10|_tsa_saleorderd_pk"
                        format="0|0|0|0|0|1|0|0|0|0|0|0|1|1|1|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0" aligns="1|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                        defaults="||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                        widths="1000|1000|0|1500|4500|1000|0|1500|0|0|1700|1000|1000|1500|1500|1000|1500|1000|1000|1500|1700|1500|1000|0|0|0|0|0|0|0|0"
                        styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" />
                </td>
            </tr>
        </table>
    </form>
</body>
<gw:textbox id="txtPage" styles="display: none" />
</html>
