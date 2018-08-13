<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>
</head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//----------grdEmployee-----
//'_PK|Organization|Emp ID|Employee Name|Postion Name|Job Name|_TLG_ITEM_PROCESS|Item Code|Item Name|Process Name|Unit Price
//|Quantity|Amountl|Remark'
var G1_PK          = 0,
    G1_ORGANIZATION    = 1,
	G1_THR_EMP_PK  = 2,
	G1_EMP_ID	   = 3,
    G1_EMP_NAME   = 4,
    G1_POSITION   = 5,
    G1_JOB         = 6, 
    G1_ITEM_PROCESS_CODE = 7,
	G1_ITEM_CODE	= 8,	
    G1_ITEM_NAME       = 9,
	G1_PROCESS_NAME  = 10,
	G1_WORK_DATE	= 11,
	G1_UNIT_PRICE = 12,
	G1_QUANTITY = 13,
	G1_AMOUNT = 14,
	G1_REMARK = 15;
//---------------
 

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
       	
    data = "<%=CtlLib.SetListDataSQL("select a.pk, a.process_id || ' - ' || a.process_name from tlg_pb_process a where a.del_if=0 order by a.process_name" )%>||" ; 
    lstProcess.SetDataText(data);	
    lstProcess.value = "";
	
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select a.pk, a.item_process_code from tlg_item_process_price a where a.del_if=0 order by a.item_process_code" )%>|#;" ; 
    grdEmployee.SetComboFormat(G1_ITEM_PROCESS_CODE,data); 
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	ChangeColorItem(lstOrg.GetControl());
	
    var ctrl = grdEmployee.GetGridControl();
    ctrl.ColFormat(G1_UNIT_PRICE) = "###,###,###" ;  

	var now = new Date(); 
	var ldate;

	ldate=dtFrom.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	dtFrom.value=ldate ;
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdEmployee' :
			data_hrpr00400.Call('SELECT');
		break;
		
	}
}
function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "0066CC";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "FF4500";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                    }
                }                
            }
        }
    }
//=======================================================================
function OnAddNew(pos)
{
	switch ( pos )
	{
		case 'grdEmployee' :
			var path = System.RootURL + '/standard/forms/hr/pr/hrpr00401.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdEmployee.AddRow();                            
                            
							grdEmployee.SetGridText( grdEmployee.rows-1, G1_THR_EMP_PK,  arrTemp[0]); //Emp_pk	
                            grdEmployee.SetGridText( grdEmployee.rows-1, G1_ORGANIZATION,arrTemp[3]); //Org_Name	    
                            grdEmployee.SetGridText( grdEmployee.rows-1, G1_EMP_ID,      arrTemp[1]);//Emp_ID	    
                            grdEmployee.SetGridText( grdEmployee.rows-1, G1_EMP_NAME,    arrTemp[2]);//Emp_Name	    
							
                            grdEmployee.SetGridText( grdEmployee.rows-1, G1_ITEM_PROCESS_CODE,    arrTemp[10]);//Emp_Name	    
                    }	
             }        
		break;	
			
	}
}

//=======================================================================
function OnDelete(ogrid)
{
    if( confirm('Do you want to delete?'))
	{
		grdEmployee.DeleteRow();
		data_hrpr00400.Call();
	}    
}



//=======================================================================
function OnSave(pos)
{
	switch ( pos )
	{
		
		case 'grdEmployee' : 
			if(CheckInput() == true)
				data_hrpr00400.Call();			
		break;

		
	}
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_hrpr00400' :
	        lblRecord.text = grdEmployee.rows - 1 ;
			grdEmployee.Subtotal(0, 2, -1, '13!14');
	    break;
	    case 'datFind_Report' :
        var url = System.RootURL;
        url = url + txtReport_tmp.text + '?l_org_pk=' + lstOrg.value + '&l_emp_id=' + txtEmployee.text + '&l_item_name=' + txtItem.text + '&l_process=' + lstProcess.value + '&l_from=' + dtFrom.value + '&l_to=' + dtTo.value ;
        window.open(url);
    	
    }
}
function OnDataError(obj) 
{
	
	if(obj.id == "data_hrpr00400")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	
}


