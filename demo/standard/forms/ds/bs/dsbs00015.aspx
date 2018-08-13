<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP CREATE & SELECT ITEM</title>
</head>

<script> 
//--Spec Group List
var     G1_TCO_SPECGRP_PK   = 0,
        G1_SPECGRP_NM       = 1,
        G1_TCO_SPEC_PK      = 2,
        G1_SPEC_ID          = 3,
        G1_SPEC_NM          = 4;
        
//--Spec List 
var     G2_CHK      = 0,
        G2_SPEC_PK  = 1,
        G2_SPEC_ID  = 2,
        G2_SPEC_NM  = 3;   
        
//--Item List 
var     G3_SEQ              = 0,
        G3_ST_NAME          = 1,
        G3_SPEC01_PK        = 2,
        G3_SPEC01_NM        = 3,
        G3_SPEC02_PK        = 4,
        G3_SPEC02_NM        = 5,
        G3_SPEC03_PK        = 6,
        G3_SPEC03_NM        = 7,
        G3_SPEC04_PK        = 8,
        G3_SPEC04_NM        = 9,
        G3_SPEC05_PK        = 10,
        G3_SPEC05_NM        = 11,
        G3_ITEM_PK          = 12,
        G3_ITEM_CODE        = 13,
        G3_ITEM_NAME        = 14,
        G3_UOM              = 15,
        G3_LOT_QTY          = 16,
        G3_ORD_QTY          = 17,
        G3_MASTER_PK        = 18,
		G3_UPRICE			= 19;
        
//--Item List 2 
var     G4_SPEC01   = 0,
        G4_SPEC02   = 1,
        G4_SPEC03   = 2,
        G4_SPEC04   = 3,
        G4_SPEC05   = 4,
        G4_LOT_QTY  = 5; 
        G4_ORD_QTY  = 6;        
        
 //==================================================================
 function BodyInit()
 {
        System.Translate(document); 
        //----------------------
        txtSTItemCode.SetEnable(false);
        txtSTItemName.SetEnable(false);
        //----------------------
        var p_tco_stitem_pk = "<%=Request.querystring("tco_stitem_pk")%>";
		var p_bill_to_pk    = "<%=Request.querystring("bill_to_pk")%>";       
		            
        if ( Number(p_tco_stitem_pk) > 0 && Number(p_bill_to_pk) )
        {            
            txtSTItemPK.text = Number(p_tco_stitem_pk);
			txtBillToPK.text = Number(p_bill_to_pk);
			
            data_dsbs00015.Call("SELECT");
        }
        else
        {
            alert('Pls select valid ST Item & Bill To');
        }
      
        //----------------------
        grdItemList.GetGridControl().ColFormat(G3_ORD_QTY)  = "###,###,###,###,###.##";
		grdItemList.GetGridControl().ColFormat(G3_LOT_QTY)  = "###,###,###,###,###";
		
        grdGoupItem.GetGridControl().ColFormat(G4_ORD_QTY) = "###,###,###,###,###.##";  		         
        grdGoupItem.GetGridControl().ColFormat(G4_LOT_QTY) = "###,###,###,###,###";        
 } 

 //==================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 'Refresh' :         
            if ( Number(txtSTItemPK.text) > 0 )
            {            
                data_dsbs00015.Call("SELECT");
            }                      
        break;             
        
      }  
 }

 //==================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
        case "data_dsbs00015" :
            if ( Number(txtSpecGroupCount.text) > 0 )
            {
                column_width = 100 / Number(txtSpecGroupCount.text) ;
                grdItemList.ClearData();
                
                data_dsbs00015_1.Call("SELECT");
            }
            else
            {
                alert("The Group of this ST Item don't have ST Mapping Spec.");
            }
        break;
        
        case "data_dsbs00015_1" :
            SetGrid();
        break;
        
        case "pro_dsbs00015" :
            for( var i = 1; i < grdItemList.rows; i++)
            {
                grdItemList.SetGridText( i, G3_MASTER_PK, txtMasterPK.text);
            }
            
            data_dsbs00015_2.Call();
        break;
        
        case "data_dsbs00015_2" :
        break ;
        
        case 'data_dsbs00015_3':
            for ( var i = 1; i < grdSpecList.rows ; i++ )
            {
                  var ctrl = document.all(strGetGridName);
                  ctrl.AddRow();
                  ctrl.SetGridText( ctrl.rows-1, G2_SPEC_PK,    grdSpecList.GetGridData( i, G1_TCO_SPEC_PK));          
                  ctrl.SetGridText( ctrl.rows-1, G2_SPEC_ID,   grdSpecList.GetGridData( i, G1_SPEC_ID    ));       
                  ctrl.SetGridText( ctrl.rows-1, G2_SPEC_NM, grdSpecList.GetGridData( i, G1_SPEC_NM    ));       
            }
        break;
      }  
 }
 //==================================================================  
 var strGetGridName;
 function OnSearchText(pos)
 {  
        var ctrl = document.all("grd"+pos.id);
        strGetGridName = "grd"+pos.id;
        var ctrlText = document.all(pos.id);
        if(txtSTItemPK.text != "")
        {
            txtSpecGrpPK.text = pos.id;
            txtSearch.text = ctrlText.text;
            ctrl.ClearData();
            data_dsbs00015_3.Call('SELECT');            
        }
 }
 //==================================================================
