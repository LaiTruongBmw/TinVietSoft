<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Style Consumption</title>
</head>

<script type="text/javascript" language="javascript">

//----- grdMatCons -----
var P_CONS_PK       = 0,
    P_STYLE_PK      = 1,
	P_SEQ			= 2,
    P_ST_MAT_PK     = 3,
    P_ITEM_MAT_PK   = 4,
    P_MAT_CODE      = 5,
    P_MAT_NAME      = 6,       
    P_PATTERN_NAME  = 7,
    P_PA_GRP_PK  	= 8,
    P_PA_GRP_NAME   = 9,
	P_DOZ_QTY		= 10,
    P_NET_QTY       = 11,
    P_LOSS_RATE     = 12,
    P_GROSS_QTY     = 13,
    P_UOM           = 14,   
	P_SUM_YN		= 15,
    P_REMARK        = 16;

//----- grdTmp -----    
var G2_ST_MAT_PK            = 0,
    G2_MAT_PK               = 1,
    G2_ITEM_CODE            = 2,
    G2_ITEM_NAME            = 3,
    G2_PATTERN_NAME         = 4,
    G2_PA_GRP_PK 			= 5,
    G2_PA_GRP_NM   			= 6,
    G2_NET_QTY              = 7, 
    G2_LOSS_RATE            = 8,
    G2_GROSS_QTY            = 9,
    G2_MAT_UOM              = 10;

var v_update = 0; 

var arr_FormatNumber = new Array();
    
//======================================================================
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
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}
 //======================================================================
    
function OnToggleGrid()
{
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";

			grdMatCons.GetGridControl().ColHidden(P_PATTERN_NAME) = true ;
			grdMatCons.GetGridControl().ColHidden(P_PA_GRP_NAME)  = true ;			
			
            imgMaster.src = "../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show pattern";
			
        }
        else
        {
            imgMaster.status = "expand";
 
			grdMatCons.GetGridControl().ColHidden(P_PATTERN_NAME) = false ;
			grdMatCons.GetGridControl().ColHidden(P_PA_GRP_NAME)  = false ;

            imgMaster.src = "../../../system/images/close_popup.gif";
			imgMaster.alt="Close pattern";
        }
  
}
//======================================================================
    function BodyInit()
    { 
        System.Translate(document);
        //------------------------------
        txtItemName.SetEnable(false);
        //------------------------------
 
        OnGridFormat();
        //------------------------------
		OnToggleGrid();
        OnShow();
        //------------------------------
    }      
     
//======================================================================
    function OnGridFormat()
    {
		var data="";
        //----------------------
        data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' or semi_prod_yn = 'Y' ) and leaf_yn='Y' order by grp_cd")%>||";     
        lstGroupSearch.SetDataText(data);
		lstGroupSearch.value = '' ;
		//----------------------
        data = "<%=ESysLib.SetListDataSQL("SELECT   pk, pattern_id || ' * ' || pattern_name FROM tlg_pt_pattern WHERE del_if = 0 and use_yn= 'Y' and rownum < 100 ORDER BY pattern_id ")%>||";     
        lstPattern.SetDataText(data);
        lstPattern.value = '' ;
			        
        //-------------------------------------
        var trl = grdMatCons.GetGridControl();	
      
	    trl.ColFormat(P_DOZ_QTY)    = "###,###.##";
        trl.ColFormat(P_NET_QTY)    = "###,###.#####"; 
        trl.ColFormat(P_LOSS_RATE)  = "###,###"; 
        trl.ColFormat(P_GROSS_QTY)  = "###,###.#####"; 
		
		arr_FormatNumber[P_DOZ_QTY]   = 2;
    	arr_FormatNumber[P_NET_QTY]   = 5;
    	arr_FormatNumber[P_LOSS_RATE] = 0;     
    	arr_FormatNumber[P_GROSS_QTY] = 5;
		
        //-------------------------------------
		grdSTItemList.GetGridControl().ScrollTrack = true; 		
    }
