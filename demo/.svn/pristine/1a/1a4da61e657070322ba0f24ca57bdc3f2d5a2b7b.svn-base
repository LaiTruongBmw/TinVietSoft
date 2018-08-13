<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser("hr")%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Att&Asb Change Management</title>
</head>
<script>
var sun_day=new Array();
var mon_day=new Array();
var sun_col=new Array();
var dem_sun,dem_mon,dem_sun_col;
var dt_tmp;
var user;
var flag_header = true;
var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;
var binit=true;
//_EMP_PK|ORGANIZATION|WGROUP|EMP_ID|FULL_NM|WORK DATE|SHIFT|MOD BY|MOD DATE|IN|OUT|WT|OT|NT|NT2|HT|IN|OUT|WT|OT|NT|NT2|HT|REMARK|TYPE|TIME|TYPE|TIME|MOD BY|MOD DATE|REMARK
var c_org = 1,
    c_group = 2,
    c_emp_id = 3,
    c_full_nm = 4,
    c_work_dt = 5,
    c_shift = 6,
    c_mod_by = 7,
    c_mod_dt = 8,
    c_in_old = 9,
    c_out_old = 10,
    c_wt_old = 11,
    c_ot_old = 12,
    c_nt_old = 13,
    c_nt2_old = 14,
    c_ht_old = 15,
    c_in = 16,
    c_wt = 17,
    c_out = 18,
    c_ot = 19,
    c_nt = 20,
    c_nt2 = 21,
    c_ht = 22,
    c_remark_att = 23,
    c_abs_type_old = 24,
    c_abs_time_old = 25,
    c_abs_type = 26,
    c_abs_time = 27,
    c_mod_by_abs = 28,
    c_mod_dt_abs = 29,
    c_remark_abs = 30

function BodyInit()
{
    var t;
    //if (v_language!="ENG")
        System.Translate(document);	
	idGrid.GetGridControl().FrozenCols =6;
    idGrid_1.GetGridControl().FrozenCols =6;
	idGrid.GetGridControl().ScrollTrack=true;
    idGrid_1.GetGridControl().ScrollTrack=true;
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";
    user= "<%=session("USER_ID")%>";
    SetGridHeader(idGrid);
	flag_header=true;
	SetGridHeader(idGrid_1);
	OnChange_ModData(idGrid,idModData);
	OnChange_ModData(idGrid_1,idModData_1);
    idGrid.GetGridControl().ScrollTrack=true;
    idGrid.GetGridControl().FrozenCols =6;

    ChangeColorItem(lstOrg.GetControl());
    
    t = "<%=CtlLib.SetGridColumnDataSQL("select A.PK,A.SHIFT from THR_WORK_SHIFT A where a.del_if=0 AND A.USE_YN='Y' ORDER BY A.SHIFT")%>";
    idGrid.SetComboFormat(c_shift,t);
    t = "<%=CtlLib.SetGridColumnDataSQL("select A.PK,A.SHIFT from THR_WORK_SHIFT A where a.del_if=0 AND A.USE_YN='Y' ORDER BY A.SHIFT")%>";
    idGrid_1.SetComboFormat(c_shift,t);
    
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}
	else
		binit=false;
	 

}
//-----------------------------------------------------------------------------------
function SetGridHeader(grdctl)
{
    var stt;
    var fg = grdctl.GetGridControl();
    if (flag_header==true)
    {
        fg.rows=fg.rows+1;
        flag_header=false;
    }
    
    fg.FixedRows = 2;
    fg.FixCols = 1;
    fg.MergeCells = 5;
    stt = 0;    //num column

    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "_Emp_PK";  //fg.Cell(CellPropertySettings,row, from_col, row, to_col)	
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Organization";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Work Group";

    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Emp ID";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Full Name";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Work Date";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Shift";

    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Modify By";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Modify Date";
    
    fg.MergeRow(0) =true	;
    stt+=1;

    fg.Cell(0, 0, stt, 0, stt+7)  = "OLD-ATTENDANCE";   
    //idGrid1.SetCellBgColor(0, stt,0, stt+7, 0x99FF99);
    //idGrid1.SetCellBgColor(1, stt,1, stt+7, 0x99FF99);
        
    fg.Cell(0,1,stt,1,stt) = "IN";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "OUT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "WT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "OT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "NT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "NT2";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "HT";

    fg.MergeRow(0) =true;
    stt+=1;
    
    fg.Cell(0, 0, stt, 0, stt+7)  = "NEW-ATTENDANCE";   
    //idGrid1.SetCellBgColor(0, stt,0, stt+6, 0x99FF99);
    //idGrid1.SetCellBgColor(1, stt,1, stt+6, 0x99FF99);
        
    fg.Cell(0,1,stt,1,stt) = "IN";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "OUT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "WT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "OT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "NT";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "NT2";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "HT";

    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Remark";

    fg.MergeRow(0) =true;
    stt+=1;
    
    fg.Cell(0, 0, stt, 0, stt+2)  = "OLD-ABSENCE";   
        
    fg.Cell(0,1,stt,1,stt) = "Type";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "Time";

    fg.MergeRow(0) =true;
    stt+=1;
    
    fg.Cell(0, 0, stt, 0, stt+2)  = "NEW-ABSENCE";   
        
    fg.Cell(0,1,stt,1,stt) = "Type";
    
    stt+=1;
    fg.Cell(0,1,stt,1,stt) = "Time";

    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Modify By";
    
    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Modify Date";

    stt+=1;
    fg.MergeCol(stt) = true;
    fg.Cell(0,0,stt,1,stt) = "Remark";

    grdctl.SetCellBold(1,0,1,stt,true);
    grdctl.SetCellBold(0,0,1,stt,true);
}
//-----------------------------------------------
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


