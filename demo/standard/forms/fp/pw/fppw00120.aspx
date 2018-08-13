<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Non Working Time</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript"> 

var G1_LINE_GRP_PK 	= 0,     
    G1_SEQ          = 1,
    G1_GRP_ID     	= 2,
    G1_GRP_NAME   	= 3;

var G2_LINE_PK         = 0,
    G2_LINE_GRP_PK     = 1,
    G2_SEQ             = 2,
    G2_LINE_ID         = 3,
    G2_LINE_NAME       = 4;    
     
var G3_PK             	= 0,
    G3_LINE_GRP_PK    	= 1,
    G3_LINE_PK 		  	= 2,
    G3_FR_DT	      	= 3,  
	G3_FR_TIME        	= 4,
	G3_TO_DT	      	= 5,  
	G3_TO_TIME       	= 6, 
	G3_NONE_TIME		= 7,  
	G3_NONE_TYPE		= 8,
    G3_CHARGER_PK     	= 9,
    G3_CHARGER_ID      	= 10,  
    G3_CHARGER_NAME    	= 11,    
    G3_REMARK         	= 12,
	G3_GROUP_ID			= 13,
	G3_LINE_ID  		= 14; 
          
var arr_FormatNumber = new Array();
//====================================================================================
function BodyInit()
{
    System.Translate(document);
 
    FormatGrid(); 
    //-----------     
   
}
//====================================================================================
function FormatGrid()
{
    var  data ;
 
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>|ALL|Select ALL";
    lstFactory.SetDataText( data);
    lstFactory.value = 'ALL' ;    

    txtLineID.SetReadOnly(true);
    txtLineNAME.SetReadOnly(true);
    
    txtLineGroupID.SetReadOnly(true);
    txtLineGroupNAME.SetReadOnly(true);
    
    data1 = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0301' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";             
    grdNoneWork.SetComboFormat(G3_NONE_TYPE,data1); 
	
    var ctrl = grdNoneWork.GetGridControl();
    ctrl.ColFormat(G3_NONE_TIME) = "###,###,###,###.##";
	 
    ctrl.ColEditMask(G3_FR_TIME) = "99:99";
    ctrl.ColEditMask(G3_TO_TIME) = "99:99";  
	
	arr_FormatNumber[G3_NONE_TIME] = 2;
	 	  
}
 
 //==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/pw/rpt_fppw00110.aspx?p_pb_line_group_pk=' + txtLineGroupPK.text ;
	window.open(url, "_blank"); 
}
//====================================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdLineGroup':
            data_fppw00110.Call("SELECT");
        break;
        
        case 'grdLine':
            if ( grdLineGroup.row > 0 )
            {
                txtLineGroupPK.text   = grdLineGroup.GetGridData( grdLineGroup.row, G1_LINE_GRP_PK );
                txtLineGroupID.text   = grdLineGroup.GetGridData( grdLineGroup.row, G1_GRP_ID );
                txtLineGroupNAME.text = grdLineGroup.GetGridData( grdLineGroup.row, G1_GRP_NAME );
            }
            else
            {
                txtLineGroupPK.text = '' ;
                txtLineGroupID.text = '' ;
                txtLineGroupNAME.text = '' ;
            }
            
            data_fppw00110_1.Call("SELECT");
        break;
               
        case 'grdNoneWork' :
            
		        if ( grdLine.row > 0 )
		        {
			        txtLinePK.text   = grdLine.GetGridData( grdLine.row, G2_LINE_PK );
			        txtLineID.text   = grdLine.GetGridData( grdLine.row, G2_LINE_ID );
			        txtLineNAME.text = grdLine.GetGridData( grdLine.row, G2_LINE_NAME );    			    			      
			    }
			    else
			    {
			        txtLinePK.text    = '' ;
			        txtLineID.text    = '' ;
			        txtLineNAME.text    = '' ;
 			    }	

				data_fppw00110_3.Call('SELECT');	
	        break;              
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
	
        case 'NONE_WORK':
			     				
	        grdNoneWork.AddRow();
    		
			if ( grdLine.row > 0 )
			{	
				grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_PK, grdLine.GetGridData( grdLine.row, G2_LINE_PK) );
				grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_ID, grdLine.GetGridData( grdLine.row, G2_LINE_ID) );
			}	
	        
			if ( grdLineGroup.row > 0 )
			{	
				grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_GRP_PK, grdLineGroup.GetGridData( grdLineGroup.row, G1_LINE_GRP_PK) );
				grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_GROUP_ID,    grdLineGroup.GetGridData( grdLineGroup.row, G1_GRP_ID     ) );
			}
            	         	
        break;		
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdNoneWork' :
            data_fppw00110_3.Call();
        break; 
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fppw00110' :
            OnSearch('grdLine');
        break;
        
        case 'data_fppw00110_1' :
            OnSearch('grdNoneWork');
                      
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
 
