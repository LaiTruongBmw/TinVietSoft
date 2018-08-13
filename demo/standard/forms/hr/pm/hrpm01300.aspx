<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var flag=0;
var codeadmin_yn,master_pk;
codeadmin_yn ="<%=Session("CODEADMIN_YN")%>";
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);
    <%=CtlLib.SetGridColumnComboFormat( "idGrid1" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0035'") %>; 
    <%=CtlLib.SetGridColumnComboFormatString2( "idGrid1" , 4 , "1|FULL|2|DEVIDE|3|PROGRESS|4|FROM_TO") %>;   
    <%=CtlLib.SetGridColumnComboFormat( "idGrid3" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0003'") %>;  
    <%=CtlLib.SetGridColumnComboFormat( "idGrid4" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0001'") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "idGrid5" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0022'") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "idGrid6" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0025'") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "idGrid9" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0017'") %>;  
    <%=CtlLib.SetGridColumnComboFormatString2( "idGrid10" , 1 , "01|Under|02|Progress") %>;  
    <%=CtlLib.SetGridColumnComboFormat( "idGrid11" , 1 , "select code,code_nm from vhr_hr_code a where a.id='HR0037'") %>;  
    if(codeadmin_yn!='Y')
        Set_Enable(0);
        
    
    var data;
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstCompany.SetDataText(data);
    txtUser_PK.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
      
    datUser_info.Call("SELECT");
   
}
function Set_Enable(flag)
{
    
    ibtnNew.SetEnable(flag);
    ibtnSave.SetEnable(flag);
    ibtnDel.SetEnable(flag);
    ibtnUDel.SetEnable(flag);
   
    
    ibtnNew2.SetEnable(flag);
    ibtnSave2.SetEnable(flag);
    ibtnDel2.SetEnable(flag);
    ibtnUDel2.SetEnable(flag);
    
    ibtnNew3.SetEnable(flag);
    ibtnSave3.SetEnable(flag);
    ibtnDel3.SetEnable(flag);
    ibtnUDel3.SetEnable(flag);
    
    ibtnNew4.SetEnable(flag);
    ibtnSave4.SetEnable(flag);
    ibtnDel4.SetEnable(flag);
    ibtnUDel4.SetEnable(flag);
    
    ibtnNew5.SetEnable(flag);
    ibtnSave5.SetEnable(flag);
    ibtnDel5.SetEnable(flag);
    ibtnUDel5.SetEnable(flag);
    
    ibtnNew6.SetEnable(flag);
    ibtnSave6.SetEnable(flag);
    ibtnDel6.SetEnable(flag);
    ibtnUDel6.SetEnable(flag);
    
    ibtnNew7.SetEnable(flag);
    ibtnSave7.SetEnable(flag);
    ibtnDel7.SetEnable(flag);
    ibtnUDel7.SetEnable(flag);
    
    ibtnNew8.SetEnable(flag);
    ibtnSave8.SetEnable(flag);
    ibtnDel8.SetEnable(flag);
    ibtnUDel8.SetEnable(flag);
    
    ibtnNew9.SetEnable(flag);
    ibtnSave9.SetEnable(flag);
    ibtnDel9.SetEnable(flag);
    ibtnUDel9.SetEnable(flag);
    
    ibtnNew10.SetEnable(flag);
    ibtnSave10.SetEnable(flag);
    ibtnDel10.SetEnable(flag);
    ibtnUDel10.SetEnable(flag);
    
    ibtnNew11.SetEnable(flag);
    ibtnSave11.SetEnable(flag);
    ibtnDel11.SetEnable(flag);
    ibtnUDel11.SetEnable(flag); 
    
    ibtnNew12.SetEnable(flag);
    ibtnSave12.SetEnable(flag);
    ibtnDel12.SetEnable(flag);
    ibtnUDel12.SetEnable(flag);  
    
}

function Set_Enable_Seq(num,flag)
{
    switch(num)
    {   
        case 1:
            ibtnNew1.SetEnable(flag);
            ibtnSave1.SetEnable(flag);
            ibtnDel1.SetEnable(flag);
            ibtnUDel1.SetEnable(flag);
            break;
        case 2:
            ibtnNew2.SetEnable(flag);
            ibtnSave2.SetEnable(flag);
            ibtnDel2.SetEnable(flag);
            ibtnUDel2.SetEnable(flag);
            break;
       case 3:
            ibtnNew3.SetEnable(flag);
            ibtnSave3.SetEnable(flag);
            ibtnDel3.SetEnable(flag);
            ibtnUDel3.SetEnable(flag);     
            break;
       case 4:
            ibtnNew4.SetEnable(flag);
            ibtnSave4.SetEnable(flag);
            ibtnDel4.SetEnable(flag);
            ibtnUDel4.SetEnable(flag);     
            break;
       case 5:
            ibtnNew5.SetEnable(flag);
            ibtnSave5.SetEnable(flag);
            ibtnDel5.SetEnable(flag);
            ibtnUDel5.SetEnable(flag);     
            break;     
       case 6:
            ibtnNew6.SetEnable(flag);
            ibtnSave6.SetEnable(flag);
            ibtnDel6.SetEnable(flag);
            ibtnUDel6.SetEnable(flag);     
            break;       
       case 7:
            ibtnNew7.SetEnable(flag);
            ibtnSave7.SetEnable(flag);
            ibtnDel7.SetEnable(flag);
            ibtnUDel7.SetEnable(flag);     
            break;     
       case 8:
            ibtnNew8.SetEnable(flag);
            ibtnSave8.SetEnable(flag);
            ibtnDel8.SetEnable(flag);
            ibtnUDel8.SetEnable(flag);     
            break;   
       case 9:
            ibtnNew9.SetEnable(flag);
            ibtnSave9.SetEnable(flag);
            ibtnDel9.SetEnable(flag);
            ibtnUDel9.SetEnable(flag);     
            break;      
       case 10:
            ibtnNew10.SetEnable(flag);
            ibtnSave10.SetEnable(flag);
            ibtnDel10.SetEnable(flag);
            ibtnUDel10.SetEnable(flag);     
            break;       
       case 11:
            ibtnNew11.SetEnable(flag);
            ibtnSave11.SetEnable(flag);
            ibtnDel11.SetEnable(flag);
            ibtnUDel11.SetEnable(flag);     
            break;            
       case 12:
            ibtnNew12.SetEnable(flag);
            ibtnSave12.SetEnable(flag);
            ibtnDel12.SetEnable(flag);
            ibtnUDel12.SetEnable(flag);     
            break;       
    }
    
   
}
function OnDataReceive(obj)
{
    if(obj.id=="datUser_info")
    datAllow.Call();
    if(obj.id=="datAllow")
    {
    
    // idGrid1.AppendComboItem(1, txt_allowance.text );
    // idGrid1.RemoveComboItem(1,txt_allowance.text.split("|").length/2-0.5);
   //  alert(idGrid1.GetComboItemIndex(1,"",'F')
   
    var arr = txt_allowance.text.replace("DATA|",'').split("|");
       var s="";
       //alert(arr);
       var t=0;
	       for(var i=0;i< (arr.length+1)/2-1;i++)
	        {
		        s = s +"#" + arr[t] + ";" + arr[t+1]+"|";
		        t=t+2;
		        //alert(s);
	        }
	       // alert(s);
            idGrid1.SetComboFormat(1,s  );
     
    // alert(txt_allowance.text);
    datAllowance_master.Call("SELECT");
    }
    
    if(obj.id=="datAllowance_master")
         Set_Enable(2,0);
    else if(obj.id=="datAllowance_time_rule")
    {
        if(flag==0)     
            datAllowance_abs_rule.Call("SELECT");
    }    
    else if(obj.id=="datAllowance_abs_rule")
    {
      if(flag==0)     
            datAllowance_contract_rule.Call("SELECT");
    }        
    else if(obj.id=="datAllowance_contract_rule")
    {
        if(flag==0)                     
            datAllowance_resign_rule.Call("SELECT");
    }        
    else if(obj.id=="datAllowance_resign_rule")
    {
        if(flag==0)                             
            datAllowance_discip_rule.Call("SELECT");  
    }
    else if(obj.id=="datAllowance_discip_rule")        
    {
        if(flag==0)                     
            datAllowance_num_wd_rule.Call("SELECT");      
    }        
    else if(obj.id=="datAllowance_num_wd_rule")
    {
        if(flag==0)                             
            datAllowance_num_month_rule.Call("SELECT");    
    }        
    else if(obj.id=="datAllowance_num_month_rule")
    {
        if(flag==0)                             
            datAllowance_emp_rule.Call("SELECT");      
    }       
    else if(obj.id=="datAllowance_emp_rule")
    {
        if(flag==0)                             
            datAllowance_progressive.Call("SELECT");      
     }  
    else if(obj.id=="datAllowance_progressive")
    {
        if(flag==0)                             
            datAllowance_probation_status.Call("SELECT");      
        else
            flag=0;    
    }         
    else if(obj.id=="datAllowance_progressive")
    {
        if(flag==0)                             
            datNo_Scan_Time.Call("SELECT");      
        else
            flag=0;    
     }          
        
}
function OnAddNew(n)
{
    switch(n)
    {
        case 1:
            idGrid1.AddRow();
            idGrid1.GetGridControl().TopRow=idGrid1.rows;
            idGrid1.SetGridText(idGrid1.rows-1,5,lstCompany.value);
            break;  
        case 2:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            idGrid2.AddRow();
            idGrid2.GetGridControl().TopRow=idGrid2.rows;
            idGrid2.SetGridText(idGrid2.rows-1,5,master_pk);
            
            break;            
        case 3:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid3.AddRow();
            idGrid3.GetGridControl().TopRow=idGrid3.rows;
            idGrid3.SetGridText(idGrid3.rows-1,4,master_pk);
            idGrid3.SetGridText(idGrid3.rows-1,2,'-1');
            break;           
        case 4:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid4.AddRow();
            idGrid4.GetGridControl().TopRow=idGrid4.rows;
            idGrid4.SetGridText(idGrid4.rows-1,3,master_pk);
            idGrid4.SetGridText(idGrid4.rows-1,2,'-1');
            break;                 
        case 5:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid5.AddRow();
            idGrid5.GetGridControl().TopRow=idGrid5.rows;
            idGrid5.SetGridText(idGrid5.rows-1,3,master_pk);
            idGrid5.SetGridText(idGrid5.rows-1,2,'-1');
            break;         
        case 6:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid6.AddRow();
            idGrid6.GetGridControl().TopRow=idGrid6.rows;
            idGrid6.SetGridText(idGrid6.rows-1,3,master_pk);
            break;            
        case 7:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid7.AddRow();
            idGrid7.GetGridControl().TopRow=idGrid7.rows;
            idGrid7.SetGridText(idGrid7.rows-1,4,master_pk);
            break;        
       case 8:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid8.AddRow();
            idGrid8.GetGridControl().TopRow=idGrid8.rows;
            idGrid8.SetGridText(idGrid8.rows-1,4,master_pk);
            break;             
       case 9:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid9.AddRow();
            idGrid9.GetGridControl().TopRow=idGrid9.rows;
            idGrid9.SetGridText(idGrid9.rows-1,3,master_pk);
            idGrid9.SetGridText(idGrid9.rows-1,2,'-1');
            break;              
       case 10:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid10.AddRow();
            idGrid10.GetGridControl().TopRow=idGrid10.rows;
            idGrid10.SetGridText(idGrid10.rows-1,4,master_pk);
            break;            
       case 11:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid11.AddRow();
            idGrid11.GetGridControl().TopRow=idGrid11.rows;
            idGrid11.SetGridText(idGrid11.rows-1,3,master_pk);
            idGrid11.SetGridText(idGrid11.rows-1,2,'-1');
            break;               
       case 12:
            
            if(master_pk=="")
            {
                alert("Choose master allowance first.\nBạn phải chọn phụ cấp chính trước.")
                return;
            }
            
            idGrid12.AddRow();
            idGrid12.GetGridControl().TopRow=idGrid12.rows;
            idGrid12.SetGridText(idGrid12.rows-1,5,master_pk);
            break;                             
    }
}
function OnUpdate(n)
{
        flag=1;
     if(n==1)
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_master.Call();
     }
     else if(n==2)//time rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_time_rule.Call();
     }   
     else if(n==3)//abs rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_abs_rule.Call();
     }   
     else if(n==4)//contract rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_contract_rule.Call();
     }   
     else if(n==5)//resign rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_resign_rule.Call();
     }   
     else if(n==6)//discipt rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_discip_rule.Call();
     }   
      else if(n==7)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_num_wd_rule.Call();
     }   
     else if(n==8)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_num_month_rule.Call();
     }   
     else if(n==9)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_emp_rule.Call();
     }   
     else if(n==10)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_progressive.Call();
     }   
      else if(n==11)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datAllowance_probation_status.Call();
     }   
     else if(n==11)//kind 2 rule
     {
        if(confirm("Do you want to save?\nBạn chắc chắn save?"))
            datNo_Scan_Time.Call();
     }   
     
     
}
function onClick_Master()
{
    
    var sel_row=idGrid1.GetGridControl().SelectedRows;
    if(sel_row>1)
    {
        alert("You can not multi select rows here.\nBạn không thể chọn được nhiều dòng ở đây.")
        return;
    }
    txt_master_pk.text=master_pk=idGrid1.GetGridData(event.row,0);  
    if(txt_master_pk.text!="")
    {
        flag=0 
        datAllowance_time_rule.Call("SELECT");
    }   
}
function OnDelete(n)
{
    if(confirm("Do you want to delete?\nBạn muốn xóa?"))
    {
        switch(n)
        {
            case 1:
                idGrid1.DeleteRow();
                break;  
            case 2:
                idGrid2.DeleteRow();
                break;  
            case 3:
                idGrid3.DeleteRow();
                break;  
            case 4:
                idGrid4.DeleteRow();
                break;  
            case 5:
                idGrid5.DeleteRow();
                break;  
            case 6:
                idGrid6.DeleteRow();
                break;  
            case 7:
                idGrid7.DeleteRow();
                break;  
            case 8:
                idGrid8.DeleteRow();
                break;  
            case 9:
                idGrid9.DeleteRow();
                break;          
            case 10:
                idGrid10.DeleteRow();
                break;     
            case 11:
                idGrid11.DeleteRow();
                break;     
            case 12:
                idGrid12.DeleteRow();
                break;                          
    
        }     
    }       
}
function OnUnDelete(n)
{
    
        switch(n)
        {
            case 1:
                idGrid1.UnDeleteRow();
                break;  
            case 2:
                idGrid2.UnDeleteRow();
                break;  
            case 3:
                idGrid3.UnDeleteRow();
                break;  
            case 4:
                idGrid4.UnDeleteRow();
                break;  
            case 5:
                idGrid5.UnDeleteRow();
                break;  
            case 6:
                idGrid6.UnDeleteRow();
                break;  
            case 7:
                idGrid7.UnDeleteRow();
                break;  
            case 8:
                idGrid8.UnDeleteRow();
                break;  
            case 9:
                idGrid9.UnDeleteRow();
                break;      
            case 10:
                idGrid10.UnDeleteRow();
                break;        
            case 11:
                idGrid11.UnDeleteRow();
                break;     
             case 12:
                idGrid12.UnDeleteRow();
                break;                          
    
      }     
}

