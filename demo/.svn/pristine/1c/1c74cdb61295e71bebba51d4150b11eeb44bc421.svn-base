<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Exchange Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//-----------------------------------------------------

var flag,row_no;
var G_PK        = 0,
    G_Status    = 1,
    G_SLip_No   = 2,
    G_Date      = 3,
    G_Ref_No    = 4;

//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_Seq              = 1,
    G1_Ref_No           = 2,
    G1_REQ_ITEM_PK      = 3,
    G1_Req_Item_Code    = 4,
    G1_Req_Item_Name    = 5,
    G1_TRANS_ITEM_PK    = 6,
    G1_TRANS_ITEM_CODE  = 7,
    G1_TRANS_ITEM_NAME  = 8,
    G1_Req_Qty          = 9,
    G1_Req_UOM          = 10,
    G1_TRANS_QTY        = 11,
    G1_TRANS_UOM        = 12,
    G1_NULL_04          = 13,
    G1_NULL_05          = 14,
    G1_NULL_06          = 15,
    G1_NULL_07          = 16,
    G1_NULL_08          = 17,
    G1_Req_LotNo        = 18,  
    G1_Lot_No           = 19,
    G1_NULL_01          = 20,
    G1_Description      = 21,
    G1_MASTER_PK        = 22,
    G1_NULL_02          = 23,
    G1_NULL_03          = 24;
    
var arr_FormatNumber = new Array();     
               
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
	
    txtUser_PK.text = "<%=session("USER_PK")%>";  
	txtEmpPK.text   = "<%=Session("EMPLOYEE_PK")%>"  ;	
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
	
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtExPLName.SetEnable(false);  
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
 
    //----------------------------         
    SetGridFormat();  

    //----------------------------
    OnAddNew('Master');
   //----------------------------
 
    dso_wh_list.Call()
 }
 //==================================================================================
  function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G1_Req_Qty)   = "#,###,###,###,###,###.###";
    ctr.ColFormat(G1_TRANS_QTY) = "#,###,###,###,###,###.###";
    
    arr_FormatNumber[G1_Req_Qty]   = 3;
    arr_FormatNumber[G1_TRANS_QTY] = 3;
	//-----------------------           

	var data = ""; 
     
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn ='Y'   ORDER BY wh_name  ASC" )%>";    
    lstExchangeWH.SetDataText(data);     
    
	data = data + "||";         
    lstWH.SetDataText(data);  	
           
 }
 //---------------------------------------------------------------------------------------------------
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bias00040_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        //==========================================
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)      
                    {    
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Seq, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk                                                           
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK  , arrTemp[0]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Code, arrTemp[1]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Name, arrTemp[2]);//item_name                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_UOM      , arrTemp[5]);
                                                   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_PK,   arrTemp[0]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_CODE, arrTemp[1]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_NAME, arrTemp[2]);//item_name        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_UOM,       arrTemp[5]);//item_uom
                    }   
             }        
        break;     
        //=================================
        case 'Stock':
             
			 var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse='+ lstExchangeWH.value ;//purchase_yn=Y
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)      
                    {    
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Seq, grdDetail.rows-1);
                            //=====
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk                                                           
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[3]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Code, arrTemp[4]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Name, arrTemp[5]);//item_name                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_UOM          , arrTemp[6] ); 
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Qty          , arrTemp[8] );     
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_LotNo        , arrTemp[10]);                                                
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_PK,   arrTemp[3]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_CODE, arrTemp[4]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_NAME, arrTemp[5]);//item_name        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_UOM,       arrTemp[6]);//item_uom  
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Lot_No,          arrTemp[10]);//lotno                         
                    }                   
            } 
			 
			 /*var path = System.RootURL + '/standard/forms/bi/as/bias00011.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)      
                    {    
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Seq, grdDetail.rows-1);
                            //=====
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk                                                           
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[3]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Code, arrTemp[4]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Item_Name, arrTemp[5]);//item_name                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_UOM          , arrTemp[6]); 
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_Qty          , arrTemp[7]);     
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Req_LotNo        , arrTemp[8]);                                                
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_PK,   arrTemp[3]);//item_pk        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_CODE, arrTemp[4]);//item_code        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_ITEM_NAME, arrTemp[5]);//item_name        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TRANS_UOM,       arrTemp[6]);//item_uom  
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Lot_No,       arrTemp[8]);//lotno                         
                    }                   
            } */
        break;
 
		case 'DETAIL':                          
			grdDetail.AddRow();
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_Seq, 	grdDetail.rows-1   );	
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk				
        break;		
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bias00040.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_bias00040_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    data_bias00040_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_bias00040_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bias00040_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bias00040_1": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
                            
        break;

        case "data_bias00040_2":
           
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_TRANS_ITEM_CODE, grdDetail.rows - 1, G1_TRANS_ITEM_CODE,  true);
                
                grdDetail.SetCellBold( 1, G1_Req_Qty,   grdDetail.rows - 1, G1_Req_Qty,   true);
                grdDetail.SetCellBold( 1, G1_TRANS_QTY, grdDetail.rows - 1, G1_TRANS_QTY, true);
                
                grdDetail.SetCellBold( 1, G1_Ref_No, grdDetail.rows - 1, G1_Ref_No, true);
                
                grdDetail.SetCellBgColor( 1, G1_Req_Item_Code , grdDetail.rows - 1, G1_Req_Item_Name , 0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && (grdDetail.GetGridData( i, G1_REQ_ITEM_PK) == grdDetail.GetGridData( i, G1_TRANS_ITEM_PK)))
                    {
                        
                        grdDetail.GetGridControl().Cell( 7, i, G1_TRANS_ITEM_CODE, i, G1_TRANS_ITEM_NAME ) = 0x3300cc;
                        
                    }                    
                }        
                //--------------------------------                
            }         
        break;

        case 'pro_bias00040':
            alert(txtReturnValue.text);
            			
			flag = 'view' ;
            data_bias00040_1.Call("SELECT");
			
        break;  
        
		case 'pro_bias00040_1':
			alert("Copy finish.");
			
			flag = 'view' ;
            data_bias00040.Call("SELECT");
		break;         
        
        case 'dso_wh_list':
            lstWH.SetDataText(txtWHStr.text +"||");
            lstWH.value = '';
            lstExchangeWH.SetDataText(txtWHStr.text);
        break;        
   }            
}