//-------------------------------------------------
function OnChangeDept(depObj)
{
    txtDept.text=depObj.value;
    //datGroupData.Call();
}
//-------------------------------------------------
function OnDataReceive(obj)
{
    var obj_lst;
    if (obj.id=="datDeptData")
    {
        if(txtHr_level.text=="6")
            txtDeptData.text=txtDeptData.text+"|ALL|Select All";   
            
                lstOrg.SetDataText(txtDeptData.text);
                txtDept.text=lstOrg.value;
             
        //datGroupData.Call();
    }
    else if (obj.id=="datWorkGroup_info")
    {
        if (binit==true)  
        {
			
			lstWG.SetDataText(txtwg_tmp.text+'|ALL|Select All');
			lstWG.value='ALL';
			lstWG_1.SetDataText(txtwg_tmp.text+'|ALL|Select All');
			lstWG_1.value='ALL';
			binit=false;
		}
		else
		{
			var icurpage=tabMain.GetCurrentPageNo();
			if (icurpage==0)
			{
				lstWG.SetDataText(txtwg_tmp.text+'|ALL|Select All');
				lstWG.value='ALL';
			}
			else
			{
				lstWG_1.SetDataText(txtwg_tmp.text+'|ALL|Select All');
				lstWG_1.value='ALL';
			}
			
		}

    }
    else if (obj.id=="datUser_info")
    {
        lstOrg.SetDataText(txtdept_temp.text);            
        lstOrg_1.SetDataText(txtdept_temp.text);     
        txtDept.text=lstOrg.value;

        ChangeColorItem(lstOrg.GetControl());
		ChangeColorItem(lstOrg_1.GetControl());
		txtOrg_tmp.text=lstOrg.value;
        datWorkGroup_info.Call();
        
    }
    else if (obj.id=="datFind_Report")
    {
        var url;
    
        if (rpt_no==1)
            url =System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_user=' + user + '&p_wg=' + lstWG.value +  '&p_input=' + idtxtTmp.text + '&p_tco_org_pk=' + lstOrg.value  + '&p_from=' +  FromDT.value +'&p_to=' + ToDT.value + '&p_pos_type=' + lstPos.value + "&p_emp_type=" + lstEmpType.value + '&p_mod_type=' + idModData.value;
        else
            url =System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_user=' + user + '&p_wg=' + lstWG_1.value +  '&p_input=' + idtxtTmp_1.text + '&p_tco_org_pk=' + lstOrg_1.value  + '&p_from=' +  FromDT_1.value +'&p_to=' + ToDT_1.value + '&p_pos_type=' + lstPos_1.value + "&p_emp_type=" + lstEmpType_1.value + '&p_mod_type=' + idModData_1.value;
        window.open(url);
    }
    else if (obj.id=="datAtt_Abs_Change")
    {
        SetGridHeader(idGrid);
        idRecord.text = idGrid.rows-2 ;
        
        if (idGrid.rows>2)
		{
			auto_resize_column(idGrid,0,idGrid.cols-1,9);
			var j=idGrid.rows-1;
			idGrid.SetCellBgColor(2, c_mod_by,j, c_mod_dt, 0x66FFFF );
			idGrid.SetCellBgColor(2, c_in_old,j, c_ht_old, 0x66FFFF );
			idGrid.SetCellBgColor(2, c_in,j, c_ht, 0x66FFFF );
			idGrid.SetCellBgColor(2, c_abs_type_old,j, c_abs_time_old, 0x66FFFF );
			idGrid.SetCellBgColor(2, c_abs_type,j, c_abs_time, 0x66FFFF );
			idGrid.SetCellBgColor(2, c_mod_by_abs,j, c_mod_dt_abs, 0x66FFFF );
		}
    }
	else if (obj.id=="datAtt_Abs_Change_1")
    {
        SetGridHeader(idGrid_1);
        idRecord_1.text = idGrid_1.rows-2 ;
        
        
        if (idGrid_1.rows>2)
		{
			auto_resize_column(idGrid_1,0,idGrid_1.cols-1,9)
			var j=idGrid_1.rows-1;
			idGrid_1.SetCellBgColor(2, c_mod_by,j, c_mod_dt, 0x66FFFF );
			idGrid_1.SetCellBgColor(2, c_in_old,j, c_ht_old, 0x99FF99 );
			idGrid_1.SetCellBgColor(2, c_in,j, c_ht, 0xFF99FF );
			idGrid_1.SetCellBgColor(2, c_abs_type_old,j, c_abs_time_old, 0x66FFFF );
			idGrid_1.SetCellBgColor(2, c_abs_type,j, c_abs_time, 0x99FF99 );
			idGrid_1.SetCellBgColor(2, c_mod_by_abs,j, c_mod_dt_abs, 0xFF99FF );
	    }
    }
}   
//-------------------------------------------------
function OnShowPopup(num)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(num==1)
        {
            lstOrg.value=obj
        }
        
        //txtUpperDept.text=obj;
        onChange_org();
    }
    
}
//------------------------------------------------------------  
function OnSearch(obj)
{
	if (binit==false)
	{
		obj.Call("SELECT");
	}
}

