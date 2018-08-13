<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script> 

var G1_LineGroup_PK = 0,
    G1_Factory      = 1,
    G1_Seq          = 2,
    G1_Group_ID     = 3,
    G1_Group_Name   = 4,
	G1_PROCESS_PK	= 5,
    G1_Work_Group   = 6,
    G1_REMARK       = 7;

var G2_LinePK          = 0,
    G2_LineGroupPK     = 1,
    G2_Seq             = 2,
    G2_Line_ID         = 3,
    G2_Line_Name       = 4,
    G2_Line_Type       = 5,
    G2_USE             = 6,
    G2_COST_CENTER     = 7,
    G2_Machine_Qty     = 8,
    G2_Capa            = 9,
    G2_Day_Run_Qty     = 10,
    G2_Night_Run_Qty   = 11,
    G2_MonitorGroup    = 12,    
    G2_RoutingGroup    = 13,   
    G2_BusPartnerPK    = 14,
    G2_Bus_Partner     = 15,
    G2_In_Ware_House   = 16,
    G2_Out_Ware_House  = 17,
	G2_NextLinePK	   = 18,	
	G2_ATT01		   = 19,		
	G2_ATT02		   = 20,
	G2_ATT03           = 21,
	G2_ATT04           = 22,
	G2_ATT05           = 23,
    G2_REMARK          = 24;    
    
var G4_RP_PK        = 0,
    G4_SEQ          = 1,
    G4_LINE_PK      = 2,
    G4_POINT_ID     = 3,
    G4_POINT_NAME   = 4,
    G4_USE_YN       = 5,
    G4_QC_YN        = 6,
    G4_WP_PK        = 7,
    G4_WPROCESS     = 8;    
    
var G5_LOP_PK       = 0,
    G5_SEQ          = 1,
    G5_OP_SEQ       = 2,
    G5_LINE_PK      = 3,
    G5_OP_ID        = 4,
    G5_OP_NAME      = 5,
    G5_POINT_ID     = 6,
    G5_USE_YN       = 7; 

var G6_PK               = 0,         
    G6_TLG_PB_LINE_PK   = 1,
    G6_TLG_IT_STITEM_PK = 2,
    G6_ITEM_NAME        = 3,
    G6_THR_WORK_SHIFT   = 4,
    G6_CAPA_QTY         = 5,
    G6_DESCRIPTION      = 6;

var t_open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    FormatGrid(); 
    //-----------     
    OnChangeTab('radPoint'); 
    
    OnToggle(); 
}
//====================================================================================
function BindingDataList()
{
    var  data ;

    data ="#1;1|#2;2|#3;3|#4;4|#5;5|#6;6|#;"
    grdLine.SetComboFormat( G2_MonitorGroup, data );
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select pk, WH_ID || ' * ' || WH_NAME from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by WH_ID")%>|#;";
    grdLine.SetComboFormat(G2_In_Ware_House , data );     
    grdLine.SetComboFormat(G2_Out_Ware_House , data ); 
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT   code, (code || ' * ' || code_nm) code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0342' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord")%>|#;";
    grdLine.SetComboFormat(G2_Line_Type, data );     
	
	data = "<%=ESysLib.SetGridColumnDataSQL("select pk, line_id || ' * ' || line_name from tlg_pb_line where del_if = 0 order by line_id")%>|#;";
    grdLine.SetComboFormat(G2_NextLinePK , data );            
        
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>|ALL|Select ALL";
    lstFactory.SetDataText( data);
    lstFactory.value = 'ALL' ;

    data = "<%=ESysLib.SetGridColumnDataSQL("select null pk,' ' factory_name from dual union select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME" ) %> ";       
    grdLineGroup.SetComboFormat( G1_Factory, data );

	data = "<%=ESysLib.SetGridColumnDataSQL("select null pk,' ' process_name from dual union select pk, process_id || ' * ' || process_name from tlg_pb_process where del_if = 0 and use_yn='Y' order by 2" ) %>|#;";       
    grdLineGroup.SetComboFormat( G1_PROCESS_PK, data );
     
    data ="<%=ESysLib.SetGridColumnDataSQL("select pk, CENTER_ID || ' * '|| CENTER_NAME from TLG_CO_COST_CENTER a where  del_if=0 order by CENTER_ID" ) %>|#;";       
    grdLine.SetComboFormat( G2_COST_CENTER, data); 
             
    data = "<%=ESysLib.SetGridColumnDataSQL("  SELECT code, code_nm FROM tlg_lg_code a, tlg_lg_code_group b  WHERE     a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0309' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, 1" )%>|#;";   
    grdLine.SetComboFormat( G2_RoutingGroup, data);      
}
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top"); 
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        t_open = false;
        top.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up.gif";
    }
    else
    {
        t_open = true;
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
 }