function ChangeLocation()
{
idGrid1.ClearData();
idGrid2.ClearData();		
idGrid3.ClearData();	
idGrid4.ClearData();	
idGrid5.ClearData();	
idGrid6.ClearData();
idGrid7.ClearData();	
idGrid8.ClearData();	
idGrid9.ClearData();	
idGrid10.ClearData();	
idGrid11.ClearData();	
idGrid12.ClearData();	

	
datAllow.Call();
}

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
<gw:data id="datAllowance_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5" function="ST_HR_SEL_HRPM01300_0" procedure="ST_HR_UPD_HRPM01300_0">
                <input bind="idGrid1" >
                    <input bind="txt_tmp" />
                    <input bind="lstCompany" />
                    
                </input>
                <output  bind="idGrid1" />
            </dso> 
        </xml> 
</gw:data>

<!-- time rule -->
<gw:data id="datAllowance_time_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5" function="HR_sel_80020009_time_rule" procedure="HR_upd_80020009_time_rule"> 
                <input bind="idGrid2" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>

<!-- absence rule -->
<gw:data id="datAllowance_abs_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4" function="HR_sel_80020009_abs_rule" procedure="HR_upd_80020009_abs_rule"> 
                <input bind="idGrid3" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>

<!-- contract rule -->
<gw:data id="datAllowance_contract_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3" function="HR_sel_80020009_contr_rule" procedure="HR_sel_80020009_contr_rule"> 
                <input bind="idGrid4" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid4" />
            </dso> 
        </xml> 
