<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Component</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//------------------------------------------------------------
var GS_PK           = 0,
    GS_Style_Code   = 1,
    GS_Style_Name   = 2;

var G2_ProComp_PK = 0, 
    G2_seq        = 1, 
    G2_WorkPro_PK = 2,
    G2_Process_PK = 3, 
    G2_Process_Nm = 4,
    G2_WP_ID      = 5, 
    G2_WP_NM      = 6,  
    G2_Desc       = 7,
    G2_Style_PK   = 8;  
     
var G3_InCompPK        = 0, 
    G3_Process_Comp_PK = 1, 
    G3_seq             = 2, 
    G3_Comp_PK         = 3,
    G3_ST_Item_PK      = 4,
    G3_Item_PK         = 5,
    G3_Input_ID        = 6,  
    G3_Input_Name      = 7, 
    G3_In_Qty          = 8, 
    G3_Card_YN         = 9, 
    G3_Card_Qty        = 10, 
    G3_Desc            = 11;              
    
var G4_OutCompPK       = 0, 
    G4_Process_Comp_PK = 1, 
    G4_seq             = 2, 
    G4_Comp_PK         = 3,
    G4_Output_ID       = 4, 
    G4_Output_Name     = 5, 
    G4_Out_Qty         = 6, 
    G4_Card_YN         = 7, 
    G4_Card_Qty        = 8,
    G4_Desc            = 9;          
      
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
//================================================================
 
function OnToggleSub(pos)
{ 
     var left  = document.all("tlefts");    
    var right = document.all("trights");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            right.style.width  ="98%";
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            imgArrow1.style.display="none";
            imgArrow2.style.display="";  
          }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="49%";
            right.style.width  ="49%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
         }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="99%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="49%";
            right.style.width  ="49%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
} 
//=================================================================================== 
function BodyInit()
{
    System.Translate(document);
    txtStyleName.SetEnable(false);
    //-------
    BindingDataList();
    FormatGrid();
    //-------
}
//===============================================================================================
function FormatGrid()
{
     var trl ;
     trl = grdProcessCompIn.GetGridControl();     	
     trl.ColFormat(G3_In_Qty )   = "###,###,###,###,###.##";
     trl.ColFormat(G3_Card_Qty ) = "###,###,###,###,###";
     
     trl = grdProcessCompOut.GetGridControl();     	
     trl.ColFormat(G4_Out_Qty)   = "###,###,###,###,###"; 
     trl.ColFormat(G4_Card_Qty ) = "###,###,###,###,###";  
}    
//===============================================================================================
function BindingDataList()
{ 
    var data=""; 
    
    //----------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and ( PROD_YN = 'Y' or sale_yn = 'Y' ) order by grp_cd")%>";     
    lstGroupSearch.SetDataText(data);
          
 }
//===============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpdp00120_2':
        
            if ( grdProcessCompIn.rows > 1 )
            {
                grdProcessCompIn.SetCellBold( 1, G3_In_Qty, grdProcessCompIn.rows - 1, G3_In_Qty, true);
                
                for ( var i=1; i<grdProcessCompIn.rows; i++)
                {
                    if ( Number(grdProcessCompIn.GetGridData( i, G3_Comp_PK )) > 0 )
                    {
                        grdProcessCompIn.SetCellBgColor( i, G3_Input_ID, i, G3_Input_Name, 0xd4d2ff );
                    }
                    else if ( Number(grdProcessCompIn.GetGridData( i, G3_ST_Item_PK )) > 0 )
                    {
                        grdProcessCompIn.SetCellBgColor( i, G3_Input_ID, i, G3_Input_Name, 0xCCFFFF );
                    }
                }                
            }
            
            data_fpdp00120_3.Call('SELECT');
        break; 
        
        case 'data_fpdp00120_3':
            if ( grdProcessCompOut.rows > 1 )
            {
                grdProcessCompOut.SetCellBold( 1, G4_Out_Qty, grdProcessCompOut.rows - 1, G4_Out_Qty, true);
                grdProcessCompOut.SetCellBgColor( 1, G4_Output_ID, grdProcessCompOut.rows - 1, G4_Output_Name, 0xd4d2ff );
            }
        break;
        
        case 'data_fpdp00120_4':
            
            data_fpdp00120_1.Call('SELECT');
            
        break;
        
        case 'data_fpdp00120_1':
            if (grdWorkProcess.GetGridControl().Rows > 1)
            {
                grdWorkProcess.SetCellBold( 1, G2_WP_ID, grdWorkProcess.rows - 1, G2_WP_NM, true);
                
                
                for(var j =1; j< grdWorkProcess.GetGridControl().Rows ; j++)
                {
                    if(grdWorkProcess.GetGridData(j,G2_ProComp_PK )=="")
                    {
                        grdWorkProcess.SetRowStatus(j,48);
                    }
                }
            }
            
            btnCopy.SetEnable(true);
        break; 
        
        case 'pro_fpdp00120_5':   
             
            alert('Copy sucessfull');
            
            copy = '' ;
            OnSearch('Style_Component'); 
                        
        break;    
         
        case 'pro_fpdp00120_6':                               
            alert(txtReturnValue.text);
        break;
        
    }
}