//======================================================================
    function OnSearch(id)
    {      
       switch(id)
       {
            case 1:
                data_fpdp00060_1.Call('SELECT')
            break;
			
            case 2:
                data_fpdp00060.Call('SELECT')
            break;
            
            case 'Consumption' :
                if ( grdSTItemList.row > 0 )
                {
                    if ( copy == 'yes')
                     {
                        if ( confirm ('Are you sure to copy?') )
                        {
                            txtNewItemPK.text = grdSTItemList.GetGridData( grdSTItemList.row, 0);
                            pro_fpdp00060.Call();
                            btnCopy.disabled = false;
                        }
                        else
                        {    
                            copy = '' ;                               
                            txtItemPK.text   = grdSTItemList.GetGridData( grdSTItemList.row, 0);
                            txtItemCode.text = grdSTItemList.GetGridData( grdSTItemList.row, 1);
                            txtItemName.text = grdSTItemList.GetGridData( grdSTItemList.row, 2);
                            lstPattern.value = grdSTItemList.GetGridData( grdSTItemList.row, 5);
                            
                            data_fpdp00060.Call("SELECT");
                        }    
                    } 
                    else
                    {
                        txtItemPK.text   = grdSTItemList.GetGridData( grdSTItemList.row, 0);
                        txtItemCode.text = grdSTItemList.GetGridData( grdSTItemList.row, 1);
                        txtItemName.text = grdSTItemList.GetGridData( grdSTItemList.row, 2);
                        lstPattern.value = grdSTItemList.GetGridData( grdSTItemList.row, 5);
                        
                        data_fpdp00060.Call("SELECT");                    
                    }
                }
                else
                {
                    txtItemPK.text   = '';
                    txtItemCode.text = '';
                    txtItemName.text = '';
                    lstPattern.value = '';
                    
                    data_fpdp00060.Call("SELECT");
                }                                  
            break;
            
            case 'grdSTItemList' :  
                          
                data_fpdp00060_3.Call("SELECT");  
            break;
            
            case 'Pattern':
                if ( lstPattern.value != '' && txtItemPK.text != '' )
                {
                    data_fpdp00060_2.Call("SELECT");
                }
                else
                {
                    alert('Pls select Style and Pattern.');
                }    
            break;
       }
       
    }

//======================================================================
    function findItem()
    {
        var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y||Y|Y||'
        var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

        if( object != null )
        {
            txtItemPK.text   = object[0];
            txtItemCode.text = object[1];
            txtItemName.text = object[2];
            OnSearch(2)
        }
    }
//======================================================================
    function OnReset()
    {
            txtItemPK.text = ""
            txtItemCode.text = ""
            txtItemName.text = ""
            OnSearch(2)
    }
//======================================================================
    function OnNew(obj)
    {
       if ( txtItemPK.text != "" )
       {	   		
            if ( radSearchItem.GetData() == '1' )
            {                 
                    var path = System.RootURL + '/form/fp/ab/fpab00210.aspx?group_type=Y|Y|Y||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {                    
                           	 	arrTemp = object[i];
                                                        
                                grdMatCons.AddRow();
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_STYLE_PK, txtItemPK.text );
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SEQ,      grdMatCons.rows-1 );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ST_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_CODE,  arrTemp[1] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_NAME,  arrTemp[2] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_UOM,       arrTemp[5] );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ITEM_MAT_PK, '');  
								
								grdMatCons.SetGridText( grdMatCons.rows-1, P_DOZ_QTY, 1    );  
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SUM_YN,  '-1' );                          
                        }
                    }                                     
            }
            else
            {                
                    var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                            	arrTemp = object[i];
                                                         
                                grdMatCons.AddRow();
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_STYLE_PK, txtItemPK.text );
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SEQ,      grdMatCons.rows-1 );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ITEM_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_CODE,    arrTemp[1] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_NAME,    arrTemp[2] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_UOM,         arrTemp[5] );
     
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ST_MAT_PK, '');
								
								grdMatCons.SetGridText( grdMatCons.rows-1, P_DOZ_QTY, 1    ); 
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SUM_YN,  '-1' );                                                         
                        }
                    }                                        
            }                   
       }
       else
       {
            alert('Please select an st item to make consumption!!')
       }
    }
//======================================================================
    function OnSave()
    {
          if ( CheckSave() )
          {
                data_fpdp00060.Call();
          }
    }
//======================================================================
    function OnDelete()
    {        
          var ctrl = grdMatCons.GetGridControl();  
          var row  = ctrl.row; 
          
          if( row>0 )
          {
                if ( grdMatCons.GetGridData( grdMatCons.row, 0 ) == "" ) 
	            {						
				        grdMatCons.RemoveRow();	
		        }			
		        else 
		        {
			        if ( confirm( "Do you want to mark this row to delete?" ) ) 
			        {
				        grdMatCons.DeleteRow();
			        }
		        }       
		  }
    }
