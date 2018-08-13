<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

var vnt_Click = true;
var vnt_Change = true;
var Insert      = 'F';

 function BodyInit()
 {   
    System.Translate(document);
    txt_BUSPARTNER_ID.SetEnable(0); 
    txt_BUSPARTNER_NAME.SetEnable(0);
    BindingDataList();
 }
function BindingDataList()
{   
    var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>"; 
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";
    var ls_data2     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0110','','') FROM DUAL")%>";
    var ls_data3    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE,'YYYYMMDD') FROM DUAL")%>";
    var ls_data4    = "<%=CtlLib.SetDataSQL("SELECT E.CODE FROM TCO_ABCODE E, TCO_ABCODEGRP F WHERE E.DEL_IF=0 AND F.DEL_IF=0 AND E.TCO_ABCODEGRP_PK=F.PK AND F.ID='ACBG0040' AND E.DEF_YN IN ('Y')")%>";
    lst_TCO_COMPANY_PK.SetDataText(ls_data);
    lst_CCY.SetDataText(ls_data1);
    lst_TAX_RATE.SetDataText(ls_data2);
    txt_Date.SetDataText(ls_data3); 
    txt_Curency_Book.SetDataText(ls_data4); 
    OnSearch();
    
}
function OnSearch()    
{
    DSO_Sel_Grid.Call();
}
function Popup_Search()
{
    var fpath = System.RootURL + "/standard/forms/60/01/60010010_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' ;
	o = System.OpenModal( fpath , 800 , 550 , 'resizable:yes;status:yes');
    if ( o != null )  
    {
        txt_TCO_BUSPARTNER_PK.text = o[0];//cust Pk
        txt_BUSPARTNER_ID.text     = o[1];//cust code
        txt_BUSPARTNER_NAME.text   = o[2];//cust name              	 	
    }
}

function OnReset()
{
    txt_TCO_BUSPARTNER_PK.text ="";//cust Pk
    txt_BUSPARTNER_ID.text = "";//cust code
    txt_BUSPARTNER_NAME.text  = "";//cust name  
}
function OnSelectCode()
{
    var ctrl = idGrid.GetGridControl();
	var i    = ctrl.Row;
    if( idGrid.rows>1 )
	{
        txt_OBJ_PK.text = idGrid.GetGridData(event.row, 2)
        
        flag='search';
        DSO_Con_Ploe_Entry.Call("SELECT");
     }
}
function OnChangCurrency()
{       
    if(dt_RECEIVEDATE.GetData()!="") txt_Date.text= dt_RECEIVEDATE.GetData();
    DSO_Pro_Get_Rate.Call();
}
function GetRateVAT(VATtext)
{
    var VAT_RATE
    if (VATtext=='none') 
    {
        VAT_RATE=0;					   
    }
    else
    {
        var r =new String(VATtext)                         
        VAT_RATE=Number(r.substring(0,r.length-1))/100;
    }							
    return VAT_RATE				
}
function OnEnter()
{	
	
}
var flag='';
function OnSave()
{
    flag='save';
    if (imgFile.oid != '')
	{
		txt_TCO_BPPHOTO_PK.text = imgFile.oid;
	}
    DSO_Con_Ploe_Entry.Call();
}
function OnDelete()
{
     if(confirm('Are you sure you want to delete ?'))
     {
        DSO_Con_Ploe_Entry.StatusDelete();
        flag='delete';
        DSO_Con_Ploe_Entry.Call();
     }
}
function OnChangeTax()
{
    var vnt_Tax     = 0;
    var vnt_Fvat    = 0;
    var vnt_Vat     = 0;    
    vnt_Tax = lst_TAX_RATE.GetData();
    
    alert(txt_TR_FAMT.GetData())
    
    vnt_Fvat    = Number(txt_TR_FAMT.GetData())*vnt_Tax/100;    
    vnt_Vat     = Number(txt_TR_AMT.GetData())*vnt_Tax/100;
    
   
    txt_TR_VAT_FAMT.SetDataText(vnt_Fvat)
    
    alert(txt_TR_VAT_FAMT.GetData())
    txt_TR_VAT_AMT.SetDataText(vnt_Vat)    
        
    //OnSumTrans();
    //OnSumBook();
}
function OnSumTrans()
{    
    var vnt_TOTAL_FAMT  = 0;    
    vnt_TOTAL_FAMT  = Number(txt_TR_FAMT.GetData()) + Number(txt_TR_VAT_FAMT.GetData());
    
    txt_TOTAL_FAMT.SetDataText("" + vnt_TOTAL_FAMT);
}
function OnSumBook()
{   
    var vnt_TOTAL_AMT  = 0;  
       
    vnt_TOTAL_AMT  = Number(txt_TR_AMT.GetData()) + Number(txt_TR_VAT_AMT.GetData());    
    txt_TOTAL_AMT.SetDataText("" + vnt_TOTAL_AMT);
}
function OnChangeRate()
{   
    var vnt_TR_AMT  = 0;
    
    vnt_TR_AMT  = Number(txt_TR_FAMT.GetData())*( Number(txt_EX_RATE.GetData())/Number(txt_Rate_Book.GetData()))
    
    onSumTrans();
    onSumBook();
}
function Numbers(e)
{
     
    var keynum;
    var keychar;
    var numcheck;
    keynum =event.keyCode;
  
    if(window.event) // IE
     {
     	keynum = e.keyCode;
     }
    else if(e.which) // Netscape/Firefox/Opera
    {
    	keynum = e.which;
    }
    keychar = String.fromCharCode(keynum);
    numcheck = /\d/;
    return numcheck.test(keychar);
}