var copy="";
//======================================================================
function OnCopy()
{
    if ( txtStylePK.text != '' )
    {
        copy = 'yes' ;
        txtOldStylePK.text = txtStylePK.text ;
        
        btnCopy.SetEnable(false);
    }
    else
    {
        alert('Pls Select Style first !');
    }    
    
}
//======================================================================
function findItem()
{
    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y||||'
    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

    if ( object != null )
    {
        if ( copy == 'yes')
        {
            if ( confirm ('Are you sure to copy ?') )
            {
                txtNewStylePK.text = object[0];
                
                txtStylePK.text   = object[0];
                txtStyleCode.text = object[1];
                txtStyleName.text = object[2];
                                                            
                pro_fpdp00120_5.Call();                                
            }
            else
            {
                copy = '' ;
                txtStylePK.text   = object[0];
                txtStyleCode.text = object[1];
                txtStyleName.text = object[2];
                OnSearch('Style_Component');                        
            }    
        }
        else
        {
            txtStylePK.text   = object[0];
            txtStyleCode.text = object[1];
            txtStyleName.text = object[2];
            OnSearch('Style_Component');
        }    
                    

    }
}
//======================================================================
 var p_update = '' ;
    
 function OnDelete(pos)
 {
    switch (pos)
    {
        case 'grdWorkProcess' :
            if ( confirm('Are you really want to delete this work process?') )
            {
                if(grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK ) == '')
                {
                    grdWorkProcess.RemoveRow();
                }
                else
                {
                    grdWorkProcess.DeleteRow();
                }
            
            }         
        break;   
          
        case 'grdProcessCompIn' :
             if ( confirm('Are you really want to delete this row?') )
            {
                if(grdProcessCompIn.GetGridData( grdProcessCompIn.row, G3_InCompPK ) == '')
                {
                    grdProcessCompIn.RemoveRow();
                }
                else
                {
                    grdProcessCompIn.DeleteRow();
                }
            }         
        break;
        
        case 'grdProcessCompOut' :
            if ( confirm('Are you really want to delete this row?') )
            {
                if(grdProcessCompOut.GetGridData( grdProcessCompOut.row, G4_OutCompPK ) == '')
                {
                    grdProcessCompOut.RemoveRow();
                }
                else
                {
                    grdProcessCompOut.DeleteRow();
                }
            }         
        break;
    }   
 }
 //======================================================================
 function OnAddNew(obj)
 {
    switch(obj)
    {
        case "grdWorkProcess":
            
            grdWorkProcess.AddRow();   
            grdWorkProcess.SetGridText( grdWorkProcess.rows-1, G2_seq,      grdWorkProcess.rows-1 );
            grdWorkProcess.SetGridText( grdWorkProcess.rows-1, G2_Style_PK, txtStylePK.text       );
            
        break;
        
        case "grdProcessCompIn": 
            if ( grdWorkProcess.row > 0 )
            {
                txtProcessComPK.text = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK);
            }
            else
            {
                alert('Pls select Work Process first.');
                return;
            }
            //--------------------            
            if ( txtProcessComPK.text == '' )
            {
                alert("Please save work process first!!!");
                return;
            }
            //--------------------
            var process_pk = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_Process_PK);
            
            var path = System.RootURL + "/form/fp/dp/fpdp00122.aspx?style_pk="+ txtStylePK.text +"&process_pk="+ process_pk;
            
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            
            var temp;
            if ( obj != null )
            {
                  for (var j =0 ; j < obj.length; j++)
                  {
                     temp = obj[j];
                     
                     if ( OnCheckDuplicate('grdProcessCompIn', temp[0]) )
                     {                          
                         grdProcessCompIn.AddRow();

                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_seq,     grdProcessCompIn.rows-1  );
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_Card_YN, -1  );
                         
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_Process_Comp_PK, txtProcessComPK.text);  
                         
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_Comp_PK,    temp[0] ); //component_pk
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_Input_ID,   temp[3] ); //com_id
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_Input_Name, temp[4] ); //com_name   
                                 	                          
                         grdProcessCompIn.SetGridText( grdProcessCompIn.rows -1, G3_In_Qty, temp[5] );
                         
                         grdProcessCompIn.SetCellBgColor( grdProcessCompIn.rows-1, G3_seq, grdProcessCompIn.rows-1, G3_seq, 0xCCFF99 );
                     }
                  }
            }	 
           
        break;
        
        case "FreeMat":
            if ( grdWorkProcess.row > 0 )
            {
                txtProcessComPK.text = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK);
            }
            else
            {
                alert('Pls select Work Process first.');
                return;
            }
                        
            if ( txtProcessComPK.text == '' )
            {
                alert("Please save work process first!!!");
                return;
            }
                    
            var path = System.RootURL + '/form/fp/ab/fpab00350.aspx?group_type=||Y|Y|Y|Y';
            var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');

             if ( obj != null )
             {
                for ( var j=0 ; j<obj.length; j++)
                {
                    temp = obj[j];
                    /*--------------------*/                    
                    grdProcessCompIn.AddRow();
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_seq,             grdProcessCompIn.rows-1 );
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Process_Comp_PK, txtProcessComPK.text  );                      
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Input_ID,        temp[2]+"" ); //Mat Code
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Input_Name,      temp[3]+"" ); //Mat Name          	                          
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Card_YN,         -1         );

                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_ST_Item_PK, temp[0] ); //st_item_pk                    
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Item_PK,    temp[1] ); //item_pk
                    
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_In_Qty, 1 );
                    
                    grdProcessCompIn.SetCellBgColor( grdProcessCompIn.rows-1, G3_seq, grdProcessCompIn.rows-1, G3_seq, 0xCCFF99 );
                }
            }
        
        break;
        
        case "ConsMat": 
            if ( grdWorkProcess.row > 0 )
            {
                txtProcessComPK.text = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK);
            }
            else
            {
                alert('Pls select Work Process first.');
                return;
            }
                        
            if ( txtProcessComPK.text == '' )
            {
                alert("Please save work process first!!!");
                return;
            }
                        
            var path = System.RootURL + '/form/fp/dp/fpdp00123.aspx?process_pk='+ grdWorkProcess.GetGridData( grdWorkProcess.row, G2_Process_PK) +'&style_pk='+ txtStylePK.text;
            var obj = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
                 
             if ( obj != null )
             {
                for ( var j=0 ; j<obj.length; j++)
                {
                    temp = obj[j];
                    /*--------------------*/                    
                    grdProcessCompIn.AddRow();
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_seq,             grdProcessCompIn.rows-1 );
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Process_Comp_PK, txtProcessComPK.text  );  
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Input_ID,        temp[3]+"" ); //Mat Code
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Input_Name,      temp[4]+"" ); //Mat Name          	                          
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Card_YN,         -1         );

                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_ST_Item_PK, temp[1] ); //st_item_pk                    
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_Item_PK,    temp[2] ); //item_pk
                    
                    grdProcessCompIn.SetGridText( grdProcessCompIn.rows-1, G3_In_Qty, temp[5] );
                    
                    grdProcessCompIn.SetCellBgColor( grdProcessCompIn.rows-1, G3_seq, grdProcessCompIn.rows-1, G3_seq, 0xCCFF99 );
                }
            }
      
        break;
        
        case "grdProcessCompOut":
            if ( grdWorkProcess.row > 0 )
            {
                txtProcessComPK.text = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK);
            }
            else
            {
                alert('Pls select Work Process first.');
                return;
            }
                        
            if ( txtProcessComPK.text == '' )
            {
                alert("Please save work process first!!!");
                return;
            }
            
            if ( grdProcessCompOut.rows > 1 )
            {
                alert('The Out Component is one only !');
                return;
            }
                                    
            var process_pk = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_Process_PK);
            
            var path = System.RootURL + "/form/fp/dp/fpdp00121.aspx?style_pk="+ txtStylePK.text +"&process_pk="+ process_pk;
            
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            
            var temp;
            if ( obj != null )
            {
                                                
                     grdProcessCompOut.AddRow();

                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_seq, grdProcessCompOut.rows-1  );
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Card_YN, -1  );
                     
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Process_Comp_PK, txtProcessComPK.text);  
                     
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Comp_PK,     obj[0] ); //component_pk
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Output_ID,   obj[3] ); //com_id
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Output_Name, obj[4] ); //com_name   
                             	                          
                     grdProcessCompOut.SetGridText( grdProcessCompOut.rows -1, G4_Out_Qty, obj[5] );
                     
                     grdProcessCompOut.SetCellBgColor( grdProcessCompOut.rows-1, G4_seq, grdProcessCompOut.rows-1, G4_seq, 0xCCFF99 );
            }	
            
        break;
    }
 }  
 //======================================================================
 function OnValidateData(obj)
 {
    switch (obj)
     {
        case 'grdWorkProcess' :
            var trl = grdWorkProcess.GetGridControl();
            for(var i =1; i<trl.Rows; i++)
            {
                if(grdWorkProcess.GetGridData(i,G2_WorkPro_PK) =="")
                {
                    alert("Please select work process first!!!");
                    return false;
                }
            }
        break;         
        case 'grdProcessCompIn' :
            var trl = grdProcessCompIn.GetGridControl();
            for(var i =1; i<trl.Rows; i++)
            {   
                if( Number(grdProcessCompIn.GetGridData(i,G3_In_Qty)) == 0)
                {
                    alert("Please enter in qty first!!!");
                    return false;
                }
            }
        break; 
        case 'grdProcessCompOut' :
            var trl = grdProcessCompOut.GetGridControl();
            for(var i =1; i<trl.Rows; i++)
            {   
                if(grdProcessCompOut.GetGridData(i,G4_Comp_PK) =="")
                {
                    alert("Please select component first!!!");
                    return false;
                }
                
                if( Number(grdProcessCompOut.GetGridData(i,G4_Out_Qty)) ==0)
                {
                    alert("Please enter out qty first!!!");
                    return false;
                }
            }
        break;   
     }
     return true;
 }
 //======================================================================
 function OnCheckDuplicate(ogrid, value)
 {
    switch(ogrid)
    {
        case "grdProcessCompIn":            
            for(var i=1; i<grdProcessCompIn.rows; i++)
            {
                if ( Number(value) == grdProcessCompIn.GetGridData( i, G3_Comp_PK))
                {
                    alert("In component must be different to out component!!!");
                    return false;
                }
            }
        break;                
        
        case "ConsMat":
            for(var i =1; i<grdProcessCompIn.rows; i++)
            {
                if ( value == grdProcessCompIn.GetGridData( i, G3_Item_PK) && grdProcessCompIn.GetGridData( i, G3_Item_PK) != '' )
                {
                    alert("In component must be different to out material!!!");
                    return false;
                }
            }
        break;
    }
    return true;
 }
 //======================================================================
 function CheckInput(pos)
 {
    row = event.row ;
    col = event.col ;  
    switch(pos)
    {
        case 'grdProcessCompIn':
            if ( col == G3_In_Qty || col == G3_Card_Qty )
            {
                var dQuantiy;
                
                dQuantiy =  grdProcessCompIn.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        if ( col == G3_In_Qty )
                        {
                            grdProcessCompIn.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                        }
                        else
                        {
                            grdProcessCompIn.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                        }    
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdProcessCompIn.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdProcessCompIn.SetGridText(row,col,"")
                }         
            }       
        break;
        
        case 'grdProcessCompOut':
            if ( col == G4_Out_Qty || col == G4_Card_Qty)
            {
                var dQuantiy;
                
                dQuantiy =  grdProcessCompOut.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdProcessCompOut.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdProcessCompOut.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdProcessCompOut.SetGridText(row,col,"")
                }         
            }       
        break;
        
    }     
 }
 //======================================================================
 function OnSave(pos)
 {
     switch (pos)
     {
        case 'grdWorkProcess' :
            if(OnValidateData('grdWorkProcess'))
                data_fpdp00120_1.Call();               
        break;         
        case 'grdProcessCompIn' :
            if(OnValidateData('grdProcessCompIn'))
                data_fpdp00120_2.Call();
        break; 
        case 'grdProcessCompOut' :
            if(OnValidateData('grdProcessCompOut'))
                data_fpdp00120_3.Call();
        break;
  
     }
 }
 //======================================================================
 function OnSearch(pos)
 {
    switch ( pos )
    {
        case 'grdSTItemList' :
            data_fpdp00120.Call("SELECT");
        break;
        
        case "Style_Component":
            data_fpdp00120_1.Call('SELECT');
        break;
        
        case 'grdWorkProcess' :
            if ( grdWorkProcess.row > 0 )
            {
                txtProcessComPK.text = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_ProComp_PK);
            }
            else
            {
                txtProcessComPK.text = '' ;
            }    

            data_fpdp00120_2.Call("SELECT");
        break;
          
        case 'Style':
            data_fpdp00120_4.Call('SELECT');
        break;   
    }    
 }
 //======================================================================
 function OnGridCellClick(obj)
 {
    switch (obj.id)
    {
        case 'grdSTItemList' :        
            if ( grdSTItemList.row > 0 )
            {
                if ( copy == 'yes')
                {
                    if ( confirm ('Are you sure to copy?') )
                    {
                        txtNewStylePK.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_PK );
                        pro_fpdp00120_5.Call();
                        btCopy.disabled=false;
                    }
                    else
                    {
                        copy = '' ;
                        txtStylePK.text   = grdSTItemList.GetGridData( grdSTItemList.row, GS_PK         );
                        txtStyleCode.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Code );
                        txtStyleName.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Name );
                        OnSearch('Style_Component');                        
                    }    
                }
                else
                {
                    txtStylePK.text   = grdSTItemList.GetGridData( grdSTItemList.row, GS_PK         );
                    txtStyleCode.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Code );
                    txtStyleName.text = grdSTItemList.GetGridData( grdSTItemList.row, GS_Style_Name );
                    OnSearch('Style_Component');
                }    
            }  
        break;
    }
 }
 //======================================================================
