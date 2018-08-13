<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Daily Target</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_LinePK        = 0,
    G_Line_ID       = 1,
    G_Line_Name     = 2,
    G_Date          = 3,
    G_Shift         = 4,
    G_LineTargetPK  = 5,
    G_Machine_Qty   = 6,
    G_Target_Qty    = 7,
    G_Emp_Num       = 8,	
    G_Day_Run       = 9,
    G_Night_Run     = 10,
    G_Description   = 11;
    
var G1_Chk          = 0,
    G1_WT_Code      = 1,
    G1_From_Time    = 2,
    G1_To_Time      = 3,
    G1_Work_Hours   = 4,
	G1_Capa_Ratio	= 5,
    G1_Target       = 6,
    G1_LINE_PK      = 7,
    G1_Work_Date    = 8,
    G1_Remark       = 9,
    G1_WT_PK        = 10;
	 
 var p_flag = 'SELECT';
 
 var arr_LineTargetNumber = new Array();

 var arr_WorkTimeNumber   = new Array();  
 
//=======================================================================
function BodyInit()
{
	System.Translate(document);  // Translate to language session    
	//---------------------
	InitFormat();
    //--------------------                                
    OnSearch('header');
    //--------------------    
}
//=======================================================================
 function InitFormat()
 {
    var ctrl = grdDetail.GetGridControl();  
      
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;

    ctrl.ColFormat(G_Machine_Qty) = "###,###,###,###";
    ctrl.ColFormat(G_Target_Qty)  = "###,###,###,###";
    ctrl.ColFormat(G_Emp_Num)     = "###,###,###,###"; 
    ctrl.ColFormat(G_Day_Run)     = "###,###,###,###";
    ctrl.ColFormat(G_Night_Run)   = "###,###,###,###";  
    
	arr_LineTargetNumber[G_Machine_Qty] = 0;
	arr_LineTargetNumber[G_Target_Qty]  = 0;
	arr_LineTargetNumber[G_Emp_Num]     = 0;
	arr_LineTargetNumber[G_Day_Run]     = 0;
	arr_LineTargetNumber[G_Night_Run]   = 0;
	
    var ctrl = grdWorkTime.GetGridControl();
    ctrl.ColFormat(G1_Work_Hours) = "###,###,###,###.##";
	ctrl.ColFormat(G1_Capa_Ratio) = "###,###,###,###.##";  
	ctrl.ColFormat(G1_Target)     = "###,###,###,###.##"; 
    ctrl.ColEditMask(G1_From_Time) = "99:99";
    ctrl.ColEditMask(G1_To_Time)   = "99:99";  
	
	arr_WorkTimeNumber[G1_Work_Hours] = 2;
	arr_WorkTimeNumber[G1_Capa_Ratio] = 2;
	arr_WorkTimeNumber[G1_Target]     = 2;
	
    //--------------------
    
    var data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ")%>";                     
    lstLineGroup.SetDataText(data);

    data = "<%=ESysLib.SetGridColumnDataSQL(" select null,null shift from dual union all SELECT PK, shift || ' : ' || start_time || ' -> ' || end_time FROM thr_work_shift WHERE DEL_IF = 0 AND USE_YN = 'Y' order by shift " ) %> ";       
    grdDetail.SetComboFormat( G_Shift, data); 
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_FACTORY where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
    lstFactory.SetDataText( data);	
 }
//=======================================================================
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Calendar':
            data_fppw00020.Call('SELECT');
        break;
        
        case 'WorkTime':
            if ( grdDetail.row > 0 )
            {
                txtLinePK.text = grdDetail.GetGridData( grdDetail.row, G_LinePK);
                txtWorkDT.text = grdDetail.GetGridData( grdDetail.row, G_Date);
                
                if ( txtLinePK.text != '' )
                {
                    data_fppw00020_1.Call('SELECT');
                }
                else
                {
                    grdWorkTime.ClearData();
                }    
            }
            else
            {
                grdWorkTime.ClearData();
            }            
        break;		 	
    }        
 }
