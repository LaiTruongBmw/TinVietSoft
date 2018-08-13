<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Quotation entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script src="../../../../system/lib/ajax.js"></script>

<script language="javascript" type="text/javascript">
//--------------------------------------

var flag;
var G_ITEM_PK       = 0,
    G_ITEM_CD       = 1,
    G_ITEM_NM       = 2; 

var G1_CHECK            = 0,
    G1_TCO_ITEM_PK      = 1,
    G1_ITEM_CODE         = 2, 
    G1_ITEM_NAME         = 3, 
    G1_UNIT              = 4, 
    G1_PARTNER_PK        = 5, 
    G1_PARTNER_ID        = 6, 
    G1_PARTNER_NAME      = 7, 
    G1_ST_PRICE          = 8,
    
    G1_PAYMENT_TERM      = 9, 
    G1_PAYMENT_METHOD    = 10, 
    G1_LEADS_DAY         = 11, 
    G1_DELI_TYPE         = 12,    
    G1_CCY               = 13;
 

var G2_ITEM_PK       = 0 ,
    G2_ITEM_CODE     = 1 ,
    G2_ITEM_NAME     = 2 ,
    G2_UNIT          = 3 ,
    G2_REQ_QTY       = 4 ,
    G2_PARTNER_PK    = 5 ,
    G2_PARTNER_ID    = 6 ,
    G2_PARTNER_NM    = 7 ,
    G2_UNIT_PRICE    = 8 ,
    G2_CCY           = 9 ,
    G2_PAY_TERM      = 10 ,
    G2_PAY_METHOD    = 11 ,
    G2_LEAD_DAY      = 12 ,
    G2_AGREE         = 13 ,
    G2_REMARK        = 14 ;
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }
 
//----------------------------------------------------------------------------------------
function BodyInit()
 {    
    System.Translate(document);  // Translate to language session
    //-------------------------
    
    BindingDataList();    
   // SetGridFormat();       
   
 }
//---------------------------------------------------------------------------------------------------
 function BindingDataList()
 {  
     var data;
     
     data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) order by grp_nm ", Request.querystring("group_type")) %>||";     
     lstGroup.SetDataText(data);   
     lstGroup.value="";
     
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_PAYMENT_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_PAYMENT_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPO2002' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_DELI_TYPE,data);     
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_CCY,data);  
 }
 
 //---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##";
 }

//--------------------------------------------------------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'ITEM':
            data_epbp00192.Call("SELECT");
        break;
    
        case 'PRICE':
            if(grdItem.row>0)
            {
                txtItemPK.text = grdItem.GetGridData(grdItem.row,G_ITEM_PK);
                txtItemCD.text = grdItem.GetGridData(grdItem.row,G_ITEM_CD);
                txtItem.text = grdItem.GetGridData(grdItem.row,G_ITEM_NM);
                data_epbp00192_1.Call("SELECT");                       
            }
        break;        
    }
}

//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'PriceList':
            var fpath = System.RootURL + '/standard/formsep/bp/epbp00193.aspx';
            window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');
        break;    
    }	       
}

//--------------------------------------------------------------------------------------------------
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}
//--------------------------------------------------------------------------------------------------
function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_epbp00190_1.StatusDelete();
                data_epbp00190_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}

//=======================================================================================
function OnSelectMap()
{
    for(var i = 1 ; i<grdPrice.rows; i++)
    {
        var a = grdPrice.GetGridData( i, G1_CHECK);
        
        if ( a == "-1" )
        {
                  
             if(CheckDataExist(grdMap,grdPrice.GetGridData( i,G1_TCO_ITEM_PK),G2_ITEM_PK) == 0 ||
                CheckDataExist(grdMap,grdPrice.GetGridData( i,G1_PARTNER_PK),G2_PARTNER_PK)== 0)
            {
           grdMap.AddRow();
           grdMap.SetGridText(grdMap.rows-1,G2_ITEM_PK,grdPrice.GetGridData( i,G1_TCO_ITEM_PK));
           grdMap.SetGridText(grdMap.rows-1,G2_ITEM_CODE,grdPrice.GetGridData( i,G1_ITEM_CODE));
           grdMap.SetGridText(grdMap.rows-1,G2_ITEM_NAME,grdPrice.GetGridData( i,G1_ITEM_NAME));
           grdMap.SetGridText(grdMap.rows-1,G2_UNIT,grdPrice.GetGridData( i,G1_UNIT));
           
         //  grdMap.SetGridText(grdMap.rows-1,G2_REQ_QTY,grdItem.GetGridData( i,G1_PARTNER_PK));
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_PK,grdPrice.GetGridData( i,G1_PARTNER_PK));
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_ID,grdPrice.GetGridData( i,G1_PARTNER_ID));
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_NM,grdPrice.GetGridData( i,G1_PARTNER_NAME));
           grdMap.SetGridText(grdMap.rows-1,G2_LEAD_DAY,grdPrice.GetGridData( i,G1_LEADS_DAY));
           
           grdMap.SetGridText(grdMap.rows-1,G2_PAY_TERM,grdPrice.GetGridData( i,G1_PAYMENT_TERM));
           grdMap.SetGridText(grdMap.rows-1,G2_PAY_METHOD,grdPrice.GetGridData( i,G1_PAYMENT_METHOD));     
           grdMap.SetGridText(grdMap.rows-1,G2_UNIT_PRICE,grdPrice.GetGridData( i,G1_ST_PRICE));
           grdMap.SetGridText(grdMap.rows-1,G2_CCY,grdPrice.GetGridData( i,G1_CCY));
           }
        }
    }
}
//---------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value,p_col)
{
      for(var i=1;i<p_oGrid.rows;i++)
       {
          if(p_oGrid.GetGridData(i, p_col) == p_value)
          {
             return 1;
          }
       }
       return 0;
}
//---------------------------------------------------------------------
function OnSelectData(oGrid)
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
		window.returnValue =  arr_data;
		window.close();
   }	  
}
</script>

