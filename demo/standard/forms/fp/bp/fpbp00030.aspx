<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>Stock Reserve</title>
</head>

<script>

    var  user_pk        = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name      = "<%=Session("USER_NAME")%>"  ;
//columns of grid

var ipk                     = 0,
    itpr_returnreserve_pk   = 1,
    itpr_stockreserved_pk   = 2,
    itco_item_pk            = 3,
    iItem_Code              = 4,
    iItem_Name              = 5,
    iUOM                    = 6,
    iTPR_LOTNO_PK           = 7,
    iLOT_NO                 = 8 ,    
    iReturn_Qty             = 9,
    ifrom_wh_pk             = 10,
    iFrom_WH                = 11,
    ito_wh_pk               = 12,
    iTo_WH                  = 13,
    iDescription            = 14,
    ip_tsa_saleorderd_pk    = 15 ;
    

//-----------------------------------------------------

var bStatus =0

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
    AddOnClick(1);
    OnFormatGrid();
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
       
    data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM inv.tin_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>";    
    lstFromWH.SetDataText(data);  
    lstToWH.SetDataText(data);  
 }
//-----------------------------------------------------

//-----------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 1 :
        
            fpbp00030_1.Call("SELECT")            
        break;
        
        case 2 :
        
            txtMasterPK.text = grdSearch.GetGridData(event.row , 0)
            fpbp00030_2.Call("SELECT")            
        break;
    }
}
//-----------------------------------------------------

