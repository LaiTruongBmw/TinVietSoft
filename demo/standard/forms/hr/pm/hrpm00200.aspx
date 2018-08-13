<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var check_init=0;
var flag;
var strcodereturn;
var binit=true;
var tab2=false;
var tab3=false;
var flag2=false;
var startTime,interval_time
var v_language = "<%=Session("SESSION_LANG")%>";
var rowselect=0;
var flag_wg=1;
var flag_tab = 1;
var bins_sal = 0;
 
var c_emp_pk_1=0
var c_org_1=1
var c_w_group_1=2
var c_emp_id_1=3
var c_full_name_1=4
var c_join_dt_1=5
var c_contract_1=6
var c_pro_sal_1=7
var c_level_1_1=8
var c_level_2_1=9
var c_confirm_dt_1=10
var c_pos_1=11
var c_sal_level_1=12
var c_al1_1=13
var c_al2_1=14
var c_al3_1=15
var c_al4_1=16
var c_al5_1=17
var c_al6_1=18
var c_al7_1=19
var c_al8_1 = 20
var c_al9_1 = 21
var c_al10_1 = 22
var c_al11_1 = 23
var c_al12_1 = 24
var c_al1_l2_1=25
var c_al2_l2_1=26
var c_al3_l2_1=27
var c_al4_l2_1=28
var c_al5_l2_1=29
var c_al6_l2_1=30
var c_al7_l2_1=31
var c_al8_l2_1 = 32
var c_al9_l2_1 = 33
var c_al10_l2_1 = 34
var c_al11_l2_1 = 35
var c_al12_l2_1 = 36
var c_money_1=37
var c_ins_sal_1=38
var c_ot_sal_1=39


var c_emp_pk_2=0
var c_org_2=1
var c_w_group_2=2
var c_emp_id_2=3
var c_full_name_2=4
var c_join_dt_2=5
var c_contract_2=6
var c_level_1_2=7
var c_level_2_2=8
var c_confirm_dt_2=9
var c_pos_2=10
var c_sal_level_2=11
var c_al1_2=12
var c_al2_2=13
var c_al3_2=14
var c_al4_2=15
var c_al5_2=16
var c_al6_2=17
var c_al7_2=18
var c_al8_2 = 19
var c_al9_2 = 20
var c_al10_2 = 21
var c_al11_2 = 22
var c_al12_2 = 23
var c_al1_l2_2=24
var c_al2_l2_2=25
var c_al3_l2_2=26
var c_al4_l2_2=27
var c_al5_l2_2=28
var c_al6_l2_2=29
var c_al7_l2_2=30
var c_al8_l2_2 = 31
var c_al9_l2_2 = 32
var c_al10_l2_2 = 33
var c_al11_l2_2 = 34
var c_al12_l2_2 = 35

var c_work_mon_2=36
var c_close_2=37
var c_sal_type=38
var c_ins_sal_2=39
var c_ot_sal_2=40
var c_money_2=41
var c_sal_note_2=42




function BodyInit()
{
	var t1;
	
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    idDBUSR.text= "<%=session("APP_DBUSER")%>";
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    menu_id.text=System.Menu.GetMenuID();
     

   grdSalary.GetGridControl().FrozenCols =c_join_dt_1;
   grdSalary2.GetGridControl().FrozenCols =c_join_dt_2;
   grdSalary.GetGridControl().ScrollTrack=true;
   grdSalary2.GetGridControl().ScrollTrack=true;
   
   visible_grdSalary(1,3);
   
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
   grdSalary.SetComboFormat(c_pos_1,t1);
   
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select s.pk,POS_GRP_NAME||'-'||RATE  from thr_table_salary s,thr_position_grp g  where s.del_if=0 and thr_position_grp_pk=g.pk and g.del_if=0 order by POS_GRP_NAME||'-'||RATE ")%>";
   grdSalary.SetComboFormat(c_sal_level_1,t1);
   
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0040' order by code_nm")%>";
   grdSalary.SetComboFormat(c_money_1,t1);
   
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
   grdSalary2.SetComboFormat(c_pos_2,t1);
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select s.pk,POS_GRP_NAME||'-'||RATE  from thr_table_salary s,thr_position_grp g  where s.del_if=0 and thr_position_grp_pk=g.pk and g.del_if=0 order by POS_GRP_NAME||'-'||RATE")%>";
   grdSalary2.SetComboFormat(c_sal_level_2,t1);
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0056' order by code_nm")%>";
   grdSalary2.SetComboFormat(c_sal_type,t1);
   
   bins_sal="<%=CtlLib.SetDataSQL("select 1 from vhr_hr_code where id='HR0006' and code='14' and nvl(num_3,0)=1")%>";
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstOrg.SetDataText(t1);
   
   lstOrg2.SetDataText(t1);
  
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstWGroup.SetDataText(t1);
   lstWGroup.value ="ALL";
   
   lstWGroup2.SetDataText(t1);
   lstWGroup2.value ="ALL";
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstPosition.SetDataText(t1);
   lstPosition.value ="ALL";
   
   lstPosition2.SetDataText(t1);
   lstPosition2.value ="ALL";
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstEmp_Type.SetDataText(t1);
   lstEmp_Type.value ="ALL";

   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstStatus.SetDataText(t1);
   lstStatus.value ="A";
   
   lstStatus2.SetDataText(t1);
   lstStatus2.value ="A";
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0040', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstMoney.SetDataText(t1);
   lstMoney.value ="ALL";
   
   lstMoney2.SetDataText(t1);
   lstMoney2.value ="ALL";
   
   t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
   lstNation.SetDataText(t1);
   lstNation.value ="01";
   
   lstNation2.SetDataText(t1);
   lstNation2.value ="01";
  
   ChangeColorItem(lstOrg.GetControl());
   ChangeColorItem(lstOrg2.GetControl());
   

   datAllowance.Call();
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

function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}

