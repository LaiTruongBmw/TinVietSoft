<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Correct Bill</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    var data="";
    data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT' AND CODE IN ('POINT-01','POINT-02','POINT-03','POINT-04','POINT-05','POINT-06','POINT-08') ") %> ";	
	lstLocation.SetDataText(data);
	//lstLocation.value = "3";
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT' AND CODE IN ('POINT-01','POINT-02','POINT-03','POINT-04','POINT-05','POINT-06','POINT-08') ")%>"; 
	grdInvoice.SetComboFormat(9,data);
	grdInvoice.SetComboFormat(8,"#Y;COLLECTOR|#N;SEND BILL");
	
	OnSearch();
}
var G_PK=0,
G_tgm_invoice_pk=1,
G_item_pk=2,
G_No=3,
G_ItemCode=4,
G_ItemName=5,
G_Unit=6,
G_Quantity=7,
G_Price=8,
G_PriceUSD=9,
G_Amount=10;
var f_lag='select';
function OnSearch()
{
    dso_htfo00040_correct_invoiceM.Call("SELECT");
}
function OnShowInvoiceD()
{
    if (grdInvoice.row > 0 )
        {
            txtMasterPK.text = grdInvoice.GetGridData(grdInvoice.row,0);
            data_jarc00050_invoiceD.Call("SELECT");
        }
}
function OnpopupName()
{
    if(event.col == 5)//Golfer name
    {
         var path = System.RootURL + "/standard/forms/ho/25/60250020_correct_popup.aspx";
		 var object = System.OpenModal( path ,500 , 600 ,  'resizable:yes;status:yes');
		 if ( object != null )
		 {
			var arrTemp;
			arrTemp = object[0];
			grdInvoice.SetGridText(grdInvoice.row,1,arrTemp[0])//tht_room_allocate_pk
			grdInvoice.SetGridText(grdInvoice.row,4,arrTemp[1])//room no
			grdInvoice.SetGridText(grdInvoice.row,5,arrTemp[2])//guest name
			if(Number(arrTemp[0])<0){
				grdInvoice.SetGridText(grdInvoice.row,8,'Y')//pay method
			}
		 }
    }      
}
function gridOnafteredit(){
	if(event.col == 7){
		if(isNaN(Number(grdInvoice.GetGridData(event.row, event.col)))){
			grdInvoice.SetGridText(event.row, event.col, txtTempValue.text); txtTempValue.text = ""; alert("Please input number!"); return false;}
		if(Number(grdInvoice.GetGridData(event.row, event.col)) < 0){
			grdInvoice.SetGridText(event.row, event.col, txtTempValue.text); txtTempValue.text = ""; alert("Please input value more than 0!"); return false;}
	}
}
function gridOnbeforeedit(){
	if(event.col == 7){
		txtTempValue.text = grdInvoice.GetGridData(event.row, event.col);
	}
}
function OnSave()
{
    f_lag='save';
    dso_htfo00040_correct_invoiceM.Call();
     //data_jarc00050_invoiceD.Call();
}
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_item_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
function OnNew()
{
    if(txtMasterPK.GetData()!="")
    {
        var path = System.RootURL + '/standard/forms/ho/25/60250060_popup_item.aspx?loc=' + lstLocation.GetData();//purchase_yn=Y
		var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		 
		if ( object != null )
		{
			var arrTemp;
			if(grdInvoice.row < 1) return false;
			for( var i=0; i < object.length; i++)
			{	
				arrTemp = object[i];
				if(grdInvoiceD.rows == 1){
					grdInvoiceD.AddRow();
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_tgm_invoice_pk, txtMasterPK.GetData());//Master_pk
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_item_pk,   arrTemp[0]);//item_pk	    
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_ItemCode, arrTemp[1]);//item_code	    
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_ItemName, arrTemp[2]);//item_name	    
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Unit,    arrTemp[4]);//item_uom
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Quantity,   '1');//quantity
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Price,   arrTemp[5]);//Price 
					grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Amount,   arrTemp[5]);//Price         
				}else{
					for(var j = 1; j < grdInvoiceD.rows; j++){
						if(!CheckDataExist(grdInvoiceD,arrTemp[0])){
							grdInvoiceD.AddRow();
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_tgm_invoice_pk, txtMasterPK.GetData());//Master_pk
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_item_pk,   arrTemp[0]);//item_pk	    
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_ItemCode, arrTemp[1]);//item_code	    
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_ItemName, arrTemp[2]);//item_name	    
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Unit,    arrTemp[4]);//item_uom
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Quantity,   '1');//quantity
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Price, arrTemp[5]);//Price 
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_PriceUSD, arrTemp[5]);
							grdInvoiceD.SetGridText( grdInvoiceD.rows-1, G_Amount, arrTemp[5]);//Price       
						}
						else
							{
								//alert("Tên hàng hoá "+arrTemp[2]+" Da ton tai!.");
								//j = grdInvoiceD.rows;
							}
					}
				}
			}
		} 
      } 
	else{alert("Please select item master before add new detail item");}
}
function OnDelete(pos)
 {
     switch(pos)
     {
        case 1:
            if(grdInvoice.row > 0){
                var remarklenght=0;
                    remarklenght=grdInvoice.GetGridData(grdInvoice.row,10);
                if(remarklenght.length > 10)
                {
                    if ( confirm( "Do you want to delete bill "+ grdInvoice.GetGridData(grdInvoice.row,3)+" ?" ) )
                    {
                        f_lag='delete';
				        grdInvoice.DeleteRowAt(grdInvoice.row);
				        dso_htfo00040_correct_invoiceM.Call();  
                    } 
                }
                else
                {
                   alert('Please, input remark greater than 10 characters!') ; 
                }
            }
            break;
        case 2: //search master
            var remarklenght=0;
                remarklenght=grdInvoiceD.GetGridData(grdInvoiceD.row,11);
             
			if(remarklenght.length > 10){
                if ( confirm( "Do you want item this row to delete?" )) {
				    grdInvoiceD.DeleteRow();
				    data_jarc00050_invoiceD.Call();
			    }
			}else{alert('Please, input remark at item greater than 10 characters!') ; }
        break;
     }
 }