//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;                            

		case 'EX_WH':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx' ;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                lstExchangeWH.value = obj[0];                 
            }
        break;
		        
        case 'EX_PL': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtExPLPK.text   = oValue[6]; 
                txtExPLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;      
        case 'Report': // PL
            if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/as/bias00041.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break;      
                
    }           
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':           
            if(flag == 'delete')
            {
                data_bias00040_2.Call();
            }
            else
            {
                if( Validate() )
                {
                    data_bias00040_1.Call();
                    flag='save';
                } 
            }
        break;
        
        case 'Detail':        
            data_bias00040_2.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {                
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G1_Req_UOM || event_col == G1_TRANS_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
                       var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
                       
                       if ( obj != null )
                       {
                            grdDetail.SetGridText( event_row, event_col, obj[1]);
                       }    
                 }
                 else if ( event_col == G1_TRANS_ITEM_CODE || event_col == G1_TRANS_ITEM_NAME )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_TRANS_ITEM_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_TRANS_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G1_TRANS_ITEM_NAME,   object[2] );
                       }                       
                 }
            break;             
      }         
}   

//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_bias00040_1.StatusDelete();
                data_bias00040_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == '' )
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
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{   
    var temp = "";
    row_no = "";
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if(Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && grdDetail.GetGridData( i, G1_REQ_ITEM_PK) == grdDetail.GetGridData( i, G1_TRANS_ITEM_PK) && grdDetail.GetGridData( i, G1_Req_UOM) == grdDetail.GetGridData( i, G1_TRANS_UOM) && grdDetail.GetGridData( i, G1_Req_LotNo) == grdDetail.GetGridData( i, G1_Lot_No))
        {
            row_no += temp + i;
            temp = ',';
        }
    }
    //----------------
    if(row_no.length > 0)
    {
        alert("Duplicate items indicate at row "+ row_no + ".");
        return false;
    }
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_Req_Qty || col == G1_TRANS_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
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

