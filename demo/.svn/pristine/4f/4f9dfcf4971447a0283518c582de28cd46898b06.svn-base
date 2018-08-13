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

//"_EMP_PK|Select|_Organization|EMP_ID|FULL_NM|_Birth Date|_Personal ID|_Social No|_Health No|Modify Kind|Content|New value|Old value|Modify date|_Pk|Reason"
var g1_pk = 0;
    g1_select = 1;
    g1_org = 2;
    g1_emp_id = 3;
    g1_full_nm =4;
    g1_birth_dt = 5;
    g1_person_id = 6;
    g1_social_no = 7;
    g1_health_no = 8;
    g1_mod_kind = 9;
    g1_content = 10;
    g1_new_value = 11;
    g1_old_value = 12;
    g1_mod_date = 13;
    g1_reason = 14;
    g1_emp_pk = 15;
    g1_save_seq = 16;

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
      idGrid.SetComboFormat(g1_mod_kind,"#1;Re-issue Health card|#2;Modify Social INS|#3;Issue Social Book Last Period|#4;Graft Social Book No");
      var t="<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0132' union SELECT NULL,'' FROM DUAL ")%>";
      idGrid.SetComboFormat(g1_content,t);
      idBtnGraft.SetEnable(false);

      ChangeColorItem(lstOrg.GetControl());

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
function OnShowPopup()
{
        var fpath = System.RootURL + "/form/ch/ae/chae00010_dept.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:200;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
             txtUpperDept.text=obj;
             datDeptData.Call();
        }
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
                ibtnSave.style.display = "none";
                ibtnDel.style.display = "none";
                idBtnGraft.style.display = "none";
            }
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                   datUser_info.Call(); 
              
            
       }
     else if (obj.id=="datUser_info")
     {
        onChange_org(1,lstOrg);
     }
     else if (obj.id=="datSearch")
       { auto_resize_column(idGrid,0,idGrid.cols-1,0);   
         lblRecord.text= (idGrid.rows-1==0)?0:(idGrid.rows-1) + ' Record(s)' ;
         idBtnGraft.SetEnable(false);
       }
     if (obj.id=="datSearch_Save")
       { auto_resize_column(idGrid,0,idGrid.cols-1,0);   
         lblRecord.text= (idGrid.rows-1==0)?0:(idGrid.rows-1) + ' Record(s)' ;
         flag_add = false;
         clickrow = true;
         changecontent = false;
         idBtnGraft.SetEnable(false);
       }
     if (obj.id=="datFind_Report")
     {url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list;
        window.open(url);     
     }
     if (obj.id == "datGraft_Book")
     {
        
        if(txtflag.text =="1")
        {
            alert("Graft social book no success.\nGhép sổ thành công.")
            datSearch.Call("SELECT");
        }
        else 
        {
            alert("Graft social book no has fail.\nGhép sổ có lỗi.");
            return;
        }    
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
}     