<body>
    <!----------------------------item------------------------------------>
    <gw:data id="data_epbp00192" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_epbp00192" > 
                  <input bind="grdItem" >
				    <input bind="lstGroup" />
                    <input bind="txtItem" />
				  </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdPrice---------------------------------------->
    <gw:data id="data_epbp00192_1" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_epbp00192_1" > 
                  <input bind="grdPrice" >
				    <input bind="txtPartner" />
                    <input bind="txtItemPK" />
				  </input> 
                <output bind="grdPrice" /> 
            </dso> 
        </xml> 
    </gw:data>
     
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height:55%">
            <td id="left" style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Group
                        </td>
                        <td style="width: 40%">
                            <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('ITEM')" csstype="mandatory" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('ITEM')" />
                        </td>
                         <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('ITEM')" />
                        </td>
                    </tr>
                                    
                    <tr style="height: 96%">
                        <td colspan="6">
                            <gw:grid id="grdItem" header="_PK|Item Code|Item Name|_tco_itemgrp_pk|Item Group|UOM|U/Price|Remark"
                                format="0|0|0|0|0|0|0|0" 
					            aligns="0|0|0|0|0|1|3|0"
                                editcol="0|0|0|0|0|0|0|0" 
                                oncellclick="OnSearch('PRICE')"
					            widths="0|2000|4000|0|2500|800|1500|1500"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                         <td style="width: 5%" align="right">
                            Partner
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtPartner" styles="width:100%" onenterkey="OnSearch('PRICE')" />
                        </td>
                        <td style="width: 5%" align="right">
                            
                        </td>
                        <td style="width: 25%">
                            <a title="Price Setting" onclick="OnPopUp('PriceList')" href="#tips" style="text-decoration: none;
                                color=#0000ff">Price Setting</a>
                        </td>
                         <td style="width: 1%" align="right">
                            <gw:button id="btnSearch2" img="search" alt="Search" onclick="OnSearch('PRICE')" />
                        </td>                        
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelectMap()" />
                        </td>
                    </tr>                    
                    <tr style="height: 94%">
                        <td colspan="12">
                            <gw:grid id='grdPrice'
                                header='Select|_TCO_ITEM_PK|_Item Code|_Item Name|_UOM|_TCO_BUSPARTNER_PK|Partner ID|Parner NM|Price|Payment Term|Payment Method|Lead Day|_Deli Type|CCY'
                                format='3|0|0|0|0|0|0|0|1|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||'
                                editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1000|0|1500|2000|800|0|1500|2000|1500|1500|1500|1500|1500|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr style="height: 2%">                                        
                <td colspan="2" align="right" style=" white-space:nowrap">   
                    <table>
                        <tr>
                            <td  style="width:90%">
                                
                            </td>
                            <td style="width:5%">
                                <gw:button id="btnDelete" img="delete" alt="delete" onclick="OnDelete()" />
                            </td>
                            <td style="width:5%">
                                <gw:button id="btnSelect1" img="select" alt="Select" text="Select" onclick="OnSelectData(grdMap)" />
                            </td>
                        </tr>
                    </table>   
                </td>
         </tr>    
        <tr style="height:35%">
            <td colspan="2">
                 <gw:grid id='grdMap'
                        header='_TCO_ITEM_PK|Item Code|Item Name|UOM|Req Qty|_BUSPARTNER_PK|Partner ID|Partner Name|Unit Price|CCY|Payment Term|Payment Method|Lead days|Agree YN|Description'
                        format='0|0|0|0|-2|0|0|0|0|0|0|0|0|3|0'
                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        check='||||||||||||||'
                        editcol='0|0|0|0|1|0|0|0|1|0|0|0|0|1|1'
                        widths='0|1500|2000|800|1500|0|1500|2000|1500|1500|1500|1500|1500|1500|1500'
                        sorting='T'
                        styles='width:100%; height:100%'
                        />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="width:100%; display:none" onenterkey="" />
<gw:textbox id="txtItemPK" styles="width: 100%;display: none" />
<gw:textbox id="txtItemCD" styles="width: 100%;display: none" />
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
<!------------------------------------------------------------------------------------>
</html>
