<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Style Pattern</title>
</head>

<script type="text/javascript" language="javascript">
//------------grdDetail----------

var G1_PK           = 0,
    G1_Patterm_ID   = 1,
    G1_Patterm_Nm   = 2;
     
 var G2_PK              = 0,
     G2_TPR_PATTERN_PK  = 1,
     G2_tpr_process_pk  = 2,
     G2_Group_ID        = 3,
     G2_Group_Name      = 4,
     G2_ST_MAT_PK       = 5,
     G2_MAT_PK          = 6,
     G2_Item_Code       = 7,
     G2_Item_Name       = 8,
     G2_Net_Qty         = 9,
     G2_Loss_Rate       = 10,
     G2_Gross_Qty       = 11,
     G2_UOM             = 12,
     G2_Description     = 13;
     
 var G3_PK                  = 0,
     G3_Component_Group_PK  = 1,
     G3_tco_component_pk    = 2,
     G3_Component_ID        = 3,
     G3_Component_NM        = 4,
     G3_Quantity            = 5,
     G3_PICTURE_PK          = 6,
     G3_Length              = 7,     
     G3_Width               = 8,
     G3_UOM                 = 9,
     G3_Card_Qty            = 10,
     G3_close_yn            = 11,
     G3_Description         = 12;
     
 var v_update = 0;
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
 //===============================================================================================
    function BodyInit()
    {   
           System.Translate(document);
        var popup_yn = "<%=request.QueryString("popup_yn") %>"   ;
        
        if ( popup_yn == 'Y' )
        {
            btnSelect.SetEnable(true);
        }
        else
        {
            btnSelect.SetEnable(false);
        }
        //-------------------------        
        var tab_edit_component = document.all("tab_edit_component");    
        var tab_view_component = document.all("tab_view_component");    
        
        tab_edit_component.style.display = "";
        tab_view_component.style.display = "none";
	    
        document.all("Edit_Component").style.color = "red"; 
        document.all("View_Component").style.color = "";         
        //-------------------------
        BindingDataList();          
        
        OnNew('Pattern');
        
        OnSearch('PatternList'); 
    }
 //===============================================================================================
    function BindingDataList()
    {    
          var data="";

    	  data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    	  lstLang.SetDataText(data);      
          lstLang.value = "<%=Session("SESSION_LANG")%>";
	                          
          data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT   pk, process_id || ' - ' || process_name FROM tlg_pb_process WHERE del_if = 0 and process_type = '10' ORDER BY process_id" ) %> ";       
          grdComponentGroup.SetComboFormat( G2_tpr_process_pk, data); 
          
          data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT   uom_code, uom_code FROM tlg_it_uom WHERE del_if = 0 ORDER BY 1" ) %> ";       
          grdComponent.SetComboFormat( G3_UOM, data); 
          
          var trl;
      
          trl = grdComponentGroup.GetGridControl();	
          trl.ColFormat(G2_Gross_Qty) = "###,###,###,###,###.#####"; 
          trl.ColFormat(G2_Net_Qty)   = "###,###,###,###,###.#####"; 
          trl.ColFormat(G2_Loss_Rate) = "###,###,###,###,###.##"; 
                
          trl = grdComponent.GetGridControl();
          trl.ColFormat(G3_Quantity) = "###,###,###,###,###";
          trl.ColFormat(G3_Length)   = "###,###,###,###,###.##"; 
          trl.ColFormat(G3_Width)    = "###,###,###,###,###.##";
          trl.ColFormat(G3_Card_Qty) = "###,###,###,###,###"; 
                                                                                  
    }