//--------------------------------------------
function OnReport(obj)
{
	if (binit==false)
	{
		rpt_no=obj;
		var url;
		
		if (obj==1)
		{
			txtReport_tmp.text="rpt_att_abs_change.aspx";
			txtOrg_tmp.text=lstOrg.value; 
		}
		else
		{
			txtReport_tmp.text="rpt_att_abs_change_his.aspx";
			txtOrg_tmp.text=lstOrg_1.value; 
		}
		
		datFind_Report.Call();
	}
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function onChange_org()
{
	if (binit==false)
	{
		txtOrg_tmp.text=lstOrg.value;
		datWorkGroup_info.Call();
	}
}

function OnChange_ModData(grdctl,modctl)
{
	
		var i;

		if (modctl.value == "1") //Att
		{
			for(i = c_abs_type_old;i<=c_remark_abs;i++)
				grdctl.GetGridControl().ColHidden(i)=true;

			for(i = c_mod_by;i<=c_remark_att;i++)
				grdctl.GetGridControl().ColHidden(i)=false;

		}
		else if (modctl.value == "2")    //Abs
		{
			for(i = c_abs_type_old;i<=c_remark_abs;i++)
				grdctl.GetGridControl().ColHidden(i)=false;

			for(i = c_mod_by;i<=c_remark_att;i++)
				grdctl.GetGridControl().ColHidden(i)=true;
		}
		else
		{
			for(i = c_mod_by;i<=c_remark_abs;i++)
				grdctl.GetGridControl().ColHidden(i)=false;
		}
	
}

//-------------------------------------------------------------------------------------------
</script>
<body>
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_WG_ROLE"  > 
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
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------------------->
<gw:data id="datAtt_Abs_Change" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRMR01000_0" > 
                <input bind="idGrid" >
                   <input bind="lstOrg" />
                   <input bind="lstWG" /> 
                   <input bind="lstPos" /> 
                   <input bind="idtxtTmp" /> 
                   <input bind="FromDT" /> 
                   <input bind="ToDT" /> 
                   <input bind="lstEmpType" /> 
                   <input bind="idModData" /> 
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------------------->
<gw:data id="datAtt_Abs_Change_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRMR01000_1" > 
                <input bind="idGrid_1" >
                   <input bind="lstOrg_1" />
                   <input bind="lstWG_1" /> 
                   <input bind="lstPos_1" /> 
                   <input bind="idtxtTmp_1" /> 
                   <input bind="FromDT_1" /> 
                   <input bind="ToDT_1" /> 
                   <input bind="lstEmpType_1" /> 
                   <input bind="idModData_1" /> 
                </input>
                <output  bind="idGrid_1" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReport_tmp" /> 
					<input bind="txtOrg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

   <!--------------------main table----------------------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="" >
<table name="Current" id="att_abs_change" class="itable" width="100%" cellpadding="0"  cellspacing="0" border=1 style="height:100%;">
     <tr style="width:100%;height:100%" valign="top">
        <td>
            <table style="width=100%;height:14%" border="0" cellspacing="0" cellpadding="0">
				<tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
					</td>
					<td colspan=15 width="15%" style="border:0"  align="left" >
						<gw:list  id="lstOrg" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org()" >
							<data>
								<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
							</data>
                        </gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Group
					</td>
					<td colspan=15 style="border:0" width="15%"  align="left" >
						<gw:list  id="lstWG" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Employee
					</td>
					<td colspan=15 width="15%" style="border:0"> 
						<gw:textbox id="idtxtTmp" maxlen = "20" styles="width:100%" onenterkey="OnSearch(datAtt_Abs_Change)" />
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						<gw:label id="idRecord" text="" styles="width:100%;color:red;font-weight: bold" ></gw:label>
					</td>
					<td colspan=15 width="15%" style="border:0" align="left"> 
						<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch(datAtt_Abs_Change)" />
					</td>
				</tr>
				<tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Work Date
					</td>
					<td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="FromDT"  styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="ToDT"  styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Emp Type
					</td>
					<td colspan=15 style="border:0" width="15%"  align="left" >
						<gw:list  id="lstEmpType" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%= CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0017' ORDER BY B.CODE")%>|ALL|Select All</data>
						</gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Position
					</td>
					<td colspan=15 width="15%" style="border:0"> 
						<gw:list  id="lstPos" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%= CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0008' ORDER BY B.CODE")%>|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
					
					</td>
					<td colspan=5 width="5%" style="border:0"> 
						<gw:button id="ibtnRpt" img="excel"   text="Report"  onclick="OnReport(1)"/>
					</td>
					<td colspan=10 width="10%" style="border:0"> 
						<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
					</td>
				</tr>
				<tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Modify Data
					</td>
					<td colspan=15 width="15%" style="border:0"  align="left" >
						<gw:list  id="idModData" value="ALL" styles="width:100%" onChange="OnChange_ModData(idGrid,idModData)">
                            <data>|1|Attendance|2|Absence|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
					
					</td>
					<td colspan=15 style="border:0" width="15%"  align="left" >
						<gw:label id="idShift" styles="width:100%;color:black;font-weight: bold;font-size:9"></gw:label>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
					
					</td>
					<td colspan=15 width="15%" style="border:0"> 
						
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
					
					</td>
					<td colspan=15 width="15%" style="border:0" align="left"> 
						
					</td>
				</tr>
            </table>
            <table cellspacing=0 cellpadding=0 style="height:86%" width=100% border=1>
                    <tr style="border:1;height:100%" valign="top">
                        <td  style="width:100%"> 
                            <gw:grid   
	                            id="idGrid"  
	                            header="_EMP_PK|ORGANIZATION|WGROUP|EMP_ID|FULL_NM|WORK DATE|SHIFT|MOD BY|MOD DATE|IN|OUT|WT|OT|NT|NT2|HT|IN|OUT|WT|OT|NT|NT2|HT|REMARK|TYPE|TIME|TYPE|TIME|MOD BY|MOD DATE|REMARK"
					            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            aligns="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            defaults="|||||||||||||||||||||||||||||||"
					            editcol="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0"
					            widths="0|1500|1500|1000|2500|1500|500|1200|2000|800|800|500|500|500|500|500|800|800|500|500|500|500|500|2000|1500|500|1500|500|1500|2000|2000"
					            styles="width:100%;height:100%"
					            sorting="T" 
                                oncelldblclick = "Popup()"  
                                
	                            /> 
                        </td>
                        
                    </tr>
               </table> 
        </td>
     </tr>
</table>
<table name="History" id="history" class="itable" width="100%" cellpadding="0"  cellspacing="0" border=1 style="height:100%;">
     <tr style="width:100%;height:100%" valign="top">
        <td>
            <table style="width=100%;height:14%" border="0" cellspacing="0" cellpadding="0">
				<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstOrg_1" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org()" >
								<data>
									<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Group
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstWG_1" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="idtxtTmp_1" maxlen = "20" styles="width:100%" onenterkey="OnSearch(datAtt_Abs_Change_1)" />
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:label id="idRecord_1" text="" styles="width:100%;color:red;font-weight: bold" ></gw:label>
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            <gw:button id="ibtnSearch_1" alt="Search" img="search" text="Search" onclick="OnSearch(datAtt_Abs_Change_1)" />
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Work Date
                        </td>
                        <td colspan=7 width="7%" style="border:0"  align="left" >
                            <gw:datebox id="FromDT_1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=8 width="8%" style="border:0"  align="left" >
                            <gw:datebox id="ToDT_1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Emp Type
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstEmpType_1" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%= CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0017' ORDER BY B.CODE")%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Position
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstPos_1" value="ALL"  maxlen = "100" styles='width:100%' >
                                <data><%= CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0008' ORDER BY B.CODE")%>|ALL|Select All</data>
							</gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=5 width="5%" style="border:0"> 
							<gw:button id="ibtnRpt_1" alt="Report" img="excel"  text="Report" onclick="OnReport(1)" />
						</td>
						<td colspan=10 width="10%" style="border:0"> 
							<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
						</td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Modify Data
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="idModData_1" value="ALL" styles="width:100%" onChange="OnChange_ModData(idGrid_1,idModData_1)">
								<data>|1|Attendance|2|Absence</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
							
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:label id="idShift_1" styles="width:100%;color:black;font-weight: bold;font-size:9"></gw:label>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            
			            </td>
                    </tr>
            </table>
            <table cellspacing=0 cellpadding=0 style="height:86%" width=100% border=1>
                    <tr style="border:1;height:100%" valign="top">
                        <td  style="width:100%"> 
                            <gw:grid   
	                            id="idGrid_1"  
	                            header="_EMP_PK|ORGANIZATION|WGROUP|EMP_ID|FULL_NM|WORK DATE|SHIFT|MOD BY|MOD DATE|IN|OUT|WT|OT|NT|NT2|HT|IN|OUT|WT|OT|NT|NT2|HT|REMARK|TYPE|TIME|TYPE|TIME|MOD BY|MOD DATE|REMARK"
					            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            aligns="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            defaults="|||||||||||||||||||||||||||||||"
					            editcol="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0"
					            widths="0|1500|1500|1000|2500|1500|500|1200|2000|800|800|500|500|500|500|500|800|800|500|500|500|500|500|2000|1500|500|1500|500|1500|2000|2000"
					            styles="width:100%;height:100%"
					            sorting="T" 
                                oncelldblclick = "Popup()"  
                                
	                            /> 
                        </td>
                        
                    </tr>
               </table> 
        </td>
     </tr>
</table>
</gw:tab>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>  
    <gw:textbox id="txtReport_tmp" styles="display:none"/>  
    <gw:textbox id="txtCompany_pk" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>    
    <gw:textbox id="txtOrg_tmp" styles="display:none"/> 
    <gw:list  id="lstWS_temp" value="ALL"  maxlen = "100" styles='display:none' >
                            <data><%=CtlLib.SetListDataSQL("SELECT PK,shift||'-'||remark FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%>|ALL|Select All</data></gw:list>
</body>

   
</html>