var spec_grp_data = new Array(); 
var column_width;

function SetGrid()
{
    var l_data_table;
   
    //--------------------------------
    l_data_table = " <table style='width: 100%; height: 100%' > <tr> " ;
    //------------------------
    var index         = 0        ;
    var specgroup_pk  = ""       ;
    var specgroup_num = G3_SPEC01_NM ;
    
    for ( var i = 1; i < grdSpecList.rows ; i++ )
    {
        if ( specgroup_pk != grdSpecList.GetGridData( i, G1_TCO_SPECGRP_PK ) )
        {
            grdItemList.GetGridControl().ColHidden(specgroup_num)  = false ;
            grdItemList.GetGridControl().Cell( 0, 0, specgroup_num, 0, specgroup_num ) = grdSpecList.GetGridData( i, G1_SPECGRP_NM );
            grdItemList.GetGridControl().Cell( 7, 0, specgroup_num, 0, specgroup_num ) = 0x3300cc;
            
            specgroup_num = specgroup_num + 2 ;
            //------------------------
            specgroup_pk = grdSpecList.GetGridData( i, G1_TCO_SPECGRP_PK );
            
            spec_grp_data[index] = specgroup_pk;
            index++;           
            //------------------------
            l_data_table = l_data_table + " <td style='width: "+ column_width +"% '> <table style='width: 100%; height: 100%' border='1' cellpadding='1' cellspacing='0' > "  ;
              
            l_data_table = l_data_table + " <tr style='height: 1%; color: #CC0000' align='center' ><td style='white-space:nowrap'>" + grdSpecList.GetGridData( i, G1_SPECGRP_NM ) + " </td><td style='width:80%'><gw:textbox id='" + specgroup_pk +  "' styles='width:100%' onenterkey='OnSearchText(this)'/></td></tr> ";
            l_data_table = l_data_table + " <tr style='height: 99%' ><td colspan='2'>" ; 
            l_data_table = l_data_table + "     <gw:grid id='grd"+specgroup_pk+"' " ;
            l_data_table = l_data_table + "         header='-|_SpecPK|Spec ID|Spec Name'  " ;
            l_data_table = l_data_table + "         format='3|0|0|0'                        " ;
            l_data_table = l_data_table + "         aligns='0|0|0|0'                        " ;
            l_data_table = l_data_table + "         defaults='|||'                          " ;
            l_data_table = l_data_table + "         editcol='0|0|0|0'                       " ;
            l_data_table = l_data_table + "         widths='500|1000|1000|1000'             " ;
            l_data_table = l_data_table + "         sorting='T'                             " ;
            l_data_table = l_data_table + "         styles='width:100%; height:100%'  />     " ;
            l_data_table = l_data_table + " </td></tr> ";
            
            l_data_table = l_data_table + " </table> </td> " ;
        }
    }
    //------------------------
    l_data_table = l_data_table + "</tr> </table>"; 
    //--------------------------------
    document.getElementById('p_spec_list_grid').innerHTML = l_data_table  ;             
    //--------------------------------
   for ( var i = 1; i < grdSpecList.rows ; i++ )
    {
        var ctrl = document.all("grd"+grdSpecList.GetGridData( i, G1_TCO_SPECGRP_PK ));

          ctrl.AddRow();
          ctrl.SetGridText( ctrl.rows-1, G2_SPEC_PK,    grdSpecList.GetGridData( i, G1_TCO_SPEC_PK));          
          ctrl.SetGridText( ctrl.rows-1, G2_SPEC_ID,   grdSpecList.GetGridData( i, G1_SPEC_ID    ));       
          ctrl.SetGridText( ctrl.rows-1, G2_SPEC_NM, grdSpecList.GetGridData( i, G1_SPEC_NM    ));       
    }
   //--------------------------------
}
//==================================================================
function OnPopUp(pos)
{
    switch (pos)         
    {		        
        case 'SpecMapping' :

            var path = System.RootURL + "/standard/forms/ag/ci/agci00090.aspx";
            var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:950px;dialogHeight:550px');	

        break;
    }  
} 
//==================================================================