function OnDataReceive(obj)
{
    switch (obj.id)
    {
  
        case "fpbp00030_2" :
                // master save -- > call save details
               if (p_update == 1 )
               {
                    SetParentPKtoGrid();
                    fpbp00030_3.Call();
                    p_update = 0 ;               
               }
               else
               {
                    fpbp00030_3.Call("SELECT");
               }
        break;
       
    }
}
//-----------------------------------------------------
 
 function SetParentPKtoGrid()
 {
        for ( i = 1; i < grdDetail.rows ; i++ )
        {
            if ( grdDetail.GetGridData(i, itpr_returnreserve_pk) == "" )
            {
                grdDetail.SetGridText( i , itpr_returnreserve_pk , txtMasterPK.text ) ;
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
                
                if ( fpbp00030_2.GetStatus() != 20 )
                {
                    fpbp00030_2.StatusInsert() ;
                    
                    txtEmpPK.text = user_pk ;
                    txtEmpName.text = user_name;
                    
                    txtSlipNo1.text = "**New No**" ;
                    
                    grdDetail.ClearData();
                }
                else
                {
                    alert('Already Add New. Pls Input data !!!');
                }
                
            break;

     //add detail 
            case 2  :    
            // add detail                
	             
                 var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
    	                 
	             if ( object != null )
	             {
                        for( var i=0; i < object.length; i++)	  
                        {	
                                var arrTemp = object[i];

                                    grdDetail.AddRow();     	    
		                            grdDetail.SetGridText(grdDetail.rows-1, itpr_returnreserve_pk, txtMasterPK.text);//p_pk
		                            grdDetail.SetGridText(grdDetail.rows-1, itpr_stockreserved_pk ,'');//	tsa_saleorderd
		                            grdDetail.SetGridText(grdDetail.rows-1, itco_item_pk , arrTemp[0]);//req_item_pk	    
                                    grdDetail.SetGridText(grdDetail.rows-1, iItem_Code, arrTemp[1]); //req_item_code	    
                                    grdDetail.SetGridText(grdDetail.rows-1, iItem_Name, arrTemp[2]); //req_item_name  
                                    grdDetail.SetGridText(grdDetail.rows-1, iUOM ,arrTemp[5]);//req_UOM    
  	                                grdDetail.SetGridText(grdDetail.rows-1, ifrom_wh_pk ,lstFromWH.value);//from_wh_pk
  	                                grdDetail.SetGridText(grdDetail.rows-1, iFrom_WH ,lstFromWH.GetText());//from_wh_pk
                                    grdDetail.SetGridText(grdDetail.rows-1, ito_wh_pk ,lstToWH.value);//to_wh_pk
                                    grdDetail.SetGridText(grdDetail.rows-1, iTo_WH ,lstToWH.GetText());//from_wh_pk
                       }		            
	             }
	        break;	 
	        
     //add detail from Reserve
            case 3  :    
            // add detail                
	             
                 var path = System.RootURL + '/form/fp/bp/fpbp00031.aspx';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
    	                 
	             if ( object != null )
	             { 
                        for( var i=0; i < object.length; i++)	  
                        {	
                                var arrTemp = object[i];
                                    grdDetail.AddRow();     	    
		                            grdDetail.SetGridText(grdDetail.rows-1, itpr_returnreserve_pk , txtMasterPK.text); //p_pk
		                            grdDetail.SetGridText(grdDetail.rows-1, itpr_stockreserved_pk, arrTemp[0]); //	tsa_stockreserved
		                            grdDetail.SetGridText(grdDetail.rows-1, itco_item_pk ,arrTemp[3]); //req_item_pk	    
                                    grdDetail.SetGridText(grdDetail.rows-1, iItem_Code, arrTemp[4]); //req_item_code	    
                                    grdDetail.SetGridText(grdDetail.rows-1, iItem_Name, arrTemp[5]); //req_item_name  
                                    grdDetail.SetGridText(grdDetail.rows-1, iUOM, arrTemp[6]); //req_UOM   
                                    grdDetail.SetGridText(grdDetail.rows-1, iReturn_Qty,arrTemp[11]); //req_qty   
  	                                grdDetail.SetGridText(grdDetail.rows-1, ifrom_wh_pk, lstFromWH.value); //from_wh_pk
  	                                grdDetail.SetGridText(grdDetail.rows-1, iFrom_WH, lstFromWH.GetText()); 
                                    grdDetail.SetGridText(grdDetail.rows-1, ito_wh_pk, lstToWH.value); 
                                    grdDetail.SetGridText(grdDetail.rows-1, iTo_WH, lstToWH.GetText()); 
                                    grdDetail.SetGridText(grdDetail.rows-1, ip_tsa_saleorderd_pk , arrTemp[2]);
                       }         
	             }
	        break;	 	        
     }
         
}
//-----------------------------------------------------
function OnChangeDetail()
{
        bStatus = 2
        var row,col
        col= event.col;
        row = event.row;
        if (col==iFrom_WH || col==iTo_WH)
        {
             var path = System.RootURL + '/form/fp/ab/PopUpGetWareHouse.aspx';
             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');              
             if ( obj != null )
             {
                 grdDetail.SetGridText(row, col-1, obj[0]);//warehouse_pk	 
                 grdDetail.SetGridText(row, col, obj[2]);//warehouse_name         
  		      }
        }
        else
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
        else
        if(col == iLOT_NO)
        {
             var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk=' + grdDetail.GetGridData(grdDetail.row, itco_item_pk) ;
                 path = path + '&item_code=' + grdDetail.GetGridData(grdDetail.row, iItem_Code) ;
                 path = path + '&item_name=' + grdDetail.GetGridData(grdDetail.row, iItem_Name) ;
                 path = path + '&item_uom='  + grdDetail.GetGridData(grdDetail.row, iUOM) ;
        
             var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
             if ( obj != null )
             {
                 grdDetail.SetGridText(grdDetail.row, iTPR_LOTNO_PK, obj[0]) ; //user_pk	    	    
                 grdDetail.SetGridText(grdDetail.row, iLOT_NO,        obj[1]) ; //user_name
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
                if ( CheckSaveMaster() )
                {
                    fpbp00030_2.Call();
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
        alert("Please, Input Request Number !!")
        txtSlipNo1.GetControl().focus();      
        return false;
    }
    if (txtEmpPK.text=="")
    {
        alert("Please, Select a Employee !!")
        return false;
    }

    for (i = 1; i< grdDetail.rows ; i++)
    {
        if (grdDetail.GetGridData(i, iReturn_Qty)=="")
            {
                alert("Please, input quantity for row "+i+" !!!")
                return false;
            }
        if (grdDetail.GetGridData(i, iTPR_LOTNO_PK)=="")
            {
                alert("Please, input stock number for row "+i+" !!!")
                return false;
            }            
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
		            if ( grdDetail.GetGridData( ctrl.row, ipk ) == "" ) 
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
                if ( confirm ( "Do you want to delete this request?" ) )
                {

                    fpbp00030_2.StatusDelete();
                    
                    if (txtMasterPK.text!="")
                    
	                    fpbp00030_2.Call()
    	                
	                else
    	            
	                    alert("Please,Select a Take out request !")
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

function editDetail()
{     //check data valid
  var col, row
    col = event.col
    row = event.row
    if ( col == 7 )
    {
        dQuantiy = grdDetail.GetGridData(row,col)
        if ( !Number(dQuantiy) )
        { 
             grdDetail.SetGridText(row,col,"")
        }
        else
        {
            if (parseFloat(dQuantiy+"")<0)
                 grdDetail.SetGridText(row,col,"")
        }
    }
}
function OnFormatGrid()
{
    var trl ;
    trl = grdDetail.GetGridControl();	
    trl.ColFormat(iReturn_Qty)           = "###,###,###,###,###.##";
}
</script>

<body>
    <gw:data id="fpbp00030_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00030_1" > 
                    <input bind="grdSearch" > 
                         <input bind="txtSlipNo" /> 
                         <input bind="dtFromDate" /> 
                         <input bind="dtToDate" /> 
                     </input> 
                    <output bind="grdSearch" /> 
                </dso> 
            </xml> 
        </gw:data>
    <gw:data id="fpbp00030_2" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="control" function="prod.sp_sel_fpbp00030_2" parameter="0,1,2,3,6,7,8" procedure="prod.sp_upd_fpbp00030_2" > 
                    <inout > 
                         <inout bind="txtMasterPK" /> 
                         <inout bind="txtSlipNo1" /> 
                         <inout bind="dtReserveDate" /> 
                         <inout bind="txtEmpPK"/>
                         <inout bind="txtEmpCode"/>
                         <inout bind="txtEmpName"/>
                         <inout bind="lstFromWH"/>
                         <inout bind="lstToWH"/>
                         <inout bind="txtRemark"/>
                    </inout> 
                 </dso> 
            </xml> 
        </gw:data>
    <gw:data id="fpbp00030_3" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="prod.sp_sel_fpbp00030_3" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" procedure="prod.sp_upd_fpbp00030_3"> 
                    <input bind="grdDetail" > 
                         <input bind="txtMasterPK" /> 
                    </input> 
                    <output bind="grdDetail" /> 
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
                            <gw:grid id="grdSearch" header="_PK|Slip No|Return Date" format="0|0|4" aligns="0|0|0|0"
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
                            <b>Return Date</b>
                        </td>
                        <td style="width: 15%" align="left">
                            <gw:datebox id="dtReserveDate" lang="1" styles="width:80%" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnNew" img="new" alt="New Return Reserve" text="Add" onclick="AddOnClick(1)" />
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
                            <b>From WH</b>
                        </td>
                        <td align="right" colspan="2">
                            <gw:list id="lstFromWH" styles='width:100%' />
                        </td>
                        <td align="right">
                            <b>To WH</b>
                        </td>
                        <td colspan="5">
                            <gw:list id="lstToWH" styles='width:100%' />
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(2)">Employee </b>
                        </td>
                        <td>
                            <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:100%' />
                        </td>
                        <td>
                            <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:100%' />
                        </td>
                        <td align="right">
                            <b>Description</b>
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtRemark" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnNew_2" img="new" alt="Get Item from Stock Reserve" text="Add" onclick="AddOnClick(3)" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnNew_1" img="new" alt="Get Item from warehouse" text="Add" onclick="AddOnClick(2)" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" text="Delete" onclick="OnDelete(1)" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnUnDelete_1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <gw:grid id="grdDetail" header="_pk|_tpr_returnreserve_pk|_tpr_stockreserved_pk|_tco_item_pk|Item Code|Item Name|UOM|_TPR_LOTNO_PK|Stock No|Return Qty|_from_wh_pk|From WH|_to_wh_pk|To WH|Description|_p_tsa_saleorderd_pk"
                                format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0" defaults="|||||||||||||||"
                                editcol="0|0|0|0|0|0|0|1|1|1|1|1|1|0|0|0" widths="0|0|0|0|1500|3500|600|0|2000|1500|0|1500|0|1500|1500|0"
                                styles="width:100%;height:360" sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"
                                onafteredit="editDetail()" oncelldblclick="OnChangeDetail()" />
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
</body>
</html>
