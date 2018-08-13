<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>WORKING TASKS CHECKING</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;        
    
	var	G1_SITE_PK 	 	= 0,
		G1_SITE_NAME 	= 1,
		G1_SITE_STATUS 	= 2,  
		G1_JOB_PK		= 3,
		G1_JOB_DESC		= 4,
		G1_JOB_STATUS	= 5,		
		G1_STAFF		= 6,
		G1_WORK_DT		= 7,
		G1_SEQ			= 8,
		G1_TASK_STATUS	= 9,
		G1_PLAN_TASK	= 10,
		G1_EMP_NOTE		= 11,
		G1_TASK_PK		= 12;

//=========================================================================
 
 function BodyInit()
 {    
    grdTasks.GetGridControl().MergeCells  = 2 ;	
    grdTasks.GetGridControl().MergeCol(0) = true ;	
    grdTasks.GetGridControl().MergeCol(1) = true ;   	
    grdTasks.GetGridControl().MergeCol(2) = true ;
	grdTasks.GetGridControl().MergeCol(3) = true ;
	grdTasks.GetGridControl().MergeCol(4) = true ;
	grdTasks.GetGridControl().MergeCol(5) = true ;
	grdTasks.GetGridControl().MergeCol(6) = true ;
	grdTasks.GetGridControl().MergeCol(7) = true ;
	grdTasks.GetGridControl().MergeCol(8) = true ;
	grdTasks.GetGridControl().MergeCol(9) = true ;
	grdTasks.GetGridControl().MergeCol(10) = true ;
    //---------------------------     
	dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30  ));
	dtToDate.SetDataText(System.AddDate(dtFromDate.GetData(),+60  ));
    //---------------------------
	var data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGGS0302') FROM DUAL" )%>||";    
    lstSEmp.SetDataText(data);
	lstSEmp.value = '' ;
 }
//=========================================================================
 
 function OnSearch(id)
 {
		switch(id)
		{			 
			case 'TASK':
				 
				data_agds00150.Call("SELECT");
			break;
		}
 }
  
//=========================================================================

 function OnDataReceive(obj)
 {
		switch(obj.id)
		{
			 
			case 'data_agds00150' :
				if (grdTasks.rows > 1) 
				{
					grdTasks.SetCellBold( 1, G1_SITE_NAME, grdTasks.rows - 1, G1_SITE_NAME, true );
					grdTasks.SetCellBold( 1, G1_JOB_DESC,  grdTasks.rows - 1, G1_JOB_DESC,  true );
					
					grdTasks.SetCellBgColor( 1, G1_PLAN_TASK , grdTasks.rows - 1, G1_PLAN_TASK , 0xCCFFFF );
						
					grdTasks.SetCellFontColor( 0, G1_SITE_STATUS, grdTasks.rows - 1, G1_SITE_STATUS, 0x3300cc );  
					grdTasks.SetCellFontColor( 0, G1_JOB_STATUS,  grdTasks.rows - 1, G1_JOB_STATUS,  0x3300cc );  
					grdTasks.SetCellFontColor( 0, G1_TASK_STATUS, grdTasks.rows - 1, G1_TASK_STATUS, 0x3300cc );          	 
	            }									 	 									
			break;
			 	
		}
 }
 
//=========================================================================
function OnReport()
{
     var url =System.RootURL + "/reports/ag/ds/rpt_agds00150.aspx?p_site="+txtSite.text+'&p_job='+txtJob.text+'&p_task='+txtTask.text+'&p_emp='+lstSEmp.value+'&p_from_date='+dtFromDate.value+'&p_to_date='+dtToDate.value  ; 
     System.OpenTargetPage(url); 
}
</script>

<!------------------------------------------------------------------>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_agds00150" > 
                <input> 
                    <input bind="txtSite" />
					<input bind="txtJob" />
					<input bind="txtTask" />
					<input bind="lstSEmp" />
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                </input> 
                <output bind="grdTasks" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------>  
                    <table style="height: 100%; width: 100%">
                        <tr style="height:1%">
                            <td style="width:5%" align="right">
                                Site
                            </td>
							<td style="width:15%">	
								<gw:textbox id="txtSite" styles="width: 100%" onenterkey="OnSearch('TASK')" />							 
							</td>
							<td style="width:5%" align="right" > 
								Job								                             
                            </td>
							<td style="width:15%">	
								<gw:textbox id="txtJob" styles="width: 100%" onenterkey="OnSearch('TASK')" />							  
							</td>
							<td style="width:5%" align="right" > 
								Task								                             
                            </td>	
							<td style="width:15%">	
								<gw:textbox id="txtTask" styles="width: 100%" onenterkey="OnSearch('TASK')" />							  
							</td>	
							
							<td align="right" style="width: 5%">
                            	Emp
                        	</td>
                        	<td style="width: 15%;">
								 <gw:list id="lstSEmp" maxlen="100" styles='width:100%' onchange="OnSearch('SEARCH')" />
                        	</td>
						
							<td style="width:5%" align="right" > 
								Date								                             
                            </td>	
							<td style="width:14%;white-space:nowrap">	
								<gw:datebox id="dtFromDate" lang="1" styles="width:50%" />
                                ~<gw:datebox id="dtToDate" lang="1" styles="width:50%" />								 				  
							</td>						 
                             <td style="width:1%">
                                <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReport()" />   
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('TASK')" />
                            </td>
                        </tr>
                        <tr style="height: 39%">
                            <td colspan="12">
                                <gw:grid id='grdTasks' 
								header='_Site_pk|Site|Status|_Job_PK|Job|Status|Staff|Date|Seq|Status|Plan Task|Staff Note|_Task_PK' 
								format='0|0|0|0|0|0|0|4|0|0|0|0|0' 
								aligns='0|0|1|0|0|1|0|1|1|1|0|0|0'
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|1500|1200|0|1500|1200|1500|1200|800|1500|3000|3000|0' 
								sorting='T' styles='width:100%; height:100%'
								acceptnulldate="T"
                                />
                            </td>
                        </tr>
                        
                    </table>					                
    <!------------------------------------------->
</body>
</html>
