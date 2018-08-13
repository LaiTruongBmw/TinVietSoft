<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//----------grdProcess-----
var G1_PROCESS_PK          = 0,
    G1_PROCESS_SEQ         = 1,
    G1_PROCESS_ID          = 2,
    G1_PROCESS_NM          = 3,
    G1_USE_YN              = 4, 
    G1_PROCESS_TYPE        = 5, 
    G1_FEE_RATE            = 6,
	G1_WH_PK			   = 7,	
    G1_REMARK         	   = 8;
//---------------
 
var G2_Work_Process_PK     = 0,
    G2_PB_PROCESS_PK       = 1,
    G2_WP_Seq              = 2,
    G2_WorkProcess_ID      = 3,
    G2_WorkProcess_Name    = 4,
    G2_USE                 = 5,
    G2_WI_YN               = 6,
    G2_WP_Type             = 7,
    G2_F_Product_YN        = 8,
    G2_IN_COMP_PK          = 9,
    G2_IN_COMP_NAME        = 10,
    G2_OUT_COMP_PK         = 11,
    G2_OUT_COMP_NAME       = 12,
	G2_RGB				   = 13,
	G2_COLOR_CODE		   = 14,	
    G2_REMARK              = 15;
//---------------

var G3_STItem_PK          =  0 ,
    G3_STItem_Code        =  1 ,
    G3_STItem_Name        =  2 ;
    
//--------grdWorkProcess-------------    
var G4_Mapping_PK       = 0,
    G4_TCO_STITEM_PK    = 1,
    G4_Mapping_Seq      = 2,
    G4_PB_PROCESS_PK    = 3,
    G4_Process_ID       = 4,
    G4_Process_Name     = 5,
    G4_Process_Type     = 6,
    G4_Description      = 7;
    
//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //------------------
    BindingDataList();
}

//=======================================================================
function BindingDataList()
{
    var data=""; 
       
    data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' ) ORDER BY grp_cd")%>";   
    lstGroup.SetDataText(data);
    //----------------------
    
    data ="#10;10 Cutting|#20;20 Preparation|#30;30 Assembly|#40;40 QC|#50;50 Packing|#;"
    grdProcess.SetComboFormat( G1_PROCESS_TYPE, data); 
    grdMapping.SetComboFormat( G4_Process_Type, data);  

    //-----------------------    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GRouP b WHERE  b.group_ID='LGPC0341' AND a.TLG_LG_CODE_GRouP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" )%> " ; 
    grdWorkProcess.SetComboFormat(G2_WP_Type,data);   
	
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_id  ASC" )%>|#;" ; 
    grdProcess.SetComboFormat(G1_WH_PK,data); 	
    
    var ctrl = grdProcess.GetGridControl();
    ctrl.ColFormat(G1_FEE_RATE) = "###,###,###.##" ;                          
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdProcess' :
			data_fpib00070.Call('SELECT');
		break;
		
		case 'grdWorkProcess' :
		    if (grdProcess.row>0)
		    {
		        txtProcessPK.text = grdProcess.GetGridData( grdProcess.row, G1_PROCESS_PK );
		    }
		    else
		    {
		        txtProcessPK.text = '' ;
		    }
		    
			data_fpib00070_1.Call('SELECT');
		break;

		case 'grdSTItem' :
			data_fpib00070_2.Call('SELECT');
	    break;
	    
		case 'grdMapping' :
		    if ( grdSTItem.row > 0 )
		    {
			    txtSTItemPK.text = grdSTItem.GetGridData( grdSTItem.row, G3_STItem_PK );
			}
			else
			{
			    txtSTItemPK.text = '' ;
			}	
					
			data_fpib00070_3.Call('SELECT');
	    break;
	}
}

