<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Working Tasks Entry</title>
</head>
<%  
 CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_TASK_PK   = 0,
    G_SITE  	= 1,
    G_WORK_DT 	= 2,
    G_SEQ      	= 3,     
    G_PLAN     	= 4, 
    G_STATUS   	= 5, 
    G_EMP_NOTE 	= 6; 

var G1_SM_SITE_TASK_PK  = 0,
    G1_SITE             = 1,                   
    G1_JOB_PK           = 2,
    G1_JOB              = 3,
    G1_STAFF_ID         = 4,
    G1_STAFF_NAME       = 5,
    G1_DATE             = 6,
	G1_DURATION			= 7,
    G1_STATUS           = 8,
    G1_NOTE             = 9;
    
var flag = 'VIEW';
var cur_date = "" ;
//====================================================================================================================
function BodyInit()
{  
    var fdate = dtFrom2.value ;         
    fdate = fdate.substr(0,4) + fdate.substr(4,2) + '01' ;
    dtFrom2.value = fdate ; 
    
    cur_date = dtFrom.GetData();
	
   	dtTo.SetDataText(System.AddDate(dtFrom.GetData(),7));
	dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-14));
	
   	//dtTo2.SetDataText(System.AddDate(dtFrom2.GetData(),7));
	//dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-14));
	
    FormatGrid();     
    data_agds00120_2.Call('SELECT');
}
//====================================================================

function FormatGrid()
{
 	var data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGGS0302') FROM DUAL" )%>";
    lstSEmp.SetDataText(data);
	
    data ='DATA|1|PLAN|2|PROCESS|3|TEST|4|FINISH|5|DENY'
    lstStatus.SetDataText(data);         
    
    data ="|#1;PLAN|#2;PROCESS|#3;TEST|#4;FINISH|#5;DENY";
    grdDetail2.SetComboFormat(G1_STATUS,data);
    
    data = "<%=CtlLib.SetListDataSQL("SELECT a.pk, a.site_name  FROM sm_site a WHERE a.del_if = 0 order by a.site_name " )%>||";    
    lstSite.SetDataText(data);
    lstSite.value = '';
    // Logistic code
    data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGGS0302') FROM DUAL" )%>";    
    lstStaff.SetDataText(data);
	
	grdDetail2.GetGridControl().ColFormat(G1_DURATION) = "###,###,###.#";   
}
 
//====================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
	{
		case "data_agds00120" :
	 		if ( grdDetail.rows >1 )
	        {
	          grdDetail.SetCellBold( 1, G_WORK_DT, grdDetail.rows-1, G_WORK_DT, true );		  
			  
	          grdDetail.SetCellBgColor( 1, G_PLAN , grdDetail.rows - 1, G_PLAN , 0xCCFFFF );
			  
	          grdDetail.GetGridControl().Cell( 7, 0, G_STATUS, grdDetail.rows - 1, G_STATUS ) = 0x3300cc;
	        }		
		break;
		
		case "data_agds00120_1" :
			if(flag == "SAVE")
	        {
	           flag = 'VIEW';  
	           data_agds00120.Call('SELECT');          
	        }    		
		break;
		
		case "data_agds00120_2" :		   
			data_agds00120_4.Call('SELECT')
		break;
		
		case "data_agds00120_3":
		    var total = 0;
		    var dura;
		    for(var i = 1; i < grdDetail2.rows; i++)
		    {
		        dura = grdDetail2.GetGridData( i, G1_DURATION);
		        if(!isNaN(dura) && dura != "")
		        {
		            total += Number(dura);
		        }    
		    }
		    if(!isNaN(total))
		    {
		        var myResult = total%8;
		        lblDuration.text = (total - myResult)/8 + " days " + myResult.toFixed(1) + " hours" ; 
		    }    
		break;
	}	          
}
//====================================================================
function OnAddNew()
{
	if ( lstJob.value == "" )
	{
		alert("PLS SELECT ONE JOB FIRST !");
		return;
	}
	else if ( lstStaff.value == "" ) 
	{
		alert("PLS SELECT ONE STAFF !");
		return;
	}
	
    grdDetail2.AddRow();
    grdDetail2.SetGridText(grdDetail2.rows-1, G1_SITE,       lstSite.GetText()  );
    grdDetail2.SetGridText(grdDetail2.rows-1, G1_JOB_PK,     lstJob.value       );
    grdDetail2.SetGridText(grdDetail2.rows-1, G1_JOB,        lstJob.GetText()   );
	
	grdDetail2.SetGridText(grdDetail2.rows-1, G1_DATE,       cur_date   );
	
    grdDetail2.SetGridText(grdDetail2.rows-1, G1_STAFF_ID,   lstStaff.value     );
    grdDetail2.SetGridText(grdDetail2.rows-1, G1_STAFF_NAME, lstStaff.GetText() );
}
//====================================================================

