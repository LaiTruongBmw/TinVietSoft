<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>General Info - Employee</title>

    <script>
 //---------------------------------------------------------
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var flag=0;
var main_col=0;
var l_company_pk;
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);	
     iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user= "<%=session("USER_ID")%>";
    l_company_pk="<%=session("COMPANY_PK")%>";
   onClickOption(1); 
   idSysdate.text="System Date is "+"<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY') FROM DUAL")%>";
   if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        datUser_info.Call();     	    
    else
        lstOrg.value="ALL";
        
 
 }
 
 function num_of_month(s_month)
 {
    var tmp;
    var r;    
    t_m=s_month.substr(4,2);
    t_y=parseInt(s_month.substr(0,4));   
    switch(t_m)
    {
        case "01":
            r="31";            
            break;
        case "02":
            if (t_y%4==0)
                r="29";
            else r="28";
            break;
        case "03":
            r="31";            
            break;
        case "04":
            r="30";
            break;
        case "05":
            r="31";            
            break;
        case "06":
            r="30";
            break;
        case "07":
            r="31";            
            break;
        case "08":
            r="31";            
            break;
         case "09":
            r="30";
            break;
        case "10":           
            r="31";            
            break;
        case "11":
            r="30";                       
            break;
         case "12":
            r="31";            
            break;       
    }    
    return r;
   }
 
 function onClickOption(n)
{   
    opt_value=n;  
    txtSearchType.text=n;      
    switch(n)
    {
        case 1:
            DailyDT.SetEnable(1);
            FromDT.SetEnable(0);
	        ToDT.SetEnable(0);
	        dtMonth.SetEnable(0);
	        dtYear.SetEnable(0);
	        txtFrom.text=DailyDT.value
	        txtTo.text=DailyDT.value
	        break;
	    case 2:
	        DailyDT.SetEnable(0);
            FromDT.SetEnable(1);
	        ToDT.SetEnable(1);
	        dtMonth.SetEnable(0);
	        dtYear.SetEnable(0);
	        txtFrom.text=FromDT.value
	        txtTo.text=ToDT.value
	        break;   
	    case 3:
	        DailyDT.SetEnable(0);
            FromDT.SetEnable(0);
	        ToDT.SetEnable(0);
	        dtMonth.SetEnable(1);
	        dtYear.SetEnable(0);	        
	        txtFrom.text=dtMonth.value+""+"01";
	        txtTo.text=dtMonth.value+""+num_of_month(dtMonth.value);	        
	        break;        
	   case 4:
	        DailyDT.SetEnable(0);
            FromDT.SetEnable(0);
	        ToDT.SetEnable(0);
	        dtMonth.SetEnable(0);
	        dtYear.SetEnable(1);
	        txtFrom.text=dtYear.value+""+"0101";
	        txtTo.text=dtYear.value+""+"1231";
	        break;           
    }
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
function OnDataReceive(obj)
{
    if(obj.id=="dat_dms_emp1")
    {
        flag=0;
        idGrid1.GetGridControl().FontSize =16;
        auto_resize_column(idGrid1,0,idGrid1.cols-1,16);
        dat_dms_emp2.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp2")
    {
        idGrid2.GetGridControl().FontSize =16;
        auto_resize_column(idGrid2,0,idGrid2.cols-1,13)
        dat_dms_emp3.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp3")
    {
       
        var t1,t2,t3
        t1=t2=t3=0;
        for(var i=1;i<idGrid3.rows;i++)
        {
            t1+=Number(idGrid3.GetGridData(i,2));
            t2+=Number(idGrid3.GetGridData(i,3));
            t3+=Number(idGrid3.GetGridData(i,4));
        }
        idGrid3.SetGridText(0,2,"Male ("+t1+" Emps)");
        idGrid3.SetGridText(0,3,"Female ("+t2+" Emps)");
        idGrid3.SetGridText(0,4,"Total ("+t3+" Emps)");
        auto_resize_column(idGrid3,0,idGrid3.cols-1,13)
        dat_dms_emp4.Call("SELECT");
        
    }
    if(obj.id=="dat_dms_emp4")
    {
        auto_resize_column(idGrid4,0,idGrid4.cols-1,13)
        dat_dms_emp5.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp5")
    {
        idGrid5.GetGridControl().FontSize =16;
        auto_resize_column(idGrid5,0,idGrid5.cols-1,13)
    }
    if(obj.id=="dat_dms_emp2_1")
    {
        auto_resize_column(idGrid2,0,idGrid2.cols-1,13)
        dat_dms_emp3_1.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp3_1")
    {
        auto_resize_column(idGrid3,0,idGrid3.cols-1,13)
        var t1,t2,t3
        t1=t2=t3=0;
        for(var i=1;i<idGrid3.rows;i++)
        {
            t1+=Number(idGrid3.GetGridData(i,2));
            t2+=Number(idGrid3.GetGridData(i,3));
            t3+=Number(idGrid3.GetGridData(i,4));
        }
        idGrid3.SetGridText(0,2,"Male ("+t1+" Emps)");
        idGrid3.SetGridText(0,3,"Female ("+t2+" Emps)");
        idGrid3.SetGridText(0,4,"Total ("+t3+" Emps)");
        dat_dms_emp4_1.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp4_1")
    {
        idGrid4.GetGridControl().FontSize =13;
        dat_dms_emp5_1.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp5_1")
    {
        idGrid5.GetGridControl().FontSize =13;
    }
    if(obj.id=="dat_dms_emp2_2")
    {
        idGrid2.GetGridControl().FontSize =13;
        dat_dms_emp3_2.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp3_2")
    {
        idGrid3.GetGridControl().FontSize =13;
        var t1,t2,t3
        t1=t2=t3=0;
        for(var i=1;i<idGrid3.rows;i++)
        {
            t1+=Number(idGrid3.GetGridData(i,2));
            t2+=Number(idGrid3.GetGridData(i,3));
            t3+=Number(idGrid3.GetGridData(i,4));
        }
        idGrid3.SetGridText(0,2,"Male ("+t1+" Emps)");
        idGrid3.SetGridText(0,3,"Female ("+t2+" Emps)");
        idGrid3.SetGridText(0,4,"Total ("+t3+" Emps)");
        dat_dms_emp4_2.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp4_2")
    {
        idGrid4.GetGridControl().FontSize =13;
        dat_dms_emp5_2.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp5_2")
    {
        idGrid5.GetGridControl().FontSize =13;
    }
    if(obj.id=="dat_dms_emp2_3")
    {
        idGrid2.GetGridControl().FontSize =13;
        dat_dms_emp3_3.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp3_3")
    {
        idGrid3.GetGridControl().FontSize =13;
        var t1,t2,t3
        t1=t2=t3=0;
        for(var i=1;i<idGrid3.rows;i++)
        {
            t1+=Number(idGrid3.GetGridData(i,2));
            t2+=Number(idGrid3.GetGridData(i,3));
            t3+=Number(idGrid3.GetGridData(i,4));
        }
        idGrid3.SetGridText(0,2,"Male ("+t1+" Emps)");
        idGrid3.SetGridText(0,3,"Female ("+t2+" Emps)");
        idGrid3.SetGridText(0,4,"Total ("+t3+" Emps)");
        dat_dms_emp4_3.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp4_3")
    {
        idGrid4.GetGridControl().FontSize =13;
        dat_dms_emp5_3.Call("SELECT");
    }
    if(obj.id=="dat_dms_emp5_3")
    {
        idGrid5.GetGridControl().FontSize =13;
    }
    if (obj.id=="datDeptData")
   {
        lstOrg.SetDataText(txtDeptData.text);
   }
    
}
 //---------------------------------------------------------
 function OnSearch()
 {
    dat_dms_emp1.Call("SELECT");
 }
 function On_click(n)
 {
    switch(n)
    {
        case 1://grid 1
                    main_col=event.col;
                    idRecord2.text=idGrid1.GetGridData(0,main_col);
                    idRecord3.text=idGrid1.GetGridData(0,main_col);
                    idRecord4.text=idGrid1.GetGridData(0,main_col);
                    idRecord5.text=idGrid1.GetGridData(0,main_col);
                    
                if(main_col==0)//total emp
                {
                    txtEmpType.text="0"
                    if(flag!=0)
                        dat_dms_emp2.Call("SELECT");
                }
                flag=main_col;
                if(main_col==1)//total new emp
                {
                    txtEmpType.text="1"
                    if(Number(idGrid1.GetGridData(event.row,main_col))>0)
                        dat_dms_emp2_1.Call("SELECT");
                    else
                        ClearGridData();
                }     
                if(main_col==2)//total new emp
                {
                    txtEmpType.text="2"
                    if(Number(idGrid1.GetGridData(event.row,main_col))>0)
                        dat_dms_emp2_2.Call("SELECT");
                    else
                        ClearGridData();
                }         
                if(main_col==3)//total new emp
                {
                    txtEmpType.text="3"
                    if(Number(idGrid1.GetGridData(event.row,main_col))>0)
                        dat_dms_emp2_3.Call("SELECT");
                    else
                        ClearGridData();
                }                       
                break;
    }
 }
 function ClearGridData()
 {
    idGrid2.ClearData();
    idGrid3.ClearData();
    idGrid3.SetGridText(0,2,"Male");
    idGrid3.SetGridText(0,3,"Female");
    idGrid3.SetGridText(0,4,"Total");
    idGrid4.ClearData();
    idGrid5.ClearData();
 }
 function Popup(n)
 {
    var col=event.col
    switch(n)
    {
        case 1: //grid 1
            var tmp=Number(idGrid1.GetGridData(1,event.col));
            if(tmp==0)
                break;
            if(col==0)//total emp
            {
                var flag="Total Employee";
                var kind="1.1";
            }
            if(col==1)//total new emp
            {
                var flag="Total New Employee";
                var kind="1.2";
            }
            if(col==2)//total resign emp
            {
                var flag="Total Resign Employee";
                var kind="1.3";
            }
            if(col==3)//total maternity emp
            {
                var flag="Total Maternity Employee";
                var kind="1.4";
            }
            var dept=lstOrg.value
            var dept_nm=lstOrg.GetText();
            var pos="";
            var pos_nm="";
            var fpath = System.RootURL + "/standard/forms/hr/mr/hrmr00101.aspx?p_dept="+dept+"&p_dept_nm="+dept_nm+"&p_from="+txtFrom.text+"&p_to="+txtTo.text+"&p_kind="+kind+"&p_flag="+flag+"&p_pos="+pos+"&p_pos_nm="+pos_nm+"&main_col="+main_col;
            var obj  = System.OpenModal(  fpath , 1200 , 600 , 'resizable:yes;status:yes');
            break;
       case 2://grid 2
            var tmp=Number(idGrid2.GetGridData(1,event.col));
            if(tmp==0)
                break;
            if(col==0)//total emp
            {
                var flag="Total Probation Employee";
                var kind="2.1";
            }
            if(col==1)//total new emp
            {
                var flag="Total Regular Employee";
                var kind="2.2";
            }
            if(col==2)//total resign emp
            {
                var flag="Total Discipline Employee";
                var kind="2.3";
            }
            if(col==3)//total maternity emp
            {
                var flag="Total Under 18 Employee";
                var kind="2.4";
            }
            if(col==4)//total maternity emp
            {
                var flag="Total Male Employee";
                var kind="2.5";
            }
            if(col==5)//total maternity emp
            {
                var flag="Total Female Employee";
                var kind="2.6";
            }
            var pos="";
            var pos_nm="";
            var dept=lstOrg.value
            var dept_nm=lstOrg.GetText();
            var fpath = System.RootURL + "/standard/forms/hr/mr/hrmr00101.aspx?p_dept="+dept+"&p_dept_nm="+dept_nm+"&p_from="+txtFrom.text+"&p_to="+txtTo.text+"&p_kind="+kind+"&p_flag="+flag+"&p_pos="+pos+"&p_pos_nm="+pos_nm+"&main_col="+main_col;
            var obj  = System.OpenModal(  fpath , 1200 , 600 , 'resizable:yes;status:yes');

            break;
        case 3://grid 3
            var tmp;
            if(event.col>1)
                tmp=Number(idGrid3.GetGridData(event.row,event.col));
            else
                tmp=1;    
            if(tmp==0)
                break;
            if(col==1||col==4)//Organization name
            {
                var flag="Total In Organization(Male and Female)";
                var kind="3.1";
            }
            if(col==2)//total in deparment (male)
            {
                var flag="Total In Organization(Male)";
                var kind="3.2";
            }
            if(col==3)//total resign emp
            {
                var flag="Total In Organization(Female)";
                var kind="3.3";
            }
            var pos="";
            var pos_nm="";
            var dept=idGrid3.GetGridData(event.row,0);
            var dept_nm=idGrid3.GetGridData(event.row,1);
            var fpath = System.RootURL + "/standard/forms/hr/mr/hrmr00101.aspx?p_dept="+dept+"&p_dept_nm="+dept_nm+"&p_from="+txtFrom.text+"&p_to="+txtTo.text+"&p_kind="+kind+"&p_flag="+flag+"&p_pos="+pos+"&p_pos_nm="+pos_nm+"&main_col="+main_col;
            var obj  = System.OpenModal(  fpath , 1200 , 600 , 'resizable:yes;status:yes');

            break;
       case 4://grid 4
            var tmp;
            if(event.col>1)
                tmp=Number(idGrid4.GetGridData(event.row,event.col));
            else
                tmp=1;    
            if(tmp==0)
                break;
            if(col==1||col==4)//pos name
            {
                var flag="Total In Position(Male and Female)";
                var kind="4.1";
            }
            if(col==2)//total in deparment (male)
            {
                var flag="Total In Position(Male)";
                var kind="4.2";
            }
            if(col==3)//total resign emp
            {
                var flag="Total In Position(Female)";
                var kind="4.3";
            }
            var dept=lstOrg.value;
            var dept_nm="";
            var pos=idGrid4.GetGridData(event.row,0);
            var pos_nm=idGrid4.GetGridData(event.row,1);
            
            var fpath = System.RootURL + "/standard/forms/hr/mr/hrmr00101.aspx?p_dept="+dept+"&p_pos_nm="+ pos_nm+"&p_dept_nm="+dept_nm+"&p_from="+txtFrom.text+"&p_to="+txtTo.text+"&p_kind="+kind+"&p_flag="+flag+"&p_pos="+pos+"&main_col="+main_col;
            var obj  = System.OpenModal(  fpath , 1200 , 600 , 'resizable:yes;status:yes');

            break;     
       case 5://grid 5
            var tmp=Number(idGrid5.GetGridData(event.row,event.col));
            if(tmp==0)
                break;
            if(col==0)//<1 year
            {
                var flag="Total Seniority (<1 Year)";
                var kind="5.1";
            }
            if(col==1)//<1 to <2 Year
            {
                var flag="Total Seniority (1 to <2 Year)";
                var kind="5.2";
            }
            if(col==2)//<2 to <3 Year
            {
                var flag="Total Seniority (2 to <3 Year)";
                var kind="5.3";
            }
            if(col==3)//3 to <4 Year
            {
                var flag="Total Seniority (3 to <4 Year)";
                var kind="5.4";
            }
            if(col==4)//4 to <5 Year
            {
                var flag="Total Seniority (4 to <5 Year)";
                var kind="5.5";
            }
            if(col==5)//>5 Year
            {
                var flag="Total Seniority (4 to <5 Year)";
                var kind="5.6";
            }
            var dept=lstOrg.value;
            var dept_nm=lstOrg.GetText();
            var pos="";
            var pos_nm="";
            var fpath = System.RootURL + "/standard/forms/hr/mr/hrmr00101.aspx?p_dept="+dept+"&p_dept_nm="+dept_nm+"&p_flag="+flag+"&p_from="+txtFrom.text+"&p_to="+txtTo.text+"&p_kind="+kind+"&p_pos="+pos+"&p_pos_nm="+pos_nm+"&main_col="+main_col;
            var obj  = System.OpenModal(  fpath , 1200 , 600 , 'resizable:yes;status:yes');
            //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:60;dialogHeight:80;dialogLeft:10;dialogTop:330;edge:sunken;scroll:no;unadorned:yes;help:no');

            break;      
    }
    
 }


function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:no;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj
        txtUpperDept.text=obj;
        //datDeptData.Call();
    }
    
}

function OnReport()
{   
    var url;       
    var dept=lstOrg.value;
    var dept_nm=lstOrg.GetText();
        url =System.RootURL + '/standard/reports/hr/mr/rpt_hrmr00100_0.aspx?p_dept='+dept+'&p_dept_nm='+dept_nm+'&p_from='+txtFrom.text+'&p_to='+txtTo.text+'&p_typeDT='+txtSearchType.text+'&p_user='+user+'&p_emp_type='+txtEmpType.text;                    
        window.open(url);
}

 
    </script>

</head>
<body>
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
<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_DEPT_DATA_ALL" > 
                <input>
                    <input bind="txtUpperDept" /> 
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dat_dms_emp1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_0" > 
                <input bind="idGrid1" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid1" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_1" > 
                <input bind="idGrid2" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_2" > 
                <input bind="idGrid3" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp4" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_3" > 
                <input bind="idGrid4" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid4" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp5" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_4" > 
                <input bind="idGrid5" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid5" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dat_dms_emp2_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_5" > 
                <input bind="idGrid2" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp3_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_6" > 
                <input bind="idGrid3" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp4_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_7" > 
                <input bind="idGrid4" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid4" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp5_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_8" > 
                <input bind="idGrid5" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid5" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dat_dms_emp2_2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_9" > 
                <input bind="idGrid2" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp3_2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_10" > 
                <input bind="idGrid3" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp4_2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_11" > 
                <input bind="idGrid4" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid4" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp5_2" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_12" > 
                <input bind="idGrid5" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid5" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dat_dms_emp2_3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_13" > 
                <input bind="idGrid2" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp3_3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_14" > 
                <input bind="idGrid3" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp4_3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_15" > 
                <input bind="idGrid4" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid4" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_dms_emp5_3" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00100_16" > 
                <input bind="idGrid5" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                </input>
                <output  bind="idGrid5" />
            </dso> 
        </xml> 
</gw:data>
   <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	    <table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
	        <tr style="height:6%;border:1">	
		        <td colspan=2 align=right style="width:10%;border:1;color=Black" ><input type="radio" name="option_P" value="1" checked onclick="onClickOption(1)" ><font size=3>Daily</font></td>
		        <td colspan=2 align=right style="width:10%;border:1"><gw:datebox id="DailyDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" onchange="onClickOption(1)" /></td>
		        <td colspan=2 align=right style="width:10%;border:0"><input type="radio" name="option_P" value="2" onclick="onClickOption(2)" ><font size=3>From</font></td>
		        <td colspan=2 align=right style="width:10%;border:0"><gw:datebox id="FromDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" onchange="onClickOption(2)"/></td>
		        <td align=right style="width:5%;border:0"><font size=3>To</font> </td>
		        <td colspan=2 align=right style="width:10%;border:0"><gw:datebox id="ToDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" onchange="onClickOption(2)"/></td>
                <td align=right colspan=2 style="width:10%;border:0"><input type="radio" name="option_P" value="3" onclick="onClickOption(3)" ><font size=3>Month</font> </td>
		        <td align=left colspan=2 style="width:10%;border:0"><gw:datebox id="dtMonth"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" type=month onchange="onClickOption(3)"/></td>
		        <td align=right colspan=2 style="width:10%;border:0"><input type="radio" name="option_P" value="4" onclick="onClickOption(4)" ><font size=3>Year</font> </td>
		        <td align=left colspan=2 style="width:10%;border:0"><gw:datebox id="dtYear"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" type=year onchange="onClickOption(4)"/></td>
		        <td align=right valign="bottom" style="width:5%;border:0" >&nbsp;</td>
            </tr>	
            <tr style="height:6%;border:1">	
                <td colspan=6 align=left style="width:30%;border:1;color=Black" ><font size=2><i><gw:label id="idSysdate" text=" " styles="width:100%" ></i></font></gw:label></td>
                <td colspan=2 align=right style="width:10%;border:0" ><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff" style="text-decoration : none; color=#0000FF"><font size=3>Organization</font></a></td>
		        <td colspan=4 align=right style="width:20%;border:0">
		            <gw:list  id="lstOrg"  maxlen = "100" styles='width:100%' onchange="" >
                    <data>
                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                    </data>
                    </gw:list>
                </td>
                <td align=right style="width:5%;border:0"><gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" /></td>
		        <td align=right style="width:3%;border:0" ><gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnReport()" /></td>
		        <td colspan=4 align=right style="width:5%;border:1;color=Black" >&nbsp;</td>
		        
            </tr>	
        
	    </table>
	    <table id="tbl" style="width:100%;height:13%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
		    <tr style="height:100%">
			    <td id="master" width="100%">
				    <gw:grid
					    id="idGrid1"
					    header="CURRENT EMPPLOYEE(S)|NEW EMPLOYEE(S)|RESIGN EMPPLOYEE(S)|MATERNITY EMPLOYEE(S)"
					    format="0|0|0|0"
					    aligns="0|0|0|0"
					    defaults="|||"
					    editcol="0|0|0|0"
					    widths="4000|4000|4000|4000"
					    styles="width:100%;height:100%"
					    sorting="T"
					    oncellclick = "On_click(1)"
					    acceptNullDate="T"
					    oncelldblclick = "Popup(1)"/>
			    </td>
		    </tr>	
	    </table>
	    <table style="width:100%;height:5%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
	        <tr style="height:6%;border:1">	
		        <td colspan=4 align=left style="width:20%;border:1;color=red" ><font size=3><i>Summary Information</i></font></td>
		        <td colspan=6 align=left style="width:30%;border:0"><font size=3><gw:label id="idRecord2" text=" " styles="width:100%" ></font></gw:label></td>
		        <td colspan=4 align=left style="width:20%;border:1;color=red" ><font size=3><i>Summary by seniority</i></font></td>
		        <td colspan=6 align=left style="width:30%;border:0"><font size=3><gw:label id="idRecord3" text=" " styles="width:100%" ></font></gw:label></td>
            </tr>	
	    </table>
	    <table id="Table1" style="width:100%;height:11%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
		    <tr style="height:100%">
			    <td id="Td1" width="40%">
				    <gw:grid
					    id="idGrid2"
					    header="Probation|Regular|Discipline|Under 18|Male|Female"
					    format="0|0|0|0|0|0"
					    aligns="0|0|0|0|0|0"
					    defaults="|||||"
					    editcol="0|0|0|0|0|0"
					    widths="1500|1500|1500|2000|1000|1000"
					    styles="width:100%;height:100%"
					    sorting="T"
					    acceptNullDate="T"
					    oncelldblclick = "Popup(2)"/>
			    </td>
			    <td id="Td5" width="60%">
			        <gw:grid
					    id="idGrid5"
					    header="<1(Years)|1 to <2(Years)|2 to <3(Years)|3 to <4(Years)|4 to <5(Years)|>=5 (Years)"
					    format="0|0|0|0|0"
					    aligns="0|0|0|0|0"
					    defaults="||||"
					    editcol="0|0|0|0|0"
					    widths="1500|1500|1500|1500|1500"
					    styles="width:100%;height:100%"
					    sorting="T"
					    acceptNullDate="T"
					    oncelldblclick = "Popup(5)"/>
				    
			    </td>
		    </tr>	
	    </table>
	    <table style="width:100%;height:5%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
	        <tr style="height:6%;border:1">	
		        <td colspan=4 align=left style="width:20%;border:1;color=red" ><font size=3><i>Summary by position</i></font></td>
		        <td colspan=6 align=left style="width:30%;border:0"><font size=3><gw:label id="idRecord4" text=" " styles="width:100%" ></font></gw:label></td>
		         <td colspan=4 align=left style="width:20%;border:1;color=red" ><font size=3><i>Summary by Organization</i></font></td>
		        <td colspan=6 align=left style="width:30%;border:0"><font size=3><gw:label id="idRecord5" text=" " styles="width:100%" ></font></gw:label></td>
            </tr>	
	    </table>
	    <table id="Table3" style="width:100%;height:54%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
		    <tr style="height:100%">
			    <td id="Td3" width="30%">
				    <gw:grid
					    id="idGrid4"
					    header="_pos_type|Position|Male|Female|Total"
					    format="0|0|0|0|0"
					    aligns="0|2|0|0|0"
					    defaults="||||"
					    editcol="0|0|0|0|0"
					    widths="0|3000|2000|2000|2000"
					    styles="width:100%;height:100%"
					    sorting="T"
					    acceptNullDate="T"
					    oncelldblclick = "Popup(4)"/>
			    </td>
			    <td id="Td2" width="70%">
				    <gw:grid
					    id="idGrid3"
					    header="_dept_pk|Organization|Male|Female|Total"
					    format="0|0|0|0|0"
					    aligns="0|2|0|0|0"
					    defaults="||||"
					    editcol="0|0|0|0|0"
					    widths="0|3000|2000|2000|2000"
					    styles="width:100%;height:100%"
					    sorting="T"
					    acceptNullDate="T"
					    oncelldblclick = "Popup(3)"/>
			    </td>
		    </tr>	
	    </table>
	    
</table>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtFrom" styles="display:none"/>
    <gw:textbox id="txtTo" styles="display:none"/>
    <gw:textbox id="txtSearchType" styles="display:none"/>
    <gw:textbox id="txttest" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
     <gw:textbox id="txtEmpType" styles="display:none"/>
</body>
</html>
