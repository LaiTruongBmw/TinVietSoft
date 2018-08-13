<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var check_init=0;
var dept,grp,flag=0;
var flag_wg=1;
var flag_tab=1;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
    //System.Translate(document);	
	System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	idDBUSR.text= "<%=session("APP_DBUSER")%>";
    menu_id.text=System.Menu.GetMenuID();

	var now = new Date(); 
	var ldate;
	ldate=FromDT.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	FromDT.value=ldate ;
	
    <%=CtlLib.SetGridColumnComboFormat( "idGrid" , 4 , "select CODE,CODE_NM from VHR_HR_CODE WHERE ID='HR0034' ORDER BY CODE") %>;    
    <%=CtlLib.SetGridColumnComboFormat( "idGrid" , 6 , "select CODE,CODE_NM from VHR_HR_CODE WHERE ID='HR0040' ORDER BY CODE") %>;  
    <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 7 , "Y|YES|N|NO") %>; 
    
    
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRPM00500', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
    
      
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg.SetDataText(data);
    lstOrg.value ="ALL";  
	ChangeColorItem(lstOrg.GetControl());
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstWG.SetDataText(data);
    lstWG.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstStatus.SetDataText(data);
    lstStatus.value ="A";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0034', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstType.SetDataText(data);
    lstType.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstNation.SetDataText(data);
    lstNation.value ="01";
    
    datCheck_View.Call();
    //fyzas
}

//----------------------------------
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

//----------------------------------------------
function OnDataReceive(obj)
{
    if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                ibtnAdd.style.display = "none";
                ibtnSave.style.display = "none";
                ibtndel.style.display = "none";

                ibtnProcess.style.display = "none";
                ibtnSaveImport.style.display = "none";
            }
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }
            check_init=1;
       }
    else if (obj.id=="datSalary_Adjust")
       {            
			idRecord.text= idGrid.rows-1 ;		
       }
	else if (obj.id=="datUser_info")  
	{
		onChange_org(1,lstOrg);
        check_init=1;
	}
	else if (obj.id=="datWorkGroup_info")
   {
		
		lstWG.SetDataText(txtwg_tmp.text + (v_language =="ENG")?"|ALL|Select All":"|ALL|Tất cả");
        lstWG.value='ALL';
		check_init=1;
	}	
	else if (obj.id == "datFind_Report") {
	    var url = System.RootURL;

	    switch (txtReportCode_tmp.text) {
	        case "204":
	            url = url + txtReport_tmp.text + '?p_from=' + FromDT.value + '&p_to=' + ToDT.value + '&p_adj_type=' + lstType.value + '&org_type=' + lstWG.value + '&p_tco_org_pk=' + lstOrg.value + '&p_search_temp=' + idtxtTmp.text + '&p_nation=' + lstNation.value;
	            break;
	        case "205":
	            url = url + txtReport_tmp.text + '?p_from=' + FromDT.value + '&p_to=' + ToDT.value + '&p_adj_type=' + lstType.value + '&org_type=' + lstWG.value + '&p_tco_org_pk=' + lstOrg.value + '&p_search_temp=' + idtxtTmp.text + '&p_nation=' + lstNation.value;
	            break;
	        case "206":
	            url = url + txtReport_tmp.text + '?';
	            break;

	    }
	   
	    window.open(url);
	}
	   
    
}      
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}