</gw:data>

<!-- resign rule -->
<gw:data id="datAllowance_resign_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3" function="HR_sel_80020009_resign_rule" procedure="HR_upd_80020009_resign_rule"> 
                <input bind="idGrid5" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid5" />
            </dso> 
        </xml> 
</gw:data>

<!-- discipline rule -->
<gw:data id="datAllowance_discip_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3" function="HR_sel_80020009_disc_rule" procedure="HR_upd_80020009_disc_rule"> 
                <input bind="idGrid6" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid6" />
            </dso> 
        </xml> 
</gw:data>

<!-- kind 2 rule -->
<gw:data id="datAllowance_num_wd_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4" function="HR_sel_80020009_wd_rule" procedure="HR_upd_80020009_wd_rule"> 
                <input bind="idGrid7" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid7" />
            </dso> 
        </xml> 
</gw:data>

<!-- kind 3 rule -->
<gw:data id="datAllowance_num_month_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4" function="HR_sel_80020009_nmonth_rule" procedure="HR_upd_80020009_nmonth_rule"> 
                <input bind="idGrid8" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid8" />
            </dso> 
        </xml> 
</gw:data>

<!-- employee type -->
<gw:data id="datAllowance_emp_rule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3" function="HR_sel_80020009_emp_rule" procedure="HR_upd_80020009_emp_rule"> 
                <input bind="idGrid9" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid9" />
            </dso> 
        </xml> 
