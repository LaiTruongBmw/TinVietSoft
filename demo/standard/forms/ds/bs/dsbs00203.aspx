<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP COPY/CREATE ITEM</title>
</head>

<script>
 
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
        btnCreate.SetEnable(false);
        //----------------------
        var p_item_pk = "<%=Request.querystring("item_pk")%>";
        txtItemPK.text = p_item_pk ; 
        dsbs00203_5.Call("SELECT");           
        //----------------------
 } 

 //---------------------------------------------------------
 
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdGrpSpecGrp' :
                grdItemList.ClearData();
                dsbs00203.Call("SELECT");
            break;
            case 'grdGrpSpecGrp1' :
                txtItemPK.text = '' ;
                grdItemList.ClearData();
                dsbs00203.Call("SELECT");
            break;            
            case 'ItemList' :
                CheckSpec();          
                dsbs00203_2.Call("SELECT");
            break;  
            case 'Item' :
                if ( grdItemList.row > 0 )
                {
                    txtItemPK.text = grdItemList.GetGridData(grdItemList.row,0);
                    dsbs00203_3.Call("SELECT");
                }
                else
                {
                    txtItemPK.text = '' ;
                }
            break;  
            
            case 'Detail':
                dsbs00203_2.Call("SELECT");
            break;
      }  
 }
 
 //---------------------------------------------------------
 var SpecNum = 0 ;
 
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {		
            
          case "dsbs00203_5" :
              if ( grdItemInfo.rows > 1 )
              {
                  //lstGroup.value = grdItemInfo.GetGridData(1,3);
                  txtStItemPK.text = grdItemInfo.GetGridData(1,5); 
                  lblStItem.text = grdItemInfo.GetGridData(1,7);
                  txtItemGrpPK.text = grdItemInfo.GetGridData(1,3);
                  txtPlanSpecSeq.text = "10";
                  dsbs00203_1.Call('SELECT')     
                 // dsbs00203_6.Call('SELECT');
                  //OnSearch('grdGrpSpecGrp');
              }    
          break;     
        /*   case 'dsbs00203_6':
                txtPlanSpecSeq.text = Number(txtPlanSpecSeq.text) + 10;
                dsbs00203_7.Call('SELECT');
          break;
          case 'dsbs00203_7':
                txtPlanSpecSeq.text = Number(txtPlanSpecSeq.text) + 10;
                dsbs00203_8.Call('SELECT');
          break;
          case 'dsbs00203_8':
                txtPlanSpecSeq.text = Number(txtPlanSpecSeq.text) + 10;
                dsbs00203_9.Call('SELECT');
          break;
          case 'dsbs00203_9':
                txtPlanSpecSeq.text = Number(txtPlanSpecSeq.text) + 10;
                dsbs00203_10.Call('SELECT');
          break; 
          case 'dsbs00203_10':              
                dsbs00203_2.Call('SELECT');
          break; */
          case 'dsbs00203_2':
                if(grdItemList.rows == 1)
                {
                    btnCreate.SetEnable(true);
                }else
                {
                     btnCreate.SetEnable(false);
                }
          break;
          case 'dsbs00203_1':
                var  l_data1 = '',
                     l_data2 = '',
                     l_data3 = '',
                     l_data4 = '',
                     l_data5 = '',
                     l_data6 = '',
                     l_data7 = '',
                     l_data8 = '',
                     l_data9 = '',
                     l_data10 = '';
                for(var i = 1; i< grdItemSpec.rows ; i++)
                {
                    if(grdItemSpec.GetGridData(i,3)=='10')
                    {
                        l_data1 = l_data1 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp01_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='20')
                    {
                        l_data2 = l_data2 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp02_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='30')
                    {
                        l_data3 = l_data3 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp03_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='40')
                    {
                        l_data4 = l_data4 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp04_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='50')
                    {
                        l_data5 = l_data5 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp05_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                     if(grdItemSpec.GetGridData(i,3)=='60')
                    {
                        l_data6 = l_data6 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp06_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='70')
                    {
                        l_data7 = l_data7 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp07_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                      if(grdItemSpec.GetGridData(i,3)=='80')
                    {
                        l_data8 = l_data8 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp08_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                    if(grdItemSpec.GetGridData(i,3)=='90')
                    {
                        l_data9 = l_data9 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp09_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                     if(grdItemSpec.GetGridData(i,3)=='100')
                    {
                        l_data10 = l_data10 + '|'+grdItemSpec.GetGridData(i,0)+'|'+grdItemSpec.GetGridData(i,1)
                        txtSpecGrp10_PK.text = grdItemSpec.GetGridData(i,2)
                    }
                }
               
                if (l_data1 !="")
                {
                    l_data1 = "DATA||"+ l_data1
                    lstPlanSpec01.SetDataText(l_data1) 
                }
                
                 if (l_data2 !="")
                {
                    l_data2 = "DATA||"+ l_data2
                    lstPlanSpec02.SetDataText(l_data2) 
                }
                
                
                 if (l_data3 !="")
                {
                    l_data3 = "DATA||"+ l_data3
                    lstPlanSpec03.SetDataText(l_data3) 
                }
                
                 if (l_data4 !="")
                {
                    l_data4 = "DATA||"+ l_data4
                    lstPlanSpec04.SetDataText(l_data4) 
                }
                 if (l_data5 !="")
                {
                    l_data5 = "DATA||"+ l_data5
                    lstPlanSpec05.SetDataText(l_data5) 
                }
                
                 if (l_data6 !="")
                {                   
                    l_data6 = "DATA||"+ l_data6
                    lstPlanSpec06.SetDataText(l_data6) 
                }else
                {
                    lstPlanSpec06.style.display ='none'
                    img6.style.display='none'
                }
                
                 if (l_data7 !="")
                {
                    l_data7 = "DATA||"+ l_data7
                    lstPlanSpec07.SetDataText(l_data7) 
                }else
                {
                    lstPlanSpec07.style.display ='none'
                    img7.style.display='none'
                }
                  if (l_data8 !="")
                {
                    l_data8 = "DATA||"+ l_data8
                    lstPlanSpec08.SetDataText(l_data8) 
                }else
                {
                    lstPlanSpec08.style.display ='none'
                    img8.style.display='none'
                }
                  if (l_data9 !="")
                {
                    l_data9 = "DATA||"+ l_data9
                    lstPlanSpec09.SetDataText(l_data9) 
                }else
                {
                    lstPlanSpec09.style.display ='none'
                    img9.style.display='none'
                }
                  if (l_data10 !="")
                {
                    l_data10 = "DATA||"+ l_data10
                    lstPlanSpec10.SetDataText(l_data10) 
                }else
                {
                    lstPlanSpec10.style.display ='none'
                    img10.style.display='none'
                }
               dsbs00203_2.Call('SELECT');                                
          break;
          case 'pro_dsbs00203':
                dsbs00203_2.Call('SELECT');
          break;
          case 'pro_dsbs00203':
                dsbs00203_2.Call('SELECT')
          break;
      }
      
 }  

//-----------------------------------------------------------------------------------------------

function OnDelete()
{
    if(grdItemList.row >0)
    {    
        if ( confirm ( "Do you want to delete this row?" ) )
            {
                 grdItemList.DeleteRow()
                dsbs00203_2.Call()
            }
        
    }else
    {
        alert('Please, select an item to delete!')
    }    

}
//-----------------------------------------------------------------------------------------------

function OnUnDelete()
{
    grdItemList.UnDeleteRow()

}
//-------------------------------------------------------------------------------------------

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdItemList" :
            
                var ctrl = grdItemList.GetGridControl();
                var code_data = new Array();
	            var index, rowNo
	            index = 0 ;
	            rowNo = 0 ;
	            
	            for( i=0 ; i< ctrl.SelectedRows ; i++ )
		        {	  
	                rowNo = ctrl.SelectedRow(i) ;
    	            
	                for( j=0 ; j<grdItemList.cols -1 ; j++ )
	                {
                        code_data[index] = grdItemList.GetGridData(rowNo , j );
                        index ++;
                    }                     
		        }
    	    
	            window.returnValue = code_data; 
	            this.close(); 
	            	
            break;
      }      
   
}

//-------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{    
    switch (pos.id)
    {
        case 'img1':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp01_PK.text;
            var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');   
            if ( obj != null )
            {                          
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec01.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img2':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp02_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');              
            
            if ( obj != null )
            {
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec02.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img3':
              var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp03_PK.text;
              var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes'); 
             
            if ( obj != null )
            {                 
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec03.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img4':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp04_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes'); 
                
            if ( obj != null )
            {                
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec04.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img5':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp05_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');                
            if ( obj != null )
            {
                 var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec05.SetDataText(data); 
                OnSearch('Detail');
            }
        break;
        
        case 'img6':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp06_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes'); 
                
            if ( obj != null )
            {                
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec06.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img7':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp07_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');                
            if ( obj != null )
            {
                 var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec07.SetDataText(data); 
                OnSearch('Detail');
            }
        break;
         case 'img8':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp08_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');                
            if ( obj != null )
            {
                 var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec08.SetDataText(data); 
                OnSearch('Detail');
            }
        break;
        
        case 'img9':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp09_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes'); 
                
            if ( obj != null )
            {                
                var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec09.SetDataText(data); 
                OnSearch('Detail');
            }
            break;
        case 'img10':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00090.aspx?tco_stitem_pk=' + txtStItemPK.text + '&specgrp_pk=' + txtSpecGrp10_PK.text;
             var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');                
            if ( obj != null )
            {
                 var data = "data|" + obj[2] + "|" + obj[4] + "";
                lstPlanSpec10.SetDataText(data); 
                OnSearch('Detail');
            }
        break;
        
        
    }
}
//-------------------------------------------------------------------------------------------------
function OnProcess()
{
    pro_dsbs00203.Call();
}   
//------------------------------------------------------------------------------------------------

</script>

<body>
     <!------------------------------------------------------------------>
    <gw:data id="dsbs00203_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" user="sale" parameter="0" function="SALE.sp_sel_dsbs00203_1" > 
                <input> 
                    <input bind="txtStItemPK" />                          
                </input>
                <output bind="grdItemSpec"/> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00203_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" user="comm" parameter="0" function="sale.sp_sel_dsbs00203_7" procedure="sale.sp_upd_dsbs00203_2" > 
                <input>
                    <input bind="txtStItemPK" /> 
                    <input bind="lstPlanSpec01" /> 
                    <input bind="lstPlanSpec02" /> 
                    <input bind="lstPlanSpec03" />
                    <input bind="lstPlanSpec04" />
                    <input bind="lstPlanSpec05" />
                    <input bind="lstPlanSpec06" />
                    <input bind="lstPlanSpec07" />
                    
                    <input bind="lstPlanSpec08" />
                    <input bind="lstPlanSpec09" />
                    <input bind="lstPlanSpec10" />
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00203_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00203_5"  > 
                <input>
                    <input bind="txtItemPK" />
                </input> 
                <output bind="grdItemInfo" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00203_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" user="sale" procedure="sale.sp_sel_dsbs00203_6" > 
                <input> 
                    <input bind="txtStItemPK" />  
                    <input bind="txtPlanSpecSeq" />                                
                </input>
                <output> 
                    <output bind="lstPlanSpec01" />
                </output> 
            </dso> 
        </xml> 
    </gw:data>
   
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00203" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="sale.sp_pro_dsbs00203"> 
                <input> 
			        <input bind="txtStItemPK" /> 
                    <input bind="lstPlanSpec01" /> 
                    <input bind="lstPlanSpec02" /> 
                    <input bind="lstPlanSpec03" />
                    <input bind="lstPlanSpec04" />
                    <input bind="lstPlanSpec05" /> 		
                    <input bind="lstPlanSpec06" />
                    <input bind="lstPlanSpec07" /> 	
                    <input bind="lstPlanSpec08" /> 
                    <input bind="lstPlanSpec09" /> 
                    <input bind="lstPlanSpec10" /> 
			    </input> 
                <output>
                    <output bind="txtTcoItemPK" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                ST Item
            </td>
            <td align="left" style="width: 100%">
                <gw:label id="lblStItem" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td align="right" style="width: 1%">
            </td>
            <td align="right" style="width: 1%">
            </td>
            <td align="right" style="width: 1%">
            </td>
            <td align="right" style="width: 1%">
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 10%; white-space: nowrap">
                Spec
            </td>
            <td colspan="7">
                <table border="0" cellspacing="0" cellpadding="1" width="100%">
                    <tr>
                        <td style="width: 1%">
                            <img status="expand" id="img1" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec01" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <img status="expand" id="img2" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec02" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <img status="expand" id="img3" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec03" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <img status="expand" id="img4" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec04" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <img status="expand" id="img5" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec05" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        
                        <td style="width: 1%">
                            <img status="expand" id="img6" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec06" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        
                        <td style="width: 1%">
                            <img status="expand" id="img7" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec07" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        
                         <td style="width: 1%">
                            <img status="expand" id="img8" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec08" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                         <td style="width: 1%">
                            <img status="expand" id="img9" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec09" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                         <td style="width: 1%">
                            <img status="expand" id="img10" src="../../../../system/images/iconmaximize.gif" style="cursor: hand"
                                onclick="OnPopUp(this)" />
                        </td>
                        <td>
                            <gw:list id="lstPlanSpec10" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                             <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCreate" img="Create Item" text="Create Item" onclick="OnProcess()"
                                onchange="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 97%">
            <td colspan="8">
                <gw:grid id="grdItemList" header="_PK|Item Code|Item Name|_Local Item Name|_Foreign name|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|7000|2500|1500|800|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                    sorting="T" param="0,1,2,3,4,5,5,6,7" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:grid id="grdGrpSpecGrp" header="PK|TCO_ITEMGRP_PK|TCO_SPECGRP_PK|MANDATORY|SPEC_TYPE|STMAPPING_YN|SEQ|SPECGRP_NM"
        format="0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0" editcol="1|1|1|1|1|1|1|1" widths="1000|1000|1000|1000|1000|1000|1000|1000"
        sorting="F" styles="width:100%; height:100%; display:none" />
    <!------------------------------------------------------------------------>
    <gw:grid id="grdItemSpec" header="_tco_spec_pk|Spec Name|_tco_specgrp_pk|Plan seq"
        format="0|0|0|0" aligns="0|0|0|0"
        defaults="||||" editcol="0|0|0|0" widths="0|0|0|2500"
        styles="width:100%; height:100%; display:none" sorting="T" param="0,1,2,3" />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:grid id="grdItemInfo" header="tco_item_pk|item_code|item_name|tco_group_pk|group|tco_stitem_pk|stitem_code|stitem_name"
        format="0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0" editcol="0|0|0|0|0|0|0|0" widths="0|0|0|0|0|0|0|0"
        styles="width:100%; height:100%; display:none" sorting="F" param="0,1,2,3,4,5,6,7" />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtStItemPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtPlanSpecSeq" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemGrpPK" maxlen="100" styles='width:100%;display:none' />
   
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSpecGrp01_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp02_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp03_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp04_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp05_PK"  styles='width:100%;display:none' />
    
    <gw:textbox id="txtSpecGrp06_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp07_PK"  styles='width:100%;display:none' /> 
    <gw:textbox id="txtSpecGrp08_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp09_PK"  styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrp10_PK"  styles='width:100%;display:none' />    
    
    <gw:textbox id="txtSpec_PK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtTcoItemPK" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
