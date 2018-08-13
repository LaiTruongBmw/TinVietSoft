<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>SITE JOBS SCHEDULING</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	
    var  flag ;         
    
	var	G1_SITE_PK 	 = 0,
		G1_SITE_NAME = 1,
		G1_SITE_TYPE = 2;

	var G2_JOB_PK   = 0,
	    G2_SITE_PK  = 1,
	    G2_JOB_ID   = 2,
	    G2_JOB_DESC = 3,
	    G2_STATUS   = 4,
		G2_START    = 5,
		G2_END      = 6,
		G2_REMARK   = 7;
		
	var G3_TASK_PK   = 0,
	    G3_JOB_PK    = 1,
	    G3_STAFF     = 2,
	    G3_WORK_DT   = 3,
	    G3_SEQ       = 4,
		G3_STATUS    = 5,
		G3_PLAN_TASK = 6,
		G3_STAFF_NOTE= 7;		
//=========================================================================

 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }

//=========================================================================
 
 function BodyInit()
 {    
    //---------------------------
    BindingDataList();
    //---------------------------
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(), -360 ));
	
	dtTaskFrom.SetDataText(System.AddDate(dtToDate.GetData(), -30 ));	
	dtTaskTo.SetDataText(System.AddDate(dtToDate.GetData()  , +30 ));
    //---------------------------
 }
//=========================================================================
 
 function BindingDataList()
 {    
	var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   code, (code || ' ' || code_nm) code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGGS0302' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord" )%>";       
    grdTasks.SetComboFormat(G3_STAFF, data);
	
	data ="<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGGS0302') FROM DUAL" )%>||";      
    lstSEmp.SetDataText(data);
	lstSEmp.value = "";
 }
//=========================================================================

function OnPopUp(pos)
{ 
		switch(pos)
		{
			case 'TASK':
				if ( grdTasks.row > 0 )
				{ 
					var path = System.RootURL + "/standard/forms/ag/ds/agds00141.aspx?task_pk=" + grdTasks.GetGridData( grdTasks.row, G3_TASK_PK );
 					var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30' );	         	 		
				}
				else
				{
					alert("PLS SELECT ONE SAVED TASK.");
				} 
			break;
		}
}
	
//=========================================================================		 
 function OnSearch(id)
 {
		switch(id)
		{
			case 'grdSearch' :
				data_agds00140.Call("SELECT");
			break;
			
			case 'JOBS':
				if ( grdSearch.row > 0 )
				{
					txtSitePK.text = grdSearch.GetGridData( grdSearch.row, G1_SITE_PK );
				}
				
				data_agds00140_1.Call("SELECT");
			break;
			
			case 'TASKS':
				if ( grdJobs.row > 0 )
				{
					txtJobPK.text = grdJobs.GetGridData( grdJobs.row, G2_JOB_PK );
				}
				
				data_agds00140_2.Call("SELECT");
			break;
		}
 }
  
//=========================================================================

 function OnDataReceive(obj)
 {
		switch(obj.id)
		{
			case 'data_agds00140' :
				if (grdSearch.rows > 1) 
				{
					grdSearch.SetCellBold( 1, G1_SITE_NAME,  grdSearch.rows - 1, G1_SITE_NAME,  true);	            	 
	            }	
				
				grdJobs.ClearData();
				grdTasks.ClearData();			
			break;
			
			case 'data_agds00140_1' :
				if (grdJobs.rows > 1) 
				{
					grdJobs.SetCellBold( 1, G2_JOB_DESC,  grdJobs.rows - 1, G2_JOB_DESC,  true);	
					grdJobs.SetCellFontColor(0, G2_STATUS, grdJobs.rows - 1, G2_STATUS, 0x3300cc);            	 
	            }	
				
				for (var i = 1; i < grdJobs.rows; i++) 
				{                     					
                    if ( grdJobs.GetGridData(i, G2_STATUS) == 'PROCESSING' ) 
					{
                        grdJobs.SetCellFontColor(i, G2_JOB_ID, i, G2_REMARK, 0x3300cc);
                    }
                    else 
					{
                        grdJobs.SetCellFontColor(i, G2_JOB_ID, i, G2_REMARK, 0x000000);
                    } 
				}	
				
				grdTasks.ClearData();										
			break;
			
			case 'data_agds00140_2' :
				if (grdTasks.rows > 1) 
				{
					grdTasks.SetCellBold( 1, G3_WORK_DT,  grdTasks.rows - 1, G3_WORK_DT,  true);
					grdTasks.SetCellBold( 1, G3_STATUS,   grdTasks.rows - 1, G3_STATUS,   true);	
					
					grdTasks.SetCellBgColor( 1, G3_PLAN_TASK , grdTasks.rows - 1, G3_PLAN_TASK , 0xCCFFFF ); 
					
					grdTasks.SetCellFontColor(0, G3_STATUS, grdTasks.rows - 1, G3_STATUS, 0x3300cc);           	 
	            }									 				
			break;			
		}
 }
 