function OnAddNew()
{
    var arr_data = new Array();
    var col_num  = G3_SPEC01_PK ;
    var row_num  = 0 ;
    
    for ( var i = 0; i < spec_grp_data.length ; i++ )
    {
        var ctrl = document.all("grd"+spec_grp_data[i]);
        row_num = grdItemList.rows;
        var mapping_times = 0 ;
	    //----------------        
        for( var j = 1; j < ctrl.rows; j++ )
	    {
            //-------------------------  	 	         
            if ( ctrl.GetGridData( j, G2_CHK ) == -1 )
            { 
                if ( row_num < 2 )
                {
                    grdItemList.AddRow();
                    grdItemList.SetGridText( grdItemList.rows-1, G3_SEQ,      grdItemList.rows-1);
                    grdItemList.SetGridText( grdItemList.rows-1, G3_ST_NAME,  txtSTItemPK.text  );
                    grdItemList.SetGridText( grdItemList.rows-1, col_num,     ctrl.GetGridData( j, G2_SPEC_PK )+"");
                    grdItemList.SetGridText( grdItemList.rows-1, col_num + 1, ctrl.GetGridData( j, G2_SPEC_NM )+"");
                }
                else if ( mapping_times == 0 )
                {
                    mapping_times = mapping_times + 1 ;
                    
                    for( var t = 1; t < row_num; t++ )
                    {
                        grdItemList.SetGridText( t, col_num,     ctrl.GetGridData( j, G2_SPEC_PK )+"");
                        grdItemList.SetGridText( t, col_num + 1, ctrl.GetGridData( j, G2_SPEC_NM )+"");
                    }
                }    
                else if ( mapping_times > 0 )
                {
                    for( var t = 1; t < row_num; t++ )
                    {
                        grdItemList.AddRow();
                        //---------------
                        grdItemList.SetGridText( grdItemList.rows-1, G3_SEQ,     grdItemList.rows-1 );
                        grdItemList.SetGridText( grdItemList.rows-1, G3_ST_NAME, txtSTItemPK.text   );
						
                        for( var k = G3_SPEC01_PK; k < G3_SPEC05_NM; k++ )
                        {
                            grdItemList.SetGridText( grdItemList.rows-1, k, grdItemList.GetGridData( t, k )+"" );
                        }                        
                        grdItemList.SetGridText( grdItemList.rows-1, col_num,     ctrl.GetGridData( j, G2_SPEC_PK    )) ;
                        grdItemList.SetGridText( grdItemList.rows-1, col_num + 1, ctrl.GetGridData( j, G2_SPEC_NM )+"") ;
                    }
                }   
            }
	    }
	    //----------------
	    col_num = col_num + 2 ;
    }
    //--------------------------------    
}
//==================================================================
function OnShowGroupBy()
{
    if ( chkShowGroupBy.value=='N' )
    {
        grdGoupItem.style.display = "none";
        grdItemList.style.display  = "";        
    }
    else
    {
        grdItemList.style.display  = "none";
        grdGoupItem.style.display = "";
        
        grdGoupItem.ClearData();
        
        if ( grdItemList.rows > 1 )
        {
            if ( grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC01_NM, 0, G3_SPEC01_NM) != '_SPEC1' )
            {
                grdGoupItem.GetGridControl().Cell( 0, 0, G4_SPEC01, 0, G4_SPEC01) = grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC01_NM, 0, G3_SPEC01_NM ) ;
                grdGoupItem.GetGridControl().Cell( 7, 0, G4_SPEC01, 0, G4_SPEC01) = 0x3300cc;
            }
            if ( grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC02_NM, 0, G3_SPEC02_NM) != '_SPEC2' )
            {             
                grdGoupItem.GetGridControl().Cell( 0, 0, G4_SPEC02, 0, G4_SPEC02) = grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC02_NM, 0, G3_SPEC02_NM ) ;
                grdGoupItem.GetGridControl().Cell( 7, 0, G4_SPEC02, 0, G4_SPEC02) = 0x3300cc;
            }
            if ( grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC03_NM, 0, G3_SPEC03_NM) != '_SPEC3' )
            {                
                grdGoupItem.GetGridControl().Cell( 0, 0, G4_SPEC03, 0, G4_SPEC03) = grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC03_NM, 0, G3_SPEC03_NM ) ;
                grdGoupItem.GetGridControl().Cell( 7, 0, G4_SPEC03, 0, G4_SPEC03) = 0x3300cc;
            }    
            if ( grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC04_NM, 0, G3_SPEC04_NM) != '_SPEC4' )
            {
                grdGoupItem.GetGridControl().Cell( 0, 0, G4_SPEC04, 0, G4_SPEC04) = grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC04_NM, 0, G3_SPEC04_NM ) ;
                grdGoupItem.GetGridControl().Cell( 7, 0, G4_SPEC04, 0, G4_SPEC04) = 0x3300cc;
            }    
            if ( grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC05_NM, 0, G3_SPEC05_NM) != '_SPEC5' )
            {
                grdGoupItem.GetGridControl().Cell( 0, 0, G4_SPEC05, 0, G4_SPEC05) = grdItemList.GetGridControl().Cell( 0, 0, G3_SPEC05_NM, 0, G3_SPEC05_NM ) ;
                grdGoupItem.GetGridControl().Cell( 7, 0, G4_SPEC05, 0, G4_SPEC05) = 0x3300cc;
            }
            //-------------------------            
            for( var i = 1; i < grdItemList.rows; i++ )
            {
                grdGoupItem.AddRow();
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_SPEC01,   grdItemList.GetGridData( i, G3_SPEC01_NM  ));
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_SPEC02,   grdItemList.GetGridData( i, G3_SPEC02_NM  ));
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_SPEC03,   grdItemList.GetGridData( i, G3_SPEC03_NM  ));
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_SPEC04,   grdItemList.GetGridData( i, G3_SPEC04_NM  ));
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_SPEC05,   grdItemList.GetGridData( i, G3_SPEC05_NM  ));
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_ORD_QTY, grdItemList.GetGridData( i, G3_ORD_QTY));
               
                grdGoupItem.SetGridText( grdGoupItem.rows-1, G4_LOT_QTY, grdItemList.GetGridData( i, G3_LOT_QTY));
            }  
        }
        //--------------------------------    
    }      
}
//==================================================================
function OnRemove()
{
    grdItemList.RemoveRow();
}
//==================================================================
function CheckInput()
{       
            var  row, col ;
            row = event.row ;
            col = event.col ; 
            if ( col == G3_LOT_QTY )
            {
                var dQuantiy
                
                dQuantiy =  grdItemList.GetGridData(row,col);
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdItemList.SetGridText(row,G3_ORD_QTY,parseFloat(dQuantiy+"")*12);
                        grdItemList.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdItemList.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdItemList.SetGridText(row,col,"")
                }
                //---------------------------------------
            } 
            if ( col == G3_ORD_QTY )
            {
                var dQuantiy
                
                dQuantiy =  grdItemList.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdItemList.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdItemList.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdItemList.SetGridText(row,col,"")
                }
                //---------------------------------------
      
             }   
             SumQty()                 
}
//==================================================================
function OnCreateItem()
{
    pro_dsbs00015.Call();
}
//==================================================================

