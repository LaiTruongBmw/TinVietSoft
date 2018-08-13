<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Pop Up Capacity for Line</title>
</head>

<script>
    
var G1_LINE_PK          = 0,
    G1_Line_Name        = 1,
    G1_Work_DT          = 2,
    G1_Work_Shift       = 3,    
    G1_Shift_Hours      = 4,
    G1_OT_Start         = 5,
    G1_OT_End           = 6,
    G1_OT_Hours         = 7,
    G1_Work_Hours       = 8,
    G1_ST_Capa_Qty      = 9,
    G1_Line_Capa_Qty    = 10,
    G1_PK               = 11;
    
 //--------------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    
    dtTo.SetDataText(System.AddDate(dtFrom.GetData(),+7));
    //----------------------------------
    FormatGrid();
    BindingDataList();    
    //----------------------------------

    OnSearch('grdDetail'); 
    //----------------------------------
}
//--------------------------------------------------------------------------
function BindingDataList()
{    
    var data=""; 
    
    //------------------------------   
    data = "<%=CtlLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name FROM prod.pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>" ;    
    lstLineGroup.SetDataText(data); 
    
    var linegroup_pk = "<%=request.QueryString("linegroup_pk") %>"  ;
    if ( Number(linegroup_pk) > 0 )
    {
        lstLineGroup.value = linegroup_pk ;
    }    

    //----------------------------------
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   pk, shift || ' ( ' || start_time || ' - ' || end_time || ' )' FROM hr.thr_work_shift WHERE del_if = 0 ORDER BY shift " )  %> " ; 
    grdDetail.SetComboFormat( G1_Work_Shift, data); 
    
} 
//-------------------------------------------------------------------------------------------
function FormatGrid()
{    
    var ctrl = grdDetail.GetGridControl();
    
    ctrl.ColFormat(G1_Shift_Hours)   = "###,###,###,###.##";
    ctrl.ColFormat(G1_OT_Hours)      = "###,###,###,###.##";
    ctrl.ColFormat(G1_Work_Hours)    = "###,###,###,###.##";
    ctrl.ColFormat(G1_ST_Capa_Qty)   = "###,###,###,###.##";
    ctrl.ColFormat(G1_Line_Capa_Qty) = "###,###,###,###.##"; 
    ctrl.ColEditMask(G1_OT_Start) = "99:99";
    ctrl.ColEditMask(G1_OT_End)   = "99:99";
        
    ctrl.MergeCells  = 2 ;	      
    ctrl.MergeCol(0) = true ;	
    ctrl.MergeCol(1) = true ;
}     

 //--------------------------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {                              
            case 'grdDetail' :
                data_fpab00060.Call("SELECT");
                
                //------------------------------
            break;            
      }  
 }
  //---------------------------------------------------------
function OnSave(pos)
{
    switch (pos)
    {
        case 'grdDetail' :
            data_fpab00060.Call();
        break ;
    }    
}

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      { 
            case "pro_fpab00060" :
                alert(txtReturnValue.text);
                
                OnSearch('grdDetail');
            break; 
                        
            case "data_fpab00060" :
                //------------------------
	            if ( grdDetail.rows > 1 )
	            {
      		        grdDetail.SetCellBgColor(1, G1_OT_Start, grdDetail.rows - 1, G1_OT_End, 0xd4d2ff );
      		        
                    grdDetail.SetCellBold( 1, G1_OT_Hours,    grdDetail.rows - 1, G1_Line_Capa_Qty, true);
                    grdDetail.SetCellBold( 1, G1_Shift_Hours, grdDetail.rows - 1, G1_Shift_Hours,   true);      		        
                }
      		    //------------------------
            break;                                                               
      }
 }  

