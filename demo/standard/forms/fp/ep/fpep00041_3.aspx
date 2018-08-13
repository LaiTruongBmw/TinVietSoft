<!-- #include file="../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Roll ID inquiry</title>
</head>
<%  ESysLib.SetUser("prod")%>

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
    var callerWindowObj = dialogArguments;     
        
    item_pk   = callerWindowObj.item_pk  ,
    item_code = callerWindowObj.item_code,
    item_name = callerWindowObj.item_name,
    item_uom  = callerWindowObj.item_uom ;  
   
    
    if ( item_pk != '' )
    {
        txtItemPK.text   = item_pk ;
        txtItemCode.text = item_code ;
        txtItemName.text = item_name ;
        txtItemUOM.text  = item_uom ;
        
        if ( Number(txtItemPK.text) > 0 )
        {
            Item.style.display="none";
        }    
        else
        {
            txtItemPK.text      = "<%=Request.querystring("item_pk")%>";    
            txtItemCode.text    = "<%=Request.querystring("item_code")%>";    
            txtItemName.text    = "<%=Request.querystring("item_name")%>";    
            txtItemUOM.text     = "<%=Request.querystring("item_uom")%>";         
        }
        
        OnSearch();
    }
    
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    BindingDataList();
    
}
//------------------------------------------------------------------------
function BindingDataList()
{
	var data = '';
	
  
	
}
//------------------------------------------------------------------------
function OnSearch()
{
	fpep00041_1.Call("SELECT");
}
//------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl ;   
    trl = grdLotNo.GetGridControl();
    trl.ColFormat(4) = "###,###,###,###,###.##";
    trl.ColFormat(5) = "###,###,###,###,###.##";  
}
//------------------------------------------------------------------------

 function OnPopUp(pos)
 {
      switch (pos)         
      {		        
            case 'Item' :
                 var path = System.RootURL + '/form/fp/ab/PopUpGetOneItem.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
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
    <gw:data id="fpep00041_1">
        <xml>
            <dso type="grid"  function="PROD.sp_sel_fpep00041_3_1" >
                <input bind="grdLotNo" > 
                    <input bind="txtItemPK" />
                    <input bind="dtStTime" />
                    <input bind="dtFnTime" />
                </input>
                <output bind="grdLotNo" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td width="5%" align="right">Item 
            </td>
            <td width="20%">
                <gw:textbox id="txtItemCode" styles="width:100%" />
            </td>
            <td width="30%" align="right">
                <gw:textbox id="txtItemName" styles="width:100%" />
            </td>
            <td width="12%" align="right">  Prod. date</td>
            <td width="25%" nowrap>
                <gw:datebox id="dtStTime" styles="width:40%;" lang="<%=Session("Lang")%>"  />
                ~
                <gw:datebox id="dtFnTime" styles="width:40%;" lang="<%=Session("Lang")%>"  />
            </td>
            <td width="7%">
            </td>
            <td width="1%">
                <gw:imgbtn id="btSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="7">
                <gw:grid id='grdLotNo'
                    header='_pk|Lot No|Prod Date|Finish time|Weight|Prod Qty(M)|Description'
                    format='0|0|4|4|0|0|0'
                    aligns='0|0|0|0|3|3|0'
                    widths='0|1500|1200|1400|1500|1500|2000'
                    sorting='T'
                    styles='width:100%; height:100%'
                    oncelldblclick="RowDbClick()"
                />            
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------------------->
    <gw:textbox id="txtItemPK" styles="width:100%;display:none" />
    <gw:textbox id="txtItemUOM" styles="width:100%;display:none" />
    <!--------------------------------------------------------------------------------------->
</body>
</html>
