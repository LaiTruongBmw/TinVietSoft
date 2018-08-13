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
var flag_add= false ;
var clickrow = true;
var changecontent = false;
var reportno ;

//"_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Reserve Kind|Reserve Date|Social No|Move Month|Status Book|Note|_Seq_Save|_EMP_PK"
var g1_pk = 0;
    g1_org = 1;
    g1_emp_id = 2;
    g1_full_nm =3;
    g1_birth_dt = 4;
    g1_person_id = 5;
    g1_social_no =6;
    g1_reserve_kind =7;
    g1_reserve_dt =8;
    
    g1_move_month =9;
    g1_ins_month = 10;
    g1_status_book = 11;
    g1_note = 12;
    g1_save_seq = 13;
    g1_emp_pk = 14;
//"_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Social No|Modify Month|Book Status|_EMP_PK"
var g2_pk =0;
    g2_org = 1;
    g2_emp_id =2;
    g2_full_nm =3
    g2_birth_dt = 4;
    g2_person_id = 5;
    g2_social_no =6;
    g2_modify_mon = 7;
    g2_book_status = 8;
    g2_emp_pk = 9;
//"_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Social No|Insurance Kind|Reduce Month|Times|Reserve Kind|Book Status|_EMP_PK"
var g3_pk =0;
    g3_org = 1;
    g3_emp_id =2;
    g3_full_nm =3
    g3_birth_dt = 4;
    g3_person_id = 5;
    g3_social_no =6;
    g3_ins_kind = 7;
    g3_reduce_month = 8;
    g3_times = 9;
    g3_reserve_kind = 10;
    g3_book_status = 11;
    g3_emp_pk = 12;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    
    idGrid.GetGridControl().ScrollTrack=true;
    idGrid.GetGridControl().FrozenCols =6;
    //if (v_language!="ENG")
        System.Translate(document);	
          
      iduser_pk.text = "<%=session("USER_PK")%>";
      txtHr_level.text= "<%=session("HR_LEVEL")%>";
      menu_id.text=System.Menu.GetMenuID();
      var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0176' order by code_nm")%>";
       idGrid.SetComboFormat(g1_reserve_kind,t1); //Kind Reserve

        var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>";
       idGrid.SetComboFormat(g1_status_book,t1); //Status book

       var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>";
       idGrid1.SetComboFormat(g2_book_status,t1); //Status book

       var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>";
       idGrid2.SetComboFormat(g3_book_status,t1); //Status book

       var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select '01', 'Normal' from dual union all select '02', 'Unemployee' from dual ")%>";
       idGrid2.SetComboFormat(g3_reserve_kind,t1); //Status book

       ChangeColorItem(lstOrg.GetControl());
       ChangeColorItem(lstOrg1.GetControl());
       ChangeColorItem(lstOrg2.GetControl());

       datCheck_View.Call();
       
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

