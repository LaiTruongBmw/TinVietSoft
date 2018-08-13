<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
//var strcodereturn;
//var binit=true;
//var flag_header=true;
//var flag_header2=true;
//var tab2=false;
//var flag_wg=1;
var flag_tab=1;
var check_init=0;

var startTime,interval_time;

//tab 1
//PK|Organization|W-Group|Emp ID|Full Name|Join Date|Position|Modify By|Modify Date|Salary Level1|Salary Level2|Confirm DT|
//Allow1 L1|Allow1 L2|Allow2 L1|Allow2 L2|Allow3 L1|Allow3 L2|Allow4 L1|Allow4 L2|Allow5 L1|Allow5 L2|Allow6 L1|Allow6 L2|Allow7 L1|Allow7 L2|Allow8 L1|Allow8 L2"
var g_pk = 0;
    g_org = 1;
    g_group =2;
    g_emp_id =3;
    g_fullname=4;
    g_join_dt =5;
    g_position =6;
    g_modify_by =7;
    g_modify_dt =8;
    g_sal_level1 = 9;
    g_sal_level2 =10;
    g_confirm_dt = 11;
    g_allow1_l1 =12;
    g_allow1_l2 =13;
    g_allow2_l1 = 14;
    g_allow2_l2 = 15;
    g_allow3_l1 = 16;
    g_allow3_l2 = 17;
    g_allow4_l1 =18;
    g_allow4_l2 = 19;
    g_allow5_l1 = 20;
    g_allow5_l2 =21;
    g_allow6_l1 = 22;
    g_allow6_l2 = 23;
    g_allow7_l1 = 24;
    g_allow7_l2 = 25;
    g_allow8_l1 =26;
    g_allow8_l2 = 27;
    g_remark_mod_sal=28;
//tab 2
var p_pk = 0;
    p_org = 1;
    p_group =2;
    p_emp_id =3;
    p_fullname=4;
    p_join_dt =5;
    p_position =6;
    p_work_mon=7;
    p_modify_by =8;
    p_modify_dt =9;
    p_sal_level1 = 10;
    p_sal_level2 =11;
    p_confirm_dt = 12;
    p_allow1_l1 =13;
    p_allow1_l2 =14;
    p_allow2_l1 = 15;
    p_allow2_l2 = 16;
    p_allow3_l1 = 17;
    p_allow3_l2 = 18;
    p_allow4_l1 =19;
    p_allow4_l2 = 20;
    p_allow5_l1 = 21;
    p_allow5_l2 =22;
    p_allow6_l1 = 23;
    p_allow6_l2 = 24;
    p_allow7_l1 = 25;
    p_allow7_l2 = 26;
    p_allow8_l1 =27;
    p_allow8_l2 = 28;
    p_remark_mod_sal=29;


var p_flag_change=30;

function BodyInit()
{
    
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
    
    
   grdSalary.GetGridControl().FrozenCols =5;
   grdSalary1.GetGridControl().FrozenCols =5;
   
   grdSalary.GetGridControl().ScrollTrack=true;
   grdSalary1.GetGridControl().ScrollTrack=true;

   ChangeColorItem(lstOrg.GetControl());
   ChangeColorItem(lstOrg1.GetControl());
      
   if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
		datUser_info.Call(); 
   else		
        onChange_org(0,lstOrg);		          
   
}
//--------------------------------------

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

//----------------------------------
function OnShowPopup(n)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
		{
            lstOrg.value=obj;
			onChange_org(1,lstOrg);
		}	
        else (n==2)
		{
            lstOrg1.value=obj;
			onChange_org(2,lstOrg2);
		}	        
                
    }
    
}