</gw:data>

<!-- progressive -->
<gw:data id="datAllowance_progressive" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4" function="HR_sel_80020009_allow_progress" procedure="HR_upd_80020009_allow_progress"> 
                <input bind="idGrid10" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid10" />
            </dso> 
        </xml> 
</gw:data>

<!-- probation status -->
<gw:data id="datAllowance_probation_status" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3" function="HR_sel_80020009_allow_prob" procedure="HR_upd_80020009_allow_prob"> 
                <input bind="idGrid11" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid11" />
            </dso> 
        </xml> 
</gw:data>
<!-- No Scan Time -->
<gw:data id="datNo_Scan_Time" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5" function="HR_sel_80020009_no_scan_time" procedure="HR_upd_80020009_no_scan_time"> 
                <input bind="idGrid12" >
                    <input bind="txt_master_pk" />
                </input>
                <output  bind="idGrid12" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="txtUser_PK" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table--------------------------------->
<!------------------------------------------>
<gw:data id="datAllow" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_HRCODE_BY_COMPANY"  > 
                <input>
                    <input bind="lstCompany" />
                    <input bind="txt_Hr_code" />
                    
                </input> 
                <output>
                    <output bind="txt_allowance" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table--------------------------------->
<form name="General Reports" id="form1">
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="0" class="eco_line">
	<tr>
	    <td style="width:31%">
	        <table style="width:100%;height:6%" cellpadding="2" cellspacing="1" valign="top" border="0" >	
	             <tr style="height:6%;border:0">	
	                <td align=left colspan=20 style="width:40%"><b><i><font size=2 class="eco_link">Company</font></i></b></td>
		            <td align=left colspan=30 style="width:60%">
		                <gw:list  id="lstCompany" value=" " maxlen = "100" styles='width:100%'onchange="ChangeLocation()" />
                    </td>
                </tr>	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Allowance Master</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew" alt="New" img="new" text="New" onclick="OnAddNew(1)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnUpdate(1)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel" alt="Delete" img="delete" text="Delete" onclick="OnDelete(1)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(1)" /></td>
                </tr>	
	        </table>
	        <table id="tblMain" style="width:100%;height:27%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="tdMaster" style="width:100%">
	                    <gw:grid   
				        id="idGrid1"  
				        header="_pk|Kind|Name|Total Amt|Allow type|_Company_pk"   
				        format="0|0|0|1|0|0"  
				        aligns="0|0|0|0|0|0"  
				        defaults="|||||"  
				        editcol="0|1|1|1|1|1"  
				        widths="0|1000|1500|1000|1500|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "onClick_Master()" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Lately-Early</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew2" alt="New" img="new" text="New" onclick="OnAddNew(2)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnUpdate(2)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel2" alt="Delete" img="delete" text="Delete" onclick="OnDelete(2)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel2" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(2)" /></td>
                </tr>	
	        </table>
	        <table id="Table1" style="width:100%;height:20%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td1" style="width:100%">
	                    <gw:grid   
				        id="idGrid2"  
				        header="_pk|From|To Under|Amount(-)|Percent(-)|_master_pk"   
				        format="0|0|0|0|0|0"  
				        aligns="0|0|0|0|0|0"  
				        defaults="|||||"  
				        editcol="0|1|1|1|1|0"  
				        widths="1000|1000|1000|1000|1000|1000"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Absence Rule</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew3" alt="New" img="new" text="New" onclick="OnAddNew(3)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave3" alt="Save" img="save" text="Save" onclick="OnUpdate(3)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel3" alt="Delete" img="delete" text="Delete" onclick="OnDelete(3)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel3" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(3)" /></td>
                </tr>	
	        </table>
	        <table id="Table3" style="width:100%;height:35%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td3" style="width:100%">
	                    <gw:grid   
				        id="idGrid3"  
				        header="_pk|Absence Type|Allowed|Include(WD)|_master_pk"   
				        format="0|0|3|3|0"  
				        aligns="0|0|0|0|0"  
				        defaults="||||"  
				        editcol="0|1|1|1|0"  
				        widths="1000|2000|1000|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	    </td>
	    <td style="width:23%" class="eco_link_l">
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Contract Rule</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew4" alt="New" img="new" text="New" onclick="OnAddNew(4)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave4" alt="Save" img="save" text="Save" onclick="OnUpdate(4)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel4" alt="Delete" img="delete" text="Delete" onclick="OnDelete(4)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel4" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(4)" /></td>
                </tr>	
	        </table>
	        <table id="Table4" style="width:100%;height:27%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td4" style="width:100%">
	                    <gw:grid   
				        id="idGrid4"  
				        header="_pk|Contract Type|Allowed|_master_pk"   
				        format="0|0|3|0"  
				        aligns="0|0|0|0"  
				        defaults="|||"  
				        editcol="0|1|1|0"  
				        widths="1000|1500|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Resign rule</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew5" alt="New" img="new" text="New" onclick="OnAddNew(5)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave5" alt="Save" img="save" text="Save" onclick="OnUpdate(5)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel5" alt="Delete" img="delete" text="Delete" onclick="OnDelete(5)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel5" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(5)" /></td>
                </tr>	
	        </table>
	        <table id="Table5" style="width:100%;height:20%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td5" style="width:100%">
	                    <gw:grid   
				        id="idGrid5"  
				        header="_pk|Resign Type|Allowed|_master_pk"   
				        format="0|0|3|0"  
				        aligns="0|0|0|0"  
				        defaults="|||"  
				        editcol="0|1|1"  
				        widths="1000|1500|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Discipline Rule</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew6" alt="New" img="new" text="New" onclick="OnAddNew(6)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave6" alt="Save" img="save" text="Save" onclick="OnUpdate(6)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel6" alt="Delete" img="delete" text="Delete" onclick="OnDelete(6)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel6" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(6)" /></td>
                </tr>	
	        </table>
	        <table id="Table2" style="width:100%;height:35%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td2" style="width:100%">
	                    <gw:grid   
				        id="idGrid6"  
				        header="_pk|Level|Allowed|_master_pk"   
				        format="0|0|3|0"  
				        aligns="0|0|0|0"  
				        defaults="||||"  
				        editcol="0|1|1|0"  
				        widths="1000|1500|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	    </td>
	    <td style="width:23%">
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Num of WDays</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew7" alt="New" img="new" text="New" onclick="OnAddNew(7)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave7" alt="Save" img="save" text="Save" onclick="OnUpdate(7)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel7" alt="Delete" img="delete" text="Delete" onclick="OnDelete(7)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel7" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(7)" /></td>
                </tr>	
	        </table>
	        <table id="Table6" style="width:100%;height:27%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td6" style="width:100%">
	                    <gw:grid   
				        id="idGrid7"  
				        header="_pk|From|To Under|Amount|_master_pk"   
				        format="0|0|0|1|0"  
				        aligns="0|0|0|0|0"  
				        defaults="||||"  
				        editcol="0|1|1|1|0"  
				        widths="1000|1000|1000|1000"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Num of Months</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew8" alt="New" img="new" text="New" onclick="OnAddNew(8)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave8" alt="Save" img="save" text="Save" onclick="OnUpdate(8)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel8" alt="Delete" img="delete" text="Delete" onclick="OnDelete(8)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel8" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(8)" /></td>
                </tr>	
	        </table>
	        <table id="Table7" style="width:100%;height:20%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td7" style="width:100%">
	                    <gw:grid   
				        id="idGrid8"  
				        header="_pk|From|To Under|Amount|_master_pk"   
				        format="0|0|0|1|0"  
				        aligns="0|0|0|0|0"  
				        defaults="||||"  
				        editcol="0|1|1|1|0"  
				        widths="0|1000|1000|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Employee Type</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew9" alt="New" img="new" text="New" onclick="OnAddNew(9)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave9" alt="Save" img="save" text="Save" onclick="OnUpdate(9)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel9" alt="Delete" img="delete" text="Delete" onclick="OnDelete(9)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel9" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(9)" /></td>
                </tr>	
	        </table>
	        <table id="Table8" style="width:100%;height:35%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td8" style="width:100%">
	                    <gw:grid   
				        id="idGrid9"  
				        header="_pk|Emp Type|Allowed|_master_pk"   
				        format="0|0|3|0"  
				        aligns="0|0|0|0"  
				        defaults="|||"  
				        editcol="0|1|1|0"  
				        widths="1000|1500|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	    </td>
	    <td style="width:23%">
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Progressive(Months)</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew10" alt="New" img="new" text="New" onclick="OnAddNew(10)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave10" alt="Save" img="save" text="Save" onclick="OnUpdate(10)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel10" alt="Delete" img="delete" text="Delete" onclick="OnDelete(10)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel10" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(10)" /></td>
                </tr>	
	        </table>
	        <table id="Table9" style="width:100%;height:27%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td9" style="width:100%">
	                    <gw:grid   
				        id="idGrid10"  
				        header="_pk|Kind|value|Amount|_master_pk"   
				        format="0|0|0|1|0"  
				        aligns="0|0|0|0|0"  
				        defaults="||||"  
				        editcol="0|1|1|1|0"  
				        widths="0|1000|1000|1000"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3,4" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	       <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>Probation Status</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew11" alt="New" img="new" text="New" onclick="OnAddNew(11)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave11" alt="Save" img="save" text="Save" onclick="OnUpdate(11)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel11" alt="Delete" img="delete" text="Delete" onclick="OnDelete(11)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel11" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(11)" /></td>
                </tr>	
	        </table>
	        <table id="Table12" style="width:100%;height:20%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td12" style="width:100%">
	                    <gw:grid   
				        id="idGrid11"  
				        header="_pk|Probation Status|Allow|_master_pk"   
				        format="0|0|3|1"  
				        aligns="0|0|0|0"  
				        defaults="|||"  
				        editcol="0|1|1|0"  
				        widths="0|2000|1000|0"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        param="0,1,2,3" 
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	        <table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="height:6%;border:0">	
	                <td align=left colspan=36 style="width:72%"><b><i><font color=red size=2>No Scan Time</font></i></b></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnNew12" alt="New" img="new" text="New" onclick="OnAddNew(12)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnSave12" alt="Save" img="save" text="Save" onclick="OnUpdate(12)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnDel12" alt="Delete" img="delete" text="Delete" onclick="OnDelete(12)" /></td>
		            <td align=left style="width:2%"></td>
		            <td align=left colspan=3 style="width:6%"><gw:imgBtn id="ibtnUDel12" alt="UnDelete" img="udelete" text="UnDelete" onclick="OnUnDelete(12)" /></td>
                </tr>	
	        </table>
	        <table id="Table10" style="width:100%;height:20%" border=0 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td align=center id="td10" style="width:100%">
				        <gw:grid   
				        id="idGrid12"  
				        header="_pk|From|To Under|Amount(-)|Percent(-)|_master_pk"   
				        format="0|0|0|0|0|0"  
				        aligns="0|0|0|0|0|0"  
				        defaults="|||||"  
				        editcol="0|1|1|1|1|0"  
				        widths="1000|1000|1000|1000|1000|1000"  
				        styles="width:100%; height:100%"   
				        sorting="T"   
				        oncellclick     = "" />
	                </td>
	            </tr>
	        </table>
	    </td>
	</tr>
</table>
</form>
<gw:textbox id="txt_master_pk" styles="display:none"/>
<gw:textbox id="txt_tmp" styles="display:none"/>

<gw:textbox id="txtUser_PK" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txt_allowance"  styles="display:none"/>
<gw:textbox id="txt_Hr_code" text="HR0035"  styles="display:none"/>

</body>
</html>

