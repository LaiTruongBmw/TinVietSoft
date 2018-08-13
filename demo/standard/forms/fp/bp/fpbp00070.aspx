<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Barcode Stock Adjustment</title>
</head>

<script>

    var  user_pk        = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name      = "<%=Session("USER_NAME")%>"  ;
//columns of grid

    var         
    iTPR_STOCKADJUSTD_pk    = 0,
    itco_item_pk            = 1,
    iTPR_STOCKADJUST_PK     = 2,
    itpr_itembcm_pk         = 3,
    itpr_lotno_pk           = 4,
    iSeqNo                  = 5,
    iTIN_WAREHOUSE_PK       = 6,
    iTIN_WAREHOUSE_Name     = 7,
    iItem_Code              = 8,
    iItem_Name              = 9,
    iUOM                    = 10,
    iStock_No               = 11,
    iOld_Stock_No           = 12,
    iItem_BC                = 13,
    iStock_Date             = 14,
    iStock_Qty              = 15,
    iAdjust_Qty             = 16,
    iAdjust_Date            = 17,
    iRemark                 = 18
    
          
//-----------------------------------------------------

var bStatus =0
var iBarcode = 1 // 1: crateate bc, 0: clear bc
 //---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
 
//-----------------------------------------------------


function BodyInit()
{
    SetStatus(1);
    BindingDataList();
    dtFromDate.SetDataText(System.AddDate( dtToDate.GetData() , -30) );
    btnGenerateCode.SetEnable(false);
    AddOnClick(1);
    txtSlipNo1.SetEnable(false);
    //OnFormatGrid();
}

//-----------------------------------------------------

function SetStatus(pos)
{
    switch (pos)
    {
        case 1:
            txtEmpCode.SetEnable(false);
            txtEmpName.SetEnable(false);
        break;
    }        
}

//-----------------------------------------------------
 function BindingDataList()
 {
     var data="";      
    data = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('PRBP0200','','') FROM DUAL" )%>";    
    lstAdjustStatus.SetDataText(data); 
    lstAdjustStatus.value="01" 
    lstAdjustStatus.SetEnable(false)
    grdDetail.GetGridControl().FrozenCols = iUOM ;
  }
//-----------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 1 :
        
            fpbp00070_1.Call("SELECT")            
        break;
        
        case 2 :
        
            txtMasterPK.text = grdSearch.GetGridData(event.row , 0)
            fpbp00070_2.Call("SELECT")            
        break;
    }
}
//-----------------------------------------------------

function OnDataReceive(obj)
{
    switch (obj.id)
    {
  
        case "fpbp00070_2" :
                // master save -- > call save details
               if (p_update == 1 )
               {
                    SetParentPKtoGrid();
                    fpbp00070_3.Call();
                    p_update = 0 ;                                                                                                
               }
               else
               {
                    fpbp00070_3.Call("SELECT");
               }
        break;     
        case "fpbp00070_5" :
        {
            alert(txtReturnValue.text)
            checkCreateBarCode();
        }
        break;
        case "fpbp00070_3" :
        {
             checkCreateBarCode();
        }
        break;
        case "fpbp00070_6":
        {
             alert(txtReturnValue.text)
             fpbp00070_3.Call();
        }
        break;
    }
}
function checkCreateBarCode()
{
    for(var i =1 ; i < grdDetail.rows; i++)
    {
        var val1,val2, val3
        val1 = grdDetail.GetGridData(i,15)//Stock qty
        val2 = grdDetail.GetGridData(i,16)//Adjust qty
        val3 = grdDetail.GetGridData(i,3)//item barcode pk
        if ( parseFloat(val2+"") > parseFloat(val1+"") && (val3 == "") && (lstAdjustStatus.value =="02"))
        {
            btnGenerateCode.SetEnable(true);
            iBarcode =1;
            btnGenerateCode.text = "Generate Barcode"
            return;
        }
    }
     btnGenerateCode.SetEnable(false);
     btnGenerateCode.text = "Generate Barcode"
     iBarcode =1;
}
//----------------------------------------------------- 
 function SetParentPKtoGrid()
 {
        for ( i = 1; i < grdDetail.rows ; i++ )
        {
            if ( grdDetail.GetGridData(i, iTPR_STOCKADJUST_PK) == "" )
            {
                grdDetail.SetGridText( i , iTPR_STOCKADJUST_PK, txtMasterPK.text ) ;
                grdDetail.SetGridText( i , iSeqNo, i ) ;
            }
        }
 } 