//==========================================================================    
function OnSearch(id)
{      
       switch(id)
       {
            case 'PatternList' :    //Seach pattern
                 data_fpdp00110.Call('SELECT');
            break;  
            
            case 'Pattern' : 
                 flag_update = '';
                 
                 if ( grdSearch.row > 0 )
                 {
                    if ( copy == 'yes')
                    {  
                        if ( confirm ('Are you sure to copy?') )
                        { 
                            btnCopy.disabled = false;
                            
                            txtNewPatternPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);
                            
                            pro_fpdp00110.Call();                                                        
                        }  
                        else
                        {
                            btnCopy.disabled = false;
                            
                            txtPatternPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);                            
                            
                            data_fpdp00110_1.Call('SELECT');                                                                                
                        }  
                    }    
                    else
                    {    
                        btnCopy.disabled = false;
                                      
                        txtPatternPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);
                        
                        data_fpdp00110_1.Call('SELECT');
                    }    
                 }
                 else
                 {
                    txtPatternPK.text = '';
                    
                    grdComponentGroup.ClearData();
                    grdComponent.ClearData();
                 } 
                 //-----------------------                 
            break;
             
            case 'grdComponent' :
                 //--------------------------------
                 if ( grdComponentGroup.row > 0 ) 
                 {
                    txtGroupComponentPK.text = grdComponentGroup.GetGridData( grdComponentGroup.row, G2_PK);
                 }
                 else
                 {
                    txtGroupComponentPK.text = '' ;
                 }
                 //------------

                 if ( CheckGridEdit(grdComponent) )
                 {
                    if ( confirm("Detail information has modified. \n Do you want to save? ") )
                    {
                        OnSave('grdComponent');
                        return;
                    }
                 }
                 
                 data_fpdp00110_3.Call('SELECT');  
            break;
       }
}
//==============================================================

function CheckGridEdit(o_Grid)
{
    for ( i = 1; i<o_Grid.rows; i++ )
    {
        if ( o_Grid.GetRowStatus(i) > 0 )
        {
            return true;
        }        
    }
    
    return false;
}

//==============================================================
function OnNew(id)
{
    switch(id)
    {
        case 'Pattern':                                           //New Detail
            grdComponentGroup.ClearData();
            
            data_fpdp00110_1.StatusInsert();
            
            txtPatternID.text   = '<< New ID >>';
            txtPatternName.text = '<< New Name >>';
            
            grdComponent.ClearData();
            grdComponent1.ClearData();
            ViewComponent();
            
        break;
        
        case 'ComponentGroup':        //New Component Group
            grdComponent.ClearData();
            
            grdComponentGroup.AddRow();
            grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_TPR_PATTERN_PK, txtPatternPK.text );
        break;
 
        case 'grdComponent':        //New Component 
            if ( grdComponentGroup.row > 0 )
            {
                if ( txtGroupComponentPK.text != '' )
                {
                     var path = System.RootURL + '/form/fp/dp/fpdp00020.aspx?popup_yn=Y';
                     var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
                     
                     if ( object != null )
                     {
                        for( var i=0; i < object.length; i++) 
                        {
                              grdComponent.AddRow(); 
                               
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_Group_PK, txtGroupComponentPK.text );
                              
                              grdComponent.SetGridText( grdComponent.rows-1, G3_tco_component_pk, object[i][0] );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_ID,     object[i][1] );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_NM,     object[i][2] );
                              
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Quantity,         object[i][6] );
                                                                                          
                              grdComponent.SetCellBgColor( grdComponent.rows-1, 0, grdComponent.rows-1, grdComponent.cols-1, 0xCCFFFF ); 
                        }  
                     }
                }
                else
                {
                    alert('Pls Save this Group first.');
                }
            }
            else
            {
                alert('Pls select one saved Component Group.');
            }
        break;
       
    }
   
}
//==============================================================
var flag_update ;
//==============================================================
function OnSave(id)
{
    switch (id)
    {
        case 'Pattern':
            flag_update = 'update' ;
            data_fpdp00110_1.Call();
        break;
        
        case 'ComponentGroup':
            SetMasterPKtoGrid();
            data_fpdp00110_2.Call();
        break;    
        
        case 'grdComponent':
            data_fpdp00110_3.Call();
        break;        
            
    }
}
//==============================================================
function OnDelete(obj)
{
    if ( obj == 'Pattern' )
    {
        if ( confirm ( "Do you want to delete this order?" ) )
        {
            if ( txtPatternPK != "")
            {
                data_fpdp00110_1.StatusDelete();
                data_fpdp00110_1.Call();
            }    
            else
            {
                alert("Please,Select a SO !");
            }    
        }
    }
    else 
    {
          if ( obj.row > 0 )
          {
                if ( obj.GetGridData( obj.row, 0 ) == "" ) 
                {						
		                obj.RemoveRow();	
                }			
                else 
                {
	                if ( confirm( "Do you want to mark this row to delete?" ) ) 
	                {
		                obj.DeleteRow();
	                }
                }       
          }
    }  
}
//==============================================================
    function OnUnDelete()
    {
          var ctrl =  grdMaster.GetGridData()  
          var row  = ctrl.row; 
          
          if ( row > 0 )
          {
                grdMaster.UnDeleteRow();
          }
    }

