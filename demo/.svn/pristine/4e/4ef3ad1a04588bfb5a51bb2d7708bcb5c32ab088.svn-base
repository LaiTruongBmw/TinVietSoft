<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Task Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var G_TASK_PK       = 0,
    G_TASK_TYPE     = 1,
    G_TASK_ID       = 2,
    G_TASK_NAME     = 3,
    G_TASK_FNAME_01 = 4,
    G_TASK_FNAME_02 = 5,
    G_MACHINE_TYPE  = 6,
    G_POINT_TYPE    = 7,
    G_TIME_COST     = 8,
    G_HR_COST       = 9,
    G_USE_YN        = 10,
    G_DESCRIPTION   = 11;
    
//=======================================================    
function BodyInit()
{
    
    System.Translate(document);
    BindingDataList();
}
//====================================================================================
function BindingDataList()
{
     var  data ;

     data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0306') FROM DUAL")%>||"; 
     lstTaskType.SetDataText(data);  
     lstTaskType.value = '' ;

     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0306' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
     grdTask.SetComboFormat(G_TASK_TYPE, data);
          
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0305' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
     grdTask.SetComboFormat(G_MACHINE_TYPE, data); 

     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0307' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
     grdTask.SetComboFormat(G_POINT_TYPE, data); 
     
     grdTask.GetGridControl().ColFormat(G_TIME_COST) = "###,###,###.##";  
     grdTask.GetGridControl().ColFormat(G_HR_COST)   = "###,###,###.##";   
}
//=======================================================    

 function OnSearch()
 {
        data_fpib00030.Call('SELECT')
 }
//=======================================================    
   
function OnAddNew()
{  
    grdTask.AddRow();

    grdTask.GetGridControl().TopRow = grdTask.rows -1;      
}
//=======================================================    

function OnSave()
{   
    if ( grdTask.rows > 1 )   
    {		
        data_fpib00030.Call();
    }
}

//=======================================================    

function OnDataReceive(obj)
{
        if ( grdTask.rows > 1 )
        {            
            grdTask.SetCellBold( 1, G_TASK_ID,   grdTask.rows-1, G_TASK_ID, true);  
            grdTask.SetCellBold( 1, G_TIME_COST, grdTask.rows-1, G_HR_COST, true);   
            
            grdTask.SetCellBgColor( 1, G_TASK_ID, grdTask.rows-1, G_TASK_NAME, 0xCCFFFF );      
        } 
}

//========================================================

function OnDelete()
{
    if ( grdTask.row > 0 )
    {
        if ( grdTask.GetGridData( grdTask.row, G_TASK_PK) == '' )
        {
            grdTask.RemoveRow();                 
        }   
        else
        {
            grdTask.DeleteRow();  
        } 
    }
}
//========================================================

function OnUnDelete()
{
    grdTask.UnDeleteRow();
}    

//=====================================================================================
 function CheckInput(obj)
 {
    row = event.row ;
    col = event.col ;
      
    switch(obj.id)
    {
        case 'grdTask':
            if ( col == G_TIME_COST || col == G_HR_COST )
            {
                var dQuantiy;
                
                dQuantiy =  grdTask.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                            grdTask.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));   
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdTask.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdTask.SetGridText(row,col,"")
                }         
            }       
        break;                
    }     
 }
 //======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Machine_Type':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0305";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;  
        
        case 'Task_Type':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0306";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;  
        
        case 'Point_Type':
             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0307";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;               
    }             
} 
 //======================================================================

</script>

<body>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="data_fpib00030" onreceive="OnDataReceive(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_SEL_fpib00030" parameter="0,1,2,3,4,5,6,7,8,9,10,11" procedure="<%=l_user%>lg_upd_fpib00030"> 
                <input bind="grdTask" >
                    <input bind="lstTaskType" />
                    <input bind="txtTask" /> 
                    <input bind="chkUsed" /> 
                </input> 
                <output bind="grdTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Task_Type')">Task Type</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstTaskType" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="right">
                            Task</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTask" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                            Active
                            <gw:checkbox id="chkUsed" value="1" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Machine_Type')">Machine Type</b>
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Point_Type')">Point Type</b>
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdTask' header='_PK|Type|Task ID|Task Name|F Name 01|F Name 02|Machine Type|Point Type|Time Cost (s)|H/R Cost|USE|Description'
                    format='0|0|0|0|0|0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0|0|3|3|0|0' check='|||||||||||'
                    editcol='0|1|1|1|1|1|1|1|1|1|1|1' widths='0|1500|1500|2500|2000|2000|2000|2000|1500|1500|1000|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
</body>
</html>