//======================================================================
    function OnUnDelete()
    {
            grdMatCons.UnDeleteRow()
    }

//======================================================================
    function OnDataReceive(obj)
    {   
        switch(obj.id)
        {
            case "data_fpdp00060_1":
                if( txtItemPK.text == "")
                {
                    findItem();
                }else
                {
                    OnSearch(2);
                } 
            break;
            
            case "data_fpdp00060":
                
                if ( grdMatCons.rows > 1 )
                {
                  	grdMatCons.SetCellBgColor( 1, P_MAT_CODE, grdMatCons.rows-1, P_MAT_NAME, 0xCCFFFF );
					
					grdMatCons.SetCellBold( 1, P_MAT_CODE, grdMatCons.rows - 1, P_MAT_CODE, true); 
                }
                
                for ( var i = 1; i < grdMatCons.rows ; i++ )
                {
                    if ( grdMatCons.GetGridData ( i, P_ITEM_MAT_PK) != '' )
                    {
                        grdMatCons.GetGridControl().Cell( 7, i, P_MAT_CODE, i, P_MAT_NAME ) = 0x3300cc;
                    }
                }
            break;

            case "data_fpdp00060_3":
                //--------------------------------
                //grdSTItemList.GetGridControl().AutoSize( 0, 4, false, 0 ); 

            break;  
            
            case "data_fpdp00060_2":
                //--------------------------------
                for ( var i = 1; i < grdTmp.rows; i ++ )
                {
                     var check_exist = '0';
                     for ( var j = 1; j < grdMatCons.rows; j++ )
                     {
                         if ( grdTmp.GetGridData( i, G2_PA_GRP_PK ) == grdMatCons.GetGridData( j, P_PA_GRP_PK ) )
                         {
                            check_exist = '1';
                         }
                     }
                     
                     if ( check_exist == '0' ) 
                     {
                         grdMatCons.AddRow();
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_STYLE_PK, txtItemPK.text );
						 grdMatCons.SetGridText( grdMatCons.rows-1, P_SEQ,      grdMatCons.rows-1 );
                         
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_ST_MAT_PK,   grdTmp.GetGridData( i, G2_ST_MAT_PK ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_ITEM_MAT_PK, grdTmp.GetGridData( i, G2_MAT_PK    ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_CODE,    grdTmp.GetGridData( i, G2_ITEM_CODE ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_NAME,    grdTmp.GetGridData( i, G2_ITEM_NAME ) );
						 
						 grdMatCons.SetGridText( grdMatCons.rows-1, P_DOZ_QTY, 1); 
						 
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_NET_QTY,   grdTmp.GetGridData( i, G2_NET_QTY   ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_LOSS_RATE, grdTmp.GetGridData( i, G2_LOSS_RATE ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_GROSS_QTY, grdTmp.GetGridData( i, G2_GROSS_QTY ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_UOM,       grdTmp.GetGridData( i, G2_MAT_UOM   ) );
                         
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_PATTERN_NAME, grdTmp.GetGridData( i, G2_PATTERN_NAME ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_PA_GRP_PK,    grdTmp.GetGridData( i, G2_PA_GRP_PK    ) );
                         grdMatCons.SetGridText( grdMatCons.rows-1, P_PA_GRP_NAME,  grdTmp.GetGridData( i, G2_PA_GRP_NM    ) );
                     }
                }
            break;  
            
            case "data_fpdp00060_4" :
                lstPattern.SetDataText(txtPatternNameRtn.text);
                lstPattern.value = txtPatternPK.text;                              
            break; 
            
            case 'pro_fpdp00060':   
                 
                alert(txtReturnValue.text);
                
                copy = '' ;
                OnSearch('Consumption'); 
                            
            break;                                 
        }
       
    }
//======================================================================
    function CheckSave()
    {
        for( var i=1 ; i<grdMatCons.rows ; i++ )
        {
            if ( grdMatCons.GetGridData(i, P_ST_MAT_PK) == "" && grdMatCons.GetGridData(i, P_ITEM_MAT_PK) == "")
            {
                alert("Material  can't be null!!")
                return false;
            }
            
            if ( grdMatCons.GetGridData( i, P_GROSS_QTY) == "" )
            {
                alert("Please input gross quantity!!")
                return false;
            }
            
        }
        
        return true;
    }
//======================================================================
    function OnGridCellDblClick()
    {
        var event_col = event.col;
        var event_row = event.row;
        
        if ( event_col == P_MAT_CODE || event_col == P_MAT_NAME )
        {
            if ( radSearchItem.GetData() == '1' )
            {
                if ( grdMatCons.GetGridData( event_row, P_ST_MAT_PK) == '' && grdMatCons.GetGridData( event_row, P_ITEM_MAT_PK) == '' )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00210.aspx?group_type=Y|Y|Y||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {                    
                            arrTemp = object[i];
                            
                            if ( i == 0 )
                            {
                                grdMatCons.SetGridText( event_row, P_ST_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( event_row, P_MAT_CODE,  arrTemp[1] );
                                grdMatCons.SetGridText( event_row, P_MAT_NAME,    arrTemp[2] );
                                grdMatCons.SetGridText( event_row, P_UOM,       arrTemp[5] );
                                
                                grdMatCons.SetGridText( event_row, P_ITEM_MAT_PK, '');
                            }
                            else
                            {
                                grdMatCons.AddRow();
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_STYLE_PK, txtItemPK.text );
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SEQ,      grdMatCons.rows-1 );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ST_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_CODE,  arrTemp[1] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_NAME,    arrTemp[2] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_UOM,       arrTemp[5] );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ITEM_MAT_PK, '');
                                
                            }                                
                        }
                    }     
                }
                else
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y||Y|||';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        grdMatCons.SetGridText( event_row, P_ST_MAT_PK, object[0] );
                        grdMatCons.SetGridText( event_row, P_MAT_CODE,  object[1] );
                        grdMatCons.SetGridText( event_row, P_MAT_NAME,  object[2] );
                        grdMatCons.SetGridText( event_row, P_UOM,       object[5] );
                        
                        grdMatCons.SetGridText( event_row, P_ITEM_MAT_PK, '');
                    }                   
                } 
                return ;   
            }
            else
            {
                if ( grdMatCons.GetGridData( event_row, P_ST_MAT_PK) == '' && grdMatCons.GetGridData( event_row, P_ITEM_MAT_PK) == '' )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                            arrTemp = object[i];
                            
                            if ( i == 0 )
                            {
                                grdMatCons.SetGridText( event_row, P_ITEM_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( event_row, P_MAT_CODE,    arrTemp[1] );
                                grdMatCons.SetGridText( event_row, P_MAT_NAME,    arrTemp[2] );
                                grdMatCons.SetGridText( event_row, P_UOM,         arrTemp[5] );
     
                                grdMatCons.SetGridText( event_row, P_ST_MAT_PK, '');                            
                            }
                            else
                            {
                                grdMatCons.AddRow();
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_STYLE_PK, txtItemPK.text );
								grdMatCons.SetGridText( grdMatCons.rows-1, P_SEQ,      grdMatCons.rows-1 );
                                
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ITEM_MAT_PK, arrTemp[0] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_CODE,    arrTemp[1] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_MAT_NAME,    arrTemp[2] );
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_UOM,         arrTemp[5] );
     
                                grdMatCons.SetGridText( grdMatCons.rows-1, P_ST_MAT_PK, '');                            
                            }
                        }
                    }    
                }
                else
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y|||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        grdMatCons.SetGridText( event_row, P_ITEM_MAT_PK, object[0] );
                        grdMatCons.SetGridText( event_row, P_MAT_CODE,    object[1] );
                        grdMatCons.SetGridText( event_row, P_MAT_NAME,    object[2] );
                        grdMatCons.SetGridText( event_row, P_UOM,         object[5] );
                        
                        grdMatCons.SetGridText( event_row, P_ST_MAT_PK, '');
                    }
                }    
                return ;            
            }            
            return;
        }                  
        else if ( event_col == P_UOM )
        {
                if ( grdMatCons.GetGridData( event_row, P_ST_MAT_PK) != "" || grdMatCons.GetGridData( event_row, P_ITEM_MAT_PK) != "" )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
                    var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                       grdMatCons.SetGridText( event_row, P_UOM, object[1])
                    }
                }
                else
                {
                    alert('Pls, select material item first !!!')
                } 
                return ; 
        }
        else if ( event_col == P_PA_GRP_NAME )
        {
                var path = System.RootURL + '/form/fp/dp/fpdp00062.aspx';
                var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
                
                if ( object != null )
                {
                   grdMatCons.SetGridText( event_row, P_PATTERN_NAME, object[0]);
                   grdMatCons.SetGridText( event_row, P_PA_GRP_PK,    object[1]);
                   grdMatCons.SetGridText( event_row, P_PA_GRP_NAME,  object[3]);
                }        
        }  
   }
