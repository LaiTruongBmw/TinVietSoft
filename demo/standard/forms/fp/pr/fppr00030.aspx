<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Production Closing</title>
</head>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>";
    var  user_name = "<%=Session("USER_NAME")%>"  ;
//-----------------------------------------------------
var flag = '' ;

//-----------------------------------------------------
var G1_MASTER_PK    = 0,
    G1_Slip_No      = 1,
    G1_Status       = 2,
    G1_Date         = 3,
    G1_PO_No        = 4;
    
var G2_DETAIL_PK    = 0,
    G2_MASTER_PK    = 1,
    G2_SEQ          = 2,
    G2_ITEM_PK      = 3,
    G2_COMP_PK      = 4,
    G2_COMP_ID      = 5,
    G2_COMP_NAME    = 6,
    G2_SPEC01_PK    = 7,
    G2_SPEC01_ID    = 8,
    G2_SPEC02_PK    = 9,
    G2_SPEC02_ID    = 10,
    G2_SPEC03_PK    = 11,
    G2_SPEC03_ID    = 12,
    G2_SPEC04_PK    = 13,
    G2_SPEC04_ID    = 14,
    G2_SPEC05_PK    = 15,
    G2_SPEC05_ID    = 16,
    G2_LOT_NO       = 17,
    G2_BEGIN_QTY    = 18,
    G2_IN_QTY       = 19,
    G2_OUT_QTY      = 20,
    G2_END_QTY      = 21,
    G2_DESCRIPTION  = 22;

//==========================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display      = "none";       
        imgArrow.status         = "collapse";
        right.style.width       = "100%";
        imgArrow.src            = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display      = "";
        imgArrow.status         = "expand";
        right.style.width       = "75%";
        imgArrow.src            = "../../../system/images/prev_orange.gif";
    }
 }
 
//==========================================================================

function BodyInit()
{
    System.Translate(document); 
    txtRefPONo.SetEnable(false);
    txtStyleName.SetEnable(false);
    txtChargerNm.SetEnable(false);
    
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
    //----------------------        
    FormatGrid();
    OnToggleGrid();
    //---------------------- 
    OnAddNew('Master');
    //----------------------     
}

//==========================================================================
 function FormatGrid()
 {
        var data="";  
           
        data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>";    
        lstWH.SetDataText(data);          

        data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || LINE_NAME  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
        lstLine.SetDataText(data);
                             
        var ctrl ;
        ctrl = grdDetail.GetGridControl();	
        
        ctrl.ColFormat(G2_BEGIN_QTY) = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_IN_QTY)    = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_OUT_QTY)   = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_END_QTY)   = "###,###,###,###,###.##";
  }
//==========================================================================

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch' :        
            data_fppr00030.Call("SELECT")            
        break;

        case 'grdDetail' :        
            data_fppr00030_2.Call("SELECT")            
        break;
                
        case 'Master' :
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( event.row, G1_MASTER_PK);                
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            data_fppr00030_1.Call("SELECT");
        break;
    }
}
//==========================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fppr00030" :
	        if ( grdSearch.rows > 1 )
	        {
	            grdSearch.SetCellBold( 1, G1_PO_No,  grdDetail.rows - 1, G1_PO_No,  true);
	        }    
        break;
        
        case "data_fppr00030_1" :
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_MASTER_PK, txtMasterPK.text);
                    }    
                }
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }               
        break;
               
        case "data_fppr00030_2":
	        if ( grdDetail.rows > 1 )
	        {
                grdDetail.SetCellBold( 1, G2_COMP_ID, grdDetail.rows - 1, G2_COMP_ID, true);
	        
                grdDetail.SetCellBold( 1, G2_IN_QTY, grdDetail.rows - 1, G2_OUT_QTY, true);
                
                grdDetail.SetCellBgColor( 1, G2_LOT_NO , grdDetail.rows - 1, G2_LOT_NO , 0xCCFFFF );
                      
                //--------------------------------
	        }
        break;
    }
}

//==========================================================================

function OnPopUp(pos)
 {
      switch (pos)         
      {	      	                 
            case 'Charger' :
                 var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( object != null )
	             {
	                txtChargerPK.text   = object[0];
                    txtChargerNm.text = object[2];
                 }
            break;   
            
            case 'Style':
                 var path = System.RootURL + '/form/fp/ab/fpab00360.aspx?group_type=Y|Y||||';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( obj != null )
                 {
                    txtOrdPlanPK.text = obj[0];                    
                    txtRefPONo.text   = obj[2];
                    txtStylePK.text   = obj[5];
                    txtStyleName.text = obj[7];
                 }	        
            break;	 
                        
            case 'PO':
                 var path = System.RootURL + '/form/fp/ab/fpab00360.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( obj != null )
                 {
                    txtOrdPlanPK.text = obj[0];                    
                    txtRefPONo.text   = obj[2];
                    txtStylePK.text   = obj[5];
                    txtStyleName.text = obj[7];
                 }	        
            break;	                                          
       }
 }
//==========================================================================
 
