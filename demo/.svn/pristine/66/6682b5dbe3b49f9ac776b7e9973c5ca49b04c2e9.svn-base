<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time
var dt_tmp
var opt_value=1
var arr_col    =new Array();
var emp_pk_list="";
var v_date="";
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    idGrid.GetGridControl().FrozenCols =6;
    //if (v_language!="ENG")
        System.Translate(document);	
          
      iduser_pk.text = "<%=session("USER_PK")%>";
      txtHr_level.text= "<%=session("HR_LEVEL")%>";
     var t="<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0041' union SELECT NULL,'' FROM DUAL ")%>";
      idGrid.SetComboFormat(5,t);
      //var t1 = "<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0003' and a.code<>'04' union SELECT NULL,'' FROM DUAL ")%>";
      //alert(t1);

      ChangeColorItem(lstOrg.GetControl());

       if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
           datUser_info.Call(); 
      
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

//------------------------------------------------------------------------------------
function Set_Enable(n)
{
}
function SetGrid_KindList(obj)
{
}
function OnDataReceive(obj)
{
     if (obj.id=="datSearch")
       { 
         lbRecode.text= (idGrid.rows-1) + ' Rec(s)' ;
         auto_resize_column(idGrid,0,idGrid.cols-1,0); 
         
         var fg=idGrid.GetGridControl(); 	  
            fg.MergeCells =3	;
            fg.MergeCol(0) =true	;
            fg.MergeCol(1) =true	;
            fg.MergeCol(2) =true	;
         
       }
        else if (obj.id=="datFind_Report")
       { 
               var url;
               url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?p_from=' + dtFrom.value + '&p_to=' + dtTo.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg.value+'&p_wg='+lstWG.value+'&p_search='+idSearch.value +'&p_tmp='+idtxtTmp.text+'&p_kind='+lstKind.value;
                   
            window.open(url);    
       }
        else if(obj.id =="datWorkGroup_info")
        {
            if(flag_tab =="1")
            {
		        lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG.value="ALL";
            }
            else if(flag_tab =="2")
            {
                lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG.value="ALL";
           
            }
        }
        else if(obj.id =="datUser_info")
        {
            onChange_org(1,lstOrg);
        }
}     
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
      obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}//------------------------------------------------------------------------------------
function OnSearch()
{       
 datSearch.Call("SELECT");
}
//------------------------------------------------------------------------------------
function OnShowPopup(n)
{
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
            lstOrg.value=obj;
            
        
    }    
}
function OnPrint()
{ txtReport_tmp.text="rpt_ins_event.aspx";
  datFind_Report.Call();
}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
}
</script>

<body>
<!------------main control---------------------->
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="hr_sp_sel_wg_role"  > 
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
            <dso  type="list" procedure="hr_sp_sel_user_role2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_sp_pro_dept_data_all" > 
                <input>
                    <input bind="txtUpperDept" /> 
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTeamData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="hr_sp_pro_team_data_all" > 
                <input>
                    <input bind="lstOrg" /> 
                </input> 
                <output>
                    <output bind="txtGroupData" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="hr_sp_pro_find_report" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datSearch" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="HR_SEL_10040010" > 
                <input bind="idGrid">
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstKind" /> 
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="lstNation" /> 
                    <input bind="idSearch" /> 
                   <input bind="idtxtTmp" />
                 </input> 
                <output bind="idGrid"/>
            </dso> 
        </xml> 
</gw:data>

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >		
							<tr>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<gw:list  id="idSearch" value="1" styles='width:100%' onChange="">
										<data>|1|Emp ID|2|Card ID|3|Name|4|Social No|5|Health No</data>
									</gw:list>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
								</td>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  >
									<b>From</b>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" type='month'  ></gw:datebox>
									~
									<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" type='month'  ></gw:datebox> 
								</td>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<b>Nation</b>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lstNation"  value="01" styles='width:100%' >
										<data>
											<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...	
										</data>										
									</gw:list>
								</td>
								
								<td colspan=4 style="border:0"></td>											
							</tr>	
							<tr>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lstOrg"  value="ALL" styles='width:100%' onchange="onChange_org(1,lstOrg)" >
										<data>
											<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
										</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<b>Work-Group</b>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lstWG"  value="ALL" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  ></td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Kind
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lstKind" value="ALL" styles='width:100%' onChange="">
										<data>
											<%=CtlLib.SetListDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0041'  order by code_nm" )%>|ALL|Select All
										</data>
									</gw:list>
								</td>																										
							</tr>	   
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:100%" valign="center" >
						<td colspan=2 width="2%" style="border:0" align="left" >
						
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:label id="lbRecode" text="" styles="width:100%" ></gw:label>
						</td>
						<td colspan=70 width="70%" style="border:0" align="left" >
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnPrint()" />
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
				<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
					<tr style="height:100%">
						<td id="master" width="100%">
							<gw:grid
								id="idGrid"
								header="Organization|ID|Full Name|Join Date|INS Month|INS Kind|Basic Salary|INS Salary"
								format="0|0|0|4|0|2|-0|-0"
								aligns="0|0|0|1|1|0|2|2"
								defaults="|||||||"
								editcol="0|0|0|0|0|0|0|0"
								widths="2000|2000|2000|2000|2000|2000|2000|2000"
								styles="width:100%;height:100%"
								sorting="T"
								onafteredit=""
								onbeforeedit = ""
								acceptNullDate
								/>
						</td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
</table>

	<gw:textbox id="txtMonth_flag" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtFrom" styles="display:none"/>
    <gw:textbox id="txtTo" styles="display:none"/>
     <gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>	
</body>
</html>