//=======================================================================

 function OnSave(pos)
 {
    switch(pos)
    {
        case 'Calendar':
            data_fppw00020.Call();
        break;
        
        case 'WorkTime':
            p_flag = 'SAVE'
            data_fppw00020_1.Call();
        break;		
    }    
 }   
//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case 'data_fppw00020' :
            if ( grdDetail.rows > 1 )
            {
                for ( var i = 1; i<grdDetail.rows; i++)
                {
                    if ( grdDetail.GetGridData( i, G_LineTargetPK ) == '' )
                    {
                        grdDetail.SetCellBgColor( i, G_Line_ID, i, G_Description, 0xCCFFFF );  
                    }                      
                }
                
                grdDetail.SetCellBold( 1, G_Line_ID,    grdDetail.rows - 1, G_Line_ID,    true);
                grdDetail.SetCellBold( 1, G_Target_Qty, grdDetail.rows - 1, G_Target_Qty, true);
                
                grdDetail.Subtotal( 0, 2, -1, '7','###,###,###');
            }
        break;
        
        case 'pro_fppw00020':
            alert(txtReturnValue.text);
            
            OnSearch('Calendar');
        break;
		
        case 'data_fppw00020_1':
            if(p_flag =='SAVE')
            {
                OnSave('Calendar')
                p_flag ='SELECT'
            }
        break;		
    }    
}
//==========================================================================
function OnPreviousDate(pos)
{
	switch(pos)
	{
		case 'Tab01' :		
    		dtDateTab01.SetDataText(System.AddDate(dtDateTab01.GetData(),-1));
    		OnSearch('Calendar');
		break;
		
		case 'Tab02' :
			dtDateTab02.SetDataText(System.AddDate(dtDateTab02.GetData(),-1));
    		OnSearch('grdRoutingDay');
		break;
	}				
}

//==========================================================================
function OnNextDate(pos)
{
	switch(pos)
	{
		case 'Tab01' :
    		dtDateTab01.SetDataText(System.AddDate(dtDateTab01.GetData(),+1));
    		OnSearch('Calendar');		
		break;		
	}	

}
//=======================================================================
 function CheckInput(obj)
 {   
    switch(obj.id)
    {
        case 'grdDetail':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G_Machine_Qty || col == G_Target_Qty || col == G_Day_Run || col == G_Night_Run || col == G_Emp_Num )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdDetail.SetGridText(row,col, System.Round( dQuantiy, arr_LineTargetNumber[col] ));
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
                //---------------------------------------------
                grdDetail.Subtotal( 0, 2, -1, '7','###,###,###');
            }         
        break;
        		
        case 'grdWorkTime':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G1_Work_Hours || col == G1_Capa_Ratio || col == G1_Target )
            {
                var dQuantiy;
                
                dQuantiy =  grdWorkTime.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        	grdWorkTime.SetGridText(row,col, System.Round( dQuantiy, arr_WorkTimeNumber[col] ) );
						
						 	//------------------------------------------
            				if ( col == G1_Target )
            				{                 
                 				CalcTotalTarget();                   
            				}
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdWorkTime.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdWorkTime.SetGridText(row,col,"")
                }         
            }           
            //------------------------------------------
            if ( col == G1_From_Time || col == G1_To_Time )
	        {
		        tmpIN = grdWorkTime.GetGridData(event.row,col)
        		
		        if ( tmpIN.length == 0 )
		        {
			        grdWorkTime.SetGridText(row, col, "")
        			
		        }
		        if( ( tmpIN.length !=4 ) && ( tmpIN.length !=0 ) )
		        {
			        alert("Input In time is not correct type.(type: hh:mm)\nKiểu gi�?in nhập không đúng")
			        grdWorkTime.SetGridText(row,col,'')
			        return;
		        }
		        if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		        {
			        alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiểu gi�?in phải >=00 và <=23")
			        grdWorkTime.SetGridText(row,col,'')
			        return;
		        }
		        if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		        {
			        alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiểu phút phải >=00 và <=59")
			        grdWorkTime.SetGridText(row,col,'')
			        return;
		        }
		        if(tmpIN.length>0)
		        {
		            tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		            grdWorkTime.SetGridText(row,col,tmpIN)
		        }    
	        }                            
        break;
    }
 }