//-----------------------------------------------------
function OnPopUp(pos)
 {
      switch (pos)         
      {	  
        case 1  :
             var path = System.RootURL + '/form/fp/ab/PopUpGetPartner.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {       
	            txtCustPK.text = object[0];
                txtCustCode.text = object[1];
                txtCustName.text = object[2];            
	         }
	    break;
	                 
        case 2 :
             var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtEmpPK.text = object[0];
                txtEmpCode.text = object[1];
                txtEmpName.text = object[2];
             }
        break;
        
       }
 }
 //-----------------------------------------------------
 
function AddOnClick(obj)
{
   // add new master
      switch (obj)         
      {	  
            case 1  :    
            // add new master
                
                if ( fpbp00070_2.GetStatus() != 20 )
                {
                    fpbp00070_2.StatusInsert() ;
                    
                    txtEmpPK.text = user_pk ;
                    txtEmpName.text = user_name;
                    
                    txtSlipNo1.text = "**New Slip No**" ;
                    lstAdjustStatus.value="01" 
                    grdDetail.ClearData();
                }
                else
                {
                    alert('Already Add New. Pls Input data !!!');
                }
                
            break;

     //add detail from common stock
            case 3  :    
            // add detail  
                if (lstAdjustStatus.value != "02")
                {   
	                 var path = System.RootURL + '/form/fp/ab/PopUpGetCommonStock.aspx';
	                 var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
        	                 
	                 if ( object != null )
	                 { 
                            for( var i=0; i < object.length; i++)	  
                            {	
                                    var arrTemp = object[i];
                                    grdDetail.AddRow();
	                                grdDetail.SetGridText(grdDetail.rows-1, iTPR_STOCKADJUSTD_pk , txtMasterPK.text);//iTPR_STOCKADJUSTD_pk
	                                grdDetail.SetGridText(grdDetail.rows-1, itco_item_pk , arrTemp[3]); //item_pk
	                                grdDetail.SetGridText(grdDetail.rows-1, iItem_Code, arrTemp[4]); //item_code
	                                grdDetail.SetGridText(grdDetail.rows-1, iItem_Name , arrTemp[5]); //item_name
	                                grdDetail.SetGridText(grdDetail.rows-1, iUOM , arrTemp[6]); //UOM
	                                grdDetail.SetGridText(grdDetail.rows-1, itpr_lotno_pk , arrTemp[7]); //lot_no_pk
	                                grdDetail.SetGridText(grdDetail.rows-1, iStock_No, arrTemp[8]); //lot_no
	                                grdDetail.SetGridText(grdDetail.rows-1, iOld_Stock_No, arrTemp[8]); //old_lot_no		                            		                            		                            
                                    grdDetail.SetGridText(grdDetail.rows-1, iStock_Qty, arrTemp[9]); // stock_quantity
                                    grdDetail.SetGridText(grdDetail.rows-1, iTIN_WAREHOUSE_PK, arrTemp[0]); // warehouse_pk
                                    grdDetail.SetGridText(grdDetail.rows-1, iTIN_WAREHOUSE_Name, arrTemp[2]); // warehouse_name
                                    grdDetail.SetGridText(grdDetail.rows-1, iAdjust_Date, dtAdjustDate.value); // warehouse_name
                           }         
	                 }
	            }else
	            {
	                alert("You can't add new item in this stock adjustment!")
	            }
	            
	        break;	 	        
     }         
}