//==============================================================================
function OnDataReceive(obj)
{   
    switch(obj.id)
    {
        
        case 'data_fpdp00110_1':
             if ( flag_update == 'update' )
             {
                OnSave('ComponentGroup');
             }
             else
             {
                data_fpdp00110_2.Call("SELECT");
             }   
        break;
        
        case 'data_fpdp00110_2':
             //--------
             txtGroupComponentListPK.text="";
             
             for(i=1; i<grdComponentGroup.rows; i++)
             {
                txtGroupComponentListPK.text = txtGroupComponentListPK.text +"," + grdComponentGroup.GetGridData( i, G2_PK);
             }
             
             txtGroupComponentListPK.text = txtGroupComponentListPK.text.substr(1);
             
             if ( grdComponentGroup.rows > 1 )
             {
                grdComponentGroup.SetCellBgColor( 1, G2_Item_Code, grdComponentGroup.rows-1, G2_Item_Name, 0xCCFFFF );
             }
             //-------- 
             OnChangeTab();
        break;
        
        case 'data_fpdp00110_4':
            ViewComponent();
        break;  
        
        case 'pro_fpdp00110':   
             
            alert('Copy sucessfull');
            
            copy = '' ;
            OnSearch('Pattern'); 
        
        break;  
    }
}
//==================================================
 function SetMasterPKtoGrid()
 {
    if ( txtPatternPK.text != '' )
    {
        for (var i = 1; i < grdComponentGroup.rows ; i++ )
        {
            if ( grdComponentGroup.GetGridData( i, G2_TPR_PATTERN_PK) == "" )
            {
                grdComponentGroup.SetGridText( i, G2_TPR_PATTERN_PK, txtPatternPK.text) ;
            }
        }
    }    
 }
//==============================================================================
   function OnAttachFile()
    {
             var pattern_pk, picture_pk ;
             picture_pk = txtPicturePK.GetData();
             var path = System.RootURL + '/form/fp/dp/fpdp00065.aspx?picture_pk=' + picture_pk ;
             var object = System.OpenModal( path , 400 , 400 ,  'resizable:yes;status:yes');
             {
                 if(object!= null)
                 {
                     txtPicturePK.SetDataText(object[0]);
                 }
             }
     }
//==============================================================================
 function ShowPicture()
 { 
    var pattern_pk, picture_pk ;
    
    var row = event.row ;
    var col = event.col ;
    
    if ( col == G3_Component_ID || col == G3_Component_NM )
    {
        picture_pk = grdComponent.GetGridData( row, G3_PICTURE_PK);
        pattern_pk = grdComponent.GetGridData( row, G3_PK);

        var path = System.RootURL + '/form/fp/dp/fpdp00065.aspx?patternd_pk=' + pattern_pk + '&picture_pk=' + picture_pk ;
        var object = System.OpenModal( path ,500 , 500 ,  'resizable:yes;status:yes');    
        {
            if(object!= null)
            {
                grdComponent.SetGridText( row, G3_PICTURE_PK, object[0]);
                txtPictureName.text = 'File';
            }
        }
    }
 }