//========================================================================
 
 function CheckInput(obj)
 {   
    switch(obj.id)
    {         
        case 'grdNoneWork':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G3_NONE_TIME )
            {
                var dQuantiy;
                
                dQuantiy =  grdNoneWork.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdNoneWork.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ) );
												 	 
                    }
                    else
                    {                         
                        grdNoneWork.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdNoneWork.SetGridText(row,col,"")
                }         
            }           
            //------------------------------------------
            if ( col == G3_FR_TIME || col == G3_TO_TIME )
	        {
		        tmpIN = grdNoneWork.GetGridData(event.row,col)
        		
		        if ( tmpIN.length == 0 )
		        {
			        grdNoneWork.SetGridText(row, col, "")
        			
		        }
		        if( ( tmpIN.length !=4 ) && ( tmpIN.length !=0 ) )
		        {
			        alert("Input In time is not correct type.(type: hh:mm)\nKiá»ƒu giá»?in nháº­p khÃ´ng Ä‘Ãºng")
			        grdNoneWork.SetGridText(row,col,'')
			        return;
		        }
		        if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		        {
			        alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiá»ƒu giá»?in pháº£i >=00 vÃ  <=23")
			        grdNoneWork.SetGridText(row,col,'')
			        return;
		        }
		        if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		        {
			        alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiá»ƒu phÃºt pháº£i >=00 vÃ  <=59")
			        grdNoneWork.SetGridText(row,col,'')
			        return;
		        }
		        if(tmpIN.length>0)
		        {
		            tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		            grdNoneWork.SetGridText(row,col,tmpIN)
		        }    
	        }                            
        break;
    }
 }
 
//========================================================================

function OnCellDoubleClick(obj)
{
	switch(obj.id)
	{
		case 'grdNoneWork':
			if ( ( event.col == G3_CHARGER_ID || event.col == G3_CHARGER_NAME ) && event.row > 0 )
			{
					var event_col = event.col ;
                    var event_row = event.row ;
                      
                    var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                if ( obj != null )
	                {
                        grdNoneWork.SetGridText( event_row, G3_CHARGER_PK,   obj[0] ); //emp_pk
                        grdNoneWork.SetGridText( event_row, G3_CHARGER_ID,   obj[1] ); //emp_id
                        grdNoneWork.SetGridText( event_row, G3_CHARGER_NAME, obj[2] ); //emp_name           	                          
                    }	       			
			}
		break;
	}	
}

//========================================================================

</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fppw00110" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_SEL_fppw00110" parameter="0,1,2,3,4,5,6,7"> 
                <input bind="grdLineGroup" >
                    <input bind="lstFactory" /> 
                </input> 
                <output bind="grdLineGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fppw00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="<%=l_user%>lg_SEL_fppw00110_1" > 
                <input bind="grdLine" >
                    <input bind="txtLineGroupPK" /> 
                </input> 
                <output bind="grdLine" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00110_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="<%=l_user%>lg_sel_fppw00110_3"  procedure="<%=l_user%>lg_upd_fppw00110_3"  > 
			    <input bind="grdNoneWork" > 
					<input bind="txtLineGroupPK" /> 
			        <input bind="txtLinePK" />			        		        					       
			    </input> 
			    <output bind="grdNoneWork" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 30%">
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
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdLineGroup')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdLineGroup' header='_PK|Seq|Line Group ID|Line Group Name'
                                format='0|0|0|0' aligns='0|1|0|0' defaults='|||' editcol='0|0|0|0'
                                widths='1000|800|1500|2000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdLine')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="center">
                            Group
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:textbox id="txtLineGroupID" text="" styles="width:30%" />                        
                            <gw:textbox id="txtLineGroupNAME" text="" styles="width:70%"  />
                        </td>                                              
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdLine')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">
                            <gw:grid id='grdLine' header="_PK|_LineGroupPK|Seq|Line ID|Line Name"
                                format='0|0|0|0|0' 
								aligns='0|0|1|0|0'
                                defaults='||||' 
								editcol='0|0|0|0|0'
                                widths='0|0|800|1500|2500'
                                sorting='T' styles='width:100%; height:100%' 
                                onclick="OnSearch('grdNoneWork')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="center">
                            Line
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:textbox id="txtLineID" text=""  styles="width:30%" />                        
                            <gw:textbox id="txtLineNAME" text=""  styles="width:70%" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdNoneWork')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('NONE_WORK')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdNoneWork')" />
                        </td>                        
                        <td style="width: 2%">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport()" />
                        </td>                      
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">                             
							<gw:grid id='grdNoneWork'
								header='_PK|_GRP_PK|_LINE_PK|From Date|Time|To Date|To Time|None Time|None Type|_EMP_PK|Emp ID|Emp Name|Remark|Group ID|Line ID'
								format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								aligns='0|0|0|1|1|1|1|3|0|0|0|0|0|0|0'
								check='||||||||||||||'
								editcol='0|0|0|1|1|1|1|1|1|0|0|0|1|0|0'
								widths='0|0|0|1200|800|1200|800|1000|1200|0|1200|1500|1000|1000|1000'
								sorting='T'								 
								styles='width:100%; height:100%' onafteredit="CheckInput(this)" 
								oncelldblclick="OnCellDoubleClick(this)"
							/>
	
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