function OnGridCellDblClick(obj)
{
    switch (obj)
    {   
        case "grdWorkProcess":
            if ( ( event.col == G2_WP_ID|| event.col == G2_WP_NM ) && event.row > 0 )
            {
                 var event_col = event.col ;
                 var event_row = event.row ;
                  
                 var path = System.RootURL + '/form/fp/ab/fpab00250.aspx?tco_stitem_pk='+txtStylePK.text+'&cut_yn=N';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( obj != null )
                 {
                     grdWorkProcess.SetGridText( event_row, G2_WorkPro_PK, obj[0] ); //WP_pk
                     grdWorkProcess.SetGridText( event_row, G2_WP_ID,      obj[3] ); //WP_id
                     grdWorkProcess.SetGridText( event_row, G2_WP_NM,    obj[4] ); //WP_name           	                          
                 }	                
            }   
        break;
                
        case "grdProcessCompOut":
            if ( ( event.col == G4_Output_ID|| event.col == G4_Output_Name ) && event.row > 0 )
            {
                 var event_row = event.row ;
                 
                 var process_pk = grdWorkProcess.GetGridData( grdWorkProcess.row, G2_Process_PK);
                  
                 var path = System.RootURL + "/form/fp/dp/fpdp00121.aspx?style_pk="+ txtStylePK.text +"&process_pk="+ process_pk;
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( obj != null )
                 {
                   
                    grdProcessCompOut.SetGridText( event_row, G4_Comp_PK,     obj[0] ); //component PK
                    grdProcessCompOut.SetGridText( event_row, G4_Output_ID,   obj[3] ); //component ID
                    grdProcessCompOut.SetGridText( event_row, G4_Output_Name, obj[4] ); //component Name  
                    
                    grdProcessCompOut.SetGridText( event_row, G4_Out_Qty, obj[5] );        	                          
                 }	                  
            }   
        break;
    }
}
//----------------------------------------------------------------------------
function OnConfirm()
{
    if ( txtStylePK.text != '' )
    {
        if ( confirm('Do you want to confirm this Process Component.'))
        {
            pro_fpdp00120_6.Call()
        }    
    }
    else
    {
        alert('Please, select a Style to confirm!');
    }
}
//============================================================================
</script>