function OnSearch(pos)
{  
   	switch(pos)
	{
		case 'SEARCH' :
			data_agds00120.Call("SELECT");
		break;
		
		case 'TASK' :
			txtMasterPK.text = grdDetail.GetGridData( grdDetail.row, G_TASK_PK);  
   			data_agds00120_1.Call("SELECT");		
		break;
		
		case '2':		
		    data_agds00120_3.Call("SELECT");
		break;
	}	   
}
//====================================================================

function OnSave(pos)
{
	switch(pos)
	{
		case '1' :
			flag = 'SAVE';
        	data_agds00120_1.Call();		
		break;
			
		case '2':
			data_agds00120_3.Call();
		break;	
	}  
}
//====================================================================

function OnPopUp(pos)
{ 
	switch(pos)
	{
		case 'TASK_SCHEDULE' :
			var path = System.RootURL + "/standard/forms/ag/ds/agds00140.aspx";
 			var object = System.OpenModal( path ,1000 , 500 ,  'resizable:yes;status:yes');	   
		break;
	}
}
//====================================================================
function OnDelete(pos)
{
	grdDetail2.DeleteRow();
}
//====================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_agds00120_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_SEL_AGDS00120_2" > 
                <input>
                    <input bind="lstSite" /> 
                </input> 
                <output>
                    <output bind="lstJob" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_agds00120_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_SEL_AGDS00120_4" > 
                <input>
                    <input bind="lstSite" /> 
                </input> 
                <output>
                    <output bind="lstStaff" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00120_3" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_lg_sel_agds00120_3" procedure="st_lg_upd_agds00120_3">	
				<input	bind="grdDetail2">					
					<input bind="dtFrom2" />
                    <input bind="dtTo2" />
                    <input bind="lstSite" />	
                    <input bind="lstJob" />	
                    <input bind="lstStaff" />	
				</input>	
				<output	bind="grdDetail2"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agds00120_1" procedure="st_lg_upd_agds00120_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
					
                    <inout bind="lbDate" />  
                     
                    <inout bind="lbStaff" />
					<inout bind="lbSite" />					
					
					<inout bind="dtTask" />
                    <inout bind="lstStatus" />					
                    <inout bind="dtEmpNote" />   
					
					<inout bind="txtDuration" />					
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="data_agds00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_agds00120" > 
                <input bind="grdDetail"  > 
                    <input bind="dtFrom" />	
                    <input bind="dtTo" />	
                    <input bind="lstSEmp" />	
                </input> 
                <output bind="grdDetail" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------- MainTable -------------------------->
    <gw:tab id="tab">
	<table name="Tasks Entry" style="height: 100%; width: 100%" border="0">
        <tr style="height:1%">
            <td align="right" style="width: 5%; white-space: nowrap">
                 Date
            </td>
            <td style="width: 15%; white-space: nowrap">
                 <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                 ~
                 <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
            </td>
            <td  align="right" style="width:5%">
                Site
            </td>
            <td style="width:20%">
                <gw:list id="lstSite" styles="width:100%;" onchange="data_agds00120_2.Call('SELECT');" />
            </td>
            <td style="width:25%">
                <gw:list id="lstJob" styles="width:100%;" />
            </td>
            <td  align="right" style="width:5%">
                Staff
            </td>
            <td style="width:15%">
                <gw:list id="lstStaff" styles="width:100%;" />
            </td>
			<td style="width:1%; white-space:nowrap">
                 <gw:label id="lblDuration" styles='width:100%;color:cc0000;font:9pt' />
            </td>			
            <td style="width:1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('2')" />
            </td>
            <td style="width:1%">
                <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew('2')" />
            </td>
			<td style="width:1%">
                <gw:imgbtn img="delete" alt="New" id="btnDelete1" onclick="OnDelete('2')" />
            </td>
            <td style="width:1%">
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('2')" />
            </td>
        </tr>
        <tr style="height:99%; width: 100%">
            <td colspan="13" >
                <gw:grid id='grdDetail2'
                header='_pk|Site Name|_job_pk|Job ID|_Staff ID|Staff|Work Date|Duration|Status|Tasks Note'
                format='0|0|0|0|0|0|4|1|0|0'
                aligns='0|0|0|0|0|0|1|3|1|0' 
                editcol='0|0|0|0|0|0|1|1|1|1'
                widths='0|2000|0|4000|0|1500|1200|1000|1200|2000'
                sorting='T'
                autosize = 'true'
                styles='width:100%; height:100%'
				acceptnulldate="T"
                />
            </td>
        </tr>
    </table>	
    <table name="Tasks Plan" style="height: 100%; width: 100%" border="1">
        <tr>
            <td style="height: 100%; width: 50%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td width="5%">
                            Emp
                        </td>
                        <td width="40%"  >
                            <gw:list id="lstSEmp" maxlen="100" styles='width:100%' onchange="OnSearch('SEARCH')" />
                        </td>
						<td style="width: 8%">                             
                        </td>
						<td style="width: 1%">
                            <gw:imgbtn id="ibnModify" img="adjust" alt="Modify" styles='width:100%' onclick="OnPopUp('TASK_SCHEDULE')" />
                        </td>
						<td style="width: 1%">
                            <gw:imgbtn id="ibnSearch1" img="search" alt="Search" styles='width:100%' onclick="OnSearch('SEARCH')" />
                        </td>
                    </tr>                    
                    <tr style="height: 99%; width: 100%">
                        <td colspan="9">
                            <gw:grid id='grdDetail' header='_PK|Site|Date|SEQ|Plan Task|Status'
                                format='0|0|4|0|0|0' aligns='0|0|1|1|0|1' check='|||||' editcol='0|0|0|0|0|0'
                                widths='0|1500|1500|800|3500|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('TASK')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table style="height: 100%; width: 100%; background-color: #B4E7FF" >                     
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Emp
                        </td>
                        <td style="width: 20%;">
							<gw:label id="lbStaff" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 30%; white-space: nowrap">                             
							<gw:label id="lbDate" styles='width:60%;color:cc0000;font:9pt' />  							 
                        </td>                         
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 25%" align="right">
                            <gw:list id="lstStatus" maxlen="100" styles='width:100%' />
                        </td>
						<td style="width: 10%" align="right">
                            <gw:imgbtn id="ibnUpdate02" img="save" alt="save"  onclick="OnSave('1')" />
                        </td>
                    </tr>
					<tr style="height: 1%">
						<td colspan="7">
                           	<hr noshade size="1" style="color: Silver" />
                       	</td>
					</tr>
					<tr style="height: 1%">
                        <td colspan="2" align="left" style="color:purple">
                            Plan Desc
                        </td> 
						<td style="width: 5%" align="right" >
							Job
						</td> 
						<td colspan="4">
							<gw:label id="lbSite" styles='width:100%;color:cc0000;font:9pt' />
						</td>                     
                    </tr>
                    <tr style="height: 47%">                        
                        <td colspan="7">
                            <gw:textarea id="dtTask" styles="width:100%;height:98%"> </gw:textarea>
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td colspan="2" align="left" style="color:purple" >
                            Emp Note
                        </td>  
						<td style="width: 5%" align="right" >
							Duration
						</td> 
						<td colspan="4">
							<gw:textbox id="txtDuration" styles='width:100%'   />
						</td> 						
                    </tr>    
                    <tr style="height: 49%">                         
                        <td colspan="7">
                            <gw:textarea id="dtEmpNote" styles="width:100%;height:98%"> </gw:textarea>
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>    
    </gw:tab>
</body>
<!---------------------------------------------------------------->
<gw:textbox id="txtMasterPK" style="display: none" />
<!---------------------------------------------------------------->
</html>