//---------------------------------------------------
//function OnShowPopup()
//{
//        var fpath = System.RootURL + "/form/ch/ae/chae00010_dept.aspx?";
//        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:200;edge:sunken;scroll:yes;unadorned:yes;help:no');
//        if (obj!=null)
//        {
//             txtUpperDept.text=obj;
//             datDeptData.Call();
//        }
//}
//------------------------------------------------------------------------------------
function OnChangeDept()
{
    //txtDept.text=lstOrg.value;
    datTeamData.Call();
}
//------------------------------------------------------------------------------------
function Set_Enable(n)
{
    ibtnAdd.SetEnable(n);
    ibtnDel.SetEnable(n);
    ibtnUnDel.SetEnable(n);
    ibtnSave.SetEnable(n);    
}
function SetGrid_KindList(obj)
{
}
function OnDataReceive(obj)
{
    if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                ibtnAdd.style.display = "none";
                ibtnDel.style.display = "none";
                ibtnSave.style.display = "none";

                ibtnSave1.style.display = "none";
                ibtnSave2.style.display = "none";
            }
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }
           
       }
    if (obj.id=="datUser_info")
     { 
        lstOrg.SetDataText(txtDeptData.text);
        lstOrg1.SetDataText(txtDeptData.text);
        lstOrg2.SetDataText(txtDeptData.text);

        ChangeColorItem(lstOrg.GetControl());
        ChangeColorItem(lstOrg1.GetControl());
        ChangeColorItem(lstOrg2.GetControl());

        onChange_org(4,lstOrg);
     }   
     if (obj.id=="datSearch")
       { auto_resize_column(idGrid,0,idGrid.cols-1,0);   
         lblRecord.text= (idGrid.rows-1==0)?0:(idGrid.rows-1) + ' Record(s)' ;
         
         if(idGrid.rows>1)
         {
            idGrid.SetCellBgColor(1,g1_reserve_dt,idGrid.rows -1 ,g1_note,0xFFEEFF);
            idGrid.SetCellBgColor(1,g1_status_book,idGrid.rows -1 ,g1_status_book,0xBAEDD3);
         }
       }
     if (obj.id=="datSearch_Save")
       { auto_resize_column(idGrid,0,idGrid.cols-1,0);   
         lblRecord.text= (idGrid.rows-1==0)?0:(idGrid.rows-1) + ' Record(s)' ;
         flag_add = false;
         clickrow = true;
         changecontent = false;

         if(idGrid.rows>1)
         {
            idGrid.SetCellBgColor(1,g1_reserve_dt,idGrid.rows -1 ,g1_note,0xFFEEFF);
            idGrid.SetCellBgColor(1,g1_status_book,idGrid.rows -1 ,g1_status_book,0xBAEDD3);
         }
       }
     if (obj.id=="datModPersonal")
       { auto_resize_column(idGrid1,0,idGrid1.cols-1,0);   
         lblRecord1.text= (idGrid1.rows-1==0)?0:(idGrid1.rows-1) + ' Record(s)' ;
         
         if(idGrid1.rows>1)
         {
            idGrid1.SetCellBgColor(1,g2_book_status ,idGrid1.rows -1 ,g2_book_status,0xBAEDD3);
         }
       }
     if (obj.id=="datReservation")
       { auto_resize_column(idGrid2,0,idGrid2.cols-1,0);   
         lblRecord2.text= (idGrid2.rows-1==0)?0:(idGrid2.rows-1) + ' Record(s)' ;
         
         if(idGrid2.rows>1)
         {
            idGrid2.SetCellBgColor(1,g3_reserve_kind,idGrid2.rows -1 ,g3_emp_pk,0xFFEEFF);
            idGrid2.SetCellBgColor(1,g3_book_status ,idGrid2.rows -1 ,g3_book_status,0xBAEDD3);
         }
       }
     if (obj.id=="datFind_Report")
     {
        if(reportno == 1)
        {
            url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_group='+ lstWG.value +'&p_search='+ idSearch.value ;
            url =url + '&p_text=' + idtxtTmp.text + '&p_kind='+ idList.value +'&p_status='+ lstStatus.value +'&p_month='+ dtFromMon.value +'&p_book='+ lstStatusBook.value;
        }
        window.open(url);     
     }
     if(obj.id =="datWorkGroup_info")
        {
            if(flag_tab =="1")
            {
		        lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG.value="ALL";
            }
            else if(flag_tab =="2")
            {
                lstWG1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG1.value="ALL";
           
            }
            else if(flag_tab =="3")
            {
                lstWG2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG2.value="ALL";
           
            }
            else if(flag_tab =="4")
            {
                lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG.value="ALL";
                lstWG1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG1.value="ALL";
                lstWG2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		        lstWG2.value="ALL";
           
            }
        }
      
}     


//------------------------------------------------------------------------------------
function OnSearch(obj)
{      
  if(obj == "1")
    datSearch.Call("SELECT");
  else if(obj == "2")
    datModPersonal.Call("SELECT");
  else if(obj== "3")
    datReservation.Call("SELECT");
}
//------------------------------------------------------------------------------------
function OnUpdate(obj)
{ 

 if(confirm("Do you want to  save!"))   
 {
    if(obj=="1")
    {
        if(flag_add == false)
            datSearch.Call();
        else datSearch_Save.Call();
    }
    else if(obj=="2")
    {
        datModPersonal.Call();
    }
    else if(obj == "3")
        datReservation.Call();
 }
}
//------------------------------------------------------------------------------------