//====================================================================================
 function CheckInput(obj)
 { 
    switch (obj.id)
    {        
        case "grdDetail":
            var  row, col ;
            
            row = event.row ;
            col = event.col ; 
           
            if ( col == G1_Shift_Hours || col == G1_OT_Hours || col == G1_Work_Hours || col == G1_ST_Capa_Qty || col == G1_Line_Capa_Qty )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
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
                //---------------------------------------
                
                if ( col != G1_Line_Capa_Qty )
                {
                    var dWorkHours ;
                    
                    dWorkHours = Number( grdDetail.GetGridData( row, G1_Shift_Hours)) + Number( grdDetail.GetGridData( row, G1_OT_Hours ));
                    
                    grdDetail.SetGridText( row, G1_Work_Hours, parseFloat(dWorkHours+"").toFixed(2));
                    //------------------
                    var dLineCapa ;
                    
                    dLineCapa = Number( grdDetail.GetGridData( row, G1_Work_Hours)) * Number( grdDetail.GetGridData( row, G1_ST_Capa_Qty ));
                    
                    grdDetail.SetGridText( row, G1_Line_Capa_Qty, parseFloat(dLineCapa+"").toFixed(2));
                } 
                //---------------------------------------                 
            }   
            else if ( col == G1_OT_Start || col == G1_OT_End )
	        {
	            var cIdx = col;
	            
		        var tmpIN = grdDetail.GetGridData(event.row,cIdx)
        		
		        if ( tmpIN.length == 0 )
		        {
			        grdDetail.SetGridText(event.row, cIdx, "")
        			
		        }
		        if( ( tmpIN.length !=4 ) && ( tmpIN.length !=0 ) )
		        {
			        alert("Input In time is not correct type.(type: hh:mm)\nKiểu gi�?in nhập không đúng")
			        grdDetail.SetGridText(event.row,cIdx,'')
			        return;
		        }
		        if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		        {
			        alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiểu gi�?in phải >=00 và <=23")
			        grdDetail.SetGridText(event.row,cIdx,'')
			        return;
		        }
		        if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		        {
			        alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiểu phút phải >=00 và <=59")
			        grdDetail.SetGridText(event.row,cIdx,'')
			        return;
		        }
		        if(tmpIN.length>0)
		        {
		            tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		            grdDetail.SetGridText(event.row,cIdx,tmpIN)
		        }     
	        }                           
        break;        
    }       
}     
//====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'LoadSchedule':
            if ( confirm('Are you want to load schedule.') )
            { 
                pro_fpab00060.Call();
            }    
        break;
    }
}
//======================================================================================
	
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpab00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00060" > 
                <input>
                    <input bind="lstLineGroup" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="data_fpab00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_fpab00060" procedure="st_lg_upd_fpab00060" > 
                <input> 
                    <input bind="lstLineGroup" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <td style="height: 1%">
            <table style="width: 100%; height: 100%">
                <tr>
                    <td style="width: 5%; white-space: nowrap" align="right">
                        Line Group
                    </td>
                    <td style="width: 40%" align="right">
                        <gw:list id="lstLineGroup" text="" styles="width:100%" onchange="" csstype="mandatory" />
                    </td>
                    <td style="width: 5%" align="right">
                        Date
                    </td>
                    <td style="width: 40%; white-space: nowrap" align="left">
                        <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                        ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                    </td>
                    <td style="width: 1%">
                        <gw:button id="idBtnProcess" img="Load Canlendar" text="Load Canlendar" onclick="OnProcess('LoadSchedule')" />
                    </td>
                    <td style="width: 6%">
                    </td>
                    <td style="width: 1%" align="right">
                    </td>
                    <td style="width: 1%">
                        <gw:button id="btnSearch1" img="search" onclick="OnSearch('grdDetail')" />
                    </td>
                    <td style="width: 1%">
                        <gw:button id="btnSave1" img="save" onclick="OnSave('grdDetail')" />
                    </td>
                </tr>
            </table>
        </td>
        <tr style="height: 59%">
            <td>
                <gw:grid id='grdDetail' header='_PB_LINE_PK|Line|Work Date|Work Shift|Shift Hours|OT Start|OT End|OT Hours|Work Hours|Capa(Hours)|Line Capa|_PK'
                    format='0|0|4|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|3|1|1|3|3|3|3|0' defaults='|||||||||||'
                    editcol='0|0|1|1|1|1|1|1|1|1|1|1' widths='0|2000|1200|1500|1200|1200|1200|1200|1200|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
    <!------------------------------------------->
</body>
</html>