function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
	
    if (obj!=null)
    {
        lstOrg.value=obj
		onChange_org(1,lstOrg);
       
    }
    
}
function OnSearch()
{
	if(check_init==1)
		datSalary_Adjust.Call("SELECT");
}
function onAdd()
{
	if(check_init==1)
	{
		if(lstType.value=="ALL")
		{
			alert((v_language =="ENG")?"You must choose type adjust":"Bạn phải chọn kiểu điều chỉnh")
			return;
		}
		var fpath = System.RootURL + "/standard/forms/hr/pm/hrpm00501.aspx?";
		var aData=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:30;edge:sunken;scroll:yes;unadorned:yes;help:no');
		//var obj=System.OpenModal( fpath ,500, 400 ,  'resizable:yes;status:yes',this);
		if ( aData != null )
		{  	 
			var len=aData.length;
			var i;
			for (i=0;i<len-1;i++)		
			{
					idGrid.AddRow();
					var irow=idGrid.rows-1;
					aRow=aData[i];
					idGrid.SetGridText(irow,0,aRow[0]);		// group
					idGrid.SetGridText(irow,1,aRow[1]);		// emp id
					idGrid.SetGridText(irow,2,aRow[2]);		// name 
					idGrid.SetGridText(irow,3,aRow[3]);		// dt
					idGrid.SetGridText(irow,4,lstType.value);		// adj type
					idGrid.SetGridText(irow,6,'01');		
					idGrid.SetGridText(irow,7,'Y');		
					idGrid.SetGridText(irow,9,aRow[4]);		// emp_pk
			}
			if(len>0)
			{
					aRow=aData[len-1];
					dept=aRow[0];
					grp=aRow[1];
					FromDT.value=aRow[4];//from dt
					ToDT.value=aRow[4];//to date
				if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
				{
					  flag=1;
					  datUser_info.Call();
				}      
				else
				{
					
					lstOrg.SetDataText("<%= CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where del_if=0 order by a.seq ")%>" + '|ALL|Select All');    
					lstWG.SetDataText("<%= CtlLib.SetListDataSQL("SELECT pk,workGroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workGroup_NM")%>" + '|ALL|Select All');
					lstOrg.value=aRow[0]; //dept
					lstWG.value=aRow[1]; //grp
				   
				}
			 }   
		}	
	}	
 }
 //-----------------------------------------------
function Numbers(e) 
{ 
  //  var ctrl=idTEL.GetControl(); 
    var keynum; 
    var keychar; 
    var numcheck; 
    keynum =event.keyCode; 
        
    if(window.event) // IE 
    { 
      keynum = e.keyCode; 
    } 
    else if(e.which) // Netscape/Firefox/Opera 
    { 
      keynum = e.which; 
    } 
    keychar = String.fromCharCode(keynum); 
    numcheck = /\d/; 
    return numcheck.test(keychar); 
}
function OnSetToGrid(n)
{
    ctrl=idGrid.GetGridControl();
    if(n==1)//amount
    {
        if(idAmount.text=="")
            return;
        if(idGrid.rows>1)
        {  
             if (ctrl.SelectedRows>1) 
             {
                   for(var i=0;i<ctrl.SelectedRows;i++)
                       idGrid.SetGridText(ctrl.SelectedRow(i),5,idAmount.text);
             }
             else       
             {
                for(var i=1;i<ctrl.rows;i++)
                {
                    if(idGrid.GetGridData(i,5)=="")
                         idGrid.SetGridText(i,5,idAmount.text);
                }           
             }
         }
    }
    else
    {
        if(idNote.text=="")
            return;
        if(idGrid.rows>1)
        {  
             if (ctrl.SelectedRows>1) 
             {
                   for(var i=0;i<ctrl.SelectedRows;i++)
                       idGrid.SetGridText(ctrl.SelectedRow(i),8,idNote.text);
             }
             else       
             {
                for(var i=1;i<ctrl.rows;i++)
                {
                    if(idGrid.GetGridData(i,8)=="")
                         idGrid.SetGridText(i,8,idNote.text);
                 }           
             }
        }
    }
    
}
function OnSave()
{
	if(check_init==1)
		datSalary_Adjust.Call();
}
function OnDelete()
{
	if(check_init==1)
	{
		if(confirm((v_language =="ENG")?"Do you want delete?":"Bạn muốn xóa?"))
			idGrid.DeleteRow();
	}		
}
function OnReport(num)
{
	if(check_init==1)
	{
		txtReportCode_tmp.text = lstReport.value;
		txtOrg_tmp_pk.text = lstOrg.value;
		datFind_Report.Call();
	}	
}

function OnImportNew()
{
	var currentTime = new Date();		
	txtSequence.text = currentTime.getTime();
	var p_cols;
   // alert(txtSequence.text);
	
	// argument fixed table_name, procedure, procedure_file
	// dynamic arg p_1,p_2,p_3,p_4,p_5
	if (lstType.value == 'ALL')
	{
		alert((v_language =="ENG")?"Please, select adjust type":"Vui lòng chọn kiểu điều chỉnh");
		return;
	}
	p_cols=7;
	var url =System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text +  '&procedure=ST_HR_PRO_CO_INSERT_IMAGE' + '&procedure_file=ST_HR_PRO_HRPM00500_0' 
		+ '&p_1=' + lstType.value + '&p_2=' + '&p_3=' + '&p_4=' + '&p_5=' + '&p_cols=7';
	//alert(url);
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
	
	if (txtRecord.text != 'undefined')
	{
		alert((v_language =="ENG")?"Rows imported : ":"Số dòng đã cập nhật : " + txtRecord.text );
	}
    datImportNew.Call("SELECT");

}