function OnAddNew(obj)
{
      switch (obj)         
      {	  
            case 'Master'  :    
                if ( data_fppr00030_1.GetStatus() != 20 )
                {
                    data_fppr00030_1.StatusInsert();
                    
                    txtSlipNo.text = "**New Slip No**";
                    
                    txtChargerNm.text = "<%=Session("USER_NAME")%>";    
                    txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>";       
                            
                    grdDetail.ClearData();
                }
                else
                {
                    alert('Already Add New. Pls Input data !!!');
                }
                
            break;
            
            case 'grdDetail' :
                 //-------------
                 var path ;
                 //--------        
                 if ( txtOrdPlanPK.text == "")  
                 {
                    alert('Please select Order Plan first!')
                    return;
                 } 
                      
                 var path = System.RootURL + '/form/fp/pr/fppr00031.aspx' ;    
                 var object = System.OpenModal( path , 950 , 600 ,  'resizable:yes;status:yes', this );
                 
                 var data ;
                 
                 if ( object != null )
                 {
                        for ( var i=0; i< object.length; i++)
                        {
                            data = object[i];
                            
                            grdWIDetail.AddRow();

                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_ProcessWI_PK, txtWIMasterPK.text );  
                            
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Seq, grdWIDetail.rows-1 );
                            
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_WP_PK,   data[0] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_WP_Name, data[1] );                                                       
                            
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_WI_Qty, data[14] );
                            
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_SPEC01_PK, data[2] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Spec_01,   data[3] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_SPEC02_PK, data[4] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Spec_02,   data[5] );                                                
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_SPEC03_PK, data[6] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Spec_03,   data[7] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_SPEC04_PK, data[8] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Spec_04,   data[9] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_SPEC05_PK, data[10] );
                            grdWIDetail.SetGridText( grdWIDetail.rows-1, G3_Spec_05,   data[11] );     
                                                        
                            grdWIDetail.SetCellBgColor( grdWIDetail.rows-1, G3_Seq , grdWIDetail.rows-1, G3_Seq, 0xCCFF99 );                                                                         
                        }                 
                 }            
            break;
     }         
}

//==========================================================================

function OnSave(pos)
{
    switch(pos)
    {
        case 'Master': 
            flag = 'save';  
            data_fppr00030_1.Call();                
        break;
       
        case 'Detail':
            data_fppr00030_2.Call();
        break;
    } 
}

//==========================================================================
 function OnDelete(index)
 {
    switch(index)
    {
        case'Master':
            if ( confirm( "Do you want to delete this Slip ?" ) ) 
		    {
		        flag = 'delete';
		        data_fppr00030_1.StatusDelete();
                data_fppr00030_1.Call();
	        }        
        break;
        
        case 'Detail':
            if ( grdDetail.GetGridData( grdDetail.row, G2_Detail_PK ) == "" ) 
		    {						            				
		        grdDetail.RemoveRow();					
		    }        			
		    else 
	        {  
		        grdDetail.DeleteRow();
	        }
        break;
    }         
 }

//==========================================================================
function OnUnDelete() 
{
    grdDetail.UnDeleteRow();
}

//==========================================================================

 function CheckInput(obj)
 { 
    var  row, col;
   
    switch (obj.id)
    {
        case 'grdDetail':
            row = event.row ;
            col = event.col ;    
            
            if ( col == G2_Qty_01 || col == G2_Qty_02 || col == G2_Qty_03 || col == G2_UP || col == G2_Amount )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdDetail.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdDetail.SetGridText(row,col,"")
                }         
                //---------------------------------------------
                if ( col == G2_Qty_01 || col == G2_UP )
                {
                    
                    var dUP  =  Number(grdDetail.GetGridData( row, G2_UP     ));
                    var dQty =  Number(grdDetail.GetGridData( row, G2_Qty_01 ));
                    var dAmount = dUP * dQty;
                    
                    grdDetail.SetGridText( row, G2_Amount,parseFloat(dAmount+"").toFixed(2));
                }
            }         
        break;
    }        
 }
//==========================================================================
 function OnReportClick()
 {
     if (txtMasterPK.text!="")
        { 
              //var url =System.RootURL + '/reports/ds/cd/fppr00030.xls?sopk=' + txtMasterPK.text  ;
              //var url =System.RootURL + '/reports/ds/cd/dscd00070_YC.aspx?sopk=' + txtMasterPK.text  ;
              var url =System.RootURL + '/reports/ds/cd/dscd00070_HC.aspx?sopk='+ txtMasterPK.text +'&delimethod='+lstDeliMethod.value ;
	          window.open(url); 
        }       
    else    
              alert("Please,Select a Take out to print !")
   
 }
//==========================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;
		grdDetail.GetGridControl().ColHidden(G2_LOT_NO)    = true ;
		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = false ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = false ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = false ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;
		grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ;
		grdDetail.GetGridControl().ColHidden(G2_LOT_NO)    = false ;				
		
        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//==========================================================================
