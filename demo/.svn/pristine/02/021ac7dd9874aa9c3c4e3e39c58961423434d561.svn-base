<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Lot Number Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var     iM_tpr_lotno_pk      = 0 ,
        iM_Lot_No            = 1 ,
        iM_Prod_Date         = 2 ,
        iM_Expire_Date       = 3 ,
        iM_tco_item_pk       = 4 ,
        iM_Item_Code         = 5 ,
        iM_Item_Name         = 6 ,
        iM_Item_UOM          = 7 ,
        iM_tco_buspartner_pk = 8 ,
        iM_Partner_ID        = 9 ,
        iM_Partner_Name      = 10 ,
        iM_Description       = 11 ,
        iM_Att01             = 12 ,
        iM_Att02             = 13 ,
        iM_Att03             = 14 ,
        iM_Att04             = 15 ,
        iM_Att05             = 16 ;

var     item_pk     ,
        item_code   ,
        item_name   ,
        item_uom    ;
        
//------------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);
    //--------------------------
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    //--------------------------
    
    var type  = "<%=request.QueryString("type")%>";
             
    txtType.text = type ;
    
    txtItemPK.text   = "<%=Request.querystring("item_pk")%>";    
    txtItemCode.text = "<%=Request.querystring("item_code")%>";    
    txtItemName.text = "<%=Request.querystring("item_name")%>";    
    txtItemUOM.text  = "<%=Request.querystring("item_uom")%>"; 
    
    OnSearch();                    

    //--------------------------
    BindingDataList();
    
}
//------------------------------------------------------------------------
function BindingDataList()
{
	var data = '';
	
    //grdLotNo.SetComboFormat(iM_Att01,'#P;Planned|#R;Ready to T/O|#E;Excess|#A;Extra|#C;Cancel');
	
}
//------------------------------------------------------------------------
function OnSearch()
{
	data_fpab00280.Call("SELECT");
}
//------------------------------------------------------------------------
function OnAdd()
{
    if ( txtItemPK.text == '' )
    {
        alert('Please select one Item.')
        return;
    }
    else
    {
        grdLotNo.AddRow();
        grdLotNo.SetGridText(grdLotNo.rows - 1, iM_Att01,"P" );
        grdLotNo.SetGridText(grdLotNo.rows - 1, iM_tco_item_pk, txtItemPK.text  );
        grdLotNo.SetGridText(grdLotNo.rows - 1, iM_Item_Code  , txtItemCode.text);
        grdLotNo.SetGridText(grdLotNo.rows - 1, iM_Item_Name  , txtItemName.text);
        grdLotNo.SetGridText(grdLotNo.rows - 1, iM_Item_UOM   , txtItemUOM.text );            
    }
}
//------------------------------------------------------------------------
function OnDelete()
{
	grdLotNo.DeleteRow();
}
//------------------------------------------------------------------------
function OnUDelete()
{
	grdLotNo.UnDeleteRow();
}
//------------------------------------------------------------------------
function OnSave()
{   
    data_fpab00280.Call();
}

//------------------------------------------------------------------------

 function OnPopUp(pos)
 {
      switch (pos)         
      {		        
            case 'Item' :
                 var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y||';
                 var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:700px;dialogHeight:500px');	
                 
                 if ( obj != null )
                 {
                        txtItemPK.text   = obj[0] ;   
                        txtItemCode.text = obj[1] ; 
                        txtItemName.text = obj[2] ;
                        txtItemUOM.text  = obj[5] ; 
                 }	
	          break; 
       }
 }  

 //---------------------------------------------------------

 function RowDbClick()
 {
    var code_data=new Array()
    var ctrl = grdLotNo.GetGridControl();
    var index, rowNo
    
    index =0;
    rowNo = 0
    
    if(ctrl.SelectedRows == 0)
    {
           return ;
    }
    else
    {
        for( i = 0; i < ctrl.SelectedRows; i++ )
	    {	  
            rowNo = ctrl.SelectedRow(i);
            
            if (grdLotNo.GetGridData(rowNo , 0 )!="")
            {
                for( j = 0; j < grdLotNo.cols -1; j++ )
                {
                    code_data[index] = grdLotNo.GetGridData(rowNo , j );
                     index ++;
                }
                 window.returnValue = code_data; 
                 this.close();	
            } 
            else
            {
                alert("This row hasn't been saved !!!")
            }
            
	    }
    }
        	
 }
    
 //---------------------------------------------------------
</script>

<body>
    <!--------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%" align="right">
                <b id="Item" style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Item')">Item </b>
            </td>
            <td style="width: 50%; white-space: nowrap">
                <gw:textbox id="txtItemCode" styles="width:30%" />
                <gw:textbox id="txtItemName" styles="width:70%" />
            </td>
            <td style="width: 10%; display: none" align="right">
                Date
            </td>
            <td style="width: 20%; white-space: nowrap; display: none">
                <gw:datebox id="dtFrom" styles="width:100%" lang="<%=Session("Lang")%>" />
                ~
                <gw:datebox id="dtTo" styles="width:100%" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 5%">
            </td>
            <td style="width: 1%">
                <gw:button id="btSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btNew" img="new" alt="Add" onclick="OnAdd()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btDel" img="delete" alt="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btUnDel" img="udelete" alt="UnDelete" onclick="OnUDelete()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="16">
                <!------------------------------------------------------------------->
                <gw:data id="data_fpab00280">
                    <xml>
                        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_fpab00280" procedure="st_lg_upd_fpab00280">
                            <input bind="grdLotNo" > 
                                <input bind="txtItemPK" />
                                <input bind="dtFrom" />
                                <input bind="dtTo" />
                                <input bind="txtType" />
                            </input>
                            <output bind="grdLotNo" />
                        </dso>
                    </xml>
                </gw:data>
                <!------------------------------------------------------------------->
                <gw:grid id='grdLotNo' header='_PK|Lot No|_Lot Date|_Expire Days|_TCO_ITEM_PK|Item Code|Item Name|UOM|_TCO_BUSPARTNER_PK|_PARTNER_ID|_PARTNER_NAME|Description|_Prod Status|_Inspect Date|_ATT03|SO/PO Num|_ATT05'
                    format='0|0|4|1|0|0|0|0|0|0|0|0|0|4|0|0|0' aligns='0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||' editcol='0|1|1|1|1|0|0|0|0|0|0|1|1|1|1|1|1' widths='1000|1500|1200|1000|1000|1500|2000|800|1000|1000|1000|1500|1500|1200|1000|1000|1000'
                    sorting='T' oncelldblclick="RowDbClick()" styles='width:100%; height:100%' />
                <!------------------------------------------------------------------->
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------------------->
    <gw:textbox id="txtItemPK" styles="width:100%;display:none" />
    <gw:textbox id="txtType" styles="width:100%;display:none" />
    <gw:textbox id="txtItemUOM" styles="width:100%;display:none" />
    <!--------------------------------------------------------------------------------------->
</body>
</html>