//=====================================    
 function ViewComponent()
 {
    var tableView = document.all("viewImg"); 
    var str = "";
    
    tableView.innerHTML = "";
    
    if ( grdComponent1.rows > 0 )
    {
        str = " <table style=' width: 100%; height:500' border='1'> "
        str =  str + " <tr style='height: 1%' > "
        str =  str + " <td width='20%' align='center' style='background-color: #99ccff' > Component ID </td>  "
        str =  str + " <td width='40%' align='center' style='background-color: #99ccff' > Component NM </td>  "
        str =  str + " <td width='10%' align='center' style='background-color: #99ccff' > Quantity </td>  "
        str =  str + " <td width='30%' align='center' style='background-color: #99ccff' > Image </td>  "
        str =  str + " </tr> "
        
        for(var i =1; i<grdComponent1.rows; i++)
        {
              str =  str + " <tr style='height: 20' > "
              str =  str + " <td  align='center' >" + grdComponent1.GetGridData( i, G3_Component_ID) +  "</td>  "
              str =  str + " <td  align='center' >" + grdComponent1.GetGridData( i, G3_Component_NM) +  " </td>  "
              str =  str + " <td  align='right' >"  + grdComponent1.GetGridData( i, G3_Quantity) +  " </td>  "
              str =  str + " <td  align='center' onmouseover='onEnalbe(idIm"+i+")'  onclick='zoomImg("+i+")'> "
              str =  str + " <gw:image id='idIm"+i+"' table_name='TES_LGPICTURE' oid='"+grdComponent1.GetGridData( i, G3_PICTURE_PK)+"' view='/binary/ViewFile.aspx' post='/binary/PostFile.aspx' styles='width:100;height:100' />"
              str =  str+  "</td>"
              str =  str + "</tr>"
        }
        
        str = str + " </table> ";
    } 
    
    tableView.innerHTML = str
 }
 //===================================================================================
    function onEnalbe(obj)
    {
        obj.SetEnable(false)
    }
 //=====================================sho-img==============================================
    function zoomImg(sel_row)
    {
        var img_pk = grdComponent.GetGridData( sel_row, G3_PICTURE_PK);
        
        var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TES_LGPICTURE";	
	    System.OpenModal( url ,500 , 500 ,  'resizable:yes;status:yes'); 
    	
    } 
 //===================================================================================
function CheckEdit(obj)
{
    var col, row;

    col = event.col;
    row = event.row;
    
    switch (obj.id)
    {
        case 'grdComponentGroup' :        
            if ( col == G2_Loss_Rate || col == G2_Net_Qty || col == G2_Gross_Qty )
            {
                var dQuantiy ;
                
                dQuantiy = grdComponentGroup.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        if ( col == G2_Loss_Rate )
                        {
                            grdComponentGroup.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));                
                        }
                        else
                        {
                            grdComponentGroup.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(5));
                        }    
                    }
                    else
                    {
                        grdComponentGroup.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdComponentGroup.SetGridText(row,col,"")
                } 
                //----------------------
                
                if ( col == G2_Loss_Rate || col == G2_Net_Qty )
                {
                    var loss, net, gross_qty ; 
                    
                    loss = Number(grdComponentGroup.GetGridData( row, G2_Loss_Rate));
                    net  = Number(grdComponentGroup.GetGridData( row, G2_Net_Qty  ));
                    
                    gross_qty = net + (loss*net/100);

                    grdComponentGroup.SetGridText( row, G2_Gross_Qty, parseFloat(gross_qty+"").toFixed(5));

                }    
            }     
        break;
        
        case 'grdComponent' :
            if ( col == G3_Quantity || col == G3_Length || col == G3_Width || col == G3_Card_Qty )
            {
                var dQuantiy ;
                
                dQuantiy = grdComponent.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        if ( col == G3_Quantity || col == G3_Card_Qty )
                        {
                            grdComponent.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));                
                        }
                        else
                        {
                            grdComponent.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                        }    
                    }
                    else
                    {
                        grdComponent.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdComponent.SetGridText(row,col,"")
                }             
            }        
        break;
    }           
}
//====================================================================================
function ViewDesign()
{
     var path = System.RootURL + '/form/fp/dp/fpdp00053.aspx' ;
     var object = System.OpenModal( path , 1000 , 800 ,  'resizable:yes;status:yes');
}
//=================================================================
 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_edit_component = document.all("tab_edit_component");    
    var tab_view_component = document.all("tab_view_component");    
         
	switch (strRad)
	{
		case '1':
		    tab_edit_component.style.display = "";
		    tab_view_component.style.display = "none";
		    
		    document.all("Edit_Component").style.color = "red"; 
		    document.all("View_Component").style.color = "";
		    
		    OnSearch('grdComponent');
        break;
        
        case '2':
		    tab_edit_component.style.display = "none";
		    tab_view_component.style.display = "";
		    
		    document.all("Edit_Component").style.color = ""; 
		    document.all("View_Component").style.color = "red";
		    
		    data_fpdp00110_4.Call('SELECT');
		   
        break;	
    } 
 }
