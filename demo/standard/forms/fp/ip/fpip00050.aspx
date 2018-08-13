<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>

<head id="Head1" runat="server">
    <title>Material Plan Checking</title>
</head>

<script>
/*grdSOCons*/
var so_Cons_qty         = 6,
    so_After_qty        = 7,
    so_Booked_qty       = 8,
    so_MR_qty           = 9,
    so_PO_qty           = 10,
    so_In_qty           = 11,
    so_Out_qty          = 12;
/*grdDetailCons*/
var  
    detail_sod_no       = 0,
    detail_mas_tbl      = 1,
    detail_mas_pk       = 2,
    detail_de_tbl       = 3,
    detail_de_pk        = 4,
    detail_prod_pk      = 5,
    detail_prod_code    = 6,
    detail_prod_nm      = 7,
    detail_prod_uom     = 8,
    detail_prod_qty     = 9,
    detail_mat_pk       = 10,
    detail_mat_code     = 11,
    detail_mat_nm       = 12,
    detail_mat_uom      = 13,
    detail_sourc_type   = 14,
    detail_BOM_Qty      = 15,
    detail_Cons_qty     = 16,
    detail_After_qty    = 17,
    detail_Booked_qty   = 18,
    detail_MR_qty       = 19,
    detail_PO_qty       = 20,
    detail_In_qty       = 21,
    detail_Out_qty      = 22;
    detail_PK           = 24;
    