//----------------------------------------------
function OnDataReceive(obj)
{
	  if (obj.id=="datUser_info")
	   {
		
            if(txtHr_level.text=="6")
            {
                lstOrg.SetDataText(txtDeptData.text + "|ALL|Select All");
			    lstOrg1.SetDataText(txtDeptData.text+ "|ALL|Select All");		
            }
            else
            {
			    lstOrg.SetDataText(txtDeptData.text);
			    lstOrg1.SetDataText(txtDeptData.text);			
            }
			onChange_org(0,lstOrg);
			
	   }
       else if (obj.id=="datWorkGroup_info")
       {
		
		    switch (flag_tab) 
		    {
			    case 0:
			    {
				    lstWGroup.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				    lstWGroup1.SetDataText(txtwg_tmp.text + "|ALL|Select All");				
                    lstWGroup.value='ALL';
                    lstWGroup1.value='ALL';                
				    break;
			    }
			    case 1:
			    {
				    lstWGroup.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                    lstWGroup.value='ALL';
				    break;
			    }	
			    case 2:
			    {
				    lstWGroup1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                    lstWGroup1.value='ALL';
				    break;
			    }			
			
		    }
		    datAllowance.Call("SELECT");
	    }	
       else if (obj.id=="datAllowance")
       {
            var icol=g_allow1_l1; //value of allowance col
            var icol_t2=p_allow1_l1; // value of allowance col tab2
            if(grdAllowance.rows>1)
            {            
                //tab 1
                grdSalary.SetGridText(0,icol,grdAllowance.GetGridData(1,0)+" L1");
                grdSalary.SetGridText(0,icol+1,grdAllowance.GetGridData(1,0)+" L2");

                grdSalary.SetGridText(0,icol+2,grdAllowance.GetGridData(1,1)+" L1");
                grdSalary.SetGridText(0,icol+3,grdAllowance.GetGridData(1,1)+" L2");

                grdSalary.SetGridText(0,icol+4,grdAllowance.GetGridData(1,2)+" L1");
                grdSalary.SetGridText(0,icol+5,grdAllowance.GetGridData(1,2)+" L2");

                grdSalary.SetGridText(0,icol+6,grdAllowance.GetGridData(1,3)+" L1");
                grdSalary.SetGridText(0,icol+7,grdAllowance.GetGridData(1,3)+" L2");

                grdSalary.SetGridText(0,icol+8,grdAllowance.GetGridData(1,4)+" L1");
                grdSalary.SetGridText(0,icol+9,grdAllowance.GetGridData(1,4)+" L2");

                grdSalary.SetGridText(0,icol+10,grdAllowance.GetGridData(1,5)+" L1");
                grdSalary.SetGridText(0,icol+11,grdAllowance.GetGridData(1,5)+" L2");

                grdSalary.SetGridText(0,icol+12,grdAllowance.GetGridData(1,6)+" L1");
                grdSalary.SetGridText(0,icol+13,grdAllowance.GetGridData(1,6)+" L2");

                grdSalary.SetGridText(0,icol+14,grdAllowance.GetGridData(1,7)+" L1");
                grdSalary.SetGridText(0,icol+15,grdAllowance.GetGridData(1,7)+" L2");
           

                grdSalary.GetGridControl().ColHidden(icol)=!(Number(grdAllowance.GetGridData(1,8)));
                grdSalary.GetGridControl().ColHidden(icol+1)=!(Number(grdAllowance.GetGridData(1,8)));

                grdSalary.GetGridControl().ColHidden(icol+2)=!(Number(grdAllowance.GetGridData(1,9)));
                grdSalary.GetGridControl().ColHidden(icol+3)=!(Number(grdAllowance.GetGridData(1,9)));

                grdSalary.GetGridControl().ColHidden(icol+4)=!(Number(grdAllowance.GetGridData(1,10)));
                grdSalary.GetGridControl().ColHidden(icol+5)=!(Number(grdAllowance.GetGridData(1,10)));

                grdSalary.GetGridControl().ColHidden(icol+6)=!(Number(grdAllowance.GetGridData(1,11)));
                grdSalary.GetGridControl().ColHidden(icol+7)=!(Number(grdAllowance.GetGridData(1,11)));

                grdSalary.GetGridControl().ColHidden(icol+8)=!(Number(grdAllowance.GetGridData(1,12)));
                grdSalary.GetGridControl().ColHidden(icol+9)=!(Number(grdAllowance.GetGridData(1,12)));

                grdSalary.GetGridControl().ColHidden(icol+10)=!(Number(grdAllowance.GetGridData(1,13)));
                grdSalary.GetGridControl().ColHidden(icol+11)=!(Number(grdAllowance.GetGridData(1,13)));

                grdSalary.GetGridControl().ColHidden(icol+12)=!(Number(grdAllowance.GetGridData(1,14)));
                grdSalary.GetGridControl().ColHidden(icol+13)=!(Number(grdAllowance.GetGridData(1,14)));

                grdSalary.GetGridControl().ColHidden(icol+14)=!(Number(grdAllowance.GetGridData(1,15)));
                grdSalary.GetGridControl().ColHidden(icol+15)=!(Number(grdAllowance.GetGridData(1,15)));

                //tab 2
                grdSalary1.SetGridText(0,icol_t2,grdAllowance.GetGridData(1,0)+" L1");
                grdSalary1.SetGridText(0,icol_t2+1,grdAllowance.GetGridData(1,0)+" L2");

                grdSalary1.SetGridText(0,icol_t2+2,grdAllowance.GetGridData(1,1)+" L1");
                grdSalary1.SetGridText(0,icol_t2+3,grdAllowance.GetGridData(1,1)+" L2");

                grdSalary1.SetGridText(0,icol_t2+4,grdAllowance.GetGridData(1,2)+" L1");
                grdSalary1.SetGridText(0,icol_t2+5,grdAllowance.GetGridData(1,2)+" L2");

                grdSalary1.SetGridText(0,icol_t2+6,grdAllowance.GetGridData(1,3)+" L1");
                grdSalary1.SetGridText(0,icol_t2+7,grdAllowance.GetGridData(1,3)+" L2");

                grdSalary1.SetGridText(0,icol_t2+8,grdAllowance.GetGridData(1,4)+" L1");
                grdSalary1.SetGridText(0,icol_t2+9,grdAllowance.GetGridData(1,4)+" L2");

                grdSalary1.SetGridText(0,icol_t2+10,grdAllowance.GetGridData(1,5)+" L1");
                grdSalary1.SetGridText(0,icol_t2+11,grdAllowance.GetGridData(1,5)+" L2");

                grdSalary1.SetGridText(0,icol_t2+12,grdAllowance.GetGridData(1,6)+" L1");
                grdSalary1.SetGridText(0,icol_t2+13,grdAllowance.GetGridData(1,6)+" L2");

                grdSalary1.SetGridText(0,icol_t2+14,grdAllowance.GetGridData(1,7)+" L1");
                grdSalary1.SetGridText(0,icol_t2+15,grdAllowance.GetGridData(1,7)+" L2");
           

                grdSalary1.GetGridControl().ColHidden(icol_t2)=!(Number(grdAllowance.GetGridData(1,8)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+1)=!(Number(grdAllowance.GetGridData(1,8)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+2)=!(Number(grdAllowance.GetGridData(1,9)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+3)=!(Number(grdAllowance.GetGridData(1,9)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+4)=!(Number(grdAllowance.GetGridData(1,10)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+5)=!(Number(grdAllowance.GetGridData(1,10)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+6)=!(Number(grdAllowance.GetGridData(1,11)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+7)=!(Number(grdAllowance.GetGridData(1,11)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+8)=!(Number(grdAllowance.GetGridData(1,12)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+9)=!(Number(grdAllowance.GetGridData(1,12)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+10)=!(Number(grdAllowance.GetGridData(1,13)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+11)=!(Number(grdAllowance.GetGridData(1,13)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+12)=!(Number(grdAllowance.GetGridData(1,14)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+13)=!(Number(grdAllowance.GetGridData(1,14)));

                grdSalary1.GetGridControl().ColHidden(icol_t2+14)=!(Number(grdAllowance.GetGridData(1,15)));
                grdSalary1.GetGridControl().ColHidden(icol_t2+15)=!(Number(grdAllowance.GetGridData(1,15)));
            }
            check_init=1;
    
       }
	   
	   else if(obj.id=="datSalary")
	   {            
            if(grdSalary.rows>1)
            {			   
                lblRecord.text=grdSalary.rows-1 ; 	
                auto_resize_column(grdSalary,0,grdSalary.cols-1,9); 	
                grdSalary.SetCellBgColor(1,g_modify_by,grdSalary.rows -1 ,g_modify_dt,0xFFEEFF);	
            
                for(var i=1; i<grdSalary.rows-1; i++)
                {
                    for( var j=g_sal_level1; j<=g_allow8_l2; j++)
                    {     
                        if((grdSalary.GetGridData(i,j) != grdSalary.GetGridData(i+1,j)) && (grdSalary.GetGridData(i,g_emp_id) == grdSalary.GetGridData(i+1,g_emp_id)))
                        {
                            grdSalary.SetCellBgColor(i+1,j,i+1 ,j,0xBAEDD3); 
                        }
                            
                    }
                }
            }
	   }
       else if(obj.id=="datSalary1")
	   {
            if(grdSalary1.rows>1)
            {
			    lblRecord1.text=grdSalary1.rows-1 ;	
                auto_resize_column(grdSalary1,0,grdSalary1.cols-1,9); 	
                grdSalary1.SetCellBgColor(1,p_modify_by,grdSalary1.rows -1 ,p_modify_dt,0xFFEEFF);	
            
                for(var i=1; i<grdSalary1.rows; i++) 
                {                     
                    if(grdSalary1.GetGridData(i,p_flag_change) =="1")
                    {                    
                        grdSalary1.SetCellBgColor(i,1,i,grdSalary1.cols-1,0xBAEDD3); 
                    }                            
                }
            }
	   } 
       else if (obj.id == "datFind_Report")
	   {
			if(tabMain.GetCurrentPageNo()==0)
			{
				var url =System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?org='+lstOrg.value+'&wg='+lstWGroup.value+'&pos='+lstPosition.value+'&txttmp='+txtTemp.text +'&nation='+lstNation.value +'&contract='+lstContract_Type.value+'&status='+lstStatus.value+'&fromModDate='+dtFrom_ModDate.value+'&toModDate='+dtTo_ModDate.value+'&lstmoney='+lstMoney.value;
			}
			else if(tabMain.GetCurrentPageNo()==1)
			{
				 var url =System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?org='+lstOrg1.value+'&wg='+lstWGroup1.value+'&pos='+lstPosition1.value+'&txttmp='+txtTemp1.text +'&nation='+lstNation1.value +'&contract='+lstContract_Type1.value+'&status='+lstStatus1.value+'&fromModDate='+dtFrom_ModifyDate1.value+'&toModDate='+dtTo_ModifyDate1.value+'&lstmoney='+lstMoney3.value +'&fromSalMon='+dtFrom_Mon1.value+'&toSalMon='+dtTo_Mon1.value;
			}			
			System.OpenTargetPage( url , 'newform' );
	   }
}

//----------------------------------------------------
function OnSearch(obj_dat)
{
    if(check_init==1)
    {        
        if(obj_dat.id=="datSalary")
        {                 
            if(txtTemp.text=="" && dtFrom_ModDate.value=="" && dtTo_ModDate.value=="")
		    {
			    if(confirm("It will take long time because you get overload data, do you want to continous?\nHệ thống dự báo dữ liệu quá nhiều bạn sẽ phải đợi trong 1 thời gian dài, bạn có muốn tiếp tục?"))
			    {
				    //set_Interval(100);
				    obj_dat.Call("SELECT");
			    }    
		    }
            else 
		    {		
                //set_Interval(100);	    
			    obj_dat.Call("SELECT");
		    }  

        }
        else 
        {                                                           
            if(txtTemp1.text=="" && dtFrom_ModifyDate1.value=="" && dtTo_ModifyDate1.value=="")
		    {
			    if(confirm("It will take long time because you get overload data, do you want to continous?\nHệ thống dự báo dữ liệu quá nhiều bạn sẽ phải đợi trong 1 thời gian dài, bạn có muốn tiếp tục?"))
			    {
				    //set_Interval(100);
				    obj_dat.Call("SELECT");
			    }    
		    }                                                   
		    else 
		    {
			    //set_Interval(100);
			    obj_dat.Call("SELECT");
		    } 
        }  	
    }    		
}

function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}

function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}
//------------------------------------------------------------------------------------

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}



function OnReport(obj)
{     
       if(obj==1) //tab thu nhat
       {
            if(txtTemp.text=="" && dtFrom_ModDate.value=="" && dtTo_ModDate.value=="")
	        {
		        if (confirm("Report data can be able to very much. You want to continue? \nDữ liệu có thể rất nhiều.Bạn có muốn tiếp tục không?"))
                {
                    txtReport_tmp.text="rpt_basic_sal_change.aspx";	
                    datFind_Report.Call();  
                }
            }
            else
            {
                txtReport_tmp.text="rpt_basic_sal_change.aspx";	
                datFind_Report.Call();  
            }	
       }        
       else if (obj==2) // tab thu 2
       {   
		    if(txtTemp1.text=="" && dtFrom_ModifyDate1.value=="" && dtTo_ModifyDate1.value=="")
	        {
                if (confirm("Report data can be able to very much. You want to continue? \nDữ liệu có thể rất nhiều.Bạn có muốn tiếp tục không?"))
                {
                    txtReport_tmp.text="rpt_month_sal_change.aspx";	
                    datFind_Report.Call();  
                }
            }
            else
            {
                txtReport_tmp.text="rpt_month_sal_change.aspx";	
                datFind_Report.Call();  
            }	
       }                                     
}

function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

</script>
<body style=" margin-bottom:0; margin-top:0; margin-right:0" >
<!-------------------data control----------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>

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



<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_CO_ALLOW_SALARY" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datSalary" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRMR01100_0"> 
                <input bind="grdSalary" >
                   <input bind="lstOrg" /> 
                   <input bind="lstWGroup" /> 
                   <input bind="lstPosition" />
                   <input bind="txtTemp" /> 
                   <input bind="lstNation" />
                   <input bind="lstContract_Type" /> 
                   <input bind="lstStatus" /> 
                   <input bind="dtFrom_ModDate" /> 
                   <input bind="dtTo_ModDate" /> 
                   <input bind="lstMoney" />
                </input>
                <output  bind="grdSalary" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datSalary1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRMR01100_1"> 
                <input bind="grdSalary1" >
                   <input bind="lstOrg1" /> 
                   <input bind="lstWGroup1" /> 
                   <input bind="lstPosition1" /> 
                   <input bind="txtTemp1" /> 
                   <input bind="lstNation1" />
                   <input bind="lstContract_Type1" /> 
                   <input bind="lstStatus1" /> 
                   <input bind="dtFrom_ModifyDate1" /> 
                   <input bind="dtTo_ModifyDate1" /> 
                   <input bind="lstMoney3" />
                   <input bind="dtFrom_Mon1" /> 
                   <input bind="dtTo_Mon1" />
                </input>
                <output  bind="grdSalary1" />
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="" >     
    <table name="Salary Basic" id="tblSalYear" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%" id="Table3" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >
                            <b>Organization</a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(1,lstOrg);" >
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
                            <gw:list  id="lstWGroup" value='ALL' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select pk,workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All</data></gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="txtTemp" onenterkey   ="OnSearch(datSalary)" styles='width:100%'/>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:label id="lblRecord"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" />
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            <gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(datSalary)"/>
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Position
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstPosition" value='ALL' styles='width:100%' >
                               <data>
                                    <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                </data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Nation
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstNation" value='ALL' styles='width:100%' >
                               <data>
                                    <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All
                                </data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Contract
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstContract_Type" value='ALL' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0001' order by code_nm")%>|ALL|Select All</data></gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=5 width="5%" style="border:0"> 
				            <gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport(1)"/>
			            </td>
						<td colspan=10 width="10%" style="border:0"> 
				            <gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Modify Date
                        </td>
                        <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtFrom_ModDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtTo_ModDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Status
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm" )%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Money
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstMoney" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0040' order by code_nm")%>|ALL|Select All</data>
							</gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            
			            </td>
                    </tr>
                    <tr style="border:1;width:100%;height:85%" valign="top">
                        <td colspan=100  style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdSalary"                                          
                                header="_PK|Organization|_W-Group|Emp ID|Full Name|Join Date|_Position|Modify By|Modify Date|Salary Level1|Salary Level2|Confirm DT|Allow1 L1|Allow1 L2|Allow2 L1|Allow2 L2|Allow3 L1|Allow3 L2|Allow4 L1|Allow4 L2|Allow5 L1|Allow5 L2|Allow6 L1|Allow6 L2|Allow7 L1|Allow7 L2|Allow8 L1|Allow8 L2|Remark Mod Sal"
                                format="0|0|0|0|0|0|0|0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0"  
                                aligns="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                defaults="|||||||||||||||||||||||||||"  
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                widths="100|2500|2500|1500|2500|1500|1500|2000|2500|2000|2000|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2500"  
                                styles="width:100%; height:100%" 
                                sorting="T"   acceptNullDate
                                /> 
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table> 
  <table name="Salary Month" id="Table1" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%" id="Table2" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(2)" href="#tips" style="text-decoration: none; color=#0000ff" >
                            <b>Organization</a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstOrg1" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(2,lstOrg1);" >
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
                            <gw:list  id="lstWGroup1" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select pk,workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="txtTemp1" onenterkey   ="OnSearch(datSalary1)" styles='width:100%'/>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:label id="lblRecord1"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" />
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            <gw:button img="search" id="ibtnSearch1" text="Search"  alt="Search"  onclick="OnSearch(datSalary1)"/>
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Position
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstPosition1" value='ALL' styles='width:100%' >
                               <data>
                                    <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                </data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Nation
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstNation1" value='ALL' styles='width:100%' >
                               <data>
                                    <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All
                                </data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Contract
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstContract_Type1" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0001' order by code_nm")%>|ALL|Select All</data>
							</gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=5 width="5%" style="border:0"> 
				            <gw:button id="ibtnReport1" img="excel"   text="Report"  onclick="OnReport(2)"/>
			            </td>
						<td colspan=10 width="10%" style="border:0"> 
				            <gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Modify Date
                        </td>
                        <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtFrom_ModifyDate1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtTo_ModifyDate1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Status
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstStatus1" value='A' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm" )%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Money
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstMoney3" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0040' order by code_nm")%>|ALL|Select All</data>
							</gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Month
                        </td>
			            <td colspan=7 width="7%" style="border:0" align="left"> 
				            <gw:datebox id="dtFrom_Mon1" lang="<%=Session("Lang")%>" type='month'  ></gw:datebox>
			            </td>
						<td colspan=8 width="8%" style="border:0" align="left"> 
				            <gw:datebox id="dtTo_Mon1" lang="<%=Session("Lang")%>" type='month'  ></gw:datebox>
			            </td>
                    </tr>
                    <tr style="border:1;width:100%;height:85%" valign="top">
                        <td colspan=100  style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdSalary1"  
                                header="_PK|Organization|_W-Group|Emp ID|Full Name|Join Date|_Position|Work Mon|Modify By|Modify Date|Salary Level1|Salary Level2|Confirm DT|Allow1 L1|Allow1 L2|Allow2 L1|Allow2 L2|Allow3 L1|Allow3 L2|Allow4 L1|Allow4 L2|Allow5 L1|Allow5 L2|Allow6 L1|Allow6 L2|Allow7 L1|Allow7 L2|Allow8 L1|Allow8 L2|Remark Mod Sal|_Flag_change|Create By|Create Date"
                                format="0|0|0|0|0|0|0|0|0|0|-0|-0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0"  
                                aligns="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                defaults="|||||||||||||||||||||||||||||"  
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                widths="100|2500|2500|1500|2500|1500|1500|1500|2000|2500|2000|2000|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"
                                styles="width:100%; height:100%" 
                                sorting="T"   acceptNullDate
                                /> 
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>   
</gw:tab>
</body>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
                       
 <gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0"  
    defaults="||||||||||||||"  
    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200"  
    styles="display:none" 
    sorting="T"    
/> 
</html>