//=======================================================================
function OnDelete()
{
    grdDetail.DeleteRow();
}
//=======================================================================
function OnDeleteWorkTime()
{
    grdWorkTime.DeleteRow();
}
//=======================================================================
function OnProcess(pos)
{
      switch (pos)         
      {		        
            case "WIPlan" :
				if ( confirm('Do you want to load Line target from Line Plan ?'))
				{
					pro_fppw00020.Call();
				}	
            break;
			
            case "LoadTimeTarget" :
                var total_target_qty = 0; 
                var dQuantiy;
                var last_point;
				
				if ( grdDetail.row > 0 )
				{			
               		for ( var i=1; i<grdWorkTime.rows;i++)
			   		{
						grdWorkTime.SetGridText(i,G1_Target, 0);	
						
			   			if ( grdWorkTime.GetGridData(i,G1_Chk) == '-1' )
						{
							dQuantiy = grdWorkTime.GetGridData(i,G1_Capa_Ratio) * grdDetail.GetGridData(grdDetail.row,G_Target_Qty);
							
							total_target_qty += Number(parseFloat(dQuantiy+"").toFixed(0));
							
							last_point = i;
							
			   				grdWorkTime.SetGridText(i,G1_Target, parseFloat(dQuantiy+"").toFixed(0));			   		            
						}	
			   		}
					
			   		if ( total_target_qty < grdDetail.GetGridData(grdDetail.row,G_Target_Qty) && last_point >=1 )
			   		{
			   		    var last_qty = Number(grdDetail.GetGridData(grdDetail.row,G_Target_Qty)) - Number(total_target_qty - grdWorkTime.GetGridData(last_point,G1_Target));
			   		    grdWorkTime.SetGridText(last_point,G1_Target, parseFloat(last_qty+"").toFixed(0));
			   		}
				}
				else
				{
					alert("PLS SELECT A LINE !");
				}	
            break;			
      }
}            
//=======================================================================
function CalcTotalTarget()
{
    var i_total =0;
    var i_temp ;
    for (var i =1 ; i<grdWorkTime.rows; i++ )
    {   
        i_temp = grdWorkTime.GetGridData(i,G1_Target)
        if(Number(i_temp))
        {
            if(i_temp >0 )
            {
                i_total = i_total + Number(i_temp);
            }
        }
    }
    if(i_total>0)
    {
        grdDetail.SetGridText(grdDetail.row,G_Target_Qty,i_total);
    }
}

//=======================================================================  

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'WorkTime':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0308";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;  
             
    }             
}

//============================================================================= 

function OnCellDoubleClick(obj)
{ 
    event_col = event.col ;
    event_row = event.row ;
    
    switch (obj.id)
    {
        case 'grdWorkTime':            
            if ( event_col == G1_Chk )
            {
			    if ( confirm("Do you want to select/deselect all ?") )
				{				
                	if ( grdWorkTime.rows > 1 )
                	{              
                    	if ( grdWorkTime.GetGridData( event_row, G1_Chk) == -1 )
                    	{
                        	for ( var i = event_row; i < grdWorkTime.rows ; i++ )
                        	{
                            	grdWorkTime.SetGridText( i, G1_Chk, -1) ;
                       		}
                    	}
                    	else
                    	{
                        	for ( var i = event_row; i < grdWorkTime.rows ; i++ )
                        	{
                            	grdWorkTime.SetGridText( i, G1_Chk, 0) ;
                        	}                    
                    	}
					}	
                }
            }
        break;
    }
}
 