//======================================================================

function CheckEdit()
{
    var col, row;

    col = event.col;
    row = event.row;

    if ( col == P_LOSS_RATE || col == P_NET_QTY || col == P_GROSS_QTY )
    {
        var dQuantiy ;
        
        dQuantiy = grdMatCons.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {                
                grdMatCons.SetGridText(row,col, System.Round(dQuantiy, arr_FormatNumber[col]) );                                
            }
            else
            {
                grdMatCons.SetGridText(row,col,"")
            }
        }
        else
        {
            grdMatCons.SetGridText(row,col,"")
        } 
        //----------------------
        
        if ( col == P_LOSS_RATE || col == P_NET_QTY )
        {
            var loss, net, gross_qty ; 
            
            loss = Number(grdMatCons.GetGridData( row, P_LOSS_RATE));
            net  = Number(grdMatCons.GetGridData( row, P_NET_QTY  ));
            
            gross_qty = net + (loss*net/100);			 

            grdMatCons.SetGridText( row, P_GROSS_QTY, System.Round(gross_qty, arr_FormatNumber[P_GROSS_QTY]));
        }    
    }    
}
//====================================================================================
var copy="";

function OnProcess(pos)
{
    switch (pos)
    {
        case 'ProcessComponent' :
            var path = System.RootURL + '/form/fp/dp/fpdp00120.aspx';
            var object = System.OpenModal( path ,950 , 600,  'resizable:yes;status:yes');
        break;
		
		case 'COPY-CONS' :
		 	if ( txtItemPK.text == '' )
		    {
		        alert('Pls select Style first !');
		    }
		    else
		    {
		        copy = 'yes' ;
		        txtOldItemPK.text = txtItemPK.text ;
		        
		        //btnCopy.SetEnable(false);
		    }    		
		break;
		
		case 'IMPORT-CONS':
    		var path = System.RootURL + '/form/fp/dp/fpdp00061.aspx?tco_stitem_pk='+ txtItemPK.text;
    		var object = System.OpenModal( path ,980 , 550,  'resizable:yes;status:yes');		
		break;
		
		case 'CAL':
			for( var i =1 ; i<grdMatCons.rows ; i++ )
	        {		
				var loss, net, gross_qty ; 
	            
	            loss = Number(grdMatCons.GetGridData( i, P_LOSS_RATE));
	            net  = Number(grdMatCons.GetGridData( i, P_NET_QTY ));
	            
	            gross_qty = net + (loss*net/100);			 
	
	            grdMatCons.SetGridText( i, P_GROSS_QTY, System.Round(gross_qty, arr_FormatNumber[P_GROSS_QTY]));	  
			}			
		break;

    }    
}
 