var str 
//--------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
     OnRadioChange();
     dtPlanTo.SetDataText(System.AddDate(dtPlanTo.GetData(),+7));
     dtTo.SetDataText(System.AddDate(dtTo.GetData(),+7));
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0080','','') FROM DUAL" )%>";    
    lstOrderStatus1.SetDataText(data);
    lstOrderStatus1.value = '' ;
    //   System.Translate(document); 
    GridFormat()
    GridInit(1);
    GridInit(2)
}
function GridFormat()
{
    var trl
    trl=divGrid2.GetGridControl();
    for( i = 2 ; i< divGrid2.cols ; i++ )
      {	
        trl.ColFormat(i)           = "###,###,###,###,###.##";
      }
 
}
function GridInit(obj)
{
    if (obj==1)
    {
         var dayNo = dtPlanTo.GetData() - dtPlanFrom.GetData()
         if(dayNo>=0)
         {
             divGrid2.GetGridControl().FrozenCols = 2;
             divGrid2.GetGridControl().Cell( 0, 0, 0, 0, 0 )='Material'
             divGrid2.GetGridControl().Cell( 0, 0, 1, 0, 1 )='UOM'
             var no = dayNo>30?30:dayNo
             for (var i =0 ; i<=no; i++ )
             {
                 var colum = System.AddDate(dtPlanFrom.GetData(),+i)
                 divGrid2.GetGridControl().Cell( 0, 0, i+2, 0, i+2 ) = colum.substr(6,2)+"/" + colum.substr(4,2)+ "/" + colum.substr(0,4);
                 divGrid2.GetGridControl().ColHidden(i+2)=false
             }
             divGrid2.GetGridControl().Cell( 0, 0, no+3, 0, no+3 )='Total'
             divGrid2.GetGridControl().ColHidden(no+3)=false
             for( i = no+4 ; i< divGrid2.cols ; i++ )
             {
                  divGrid2.GetGridControl().ColHidden(i)=true
             }
         }       
     }else
     {
        var dayNo = dtTo.GetData() - dtFrom.GetData()
         if(dayNo>=0)
         {
             gridMaterial.GetGridControl().FrozenCols = 2;
             gridMaterial.GetGridControl().Cell( 0, 0, 0, 0, 0 )='Material'
             gridMaterial.GetGridControl().Cell( 0, 0, 1, 0, 1 )='UOM'
             var no = dayNo>30?30:dayNo
             for (var i =0 ; i<=no; i++ )
             {
                 var colum = System.AddDate(dtFrom.GetData(),+i)
                 gridMaterial.GetGridControl().Cell( 0, 0, i+2, 0, i+2 ) = colum.substr(6,2)+"/" + colum.substr(4,2)+ "/" + colum.substr(0,4);
                 gridMaterial.GetGridControl().ColHidden(i+2)=false
             }
             gridMaterial.GetGridControl().Cell( 0, 0, no+3, 0, no+3 )='Total'
             gridMaterial.GetGridControl().ColHidden(no+3)=false
             for( i = no+4 ; i< gridMaterial.cols ; i++ )
             {
                  gridMaterial.GetGridControl().ColHidden(i)=true
             }
         }       
     }
     
}
//-----------------------------------------------------
function OnSearch(id)
{
    switch(id)
    {
        case 1:
            GridInit(1)
            fpip00050.Call('SELECT');
        break;
        case 2:
             fpip00050_1.Call('SELECT')
        break;
        case 3: //seach SO --Mat cons TAB
            dsbs00010.Call("SELECT")
        break;
        case 4 ://Search SO Consumption  --Mat Cons Tab
           if ( grdSearch.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
                if (rbFlag.value==0)//Search SO Consumption 
                {
                    fpbp00090_2.Call("SELECT")
                }else
                {
                    fpbp00090_1.Call("SELECT") //Search SO Detail Consumption
                }
        break;
        
    }
   
    
}
function OnDataReceive(obj)
{
    switch(obj.id)
     {
        
        case 'fpip00050': 
            txtRecord.text = divGrid2.rows -1 + " record(s)."
        break; 
     }
}
function onDetailClick()
{
    txtPlanPk.text=grdDetail.GetGridData(event.row,1)
    txtItemPk.text=grdDetail.GetGridData(event.row,6)
    GridInit(2)
    fpip00050_2.Call('SELECT')
}
function OnRadioChange()
 {
     if(rbFlag.value==0)
            {
              tblSO.style.display       = "" ;
              tblSO.style.tblItem       = "none" ;
              btnSave.style.display     = "none" ;
              btnUDelete1.style.display = "none" ;
              btnDelete1.style.display  = "none" ;
              btnAdd1.style.display     = "none" ;
              idBtnBOM.style.display    = "none" ;
              idBtnCrtMR.style.display  = "" ;
              //------------
              sOI.style.color       = "";
              sSO.style.color       = "red";              
            }
            else
            {
              tblSO.style.display       ="none" ;
              tblSO.style.tblItem       ="" ;
              btnSave.style.display     ="" ;
              btnUDelete1.style.display ="" ;
              btnDelete1.style.display  ="" ;
              btnAdd1.style.display     ="" ;
              idBtnBOM.style.display    ="" ;
              idBtnCrtMR.style.display  ="none" ;
              //-------------
              sOI.style.color       = "red";
              sSO.style.color       = "";               
            }
            //----------
            OnSearch(4);
            //----------
 }
 //---------------------------Mat Cons TAB-------------------------- 
   
 function OnProcess(id)
 {
    switch (id)
    {
        case 1:
             /*Make Consumption*/
              if ( grdSearch.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
             fpbp00090.Call();
        break;
        case 2:
             /*Create MR*/
              if ( grdSOCons.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
             fpbp00090_0.Call();
        break;
        
    }    
 }
 //-----------------------------------------------------------
function OnDataReceive(obj)
 {
   switch (obj.id)
   {
        case "fpbp00090":                                       //after make consumption
            alert(txtResult.text)
            /*Call Search SO Consumption*/
            OnSearch(2)
        break;
         case  "fpbp00090_0":                                       //after make consumption
            alert(txtResult.text)
            /*Call Search SO Consumption*/
            OnSearch(2)
        break;
        case "fpbp00090_3":
            txtConsumption_pk.text = "";
        break;
   }
 }
 //-------------------------Insert new consumption for so detail---------------------------
function AddConsumption()
{
    if( grdDetailCons.rows > 1)
    {
        if(grdDetailCons.row > 0)
        {
           var sod_no,sod_pk,prod_pk, prod_code, prod_name, prod_uom, prod_qty
           
           sod_no    = grdDetailCons.GetGridData( grdDetailCons.row, detail_sod_no    );
           sod_pk    = grdDetailCons.GetGridData( grdDetailCons.row, detail_de_pk     );
           prod_pk   = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_pk   );
           prod_code = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_code );
           prod_name = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_nm   );
           prod_uom  = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_uom  );
           prod_qty  = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_qty  );
           /***************************/
            var path = System.RootURL + "/form/fp/ab/PopUpGetItem.aspx?";
	        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	        var arrTemp;
	        if (obj!=null)
	        {
	            for(var i =0 ; i < obj.length; i++)
	            {
	                arrTemp = obj[i];
	                grdDetailCons.AddRow()
	                 
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_sod_no,  sod_no);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mas_tbl, 'TSA_SALEORDER');
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mas_pk,  txtOrderPK.text);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_de_tbl,  'TSA_SALEORDERD');
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_de_pk,   sod_pk);
	                
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_pk,   prod_pk);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_code, prod_code);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_nm,   prod_name);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_uom,  prod_uom);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_qty,  prod_qty);
	                 
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_pk,   arrTemp[0]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_code, arrTemp[1]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_nm,   arrTemp[2]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_uom,  arrTemp[5]);
	                
                }
           }
        }else
        {
            alert("Please select product you want to insert consumption!!")
        }
        
    }
   
}
//-----------------------------------------------------
function MakeBOM()
{
      
   var path = System.RootURL + "/form/fp/hb/fphb00010.aspx";
   if (grdDetailCons.row>0)
   {
        var prod_pk,prod_code,prod_name
        prod_pk = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_pk);
        prod_code = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_code);
        prod_name = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_nm);
        path = path + "?item_pk="+prod_pk+"&item_code="+prod_code+"&item_nm=" +prod_name
   }
   var	obj = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
}
function  OnSave()
{
     fpbp00090_1.Call();
}
//-----------------------------------
    function OnDelete_t1()
    {
        
         if(grdDetailCons.row>0)
        {
            if ( grdDetailCons.GetGridData( grdDetailCons.row, detail_PK ) == "" ) 
		            {						
					        grdDetailCons.RemoveRow();					
			        }			
			        else 
			        {
				        if ( confirm( "Do you want to mark this row to delete?" ) ) 
				        {
					        grdDetailCons.DeleteRow();
				        }
		            }
        }
    }