//=======================================================================
          
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00020" > 
                <input>
                    <input bind="lstLineGroup" /> 
                    <input bind="dtDateTab01" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00020" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppw00020" procedure="<%=l_user%>lg_upd_fppw00020" > 
			    <input bind="grdDetail" >
			        <input bind="lstLineGroup" />
			        <input bind="dtDateTab01" />			
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00020_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fppw00020_1" procedure="<%=l_user%>lg_upd_fppw00020_1" > 
			    <input bind="grdWorkTime" >
			        <input bind="txtLinePK" />
			        <input bind="txtWorkDT" />
					<input bind="radType" />			
			    </input> 
			    <output bind="grdWorkTime" /> 
		    </dso> 
	    </xml> 
    </gw:data>	  
	<!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Line" >
        <tr>
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Line Group
                        </td>
                        <td style="width: 55%">
                            <gw:list id="lstLineGroup" styles="width:100%" onchange="OnSearch('Calendar')" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 5%" align="right">
                            <img status="expand" id="imgArrow01" src="../../../system/images/button/icons_button/back.gif"
                                style="cursor: hand" onclick="OnPreviousDate('Tab01')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <gw:datebox id="dtDateTab01" lang="1" styles='width:100%;' onchange="OnSearch('Calendar')" />
                        </td>
                        <td style="width: 5%" align="left">
                            <img status="expand" id="imgArrow02" src="../../../system/images/button/icons_button/next.gif"
                                style="cursor: hand" onclick="OnNextDate('Tab01')" /></td>
                        <td style="width: 6%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon img="2" text="Load W/I Qty" id="btnWIPlan" onclick="OnProcess('WIPlan')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('Calendar')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Calendar')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_PK|Line ID|Line Name|Date|Shift|_PK|Machine Qty|Target Qty|Emp Num|Day Run|Night Run|Remark'
                                format='0|0|0|4|0|0|0|0|0|0|0|0' aligns='0|0|0|1|0|0|3|3|3|3|3|0' editcol='0|0|0|1|1|0|1|1|1|1|1|1'
                                widths='1000|1500|2000|1200|2500|1000|1200|1200|1200|1200|1200|1000' sorting='T'
                                styles='width:100%; height:100%' acceptnulldate='T' onafteredit="CheckInput(this)"
                                onclick="OnSearch('WorkTime')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%; white-space: nowrap" align="right">
							<gw:icon img="2" text="Time Target" id="btnTimeTarget" onclick="OnProcess('LoadTimeTarget')" />
                        </td>
						<td style="width: 66%; white-space: nowrap" align="center">
						 	<gw:radio id="radType" value="1" styles="width:100%" onchange="OnSearch('WorkTime')"> 
						     	<span value="1" id="T1">Type 1</span> 
						     	<span value="2" id="T2">Type 2</span> 						     	 
						 	</gw:radio>
                        </td>
						<td style="width: 30%; white-space: nowrap">
							<b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('WorkTime')"><u>Work Time</u></b>
						</td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('WorkTime')" />
                        </td>
						<td style="width: 1%">
							<gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDeleteWorkTime()" />
						</td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave1" img="save" alt="Save" onclick="OnSave('WorkTime')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="6">
                            <gw:grid id='grdWorkTime' header='Chk|_WT Code|From|To|Work Hours|Capa %|Target Qty|_LINE_PK|_Work Date|Remark|_PK'
                                format='3|0|0|0|0|0|-0|0|4|0|0' aligns='0|0|1|1|1|1|0|0|1|0|0' editcol='1|0|1|1|1|1|1|0|0|0|0' 
								widths='600|0|1000|1000|1200|1000|1200|0|0|1000|0'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T' onafteredit="CheckInput(this)" 
								oncelldblclick="OnCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>	
</body>
<!------------------------------------------------------------------>
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtLinePK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWorkDT" maxlen="100" styles='width:100%;display:none' />
<!---------------------------------------------------------------------->
</html>