//====================================================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdLine.GetGridControl();
      	
      trl.ColFormat(G2_Capa)          = "###,###,###,###,###";
      trl.ColFormat(G2_Machine_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G2_Day_Run_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G2_Night_Run_Qty) = "###,###,###,###,###";
 }
 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdLineGroup':
            data_fpib00020.Call("SELECT");
        break;
        
        case 'grdLine':
            if ( grdLineGroup.row > 0 )
            {
                txtLineGroupPK.text = grdLineGroup.GetGridData( grdLineGroup.row, G1_LineGroup_PK );
            }
            else
            {
                txtLineGroupPK.text = '' ;
            }
            
            data_fpib00020_1.Call("SELECT");
        break;
               
        case 'grdResultPoint' :
            if(t_open == true)
            {
		        if ( grdLine.row > 0 )
		        {
			        txtLinePK.text = grdLine.GetGridData( grdLine.row, G2_LinePK );
    			    
			        data_fpib00020_3.Call('SELECT');
			    }
			    else
			    {
			        txtLinePK.text    = '' ;
 			    }									
	        break;    
	        }
	        else
	        {
	            return false;
	        }            
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'grdLineGroup' :
            grdLineGroup.AddRow();
              
            if ( lstFactory.GetData() != 'ALL')   
            {
                grdLineGroup.SetGridText( grdLineGroup.rows-1, G1_Factory, lstFactory.GetData() );
            }
                    
            grdLineGroup.SetCellBgColor( grdLineGroup.rows-1, 0, grdLineGroup.rows-1, grdLineGroup.cols-1, 0xCCFFFF );                      
              
            grdLineGroup.GetGridControl().TopRow = grdLineGroup.rows -1;            
        break;
        
        case 'grdLine' :
            if ( txtLineGroupPK.text == '' )
            {                
                alert('Pls select saved Line Group !');
                return;
            }
            
            grdLine.AddRow();
            grdLine.SetGridText( grdLine.rows-1, G2_Seq, grdLine.rows-1 );
            
            grdLine.SetGridText( grdLine.rows-1, G2_LineGroupPK, txtLineGroupPK.text );

            grdLine.SetCellBgColor( grdLine.rows-1, 0, grdLine.rows-1, grdLine.cols-1, 0xCCFFFF );                      
              
            grdLine.GetGridControl().TopRow = grdLine.rows -1;                           
        break;
                
        case 'grdResultPoint' :
            if ( txtLinePK.text != '' )
            {
                grdResultPoint.AddRow();
                
                grdResultPoint.SetGridText( grdResultPoint.rows-1, G4_LINE_PK, txtLinePK.text );
            }
            else
            {
                alert('Pls select one Line.');
            }    
        break;      
        
        case 'grdLineOP' :
            if ( txtLinePK.text != '' )
            {
                grdLineOP.AddRow();
                
                grdLineOP.SetGridText( grdLineOP.rows-1, G5_LINE_PK, txtLinePK.text );
            }
            else
            {
                alert('Pls select one Line.');
            }    
        break;    
        
        case 'grdLineCP' :
            if ( txtLinePK.text != '' )
            {
                grdLineCP.AddRow();
                
                grdLineCP.SetGridText( grdLineCP.rows-1, G6_TLG_PB_LINE_PK, txtLinePK.text );
            }
            else
            {
                alert('Pls select one Line.');
            }    
        break;                  
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdLineGroup' :
            data_fpib00020.Call();
        break;
        
        case 'grdLine' :       
            data_fpib00020_1.Call();
        break;  
               
        case 'grdResultPoint' :
            data_fpib00020_3.Call();
        break; 
        
        case 'grdLineOP' :
            data_fpib00020_4.Call();
        break;      
        
        case 'grdLineCP' :
            data_fpib00020_5.Call();
        break;                               
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpib00020' :
            OnSearch('grdLine');
        break;
        
        case 'data_fpib00020_1' :
            grdResultPoint.ClearData();
            grdLineOP.ClearData();
                      
        break;  
        
        case 'data_fpib00020_3' :
            data_fpib00020_4.Call("SELECT");
        break;    
        
        case 'data_fpib00020_4':  
                if ( grdResultPoint.rows > 0 )
                {
                    var strPK = "";
                    for(var i = 1; i < grdResultPoint.rows; i++)
                    {
                        strPK += grdResultPoint.GetGridData( i, G4_RP_PK) + ","                   
                    }  
                    txtArraySOPK.text = strPK + null;
                    pro_fpib00020.Call();
                }        
                data_fpib00020_5.Call('SELECT');
        break;  
        
        case 'pro_fpib00020':    
                grdLineOP.SetComboFormat( G5_POINT_ID, txtReturnValue.text);
        break;
    }    
}
//====================================================================================

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

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}
//====================================================================================
 function CheckInput(obj)
 { 
    switch (obj.id)
    {
        case "grdLine":
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            

            if ( col == G2_Capa || col == G2_Machine_Qty || col == G2_Day_Run_Qty || col == G2_Night_Run_Qty)
            {
                var dQuantiy
                
                dQuantiy =  grdLine.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {        
                        grdLine.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));    
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdLine.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdLine.SetGridText(row,col,"")
                }
            }
        break;
    }       
}  
//====================================================================================
  
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'Partner' :
            var col = event.col
            var row = event.row
            
            if( col == G2_Bus_Partner )
            {
                var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                
                if ( object != null )
                {
                    grdLine.SetGridText( row, G2_BusPartnerPK, object[0] );
                    grdLine.SetGridText( row, G2_Bus_Partner,  object[2] );        
                }
            }        
        break;
        
        case 'WProcess' :
            var col = event.col
            var row = event.row
            
            if( col == G4_WPROCESS )
            {
                var path = System.RootURL + "/form/fp/ab/fpab00430.aspx";
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                
                if ( object != null )
                {
                    grdResultPoint.SetGridText( row, G4_WP_PK,    object[0] );
                    grdResultPoint.SetGridText( row, G4_WPROCESS, object[4] );        
                }
            }          
        break;
        
        case 'CostCenter' :
            var col = event.col
            var row = event.row

                var path = System.RootURL + "/form/bi/co/bico00040.aspx";
                var object = System.OpenModal( path , 900 , 500 ,  'resizable:yes;status:yes');                
        break;   
		
		case 'RoutingGroup':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0309";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		break;
		
		case 'Linetype':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0342";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		break;

        case 'StItem':
            var col = event.col
            var row = event.row
            
            if( col == G6_ITEM_NAME )
            {
                var path = System.RootURL + "/form/fp/ab/fpab00080.aspx?group_type=Y||Y|||";
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                
                if ( object != null )
                {
                    grdLineCP.SetGridText( row, G6_TLG_IT_STITEM_PK , object[0] );
                    grdLineCP.SetGridText( row, G6_ITEM_NAME        , object[2] );        
                }
            }  
        break;
    }        
}