function OnDataReceive(p_oData)
{      
    if(p_oData.id == "DSO_Pro_Get_Rate")
    {        
        txt_EX_RATE.SetDataText(txt_Rate.text);
        alert("tien trans : " + txt_EX_RATE.GetData())
        txt_Rate_Book.text="";        
        if(dt_RECEIVEDATE.GetData()!="") txt_Date.text= dt_RECEIVEDATE.GetData();        
        DSO_Pro_Get_Rate_Book.Call();
    } 
    if(p_oData.id == "DSO_Pro_Get_Rate_Book")
    {   
        alert("tien book : " + txt_Rate_Book.text)
    }
    if(p_oData.id == 'DSO_Con_Ploe_Entry')
    {
        if(flag=='save'||flag=='delete')
        {
            DSO_Sel_Grid.Call('SELECT');
        }
        else
        {
            imgFile.SetDataText(txt_TCO_BPPHOTO_PK.text);
        }
    }
}  

function OnAdd()
{
    imgFile.SetDataText("");
    DSO_Con_Ploe_Entry.StatusInsert();
}
</script>
 
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0">

<gw:data id="DSO_Sel_Grid"  onreceive=""> 
    <xml> 
        <dso id="1" type="grid" function="AC_SEL_60010040_PLOE_GRID">
            <input bind="idGrid" >                    
                <input bind="lst_TCO_COMPANY_PK" />
                <input bind="txt_SOBJ_CD" />
                <input bind="txt_SOBJ_NM" />
            </input>
            <output bind="idGrid" />
        </dso>                    
    </xml>
</gw:data>

<gw:data id="DSO_Pro_Get_Rate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_RATE" > 
                <input> 
                     <input bind="txt_Date"/>
                     <input bind="lst_TCO_COMPANY_PK"/>
                     <input bind="lst_CCY" />
                     <input bind="txt_Row"/>
                </input>  
                <output>  
                     <output bind="txt_Rate"/>
                     <output bind="txt_Row"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>

<gw:data id="DSO_Pro_Get_Rate_Book" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_RATE" > 
                <input> 
                     <input bind="txt_Date"/>
                     <input bind="lst_TCO_COMPANY_PK"/>
                     <input bind="txt_Curency_Book" />
                     <input bind="txt_Row"/>
                </input>  
                <output>  
                     <output bind="txt_Rate_Book"/>
                     <output bind="txt_Row"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>

