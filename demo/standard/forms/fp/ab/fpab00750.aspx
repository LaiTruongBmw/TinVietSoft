<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Non Working Time</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript"> 
       
var G3_PK             	= 0,
    G3_LINE_GRP_PK    	= 1,
    G3_LINE_PK 		  	= 2,
	G3_LINE_ID			= 3,
	G3_LINE_NAME  		= 4	
    G3_FR_DT	      	= 5,  
	G3_FR_TIME        	= 6,
	G3_TO_DT	      	= 7,  
	G3_TO_TIME       	= 8, 
	G3_NONE_TIME		= 9,  
	G3_NONE_TYPE		= 10,
    G3_CHARGER_PK     	= 11,
    G3_CHARGER_ID      	= 12,  
    G3_CHARGER_NAME    	= 13,    
    G3_REMARK         	= 14; 
          
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
	var p_line_group_pk = "<%=Request.querystring("line_group_pk")%>";
	var p_line_pk       = "<%=Request.querystring("line_pk")%>";
	
	txtEmpPK.text 	= "<%=Request.querystring("emp_pk")%>";
	txtEmpID.text   = "<%=Request.querystring("emp_id")%>";
	txtEmpName.text = "<%=Request.querystring("emp_name")%>";
	
    var  data ;  

	data = "<%=CtlLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' * ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0  ORDER BY 2 ") %>||" ;    
	lstLGroup.SetDataText(data); 
	lstLGroup.value = '' ;
	
	if ( Number(p_line_group_pk) > 0 )	
	{
		lstLGroup.value = Number(p_line_group_pk);
	}
	
	data = "<%=CtlLib.SetListDataSQL("SELECT DISTINCT a.pk, a.LINE_ID || ' * ' || a.line_name  FROM tlg_pb_line a WHERE a.del_if = 0 and a.use_yn='Y'  ORDER BY 2 ") %>||" ;    
	lstLine.SetDataText(data); 
	lstLine.value = '' ;	
	
	if ( Number(p_line_pk) > 0 )	
	{
		lstLine.value = Number(p_line_pk);
	}
	
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0301' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";             
    grdNoneWork.SetComboFormat(G3_NONE_TYPE,data); 
	
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
        case 'grdNoneWork' :            		         
				data_fpab00750_3.Call('SELECT');	
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
    		
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_GRP_PK, lstLGroup.value ); 
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_PK, 	 lstLine.value   ); 
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_NAME,   lstLine.GetText() );
			
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_NAME, txtEmpPK.text  );
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_NAME, txtEmpID.text  );
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_NAME, txtEmpName.text );
						        
        break;		
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdNoneWork' :
            data_fpab00750_3.Call();
        break; 
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'pro_fpab00750_line' :
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

//==============================================================================
    function OnProcess(pos)	
    {
		switch(pos)
		{
			case 'Line':
				pro_fpab00750_line.Call();
			break;
		}				
    }     	
	
//========================================================================

</script>

<body>     
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpab00750_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_fpab00750_line" > 
                <input>
                    <input bind="lstLGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00750_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="st_lg_sel_fpab00750_3"  procedure="st_lg_upd_fpab00750_3"  > 
			    <input bind="grdNoneWork" > 
					<input bind="lstLGroup" /> 
			        <input bind="lstLine" />			        		        					       
			    </input> 
			    <output bind="grdNoneWork" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!-------------------------------------------------------------------> 
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Line
                        </td>
                        <td style="width: 30%" align="right">
                            <gw:list id="lstLGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>                         
                        <td style="width: 45%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('grdNoneWork')" />
                        </td>
						<td style="width: 15%" >
						</td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdNoneWork')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('NONE_WORK')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUndelete" img="Undelete" alt="Undelete" onclick="OnUnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave('grdNoneWork')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">                             
							<gw:grid id='grdNoneWork'
								header='_PK|_GRP_PK|_LINE_PK|Line ID|Line Name|From Date|Time|To Date|Time|None Time|None Type|_EMP_PK|Emp ID|Emp Name|Remark'
								format='0|0|0|0|0|4|0|4|0|0|0|0|0|0|0'
								aligns='0|0|0|0|0|1|1|1|1|3|0|0|0|0|0'
								check='||||||||||||||'
								editcol='0|0|0|0|0|1|1|1|1|1|1|0|0|0|0'
								widths='0|0|0|1200|2500|1200|800|1200|800|1200|1200|0|1200|1500|1000'
								sorting='T'								 
								styles='width:100%; height:100%' onafteredit="CheckInput(this)" 
								oncelldblclick="OnCellDoubleClick(this)"
							/>
	
                        </td>
                    </tr>
                </table>
<!----------------------------------------------------------->
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpID" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpName" styles="width: 100%;display: none" />	
<!----------------------------------------------------------->
</body>
</html>