//====================================================================================
 function OnChangeTab(pos)
 {
    switch(pos)
    {               
        case 'radPoint':
            var strRad = radPoint.GetData();
                     
	        switch (strRad)
	        {
		        case 'RP':        		    
		            tab_Result_Point.style.color = "cc0000"; 
                    tab_Line_Capacity.style.color= "";
		            tab_Line_OP.style.color      = "";
        		    
		            btnAddNew3.style.display   = "";	
		            btnDelete3.style.display   = "";
		            btnUndelete3.style.display = "";	
		            btnSave3.style.display     = ""; 
        		      
		            btnAddNew4.style.display   = "none";	
		            btnDelete4.style.display   = "none";
		            btnUndelete4.style.display = "none";	
		            btnSave4.style.display     = "none"; 			    	   		    
		        
		            btnAddNew5.style.display   = "none";	
		            btnDelete5.style.display   = "none";   
		            btnUndelete5.style.display = "none";	
		            btnSave5.style.display     = "none";

		            grdResultPoint.style.display = "";
		            grdLineOP.style.display      = "none";
                    grdLineCP.style.display      = "none";
                break;
                
                case 'OP':        		    
		            tab_Result_Point.style.color = ""; 
		            tab_Line_OP.style.color      = "cc0000";
                    tab_Line_Capacity.style.color= "";
	
		            btnAddNew3.style.display   = "none";	
		            btnDelete3.style.display   = "none";
		            btnUndelete3.style.display = "none";	
		            btnSave3.style.display     = "none"; 
        		      
		            btnAddNew4.style.display   = "";	
		            btnDelete4.style.display   = "";
		            btnUndelete4.style.display = "";	
		            btnSave4.style.display     = ""; 	
		            
		            btnAddNew5.style.display   = "none";	
		            btnDelete5.style.display   = "none";
		            btnUndelete5.style.display = "none";	
		            btnSave5.style.display     = "none";

		            grdResultPoint.style.display = "none";
		            grdLineOP.style.display      = "";
                    grdLineCP.style.display      = "none";
		        break;	

                case 'CP':        		  
		            tab_Result_Point.style.color = ""; 
		            tab_Line_OP.style.color      = "";	
        		    tab_Line_Capacity.style.color= "cc0000";

		            btnAddNew3.style.display   = "none";	
		            btnDelete3.style.display   = "none";
		            btnUndelete3.style.display = "none";	
		            btnSave3.style.display     = "none"; 
        		      
		            btnAddNew4.style.display   = "none";	
		            btnDelete4.style.display   = "none";
		            btnUndelete4.style.display = "none";	
		            btnSave4.style.display     = "none"; 	
		            
		            btnAddNew5.style.display   = "";	
		            btnDelete5.style.display   = "";
		            btnUndelete5.style.display = "";	
		            btnSave5.style.display     = ""; 

		            grdResultPoint.style.display = "none";
		            grdLineOP.style.display      = "none";
                    grdLineCP.style.display      = "";
		        break;
            }
        break;
    }
 }
 //=================================================================