//-----------------------------------------------------
function OnChangeDetail()
{
        bStatus = 2
        var row,col, lAdjust_Date ;
        col = event.col;
        row = event.row;
        if(col == iUOM )
        {
             var path = System.RootURL + '/form/fp/ab/PopUpGetUOM.aspx';
             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');              
             if ( obj != null )
             {
                 grdDetail.SetGridText(row, col, obj[0]);//warehouse_pk	 
                 grdDetail.SetGridText(row, col, obj[2]);//warehouse_name         
  		      }
        }
    if ( col == iStock_No && row > 0 )
         {
             var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk='+ grdDetail.GetGridData(grdDetail.row, itco_item_pk) ;
                 path = path +'&item_code='+ grdDetail.GetGridData( grdDetail.row, iItem_Code) ;
                 path = path +'&item_name='+ grdDetail.GetGridData( grdDetail.row, iItem_Name) ;
                 path = path +'&item_uom=' + grdDetail.GetGridData( grdDetail.row, iUOM ) ;
                 
             var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
             if ( obj != null )
             {
                 grdDetail.SetGridText(grdDetail.row, itpr_lotno_pk, obj[0]) ;	    	    
                 grdDetail.SetGridText(grdDetail.row, iStock_No    , obj[1]) ;
             }	
         
         } 
}
var p_update = 0 ;

//-----------------------------------------------------
function SaveOnClick(pos)
{
      switch (pos)         
      {	  
            case 1  :                
                if ( CheckSaveMaster() && checkValidDetail() == true)
                {
                    fpbp00070_2.Call();
                    p_update = 1 ;
                }
            break ;
       }            
}

//-----------------------------------------------------
function CheckSaveMaster()
{
    if(Trim(txtSlipNo1.text)=="" || Trim(txtSlipNo1.text)=='**New No**' )
    {
        alert("Please, Input Adjust Number !!")
        txtSlipNo1.GetControl().focus();      
        return false;
    }
    if (txtEmpPK.text=="")
    {
        alert("Please, Select a Employee !!")
        return false;
    }    
    return true; 
}
//----------------------Detail--------------------------------------
function OnDelete(obj)
 {
      switch (obj)         
      {	  
            case 1  :  

                var ctrl = grdDetail.GetGridControl();
	            var n    = ctrl.rows;
	            var row  = ctrl.row;
            	
	            if ( row < 0 ) 
	            {			
			            alert("Please select a Record to delete .");
	            }			
	            else 
	            {
		            if ( grdDetail.GetGridData( ctrl.row, iTPR_STOCKADJUSTD_pk ) == "" ) 
		            {						
        				
					            grdDetail.RemoveRow();					
			        }
        			
		            else 
		            {
			            if ( confirm( "Do you want to mark this row to delete?" ) ) 
			            {
				            grdDetail.DeleteRow();
			            }
		            }
	            }
	            
	        break;
	            
            case 0  :                
                if ( confirm ( "Do you want to delete this stock adjust?" ) )
                {

                    fpbp00070_2.StatusDelete();
                    
                    if (txtMasterPK.text!="")
                        if (lstAdjustStatus.value=="01")
	                         fpbp00070_2.Call()
	                    else
	                        alert("This Stock Adjust have been confimed. You can't delete it !")
    	                
	                else
    	            
	                    alert("Please,Select a stock adjust !")
 	             }
     	         
     	    break; 
      } 	        
 }

//---------------------------------------------------------
 function OnUnDelete() 
 {

	var ctrl = grdDetail.GetGridControl();

	var row  = ctrl.row;

		if ( row > 0 )
		{
			if ( grdDetail.GetGridData( ctrl.row, 0) == "" ) 
			{
			}
			else 
			{				
				if ( confirm ( "Do you want to undelete?" ) ) 
				{				
					grdDetail.UnDeleteRow()
				}
			}
		}
}

