<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>IQC Request Label</title>
    <% ESysLib.SetUser("prod")%>

    <script>
 //---------------------------------------------------------
 
 var G_Item_PK      = 0,
     G_Item_Code    = 1,
     G_Item_Name    = 2,
     G_PO_No        = 3,
     G_TPR_LOTNO_PK = 4,
     G_Lot_No       = 5,
     G_Seq          = 6,
     G_BC           = 7,
     G_Sti_Length   = 8,
     G_Act_Length   = 9,
     G_L_UOM        = 10,
     G_Sti_Weight   = 11,
     G_Act_Weight   = 12,
     G_W_UOM        = 13;    
 //---------------------------------------------------------
var p_iqcreq_pk  ;
var p_iqcreqd_pk ;
var p_iqcreq_no  ;

 function BodyInit()
 {
    p_iqcreq_pk  = "<%=request.QueryString("iqcreq_pk") %>" ;
    p_iqcreqd_pk = "<%=request.QueryString("iqcreqd_pk")%>" ;
    p_iqcreq_no  = "<%=request.QueryString("iqcreq_no") %>" ;
     
    txtIQCReqPK.text = p_iqcreq_pk ;
    txtIQCReqNo.text = p_iqcreq_no ;
    //------------------------------
    txtIQCReqNo.SetEnable(false);
    //------------------------------
    
    FormatGrid();
    //-------------------------------
    OnSearch('lstIQCD');
 }
 //==========================================================

 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat( G_Sti_Length ) = "###,###,###,###,###.##";
      trl.ColFormat( G_Act_Length ) = "###,###,###,###,###.##";
      trl.ColFormat( G_Sti_Weight ) = "###,###,###,###,###.##";
      trl.ColFormat( G_Act_Weight ) = "###,###,###,###,###.##";
 } 
 //==========================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Requester':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequester.text   = obj[2];
                txtRequesterPK.text = obj[0];
            }
        break; 
                
    }
}                

//-----------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'lstIQCD' :
            pro_fpfo00121.Call();
        break; 
        
        case 'grdDetail':            
            data_fpfo00121.Call("SELECT");
        break;
    }
}
//-----------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "pro_fpfo00121_1": 
             alert(txtReturnValue.text);  
             
             OnSearch('grdDetail');                
        break;
        
        case "pro_fpfo00121":
             if ( p_iqcreqd_pk > 0 )
             {
                lstIQCD.value = p_iqcreqd_pk; 
             } 
             
             OnSearch('grdDetail');                 
        break; 
        case "data_fpfo00121":
            lblCount.text = (grdDetail.rows -1) + " row(s) " ;
        break;
    } 
}

//------------------------------------------------------------------------------------------------

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G1_PK ) == '' )
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
//-----------------------------------------------------------------

function OnSave(pos)
{    
    data_fpfo00121.Call();
}

//---------------------------------------------------------------------------------------------------

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G_Sti_Length || col == G_Act_Length || col == G_Sti_Weight || col == G_Act_Weight )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {   
                grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(2));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
    }
}
//======================================================================
function OnGridCellDoubleClick(oGrid)
{
    var  row, col ;
    
    row = event.row ;
    col = event.col ; 
    
    if ( col == G_Lot_No )
    {
          var path   = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk=' + grdDetail.GetGridData( row, G_Item_PK ) + '&item_code=' + grdDetail.GetGridData( row, G_Item_Code ) + '&item_name=' + grdDetail.GetGridData( row, G_Item_Name ) ;
          var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
          
          if ( object != null )
          {
                grdDetail.SetGridText( row, G_TPR_LOTNO_PK, object[0]);
                grdDetail.SetGridText( row, G_Lot_No,       object[1]);
          }
    }
    else if ( col == G_L_UOM || col == G_W_UOM )
    {
           var path = System.RootURL + '/form/fp/ab/PopUpGetUOM.aspx';
           var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:550px;dialogHeight:500px');	

           if ( obj != null )
           {
                grdDetail.SetGridText( row, col, obj[1]);
           }	    
    }
}
//===================================================================================== 
function OnExcelClick(index)
{
    switch(index)
    {
        case 1:
        var url = System.RootURL + '/reports/fp/fo/fpfo00120.aspx?tpr_reqiqc_pk=' + txtIQCReqPK.text + '&tpr_reqiqcd_pk=' + lstIQCD.value + '&isMaster=0' ;
        window.open(url);
        break;
        case 2:
        var url = System.RootURL + "/system/ReportEngine.aspx?file=fp/fo/fpfo00120.rpt&procedure=prod.sp_rpt_fpfo00120&parameter=" + txtIQCReqPK.text + "," + lstIQCD.value + "&export_pdf=Y" ;              
            System.OpenTargetPage(url); 
        break;
    }
}
//===================================================================================== 
function OnDeleteDetail()
{
    grdDetail.DeleteRow();
} 
//======================================================================

function OnUnDelete()
{
	grdDetail.UnDeleteRow();
}
//======================================================================

function OnProcess()
{
    var process = 1;
    if (grdDetail.rows>1)
    {
        if(!confirm("This Request has been made label.\nDo you want to delete all and remake? "))
            process =0;
    }
    
    if(process!=0)
        pro_fpfo00121_1.Call();
}
//======================================================================
     
    </script>

</head>
<body>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00121" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="prod.sp_sel_fpfo00121" procedure = "prod.sp_upd_fpfo00121" > 
                <input bind="grdSearch" >
                    <input bind="txtIQCReqPK" />
				    <input bind="lstIQCD" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfo00121" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="prod.sp_pro_fpfo00121" > 
                <input>
                    <input bind="txtIQCReqPK" /> 
                </input> 
                <output>
                    <output bind="lstIQCD" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfo00121_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="prod.sp_pro_fpfo00121_1" > 
                <input>
                    <input bind="txtIQCReqPK" />
				    <input bind="lstIQCD" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table border="1" style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            IQC Req</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtIQCReqPK" styles="width:100%;display:none" />
                            <gw:textbox id="txtIQCReqNo" styles="width:100%;" csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            P/O</td>
                        <td style="width: 30%">
                            <gw:list id="lstIQCD" styles="width:100%;" csstype="mandatory" onchange="OnSearch('grdDetail')"></gw:list>
                        </td>
                        <td style="width: 24%">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnProcess" img="2" text="Make Label" styles='width:100%' onclick="OnProcess()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Excel" text="Excel" onclick="OnExcelClick(1)" />
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="ibtnExcel1" img="excel" alt="Print Label" text="Print Label" onclick="OnExcelClick(2)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDeleteDetail()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUnDelete" img="udelete" alt="UnDelete" text="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='_Item_PK|Item Code|Item Name|P/O No|_TPR_LOTNO_PK|Lot No|Seq|B/C|Sti Width|Act Width|Wd.UOM|Sti Length|Act Length|L.UOM|Sti Weight|Act Weight|W.UOM'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|1|3|3|1|3|3|1|3|3|1' defaults='||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|1|1|0|1|1|0|1|1|0' widths='1000|1500|2000|1500|1000|1200|800|1600|1200|1200|1000|1200|1200|1000|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