//=================================================================
function OnGridCellDblClick()
{
    var event_col = event.col;
    var event_row = event.row;
    
    if ( event_col == G2_Item_Code || event_col == G2_Item_Name )
    {
        if ( radSearchItem.GetData() == '1' )
        {
                if ( grdComponentGroup.GetGridData( event_row, G2_ST_MAT_PK) == '' && grdComponentGroup.GetGridData( event_row, G2_MAT_PK) == '' )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00210.aspx?group_type=|Y|||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {                    
                            arrTemp = object[i];
                            
                            if ( i == 0 )
                            {
                                grdComponentGroup.SetGridText( event_row, G2_ST_MAT_PK, arrTemp[0] );
                                grdComponentGroup.SetGridText( event_row, G2_Item_Code, arrTemp[1] );
                                grdComponentGroup.SetGridText( event_row, G2_Item_Name, arrTemp[2] );
                                grdComponentGroup.SetGridText( event_row, G2_UOM,       arrTemp[5] );
                                
                                grdComponentGroup.SetGridText( event_row, G2_MAT_PK, '');
                            }
                            else
                            {
                                grdComponentGroup.AddRow();
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_ST_MAT_PK, arrTemp[0] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_Item_Code, arrTemp[1] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_Item_Name, arrTemp[2] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_UOM,       arrTemp[5] );
                                
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_MAT_PK, '');
                                
                            }                                
                        }
                    }     
                }
                else
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=|Y|||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        grdComponentGroup.SetGridText( event_row, G2_ST_MAT_PK, object[0] );
                        grdComponentGroup.SetGridText( event_row, G2_Item_Code, object[1] );
                        grdComponentGroup.SetGridText( event_row, G2_Item_Name, object[2] );
                        grdComponentGroup.SetGridText( event_row, G2_UOM,       object[5] );
                        
                        grdComponentGroup.SetGridText( event_row, G2_MAT_PK, '');
                    }
                }    
                return ;
        }
        else
        {
                if ( grdComponentGroup.GetGridData( event_row, G2_ST_MAT_PK) == '' && grdComponentGroup.GetGridData( event_row, G2_MAT_PK) == '' )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                            arrTemp = object[i];
                            
                            if ( i == 0 )
                            {
                                grdComponentGroup.SetGridText( event_row, G2_MAT_PK,    arrTemp[0] );
                                grdComponentGroup.SetGridText( event_row, G2_Item_Code, arrTemp[1] );
                                grdComponentGroup.SetGridText( event_row, G2_Item_Name, arrTemp[2] );
                                grdComponentGroup.SetGridText( event_row, G2_UOM,       arrTemp[5] );
     
                                grdComponentGroup.SetGridText( event_row, G2_ST_MAT_PK, '');                            
                            }
                            else
                            {
                                grdComponentGroup.AddRow();
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_MAT_PK,    arrTemp[0] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_Item_Code, arrTemp[1] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_Item_Name, arrTemp[2] );
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_UOM,       arrTemp[5] );
     
                                grdComponentGroup.SetGridText( grdComponentGroup.rows-1, G2_ST_MAT_PK, '');                            
                            }
                        }
                    }    
                }
                else
                {        
                    var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=|Y|||Y|Y';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                    
                    if ( object != null )
                    {
                        grdComponentGroup.SetGridText( event_row, G2_MAT_PK,    object[0] );
                        grdComponentGroup.SetGridText( event_row, G2_Item_Code, object[1] );
                        grdComponentGroup.SetGridText( event_row, G2_Item_Name, object[2] );
                        grdComponentGroup.SetGridText( event_row, G2_UOM,       object[5] );
                        
                        grdComponentGroup.SetGridText( event_row, G2_ST_MAT_PK, '');
                    }
                }    
                return ;            
        }
        return;
    }  
    else if ( event_col == G2_UOM )
    {
            if ( grdComponentGroup.GetGridData( event_row, G2_ST_MAT_PK) != "" || grdComponentGroup.GetGridData( event_row, G2_MAT_PK) != "" )
            {
                var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
                var object = System.OpenModal( path ,600 , 500,  'resizable:yes;status:yes');
                
                if ( object != null )
                {
                   grdComponentGroup.SetGridText( event_row, G2_UOM, object[1])
                }
            }
            else
            {
                alert('Select Item first, please !!!')
            } 
            return ; 
    }
}