function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function Delete_row()
{     
     if(confirm("Do you want to delete?\nBạn đã chắc chắn delete?"))
        idGrid.DeleteRow();
        
}
function UnDelete_row()
{
    idGrid.UnDeleteRow();
}
//--------------------------------
function OnReport(obj)
{
   
    reportno = obj;
    if (obj==1)
    {
        if(dtFromMon.value != dtToMon.value)
        {
            alert("You must choose same month to export report.\nBạn phải chọn một tháng để xuất báo cáo");
            return;

        }
        txtReport_tmp.text="rpt_ins_transfer.aspx";
    }

	datFind_Report.Call();
    
}
function OnShowPopup(n)
{
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
            lstOrg.value=obj;
        else if(n==2)
            lstOrg1.value = obj;
        else if(n==3)
            lstOrg2.value = obj;
        
    }    
}
//----------------------------------------------


function Add_new(obj)
{
    if(obj=="1")
    {
        
        ctrl =idGrid.GetGridControl();
        if(ctrl.rows>1)
        { 
            for(var j=1; j<ctrl.rows; j++)
            {
               if(idGrid.GetGridData(j,g1_pk)!="")
               {
                    idGrid.RemoveRowAt(j);
                    j--;
               }
            }
            lblRecord.text = "0 Record";
        }

        var fpath = System.RootURL + "/form/ch/di/chdi00110_search_emp.aspx";
        var aData=new Array();
        var aData  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	    if (aData!=null)
	    {
            var len=aData.length;
		    var i;
		    for (i=0;i<len;i++)		
		    {
	            var save_no = new Date().getTime();
	            idGrid.AddRow();

            
		        aRow=aData[i];

                idGrid.SetGridText(idGrid.rows-1,g1_org,aRow[1]);//org
    	        idGrid.SetGridText(idGrid.rows-1,g1_emp_id,aRow[3]);//emp_id
    	        idGrid.SetGridText(idGrid.rows-1,g1_full_nm,aRow[4]);//full name
    	        idGrid.SetGridText(idGrid.rows-1,g1_emp_pk,aRow[0]);//emp_id

                idGrid.SetGridText(idGrid.rows-1,g1_reserve_kind,aRow[14]);//Kind Reverse
                idGrid.SetGridText(idGrid.rows-1,g1_reserve_dt,aRow[13]);//Kind Reverse
                idGrid.SetGridText(idGrid.rows-1,g1_status_book,aRow[15]);//Status Book
	        }
	    }
        if(ctrl.rows>1)
        { 
            for(var j=1; j<ctrl.rows; j++)
            {
                idGrid.SetGridText(j,g1_save_seq,save_no);   //Save no
            }
           
        }
        txtflag_saveno.text = save_no;
        flag_add = true;
  
        lblRecord.text= (idGrid.rows-1==0)?0:(idGrid.rows-1) + ' Record(s)' ;
        auto_resize_column(idGrid,0,idGrid.cols-1,0);
    }
    
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
                    <output bind="txtDeptData" />
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
           <dso  type="grid"  function="HR_SEL_10040011" procedure="HR_UPD_10040011" parameter="0,7,8,9,10,11,12,13,14"> 
                <input bind="idGrid">  
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="idSearch" /> 
                   <input bind="idtxtTmp" />
                   <input bind="idList" />
                   <input bind="lstStatus" />
                   <input bind="dtFromMon" />
                   <input bind="dtToMon" />
                   <input bind="dtFrom" />
                   <input bind="dtTo" />
                   <input bind="lstStatusBook" />
                </input> 
                <output bind="idGrid"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datModPersonal" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="HR_SEL_10040011_1" procedure="HR_UPD_10040011_1" parameter="8,9"> 
                <input bind="idGrid1">  
                    <input bind="lstOrg1" /> 
                    <input bind="lstWG1" /> 
                    <input bind="lstStatus1" />
                    <input bind="idSearch1" /> 
                   <input bind="idtxtTmp1" />
                   <input bind="lstStatusBook1" />
                   <input bind="dtFromMonth" />
                </input> 
                <output bind="idGrid1"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datReservation" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="HR_SEL_10040011_2" procedure="HR_UPD_10040011_2" parameter="10,11,12"> 
                <input bind="idGrid2">  
                    <input bind="lstOrg2" /> 
                    <input bind="lstWG2" /> 
                    <input bind="lstStatus2" />
                    <input bind="idSearch2" /> 
                   <input bind="idtxtTmp2" />
                   <input bind="dtFromMonth2" />
                   <input bind="lstTimes" />
                   <input bind="lstReserve" />
                   <input bind="lstStatusBook2" />
                </input> 
                <output bind="idGrid2"/>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datSearch_Save" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="HR_SEL_10040011_3" procedure="HR_UPD_10040011" parameter="0,7,8,9,10,11,12,13,14"> 
                <input bind="idGrid">  
                    <input bind="txtflag_saveno" />  
                </input> 
                <output bind="idGrid"/>
            </dso> 
        </xml> 
</gw:data>

<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" >
<table name="Transfer" style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
		<tr  style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
								<tr>
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" >
										<gw:list  id="idSearch" value="1" styles='width:100%' onChange="">
											<data>|1|Emp ID|2|Card ID|3|Name</data>
										</gw:list>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch(1)" />
									</td>									
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Group</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstWG"  value="ALL" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" ><b>Status</b></td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										 <gw:list  id="lstStatus"  value="A" styles='width:100%' >
											<data>|A|Active|R|Resign|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Transfer Kind</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="idList" value="ALL" styles='width:100%' onChange="">
											<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0176' order by code_nm")%>|ALL|Select All</data>
										</gw:list>
									</td>									
								</tr>	
								<tr>
									<td colspan=2 width="2%" style="border:0" align="left" >
									</td>
									<td colspan=8 width="8%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstOrg"  value="ALL" styles='width:100%' onchange="onChange_org(1,lstOrg)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>									
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" ><b>Month</b></td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
									   <gw:datebox id="dtFromMon" lang="<%=Session("Lang")%>" type=month ></gw:datebox> ~<gw:datebox id="dtToMon" lang="<%=Session("Lang")%>" type=month  ></gw:datebox>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" >
									   <b>Book</b>
									</td>		
									<td colspan=15 width="15%" style="border:0"  align="left" >
									   <gw:list  id="lstStatusBook" value="ALL" styles='width:100%' onChange="">
											<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" ></td>
									<td colspan=8 width="8%" style="border:0" align="left" >
									   Trans DT
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:datebox id="dtFrom" lang="<%=Session("Lang")%>"  nullaccept  ></gw:datebox> ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" nullaccept   ></gw:datebox>
									</td>               
								</tr>						   
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left" >
						
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord" text="" ></gw:label>
							</td>
							<td colspan=55 width="55%" style="border:0" align="left" >
							
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnAdd" alt="Add New" img="new" text="Add New" onclick="Add_new(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnDel" alt="Delete" img="delete" text="" onclick="Delete_row()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnUpdate(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport(1)" />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table id="tbl" style="width:100%;height:98%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
						<tr style="height:100%">
							<td id="master" width="100%">
								<gw:grid
									id="idGrid"
									header="_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Social No|Transfer Kind|Transfer Date|Transfer Month|Ins Month|Book Status|Note|_Seq_Save|_EMP_PK"
									format="0|0|0|0|0|0|0|0|4|5|5|2|0|0|0"
									aligns="0|0|0|0|0|0|0|0|1|1|1|0|0|0|0"
									defaults="||||||||||||||"
									editcol="0|0|0|0|0|0|0|0|1|1|1|1|1|0|0"
									widths="0|1500|2000|2000|1500|1500|1500|1800|3000|2000|1500|1500|1500|1500|1500"
									styles="width:100%;height:100%"
									sorting="T"
									acceptNullDate
									/>
							</td>
						</tr>	
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table name="Modify Personal" style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
		<tr  style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
								<tr >
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<gw:list  id="idSearch1" value="1" styles='width:100%' onChange="">
											<data>|1|Emp ID|2|Card ID|3|Name</data>
										</gw:list>
									</td>

									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp1" maxlen = "50" styles="width:100%" onenterkey="OnSearch(2)" />
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<b>Group</b>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstWG1"  value="ALL" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" ><b>Status</b></td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										 <gw:list  id="lstStatus1"  value="A" styles='width:100%' >
											<data>|A|Active|R|Resign|ALL|Select All</data>
										</gw:list>
									</td>																											
								</tr>	
								<tr>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg1"  value="ALL" styles='width:100%' onchange="onChange_org(2,lstOrg1)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<b>Month</b>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtFromMonth" lang="<%=Session("Lang")%>" type=month ></gw:datebox>						
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<b>Book</b>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
									   <gw:list  id="lstStatusBook1" value="ALL" styles='width:100%' onChange="">
											<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>|ALL|Select All</data>
										</gw:list>
									</td>
																	
								</tr>				   
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left" >
						
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord1" text="" ></gw:label></b>
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch1" alt="Search" img="search" text="Search" onclick="OnSearch(2)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave1" alt="Save" img="save" text="Save" onclick="OnUpdate(2)" />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table id="Table1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
						<tr style="height:100%">
							<td id="Td1" width="100%">
								
								<gw:grid
									id="idGrid1"
									header="_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Social No|Modify Month|Book Status|_EMP_PK"
									format="0|0|0|0|0|0|0|0|2|0"
									aligns="0|0|0|0|0|0|0|1|1|0"
									defaults="|||||||||"
									editcol="0|0|0|0|0|0|0|0|1|0"
									widths="0|1500|2000|2000|1500|1500|1500|1800|2000|0"
									styles="width:100%;height:100%"
									sorting="T"
									acceptNullDate
									/>
							</td>
						</tr>	
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table name="Unemployment" style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
		<tr  style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
								<tr >	
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<gw:list  id="idSearch2" value="1" styles='width:100%' onChange="">
											<data>|1|Emp ID|2|Card ID|3|Name</data>
										</gw:list>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp2" maxlen = "50" styles="width:100%" onenterkey="OnSearch(3)" />
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Group</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstWG2"  value="ALL" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
										</gw:list>
									</td>
									
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Status</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										 <gw:list  id="lstStatus2"  value="A" styles='width:100%' >
											<data>|A|Active|R|Resign|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
									   <b>Book</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstStatusBook2" value="ALL" styles='width:100%' onChange="">
											<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>|ALL|Select All</data>
										</gw:list>
									</td>	
								</tr>	
								<tr >	
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(3)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstOrg2"  value="ALL" styles='width:100%' onchange="onChange_org(3,lstOrg2)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Month</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:datebox id="dtFromMonth2" lang="<%=Session("Lang")%>" type=month ></gw:datebox>
										
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
										<b>Times</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
										<gw:list  id="lstTimes" value="ALL" maxlen = "100" styles='width:100%' >
														<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0042' ORDER BY B.CODE")%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
						
									</td>									
									<td colspan=8 width="8%" style="border:0" align="left" >
									   <b>Reservation</b>
									</td>
									<td colspan=15 width="15%" style="border:0"  align="left" >
									   <gw:list  id="lstReserve"  value="ALL" styles='width:100%' >
											<data>|01|Normal|02|Unemployee|ALL|Select All</data>
										</gw:list>
									</td>																																			
								</tr>	
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left" >
						
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord2" text="" ></gw:label></b>
							</td>
							<td colspan=70 width="70%" style="border:0" align="left" >
							
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch2" alt="Search" img="search" text="Search" onclick="OnSearch(3)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnUpdate(3)" />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table id="Table2" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
						<tr style="height:100%">
							<td id="Td2" width="100%">
								
								<gw:grid
									id="idGrid2"
									header="_PK|Organization|Emp ID|Full Name|Birth Date|Personal ID|Social No|Insurance Kind|Reduce Month|Times|Reserve Kind|Book Status|_EMP_PK"
									format="0|0|0|0|0|0|0|0|2|2|0|0|0"
									aligns="0|0|0|0|0|0|0|1|1|1|0|0|0"
									defaults="||||||||||||"
									editcol="0|0|0|0|0|0|0|0|0|0|1|1|0"
									widths="0|1500|2000|2000|1500|1500|1500|1800|2000|1500|1500|1500|1500"
									styles="width:100%;height:100%"
									sorting="T"
									acceptNullDate
									/>
							</td>
						</tr>	
					</table>
				</div>
			</td>
		</tr>
	</table>
</gw:tab>
	<gw:textbox id="txtflag" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtFrom" styles="display:none"/>
    <gw:textbox id="txtTo" styles="display:none"/>
    <gw:textbox id="txtflag_saveno" styles="display:none"/>
    <gw:textbox id="txtSocial_Old" styles="display:none"/>
    <gw:textbox id="txtSocial" styles="display:none"/>
    <gw:textbox id="txtPK" styles="display:none"/>
	<gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>	
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</body>
</html>