function OnReportClick()
{
    var array_line_group_pk = "" ;
    var t_link = "";
    
        for ( var i = 1; i < grdLineGroup.rows ; i++ )
        {
            if ( grdLineGroup.GetGridControl().isSelected(i) == true )
            {
                array_line_group_pk = array_line_group_pk + t_link + grdLineGroup.GetGridData( i, G1_LineGroup_PK);
                t_link = ',' ;
            }       
        }   
        
        var url =System.RootURL + '/reports/fp/ib/rpt_fpib00020.aspx?array_line_group_pk=' + array_line_group_pk ;
        window.open(url);         
}
 //=================================================================

</script>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpib00020" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_SEL_fpib00020" parameter="0,1,2,3,4,5,6,7" procedure="<%=l_user%>lg_UPD_fpib00020"> 
                <input bind="grdLineGroup" >
                    <input bind="lstFactory" /> 
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpib00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" function="<%=l_user%>lg_SEL_fpib00020_1"  procedure="<%=l_user%>lg_UPD_fpib00020_1"> 
                <input bind="grdLine" >
                    <input bind="txtLineGroupPK" /> 
                </input> 
                <output bind="grdLine" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00020_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fpib00020_3"  procedure="<%=l_user%>lg_upd_fpib00020_3"  > 
			    <input bind="grdResultPoint" > 
			        <input bind="txtLinePK" />			        		
			    </input> 
			    <output bind="grdResultPoint" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00020_4" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fpib00020_4"  procedure="<%=l_user%>lg_upd_fpib00020_4"  > 
			    <input bind="grdLineOP" > 
			        <input bind="txtLinePK" />			        		
			    </input> 
			    <output bind="grdLineOP" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00020_5" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fpib00020_5"  procedure="<%=l_user%>lg_upd_fpib00020_5"  > 
			    <input bind="grdLineOP" > 
			        <input bind="txtLinePK" />			        		
			    </input> 
			    <output bind="grdLineCP" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpib00020" > 
                <input>
                    <input bind="txtArraySOPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" /></output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Factory
                        </td>
                        <td style="width: 80%">
                            <gw:list id="lstFactory" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnReportClick()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdLineGroup')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('grdLineGroup')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" onclick="OnDelete(grdLineGroup)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete2" img="udelete" alt="Undelete" onclick="OnUndelete(grdLineGroup)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdLineGroup')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdLineGroup' header='_PK|Factory|Seq|Line Group ID|Line Group Name|Process|Work Group|Remark'
                                format='0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0' defaults='|||||||' editcol='0|1|1|1|1|1|1|1'
                                widths='1000|1500|800|1500|2000|2000|2000|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdLine')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand"
                                onclick="OnToggle()" />
                        </td>
                        <td style="width: 90%" align="center">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            <b style="color: purple; cursor: hand" onclick="OnPopUp('Linetype')">Line Type</b>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('RoutingGroup')">Routing Group</b>
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCodeCenter" img="2" text="Cost Center" onclick="OnPopUp('CostCenter')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdLine')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('grdLine')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdLine)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndelete(grdLine)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdLine')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="10" id="t_Line">
                            <gw:grid id='grdLine' header="_PK|_LineGroupPK|Seq|Line ID|Line Name|Line Type|USE|Cost Center|Machine Qty|Capa Qty|Day Run|Night Run|Monitor Group|Routing Group|_tco_buspart_pk|Bus Partner|In W/H|Out W/H|Next Line|Att01|Att02|Att03|Att04|Att05|Remark"
                                format='0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|2|3|3|3|3|0|0|0|2|2|2|0|0|0|0|0|0|0'
                                defaults='||||||||||||||||||||||||' editcol='0|0|1|1|1|1|1|1|1|1|1|1|1|0|1|0|1|1|1|1|1|1|1|1|1'
                                widths='0|0|800|1500|2500|2000|800|1200|1200|1200|1200|1500|1500|1500|2000|1800|1800|1800|1500|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" oncelldblclick="OnPopUp('Partner')"
                                onclick="OnSearch('grdResultPoint')" />
                        </td>
                    </tr>
                    <tr style="height: 50%" id="top">
                        <td style="width: 100%; height: 100%" colspan="10">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 95%">
                                        <gw:radio id="radPoint" value="RP" styles="width:100%" onchange="OnChangeTab('radPoint')"> 
                                            <span value="RP" id="tab_Result_Point"   >Result Point</span> 
                                            <span value="OP" id="tab_Line_OP">Line O/P</span> 
                                            <span value="CP" id="tab_Line_Capacity">Line Capacity</span> 
                                        </gw:radio>
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnAddNew3" img="new" alt="Add new" onclick="OnAddNew('grdResultPoint')" />
                                        <gw:imgbtn id="btnAddNew4" img="new" alt="Add new" onclick="OnAddNew('grdLineOP')" />
                                        <gw:imgbtn id="btnAddNew5" img="new" alt="Add new" onclick="OnAddNew('grdLineCP')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete3" img="delete" alt="Delete" onclick="OnDelete(grdResultPoint)" />
                                        <gw:imgbtn id="btnDelete4" img="delete" alt="Delete" onclick="OnDelete(grdLineOP)" />
                                        <gw:imgbtn id="btnDelete5" img="delete" alt="Delete" onclick="OnDelete(grdLineCP)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUndelete3" img="udelete" alt="Undelete" onclick="OnUndelete(grdResultPoint)" />
                                        <gw:imgbtn id="btnUndelete4" img="udelete" alt="Undelete" onclick="OnUndelete(grdLineOP)" />
                                        <gw:imgbtn id="btnUndelete5" img="udelete" alt="Undelete" onclick="OnUndelete(grdLineCP)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave3" img="save" alt="Save" onclick="OnSave('grdResultPoint')" />
                                        <gw:imgbtn id="btnSave4" img="save" alt="Save" onclick="OnSave('grdLineOP')" />
                                        <gw:imgbtn id="btnSave5" img="save" alt="Save" onclick="OnSave('grdLineCP')" />
                                    </td>
                                </tr>
                                <tr style="height: 100%">
                                    <td colspan="6">
                                        <gw:grid id='grdResultPoint' header='_PK|Seq|_PB_LINE_PK|Point ID|Point Name|Use|QC|_WP_PK|W/Process'
                                            format='0|0|0|0|0|3|3|0|0' aligns='0|1|0|0|0|0|0|0|0' editcol='0|1|0|1|1|0|0|0|0'
                                            widths='0|800|0|1500|2000|1000|1000|0|1000' sorting='T' styles='width:100%; height:100%'
                                            oncelldblclick="OnPopUp('WProcess')" />
                                        <gw:grid id='grdLineOP' header='_PK|Seq|O/P Seq|_PB_LINE_PK|O/P ID|O/P Name|Point ID|Use'
                                            format='0|0|0|0|0|0|0|3' aligns='0|1|1|0|0|0|0|0' editcol='0|1|1|0|1|1|1|0' widths='0|800|800|0|1500|2000|1500|1000'
                                            sorting='T' styles='width:100%; height:100%' />
                                        <gw:grid id='grdLineCP' header='_PK|_TLG_PB_LINE_PK|_TLG_IT_STITEM_PK|Item Name|_THR_WORK_SHIFT|Capa Qty|Description'
                                            format='0|0|0|0|0|1|0' aligns='0|0|0|0|0|0|0' check='||||||' editcol='1|1|1|1|1|1|1'
                                            widths='0|0|0|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%'
                                            oncelldblclick="OnPopUp('StItem')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
