<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>W/I Material Consumption</title>
</head>

<script>

var  user_pk = "<%=Session("EMPLOYEE_PK")%>" 
var  user_name = "<%=Session("USER_NAME")%>" 
    
var flag =0
    
var G1_PK           = 0,
    G1_ST_MAT_PK    = 1,
    G1_MAT_PK       = 2,
    G1_Code         = 3,
    G1_Name         = 4,
    G1_Qty       = 5,
    G1_UOM       = 6,
    G1_NULL_01      = 7,
    G1_NULL_02      = 8,
    G1_SPEC01_PK    = 9,
    G1_Spec_01      = 10,
    G1_SPEC02_PK    = 11,
    G1_Spec_02      = 12,
    G1_SPEC03_PK    = 13,
    G1_Spec_03      = 14,
    G1_SPEC04_PK    = 15,
    G1_Spec_04      = 16,
    G1_SPEC05_PK    = 17,
    G1_Spec_05      = 18,
    G1_Description  = 19,
    G1_WI_PK        = 20;
 //===============================================================
 function BodyInit()
 {
    System.Translate(document);
     //----------------------
     txtWIMasterPK.text = "<%=Request.querystring("WI_PK")%>"; 
     //----------------------
     FormatGrid();
     //---------------------- 
     OnSearch('grdDetail');  
 }
 
 //===============================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                 data_fppw00011.Call("SELECT");
            break;
      }  
 }
 
//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      trl.ColFormat(G1_Qty)   = "###,###,###,###,###.##";
      //-------------------------------------------------               
 }        

//===================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {		        
            case 'data_fppw00011' :
                lbRecord.text = grdDetail.rows-1 + " row(s)";
                
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G1_Qty, grdDetail.rows - 1, G1_Qty,  true);  
                    
                    for ( var i=1; i<grdDetail.rows; i++ )
                    {
                        if ( grdDetail.GetGridData( i, G1_MAT_PK) == 0 && grdDetail.GetGridData( i, G1_ST_MAT_PK) != 0 )
                        {
                            grdDetail.SetCellBgColor( i, G1_Code , i, G1_Description , 0xCCFFFF );                                     
                        }
                    }                  
                }
            break;
            
            case 'pro_fppw00011':
                alert(txtReturnValue.text);
                
                OnSearch('grdDetail');
            break;
            
            case 'pro_fppw00011_1':
                alert(txtReturnValue.text);
                
                OnSearch('grdDetail');
            break;            
      }  
 }
 
//===================================================================

 function CheckInput(obj)
 { 
    var  row, col;
   
    switch (obj.id)
    {
        case 'grdDetail':
            row = event.row ;
            col = event.col ;    
            
            if ( col == G1_Qty )
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
            }         
        break;
    }        
 }
 
//===================================================================

 function OnAddNew(pos)
 {
    switch (pos)
    {
        case 'grdDetail' :
            if ( txtWIMasterPK.text == '')
            {
                alert('Pls select a saved W/I.');
                return;
            }
            
            grdDetail.AddRow();
            grdDetail.SetGridText( grdDetail.rows-1, G1_WI_PK, txtWIMasterPK.text );
            grdDetail.SetCellBgColor( grdDetail.rows - 1, G1_Code, grdDetail.rows - 1, G1_Description, 0xFFFFCC );                                     
            
        break;
    }     
 }
//===================================================================

function OnGridCellDblClick(obj)
{
    var event_col = event.col;
    var event_row = event.row;
    
    switch (obj.id)
    {
        case 'grdDetail' :
            if ( event_col == G1_Code || event_col == G1_Name )
            {
                if ( radSearchItem.GetData() == '1' )
                {
                    if ( grdDetail.GetGridData( event_row, G1_ST_MAT_PK) == '' && grdDetail.GetGridData( event_row, G1_MAT_PK) == '' )
                    {
                        var path = System.RootURL + '/form/fp/ab/fpab00210.aspx?group_type=||Y|Y||';
                        var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	                
                        
                        if ( object != null )
                        {
                            var arrTemp;
                            for( var i=0; i < object.length; i++)	  
                            {                    
                                arrTemp = object[i];
                                
                                if ( i == 0 )
                                {
                                    grdDetail.SetGridText( event_row, G1_ST_MAT_PK, arrTemp[0] );
                                    grdDetail.SetGridText( event_row, G1_Code,      arrTemp[1] );
                                    grdDetail.SetGridText( event_row, G1_Name,      arrTemp[2] );
                                    grdDetail.SetGridText( event_row, G1_UOM,    arrTemp[5] );
                                    
                                    grdDetail.SetGridText( event_row, G1_MAT_PK, '');
                                }
                                else
                                {
                                    grdDetail.AddRow();
                                    
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_WI_PK, txtWIMasterPK.text );
                                    grdDetail.SetCellBgColor( grdDetail.rows - 1, G1_Code, grdDetail.rows - 1, G1_Description, 0xFFFFCC );
                                    
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_ST_MAT_PK, arrTemp[0] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_Code,      arrTemp[1] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_Name,      arrTemp[2] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,    arrTemp[5] );
                                    
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_MAT_PK, '');
                                    
                                }                                
                            }
                        }     
                    }
                    else
                    {
                        var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=||Y|Y||';
                        var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	                
                        
                        if ( object != null )
                        {
                            grdDetail.SetGridText( event_row, G1_ST_MAT_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_Code,      object[1] );
                            grdDetail.SetGridText( event_row, G1_Name,      object[2] );
                            grdDetail.SetGridText( event_row, G1_UOM,    object[5] );
                            
                            grdDetail.SetGridText( event_row, G1_MAT_PK, '');
                        }                   
                    }                 
                }
                else
                {                
                    if ( grdDetail.GetGridData( event_row, G1_ST_MAT_PK) == '' && grdDetail.GetGridData( event_row, G1_MAT_PK) == '' )
                    {
                        var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=||Y|Y||';
                        var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	                
                        
                        if ( object != null )
                        {
                            var arrTemp;
                            for( var i=0; i < object.length; i++)	  
                            {	
                                arrTemp = object[i];
                                
                                if ( i == 0 )
                                {
                                    grdDetail.SetGridText( event_row, G1_MAT_PK, arrTemp[0] );
                                    grdDetail.SetGridText( event_row, G1_Code,   arrTemp[1] );
                                    grdDetail.SetGridText( event_row, G1_Name,   arrTemp[2] );
                                    grdDetail.SetGridText( event_row, G1_UOM, arrTemp[5] );
         
                                    grdDetail.SetGridText( event_row, G1_ST_MAT_PK, '');                            
                                }
                                else
                                {
                                    grdDetail.AddRow();
                                    
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_WI_PK, txtWIMasterPK.text );
                                    grdDetail.SetCellBgColor( grdDetail.rows - 1, G1_Code, grdDetail.rows - 1, G1_Description, 0xFFFFCC );
                                    
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_MAT_PK, arrTemp[0] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_Code,   arrTemp[1] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_Name,   arrTemp[2] );
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_UOM, arrTemp[5] );
         
                                    grdDetail.SetGridText( grdDetail.rows-1, G1_ST_MAT_PK, '');                            
                                }
                            }
                        }     
                    }
                    else
                    {
                        var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                        var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	                
                        
                        if ( object != null )
                        {
                            grdDetail.SetGridText( event_row, G1_MAT_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_Code,   object[1] );
                            grdDetail.SetGridText( event_row, G1_Name,   object[2] );
                            grdDetail.SetGridText( event_row, G1_UOM, object[5] );
                            
                            grdDetail.SetGridText( event_row, G1_ST_MAT_PK, '');
                        }
                    }    
                    return ;                  
                }
            }
        break;
    }
}
 