<gw:data id="DSO_Con_Ploe_Entry" onreceive="OnDataReceive(this)">
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34" function="ac_SEL_60010040_PLOE_ENTRY" procedure = "ac_UPD_60010040_PLOE_ENTRY">
          <inout> 
            <inout bind="txt_OBJ_PK"/>
            <inout bind="lst_TCO_COMPANY_PK"/>
            <inout bind="txt_TCO_BUSPARTNER_PK"/>
            <inout bind="txt_TCO_BPPHOTO_PK"/>
            <inout bind="txt_OBJ_CD"/>
            
            <inout bind="txt_CHARGER"/> 
            <inout bind="txt_OBJ_NM"/> 
            <inout bind="txt_VEHICLE_NO"/> 
            <inout bind="dt_RECEIVEDATE"/> 
            <inout bind="txt_OBJ_LNM"/> 
            
            <inout bind="txt_QTY"/> 
            <inout bind="txt_OBJ_KNM"/>
            <inout bind="txt_AUTOMODEL"/>
            <inout bind="txt_BUSPARTNER_ID"/>
            <inout bind="txt_BUSPARTNER_NAME"/>
            
            <inout bind="txt_CHASSIS"/>
            <inout bind="txt_ENGINE"/>
            <inout bind="lst_CCY"/>
            <inout bind="txt_EX_RATE"/> 
            <inout bind="txt_Rate_Book"/>
            <inout bind="lst_TAX_RATE"/>
            
            <inout bind="txt_AUTOTYPE"/>
            <inout bind="txt_TR_FAMT"/>
            <inout bind="txt_TR_AMT"/>
            <inout bind="txt_TR_VAT_FAMT"/>
            <inout bind="txt_TR_VAT_AMT"/>
            
            <inout bind="txt_TOTAL_FAMT"/>
            <inout bind="txt_TOTAL_AMT"/>
            <inout bind="txt_CAPACITY"/>
            <inout bind="txt_AUTOPOWER"/>
            <inout bind="txt_GEARBOX"/>
            
            <inout bind="chk_AUTO_ABS"/>
            <inout bind="txt_SPEED"/>
            <inout bind="txt_SEAT_NO"/>
            <inout bind="txt_COLOR"/>
          </inout>
        </dso> 
    </xml> 
</gw:data>
    
<!------------------------ Main Table -------------------------->    



