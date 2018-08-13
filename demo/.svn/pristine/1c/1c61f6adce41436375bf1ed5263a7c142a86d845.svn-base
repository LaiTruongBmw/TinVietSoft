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
 var G_CHECK        =0,
    G_REQ_DT        =1,
    G_PR_NO         =2,
    G_PK            =3,
    G_SEQ           =4,
    G_TCO_ITEM_PK   =5,
    G_ITEM_CODE     =6,
    G_ITEM_NM       =7,
    G_REQ_QTY       =8,
    G_UOM           =9,
    G_UNIT_PRICE    =10,
    G_AMT           =11;
 
var G1_CHECK            = 0,
    G1_TCO_ITEM_PK      = 1,
    G1_ITEM_CODE        = 2,
    G1_ITEM_NAME        = 3,
    G1_UNIT             = 4,
    G1_PARTNER_PK       = 5,
    G1_PARTNER_ID       = 6,
    G1_PARTNER_NAME     = 7,
    G1_ST_PRICE         = 8,
    G1_PAYMENT_TERM     = 9,
    G1_PAYMENT_METHOD   = 10,
    G1_LEADS_DAY        = 11,
    G1_DELI_TYPE        = 12,
    G1_CCY              = 13;
 
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
    G2_REMARK        = 14 ,
    G2_ARR_PK        = 15 ;

 
//----------------------------------------------------------------------------------------
function BodyInit()
 {    
    System.Translate(document);  // Translate to language session
    //-------------------------    
    BindingDataList(); 
   
 }
//---------------------------------------------------------------------------------------------------
 function BindingDataList()
 {  
     var data;
     
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_PAYMENT_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_PAYMENT_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPO2002' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_DELI_TYPE,data);     
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdPrice.SetComboFormat(G1_CCY,data);  
   
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMap.SetComboFormat(G2_PAY_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMap.SetComboFormat(G2_PAY_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPO2002' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
       
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
            data_epbp00191.Call("SELECT");
        break;
    
        case 'PRICE':
            if(grdPR.row>0)
            {
                data_epbp00191_1.Call("SELECT");                       
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

//-------------------------------------------------------------------------------------
var array_pr_pk = '';
var item_pk    = ''; 
var sumqty     = 0;
function onValidate()
{        
    array_pr_pk = '';
    item_pk    = '';
    sumqty  = 0;
    for(var i=1; i< grdPR.rows; i++)
    {
        if (grdPR.GetGridData(i, G_CHECK) == -1)
         {
            if ( item_pk != '' && item_pk != grdPR.GetGridData(i, G_TCO_ITEM_PK) )
            {
                alert('Diffrence Item!');
                return;
            }
            
            txtItemPK.text = grdPR.GetGridData(grdPR.row,G_TCO_ITEM_PK);
            txtItemCD.text = grdPR.GetGridData(grdPR.row,G_ITEM_CODE);
            txtItem.text = grdPR.GetGridData(grdPR.row,G_ITEM_NM);
                
            array_pr_pk = array_pr_pk + grdPR.GetGridData(i, G_PK) + ',';
            sumqty = sumqty + Number(grdPR.GetGridData(i, G_REQ_QTY));
            item_pk = grdPR.GetGridData(i, G_TCO_ITEM_PK);         
        }
    }
    array_pr_pk = array_pr_pk.substring(0, array_pr_pk.length-1); 
    if(item_pk != txtItemPK.text)
    {
        txtItemPK.text = item_pk;
        data_epbp00191_1.Call("SELECT");   
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
           
           grdMap.SetGridText(grdMap.rows-1,G2_REQ_QTY,sumqty);
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_PK,grdPrice.GetGridData( i,G1_PARTNER_PK));
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_ID,grdPrice.GetGridData( i,G1_PARTNER_ID));
           grdMap.SetGridText(grdMap.rows-1,G2_PARTNER_NM,grdPrice.GetGridData( i,G1_PARTNER_NAME));
           grdMap.SetGridText(grdMap.rows-1,G2_LEAD_DAY,grdPrice.GetGridData( i,G1_LEADS_DAY));
           
           grdMap.SetGridText(grdMap.rows-1,G2_PAY_TERM,grdPrice.GetGridData( i,G1_PAYMENT_TERM));
           grdMap.SetGridText(grdMap.rows-1,G2_PAY_METHOD,grdPrice.GetGridData( i,G1_PAYMENT_METHOD));     
           grdMap.SetGridText(grdMap.rows-1,G2_UNIT_PRICE,grdPrice.GetGridData( i,G1_ST_PRICE));
           grdMap.SetGridText(grdMap.rows-1,G2_ARR_PK,array_pr_pk);
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
    <gw:data id="data_epbp00191" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_epbp00191" > 
                  <input bind="grdPR" >
				    <input bind="txtPRNo" />
				    <input bind="dtFrom" />
				    <input bind="dtTo" />
                    <input bind="txtItem" />
				  </input> 
                <output bind="grdPR" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdPrice---------------------------------------->
    <gw:data id="data_epbp00191_1" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_epbp00191_1" > 
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
            <td id="left" style="width: 45%">
                <table style="width: 100%; height: 100%">
                    <tr style="height:5%">
                        <td align="left"  colspan="4" id="idPRDate" style="width: 10%; white-space: nowrap">
                            P/R Date
                         <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                       
                    </tr>
                   <tr style="height:5%">
                            <td style="width: 10%" align="right">
                                PR No
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtPRNo" styles="width:100%" onenterkey="OnSearch('ITEM')" />
                            </td>
                            <td style="width: 10%" align="right">
                                Item
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('ITEM')" />
                            </td>
                             <td style="width: 1%" align="right">
                                <gw:button id="btnPRSearch" img="search" alt="Search" onclick="OnSearch('ITEM')" />
                            </td>
                    </tr>                                        
                    <tr style="height: 90%">
                            <td colspan="6">
                                    <gw:grid id='grdPR'
                                    header='Select|Req Date|PR No|_PK|_Seq|_TCO_ITEM_PK|Item Code|Item Name|Req Qty|UOM|Unit Price|Amount'
                                    format='3|4|0|0|0|0|0|0|1|0|1|1'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0'
                                    check='|||||||||||'
                                    editcol='1|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='800|1200|1500|0|0|0|1500|2000|1500|800|1500|1500'
                                    sorting='T'
                                    onafteredit="onValidate()"
                                    styles='width:100%; height:100%'
                                    />
                            </td>
                    </tr>                      
                </table>
            </td>
            <td id="right" style="width: 55%">
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
                                widths='1000|0|1500|2000|0|0|1500|2000|1500|1500|1500|1500|1500|1500'
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
                        header='_TCO_ITEM_PK|Item Code|Item Name|UOM|Req Qty|_BUSPARTNER_PK|Partner ID|Partner Name|Unit Price|CCY|Payment Term|Payment Method|Lead days|Agree YN|Description|_arr_pk'
                        format='0|0|0|0|-2|0|0|0|0|0|0|0|0|3|0|0'
                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        check='|||||||||||||||'
                        editcol='0|0|0|0|1|0|0|0|1|0|0|0|0|1|1|1'
                        widths='0|1500|2000|800|1500|0|1500|2000|1500|1500|1500|1500|1500|1500|1500|0'
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