function OnSelect()
{
   var arr_data = new Array();
   
   if( grdItemList.rows > 1)
   {   
      for( var i=1; i<grdItemList.rows; i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<grdItemList.cols; j++)
         {
            arrTemp[arrTemp.length]= grdItemList.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
//==================================================================

function SumQty()
{ 
    var sumLot =0, sumPCS =0;
    for(var i =1 ; i<grdItemList.rows; i++ )
    {
        if(grdItemList.GetGridData(i,G3_LOT_QTY)!="")
        {
            sumLot = sumLot + parseFloat(grdItemList.GetGridData(i,G3_LOT_QTY)+"")
            sumPCS = sumPCS + parseFloat(grdItemList.GetGridData(i,G3_ORD_QTY)+"")
        }
    }
    lblLotQty.text = sumLot;
    lblOrderQty.text = sumPCS;
}

//==================================================================
function OnSetQty()
{
    for ( var i=1; i<grdItemList.rows; i++ )
    {
        dQuantiy =  grdItemList.GetGridData(i,G3_LOT_QTY);
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {                        
                grdItemList.SetGridText(i,G3_ORD_QTY,parseFloat(dQuantiy+"")*Number(txtLotUnitQty.text));
            }
            else
            {
                grdItemList.SetGridText(i,G3_ORD_QTY,"")
            }
        }
        else
        {
            grdItemList.SetGridText(i,G3_ORD_QTY,"")
        }
    }
    SumQty();
}

//==================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00015" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="sale.sp_sel_dsbs00015"  > 
                <inout> 
                    <inout bind="txtSTItemPK" />  
                    <inout bind="txtSTItemCode" />
                    <inout bind="txtSTItemName" />
                    <inout bind="txtSpecGroupCount" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00015_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00015_1"  > 
                <input>
                    <input bind="txtSTItemPK" />
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00015" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="sale.sp_pro_dsbs00015" > 
                <input>
                    <output bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00015_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="sale.sp_sel_dsbs00015_2" procedure="sale.sp_upd_dsbs00015_2"  > 
                <input>
                    <input bind="txtMasterPK" />
					<input bind="txtBillToPK" />
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00015_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00015_3"  > 
                <input>
                    <input bind="txtSTItemPK" />
                    <input bind="txtSpecGrpPK" />
                    <input bind="txtSearch" />
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>     
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td align='right' style="width: 10%; white-space: nowrap">
                            ST Item
                        </td>
                        <td style="width: 88%; white-space: nowrap">
                            <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
                            <gw:textbox id="txtSTItemCode" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtSTItemName" styles='width:70%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="Search" alt="Search" id="btnSearch" onclick="OnSearch('Refresh')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button id="idBtnSpecMapping" img="Spec Mapping" text="Spec Mappping" onclick="OnPopUp('SpecMapping')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 39%">
            <td id="p_spec_list_grid">
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 20%" align="left">
                            <gw:checkbox id="chkShowGroupBy" styles="color:blue" defaultvalue="Y|N" value="N"
                                onchange="OnShowGroupBy()">Group by</gw:checkbox>
                        </td>
                        <td style="width: 10%" align="right">
                            Lot Qty :</td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:label id="lblLotQty" styles='width:100%;color:cc0000;font:9pt' text='lot qty' />
                        </td>
                        <td style="width: 10%" align="right">
                            Qrd Qty :</td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:label id="lblOrderQty" styles='width:100%;color:cc0000;font:9pt' text='item' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Lot Unit Qty :</td>
                        <td style="width: 14%">
                            <gw:textbox id="txtLotUnitQty" styles='width:100%' csstype="mandatory" text="0" type="number"
                                format="###,###,###" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnSetQty" img="Set Qty" text="Set Qty" onclick="OnSetQty()" />
                        </td>
                        <td style="width: 11%">
                        </td>
                        <td style="width: 1%">
                            <gw:button img="new" alt="Add" id="btnAdd" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnCreateItem" img="Create Item" text="Create Item" onclick="OnCreateItem()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnSelect" img="Select" text="Select" onclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 59%">
            <td>
                <gw:grid id="grdItemList" header="Seq|_TCO_STITEM_PK|_SPEC1_PK|_SPEC1|_SPEC2_PK|_SPEC2|_SPEC3_PK|_SPEC3|_SPEC4_PK|_SPEC4|_SPEC5_PK|_SPEC5|_TCO_ITEM_PK|Item Code|Item Name|UOM|Lot Qty|Ord Qty|_MasterPK|U/Price"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0" 
					aligns="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|3|0|3"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|1" 
					widths="800|0|0|1500|0|1500|0|1500|0|1500|0|1500|0|1500|2000|800|1200|1200|0|0"
                    sorting="T" styles="width:100%; height:100%" onafteredit="CheckInput()" onceldblclick="CheckInput()" />
					
                <gw:grid id='grdGoupItem' header='SPEC1|SPEC2|SPEC3|SPEC4|SPEC5|Lot Qty|Ord Qty'
                    format='0|0|0|0|0|1|1' aligns='0|0|0|0|0|0|3' editcol='0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' group='T' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:grid id='grdSpecList' header='TCO_SPECGRP_PK|SPECGRP_NM|TCO_SPEC_PK|SPEC_ID|SPEC_NM'
        format='0|0|0|0|0' aligns='0|0|0|0|0' defaults='||||' editcol='1|1|1|1|1' widths='1000|1000|1000|1000|1000'
        sorting='T' styles='width:100%; height:100%; display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSpecGroupCount" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecGrpPK" styles='width:100%;display:none' />
	
    <gw:textbox id="txtSearch" styles='width:100%;display:none' />
	
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
	<gw:textbox id="txtBillToPK" styles='width:100%;display:none' />
</body>
</html>