function OnSetPrint(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}
//------------------------------------------------------------------------------------
function OnSearch()
{       
 datSearch.Call("SELECT");
}
//------------------------------------------------------------------------------------
function OnUpdate()
{ 
for(var i=1;i<idGrid.rows-1;i++)
{
    if(idGrid.GetGridData(i,g1_mod_kind)=="" )
    {   alert("Please choose modify kind!");
        return;
    }
    if(idGrid.GetGridData(i,g1_mod_date)=="")
    {   alert("Please choose day modify!");
        return;
    }
}
 if(confirm("Do you want to  save!"))   
 {
    if(flag_add == false)
        datSearch.Call();
    else datSearch_Save.Call();
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
function OnPrint()
{

emp_pk_list="";
var mod_kind="";
            for (var i=1;i<=idGrid.rows-1;i++)
            {
                if (idGrid.GetGridData(i,g1_select)=="-1")
                { 
                   if(lstReport.value=='1')
                   {
                        if((idGrid.GetGridData(i,g1_mod_kind)== '1')||(idGrid.GetGridData(i,g1_mod_kind)== '3'))
                        {
                             alert("Please choose other report");
                            return;
                        }
                   }
                   else if((lstReport.value=='2'&& idGrid.GetGridData(i,g1_mod_kind)!='1')||(lstReport.value=='3'&& idGrid.GetGridData(i,g1_mod_kind)!='1') ||(lstReport.value=='4'&& idGrid.GetGridData(i,g1_mod_kind)!='3')||(lstReport.value=='5'&& idGrid.GetGridData(i,g1_mod_kind)!='2') ) 
                     {
                        alert("Please choose other report");
                        return;
                     }
                   else if(lstReport.value=='6'&& idGrid.GetGridData(i,g1_content)!='07') //sai graft book
                   {
                        alert("Please choose other report");
                        return;
                   }
                   else if(lstReport.value=='7'&& idGrid.GetGridData(i,g1_content)!='08') //sai điều chỉnh số sổ
                   {
                        alert("Please choose other report");
                        return;
                   }
                if((mod_kind!=""&& mod_kind!=idGrid.GetGridData(i,g1_mod_kind)))  
                      { alert("Please choose the same modify kind to print");
                      return;
                      }                                        
                        mod_kind=idGrid.GetGridData(i,g1_mod_kind);
                
                    emp_pk_list = emp_pk_list + idGrid.GetGridData(i,g1_pk) + ",";
                }   
            }
            if (emp_pk_list=="")
            {
                alert("Please choose employees to print");
                return;
            }

    switch(lstReport.value)
    {
        case "1": //02a-TBH Report
        {
            txtReport_tmp.text="rpt_D01b_TS.aspx";
                   break;        
        } 
        case "2": //03a-TBH Report
        {
            txtReport_tmp.text="rpt_03_THE.aspx";
                   break;        
        }
        case "3": //02b-TBH Report
        {
            txtReport_tmp.text="rpt_02_THE.aspx";
                  break;        
        }   
        case "4": //04-sbh Report
        {
            txtReport_tmp.text="rpt_04_SBH.aspx";
                  break;        
        }   
        case "5": // CV 03b-TBH
        {
            txtReport_tmp.text = "rpt_CV_03b_TBH.aspx"
            break;
        }
        case "6": // CV Graft Book
        {
            txtReport_tmp.text = "rpt_cv_graft_book.aspx"
            break;
        }
        case "7": // CV điều chỉnh số sổ BHXH
        {
            txtReport_tmp.text = "rpt_cv_dieuchinhsoso.aspx"
            break;
        }
    }
    datFind_Report.Call();
     emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
    
    
}
function OnShowPopup(n)
{
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
            lstOrg.value=obj;
        
    }    
}
//----------------------------------------------
function OnChangeSetBy()
{
    //OnResetList();
    if(lstSetBy.value =="1") //Modify Kind
    {
        td1.style.display ="block" ; // show
        td2.style.display="none" ;   // not show  
        td4.style.display="none" ;
    }
    else if(lstSetBy.value == "2") // Content
    {
        td2.style.display ="block" ; // show
        td1.style.display="none" ;   // not show    
        td4.style.display="none" ;
    }
    else if(lstSetBy.value == "3" || lstSetBy.value == "4" || lstSetBy.value == "5") // Date
    {
        td4.style.display ="block" ; // show
        td1.style.display="none" ;   // not show    
        td2.style.display="none" ;
    }
}
function OnSetGrid()
{
    if(lstSetBy.value =="" )
    {
        alert("Please choose value to set\nBạn phải chọn giá trị để set.");
        return;
    }
    else 
    {
        var ctrl=idGrid.GetGridControl();
        for(var i=1;i<=ctrl.SelectedRows;i++)
        {
            if(lstSetBy.value == "1") //modify kind
            {  
                    idGrid.SetGridText(ctrl.SelectedRow(i-1),g1_mod_kind ,lstSetKind.value );
            }
            else if(lstSetBy.value =="2") //Content
            {
                idGrid.SetGridText(ctrl.SelectedRow(i-1),g1_content ,lstSetContent.value );
            }
            else if(lstSetBy.value =="3") //New value
            {
                idGrid.SetGridText(ctrl.SelectedRow(i-1),g1_new_value ,txtText.text );
            }
            else if(lstSetBy.value =="4") //Old Value
            {
                idGrid.SetGridText(ctrl.SelectedRow(i-1),g1_old_value ,txtText.text );
            }
            else if(lstSetBy.value =="5" ) //Reason
            {
                idGrid.SetGridText(ctrl.SelectedRow(i-1),g1_reason ,txtText.text );
            }
           
        }
        
    }
}
function Add_new()
{
    clickrow = false;
    changecontent = true;
    idBtnGraft.SetEnable(false);
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

    var fpath = System.RootURL + "/form/ch/di/chdi00090_search_emp.aspx";
    var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	if (obj!=null)
	{
	    var save_no = new Date().getTime();

	    idGrid.AddRow();
        idGrid.SetGridText(idGrid.rows-1,g1_org,obj[1]);//org
	    idGrid.SetGridText(idGrid.rows-1,g1_emp_id,obj[3]);//emp_id
	    idGrid.SetGridText(idGrid.rows-1,g1_full_nm,obj[4]);//full name
	    idGrid.SetGridText(idGrid.rows-1,g1_emp_pk,obj[0]);//emp_id
        idGrid.SetGridText(idGrid.rows-1,g1_social_no,obj[8]);//social
        idGrid.SetGridText(idGrid.rows-1,g1_health_no,obj[9]);//health
        idGrid.SetGridText(idGrid.rows-1,g1_mod_date,obj[13]);//sysdate
	    
        txtSocial_Old.text = obj[7];    //social old
        txtSocial.text = obj[8];             //social 
	    
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
}
function OnCheckEdit()
{
    if(idGrid.col == g1_content)
    {
        if(idGrid.GetGridData(idGrid.row, g1_mod_kind)=="")
        {
            alert("Please choose modify kind.\nBạn phải chọn loại thay đổi.");
            return ;
        }
        else 
        {
            if(idGrid.GetGridData(idGrid.row, g1_mod_kind) == "1")
            {
                if((idGrid.GetGridData(idGrid.row, g1_content) != "01")&&(idGrid.GetGridData(idGrid.row, g1_content) != "02"))
                {
                    alert("You choose content not match with modify kind!\nBạn chọn nội dung không phù hợp với loại thay đổi!");
                    return;
                }
            }
            else if(idGrid.GetGridData(idGrid.row, g1_mod_kind) == "2")
            {
                if((idGrid.GetGridData(idGrid.row, g1_content) != "03")&&(idGrid.GetGridData(idGrid.row, g1_content) != "04")&&(idGrid.GetGridData(idGrid.row, g1_content) != "05")&&(idGrid.GetGridData(idGrid.row, g1_content) != "06"))
                {
                    alert("You choose content not match with modify kind!\nBạn chọn nội dung không phù hợp với loại thay đổi!");
                    return;
                }
            }
            else if(idGrid.GetGridData(idGrid.row, g1_mod_kind) == "3")
            {
                if(idGrid.GetGridData(idGrid.row, g1_content) != "")
                {
                    alert("This modify kind haven't content.\nLoại thay đổi này không có nội dung.");
                    return ;
                }
            }
            else if(idGrid.GetGridData(idGrid.row, g1_mod_kind) == "4")
            {
//                if(idGrid.GetGridData(idGrid.row, g1_content) != "07" && idGrid.GetGridData(idGrid.row, g1_content) != "08")
//                {
//                    alert("You choose content not match with modify kind!\nBạn chọn nội dung không phù hợp với loại thay đổi!");
//                    return;
//                }
            }


        } 
       
    }
    else if(idGrid.col == g1_mod_kind)
    {
        if(changecontent)
        {
            if(idGrid.GetGridData(idGrid.row, g1_mod_kind) == "4") //Graft Book
            {
                idGrid.SetGridText(idGrid.row, g1_old_value, txtSocial.text); 
                idGrid.SetGridText(idGrid.row, g1_new_value, txtSocial_Old.text);
                idGrid.SetGridText(idGrid.row, g1_content, "07"); // huy so
            }
        }
    }
}
function OnClick()
{
    if(clickrow && idGrid.rows>1)
    {
        if(idGrid.GetGridData(idGrid.row,g1_social_no)!= idGrid.GetGridData(idGrid.row,g1_new_value) && (idGrid.GetGridData(idGrid.row,g1_content)=="07" || idGrid.GetGridData(idGrid.row,g1_content)=="08") )
        {
            idBtnGraft.SetEnable(true);
        }
        else idBtnGraft.SetEnable(false);

        txtPK.text = idGrid.GetGridData(idGrid.row, g1_pk);
    }
}
function OnGraft()
{
    confirm("Do you want to graft social book?\nBạn có muốn ghép sổ bảo hiểm?")
        datGraft_Book.Call();
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
           <dso  type="grid"  function="HR_SEL_10040009" procedure="HR_UPD_10040009" parameter="0,9,10,11,12,13,14,15,16"> 
                <input bind="idGrid">  
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="lstNation" /> 
                    <input bind="idSearch" /> 
                   <input bind="idtxtTmp" />
                   <input bind="idList" />
                   <input bind="lstContent" />
                   <input bind="lstStatus" />
                   <input bind="dtFrom" /> 
                   <input bind="dtTo" /> 
                   <input bind="lstGraft" />
                </input> 
                <output bind="idGrid"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datGraft_Book" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="HR_PRO_10040009" > 
                <input>
                    <input bind="txtPK" /> 
                </input> 
                <output>
                    <output bind="txtflag" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datSearch_Save" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="HR_SEL_10040009_1" procedure="HR_UPD_10040009" parameter="0,9,10,11,12,13,14,15,16"> 
                <input bind="idGrid">  
                    <input bind="txtflag_saveno" />  
                </input> 
                <output bind="idGrid"/>
            </dso> 
        </xml> 
</gw:data>

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:14%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
							<tr >
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<gw:list  id="idSearch" value="1" styles='width:100%' onChange="">
										<data>|1|Emp ID|2|Card ID|3|Name</data>
									</gw:list>
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
								</td>								
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<b>Work-Group</b>
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstWG"  value="ALL" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" ><b>Nation</b></td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstNation"  value="01" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...	</data></gw:list>
								</td>
																
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<b>Modify kind</b>
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="idList" value="ALL" styles='width:100%' onChange="">
										<data>|1|Re-issue Health card|2|Modify Social INS|3|Issue Social Book Last Period|4|Graft Social Book No|ALL|Select ALL</data>
									</gw:list>
								</td>
							</tr>
							<tr >	
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstOrg"  value="ALL" styles='width:100%' onchange="onChange_org(1,lstOrg)" >
										<data>
											<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
										</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Content
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstContent"  value="ALL" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code v where v.id='HR0132' order by code_nm ")%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Status
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstStatus"  value="A" styles='width:100%' >
										<data>|A|Active|R|Resign|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Modify Date
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:datebox id="dtFrom" lang="<%=Session("Lang")%>"  nullaccept  ></gw:datebox> ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" nullaccept   ></gw:datebox>
								</td>																
							</tr>
							<tr >	       
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<font color="FF3399"><b>Set</b>
								</td>

								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstSetBy" value=" " styles='width:100%' onChange="OnChangeSetBy()">
											<data>|1|Modify kind|2|Content|3|New value|4|Old value|5|Reason||</data>
									</gw:list>    
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td id="td1" colspan=21 width="21%" style="border:0"  align="left">
									<gw:list  id="lstSetKind" value=" " styles='width:100%' onChange="">
											<data>|1|Re-issue Health card|2|Modify Social INS|3|Issue Social Book Last Period|4|Graft Social Book No||</data>
									</gw:list>
								</td>
								<td id="td2" align=left style=" width:14%;display:none">
									<gw:list  id="lstSetContent"  value="ALL" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code v where v.id='HR0132' order by code_nm ")%>|ALL|Select All</data>
									</gw:list>
								</td>    
								<td id="td4" align=left style=" width:14%;display:none">
									<gw:textbox id="txtText" maxlen = "50" styles="width:98%" onenterkey="" />
								</td>
								<td colspan=2 width="2%" style="border:0" align="right" >
									<gw:imgBtn id="ibtnRpt2" alt="Set Data" img="Set" text="Set Grid" onclick="OnSetGrid()" />
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Graft Book
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
								   <gw:list  id="lstGraft"  value="ALL" styles='width:100%' >
										<data>|Y|Yes|N|No|ALL|Select All</data>
									</gw:list>
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:100%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
							Print<gw:checkbox id="chkCheckPre" value="F" onclick="OnSetPrint(chkCheckPre,idGrid,g1_select)"></gw:checkbox >
						</td>
						<td colspan=5 width="5%" style="border:0">
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:label id="lblRecord" text="" ></gw:label></b>
						</td>
						<td colspan=35 width="35%" style="border:0">
						</td>
						<td colspan=7 width="7%" style="border:0">
							<gw:icon id="idBtnGraft" img="in" text="Graft Book" styles='width:100%' onclick="OnGraft()" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="ibtnAdd" alt="Add New" img="new" text="" onclick="Add_new()" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="ibtnDel" alt="Delete" img="delete" text="" onclick="Delete_row()" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnUpdate()" />
						</td>
						<td colspan=5 width="5%" style="border:0">
							 <gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnPrint()" />
						</td>
						
						<td colspan=10 width="10%" style="border:0">
							<gw:list  id="lstReport" value="1" styles='width:100%' onChange="">
								<data>|1|DS Điều chỉnh BHXH (03b-TBH)|2|DS Cấp lại thẻ BHYT (03-THE)|3|Mẫu đề nghị cấp lại thẻ BHYT (02-THE)|4|DS Cấp sổ BHXH kỳ trước (04-SBH)|5|CV Điều chỉnh BHXH (03b-TBH)|6|CV gộp sổ BHXH|7|CV Điều chỉnh số sổ BHXH</data>
							</gw:list>
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:82%">
				<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
					<tr style="height:100%">
						<td id="master" width="100%">
							<gw:grid
								id="idGrid"
								header="_PK|Select|Organization|EMP_ID|FULL_NM|_Birth Date|_Personal ID|Social No|Health No|Modify Kind|Content|New value|Old value|Modify date|Reason|_EMP_PK|_SAVE_SEQ"
								format="0|3|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0"
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								defaults="||||||||||||||||"
								editcol="0|1|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0"
								widths="0|1500|1500|2000|2000|1500|1500|1500|1800|3000|2000|1000|1000|1500|1500|0|0"
								styles="width:100%;height:100%"
								sorting="T"
								onafteredit="OnCheckEdit()"
								onclick="OnClick()"
								acceptNullDate
								/>
						</td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
</table>

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