function clock(start,x) 
{
 var d = new Date()
 lbldata2.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
//----------------------------------
function InitButton(flag)
{
    ibtnSave.SetEnable(flag);
   
}
//----------------------------------
function OnShowPopup(n)
{
    if(check_init==1)
    {
         var strcom;
        if(n==1||n==3||n==4)
        {
            var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
            if (obj!=null)
            {
                if(n==1)
			    {
                    lstOrg.value=obj;
				   // onChange_org(1,lstOrg);
			    }	
                else if(n==3)    
			    {
                    lstOrg2.value=obj;
				   // onChange_org(2,lstOrg2);	
			    }	
			    
            }    
         }
         
     }     
     
        
    
}
//------------------------------------
function OnChangeMonth(n)
{
    if(n==2)
    {
        grdSalary2.ClearData();
        OnChangeMonth(1);
        
    }    
}
//----------------------------------------------------
function ChoseList_box(obj_list,value)
{
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl();
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//----------------------------------------------
function OnDataReceive(obj)
{  
   if (obj.id=="dat_salary_level")
   {      switch (tabMain.GetCurrentPageNo())
            {   
                case 0:
                {
                    if (grdSalary_level.rows == 2) {//alert("event " + event.row + " row " + grdSalary.row )
                        grdSalary.SetGridText(rowselect, c_level_2_1, grdSalary_level.GetGridData(1, 4));
                        grdSalary.SetGridText(rowselect, c_al1_1, grdSalary_level.GetGridData(1, 5));
                        grdSalary.SetGridText(rowselect, c_al2_1, grdSalary_level.GetGridData(1, 6));
                        grdSalary.SetGridText(rowselect, c_al3_1, grdSalary_level.GetGridData(1, 7));
                        grdSalary.SetGridText(rowselect, c_al4_1, grdSalary_level.GetGridData(1, 8));
                        grdSalary.SetGridText(rowselect, c_al5_1, grdSalary_level.GetGridData(1, 9));
                        grdSalary.SetGridText(rowselect, c_al6_1, grdSalary_level.GetGridData(1, 10));
                        grdSalary.SetGridText(rowselect, c_al7_1, grdSalary_level.GetGridData(1, 11));
                        grdSalary.SetGridText(rowselect, c_al8_1, grdSalary_level.GetGridData(1, 12));
                        grdSalary.SetGridText(rowselect, c_al9_1, grdSalary_level.GetGridData(1, 13));
                        grdSalary.SetGridText(rowselect, c_al10_1, grdSalary_level.GetGridData(1, 14));
                        grdSalary.SetGridText(rowselect, c_al11_1, grdSalary_level.GetGridData(1, 15));
                        grdSalary.SetGridText(rowselect, c_al12_1, grdSalary_level.GetGridData(1, 16));
                    }
						break;
                }
                case 1:
                    {
                        if (grdSalary_level.rows == 2) {
                            grdSalary2.SetGridText(rowselect, c_level_2_2, grdSalary_level.GetGridData(1, 4));
                            grdSalary2.SetGridText(rowselect, c_al1_2, grdSalary_level.GetGridData(1, 5));
                            grdSalary2.SetGridText(rowselect, c_al2_2, grdSalary_level.GetGridData(1, 6));
                            grdSalary2.SetGridText(rowselect, c_al3_2, grdSalary_level.GetGridData(1, 7));
                            grdSalary2.SetGridText(rowselect, c_al4_2, grdSalary_level.GetGridData(1, 8));
                            grdSalary2.SetGridText(rowselect, c_al5_2, grdSalary_level.GetGridData(1, 9));
                            grdSalary2.SetGridText(rowselect, c_al6_2, grdSalary_level.GetGridData(1, 10));
                            grdSalary2.SetGridText(rowselect, c_al7_2, grdSalary_level.GetGridData(1, 11));
                            grdSalary2.SetGridText(rowselect, c_al8_2, grdSalary_level.GetGridData(1, 12));
                            grdSalary2.SetGridText(rowselect, c_al9_2, grdSalary_level.GetGridData(1, 13));
                            grdSalary2.SetGridText(rowselect, c_al10_2, grdSalary_level.GetGridData(1, 14));
                            grdSalary2.SetGridText(rowselect, c_al11_2, grdSalary_level.GetGridData(1, 15));
                            grdSalary2.SetGridText(rowselect, c_al12_2, grdSalary_level.GetGridData(1, 16));
                        }
                    break;
                }
            }  
      
   }
   else if (obj.id=="datAllowance")
   {

        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnSave2.style.display = "none";
            ibtnProcess2.style.display = "none";
            ibtnCancel2.style.display = "none";
        }

        var tmp; //value of allowance col

		tmp=idALL1_NM.text +" L1";
		grdSalary.SetGridText(0,c_al1_1,tmp);
		grdSalary2.SetGridText(0,c_al1_2,tmp);
		
		tmp=idALL2_NM.text+" L1";
        grdSalary.SetGridText(0,c_al2_1,tmp);
        grdSalary2.SetGridText(0,c_al2_2,tmp);
		
		tmp=idALL3_NM.text+" L1";
        grdSalary.SetGridText(0,c_al3_1,tmp);
        grdSalary2.SetGridText(0,c_al3_2,tmp);
		
		tmp=idALL4_NM.text+" L1";
        grdSalary.SetGridText(0,c_al4_1,tmp);
        grdSalary2.SetGridText(0,c_al4_2,tmp);
		
		tmp=idALL5_NM.text+" L1";
        grdSalary.SetGridText(0,c_al5_1,tmp);
        grdSalary2.SetGridText(0,c_al5_2,tmp);
		
		tmp=idALL6_NM.text+" L1";
        grdSalary.SetGridText(0,c_al6_1,tmp);
        grdSalary2.SetGridText(0,c_al6_2,tmp);
		
		tmp=idALL7_NM.text+" L1";
        grdSalary.SetGridText(0,c_al7_1,tmp);
        grdSalary2.SetGridText(0,c_al7_2,tmp);
		
		tmp=idALL8_NM.text+" L1";
		grdSalary.SetGridText(0, c_al8_1, tmp);
		grdSalary2.SetGridText(0, c_al8_2, tmp);

		tmp = idALL9_NM.text + " L1";
		grdSalary.SetGridText(0, c_al9_1, tmp);
		grdSalary2.SetGridText(0, c_al9_2, tmp);

		tmp = idALL10_NM.text + " L1";
		grdSalary.SetGridText(0, c_al10_1, tmp);
		grdSalary2.SetGridText(0, c_al10_2, tmp);

		tmp = idALL11_NM.text + " L1";
		grdSalary.SetGridText(0, c_al11_1, tmp);
		grdSalary2.SetGridText(0, c_al11_2, tmp);

		tmp = idALL12_NM.text + " L1";
		grdSalary.SetGridText(0, c_al12_1, tmp);
		grdSalary2.SetGridText(0, c_al12_2, tmp);
		
		if (txtAllow_two_level.text == 'Y') {
		    grdSalary.GetGridControl().ColHidden(c_al1_1) = !(Number(idALL1_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al2_1) = !(Number(idALL2_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al3_1) = !(Number(idALL3_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al4_1) = !(Number(idALL4_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al5_1) = !(Number(idALL5_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al6_1) = !(Number(idALL6_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al7_1) = !(Number(idALL7_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al8_1) = !(Number(idALL8_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al9_1) = !(Number(idALL9_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al10_1) = !(Number(idALL10_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al11_1) = !(Number(idALL11_USE.text));
		    grdSalary.GetGridControl().ColHidden(c_al12_1) = !(Number(idALL12_USE.text));
			
			grdSalary2.GetGridControl().ColHidden(c_al1_2) = !(Number(idALL1_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al2_2) = !(Number(idALL2_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al3_2) = !(Number(idALL3_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al4_2) = !(Number(idALL4_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al5_2) = !(Number(idALL5_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al6_2) = !(Number(idALL6_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al7_2) = !(Number(idALL7_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al8_2) = !(Number(idALL8_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al9_2) = !(Number(idALL9_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al10_2) = !(Number(idALL10_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al11_2) = !(Number(idALL11_USE.text));
		    grdSalary2.GetGridControl().ColHidden(c_al12_2) = !(Number(idALL12_USE.text));
		}
		else
		{
		    for (var i = c_al1_1; i <= c_al12_1; i++)
			{
				grdSalary.GetGridControl().ColHidden(i) = 1;
			}
			for (var i = c_al1_2; i <= c_al12_2; i++)
			{
				grdSalary2.GetGridControl().ColHidden(i) = 1;
			}
		        
		}
		//allowance level 2
		tmp=idALL1_NM.text+" L2";
		grdSalary.SetGridText(0,c_al1_l2_1,tmp);
		grdSalary2.SetGridText(0,c_al1_l2_2,tmp);
		
		tmp=idALL2_NM.text+" L2";
        grdSalary.SetGridText(0,c_al2_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al2_l2_2,tmp);
		
		tmp=idALL3_NM.text+" L2";
        grdSalary.SetGridText(0,c_al3_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al3_l2_2,tmp);
		
		tmp=idALL4_NM.text+" L2";
        grdSalary.SetGridText(0,c_al4_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al4_l2_2,tmp);
		
		tmp=idALL5_NM.text+" L2";
        grdSalary.SetGridText(0,c_al5_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al5_l2_2,tmp);
		
		tmp=idALL6_NM.text+" L2";
        grdSalary.SetGridText(0,c_al6_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al6_l2_2,tmp);
		
		tmp=idALL7_NM.text+" L2";
        grdSalary.SetGridText(0,c_al7_l2_1,tmp);
        grdSalary2.SetGridText(0,c_al7_l2_2,tmp);
		
		tmp=idALL8_NM.text+" L2";
		grdSalary.SetGridText(0, c_al8_l2_1, tmp);
		grdSalary2.SetGridText(0, c_al8_l2_2, tmp);

		tmp = idALL9_NM.text + " L2";
		grdSalary.SetGridText(0, c_al9_l2_1, tmp);
		grdSalary2.SetGridText(0, c_al9_l2_2, tmp);

		tmp = idALL10_NM.text + " L2";
		grdSalary.SetGridText(0, c_al10_l2_1, tmp);
		grdSalary2.SetGridText(0, c_al10_l2_2, tmp);

		tmp = idALL11_NM.text + " L2";
		grdSalary.SetGridText(0, c_al11_l2_1, tmp);
		grdSalary2.SetGridText(0, c_al11_l2_2, tmp);

		tmp = idALL12_NM.text + " L2";
		grdSalary.SetGridText(0, c_al12_l2_1, tmp);
		grdSalary2.SetGridText(0, c_al12_l2_2, tmp);
		
		grdSalary.GetGridControl().ColHidden(c_al1_l2_1)=!(Number(idALL1_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al2_l2_1)=!(Number(idALL2_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al3_l2_1)=!(Number(idALL3_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al4_l2_1)=!(Number(idALL4_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al5_l2_1)=!(Number(idALL5_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al6_l2_1)=!(Number(idALL6_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al7_l2_1)=!(Number(idALL7_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al8_l2_1) = !(Number(idALL8_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al9_l2_1) = !(Number(idALL9_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al10_l2_1) = !(Number(idALL10_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al11_l2_1) = !(Number(idALL11_USE.text));
        grdSalary.GetGridControl().ColHidden(c_al12_l2_1) = !(Number(idALL12_USE.text));
		
        grdSalary2.GetGridControl().ColHidden(c_al1_l2_2)=!(Number(idALL1_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al2_l2_2)=!(Number(idALL2_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al3_l2_2)=!(Number(idALL3_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al4_l2_2)=!(Number(idALL4_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al5_l2_2)=!(Number(idALL5_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al6_l2_2)=!(Number(idALL6_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al7_l2_2)=!(Number(idALL7_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al8_l2_2) = !(Number(idALL8_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al9_l2_2) = !(Number(idALL9_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al10_l2_2) = !(Number(idALL10_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al11_l2_2) = !(Number(idALL11_USE.text));
        grdSalary2.GetGridControl().ColHidden(c_al12_l2_2) = !(Number(idALL12_USE.text));
       

        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
            datUser_info.Call(); 
		else
            check_init=1;
			//OnChangeLocation();
        
   }
   else if(obj.id=="datCurrent_Salary")
   {
        lblRecord.text=grdSalary.rows-1 ;
        if (grdSalary.rows>1)
        {
            InitButton(true);
            auto_resize_column(grdSalary,0,grdSalary.GetGridControl().cols-1,0)
        }
        else
        {
            InitButton(false);
        }
        
   }
   else if (obj.id=="datUser_info")
   {
       
            lstOrg.SetDataText(txtdept_temp.text);            
            lstOrg2.SetDataText(txtdept_temp.text);

            ChangeColorItem(lstOrg.GetControl());
            ChangeColorItem(lstOrg2.GetControl());

            check_init=1;
            //OnChangeLocation();
       
   }
   
  
   else if (obj.id=="datMonth_Salary")
   {
        lblRecord2.text=grdSalary2.rows-1 ;
        auto_resize_column(grdSalary2,0,grdSalary2.GetGridControl().cols-1,0)
       for(var i=1;i<grdSalary2.rows;i++)
     {
     if(grdSalary2.GetGridData(i,c_close_2)=="M")
              grdSalary2.SetCellBgColor(i, 0,i, c_close_2, 0x99FFFF );
     if(grdSalary2.GetGridData(i,c_close_2)=="Y")      
             grdSalary2.SetCellBgColor(i, 0,i, c_close_2, 0xFFEEFF );
     }              
        
   }
   else if (obj.id=="datSalary_Create_Del")
   {
        if(txtresult.text=='0')
        {
            alert((v_language=='ENG') ?"Finish!":"Hoàn thành!")
            clear_Interval(lbldata2);
        }        
        else if (txtresult.text=='1')
        {
            alert((v_language=='ENG') ?"Salary period have been undefined !":"Chu kỳ lương tháng này chưa đuợc định nghĩa!")
            clear_Interval(lbldata2);
            lbldata2.text=(v_language=='ENG') ? "Have error":"Có lỗi xảy ra";
        }
        else
        {
            alert((v_language=='ENG') ?"There is error occur.":"Đã có lỗi xảy ra.")
            clear_Interval(lbldata2);
            lbldata2.text=(v_language=='ENG') ? "Have error":"Có lỗi xảy ra";
        }   
       
   }
   
}
//-------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

//------------------------------------------------------
function checkNumber(n)
{
    if(n==1)
    {
	        var ctrl 	= grdSalary.GetGridControl();
	        var rownum 	= ctrl.Rows;
        	
	        if(rownum == 1)
	            return false;
        	
	        var i;
	        for(i=1; i<rownum; i++)
	        {
	 	        for(j=c_pro_sal_1; j <= c_al12_l2_1; j++)
		        {
		            if (j<c_level_2_1 || j>c_pos_1)
			        {
			            var ij_num 	= grdSalary.GetGridData(i, j);
			            if (isNaN(ij_num))
			            {
				            alert((v_language=='ENG') ? "Please enter is number at row " + i + " and column " + (j-1) : "Vui long nhập số tại dòng " + i + " và cột " + (j-1) );
				            return false;
			            }
			            if (Number(ij_num) < -1)
			            {
				            alert((v_language=='ENG') ? "Please enter is number >= -1 at row " + i + " and column " + (j-1) : "Vui lòng nhập vào số >=-1 tại dòng "  + i + " và cột " + (j-1));
				            return false;
			            }
			        }
		        }	
	        }
	        return true;
	 }   
    else if(n==2)
    {
	        var ctrl 	= grdSalary2.GetGridControl();
	        var rownum 	= ctrl.Rows;
        	
	        if(rownum == 1)
	            return false;
        	
	        var i;
	        for(i=1; i<rownum; i++)
	        {
	 	        for(j=c_level_1_2; j <= c_al8_l2_2; j++)
		        {
		            if (j<c_confirm_dt_2 || j>c_pos_2)
			        {
			            var ij_num 	= grdSalary2.GetGridData(i, j);
			            if (isNaN(ij_num))
			            {
				            alert("Please enter is number at col " + i + " and " + (j-1) );
				            return false;
			            }
			            if (Number(ij_num) < -1)
			            {
				            alert("Please enter is number >= -1 at col " + i + " and " + (j-1) );
				            return false;
			            }
			        }
		        }	
	        }
	        return true;
	 }  
}


//----------------------------------------------------
function OnSearch(n)
{
	if(check_init==1)
	{
		if(n==1)
			datCurrent_Salary.Call("SELECT");
		else if(n==2)
			datMonth_Salary.Call("SELECT");    
        else if(n==3)
			datMonth_imp.Call("SELECT");   
	}	
    else
    {
        alert((v_language=='ENG') ? "Form load not yet finish, please refresh from":" Form chưa khởi tạo xong, vui lòng chọn refresh lại");
    }		
}

//-----------------------------------------------
function OnSave(n)
{
	if(check_init==1)
	{
    
        if (confirm((v_language=='ENG') ? "Do you want to save? ":" Bạn có muốn lưu không?"))
        {
            if(n==1)
            {
                if (checkNumber(1))
                     datCurrent_Salary.Call();
            }
            else if(n==2)
            {
                if (checkNumber(2))
                     datMonth_Salary.Call();
            }        
        }
	}
    else
    {
        alert((v_language=='ENG') ? "Form load not yet finish, please refresh from ":" Form chưa khởi tạo xong, vui lòng chọn refresh lại");
    }	
       
}


//----------------------------------------------------
function OnSetConfirmDate(n)
{
    if(n==1)//tab 1 current
    {
        var ctrl = grdSalary.GetGridControl();
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    grdSalary.SetGridText(row,c_confirm_dt_1,dtConfirmDate.value);
			    }	
		    }
	}	    
	else if(n==2)//tab 2 month
    {
        var ctrl = grdSalary2.GetGridControl();
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    grdSalary2.SetGridText(row,c_confirm_dt_2,dtConfirmDate2.value);
			    }	
		    }
	}	    
}
//----------------------------------------------------

//--------------------------------------------------------------
function  OnClickGrid(n)
{
    switch(n)
    {
        case 1:
            if (event.col==c_pos_1) // double on position column
            {
                var pos_code=grdSalary.GetGridData(event.row,event.col);
                var id="HR0008";
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_code.aspx?code=" + pos_code + "&id=" + id;
                var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:30;dialogHeight:25;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
                if (obj!=null)
                {
                    
                    if(obj[0]!=pos_code)
                    {
                        grdSalary.SetGridText(event.row,event.col,obj[0]);
                        grdSalary.SetCellBgColor(event.row, event.col,event.row, event.col, 0xcc99ff );
                        grdSalary.SetCellBold(event.row,event.col,event.row,event.col,true);
                    }
                }
            }
             if (event.col==c_sal_level_1) // double on c_sal_level column
            {
                var pos_code=grdSalary.GetGridData(event.row,event.col);
               
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_slary_level.aspx?pk=" + pos_code +"&option=1";
                var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:50;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
                if (obj!=null)
                {
                    
                    if(obj[0]!=pos_code)
                    {
                        grdSalary.SetGridText(event.row,event.col,obj[0]);
                        grdSalary.SetGridText(event.row,c_level_2_1,obj[1]);
                        grdSalary.SetGridText(event.row,c_al1_l2_1,obj[2]);
                        grdSalary.SetGridText(event.row,c_al2_l2_1,obj[3]);
                        grdSalary.SetGridText(event.row,c_al3_l2_1,obj[4]);
                        grdSalary.SetGridText(event.row,c_al4_l2_1,obj[5]);
                        grdSalary.SetGridText(event.row,c_al5_l2_1,obj[6]);
                        grdSalary.SetGridText(event.row,c_al6_l2_1,obj[7]);
                        grdSalary.SetGridText(event.row,c_al7_l2_1,obj[8]);
                        grdSalary.SetGridText(event.row,c_al8_l2_1,obj[9]);
                        
                        
                        
                        grdSalary.SetCellBgColor(event.row, event.col,event.row, event.col, 0xcc99ff );
                        grdSalary.SetCellBold(event.row,event.col,event.row,event.col,true);
                    }
                }
            }
            else if (event.col<=c_contract_1) // 
            {
                var emp_id=grdSalary.GetGridData(event.row,c_emp_id_1);
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary_his.aspx?emp_id=" + emp_id;
                window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:60;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
            }
            break;
        case 2:
            if (event.col==c_pos_2) // double on position column
            {
                var pos_code=grdSalary2.GetGridData(event.row,event.col);
                var id="HR0008";
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_code.aspx?code=" + pos_code + "&id=" + id;
                var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:30;dialogHeight:25;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
                
                 if (obj!=null)
                {
                    
                    if(obj[0]!=pos_code)
                    {
                        grdSalary2.SetGridText(event.row,event.col,obj[0]);
                        grdSalary2.SetCellBgColor(event.row, event.col,event.row, event.col, 0xcc99ff );
                        grdSalary2.SetCellBold(event.row,event.col,event.row,event.col,true);
                    }
                }
            }
              if (event.col==c_sal_level_2) // double on position column
            {
                var pos_code=grdSalary2.GetGridData(event.row,event.col);
               // var id="HR0008";
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary_level.aspx?pk=" + pos_code +"&option=1";
                var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:50;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
                if (obj!=null)
                {
                    
                    if(obj[0]!=pos_code)
                    {
                        grdSalary2.SetGridText(event.row,event.col,obj[0]);
                        grdSalary2.SetGridText(event.row,c_level_2_2,obj[1]);
                        grdSalary2.SetGridText(event.row,c_al1_l2_2,obj[2]);
                        grdSalary2.SetGridText(event.row,c_al2_l2_2,obj[3]);
                        grdSalary2.SetGridText(event.row,c_al3_l2_2,obj[4]);
                        grdSalary2.SetGridText(event.row,c_al4_l2_2,obj[5]);
                        grdSalary2.SetGridText(event.row,c_al5_l2_2,obj[6]);
                        grdSalary2.SetGridText(event.row,c_al6_l2_2,obj[7]);
                        grdSalary2.SetGridText(event.row,c_al7_l2_2,obj[8]);
                        grdSalary2.SetGridText(event.row,c_al8_l2_2,obj[9]);
                        
                        grdSalary.SetCellBgColor(event.row, event.col,event.row, event.col, 0xcc99ff );
                        grdSalary.SetCellBold(event.row,event.col,event.row,event.col,true);
                    }
                }
            }
            else if (event.col<=c_contract_2) // 
            {
                var emp_id=grdSalary2.GetGridData(event.row,c_emp_id_2);
                var fpath = System.RootURL + "/form/ch/cs/chcs0020_salary.aspx?emp_id=" + emp_id;
                window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:60;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
            }
            break;    
    }    
}

function onPage_active()
{
    if(check_init==1)
    {
        if(tabMain.GetCurrentPageNo()==1)
        {
            if(tab2==false)
            {

			    var tmp; //value of allowance col
		        tmp=idALL1_NM.text+" L1";
		        grdSalary2.SetGridText(0,c_al1_2,tmp);
		
		        tmp=idALL2_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al2_2,tmp);
		
		        tmp=idALL3_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al3_2,tmp);
		
		        tmp=idALL4_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al4_2,tmp);
		
		        tmp=idALL5_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al5_2,tmp);
		
		        tmp=idALL6_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al6_2,tmp);
		
		        tmp=idALL7_NM.text+" L1";
                grdSalary2.SetGridText(0,c_al7_2,tmp);
		
		        tmp=idALL8_NM.text+" L1";
		        grdSalary2.SetGridText(0, c_al8_2, tmp);

		        tmp = idALL9_NM.text + " L1";
		        grdSalary2.SetGridText(0, c_al9_2, tmp);

		        tmp = idALL10_NM.text + " L1";
		        grdSalary2.SetGridText(0, c_al10_2, tmp);

		        tmp = idALL11_NM.text + " L1";
		        grdSalary2.SetGridText(0, c_al11_2, tmp);

		        tmp = idALL12_NM.text + " L1";
		        grdSalary2.SetGridText(0, c_al12_2, tmp);
		
		        if (txtAllow_two_level.text == 'Y') {
		            grdSalary2.GetGridControl().ColHidden(c_al1_2) = !(Number(idALL1_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al2_2) = !(Number(idALL2_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al3_2) = !(Number(idALL3_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al4_2) = !(Number(idALL4_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al5_2) = !(Number(idALL5_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al6_2) = !(Number(idALL6_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al7_2) = !(Number(idALL7_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al8_2) = !(Number(idALL8_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al9_2) = !(Number(idALL9_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al10_2) = !(Number(idALL10_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al11_2) = !(Number(idALL11_USE.text));
		            grdSalary2.GetGridControl().ColHidden(c_al12_2) = !(Number(idALL12_USE.text));
		        }
		        else {
		            for (var i = c_al1_2; i <= c_al12_2; i++)
		                grdSalary2.GetGridControl().ColHidden(i) = 1;
		        }

		        //allowance level 2
		        tmp=idALL1_NM.text+" L2";
		        grdSalary2.SetGridText(0,c_al1_l2_2,tmp);
		
		        tmp=idALL2_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al2_l2_2,tmp);
		
		        tmp=idALL3_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al3_l2_2,tmp);
		
		        tmp=idALL4_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al4_l2_2,tmp);
		
		        tmp=idALL5_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al5_l2_2,tmp);
		
		        tmp=idALL6_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al6_l2_2,tmp);
		
		        tmp=idALL7_NM.text+" L2";
                grdSalary2.SetGridText(0,c_al7_l2_2,tmp);
		
		        tmp=idALL8_NM.text+" L2";
		        grdSalary2.SetGridText(0, c_al8_l2_2, tmp);

		        tmp = idALL9_NM.text + " L2";
		        grdSalary2.SetGridText(0, c_al9_l2_2, tmp);

		        tmp = idALL10_NM.text + " L2";
		        grdSalary2.SetGridText(0, c_al10_l2_2, tmp);

		        tmp = idALL11_NM.text + " L2";
		        grdSalary2.SetGridText(0, c_al11_l2_2, tmp);

		        tmp = idALL12_NM.text + " L2";
		        grdSalary2.SetGridText(0, c_al12_l2_2, tmp);
		
		        grdSalary2.GetGridControl().ColHidden(c_al1_l2_2)=!(Number(idALL1_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al2_l2_2)=!(Number(idALL2_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al3_l2_2)=!(Number(idALL3_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al4_l2_2)=!(Number(idALL4_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al5_l2_2)=!(Number(idALL5_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al6_l2_2)=!(Number(idALL6_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al7_l2_2)=!(Number(idALL7_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al8_l2_2) = !(Number(idALL8_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al9_l2_2) = !(Number(idALL9_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al10_l2_2) = !(Number(idALL10_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al11_l2_2) = !(Number(idALL11_USE.text));
                grdSalary2.GetGridControl().ColHidden(c_al12_l2_2) = !(Number(idALL12_USE.text));

                auto_resize_column(grdSalary2,0,grdSalary2.GetGridControl().cols-1,0);
		
                tab2=true;
                
                visible_grdSalary(2,3);
                txtDept.text=lstOrg2.value;
            
            
             }   
        
        }
        
    }
    
}
//------------------------------------------

function OnToggle(n)
{
    switch(n)
    {
        case 1:
            if(img1.status == "middle")
            {
                img1.status = "large";
                img1.src = "../../../../system/images/iconmaximize.gif";
			    img1.alt="Show all columns";
			    visible_grdSalary(1,2);
    			
            }
            else if(img1.status == "large")
            {
                img1.status = "min";
                img1.src = "../../../../system/images/iconminimize.gif";
			    img1.alt="Hide column";
			    visible_grdSalary(1,1);
            }
            else if(img1.status == "min")
            {
                img1.status = "middle";
                img1.src = "../../../../system/images/menu.gif";
			    img1.alt="Show more columns";
			    visible_grdSalary(1,3);
            }
            break;
       
       case 3:
            if(img3.status == "middle")
            {
                img3.status = "large";
                img3.src = "../../../../system/images/iconmaximize.gif";
			    img3.alt="Show all columns";
			    visible_grdSalary(2,2);
    			
            }
            else if(img3.status == "large")
            {
                img3.status = "min";
                img3.src = "../../../system/images/iconminimize.gif";
			    img3.alt="Hide column";
			    visible_grdSalary(2,1);
            }
            else if(img3.status == "min")
            {
                img3.status = "middle";
                img3.src = "../../../../system/images/menu.gif";
			    img3.alt="Show more columns";
			    visible_grdSalary(2,3);
            }
            break;       
    }    
    
  
}
function visible_grdSalary(grid_no,n)
{
    if(grid_no==1)
    {
        switch(n)
        {
            case 1://middle
               
                grdSalary.GetGridControl().ColHidden(c_org_1)=0;
                grdSalary.GetGridControl().ColHidden(c_w_group_1)=0;
                grdSalary.GetGridControl().ColHidden(c_join_dt_1)=0;
                grdSalary.GetGridControl().ColHidden(c_contract_1)=0;
                grdSalary.GetGridControl().ColHidden(c_pro_sal_1)=0;
                break;
            case 2://large
                //alert(2)
                grdSalary.GetGridControl().ColHidden(c_w_group_1)=0;
                grdSalary.GetGridControl().ColHidden(c_join_dt_1)=0;
                grdSalary.GetGridControl().ColHidden(c_pro_sal_1)=0;
                break;
            case 3://hide all
                //alert(3)
                grdSalary.GetGridControl().ColHidden(c_org_1)=1;
                grdSalary.GetGridControl().ColHidden(c_w_group_1)=1;
                grdSalary.GetGridControl().ColHidden(c_join_dt_1)=1;
                grdSalary.GetGridControl().ColHidden(c_contract_1)=1;
                grdSalary.GetGridControl().ColHidden(c_pro_sal_1)=1;
                break;    
        }
    }
    else if(grid_no==2)
    {
        switch(n)
        {
            case 1://middle
               
                grdSalary2.GetGridControl().ColHidden(c_org_2)=0;
                grdSalary2.GetGridControl().ColHidden(c_w_group_2)=0;
                grdSalary2.GetGridControl().ColHidden(c_join_dt_2)=0;
                grdSalary2.GetGridControl().ColHidden(c_contract_2)=0;
                
                break;
            case 2://large
                //alert(2)
                grdSalary2.GetGridControl().ColHidden(c_w_group_2)=0;
                grdSalary2.GetGridControl().ColHidden(c_join_dt_2)=0;
                
                break;
            case 3://hide all
                //alert(3)
                grdSalary2.GetGridControl().ColHidden(c_org_2)=1;
                grdSalary2.GetGridControl().ColHidden(c_w_group_2)=1;
                grdSalary2.GetGridControl().ColHidden(c_join_dt_2)=1;
                grdSalary2.GetGridControl().ColHidden(c_contract_2)=1;
                
                break;    
        }
    }    
}

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

function OnProcess()
{
	
	var fpath = System.RootURL + "/standard/forms/hr/pm/hrpm00201.aspx?month=" + dtMonth2.value + '&org_pk=' + lstOrg2.value + '&emp_id=' + txtTemp2.text;
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:35;dialogHeight:25;edge:sunken;scroll:yes;unadorned:yes;help:no');
	  
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
<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_HRPM00200_0"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                    <output bind="txtAllow_two_level" />
                    <output bind="idALL1_NM" />
                    <output bind="idALL2_NM" />
                    <output bind="idALL3_NM" />
                    <output bind="idALL4_NM" />
                    <output bind="idALL5_NM" />
                    <output bind="idALL6_NM" />
                    <output bind="idALL7_NM" />
                    <output bind="idALL8_NM" />
                    <output bind="idALL9_NM" />
                    <output bind="idALL10_NM" />
                    <output bind="idALL11_NM" />
                    <output bind="idALL12_NM" />
                    <output bind="idALL1_USE" />
                    <output bind="idALL2_USE" />
                    <output bind="idALL3_USE" />
                    <output bind="idALL4_USE" />
                    <output bind="idALL5_USE" />
                    <output bind="idALL6_USE" />
                    <output bind="idALL7_USE" />
                    <output bind="idALL8_USE" />
                    <output bind="idALL9_USE" />
                    <output bind="idALL10_USE" />
                    <output bind="idALL11_USE" />
                    <output bind="idALL12_USE" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datCurrent_Salary" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39" function="ST_HR_SEL_HRPM00200_0" procedure="ST_HR_UPD_HRPM00200_0"> 
                <input bind="grdSalary" >
                   <input bind="lstOrg" /> 
                   <input bind="lstWGroup" /> 
                   <input bind="lstPosition" /> 
                   <input bind="txtTemp" /> 
                   <input bind="lstContract_Type" /> 
                   <input bind="lstStatus" /> 
                   <input bind="dtFrom_JoinDate" /> 
                   <input bind="dtTo_JoinDate" /> 
                   <input bind="dtFrom_ConfirmDate" /> 
                   <input bind="dtTo_ConfirmDate" /> 
                   <input bind="lstMoney" />
                   <input bind="lstEmp_Type" />
                   <input bind="lstNation" />
                </input>
                <output  bind="grdSalary" />
            </dso> 
        </xml> 
</gw:data>
   
<!------------------------------------------>
<gw:data id="datMonth_Salary" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40,41" function="ST_HR_SEL_HRPM00200_1" procedure="ST_HR_UPD_HRPM00200_1"> 
                <input bind="grdSalary2" >
                   <input bind="lstOrg2" /> 
                   <input bind="lstWGroup2" /> 
                   <input bind="lstPosition2" /> 
                   <input bind="txtTemp2" /> 
                   <input bind="lstContract_Type2" /> 
                   <input bind="lstStatus2" /> 
                   <input bind="dtFrom_JoinDate2" /> 
                   <input bind="dtTo_JoinDate2" /> 
                   <input bind="dtFrom_ConfirmDate2" /> 
                   <input bind="dtTo_ConfirmDate2" /> 
                   <input bind="dtMonth2" />
                   <input bind="lstEmp_Type2" />
				   <input bind="lstMoney2" />
                   
                </input>
                <output  bind="grdSalary2" />
            </dso> 
        </xml> 
</gw:data>



<!-------------------data control----------------------->
<gw:tab id="tabMain" border="0" style="width:100%;height:100%;" onpageactivate="onPage_active()"  >
    <table name="Current Salary" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>				
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0.5;width:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp" onenterkey   ="OnSearch(1)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 style="border:0" width="10%" align="left" >
										Employee Type
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstEmp_Type" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstPosition" value='ALL' styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0;width:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg" value='ALL' styles='width:100%' onchange="" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >							
									<td colspan=2 width="2%" style="border:0" align="center" >
										<img status="middle" id="img1" alt="Show more columns" src="../../../../system/images/menu.gif" style="cursor:hand" onclick="OnToggle(1)"  />
									</td>
									<td colspan=10 style="border:0" width="10%" align="left" >
										Money kind
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstMoney" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Confirm Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_ConfirmDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_ConfirmDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Nation
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' />
									</td>									
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >
							</td>														
							<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button img="search" text="Search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(1)"/>	
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" text="Save" id="ibtnSave"    alt="Save"  onclick="OnSave(1)"/>
							</td>
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:81%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
									id="grdSalary"  
									header="_EMP_PK|Organization|W-Group|Emp ID|Full Name|Join Date|Contract Type|Pro Salary|Level 1|Level 2|Confirm DT|_Postion|_Salary Level|Allow1_l1|Allow2_l1|Allow3_l1|Allow4_l1|allow5_l1|Allow6_l1|Allow7_l1|Allow8_l1|Allow9_l1|Allow10_l1|Allow11_l1|Allow12_l1
											|Allow1_l2|Allow2_l2|Allow3_l2|Allow4_l2|allow5_l2|Allow6_l2|Allow7_l2|Allow8_l2|Allow9_l2|Allow10_l2|Allow11_l2|Allow12_l2|Money Kind|Ins Salary|OT Salary"
									format="0|0|0|0|0|4|0|-0|-0|-0|4|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|-0|-0"  
									aligns="0|2|2|1|0|1|1|3|3|3|3|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="|||||||||||||||||||||||||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
									widths="0|1500|1600|1000|2500|1200|1700|1200|1200|1200|1200|1200|1500|1700|1700|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
									styles="width:100%; height:100%" 
									sorting="T" acceptNullDate   
									oncelldblclick="OnClickGrid(1)"
									onafteredit=""
									/> 
                        </td>
                    </tr>
					</table>
				</div>	
            </td>
        </tr>
    </table>
	 <table name="Month Salary" id="MonthSal" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>				
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp2" onenterkey   ="OnSearch(2)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Month
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:datebox id="dtMonth2"  onchange="OnChangeMonth(2)" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Position</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstPosition2" value='ALL' styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg2" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeLocation()" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_JoinDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_JoinDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus2" value='A' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Money kind
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstMoney2" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Confirm Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_ConfirmDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_ConfirmDate2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Nation
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstNation2" value='01' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center"  >
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord2"  text="" maxlen = "100" />
							</td>
							<td colspan=70 width="70%" style="border:0" align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="search" text="Search" id="ibtnSearch2"   alt="Search"  onclick="OnSearch(2)"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="save" text="Save" id="ibtnSave2"    alt="Save"  onclick="OnSave(2)"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button id="ibtnprocess"   img="process"  text="Process"  onclick="OnProcess()"/>
							</td>							
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:81%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:1;width:100%;height:75%" valign="top">
							<td colspan=100 style="width:100%;height:100%;"> 
								 <gw:grid   
									id="grdSalary2"  
									header="_EMP_PK|Organization|W-Group|Emp ID|Full Name|Join Date|Contract Type|Level 1|Level 2|Confirm DT|_Postion|_Salary Level|Allow1|Allow2|Allow3|Allow4|allow5|Allow6|Allow7|Allow8|Allow9_l1|Allow10_l1|Allow11_l1|Allow12_l1
											|Allow1_2|Allow2_2|Allow3_2|Allow4_2|allow5_2|Allow6_2|Allow7_2|Allow8_2|Allow9_l2|Allow10_l2|Allow11_l2|Allow12_l2|_WMON|_close|_Salary Type|INS Salary|OT Salary|_Currency|Salary Note"
									format="0|0|0|0|0|4|0|-0|-0|4|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|2|-0|-0|0|0"  
									aligns="0|2|2|1|0|1|1|3|3|3|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="||||||||||||||||||||||||||||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|1|1|1|0|1"  
									widths="0|1500|1600|1000|2500|1200|1700|1200|1200|1200|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|17500|1500|1500|1500|1500|1500|1500|0|0|1500|1500|1500|1500|1500"  
									styles="width:100%; height:100%" 
									sorting="T" acceptNullDate   
									oncelldblclick="OnClickGrid(2)"
									onafteredit=""
									/> 
							</td>
						</tr>
					</table>
				</div>	
               
            </td>
        </tr>
    </table>
    </gw:tab>
</body>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="dtEndDate" styles="display:none" />
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtDept" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtFlag" styles="display:none"/>
<gw:textbox id="txtresult" styles="display:none"/>
<gw:textbox id="txtMonth_flag" styles="display:none"/>
<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 


 <!------------------------------------------------->
<gw:textbox id="idSAL_ALL" styles="display:none"/>  

<gw:textbox id="idALL1_NM" styles="display:none"/>
<gw:textbox id="idALL2_NM" styles="display:none"/>
<gw:textbox id="idALL3_NM" styles="display:none"/>
<gw:textbox id="idALL4_NM" styles="display:none"/>
<gw:textbox id="idALL5_NM" styles="display:none"/>
<gw:textbox id="idALL6_NM" styles="display:none"/>
<gw:textbox id="idALL7_NM" styles="display:none"/>
<gw:textbox id="idALL8_NM" styles="display:none"/>
<gw:textbox id="idALL9_NM" styles="display:none"/>
<gw:textbox id="idALL10_NM" styles="display:none"/>
<gw:textbox id="idALL11_NM" styles="display:none"/>
<gw:textbox id="idALL12_NM" styles="display:none"/>

<gw:textbox id="idALL1_USE" styles="display:none"/>
<gw:textbox id="idALL2_USE" styles="display:none"/>
<gw:textbox id="idALL3_USE" styles="display:none"/>
<gw:textbox id="idALL4_USE" styles="display:none"/>
<gw:textbox id="idALL5_USE" styles="display:none"/>
<gw:textbox id="idALL6_USE" styles="display:none"/>
<gw:textbox id="idALL7_USE" styles="display:none"/>
<gw:textbox id="idALL8_USE" styles="display:none"/>
<gw:textbox id="idALL9_USE" styles="display:none"/>
<gw:textbox id="idALL10_USE" styles="display:none"/>
<gw:textbox id="idALL11_USE" styles="display:none"/>
<gw:textbox id="idALL12_USE" styles="display:none"/>

<gw:textbox id="txtAllow_two_level" styles="display:none"/>       
<gw:textbox id="idSalKind_tmp" styles="display:none"/>                  
 
	
<gw:textbox id="txt_PK"  styles="display:none"/>
<gw:textbox id="txt_option"  text='2' styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />                       
<gw:textbox id="txtSequence" text="" styles="display:none"  />
<gw:textbox id="idDBUSR" text="" styles="display:none"  />
<gw:textbox id="txtLang" text="" styles="display:none"  />
<gw:list  id="lstContract_Type" value='ALL' maxlen = "100" styles='width:100%;display:none ' >
	<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0001' order by code")%>|ALL|Select All</data>
</gw:list> 
<gw:list  id="lstContract_Type2" value='ALL' maxlen = "100" styles='width:100%;display:none ' >
	<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0001' order by code")%>|ALL|Select All</data>
</gw:list>
<gw:list  id="lstEmp_Type2" value='ALL' maxlen = "100" styles='width:100%;display:none' >
	<data>
		<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code")%>|ALL|Select All
	</data>
</gw:list>	
<gw:list  id="lstWGroup" value='ALL' maxlen = "100" styles="width:100%;display:none" />
<gw:list  id="lstWGroup2" value='ALL' maxlen = "100" styles="width:100%;display:none" />							
</html>