<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
<tr valign="top" style="height:100%">    
    <td style="width:25%;height:100%" align ="top">
        <table style="width:100%;height:100%"  align="top" border=1>
            <tr valign="top" style="width:100%">
                <td>
                    <table style="width:100%">
                        <tr>
                            <td width="10%" align="center">Company</td>
	                        <td width="15%" align="left"  valign="top">
	                            <gw:list id="lst_TCO_COMPANY_PK" value="" styles="width:100%" onchange="OnSearch()" ></gw:list></td>
                        </tr>
                        <tr>
                            <td width="10%" align="center">Object Code</td>
	                        <td width="15%" align="left"  valign="top">
	                            <gw:textbox id="txt_SOBJ_CD"  text=""  styles="width:100%" csstype="mandatory" onenterkey="OnSearch()"/></td>
                        </tr>
                        <tr>
                            <td width="10%" align="center">Object Name</td>
	                        <td width="15%" align="left"  valign="top"><gw:textbox id="txt_SOBJ_NM"  text=""  styles="width:100%" csstype="mandatory"/></td>
                        </tr>                    
                    </table>
                </td>                
            </tr>
            <tr>
                <td  style="width:100%;height:100%" align = top >
		            <div style="width:100%; height:96%; overflow:auto;">
		        <gw:datagrid    
                        id="idGrid"  
			            header   = "Code|Object Name|_PK"
			            format   = "0|0|0"
			            aligns   = "0|0|0"
			            defaults = "||||" 
			            editcol  = "0|0|0"   
			            widths   = "100|200|0"
			            styles   = "width:100%;height:100%"   
			            sorting  = "T"
			            oncellclick="OnSelectCode()"
                        paging="true" pageview="15"
			            param    = "0,1,2"  /> 
                    </div>
	            </td>
            </tr>
        </table>
    </td>    
    
    <td style="width:75%" align ="top" >        
        <table style="width:100%"  align="top" border=0>
            <tr>
                <td width="15%" align="right">&nbsp;</td>
                <td width="15%" align="right">&nbsp;</td>
                <td width="15%" align="right">&nbsp;</td>
                <td width="15%" align="right">&nbsp;</td>
                <td width="2%" align="right">&nbsp;</td>
                <td width="2%" align="right">&nbsp;</td>
                <td width="2%"align="right"><gw:imgBtn img="new"     alt="New"     id="idBtnAdd" 	styles="width:100%" onclick="OnAdd()" /></td>
			    <td width="2%"align="right"><gw:imgBtn img="save"    alt="Save"    id="idBtnUpdate" 	styles="width:100%" onclick="OnSave()" /></td>
			    <td width="2%"align="right"><gw:imgBtn img="delete"  alt="Delete"  id="idBtnDelete" 	styles="width:100%" onclick="OnDelete()" /></td> 
			    <td width="2%"align="right"><gw:imgBtn img="printer" alt="Report"  id="idBtnPrinter" styles="width:100%" onclick="OnPrint()" /></td> 
			    <td width="2%"align="right"><gw:imgBtn img="printer" alt="Report"  id="idBtnPrinter" styles="width:100%" onclick="OnPrint()" /></td> 
			    <td width="2%"align="right"><gw:imgBtn img="printer" alt="Report"  id="idBtnPrinter" styles="width:100%" onclick="OnPrint()" /></td> 
                                
            </tr>
            <tr>
                <td width="10%" align="right">Object Code </td>
                <td width="15%" align="left"><gw:textbox id="txt_OBJ_CD"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
                <td width="15%" align="right">Chager / Tài xế </td>
                <td width="15%" align="left"><gw:textbox id="txt_CHARGER"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
                <td width="2%"align="right">&nbsp;</td>
                <td width="2%"align="right">&nbsp;</td>
                <td colspan=6 rowspan=4 align="center"><gw:image id="imgFile" table_name="TAC_ABPL_OBJ_PHOTO" procedure="ac_upd_60010040_photo"  view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:130;height:130"  />
                                
            </tr>
            <tr>
                <td width="10%" align="right">Object Name </td>
                <td width="15%" align="left"><gw:textbox id="txt_OBJ_NM"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
                <td width="15%" align="right">Vehicle No / Số xe</td>
                <td width="15%" align="left"><gw:textbox id="txt_VEHICLE_NO"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
            </tr>
            
            <tr>
                <td width="10%" align="right">Object LName </td>
                <td width="15%" align="left"><gw:textbox id="txt_OBJ_LNM"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
                <td width="15%" align="right">Quantity / Số lượng </td>
                <td align="left"><gw:textbox id="txt_QTY"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
            </tr>
            
            <tr>
                <td width="10%" align="right">Object KName </td>
                <td width="15%" align="left"><gw:textbox id="txt_OBJ_KNM"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
                <td width="15%" align="right">Model </td>
                <td width="15%" align="left"><gw:textbox id="txt_AUTOMODEL"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
            </tr>      
            <tr>
                <td width="10%" align="right">Vendor Name / Hãng xe </td>
                <td width="15%" align="left"><gw:textbox id="txt_BUSPARTNER_ID"  text=""  styles="width:100%" /></td>
                <td colspan=2   align="left"><gw:textbox id="txt_BUSPARTNER_NAME"  text=""  styles="width:100%" /></td>
                <td ><gw:imgBtn id="btn_Cus"     img="popup"     alt="List Customer"  onclick="Popup_Search()" /></td>
                <td ><gw:imgBtn id="btn_Reset"   img="reset"     alt="Reset Customer" onclick="OnReset()" /></td>
                <td width="2%"align="right">&nbsp;</td>
            </tr>
                             
        </table>
        
        <table width="100%" align="top" border=0>
            <td width="100%">
                <gw:tab id="idTab_Child"  onclick ="">							        
                    <table name="Tab 1"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:190;" >
                        <tr valign="top">
	                        <td>
	                            <table width="100%" cellpadding = "0" cellspacing = "0" border = "0" >
	                                <tr>
                                        <td colspan=4>&nbsp;</td>
                                    </tr>
	                                <tr>
                                        <td width="15%" align="right">Receive date / Ngày nhận xe </td>
                                        <td width="15%" align="left"><gw:datebox id="dt_RECEIVEDATE" lang="1" nullaccept/></td> 
                                        <td width="15%" align="right">&nbsp;</td>
                                        <td width="15%" align="left">&nbsp;</td>
                                    </tr>
	                                <tr>
                                        <td width="15%" align="right">Chassis / Số khung </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_CHASSIS"  text=""  styles="width:100%" /></td>
                                        <td width="15%" align="right">Engine / Số máy </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_ENGINE"  text=""  styles="width:100%" /></td>                                        
                                    </tr>                                   
                                    <tr>
                                        <td width="15%" align="right">Currency / Loại tiền </td>
                                        <td width="15%" align="left"><gw:list id="lst_CCY" value="" styles="width:100%" onchange="OnChangCurrency()" ></gw:list></td>
                                        <td width="15%" align="right">Ex.Rate / Tỷ giá </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_EX_RATE"  text=""  styles="width:100%"/></td>                                        
                                    </tr>
                                    <tr>
                                        <td width="15%" align="right">Tax Rate / Thuế suất </td>
                                        <td width="15%" align="left"><gw:list id="lst_TAX_RATE" value="" styles="width:100%" OnChange="OnChangeTax()" ></gw:list></td>
                                        <td width="15%" align="right">Type / Kiểu mẫu </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_AUTOTYPE"  text=""  styles="width:100%" /></td>                                        
                                    </tr>
                                    <tr>
                                        <td width="15%" align="right">Amount / Trị giá </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TR_FAMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R" OnChange="OnSumTrans()"/></td>
                                        <td width="15%" align="right">Amount / Trị giá ghi sổ </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TR_AMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R" OnChange="OnSumBook()"/></td>                                        
                                    </tr>                                    
                                    <tr>
                                        <td width="15%" align="right">VAT / Thuế </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TR_VAT_FAMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>
                                        <td width="15%" align="right">VAT / Thuế ghi sổ</td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TR_VAT_AMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>                                        
                                    </tr>
                                    <tr>
                                        <td width="15%" align="right">Total Amount / Tổng tiền </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TOTAL_FAMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>
                                        <td width="15%" align="right">Total Amount / Tổng tiền ghi sổ </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_TOTAL_AMT"  text=""  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>                                        
                                    </tr>
	                            </table>	                            
                            </td>
                        </tr>
                    </table>    
                    <table name="Tab 2"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:190;" >
                        <tr valign="top">
	                        <td>
	                            <table width="100%" cellpadding = "0" cellspacing = "0" border = "0" >
	                                 <tr>
                                        <td colspan=4>&nbsp;</td>
                                    </tr>
	                                <tr>
                                        <td width="15%" align="right">Capacity / Dung tích </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_CAPACITY"  text=""  styles="width:100%" /></td>
                                        <td width="15%" align="right">Power / Công suất </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_AUTOPOWER"  text=""  styles="width:100%" /></td>                                        
                                    </tr>                                  
                                    <tr>
                                        <td width="15%" align="right">Gear Box / Hộp số </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_GEARBOX"  text=""  styles="width:100%" /></td>
                                        <td width="15%" align="right">ABS </td>
                                        <td width="15%" align="left"><gw:checkbox id="chk_AUTO_ABS"  value="Y" defaultvalue="Y|N" onclick=""/> </td>
                                    </tr>
                                    <tr>
                                        <td width="15%" align="right">Speed / Tốc độ </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_SPEED"  text=""  styles="width:100%" /></td>
                                        <td width="15%" align="right">Size / Kích thước </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_AUTO_SIZE"  text=""  styles="width:100%" /></td>                                        
                                    </tr>
                                    <tr>
                                        <td width="15%" align="right">Seat No / Số chỗ ngồi </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_SEAT_NO"  text=""  styles="width:100%"/></td>
                                        <td width="15%" align="right">Color / Màu xe </td>
                                        <td width="15%" align="left"><gw:textbox id="txt_COLOR"  text=""  styles="width:100%" /></td>                                        
                                    </tr>
	                            </table>	                            
                            </td>
                        </tr>
                    </table>                
                </gw:tab>
            </td>
        </table>
    </td>
</tr>    
</table>

    <gw:textbox id="txt_OBJ_PK"                     style="display:none"/>
    <gw:textbox id="txt_TCO_BUSPARTNER_PK"          style="display:none"/>
    <gw:textbox id="txt_TCO_BPPHOTO_PK"             style="display:none"/>
    <gw:textbox id="txt_Date"                       style="display:none"/>
    <gw:textbox id="txt_Rate"                       style="display:none"/> 
    <gw:textbox id="txt_Row"                        style="display:none"/> 
    <gw:textbox id="txt_Rate_Book"                       style="display:none"/> 
    <gw:textbox id="txt_Curency_Book"                        style="display:none"/> 
  
</body>

</html>