//---------------------------------------------------------
function checkValidDetail()
{
    var errorMess1=""
    var errorMess2=""
    for(var i=1; i< grdDetail.rows; i++)
    {
       var adj_qty = grdDetail.GetGridData(i,iAdjust_Qty);
       var stock_qty = grdDetail.GetGridData(i,iStock_Qty);
       var stock_no_pk = grdDetail.GetGridData(i,itpr_lotno_pk);
       if (adj_qty =="" || adj_qty  <0)
       {
          errorMess1 = "Adjust Quantity is Invalid . ";
       }else
       {
            if(stock_no_pk==0 && adj_qty-stock_qty>0 )
           {
                 errorMess2 = "Stock no must not be null!.  ";
           }
       }
          
    } 
     if(errorMess1+ errorMess2 !="")
      {
        alert(errorMess1+ errorMess2)
        return false;
     }
    return true;
}
function editDetail()
{     //check data valid
  var col, row;
  var lAdjust_Date ;
    col = event.col;
    row = event.row;
    if ( col == iAdjust_Qty )
    {
        dQuantiy = grdDetail.GetGridData(row,col);
        if ( !Number(dQuantiy) )
        { 
             grdDetail.SetGridText(row,col,"");
             alert('Enter adjust quantity, a number');
             return false;
        }else
        {
            if (dQuantiy<0)
            {
              grdDetail.SetGridText(row,col,"");
              alert('Quantity must be greater than zero!!');
              return false;
            }
        }
    }
    else
    if(col == iAdjust_Date)
    {
        lAdjust_Date = GetGridData(row, col) ;
        if(lAdjust_Date=="")
        {
            grdDetail.SetGridText(row,col,"");
            alert('Enter Adjust Date');
            return false;
        }                
    }  
    return true;  
}
function OnConFirm()
{
     fpbp00070_5.Call();
}
function GenerateBC()
{
    if (iBarcode == 1)
    {
        if (txtMasterPK.text != "")
        {
         var path = System.RootURL + '/form/fp/bp/fpbp00071.aspx?stockadjust='+txtMasterPK.text+'&user_pk='+user_pk+'&user_name='+user_name;
	     var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	     fpbp00070_3.Call()
	    }else
	    {
	        alert("Please, Select a Stock adjust !!");
	    }
	}else
	{
	    fpbp00070_6.Call()
	}
}
function ClearBarCode()
{
    var col, row;
    col = event.col;
    row = event.row;
    if(col == iItem_BC && grdDetail.GetGridData(row,iItem_BC)!="")
    {
        btnGenerateCode.text ="Clear Barcode";
        btnGenerateCode.SetEnable(true);
        iBarcode =0;
       var adj_qty = grdDetail.GetGridData(row,iAdjust_Qty);
       var stock_qty = grdDetail.GetGridData(row,iStock_Qty);
        txtItemBC.text = grdDetail.GetGridData(row,iItem_BC);
        txtBCQty.text = adj_qty - stock_qty;
    }else
    {
       checkCreateBarCode()
    }
}
</script>