//======================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   var control = oGrid.GetGridControl();
   
   var rows = control.Rows;
	
	if (control.SelectedRows >0)
	{
		for (i=0; i<control.SelectedRows ; i++)
		{
			var row = control.SelectedRow(i);
			
			var arrTemp=new Array();
         
             for(var j=0;j<oGrid.cols;j++)
             {
                arrTemp[arrTemp.length]= oGrid.GetGridData(row,j);
             }
             
             arr_data[arr_data.length]= arrTemp;
		}
		window.returnValue =  arr_data;
		window.close();
    }
 }
//======================================================================
 
 var copy = "";
//----------------------------------------------------------------------
function OnCopy()
{
    if ( txtPatternPK.text != '' )
    {
        copy = 'yes' ;
        txtOldPatternPK.text = txtPatternPK.text ;
        
        btnCopy.SetEnable(false);
    }
    else
    {
        alert('Pls select Pattern first !');
    }    
    
}
//======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00110" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"   function="<%=l_user%>lg_sel_fpdp00110"  > 
                <input> 
                    <input bind="txtPattern" />
                    <input bind="chkSearchActive" />
                </input> 
                <output bind="grdSearch" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00110_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso type="control" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fpdp00110_1" procedure="<%=l_user%>lg_upd_fpdp00110_1"> 
                <inout> 
                    <inout bind="txtPatternPK" />
                    <inout bind="txtPatternID" />   
                    <inout bind="txtPatternName" />
                    <inout bind="txtPicturePK"  />
                    <inout bind="txtPictureName"  />
                    <inout bind="txtDescription" />
                    <inout bind="chkActive" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00110_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fpdp00110_2" procedure="<%=l_user%>lg_upd_fpdp00110_2" > 
                <input> 
                    <input bind="txtPatternPK" /> 
                </input> 
                <output bind="grdComponentGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00110_3" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpdp00110_3" procedure="<%=l_user%>lg_upd_fpdp00110_3" > 
                <input> 
                    <input bind="txtGroupComponentPK" />
					<input bind="lstLang" /> 
                </input> 
                <output bind="grdComponent" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00110_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fpdp00110_4" > 
                <input> 
                    <input bind="txtGroupComponentPK" /> 
                </input> 
                <output bind="grdComponent1" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fpdp00110" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process" user="prod" parameter="0" procedure="<%=l_user%>lg_pro_fpdp00110"  > 
                <input> 
                    <input bind="txtOldPatternPK" />  
                    <input bind="txtNewPatternPK" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------Search Pattern Master---------------------------------->
    <table name="Pattern Type Entry" border="1" style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td style="width: 30%" valign="top" id="t-left">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            <b>ID/Name</b>
                        </td>
                        <td style="width: 78%">
                            <gw:textbox id="txtPattern" styles='width:100%' onenterkey="OnSearch('PatternList')" />
                        </td>
                        <td style="width: 1%; white-space: nowrap">
                            Active
                            <gw:checkbox id="chkSearchActive" styles="color:blue" defaultvalue="Y|N" value="Y"
                                onclick="OnSearch('PatternList')">
                            </gw:checkbox>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('PatternList')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' header='_PK|Pattern ID|Patterm Nm' format='0|0|0' aligns='0|0|0'
                                editcol='0|0|0' widths='0|1500|2000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Pattern')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" id="t-right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Pattern ID
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtPatternID" maxlen="100" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Name
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtPatternName" maxlen="100" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Active
                            <gw:checkbox id="chkActive" styles="color:blue" defaultvalue="Y|N" value="Y">
                            </gw:checkbox>
                        </td>
                        <td style="width: 1%" colspan="2" align="center">
                            <gw:icon id="btnCopy" img="2" text="Copy" onclick="OnCopy()" />
                            <!-- <gw:icon id="idBtnViewDesign" img="in" text="View Design" styles='width:100%' onclick="ViewDesign()" />-->
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd1" onclick="OnNew('Pattern')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('Pattern')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('Pattern')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnAttachFile()">File </b>
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtPictureName" maxlen="100" styles='width:100%' onenterkey="OnAttachFile()" />
                            <gw:textbox id="txtPicturePK" maxlen="100" styles='width:100%;display:none' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Remark
                        </td>
                        <td style="width: 35%" colspan="7">
                            <gw:textbox id="txtDescription" maxlen="100" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="left">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 35%; white-space: nowrap" align="left" colspan="2">
                            <gw:radio id="radSearchItem" value="1" styles="width:100%">                      
			                    <span value="1">ST Item</span>                       
			                    <span value="2">Item</span>    			                                
        			        </gw:radio>
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd2" onclick="OnNew('ComponentGroup')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete2" onclick="OnDelete(grdComponentGroup)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="Udelete" alt="Un Delete" id="btnUDelete2" onclick="OnUnDelete('grdComponentGroup')" />
                        </td>
                    </tr>
                    <tr style="height: 46%">
                        <td colspan="10">
                            <gw:grid id='grdComponentGroup' header='_PK|_TPR_PATTERN_PK|Process|Group ID|Group Name|_ST_MAT_PK|_MAT_PK|Item Code|Item Name|Net Qty|Loss (%)|Gross Qty|UOM|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|3|3|3|1|0' defaults='|||||||||||||'
                                editcol='0|0|1|1|1|0|0|0|0|1|1|1|0|1' widths='1000|1000|1500|1200|1500|1000|1000|1500|2500|1200|1200|1200|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)'
                                onclick="OnSearch('grdComponent')" onafteredit="CheckEdit(this)" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="left" colspan="2">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="Edit_Component">Edit Component</span> 
                                <span value="2" id="View_Component">View Component</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 35%">
                        </td>
                        <td style="width: 5%">
							 <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('grdComponent')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd3" onclick="OnNew('grdComponent')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete3" onclick="OnDelete(grdComponent)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="Udelete" alt="Un Delete" id="btnUDelete3" onclick="OnUnDelete('grdComponent')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave3" onclick="OnSave('grdComponent')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdComponent)" />
                        </td>
                    </tr>
                    <tr style="height: 50%">
                        <td id="tab_edit_component" colspan="10">
                            <gw:grid id='grdComponent' header='_PK|_G3_Component_Group_PK|_G3_tco_component_pk|Component ID|Component NM|Quantity|_PICTURE_PK|Length|Width|UOM|Card Qty|Close YN|Description'
                                format='0|0|0|0|0|1|0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0|3|3|1|3|1|1' defaults='||||||||||||'
                                editcol='0|0|0|0|0|1|0|1|1|1|1|1|1' widths='0|0|0|1500|2500|1200|0|1200|1200|800|1200|1000|1000'
                                sorting='F' styles='width:100%; height:100%' onafteredit="CheckEdit(this)" oncelldblclick="ShowPicture()" />
                        </td>
                        <td valign="top" id="tab_view_component" colspan="10">
                            <div id="viewImg">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtPatternPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtGroupComponentPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtGroupComponentListPK" maxlen="100" text="" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
<gw:grid id='grdComponent1' header='_PK|_G3_Component_Group_PK|_G3_tco_component_pk|Component ID|Component NM|Quantity|_PICTURE_PK|_Component Type|Description'
    format='0|0|0|0|0|1|0|0|0' aligns='0|0|0|0|0|0|0|0|1' defaults='||||||||' editcol='0|0|0|0|0|1|0|0|0'
    widths='0|0|0|2000|2500|2000|0|2000|1500' sorting='F' styles='width:100%; height:100%;display:none' />
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtOldPatternPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtNewPatternPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
<!------------------------------------------------------------------------------------>
</html>