//=================================================================================
function OnPrint()
{  
    if(txtMasterPK.text != "")
    {
        //var url =System.RootURL + '/reports/bi/as/rpt_bias00040.aspx?p_master_pk=' + txtMasterPK.text + '&p_wh_name=' +  lstExchangeWH.GetText();
        //window.open(url, "_blank"); 
        
        var url =System.RootURL + '/reports/bi/as/rpt_bias00040_droco.aspx?p_master_pk=' + txtMasterPK.text ;
        window.open(url, "_blank"); 
    }
    else
    {
        alert("Pls select one slip.");
    }
}
//=================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case'0':
            var url =System.RootURL + '/reports/bi/as/rpt_bias00041.aspx?p_master_pk=' + txtMasterPK.text ;
            window.open(url, "_blank"); 
        break;
        case'1':
            var url =System.RootURL + '/reports/bi/as/rpt_bias00042.aspx?p_master_pk=' + txtMasterPK.text ;
            window.open(url, "_blank"); 
        break;
    }
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
            if ( confirm('Do you want to submit this Slip?'))
            {
                pro_bias00040.Call();
            }               
        break;    
        case 'Copy' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make a copy for this slip?'))
                {
                    pro_bias00040_1.Call();
                } 
            } 
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                 
        break; 	    
    }
}
//=================================================================================
</script>

<body>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_bias00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_bias00040" > 
                <input>
                    <input bind="lstWH" />  
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_bias00040_1"  procedure="st_lg_upd_bias00040_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtTransDate" />  
                     <inout  bind="lblStatus" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lstExchangeWH" />
                     <inout  bind="txtExPLPK" />
                     <inout  bind="txtExPLName" />
                     <inout  bind="txtRefNo" />
                     <inout  bind="txtRemark" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00040_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" function="st_lg_sel_bias00040_2"   procedure="st_lg_upd_bias00040_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
					<input bind="txtLang" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00040" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
     <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00040_4" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------COPY------------------------------------------>
    <gw:data id="pro_bias00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bias00040_1" > 
                <input>
                    <inout bind="txtMasterPK" />
					<inout bind="txtEmpPK" />
                </input> 
                <output> 
                     <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 94%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
						</td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="3">
                            <gw:imgbtn id="idBtnCopySlip" img="copy" text="Copy" onclick="OnProcess('Copy')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Ref No" format="0|0|0|4|0"
                                aligns="0|0|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtTransDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="idBtnSubmit" img="Submit" text="Submit" onclick="OnProcess('Submit')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp('Report')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Ref No
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="WareHouse" onclick="OnPopUp('EX_WH')" href="#tips" style="color: #0000ff">
                                <b>Ex W/H</b></a>
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:list id="lstExchangeWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="Out P/L" onclick="OnPopUp('EX_PL')" href="#tips" style="color=#0000ff"><b>
                                Ex P/L</b></a>
                        </td>
                        <td style="white-space: nowrap" colspan="7">
                            <gw:textbox id="txtExPLPK" styles="display:none" />
                            <gw:textbox id="txtExPLName" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="12">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">                                   
                                    </td>
                                    <td style="width: 64%" align="right">
                                    </td>
                                    <td style="width: 19%" align="center">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnStock" img="Stock" text="Stock" onclick="OnAddNew('Stock')" />                                    
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnFreeItem" img="Free Item" text="Free Item" onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td align="right" style="width: 1%">
										<gw:imgbtn id="btnNewD" img="new" alt="New" text="New" onclick="OnAddNew('DETAIL')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_TRANS_ITEM_PK|Trans Item Code|Trans Item Name|Req Qty|UOM|Trans Qty|UOM|_N_04|_N_05|_N_06|_N_07|_N_08|Req Lot No|Lot No|_NULL_01|Remark|_ST_TRANSFER_M_PK|_NULL_02|_NULL_03'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|1|1|0|0|0|0'
                                check='||||||||||||||||||||||||' editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|0|1|1|1|0|0|0'
                                widths='0|800|1000|0|1500|2000|0|1500|2000|1200|1000|1200|1000|1500|1500|800|1500|1500|1500|1500|1500|1000|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
	<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!---------------------------------------------------------------------------------->
    <gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
	
	<gw:textbox id="txtLang" styles='width:100%;display:none' />	
</body>
</html>
