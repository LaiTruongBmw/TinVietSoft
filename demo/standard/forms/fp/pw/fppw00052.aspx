<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>W/I Consumption</title>
</head>

<script>
     
    var G1_DETAIL_PK		= 0,
		G1_MASTER_PK		= 1,
		G1_SEQ     	 		= 2,
        G1_ST_ITEM_PK    	= 3,       
		G1_ITEM_PK			= 4,
		G1_ITEM_CODE		= 5,
        G1_ITEM_NAME   		= 6,  
        G1_LOT_NO           = 7,	
        G1_CONS_QTY       	= 8,
		G1_UOM				= 9,
		G1_WH_PK			= 10,
		G1_WH_NAME			= 11,
		G1_REMARK			= 12; 
		
 var arr_FormatNumber = new Array();  		
//================================================================

 function BodyInit()
 {
      System.Translate(document);
      //----------------------------- 
      FormatGrid();
     //----------------------------- 
      var callerWindowObj = dialogArguments;
	  txtWIMasterPK.text = callerWindowObj.txtMasterPK.text;	  
	  
	  OnSearch('DETAIL');
 
 }
//================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();
	  	
      trl.ColFormat(G1_CONS_QTY) = "###,###,###,###,###.##";
	  	  
      arr_FormatNumber[G1_CONS_QTY] = 2; 
      //-------------------------------------------------            
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
		data_fppw00052.Call('SELECT');
 }
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fppw00052" :
	            if ( grdDetail.rows > 1 )
	            {
					grdDetail.SetCellBold( 1, G1_CONS_QTY, grdDetail.rows-1, G1_CONS_QTY, true);					 
					//----------
					for ( var i=1; i<grdDetail.rows; i++)
					{
						if ( grdDetail.GetGridData( i, G1_ITEM_PK) == '' )
						{
							grdDetail.GetGridControl().Cell( 7, i, G1_ITEM_CODE, i, G1_ITEM_NAME ) = 0x3300cc;
						}
					}	
					//----------
	            }        
            break;             
      }  
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
            
            if ( col == G1_CONS_QTY )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdDetail.SetGridText( row, col, System.Round(dQuantiy,arr_FormatNumber[G1_CONS_QTY]));
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
//=========================================================================

function OnSave()
{
	data_fppw00052.Call();
}
//=========================================================================

 function OnUnDelete() 
 {
		grdDetail.UnDeleteRow();
 }
//=========================================================================
 
 function OnDelete()
 {
      	grdDetail.DeleteRow();  	        
 }
 
 //=========================================================================
 
 function OnAddNew(pos)
 {
 	switch (pos)
	{
		case 'DETAIL' :
            var path = System.RootURL + '/form/fp/ab/fpab00350.aspx?group_type=||Y|Y|Y|Y';
			var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:40');	 

             if ( obj != null )
             {
                for ( var j=0 ; j<obj.length; j++)
                {
                    temp = obj[j];
                    /*--------------------*/                    
                    grdDetail.AddRow();
                    grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,       grdDetail.rows-1 );
                    grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtWIMasterPK.text  );  
					                    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, temp[2]+"" ); //Mat Code
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, temp[3]+"" ); //Mat Name          	                          

                    grdDetail.SetGridText( grdDetail.rows-1, G1_ST_ITEM_PK, temp[0] ); //st_item_pk                    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,    temp[1] ); //item_pk
                    
                    grdDetail.SetCellBgColor( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1, G1_SEQ, 0xCCFF99 );
                }
            }			
		break;
		
		case 'STOCK':
             var path = System.RootURL + "/form/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y";
			 var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:40');             
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,    grdDetail.rows-1 );
						
                        grdDetail.SetCellBgColor( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1, G1_SEQ, 0xCCFF99 );
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtWIMasterPK.text ); //master_pk
  
						grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[3]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[5]);//item_name
						grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[6]); 
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,   arrTemp[10]); 												
                        grdDetail.SetGridText( grdDetail.rows-1, G1_CONS_QTY, arrTemp[8]); 	
											
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[1] ); //wh_pk	
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[2] ); //wh_name					  							                                                                                                                                               
                    }                                 
             }                 			 
	    break;		
	}      	 	        
 }
//=========================================================================


</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00052" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppw00052" procedure="<%=l_user%>lg_upd_fppw00052" > 
			    <input bind="grdDetail" >	
					<input bind="txtWIMasterPK" />			         
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 5%">
            </td>
            <td style="width: 25%; white-space: nowrap">
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td style="width: 25%; white-space: nowrap">
            </td>
            <td style="width: 5%" align="right">
            <gw:icon id="idBtnStock" img="2" text="STOCK" styles='width:100%' onclick="OnAddNew('STOCK')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnNew" img="new" alt="Add New" onclick="OnAddNew('DETAIL')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="delete" alt="Delete" id="btnDel" onclick="OnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDel" onclick="OnUnDelete()" />
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_PK|_Master_PK|Seq|_ST_Item_PK|_ITEM_PK|Item Code|Item Name|Lot No|Cons Qty|UOM|_WH_PK|W/H|Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|3|1|0|0|0' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|1|1|0|0|1' widths='0|0|600|0|0|2000|3000|1500|1500|800|0|1500|1500' sorting='T'
                    styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWIMasterPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