//==================================================================================
function CheckInput()
{   
    
	for(var i= 1; i < grdEmployee.rows ; i++)
	{
		if(grdEmployee.GetGridData(i,G1_ITEM_PROCESS_CODE)== "")
		{ 
			alert("You have input item process code");
			return false;
		}
		if(grdEmployee.GetGridData(i, G1_QUANTITY)=="")
		{
			alert("You have input quantity");
			return false;
		}
	}
    return true;
      
	
}
function Ondoubleclick()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_ITEM_CODE || col == G1_ITEM_NAME)
    {
        var path = System.RootURL + '/standard/forms/hr/pr/hrpr00402.aspx?group_type=|Y|||Y|Y';
        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		
		if (obj!=null)
		{
			grdEmployee.SetGridText(row, G1_ITEM_PROCESS_CODE, obj[0]);
			grdEmployee.SetGridText(row, G1_ITEM_CODE, obj[3]);
			grdEmployee.SetGridText(row, G1_ITEM_NAME, obj[4]);
			grdEmployee.SetGridText(row, G1_PROCESS_NAME, obj[5]);
			grdEmployee.SetGridText(row, G1_UNIT_PRICE, obj[6]);
		}
		
    }
}
function OnReport()
{
    txtReportCode_tmp.text = "/standard/reports/hr/pr/rpt_hrpr00400_0.aspx";
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();                  
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_FIND_REPORT_2" > 
                <input>
                    <input bind="txtReportCode_tmp" /> 
					<input bind="txtOrg_tmp_pk" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!------------------------------------------------------------------>
<gw:data id="data_hrpr00400" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	<xml> 
		<dso type="grid" parameter="0,2,7,11,13,15" function="st_lg_sel_hrpr00400" procedure="st_lg_upd_hrpr00400"> 
			<input bind="grdEmployee" > 
				<input bind="lstOrg" />
				<input bind="txtEmployee" />	
				<input bind="txtItem" />	
				<input bind="lstProcess" />		
				<input bind="dtFrom" />		
				<input bind="dtTo" />		
			</input> 
			<output bind="grdEmployee" /> 
		</dso> 
	</xml> 
</gw:data>

<table name="Process" class="table" style="width: 100%; height: 100%" border="1">
	<tr>
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width: 100%; height: 100%">
							<tr>
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
									Employee
								</td>
								<td colspan=20 width="20%" style="border:0">
									<gw:textbox id="txtEmployee" styles="width:100%" onenterkey="OnSearch('grdEmployee')" />
								</td>								
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
									Item Name
								</td>
								<td colspan=20 width="20%" style="border:0">
									<gw:textbox id="txtItem" text="" styles="width:100%" onenterkey="OnSearch('grdEmployee')" />
								</td>
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
									Process
								</td>
								<td colspan=20 width="20%" style="border:0">
								   <gw:list id="lstProcess"  styles="width:100%" onchange="OnSearch('grdEmployee')" />
								</td>
							</tr>
							<tr>
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
								   <a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0">
									<gw:list  id="lstOrg"  maxlen = "100" styles='width:100%'  />
								</td>
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
									Date
								</td>
								<td colspan=20 width="20%" style="border:0">
									<gw:datebox id="dtFrom"   styles="width:100%"   />
									~
									<gw:datebox id="dtTo"   styles="width:100%"   />
								</td>
								<td colspan=2 width="2%" style="border:0">
								</td>
								<td colspan=10 width="10%" style="border:0">
								</td>
								<td colspan=20 width="20%" style="border:0">
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:100%" valign="center" >
						<td colspan=2 width="2%" style="border:0">
						</td>
						<td colspan=5 width="5%" style="border:0">
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:label id="lblRecord"  text="" maxlen = "100" />
						</td>
						<td colspan=55 width="55%" style="border:0">
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdEmployee')" />
						</td>						
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdEmployee')" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="btnDlete1" img="delete" alt="Delete" onclick="OnDelete(grdEmployee)" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="btnSave1" img="save" alt="Save" onclick="OnSave('grdEmployee')" />
						</td>
						<td colspan=5 width="5%" style="border:0">
						   <gw:button id="btnReport" img="excel" text="Report" alt="Report" onclick="OnReport()" />
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
				<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >
					<tr style="height:100%">
						<td id="master" width="100%">
							<gw:grid id='grdEmployee' 
								header='_PK|Organization|_THR_EMP_PK|Emp ID|Employee Name|_Postion Name|_Job Name|Item Process Code|Item Code|Item Name|Process Name|Work Date|Unit Price|Quantity|Amount|Remark'
								format='0|0|0|0|0|0|0|0|0|0|0|4|-0|-0|-0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								defaults='|||||||||||||||' 
								editcol='0|0|0|0|0|0|0|1|0|0|0|1|1|1|0|1'
								widths='1000|2500|0|1500|2500|3000|800|2000|1500|1000|1500|1500|1500|1500|1500|1500' 
								sorting='T' styles='width:100%; height:100%'
								autosize= true
								oncelldblclick="Ondoubleclick()"
								/>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>	
</table>

<!-- </gw:tab> -->
<!----------------------------------------------------------->
<gw:textbox id="txtProcessPK" text="" styles="display:none" />
<gw:textbox id="txtSTItemPK" text="" styles="display:none" />
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/> 
<!----------------------------------------------------------->
</body>
</html>