//=================================================================== 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                 data_fppw00011.Call();
            break;
      }  
 }
 
//===================================================================

function OnDelete(pos)
{
    switch(pos)
    {        
        case 'grdDetail' :
            for ( var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                    if ( grdDetail.GetGridData( i, G1_PK) == '' )
                    {
                        grdDetail.RemoveRowAt(i);                 
                    }   
                    else
                    {
                        grdDetail.DeleteRow();  
                    } 
                }    
            }            
        break;
        
    }
}

//====================================================================
function OnUnDelete(obj)
{
    switch(obj)
    {
        case 'grdDetail' :
            grdDetail.UnDeleteRow();  
        break; 
    }

}
//====================================================================

function OnProcess(pos)
{
      switch (pos)         
      {		        
            case 'GenCons' :
                if ( txtWIMasterPK.text != '' )
                {
                    pro_fppw00011.Call();
                }
                else
                {
                    alert('Pls select saved W/I.');
                }
            break;  
            
            case 'TOReq' :
                if ( txtWIMasterPK.text != '' )
                {
                    pro_fppw00011_1.Call();
                }
                else
                {
                    alert('Pls select saved W/I.');
                }
            break;                       
       }     
}

//=======================================================================
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'StockCheck':
            var path = System.RootURL + '/form/fp/ab/fpab00170.aspx';
            var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	                
        break;
    }
}
//=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppw00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="<%=l_user%>lg_sel_fppw00011" procedure="<%=l_user%>lg_upd_fppw00011" > 
                <input> 
                    <input bind="txtWIMasterPK" /> 
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00011" > 
                <input>
                    <input bind="txtWIMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00011_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00011_1" > 
                <input>
                    <input bind="txtWIMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%; background-color: CCFFFF">
                    <tr>
                        <td style="width: 1%">
                            <gw:icon id="ibtnStockCheck" img="2" text="Stock Checking" alt="Warehouse Stock Checking"
                                onclick="OnPopUp('StockCheck')" styles='width:100%' />
                        </td>
                        <td style="width: 97%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="ibtnLoadCons" img="2" text="Generate Cons" alt="Generate Material Consumption"
                                onclick="OnProcess('GenCons')" styles='width:100%' />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="ibtnTOReq" img="2" text="Generate T/O Req" alt="Make Take Out Material Request"
                                onclick="OnProcess('TOReq')" styles='width:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="left">
                            <gw:radio id="radSearchItem" value="1" styles="width:100%">                      
			                    <span value="1">ST Item</span>                       
			                    <span value="2">Item</span>    			                                
        			        </gw:radio>
                        </td>
                        <td style="width: 10%" align="right">
                            Item
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtItem" styles='width:100%' />
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="OnAddNew('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDel_1" onclick="OnDelete('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDel_1" onclick="OnUnDelete('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave_1" onclick="OnSave('grdDetail')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_PK|_ST_MAT_PK|_MAT_PK|Code|Name|Qty|UOM|_NULL 01|_NULL_02|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Description|_WI_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|1|3|1|0|1|0|1|0|1|0|1|0|1|0|0'
                                defaults='||||||||||||||||||||' editcol='0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|0|0|0|0|1|0'
                                widths='0|0|0|1500|3500|1500|800|1500|800|0|1500|0|1500|0|1500|0|1500|0|1500|1000|0'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)'
                                onafteredit="CheckInput(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIMasterPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