//====================================================================================
function OnShowSpecMapping()
{
    if ( grdMatCons.row > 0 )
    {
        var event_row = grdMatCons.row;
        
        if ( grdMatCons.GetGridData( event_row, P_CONS_PK) == '' )
        {
            alert('Pls Save Consumption first.');
            return;
        }
                    
        if ( grdMatCons.GetGridData( event_row, P_ST_MAT_PK) != "" )
        {            
            if ( tab_SpecMaping.style.display == "" )
            {
                this.Height        
                window.frames["ifrm_SpecMapping"].document.location.href = "fpdp00064.aspx?style_cons_pk="+ grdMatCons.GetGridData( event_row, P_CONS_PK);          
            }
            else
            {
                var path = System.RootURL + '/form/fp/dp/fpdp00064.aspx?style_cons_pk='+ grdMatCons.GetGridData( event_row, P_CONS_PK);
                var object = System.OpenModal( path ,950 , 600,  'resizable:yes;status:yes');            
            }
        }
        else
        {
            alert('Select ST Material first, please !!!')
        }

        return;    
    }
    else
    {
        alert('Pls select on saved item below.');
    }
}
//====================================================================================
function OnShowSizeMapping()
{
    if ( grdMatCons.row > 0 )
    {
        var event_row = grdMatCons.row;
        
        if ( grdMatCons.GetGridData( event_row, P_CONS_PK) != "" )
        {
            if ( tab_SpecMaping.style.display == "" )
            {        
                this.Height        
                window.frames["ifrm_SpecMapping"].document.location.href = "fpdp00063.aspx?style_cons_pk="+ grdMatCons.GetGridData( event_row, P_CONS_PK);                      
            }
            else
            {
                var path = System.RootURL + '/form/fp/dp/fpdp00063.aspx?style_cons_pk='+ grdMatCons.GetGridData( event_row, P_CONS_PK);
                var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');            
            }
        }
        else
        {
            alert('Pls Save Consumption first.');
        }

        return;    
    }
    else
    {
        alert('Pls select on saved item below.');
    }
}
//====================================================================================
function OnShow() 
{
        var tab_SpecMaping  = document.all("tab_SpecMaping" );
        var tab_Consumption = document.all("tab_Consumption");
        var btn_MapSize     = document.all("idBtnMapSize"   );
        var btn_MapSpec     = document.all("idBtnMapSpec"   );
        
        if ( tab_SpecMaping.style.display == "none" )
        {
            tab_SpecMaping.style.display = "";
            tab_Consumption.style.height = "38%";
                      
            imgup.src = "../../../system/images/down.gif";
        }
        else
        {
            tab_SpecMaping.style.display = "none";
            tab_Consumption.style.height = "88%";
            
            imgup.src = "../../../system/images/up.gif";
        }
}
//====================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Pattern' :
            var path = System.RootURL + '/form/fp/ab/fpab00400.aspx';
            var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes'); 
            
            if ( object != null )
            {
                if ( object[0] != '' )
                {
	                txtPatternPK.text = object[0];
	                	                
                    data_fpdp00060_4.Call("SELECT");                  
                }    
            }                       
        break;
    }
}
//====================================================================================