//=======================================================================
function OnAddNew(pos)
{
	switch ( pos )
	{
		case 'grdProcess' :
			grdProcess.AddRow();
			
			grdProcess.SetGridText( grdProcess.rows-1, G1_PROCESS_SEQ, grdProcess.rows-1 );
			
			grdProcess.SetCellBgColor( grdProcess.rows-1, 0, grdProcess.rows-1, grdProcess.cols-1, 0xCCFFFF );						
		break;	
				    
		case 'grdWorkProcess':
		    //----------------------
		    if ( txtProcessPK.text == '' )
		    {
		        alert("Please select a saved process!");
		        return ;
		    }
            grdWorkProcess.AddRow();
            
            grdWorkProcess.SetGridText( grdWorkProcess.rows-1, G2_PB_PROCESS_PK, txtProcessPK.text     );                
            grdWorkProcess.SetGridText( grdWorkProcess.rows-1, G2_WP_Seq,        grdWorkProcess.rows-1 );
            
			grdWorkProcess.SetCellBgColor( grdWorkProcess.rows-1, 0, grdWorkProcess.rows-1, grdWorkProcess.cols-1, 0xCCFFFF );						            
            //----------------------		   	   
		break;	
		
		case 'grdMapping':
		    //----------------------
		    if ( txtSTItemPK.text == '' )
		    {
		        alert("Please select ST Item !");
		        return ;
		    }
		    		    
	        var path = System.RootURL + '/form/fp/ib/fpib00071.aspx';
            var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes'); 
                       
            if ( object != null )
            {
                var arrTemp;
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                    
                    grdMapping.AddRow();
                    grdMapping.SetGridText( grdMapping.rows-1, G4_TCO_STITEM_PK, txtSTItemPK.text  );
                    grdMapping.SetGridText( grdMapping.rows-1, G4_Mapping_Seq,   grdMapping.rows-1 );
                    grdMapping.SetGridText( grdMapping.rows-1, G4_PB_PROCESS_PK, arrTemp[0] );
                    grdMapping.SetGridText( grdMapping.rows-1, G4_Process_ID,    arrTemp[2] );  
                    grdMapping.SetGridText( grdMapping.rows-1, G4_Process_Name,  arrTemp[3] );   
                    grdMapping.SetGridText( grdMapping.rows-1, G4_Process_Type,  arrTemp[5] );
                    
                    grdMapping.SetCellBgColor( grdMapping.rows-1, 0, grdMapping.rows-1, grdMapping.cols-1, 0xCCFFFF );                      
                }
            } 
		    //----------------------            
		break;	
	}
}

//=======================================================================
function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//=======================================================================
function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}

//=======================================================================
function OnSave(pos)
{
	switch ( pos )
	{
	
		case 'grdProcess' :
			data_fpib00070.Call();			
		break;

		case 'grdWorkProcess' :
			data_fpib00070_1.Call();			
		break;
					
		case 'grdMapping' :
			data_fpib00070_3.Call();			
		break;		
	}
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_fpib00070' :
	        OnSearch('grdWorkProcess');
	    break;
	    
		case 'data_fpib00070_1':
			for (var i=1; i<grdWorkProcess.rows; i++)
			{
				var color= '0x'+grdWorkProcess.GetGridData(i,G2_COLOR_CODE).substring(4,6)+""+grdWorkProcess.GetGridData(i,G2_COLOR_CODE).substring(2,4)+""+grdWorkProcess.GetGridData(i,G2_COLOR_CODE).substring(0,2);
				grdWorkProcess.SetCellBgColor( i, G2_RGB, i, G2_RGB, Number(color));
			}	
		break;
		
		case 'data_fpib00070_2' :
		    OnSearch('grdMapping');		
		break;		
    }
}
//=======================================================================
function OnReportClick()
{
    var array_line_group_pk = "" ;
    var t_link = "";
    
        for ( var i = 1; i < grdProcess.rows ; i++ )
        {
            if ( grdProcess.GetGridControl().isSelected(i) == true )
            {
                array_line_group_pk = array_line_group_pk + t_link + grdProcess.GetGridData( i, G1_PROCESS_PK);
                t_link = ',' ;
            }       
        }   
    var url =System.RootURL + '/reports/fp/ib/rpt_fpib00070.aspx?array_line_group_pk=' + array_line_group_pk ;
	window.open(url);
}
//=======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'WP_type':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0341";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;  
             
    }             
} 
//=======================================================================
function OnCellDbClick()
{ 
	var event_col = event.col;
	var event_row = event.row;
	
    if ( event_col == G2_IN_COMP_NAME || event_col == G2_OUT_COMP_NAME )
    {
            var path = System.RootURL + "/form/fp/dp/fpdp00020.aspx";
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			
			if ( object != null )
			{
			    var arrComp ;
			    for (var i = 0; i < object.length; i++)
			    {
			        arrComp = object[i];
					 
                    grdWorkProcess.SetGridText( event_row, event_col-1, arrComp[0]);
                    grdWorkProcess.SetGridText( event_row, event_col,   arrComp[2]);                     		        
			    }
			}
    }
	else if( event_col == G2_RGB)
    {
        var fpath = System.RootURL + "/form/fp/ab/fpab00660.aspx";
        var value  = System.OpenModal(  fpath ,350 ,350 , 'resizable:yes;status:yes');
		
        if ( value != null )
        {   
            var color= "0x"+value.substring(4,6)+""+value.substring(2,4)+""+value.substring(0,2);
			
            grdWorkProcess.SetCellBgColor( event_row, G2_RGB, event_row, G2_RGB, Number(color));
            grdWorkProcess.SetGridText(    event_row, G2_COLOR_CODE, value );
        }
    }
}