function OnDataReceive(obj)
{
   switch (obj.id) 
    {
         case "dso_htfo00040_correct_invoiceM" :
            MandatoryColor();
            if(f_lag=='save' || f_lag=='delete')
            {
                    data_jarc00050_invoiceD.Call();
            }
            else
            {
               data_jarc00050_invoiceD.Call("SELECT");
			   f_lag='break';
            }
         break;
    }   
}
function OnReditQuantity()
{
    if(grdInvoiceD.col== 7)
    {   
        var price_Qty;
        /*if(Number(grdInvoiceD.GetGridData(grdInvoiceD.row, 12)) > Number(grdInvoiceD.GetGridData(grdInvoiceD.row, 7))){
            grdInvoiceD.SetGridText(grdInvoiceD.row, 7, grdInvoiceD.GetGridData(grdInvoiceD.row, 12));
            alert('Fristly, input remark at item greater than 10 characters!'); 
            return false;
        }*/
		if(grdInvoiceD.GetGridData(grdInvoiceD.row, 11)=="" )//remark
		{
            grdInvoiceD.SetGridText(grdInvoiceD.row, 7, grdInvoiceD.GetGridData(grdInvoiceD.row, 12));
            alert('Fristly, input remark at item greater than 10 characters!'); 
            return false;
        }
        price_Qty=(grdInvoiceD.GetGridData(grdInvoiceD.row, 7)*(grdInvoiceD.GetGridData(grdInvoiceD.row, 8)));
        grdInvoiceD.SetGridText(grdInvoiceD.row, 9,price_Qty);
    }
}
function MandatoryColor()
{
    if (grdInvoice.rows >1)
    {
		grdInvoice.SetCellBgColor( 1, 5 , grdInvoice.rows - 1, 5 , 0xCCFFFF );
    }
}
</script>