</script>

<body>
    <!----------- Search by item code --------->
    <gw:data id="data_fpdp00060_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control"   function="<%=l_user%>lg_sel_fpdp00060_1"  > 
                <inout> 
                    <inout bind="txtItemCode" />  
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemName"/>
                    <inout bind="lstPattern"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------Search Pattern Type---------------------------------->
    <gw:data id="data_fpdp00060" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"   function="<%=l_user%>lg_sel_fpdp00060" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" procedure="<%=l_user%>lg_upd_fpdp00060" > 
                <input> 
                    <input bind="txtItemPK" /> 
                </input> 
                <output bind="grdMatCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------Create Component--------------------------------->
    <gw:data id="pro_fpdp00060" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process"  parameter="0" procedure="<%=l_user%>lg_pro_fpdp00060"  > 
                <input> 
                    <input bind="txtOldItemPK" />  
                    <input bind="txtNewItemPK" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!---------------------------------Create Component--------------------------------->
    <gw:data id="data_fpdp00060_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"   function="<%=l_user%>lg_sel_fpdp00060_2"  > 
                <input> 
                    <input bind="txtItemPK" /> 
                    <input bind="lstPattern" /> 
                </input> 
                <output bind="grdTmp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------Search ST Item List ---------------------------------->
    <gw:data id="data_fpdp00060_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpdp00060_3" > 
                <input bind="grdSTItemList" > 
                    <input bind="lstGroupSearch"/> 
                    <input bind="txtSTItemSearch"/>
                    <input bind="chkCons"/>
                </input> 
                <output bind="grdSTItemList" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00060_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fpdp00060_4" > 
                <input> 
                    <input bind="txtPatternPK" />
                </input>
	           <output>
	                <output bind="txtPatternNameRtn" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 1%">
            <td style="width: 25%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 15%" align="right">
                            <b>Group </b>
                        </td>
                        <td style="width: 84%">
                            <gw:list id="lstGroupSearch" styles='width:100%' onchange="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            <b>Style </b>
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtSTItemSearch" styles='width:100%' onenterkey="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="white-space: nowrap">
                            Cons
                            <gw:checkbox id="chkCons" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSTItemList' header='_PK|Style Code|Name|_UOM|_Order|_tpr_pattern_pk'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|3|0' defaults='|||||' editcol='0|0|0|0|0|0'
                                widths='1000|1500|2500|800|1000|1000' sorting='T' styles='width:100%; height:100%'
                                onclick="OnSearch('Consumption')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%" id="t-right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="height: 100%; width: 100%">
                                <tr>																
                                    <td style="width: 5%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" /></td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="findItem()">Style </b>
                                    </td>
                                    <td style="width: 49%; white-space: nowrap">
                                        <gw:textbox id="txtItemPK" text="" styles="display:none" />
                                        <gw:textbox id="txtItemCode" text="" styles='width:30%' onenterkey="OnSearch(1)" />
                                        <gw:textbox id="txtItemName" text="" styles='width:70%' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset()" />
                                    </td>
									
									
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Pattern')">Pattern </b>
                                    </td>
									
									
                                    <td style="width: 34%" align="center">
                                        <gw:list id="lstPattern" styles="width:100%" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="process" alt="Add Pattern Group" id="btnCreate" onclick="OnSearch('Pattern')" />
                                    </td>                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">                                               
                        <td colspan="10">
                            <table style="height: 100%; width: 100%">
                                <tr>
 									<td style="width: 15%;white-space:nowrap" align="right">
			                            <gw:radio id="radSearchItem" value="1" styles="width:100%">                      
						                    <span value="1">ST Item</span>                       
						                    <span value="2">Item</span>    			                                
			        			        </gw:radio>
                        			</td>								 									                                     
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="new" alt="Add" id="btnAdd" onclick="OnNew(grdMatCons)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="udelete" alt="UDelete" id="btnUdelete" onclick="OnUnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
                                    </td>
									<td style="width: 1%" align="right">
                                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(2)" />
                                    </td>								
                                    <td style="width: 76%" align="center" >
                            			<img status="expand" id="imgMaster" alt="Close process and pattern" src="../../../system/images/close_popup.gif"
                                			style="cursor: hand" onclick="OnToggleGrid()" />
                        			</td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnProcessComponent" img="2" text="Process Component" styles='width:100%'
                                            onclick="OnProcess('ProcessComponent')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnImpExcel" img="3" text="Import" styles='width:100%' onclick="OnProcess('IMPORT-CONS')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCopy" img="3" text="Copy" styles='width:100%' onclick="OnProcess('COPY-CONS')" />
                                    </td>
									<td style="width: 1%">
                                        <gw:icon id="btnCopy" img="2" text="Cal" styles='width:100%' onclick="OnProcess('CAL')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 38%">
                        <td colspan="13" id="tab_Consumption">
                            <gw:grid id='grdMatCons' 
								header='_PK|_TCO_STITEM_PK|Seq|_ST_MAT_PK|_Mat_PK|Item Code|Item NM|Pattern|_TPR_PATTERN_GROUP_PK|P Group|Doz Qty|Net Qty|Loss (%)|Gross Qty|UOM|Sum Y/N|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|3|3|3|3|1|0|0'
                                defaults='||||||||||||||||' 
								editcol='0|0|1|0|0|0|0|0|0|0|1|1|1|1|0|1|1'
                                widths='0|0|800|0|0|2000|4000|1500|0|1500|1200|1500|1000|1500|800|1000|1000'
                                styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' 
								onafteredit="CheckEdit()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 1%; white-space: nowrap" align="left">
                                        <img alt="Spec Mapping" status="expand" id="imgup" src="../../../system/images/down.gif"
                                            style="cursor: hand;" onclick="OnShow()" />
                                    </td>
                                    <td style="width: 97%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnMapSize" img="2" text="Size" styles='width:100%' onclick="OnShowSizeMapping()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnMapSpec" img="2" text="Spec" styles='width:100%' onclick="OnShowSpecMapping()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 59%">
                        <td colspan="13" id="tab_SpecMaping">
                            <iframe id="ifrm_SpecMapping" style="width: 100%; height: 100%; background-color: Black"
                                frameborder="0"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
<gw:textbox id="txtOldItemPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtNewItemPK" maxlen="100" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtPatternPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPatternNameRtn" maxlen="100" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
<gw:grid id='grdTmp' header='ST_MAT_PK|MAT_PK|ITEM_CODE|ITEM_NAME|PATTERN_NAME|TPR_PATTERN_GROUP_PK|PATTERN_GROUP_NAME|NET_QTY|LOSS_RATE|GROSS_QTY|MAT_UOM'
    format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0' defaults='||||||||||'
    editcol='1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' styles='width:100%; height:460; display:none' />
<!---------------------------------------------------------------------------------->
</html>