<body>
    <!-----------------Search ST Item List ---------------------------->
    <gw:data id="data_fpdp00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpdp00120" > 
                <input bind="grdSTItemList" > 
                    <input bind="lstGroupSearch"/> 
                    <input bind="txtSTItemSearch"/>
                    <input bind="chkComponent" />
                </input> 
                <output bind="grdSTItemList" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00120_1" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8"  function="<%=l_user%>lg_sel_fpdp00120_1"  procedure="<%=l_user%>lg_upd_fpdp00120_1" >
                <input>
                    <input bind="txtStylePK" />
                </input>
                <output bind="grdWorkProcess" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00120_2" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11"  function="<%=l_user%>lg_sel_fpdp00120_2"  procedure="<%=l_user%>lg_upd_fpdp00120_2" >
                <input>
                    <input bind="txtProcessComPK" />
                </input>
                <output bind="grdProcessCompIn" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00120_3" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9"  function="<%=l_user%>lg_sel_fpdp00120_3"  procedure="<%=l_user%>lg_upd_fpdp00120_3" >
                <input>
                    <input bind="txtProcessComPK" />
                </input>
                <output bind="grdProcessCompOut" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpdp00120_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fpdp00120_4"  > 
                <inout> 
                    <inout bind="txtStyleCode" />  
                    <inout bind="txtStylePK" />
                    <inout bind="txtStyleName"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fpdp00120_5" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process" user="prod" parameter="0" procedure="<%=l_user%>lg_pro_fpdp00120_5"  > 
                <input> 
                    <input bind="txtOldStylePK" />  
                    <input bind="txtNewStylePK" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpdp00120_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpdp00120_6" > 
                <input>
                    <input bind="txtStylePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
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
                            <gw:imgbtn id="ibtnSearchSTItem" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            <b>Style </b>
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtSTItemSearch" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdSTItemList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:checkbox id="chkComponent" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSTItemList' header='_PK|Style Code|Style Name' format='0|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='1000|1500|2000' sorting='T' styles='width:100%; height:100%'
                                onclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%" id="t-right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td colspan="3">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" /></td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="findItem()">Style </b>
                                    </td>
                                    <td style="width: 76%; white-space: nowrap">
                                        <gw:textbox id="txtStylePK" styles="display:none" />
                                        <gw:textbox id="txtStyleCode" text="" styles='width:30%' onenterkey="OnSearch('Style')" />
                                        <gw:textbox id="txtStyleName" text="" styles='width:70%' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCopy" img="2" text="Copy" onclick="OnCopy()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnConfirm" img="2" text="Confirm" onclick="OnConfirm()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="search" alt="Search" id="btn" onclick="OnSearch('Style_Component')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="new" alt="Add new" id="btnNew" onclick="OnAddNew('grdWorkProcess')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDel" onclick="OnDelete('grdWorkProcess')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('grdWorkProcess')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td style="width: 100%" colspan="3">
                            <gw:grid id='grdWorkProcess' header='_PK|Seq|_PB_WORK_PROCESS_PK|_process_pk|Process|Work Process ID|Work Process Name|Description|_Style_pk'
                                format='0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|0|0' defaults='||||||||' editcol='0|1|0|0|0|0|0|1|0'
                                widths='0|600|0|0|2800|2500|3000|1800|0' sorting='T' styles='width:100%; height:100%'
                                onclick="OnSearch('grdWorkProcess')" oncelldblclick="OnGridCellDblClick('grdWorkProcess')" />
                        </td>
                    </tr>
                    <tr style="height: 54%">
                        <td style="width: 49%" id="tlefts">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 100%">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 94%">
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="search" alt="Add new" id="btnInSearch" onclick="data_fpdp00120_2.Call('SELECT')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="btnAddComp" img="2" text="In Component" onclick="OnAddNew('grdProcessCompIn')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="btnAddMat" img="2" text="Style Cons" onclick="OnAddNew('ConsMat')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="btnAddFreeMat" img="2" text="Free Mat" onclick="OnAddNew('FreeMat')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="delete" alt="Add new" id="btnInDel" onclick="OnDelete('grdProcessCompIn')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="save" alt="Add new" id="btnInSave" onclick="OnSave('grdProcessCompIn')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td>
                                        <gw:grid id='grdProcessCompIn' header='_PK|_PT_PROCESS_COMP_PK|Seq|_PT_COMPONENT_PK|_ST_ITEM_PK|_ITEM_PK|Input Code|Input Name|In Qty|Card YN|Card Qty|Remark'
                                            format='0|0|0|0|0|0|0|0|0|3|0|0' 
                                            aligns='0|0|1|0|0|0|0|0|3|0|3|0' 
                                            defaults='|||||||||||'
                                            editcol='0|0|1|0|0|0|0|0|1|1|1|1' 
                                            widths='0|0|800|0|0|0|1500|2500|1000|1000|1000|1000'
                                            sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput('grdProcessCompIn')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 2%; white-space: nowrap" align="center">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggleSub('1')" />
                            <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                                style="cursor: hand" onclick="OnToggleSub('2')" />
                        </td>
                        <td style="width: 49%" id="trights">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 100%">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 96%">
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="search" alt="Add new" id="btnOutSearch" onclick="data_fpdp00120_3.Call('SELECT')" />
                                                </td>
                                                <td style="width: 1%"> 
                                                    <gw:icon id="btnAddCompOut" img="2" text="Out Component" onclick="OnAddNew('grdProcessCompOut')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="delete" alt="Add new" id="btnOutDel" onclick="OnDelete('grdProcessCompOut')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn img="save" alt="Add new" id="btnOutSave" onclick="OnSave('grdProcessCompOut')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 99%">
                                    <td>
                                        <gw:grid id='grdProcessCompOut' header='_pk|_pt_process_comp_pk|Seq|_tco_component_type_pk|OutPut ID|OutPut Name|Out Qty|Card YN|Card Qty|Description'
                                            format='0|0|0|0|0|0|0|3|0|0' aligns='0|0|1|0|0|0|3|0|3|0' defaults='|||||||||'
                                            editcol='0|0|0|0|0|0|1|1|1|0' widths='0|0|800|0|1500|2500|1000|1000|1000|1000'
                                            sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDblClick('grdProcessCompOut')"
                                            onafteredit="CheckInput('grdProcessCompOut')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtProcessComPK" text="" styles="display:none" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
    <gw:textbox id="txtOldStylePK" text="" styles="display:none" />
    <gw:textbox id="txtNewStylePK" text="" styles="display:none" />
    <!---------------------------------------------------------------------->
</body>
</html>