<body>
<!------------------------------------------------------->
<gw:data id="dso_htfo00040_correct_invoiceM" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,5,7,8,10" function="ht_sel_60250060_correct_ivm" procedure="ht_upd_60250060_invoice_m">
                <input>
                    <input bind="dtfr" />
                    <input bind="dtto" />
                    <input bind="lstLocation" />
                    <input bind="txtName" />
                </input>
                <output bind="grdInvoice" />
            </dso>
        </xml>
    </gw:data>
 <!------------------------------------------------------->
 <gw:data id="data_jarc00050_invoiceD" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,11" function="ht_sel_60250060_invoice_d" procedure="ht_upd_60250060_invoice_d">
                <input>
                    <input bind="txtMasterPK" />
                </input>
                <output bind="grdInvoiceD" />
            </dso>
        </xml>
    </gw:data>
 <!------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 100%;">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 2%">
                        <td >
                        <fieldset>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 100%">
                                    <td style="width: 4%;">
                                        Date
                                    </td>
                                    <td style="width: 6%;">
                                        <gw:datebox id="dtfr" lang="1" onchange="OnSearch()" />
                                    </td>
                                    <td width="2%">~</td>
                                    <td width="6%" >
                                        <gw:datebox id="dtto"  lang="1" onchange="OnSearch()" />
                                    </td>

                                    <td style="width: 7%;">
                                        Location
                                    </td>
                                    <td style="width: 20%;">
                                        <gw:list id="lstLocation" styles="color:blue;width:100%" onchange="OnSearch()" />
                                    </td>
                                    <td style="width: 7%;" align="right">
                                        Invoice#
                                    </td>
                                    <td style="width: 20%;">
                                        <gw:textbox id="txtName" onenterkey="OnSearch()" />
                                    </td>
                                    <td style="width: 30%;">
                                    </td>
                                    <td align="right" style="width: 3%">
                                        <gw:imgbtn id="idSearch" alt="search" img="search" onclick="OnSearch()" />
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn id="btnSaveMaster" img="save" alt="Save" onclick="OnSave()" />
                                    </td>
                                    <td style="width:2%;">
                                    </td>
                                    <td align="right" style="width: 3%">
                                         <gw:imgbtn id="idDeleteM" alt="delete" img="delete" onclick="OnDelete(1)" />
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 58%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 100%">
                                    <td>
                                        <gw:grid id         ="grdInvoice"
                                            header          ="_PK|_THT_ROOM_ALLOCATE_PK|Date|Invoice#|Room#|Guest Name|Amount|Discount(%)|Pay method|Location|Remark|_Rate"
                                            format          ="0|0|4|0|0|0|-0|0|0|0|0|0"
                                            aligns          ="0|0|1|1|1|0|0|3|0|0|0|0" 
                                            editcol         ="0|0|0|0|0|0|0|1|1|0|1|1"
                                            widths          ="0|0|0|0|0|0|0|0|0|0|0|0"
                                            sorting         ='T' 
                                            autosize        ='T' 
                                            styles          ="width:100%; height:100%" 
                                            oncellclick     ="OnShowInvoiceD()" 
                                            oncelldblclick  ="OnpopupName()"
											onafteredit 	="gridOnafteredit();"
											onbeforeedit	="gridOnbeforeedit();"
											/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td>
                        <fieldset>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 100%">
                                    <td style="width: 94%;">
                                    </td>
                                    <td align="right" style="width: 3%">
                                        <gw:imgbtn id="idBtnNewM" img="new" text="Add" alt="New" styles='width:100%' onclick="OnNew()" />
                                    </td>
                                    <td align="right" style="width: 3%">
                                         <gw:imgbtn id="idDelete" alt="delete" img="delete" onclick="OnDelete(2)" />
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 38%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 100%">
                                    <td>
                                        <gw:grid    id="grdInvoiceD" 
                                                    header="_PK|_tgm_invoice_pk|_item_pk|No|Item Code|Item Name|Unit|Quantity|Price|_PriceUSD|Amount|Remark|_O_Quantity"
                                                    format="0|0|0|0|0|0|0|-2|-0|-2|-0|0|-0" 
                                                    aligns="0|0|0|0|0|0|0|3|3|3|3|0|0" 
                                                    editcol="0|0|0|0|0|0|0|1|0|0|0|1|0" sorting='T'
                                                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' autosize='T' 
                                                    styles="width:100%; height:100%" onafteredit="OnReditQuantity()"
                                             />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtMasterPK" styles="width:100%; display:none" />
    <gw:textbox id="txtInvoiceM_PK" styles="width:100%; display:none" />
	<gw:textbox id="txtTempValue"   styles="width:100%; display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