//=========================================================================

 function OnAddNew(pos)
 {  
		switch(pos)
		{
			case 'JOB' :
				if ( grdSearch.row > 0 ) 
				{						
					grdJobs.AddRow();
					grdJobs.SetGridText( grdJobs.rows-1, G2_SITE_PK , grdSearch.GetGridData( grdSearch.row, G1_SITE_PK ));
				}
				else
				{
					alert("PLS SELECT ONE SITE");
				}	
			break;
			
			case 'TASK' :
				if ( grdJobs.row > 0 ) 
				{						
					grdTasks.AddRow();
					grdTasks.SetGridText( grdTasks.rows-1, G3_JOB_PK , grdJobs.GetGridData( grdJobs.row, G2_JOB_PK ));
				}
				else
				{
					alert("PLS SELECT ONE SAVED JOBS");
				}	
			break;			
			
			case 'TASK_COPY' :
				var i = 0 ;
				
				if ( grdTasks.row > 0 ) 
				{				
					i = grdTasks.row;	
					
					grdTasks.AddRow();
					grdTasks.SetGridText( grdTasks.rows-1, G3_JOB_PK     , grdTasks.GetGridData( i, G3_JOB_PK     ));
					grdTasks.SetGridText( grdTasks.rows-1, G3_STAFF      , grdTasks.GetGridData( i, G3_STAFF      ));
					grdTasks.SetGridText( grdTasks.rows-1, G3_PLAN_TASK  , grdTasks.GetGridData( i, G3_PLAN_TASK  ));
				}
				else
				{
					alert("PLS SELECT ONE TASKS");
				}	
			break;						
		}
 }
 
//=========================================================================

 function OnSave(pos)
 {
		switch(pos)
		{
			case 'JOB' :
				if ( confirm("Do you want to save Jobs ?") )
				{
					data_agds00140_1.Call();
				}	
			break;
			
			case 'TASK' :
				if ( confirm("Do you want to save Tasks ?") )
				{
					data_agds00140_2.Call();
				}	
			break;			
		}
 }

//=========================================================================

 function OnDelete(pos)
 {
		switch(pos)
		{
			case 'TASK':
				grdTasks.DeleteRow();
			break;
			
			case 'JOB':
				grdJobs.DeleteRow();
			break;
		}
 }
  
//=========================================================================

</script>