</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<gw:data id="datCheck_View" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_VIEW"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------main control---------------------->
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datSalary_Adjust" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="2,3,4,5,6,7,8,9,10" function="ST_HR_SEL_HRPM00500_0" procedure="ST_HR_UPD_HRPM00500_0"> 
                <input bind="idGrid" >
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="lstType" />
                    <input bind="FromDT" />
                    <input bind="ToDT" />
                    <input bind="idtxtTmp" />
                    <input bind="lstNation" />
                    <input bind="lstStatus" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datImportNew" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRPM00500_1" > 
                <input bind="idGrid" >
                    <input bind="txtSequence" />    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
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


<!--------------------main table--------------------------------->
<table  width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>				
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="idtxtTmp" onenterkey   ="OnSearch()" styles="width:100%"/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Nation
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list id="lstNation" value="01"  maxlen = "100" styles='width:100%' />
									</td>									
								</tr>
								<tr style="border:0.5;width:100%;height:4%;" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										 <gw:list  id="lstOrg" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org(1,lstOrg);" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Adjust Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="FromDT"  styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="ToDT"  styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>	
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Adjust Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list id="lstType" value='ALL' styles='width:100%' />
									</td>
								</tr>
								<!--fyzas-->
								<tr style="border:0.5;width:100%;height:4%;display:none" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Set Amount
									</td>
									<td colspan=15 width="15%" style="border:0" align="left">
										<gw:textbox id="idAmount" maxlen = "10" styles="width:100%" onkeypress="return Numbers(event)" onenterkey="OnSetToGrid(1)" />
									</td>
									<td colspan=5 width="5%" style="border:0" align="left">
										<gw:button id="ibtnSet1" alt="Set Grid" img="set" text="Set Grid" onclick="OnSetToGrid(1)" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Set Note
									</td>
									<td colspan=15 width="15%" style="border:0" align="left">
										<gw:textbox id="idNote" maxlen = "100" styles="width:100%"  onenterkey="OnSetToGrid(2)" />
									</td>
									<td colspan=5 width="5%" style="border:0" align="left">
										<gw:button id="ibtnSet2" alt="Set Grid" img="set" text="Set Grid" onclick="OnSetToGrid(2)" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
									
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							
							<td colspan=2 width="2%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=40 width="40%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="ibtnSearch" img="search" text="Search" onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="ibtnAdd" alt="Add" img="new" text="Add New" onclick="onAdd()" />
							</td>
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="idBtnImp" img="attach" text="Get file" onclick="OnImportNew()" />
							</td>
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="ibtnSave" img="save"   text="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="ibtndel" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" />
							</td>
							
							<td colspan=5 width="5%" style="border:0">
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport(1)"/>
							</td>														
							<td colspan=10 width="10%" style="border:0"> 										
								<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:100%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
								id="idGrid"  
								header="Organization|Emp ID|Full Name|Date|Adj Type|Amount|Money Kind|Tax Y/N|Note|_emp_pk|_pk|Left Date"   
								format="2|2|2|4|0|1|0|0|0|0|0|4"  
								aligns="2|0|2|0|1|0|1|1|1|0|0|0"  
								defaults="|||||||||||"  
								editcol="1|0|0|0|1|1|1|1|1|0|0|0"  
								widths="3000|1500|3000|1500|1500|2000|1500|1500|4000|0|0|1200"  
								styles="width:100%; height:100% "   
								sorting="T" 
								acceptnulldate  
								oncellclick     = ""/>
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>

   <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
	<gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/> 
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
    <gw:textbox id="txtSequence" text="" styles="display:none"  />
    <gw:textbox id="txtRecord" text="" styles="display:none"  />
    <gw:textbox id="idDBUSR" text="" styles="display:none"  />
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
	
	<gw:list  id="lstWG" value="ALL" maxlen = "100" styles='width:100%;display:none' />
</body>
</html>