function OnUnDelete_t1()
{
   
     if ( grdDetailCons.GetRowStatus( grdDetailCons.row ) >= 64)
     {
        grdDetailCons.UnDeleteRow()
     }
}
//-----------------------------------------------------
</script>

<body>
    <!-------------------------Material Consumption-------TAB--------------------->
    <!-----Search SO----->
    <gw:data id="dsbs00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="<%=l_user%>lg_sel_dsbs00010" > 
                <input> 
                    <input bind="txtPOSONo" /> 
                    <input bind="dtFromOrderDate" /> 
                    <input bind="dtToOrderDate" />  
                    <input bind="lstOrderStatus1" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Calculate Consumption----->
    <gw:data id="fpbp00090" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso  type="process" procedure="<%=l_user%>lg_PRO_FPBP00090" > 
                        <input>
                             <input bind="txtOrderPK" />
                        </input> 
                        <output>
                            <output bind="txtResult" />
                        </output>
                    </dso> 
                </xml> 
        </gw:data>
    <!---------End----------->
    <!-----Delete Consumption----->
    <gw:data id="fpbp00090_0" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso  type="process" procedure="<%=l_user%>lg_PRO_FPBP00090_1" > 
                        <input>
                             <input bind="txtOrderPK" />
                             <input bind="txtEmpPK" />   
                        </input> 
                        <output>
                            <output bind="txtResult" />
                        </output>
                    </dso> 
                </xml> 
        </gw:data>
    <!---------End----------->
     <!-----Search SOD Consumption----->
    <gw:data id="fpbp00090_1" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24"   function="<%=l_user%>lg_sel_fpbp00090_1"  procedure="<%=l_user%>lg_upd_fpbp00090_1"> 
                        <input> 
                            <input bind="txtOrderPK" /> 
                        </input> 
                        <output bind="grdDetailCons" /> 
                    </dso> 
                </xml> 
            </gw:data>
    <!---------End----------->
     <!-----Search SO Consumption----->
    <gw:data id="fpbp00090_2" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso id="1" type="grid"     function="<%=l_user%>lg_sel_fpbp00090_2" > 
                        <input> 
                            <input bind="txtOrderPK" /> 
                        </input> 
                        <output bind="grdSOCons" /> 
                    </dso> 
                </xml> 
            </gw:data>
    <!---------End----------->
   <!-------------------------Material Consumption-------TAB--------------------->
    <!-------------------------------------------------------------------- -->
    <gw:data id="fpip00050" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00050"  > 
                    <input bind="divGrid2" > 
                        <input bind="dtPlanFrom" />
                        <input bind="dtPlanTo" />
                        <input bind="txtOrderNo"/>
                     </input> 
                    <output bind="divGrid2" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------- -->
    <gw:data id="fpip00050_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00050_1"  > 
                    <input bind="grdDetail" > 
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
                        <input bind="txtPlanNo"/>
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------- -->
    <gw:data id="fpip00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00050_2"  > 
                <input bind="gridMaterial" > 
                    <input bind="txtItemPk" />
                    <input bind="txtPlanPk" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                 </input> 
                <output bind="gridMaterial" /> 
            </dso> 
        </xml> 
     </gw:data>
    <!-------------------------------------------------------------------- -->
    <table style="width:100%;height:100%" >
        <tr>
            <td>
                <gw:tab id="tab"> 
                    <table style="width: 100%; height: 100%" name="Mat Cons" border=1>
                        <tr style="height:100%">
                            <td style="width:25%">
                                    <table style="width: 100%; height: 100%">
                                    <tr style="height: 2%" >
                                        <td >
                                            <table style="width: 100%; height: 100%; border:0">
                                                <tr>
                                                    <td align="right" width="30%">
                                                        <b>PO/SO No</b></td>
                                                    <td width="55%">
                                                        <gw:textbox id="txtPOSONo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch(3)" />
                                                    </td>
                                                    <td width="15%" align='right'>
                                                        <gw:imgbtn id="btnOrderNoSearch" img="search" onclick='OnSearch(3)' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 2%">
                                        <td >
                                            <table style="width: 100%; height: 100%; border:0" >
                                                <tr>
                                                    <td align="right" width='20%'>
                                                        <b>Date</b>
                                                    </td>
                                                    <td width='40%'>
                                                        <gw:datebox id="dtFromOrderDate" lang="1" styles="width:100%" onchange="OnSearch(3)" />
                                                    </td>
                                                    <td width='40%'>
                                                        <gw:datebox id="dtToOrderDate" lang="1" styles="width:100%" onchange="OnSearch(3)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 2%">
                                        <td >
                                            <table style="width: 100%; height: 100%; border:0" >
                                                <tr>
                                                    <td align="right" width='20%'>
                                                        <b>Status</b>
                                                    </td>
                                                    <td width='80%'>
                                                        <gw:list id="lstOrderStatus1" styles='width:100%' onchange="OnSearch(3)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr  style="height: 94%" >
                                        <td style="width:100%">
                                            <gw:grid id="grdSearch" header="_PK|SO No|Order DT|PO No" format="0|0|0|0" aligns="0|0|1|0"
                                                defaults="|||" editcol="0|0|0|0" widths="0|1500|1200|1000" styles="width:100%; height:100%"
                                                sorting="T" acceptNullDate="true" param="0,1,2,3" oncellclick="OnSearch(4)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width:85%">
                                <table style="width: 100%; height: 100%; border:0">
                                    <tr style="height:2%">
                                       
                                        <td style="width:84%" align="left">
                                        <gw:radio id="rbFlag" value="0" onchange="OnRadioChange()"> 
                                            <span value="0" id="sSO">Sale Order Consumption</span>
                                            <span value="1" id="sOI" >Order Item Consumption</span>
                                        </gw:radio>
                                        </td>
                                        
                                        <td align="right" style="width:2%"> 
                                              <gw:icon id="idBtnCons" img="in" text="Load Consumption" styles='width:100%' onclick="OnProcess(1)"  />
                                        </td>
                                         <td align="right" style="width:2%"> 
                                            <gw:imgbtn id="btnAdd1" img="new" alt="Add Consumption" onclick="AddConsumption()" />
                                        </td>
                                         <td align="right" style="width:2%"> 
                                            <gw:imgbtn id="btnDelete1" img="delete" alt="Delete Consumption" onclick="OnDelete_t1()" />
                                        </td>
                                         <td align="right" style="width:2%"> 
                                            <gw:imgbtn id="btnUDelete1" img="Udelete" alt="UnDelete Consumption" onclick="OnUnDelete_t1()"/>
                                        </td>
                                        <td align="right" style="width:2%"> 
                                            <gw:imgbtn id="btnSave" img="save" alt="Save Consumption" onclick="OnSave()" />
                                        </td>
                                         <td style="width:2%" align="right">
                                            <gw:icon id="idBtnCrtMR" img="in" text="Create MR" styles='width:100%' onclick="OnProcess(2)"  />
                                        </td>
                                         <td style="width:2%" align="right">
                                            <gw:icon id="idBtnBOM" img="in" text="Make BOM" styles='width:100%' onclick="MakeBOM()"  />
                                        </td>
                                        
                                    </tr>
                                    <tr style="height:98%">
                                        <td colspan="8">

                                                <table name="Sale Order" style="width: 100%; height: 100%;" id="tblSO">
                                                      <tr>
                                                        <td style="width:100%">
                                                            <gw:grid id='grdSOCons'
                                                                header='_MASTER_TABLE|_MASTER_PK|_MAT_ITEM_PK|Mat Code|Mat Name|UOM|Cons Qty|After Adjust Qty|Booked Qty|MR Qty|PO Qty|_In Qty|Out Qty'
                                                                format='0|0|0|0|0|0|1|1|1|1|1|1|0'
                                                                aligns='0|0|0|0|0|1|0|0|0|0|0|0|0'
                                                                defaults='||||||||||||'
                                                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                                widths='0|0|0|1500|3000|1000|1500|1500|1500|1500|1500|1500|1500'
                                                                sorting='T'
                                                                styles='width:100%; height:100%'
                                                                
                                                                />
                                                        </td>
                                                      </tr>
                                                </table >
                                                <table name="Item" style="width: 100%; height: 100%; border:0" id="tblItem">
                                                    <tr>
                                                        <td>
                                                            <gw:grid id='grdDetailCons'
                                                                header='SOD No|_MASTER_TABLE|_MASTER_PK|_DETAIL_TABLE|_DETAIL_PK|_PRODUCT_ITEM_PK|Prod Code|Prod Name|UOM|Qty|_MAT_ITEM_PK|Mat Code|Mat Name|UOM|Sourcing Type|BOM Qty|Cons Qty|After Adjust Qty|Booked Qty|MR Qty|PO QTY|_IN Qty|OUT Qty|Description|_PK'
                                                                format='0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|1|1|1|1|1|1|1|1|1|0'
                                                                aligns='0|0|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0'
                                                                defaults='|||||||||||||||||||||||'
                                                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0'
                                                                widths='1500|0|0|0|0|0|1500|2500|1000|1500|0|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0'
                                                                sorting='T'
                                                                styles='width:100%; height:100%'
                                                                
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
                    <table  name="Summary Plan" class="table" width="100%" border="1">
                        <tr>
                            <td valign="top">
                                <table width="100%">
                                    <tr align="left">
                                        <td style="width: 8%" align="right">
                                          Material Plan From
                                        </td>
                                        <td style="width: 10%">
                                            <gw:datebox id="dtPlanFrom" lang="1" />
                                        </td>
                                        <td style="width: 3%" align="right">
                                            To
                                        </td>
                                        <td style="width: 10%">
                                            <gw:datebox id="dtPlanTo" lang="1" />
                                        </td>
                                         <td style="width: 5%" align="right">
                                            SO Slip
                                        </td>
                                        <td style="width: 15%">
                                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                                        </td>
                                        <td style="width: 13%">
                                            <gw:label id="txtRecord" text="0 record(s)" styles="width:100%" ></gw:label>
                                        </td>
                                        
                                        <td align="right" style="width: 5%">
                                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>List of Planning Material</b>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%">
                                <table border="1" style="width: 100%">
                                    <tr>
                                        <td style="width: 100%">
                                            <div id="divGrid1" style="width: 100%; height: 140">
                                                   <gw:grid id="divGrid2" header="-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-"
                                                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
                                                    defaults="||||||||||||||||||||||||||||||||"     editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                    widths="3000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200"
                                                    sorting="F" styles="width:100%; height:280" oncelldblclick="OnGridDblClick(this)" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>     
                    <table  name="Detail Plan" class="table" width="100%"  border="1" >
                            <tr>
                                <td>
                                    <table>
                                         <tr align="left" border="1">
                                            <td style="width: 10%" align="right">
                                              Material Plan From
                                            </td>
                                            <td style="width: 10%">
                                                <gw:datebox id="dtFrom" lang="1" />
                                            </td>
                                            <td style="width: 3%" align="right">
                                                To
                                            </td>
                                            <td style="width: 10%">
                                                <gw:datebox id="dtTo" lang="1" />
                                            </td>
                                               <td style="width: 5%" align="right">
                                                    Pland Slip
                                                </td>
                                                <td style="width: 15%">
                                                    <gw:textbox id="txtPlanNo" styles="width:100%" onenterkey="OnSearch(2)" />
                                                </td>                   
                                            <td align="right" style="width: 5%">
                                                <gw:imgbtn id="btnSearch_Tab2" img="search" alt="Search" onclick="OnSearch(2)" />
                                            </td>
                                            </tr>
                                            <tr>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%" colspan=8>
                                    <b>Plan detail list</b>
                                </td>
                            </tr>
                                 <tr>
                                    <td style="width: 100%" >
                                        <table  style="width: 100%">
                                            <tr>
                                                <td style="width: 100%">
                                                   <gw:grid id='grdDetail' header='_PK|_TPR_PRODPLAN_PK|_TSA_SALEORDERD_PK|_TPR_PROCESS_PK|Process ID|Process Name|_TCO_ITEM_PK|Item Code|Item Name|UOM|Plan Qty|WI Qty|Plan From|Plan To|Description|Due Date|_DOC_DATE|SO No|_parent_item_pk|_bom_pk'
                                                            format='0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|4|4|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|3|3|0|0|0|0|0|0|0|0'
                                                            defaults='||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='0|0|0|0|2000|2500|0|1500|4000|800|1500|1500|1200|1200|3000|1200|0|2000|0|0'
                                                            sorting='T' styles='width:100%; height:250' oncellclick='onDetailClick()' acceptNullDate='true' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                               <tr>
                                    <td style="width: 100%" >
                                        <b>Material request list</b>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 100%" >
                                        <table  style="width: 100%">
                                            <tr>
                                                <td style="width: 100%">
                                                   <gw:grid id="gridMaterial" header="-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-"
                                                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
                                                    defaults="||||||||||||||||||||||||||||||||"     editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                    widths="3000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200"
                                                    sorting="F" styles="width:100%; height:280" oncelldblclick="" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                    </table>
               </gw:tab>            
            </td>
        </tr>
    </table>

    <!----------------------------Mat Cons TAB--------------------------------->
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtResult" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />

    <!------------------------------------------------------------------------->
    <gw:textbox id="txtPlanPk" styles="width:100%;display:none" />
    <gw:textbox id="txtItemPk" styles="width:100%;display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