//==================================================================================
function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_FEE_RATE)
    {
        var dQuantiy ;
        
        dQuantiy =  grdProcess.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdProcess.SetGridText( row, col, System.Round( dQuantiy,2));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdProcess.SetGridText( row, col, "");
            }
        }
        else
        {
            grdProcess.SetGridText(row,col,"") ;
        }
    }
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00070" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fpib00070" procedure="<%=l_user%>lg_upd_fpib00070"> 
			    <input bind="grdProcess" > 
			        <input bind="txtProcess" />			
			    </input> 
			    <output bind="grdProcess" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00070_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_fpib00070_1" procedure="<%=l_user%>lg_upd_fpib00070_1"  > 
			    <input bind="grdWorkProcess" > 
			        <input bind="txtProcessPK" />			
			    </input> 
			    <output bind="grdWorkProcess" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00070_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="<%=l_user%>lg_sel_fpib00070_2" > 
			    <input bind="grdSTItem" > 
			         <input bind="lstGroup" />	
			         <input bind="txtItem" />	
			         <input bind="chkMap" />		
			    </input> 
			    <output bind="grdSTItem" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00070_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fpib00070_3"  procedure="<%=l_user%>lg_upd_fpib00070_3"  > 
			    <input bind="grdMapping" > 
			        <input bind="txtSTItemPK" />			
			    </input> 
			    <output bind="grdMapping" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <!-- <gw:tab id="idTab" onpageactivate=""> -->
    <gw:tab id="idTab" onpageactivate="">
    <table name="Process" class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtProcess" text="" styles="width:100%" onenterkey="OnSearch('grdProcess')" />
                        </td>
                        <td style="width: 55%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdProcess')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnReportClick()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdProcess')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDlete1" img="delete" alt="Delete" onclick="OnDelete(grdProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnUnDelete1" img="udelete" alt="UnDelete" onclick="OnUnDelete(grdProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSave1" img="save" alt="Save" onclick="OnSave('grdProcess')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Seq|Process ID|Process Name|USE|Process Type|Fee Rate|W/H|Remark'
                    format='0|0|0|0|3|0|1|0|0' aligns='0|1|0|0|0|0|0|0|0' defaults='||||||||' editcol='0|1|1|1|1|1|1|1|1'
                    widths='1000|800|2000|3000|800|2000|1200|2000|1000' sorting='T' styles='width:100%; height:100%'
                    oncellclick="OnSearch('grdWorkProcess')" onafteredit="CheckInput()"/>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 85%" align="left">
                            Work Process
                        </td>                        
                         <td style="width: 10%; white-space: nowrap">
                           <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('WP_type')"><u>W/P Type</u></b>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdWorkProcess')" />
                        </td>                        
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNew2" img="new" alt="New" onclick="OnAddNew('grdWorkProcess')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDlete2" img="delete" alt="Delete" onclick="OnDelete(grdWorkProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnUnDelete2" img="udelete" alt="UnDelete" onclick="OnUnDelete(grdWorkProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdWorkProcess')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdWorkProcess' 
					header='_PK|_PB_PROCESS_PK|Seq|W/P ID|W/P Name|USE|W/I|W/P Type|Finish Prod|_In_Comp_PK|In Comp Name|_Out_Comp_PK|Out Comp Name|RGB|_Color_code|Remark'
                    format='0|0|0|0|0|3|3|0|3|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					defaults='|||||||||||' 
					editcol='0|0|1|1|1|0|0|0|0|0|0|1'
                    widths='1000|1000|800|2000|3000|800|800|1500|1500|0|1500|0|1500|800|0|1000' 
					oncelldblclick='OnCellDbClick()' 
					sorting='T' 
					styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <table name="ST Item Process" class="table" style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Group</td>
                        <td style="width: 90%">
                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('grdSTItem')"></gw:list>
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search for process List" onclick="OnSearch('grdSTItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Style</td>
                        <td style="width: 90%">
                            <gw:textbox id="txtItem" styles="width:100%" csstype="mandatory" onenterkey="OnSearch('grdSTItem')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Map
                            <gw:checkbox id="chkMap" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSTItem')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3" style="width: 100%;">
                            <gw:grid id='grdSTItem' header='_PK|Style Code|Style Name' format='0|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='1000|2000|3000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdMapping')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 96%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew3" img="new" alt="New" onclick="OnAddNew('grdMapping')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idDelete3" img="delete" alt="Remove" text="Delete" onclick="OnDelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idUDelete3" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idBtnUpdate3" img="save" alt="Save" text="Save" onclick="OnSave('grdMapping')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id='grdMapping' header='_PK|_TCO_STITEM_PK|Seq|_PB_PROCESS_PK|Process ID|Process Name|Process Type|Description'
                                format='0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0' defaults='||||||||' editcol='0|0|1|0|0|0|0|1'
                                widths='1000|1000|800|1000|2000|3000|2000|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </gw:tab>
    <!-- </gw:tab> -->
    <!----------------------------------------------------------->
    <gw:textbox id="txtProcessPK" text="" styles="display:none" />
    <gw:textbox id="txtSTItemPK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