<body>
    <gw:data id="fpbp00070_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00070_1" > 
                    <input bind="grdSearch" > 
                         <input bind="txtSlipNo" /> 
                         <input bind="dtFromDate" /> 
                         <input bind="dtToDate" /> 
                     </input> 
                    <output bind="grdSearch" /> 
                </dso> 
            </xml> 
        </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="fpbp00070_2" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="control" function="prod.sp_sel_fpbp00070_2" parameter="0,1,2,3,6,7" procedure="prod.sp_upd_fpbp00070_2" > 
                    <inout > 
                         <inout bind="txtMasterPK" /> 
                         <inout bind="txtSlipNo1" /> 
                         <inout bind="dtAdjustDate" /> 
                         <inout bind="txtEmpPK"/>
                         <inout bind="txtEmpCode"/>
                         <inout bind="txtEmpName"/>
                         <inout bind="lstAdjustStatus"/>                         
                         <inout bind="txtRemark"/>
                    </inout> 
                 </dso> 
            </xml> 
        </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00070_3" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00070_3" parameter ="0,1,2,3,4,5,6,10,14,15,16,17,18" procedure="prod.sp_upd_fpbp00070_3"> 
                    <input bind="grdDetail" > 
                         <input bind="txtMasterPK" /> 
                    </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00070_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="PROD.sp_upd_fpbp00070_5" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtSlipNo1" />
                    <input bind="txtEmpPK" />
                    <input bind="dtAdjustDate" />
                    <input bind="lstAdjustStatus" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
  <!------------------------------------------------------------------>
    <gw:data id="fpbp00070_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process"  procedure="prod.sp_upd_fpbp00070_6" > 
                <input>
                    <input bind="txtItemBC" /> 
                    <input bind="txtBCQty" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <table class="table" width="100%" cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td id="left" style="width: 30%" valign="top">
                <!-- Table1 contain master buttons and text box -->
                <table width="100%" border="0">
                    <tr>
                        <td style="width: 100%">
                            <table width="100%">
                                <tr>
                                    <td align="right" style="width: 20%">
                                        <b>Slip No</b>
                                    </td>
                                    <td style="width: 60%">
                                        <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" />
                                    </td>
                                    <td style="width: 20%" align='right'>
                                        <gw:imgbtn id="btnSearch1" img="search" onclick='OnSearch(1)' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%">
                            <table width="100%">
                                <tr>
                                    <td align="right" style="width: 20%">
                                        <b>Date</b>
                                    </td>
                                    <td style="width: 40%">
                                        <gw:datebox id="dtFromDate" lang="1" />
                                    </td>
                                    <td style="width: 40%">
                                        <gw:datebox id="dtToDate" lang="1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <gw:grid id="grdSearch" header="_PK|Slip No|Adjust Date" format="0|0|4" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0" widths="0|2000|1200|1000" styles="width:100%; height:400"
                                sorting="T" acceptNullDate="true" oncellclick="OnSearch(2)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <!-- Table2 contain detail buttons and text box -->
                <table width="100%">
                    <tr align="right">
                        
                        <td style="width: 10%">
                            <b>Slip No</b>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSlipNo1" csstype="mandatory" styles="width:100%" />
                        </td>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 10%">
                            <b>Adjust Date</b>
                        </td>
                        <td style="width: 15%" align="left">
                            <gw:datebox id="dtAdjustDate" lang="1" styles="width:80%" />
                        </td>
                        <td style="width: 10%" colspan=2>
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="Add" onclick="AddOnClick(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete(0)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="SaveOnClick(1)" />
                        </td>
                    </tr>
                    <tr>
                         <td align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(2)">Employee </b>
                        </td>
                        <td>
                            <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:100%' />
                        </td>
                        <td>
                            <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 15%">
                            <b>Adjust Status</b>
                        </td>
                        <td align="right" colspan="6" style="width: 20%">
                            <gw:list id="lstAdjustStatus" styles='width:100%' />
                        </td>
                        <td align="right">                            
                        </td>
                        
                    </tr>
                    <tr align="left">
                        <td align="right">
                            <b>Description</b>
                        </td>
                        <td colspan="10">
                            <gw:textbox id="txtRemark" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnNew_2" img="new" alt="Get item from Stock" text="Add" onclick="AddOnClick(3)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:icon id="btnConfirm"  text="Confirm" onclick="OnConFirm()" />
                        </td>
                         <td style="width: 5%" align="right">
                            <gw:icon id="btnGenerateCode"  text="Generate Barcode" onclick="GenerateBC()" styles='width:100%'/>
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" text="Delete" onclick="OnDelete(1)" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnUnDelete_1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            <gw:grid id="grdDetail" header="_pk|_tco_item_pk|_TPR_STOCKADJUST_PK|_tpr_itembcm_pk|_tpr_lotno_pk|Seq No|_TIN_WAREHOUSE_PK|WareHouse|Item Code|Item Name|UOM|Stock No|Old Stock No|Item BC|Stock Date|Stock Qty|Adjust Qty|Adjust Date|Remark"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|4|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|1|3|3|1|0|0|0" defaults="||||||||||||||||||"
                                editcol="0|0|0|0|0|1|0|0|0|0|0|1|1|0|1|1|1|1|1" widths="0|0|0|0|0|1200|0|1500|1500|3500|800|2000|2000|2000|1000|1200|2000|1200|2000"
                                acceptNullDate="true"
                                styles="width:100%;height:360" sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
                                onafteredit="editDetail()" oncelldblclick="OnChangeDetail()" oncellclick="ClearBarCode()"/>
                        </td>
                    </tr>
                </table>
                <!-- End of Table2 -->
            </td>
        </tr>
    </table>
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!---Clear BC---->
    <gw:textbox id="txtItemBC" styles='width:100%;display:none' />
    <gw:textbox id="txtBCQty" styles='width:100%;display:none' />
    
</body>
</html>