function OnCellDoubleClick(obj)
{
    switch (obj.id)
    {
        case 'grdDetail':
            var row,col;            
            col = event.col;
            row = event.row;
            
            if ( col == G2_Out_WH_Name )
            {
                 var path = System.RootURL + '/form/fp/ab/fpab00240.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes'); 
                              
                 if ( obj != null )
                 {
                     grdDetail.SetGridText( row, G2_Out_WH_PK,    obj[0]);//warehouse_pk	 
                     grdDetail.SetGridText( row, G2_Out_WH_Name , obj[2]);//warehouse_name       
                 }
            }
            else if ( col == G2_Lot_No )
            {
                 var path = System.RootURL + '/form/fp/ab/fpab00280.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes'); 
                              
                 if ( obj != null )
                 {
                     grdDetail.SetGridText( row, G2_LOTNO_PK, obj[0]);//lotno_pk	 
                     grdDetail.SetGridText( row, G2_Lot_No,   obj[1]);//lot_no       
                 }            
            } 
            else if ( col == G2_Out_ItemCode || col == G2_Out_ItemName )
            {
                 var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y||||';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes'); 
                              
                 if ( obj != null )
                 {
                     grdDetail.SetGridText( row, G2_Out_Item_PK,  obj[0]);//item_pk	 
                     grdDetail.SetGridText( row, G2_Out_ItemCode, obj[1]);//item_code  
                     grdDetail.SetGridText( row, G2_Out_ItemName, obj[2]);//item_name	 
                     grdDetail.SetGridText( row, G2_UOM_01,       obj[5]);//uom   
                 }             
            }
            else if ( col == G2_UOM_01 || col == G2_UOM_02 || col == G2_UOM_03 )
            {
                 var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
                 var obj = System.OpenModal( path ,600 , 500 ,  'resizable:yes;status:yes'); 
                              
                 if ( obj != null )
                 {
                     grdDetail.SetGridText( row, col, obj[1]);//UOM	  
                 }             
            }                               
        break;
    }
}
//==========================================================================
</script>

<body>
    <!---------------------------------------------------------------------------->
    <gw:data id="data_fppr00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00030" > 
                <input bind="grdSearch" > 
                     <input bind="txtSearchNo" /> 
                     <input bind="dtFromDate" /> 
                     <input bind="dtToDate" />                      
                 </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="data_fppr00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="<%=l_user%>lg_sel_fppr00030_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" procedure="<%=l_user%>lg_upd_fppr00030_1" > 
                <inout > 
                     <inout bind="txtMasterPK" /> 
                     <inout bind="txtSlipNo" /> 
                     <inout bind="dtDate" />
                     <inout bind="lblStatus" /> 
                     <inout bind="lstWH"/>
                     <inout bind="lstLine"/>                     
                     <inout bind="txtOrdPlanPK"/>
                     <inout bind="txtRefPONo"/>                     
                     <inout bind="txtStylePK"/>
                     <inout bind="txtStyleName"/>
                     <inout bind="txtChargerPK"/>
                     <inout bind="txtChargerNm"/>
                     <inout bind="txtDescription"/>
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="data_fppr00030_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00030_2" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" procedure="<%=l_user%>lg_upd_fppr00030_2"> 
                <input bind="grdDetail" > 
                     <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Date
                        </td>
                        <td style="width: 94%; white-space: nowrap">
                            <gw:datebox id="dtFromDate" lang="1" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 25%; white-space: nowrap">
                            No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtSearchNo" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Slip No|Status|Conf Date|P/O No" format="0|0|0|4|0"
                                aligns="0|0|0|1|0" defaults="|||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1000"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b>Slip No</b>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtDate" lang="1" />
                        </td>
                        <td style="width: 30%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNew" img="new" alt="New Take Out Goods" text="Add" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnReport" img="excel" alt="Print" text="Print" onclick="OnReportClick()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('PO')">P/O No</b>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none;' />
                            <gw:textbox id="txtRefPONo" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Style')">Style</b>
                        </td>
                        <td style="width: 60%" colspan="8">
                            <gw:textbox id="txtStylePK" styles='width:100%; display:none' />
                            <gw:textbox id="txtStyleName" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            W/H
                        </td>
                        <td align="left" style="width: 30%" colspan="2">
                            <gw:list id="lstWH" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td colspan="7">
                            <gw:list id="lstLine" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Charger')">Charger</b>
                        </td>
                        <td style="width: 30%" colspan="2">
                            <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                            <gw:textbox id="txtChargerNm" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 10%">
                            <b>Description</b>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtDescription" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 10%; white-space: nowrap" align="left">
                                        <img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                                    </td>
                                    <td style="width: 30%">
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 1%" align="left">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:icon id="ibtnNew2" img="2" text="Comp" onclick="OnAddNew('grdDetail')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnUnDelete_1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_PK|_CONF_M_PK|Seq|_ITEM_PK|_COMP_PK|Comp ID|Comp Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Lot No|Begin Qty|In Qty|Out Qty|End Qty|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|0'
                                editcol='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1' widths='0|0|800|0|0|1200|2500|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" oncelldblclick="OnCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!-------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!-------------------------------------------------------------->
</body>
</html>