<!------------------------------------------------------------------>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_agds00140" > 
                <input> 
                    <input bind="txtSearch" />
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agds00140_1" procedure="st_lg_upd_agds00140_1" > 
                <input> 
                    <input bind="txtSitePK" />                    
                </input> 
                <output bind="grdJobs" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00140_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agds00140_2" procedure="st_lg_upd_agds00140_2" > 
                <input> 
                    <input bind="txtJobPK" />   
					<input bind="lstSEmp" />
					<input bind="dtTaskFrom" /> 
					<input bind="dtTaskTo" />                
                </input> 
                <output bind="grdTasks" /> 
            </dso> 
        </xml> 
    </gw:data>		
    <!------------------------------------------------------------------>  
        <table border="1" style="height: 100%; width: 100%">
            <tr style="height: 100%">
                <td id="left" style="width: 25%; height: 100%">
                    <table style="height: 100%; width: 100%">
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Site
                            </td>
                            <td colspan="2">
                                <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Date
                            </td>
                            <td style="width: 94%">
                                <gw:datebox id="dtFromDate" lang="1" styles="width:50%" />
                                ~<gw:datebox id="dtToDate" lang="1" styles="width:50%" />
                            </td>
                            <td style="width: 1%" align="right">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdSearch')" />
                            </td>
                        </tr>
                        <tr style="height: 46%">
                            <td colspan="5">
                                <gw:grid id='grdSearch' header='_pk|Site Name|_Site Type' format='0|0|0' aligns='0|0|0'
                                    check='||' editcol='0|0|0' widths='0|2500|1000' sorting='T' styles='width:100%; height:100%'
                                    oncellclick="OnSearch('JOBS')" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td id="right" style="width: 75%">
                    <table style="height: 100%; width: 100%">
                        <tr style="height:1%">
                            <td style="width:5%" align="left">
                                <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                            </td>
							<td style="width:25%">								 
							</td>
							<td style="width:5%"> 								                             
                            </td>
							<td style="width:25%">								  
							</td>
							<td style="width:36%" >
							</td>
							<td style="width:1%">                                
                            </td>
							<td style="width:1%">                                
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="new" alt="Search" id="btnNew" onclick="OnAddNew('JOB')" />
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="delete" alt="Search" id="btnDelete" onclick="OnDelete('JOB')" />
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="save" alt="Search" id="btnSave" onclick="OnSave('JOB')" />
                            </td>
                        </tr>
                        <tr style="height: 39%">
                            <td colspan="10">
                                <gw:grid id='grdJobs' 
								header='_pk|_SITE_PK|Job ID|Job Desc|Status|Start|End|Remark' 
								format='0|0|0|0|0|4|4|0' 
								aligns='0|0|1|0|1|1|1|0'
                                check='|||||||' 
								editcol='0|0|1|1|0|1|1|1' 
								widths='0|0|1000|3500|1200|1200|1200|1000' 
								sorting='T' styles='width:100%; height:100%'
								acceptnulldate="T"
                                oncellclick="OnSearch('TASKS')" />
                            </td>
                        </tr>
                        <tr style="height:1%">
                            <td style="width:5%"> 
								Staff                               
                            </td>
							<td style="width:25%">
								<gw:list id="lstSEmp" maxlen="100" styles='width:100%' onchange="OnSearch('TASKS')" />
							</td>
							<td style="width:5%"> 
								Date                               
                            </td>
							<td style="width:25%">
								 <gw:datebox id="dtTaskFrom" lang="1" styles="width:50%" />
                                ~<gw:datebox id="dtTaskTo" lang="1" styles="width:50%" />
							</td>
							<td style="width:36%" ></td>
							<td style="width:1%">
                                <gw:imgbtn img="select" alt="Select" id="btnSelect1" onclick="OnPopUp('TASK')" />
                            </td>
							<td style="width:1%">
                                <gw:imgbtn img="down11" alt="Copy" id="btnCopy1" onclick="OnAddNew('TASK_COPY')" />
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="new" alt="Search" id="btnNew1" onclick="OnAddNew('TASK')" />
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="delete" alt="Search" id="btnDelete1" onclick="OnDelete('TASK')" />
                            </td>
                            <td style="width:1%">
                                <gw:imgbtn img="save" alt="Search" id="btnSave1" onclick="OnSave('TASK')" />
                            </td>
                        </tr>
                        <tr style="height: 59%">
                            <td colspan="10">
                                <gw:grid id='grdTasks' 
								header='_pk|_JOB_PK|Staff|Date|Seq|Status|Task|Note' 
								format='0|0|0|4|0|0|0|0' 
								aligns='0|0|0|1|1|1|0|0'
                                check='|||||||' 
								editcol='0|0|1|1|1|0|1|1' 
								widths='0|0|1500|1500|800|1200|3500|1000' 
								acceptnulldate="T"
								sorting='T' styles='width:100%; height:100%'								 
                                />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table> 
    <!------------------------------------------->
    <gw:textbox id="txtSitePK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtJobPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
