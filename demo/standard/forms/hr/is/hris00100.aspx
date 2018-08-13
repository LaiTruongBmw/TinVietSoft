<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var dt1, dt2,flag_tmp
// "_Company_PK|Company Name|Month|From|To|Close Y/N|Close DT"
var r_company_pk =0;
    r_company_name = 1;
    r_month=2;
    r_from =3;
    r_to=4;
    r_close_yn = 5;
    r_close_dt = 6;

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    idBtnOpen_1.SetEnable(false);
    idBtnClose_1.SetEnable(false);
    //if (v_language!="ENG")
        System.Translate(document);

    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    menu_id.text=System.Menu.GetMenuID();
    txtUse_for.text="INSURANCE PERIOD";
    txtWork_mon.text=IDYear.value+""+lst_Month.value;
    datCheck_View.Call();
    
}
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
   {
        if(txtFlag_View.text == 'Y')
        {
            idBtnOpen.style.display = "none";
            idBtnDel.style.display = "none";
            idBtnSave.style.display = "none";
            idBtnClose.style.display = "none";
            idBtnAdd.style.display = "none";
            idBtnProcess.style.display = "none";

            idBtnOpen_1.style.display = "none";
            idBtnDel_1.style.display = "none";
            idBtnSave_1.style.display = "none";
            idBtnClose_1.style.display = "none";
            idBtnAdd_1.style.display = "none";
        }
        
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        {
            datCompany_info.Call(); 
        }
	    else
            datIns_check_close.Call();
   }
   if(obj.id=="datCompany_info")
   {
        lst_company.SetDataText(txtdept_temp.text);
        lst_company_R.SetDataText(txtdept_temp.text);
        datTimes_info.Call();
   }
   if(obj.id== "datTimes_info")
   {
        datIns_check_close.Call();
   }
   if(obj.id=="datIns_check_close")
   {
        if(txtresult.text=='0')//chua có tháng này 
        {
            idBtnAdd.SetEnable(1);
            idBtnProcess.SetEnable(1);
            idBtnOpen.SetEnable(0);
            idBtnClose.SetEnable(0);
            idBtnSave.SetEnable(0);
            idBtnDel.SetEnable(0);
         }   
        else if(txtresult.text=='1') //chưa đóng 
        {
            idBtnOpen.SetEnable(0);
            idBtnDel.SetEnable(1);
            idBtnSave.SetEnable(1);
            idBtnClose.SetEnable(1);
        }
        else   //đã đóng 
        {
            idBtnOpen.SetEnable(1);
            idBtnClose.SetEnable(0);
            idBtnSave.SetEnable(0);
            idBtnDel.SetEnable(0);
        }
        datGet_List_Kind.Call();
   }    
  if(obj.id=="datIns_from_to")
  {
        datInsurance.Call("SELECT");
    }
  if(obj.id=="datGet_List_Kind")
  {
        if(lst_Ins_kind.GetControl().options.length>1)
        {
            lst_Ins_kind.value="ALL";
            datIns_from_to.Call();
        }
        else
        {
            alert("There is no kind in define of insurance.\nChưa có loại bảo hiểm nào được định nghĩa.");
            idBtnOpen.SetEnable(0);
            idBtnClose.SetEnable(0);
            idBtnSave.SetEnable(0);
            idBtnDel.SetEnable(0);
        }
        
  }	
  	
  if(obj.id=="datIns_Close" || obj.id=="datIns_Regulation_Close")
  {
    if(txtresult.text=='0')
    {
        alert(txtflag.text+" Successful.");
        datIns_check_close.Call();
    }    
    else
        alert(txtflag.text+" Unsuccessful.");  
    if (obj.id=="datIns_Regulation_Close")
        datInsRegulation.Call('SELECT'); 
    
  }	
  if(obj.id=="datCopyPeriod")
  {
        if(txtresult.text=='0')
        {
            alert('Successful.')
             idBtnOpen.SetEnable(0);
            idBtnDel.SetEnable(1);
            idBtnSave.SetEnable(1);
            idBtnClose.SetEnable(1);
        }
        else if (txtresult.text=='1')
        {
            alert('UnSuccessful.This period is already existed!')
            
        }
        
        datInsurance.Call('SELECT')
  }
  if(obj.id == "datInsurance")
  {
        idRecord.text=idGrid.rows-1 ;
        if(idGrid.rows-1>0)
        auto_resize_column(idGrid,0,idGrid.cols-1,0);

        if(lst_company.value =="ALL")
        {
            idBtnAdd.SetEnable(0);
            idBtnProcess.SetEnable(0);
            idBtnOpen.SetEnable(0);
            idBtnDel.SetEnable(0);
            idBtnSave.SetEnable(0);
            idBtnClose.SetEnable(0);
            
        }
  }
  if(obj.id == "datInsRegulation")
  {
        if(lst_company_R.value =="ALL")
        {
            idBtnAdd_1.SetEnable(0);
        }
        else 
            idBtnAdd_1.SetEnable(1);
    
        idRecord_R.text=grdRegulation.rows-1;
//        if(grdRegulation.rows-1>0)
//        auto_resize_column(grdRegulation,0,grdRegulation.cols-1,0);
  }
       
}   
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}    
function onSearch()
{
    datInsurance.Call("SELECT");
}

function Onchage_Times()
{
    datGet_List_Kind.Call();
}
function onCheck_close()
{
   txtWork_mon.text=IDYear.value+""+lst_Month.value; 
   datIns_check_close.Call(); 
}
function OnAdd()
{ 
    var mon,mon_nm,tmp,times,times_nm,row,from,to
    if(Trim(txtFrom.text)==""||Trim(txtTo.text)=="")
        {
        alert("Input from or to please.\nBạn chưa nhập đầy đủ from to.");
        return;
    }
    if(isNaN(txtFrom.text))
    {
        alert("From or To incorrect.\nFrom hoặc To chưa đúng.");
        return;
    }
    times=lst_times.value;
    times_nm=lst_times.GetText();
    row=idGrid.rows;
    if(lst_Month.value=='ALL')//add ca nam
    {
        for(var i=1;i<=12;i++)
        {
           if(i<10)
           {
                tmp=0+""+i;
                
                if(Number(txtFrom.text)>Number(txtTo.text))
                {
                    if(i>1)
                        from=IDYear.value+""+0+""+i-1+""+txtFrom.text;
                    else    
                        from=IDYear.value-1+""+"12"+""+txtFrom.text;
                }
                else
                    from=IDYear.value+""+0+""+i+""+txtFrom.text;
                if (txtTo.text!="END" && txtTo.text!="end")
                    to=IDYear.value+""+0+""+i+""+txtTo.text;    
                else
                    to=IDYear.value+""+0+""+i+""+ getDaysInMonth(IDYear.value+""+0+""+i) ; 
           }     
           else
           {     
                tmp=i;
                if(Number(txtFrom.text)>Number(txtTo.text))
                     from=IDYear.value+""+i-1+""+txtFrom.text;
                else        
                     from=IDYear.value+""+i+""+txtFrom.text;
                if (txtTo.text!="END")
                    to=IDYear.value+""+0+""+i+""+txtTo.text;    
                else
                    to=IDYear.value+""+0+""+i+""+ getDaysInMonth(IDYear.value+""+0+""+i) ;   
           }     
           mon=IDYear.value+""+tmp;
           mon_nm=tmp+"/"+IDYear.value;
           
           if(lst_Ins_kind.value=='ALL') //add cho all kind 
           {
                for(var j=0;j<lst_Ins_kind.GetControl().options.length;j++)
                {
                    var kind,kind_nm,flag
                    kind=lst_Ins_kind.GetControl().options.item(j).value;
                    kind_nm=lst_Ins_kind.GetControl().options.item(j).text;
                    flag=0;
                    if(row>1)
                    {
                        var k=1;
                        while(k<row && flag==0)//kiem tra xem da co duoi luoi hay chua
                        {
                            if(mon==idGrid.GetGridData(k,7)&&times==idGrid.GetGridData(k,8)&&kind==idGrid.GetGridData(k,9)&& lst_company.value== idGrid.GetGridData(k,0))
                                flag=1;
                            k+=1;
                        }
                        if(flag==0 && kind!='ALL')
                        {
                            idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                        }    
                    }
                    else if(kind!='ALL')
                    {
                        idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                    }
                    
                }
           } //kind==all
           else
           {
                var kind,kind_nm,flag
                flag=0;
                kind=lst_Ins_kind.value;
                kind_nm=lst_Ins_kind.GetText();
                if(row>1)
                {
                        var k=1;
                        while(k<row && flag==0)//kiem tra xem da co duoi luoi hay chua
                        {
                            if(mon==idGrid.GetGridData(k,7)&&times==idGrid.GetGridData(k,8)&&kind==idGrid.GetGridData(k,9)&& lst_company.value== idGrid.GetGridData(k,0))
                                flag=1;
                            k+=1;
                        }
                        if(flag==0)
                        {
                            idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                        }    
                 }
                 else
                 {
                        idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                 }
                
           }
        }
    }
    else //chon 1 thang
    {
           if(Number(txtFrom.text)>Number(txtTo.text))
           {
                var tmp;
                if(Number(lst_Month.value)==1)
                     from=IDYear.value-1+"12"+addZero(txtFrom.text);
                 else       
                     from=IDYear.value+""+addZero(Number(lst_Month.value)-1)+""+addZero(txtFrom.text);   
                     
           }     
            else
                from=IDYear.value+""+lst_Month.value+""+addZero(txtFrom.text);
            if (txtTo.text!="END" && txtTo.text!="end" )
            {
                    to=IDYear.value+""+ lst_Month.value +""+ addZero(txtTo.text); 
                    
            }
            else
            {  
                    to=IDYear.value+"" + lst_Month.value + "" + getDaysInMonth(IDYear.value +""+ lst_Month.value + "") ;
                
            }
           mon=IDYear.value+""+lst_Month.value;
           mon_nm=lst_Month.value+"/"+IDYear.value;
           
           if(lst_Ins_kind.value=='ALL' ) //add cho all kind 
           {
                for(var j=0;j<lst_Ins_kind.GetControl().options.length;j++)
                {
                    var kind,kind_nm,flag
                    kind=lst_Ins_kind.GetControl().options.item(j).value;
                    kind_nm=lst_Ins_kind.GetControl().options.item(j).text;
                    
                    flag=0;
                    if(kind!='ALL')
                    {
                        if(row>1)
                        {
                            var k=1;
                            while(k<row && flag==0)//kiem tra xem da co duoi luoi hay chua
                            {
                                if(mon==idGrid.GetGridData(k,7)&&times==idGrid.GetGridData(k,8)&&kind==idGrid.GetGridData(k,9)&& lst_company.value== idGrid.GetGridData(k,0))
                                    flag=1;
                                k+=1;
                            }
                            if(flag==0 && kind!='ALL' )
                            {
                                idGrid.AddRow();
                                idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                                idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                                idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                                idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                                idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                                idGrid.SetGridText(idGrid.rows-1,5,from);
                                idGrid.SetGridText(idGrid.rows-1,6,to);
                                idGrid.SetGridText(idGrid.rows-1,9,mon);
                                idGrid.SetGridText(idGrid.rows-1,10,times);
                                idGrid.SetGridText(idGrid.rows-1,11,kind);
                            }    
                        }
                        else if(kind!='ALL')
                        {
                            idGrid.AddRow();
                                idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                                idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());

                                idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                                idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                                idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                                idGrid.SetGridText(idGrid.rows-1,5,from);
                                idGrid.SetGridText(idGrid.rows-1,6,to);
                                idGrid.SetGridText(idGrid.rows-1,9,mon);
                                idGrid.SetGridText(idGrid.rows-1,10,times);
                                idGrid.SetGridText(idGrid.rows-1,11,kind);
                        }
                   }
                }
           } //kind==all
           else
           {
                var kind,kind_nm,flag
                flag=0;
                kind=lst_Ins_kind.value;
                kind_nm=lst_Ins_kind.GetText();
                if(row>1)
                {
                        var k=1;
                        while(k<row && flag==0)//kiem tra xem da co duoi luoi hay chua
                        {
                            if(mon==idGrid.GetGridData(k,7)&&times==idGrid.GetGridData(k,8)&&kind==idGrid.GetGridData(k,9)&& lst_company.value== idGrid.GetGridData(k,0))
                                flag=1;
                            k+=1;
                        }
                        if(flag==0)
                        {
                            idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                        }    
                 }
                 else
                 {
                        idGrid.AddRow();
                            idGrid.SetGridText(idGrid.rows-1,0,lst_company.value);
                            idGrid.SetGridText(idGrid.rows-1,1,lst_company.GetText());
                            idGrid.SetGridText(idGrid.rows-1,2,mon_nm);
                            idGrid.SetGridText(idGrid.rows-1,3,times_nm);
                            idGrid.SetGridText(idGrid.rows-1,4,kind_nm);
                            idGrid.SetGridText(idGrid.rows-1,5,from);
                            idGrid.SetGridText(idGrid.rows-1,6,to);
                            idGrid.SetGridText(idGrid.rows-1,9,mon);
                            idGrid.SetGridText(idGrid.rows-1,10,times);
                            idGrid.SetGridText(idGrid.rows-1,11,kind);
                 }
                
           }
        
    }
    idBtnOpen.SetEnable(false);
    idBtnClose.SetEnable(true);
    idBtnSave.SetEnable(1);
}
function OnSave(objdat)
{
    if(confirm("Are you sure?\nBạn đã chắc chắn save?"))
        objdat.Call();
}
function OnDelete(obj)
{
    if(confirm("Are you sure to delete?\nBạn đã chắc chắn xóa?"))
        if (obj==1)
            idGrid.DeleteRow();
        else
            grdRegulation.DeleteRow();
}
function OnOpen_Close(flag)
{
    txtflag.text=flag;
    if(lst_Ins_kind.value!="ALL")
        alert("If you want to "+flag+". You must choose Select All for kind.\nBạn phải chọn Select All nếu bạn muốn "+flag+".");
    else
    {
        if(confirm("Are you sure to "+flag+"?\nBạn đã chắc chắn "+flag+"?"))
            datIns_Close.Call();
    }    
            
}
function addZero(num)//9=09
{
    if(Number(num)<10)
    {
	   return '0' + num;
	}
	else
	{
	   return  '' + num;
	}
 } 
function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
{
   // returns the last day of a given month
    var m,y,tmpDate,checkMonth,lastDay
	
	m = Number(yyyymm.substr(4,2))-1;
	y = Number(yyyymm.substr(0,4));
	tmpDate = new Date(y, m, 28);
	checkMonth = tmpDate.getMonth();
	lastDay = 27;
	while(lastDay <= 31)
    {
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++
    }
    return addZero(lastDay);
}
//--------------------------Regulation tab-------------------------
function OnAddAll()
{
    var istart=1;
    var iend=12;
    if (lst_Month_1.value!="ALL")
    {
        istart=lst_Month_1.value;
        iend=lst_Month_1.value;
    }    
    for (var i=istart;i<=iend;i++)
    {
        var irow,smonth,sfrom,sto;
        smonth= addZero(i) + '/' +  String(IDYear_1.value) ;
        if (CheckExist(smonth))
        {
            if (Number(txtFrom_1.text) > Number(txtTo_1.text))
            {
                if (i==1)
                    sfrom=addZero(Number(IDYear_1.value)-1) + "12" ;
                else 
                    sfrom=addZero(Number(IDYear_1.value)) +  String(addZero(i-1));
            }
            else
            {
                sfrom=String(IDYear_1.value) + String(addZero(i))
                   
            }
            //alert( String(addZero(i-1)));
            if (txtFrom_1.text=="")
                {
                    sfrom=sfrom + '01';
                }
                else
                    sfrom=sfrom + String(addZero(txtFrom_1.text)); 
            if (txtTo_1.text=="")
                sto=String(IDYear_1.value) + String(addZero(i)) + String(getDaysInMonth(String(IDYear_1.value) + addZero(i)));
            else
                sto=String(IDYear_1.value) + String(addZero(i)) + String(addZero(txtTo_1.text));    
            grdRegulation.AddRow();
            irow=grdRegulation.rows-1;
            grdRegulation.SetGridText(irow,0,lst_company_R.value);//company_pk
            grdRegulation.SetGridText(irow,1,lst_company_R.GetText());//company_pk
            grdRegulation.SetGridText(irow,2,smonth);//month
            grdRegulation.SetGridText(irow,3,sfrom);//from
            grdRegulation.SetGridText(irow,4,sto);//to
            grdRegulation.SetGridText(irow,5,'NO');//close YN
        }
    }
}
function CheckExist(smonth)
{
    for (var i=1;i<grdRegulation.rows;i++)
        if (grdRegulation.GetGridData(i,0) == smonth)
            return false
    return true;
}
function OnChangeTab()
{
    if (tabMain.GetCurrentPageNo()==1)
    {
        datInsRegulation.Call("SELECT");
    }
}
//----------------------------------------------------------------------
function OnOpen_Close_1(flag)
{
    txtflag.text=flag;
    if(confirm("Are you sure to "+flag+"?\nBạn đã chắc chắn "+flag+"?"))
    {
        txtWork_mon.text=grdRegulation.GetGridData(grdRegulation.row,r_month);
        datIns_Regulation_Close.Call();
    }
}
//-----------------------
function OnCheckStatus()
{
    var irow=grdRegulation.row;
    if (irow>=1)
    {
        if (grdRegulation.GetGridData(irow,r_close_yn)=="NO")
        {
            idBtnOpen_1.SetEnable(false);
            idBtnClose_1.SetEnable(true);
        }
        else
        {
            idBtnOpen_1.SetEnable(true);
            idBtnClose_1.SetEnable(false);
        }
    }
    
}
function OnAuto()
{
    if(lst_Month.value=='ALL')//add ca nam
    {
        alert('Please select one month to make period!')
    }else
    {
         datCopyPeriod.Call()
    }
}
function onChange_Company(obj)
{
    if(obj == '1') // change insurance
        datTimes_info.Call();
    else if(obj == '2') // change regulation
        datInsRegulation.Call("SELECT");
}
//--------------------
</script>
<body>
<!-------------------data control----------------------->
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
<gw:data id="datCompany_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTimes_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_INS_TIMES_LIST"  > 
                <input>
                    <input bind="lst_company" />
                </input> 
                <output>
                    <output bind="lst_times" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datIns_check_close" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_INS_CHECK_CLOSE" > 
                <input>
                    <input bind="lst_company" />
                    <input bind="txtWork_mon" /> 
                    <input bind="lst_times" /> 
                </input> 
                <output>
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datIns_from_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_INS_GET_FROM_TO" > 
                <input>
                    <input bind="lst_company" />
                    <input bind="txtUse_for" /> 
                    <input bind="lst_times" /> 
                    <input bind="txtWork_mon" />
                    <input bind="lst_Ins_kind" />
                </input> 
                <output>
                    <output bind="txtFrom" />
                    <output bind="txtTo" />
                    <output bind="txtTmp" />                    
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datIns_Close" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00100_0" > 
                <input>
                    <input bind="lst_company" />
                    <input bind="txtWork_mon" />
                    <input bind="lst_times" /> 
                    <input bind="txtflag" />
                </input> 
                <output>
                    <output bind="txtresult" />                    
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_List_Kind" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_HRIS00100_1" > 
                <input>
                    <input bind="lst_company" />
                    <input bind="lst_times" />
                </input> 
                <output>
                    <output bind="lst_Ins_kind" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------->
<gw:data id="datIns_Regulation_Close" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00100_2" > 
                <input>
                    <input bind="lst_company_R" />
                    <input bind="txtWork_mon" />
                    <input bind="txtflag" /> 
                </input> 
                <output>
                    <output bind="txtresult" />                    
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------->
<gw:data id="datCopyPeriod" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00100_3" > 
                <input>
                    <input bind="txtWork_mon" /> 
                    <input bind="lst_times" /> 
                </input> 
                <output>
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datInsurance" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,5,6,9,10,11" function="ST_HR_SEL_HRIS00100_0" procedure="ST_HR_UPD_HRIS00100_0"> 
                <input bind="idGrid" >
                    <input bind="lst_company" />
                    <input bind="txtWork_mon" />
                    <input bind="lst_times" />
                    <input bind="lst_Ins_kind" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------->
<gw:data id="datInsRegulation" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,2,3,4,5,6" function="ST_HR_SEL_HRIS00100_1" procedure="ST_HR_UPD_HRIS00100_1"> 
                <input bind="grdRegulation" >
                    <input bind="lst_company_R" /> 
                    <input bind="IDYear_1" />
                </input>
                <output  bind="grdRegulation" />
            </dso> 
        </xml> 
</gw:data>

<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="OnChangeTab()" >  
<table name="Insurance" style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width:100%;height:8%" cellpadding="0" cellspacing="0" valign="top" border="0" >
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Company
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lst_company" onchange="onChange_Company(1)" maxlen = "100" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' and a.pk=nvl('" + session("COMPANY_PK") + "',a.pk) order by A.PARTNER_ID")%></data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Year
								</td>
								<td colspan=20 style="border:0" width="20%"  align="left" >
									<gw:datebox id="IDYear" onchange="onCheck_close()"  maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=year />
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Month
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lst_Month" onchange="onCheck_close()" maxlen = "100" styles='width:100%' >
												<data>|01|01|02|02|03|03|04|04|05|05|06|06|07|07|08|08|09|09|10|10|11|11|12|12|ALL|Select All</data></gw:list>
								</td>
								<td colspan=4 width="4%" style="border:0"  >
								
								</td>
								
							</tr>
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Times
								</td>
								<td colspan=20 style="border:0" width="20%"  align="left" >
									<gw:list  id="lst_times" onchange="onCheck_close()" value="ALL" maxlen = "100" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0042' ORDER BY B.CODE")%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									From
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >
									<gw:textbox id="txtFrom" text="" />
								</td>
								<td colspan=5 width="5%" style="border:0"  >
								
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >
									To
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >	
									<gw:textbox id="txtTo" text="" />
								</td>
								
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Kind
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lst_Ins_kind"  maxlen = "100" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0041' ORDER BY B.CODE")%>|ALL|Select All</data>
									</gw:list>
								</td>
							</tr>	    
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="" align="left">
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:label id="idRecord" text="" ></gw:label>							
						</td>
						<td colspan=50 width="50%" style="border:0"  align="left" >
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnAdd" img="new" text="Add New"  onclick="OnAdd()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnSave" img="save" text="Save"  onclick="OnSave(datInsurance)" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							
							<gw:button id="idBtnDel" img="delete" text="Delete"  onclick="OnDelete(1)" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnProcess" img="process" text="Auto"  onclick="OnAuto()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnOpen" img="lock_open" text="Open"  onclick="OnOpen_Close('OPEN')" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnClose" img="lock" text="Close"  onclick="OnOpen_Close('CLOSE')" />
						</td>
					</tr>
				</table>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
				<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
					<tr style="height:100%">
						<td id="master" width="100%">
							<gw:grid
								id="idGrid"
								header="_Company_PK|Company Name|Month|Times|Kind|From|To|Close Y/N|Close DT|_W_month|_times|_kind"
								format="0|0|0|0|0|4|4|0|0|0|0|0"
								aligns="0|0|0|1|0|1|1|1|1|0|0|0"
								defaults="|||||||||||"
								editcol="0|0|0|0|0|1|1|0|0|0"
								widths="0|1500|1000|1500|3000|1500|1500|1500|1500|0|0|0"
								styles="width:100%;height:100%"
								sorting="F"
								onafteredit=""
								oncellclick = ""
								acceptNullDate="T"
								oncelldblclick = ""/>
						</td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
</table>
<table name="Regulation" style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
<tr>
    <td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Company
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lst_company_R" onchange="onChange_Company(2)" maxlen = "100" styles='width:100%' >
												<data><%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' and a.pk=nvl('" + session("COMPANY_PK") + "',a.pk) order by A.PARTNER_ID")%></data></gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Year
								</td>
								<td colspan=20 style="border:0" width="20%"  align="left" >
									<gw:datebox id="IDYear_1" onchange="datInsRegulation.Call('SELECT');"  maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=year />
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Month
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lst_Month_1"  maxlen = "100" styles='width:100%' >
												<data>|1|01|2|02|3|03|4|04|5|05|6|06|7|07|8|08|9|09|10|10|11|11|12|12|ALL|Select All</data></gw:list>
								</td>
								
							</tr>
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									From
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >
									<gw:textbox id="txtFrom_1" text="" styles='width:100%'/>
								</td>
								<td colspan=5 width="5	%" style="border:0"  align="left" >
								
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >
									To
								</td>
								<td colspan=5 width="5%" style="border:0"  align="left" >
									<gw:textbox id="txtTo_1" text="" styles='width:100%'/>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
								
								</td>
								<td colspan=15 style="border:0" width="15%"  align="left" >
									
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
								<td colspan=5 width="5%" style="border:0" align="left"> 
									
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:100%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
								
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:label id="idRecord_R" text="" ></gw:label>
						</td>
						<td colspan=55 width="55%" style="border:0"  align="left" >
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnAdd_1" img="new" text="Add New"  onclick="OnAddAll()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnSave_1" img="save" text="Save"  onclick="OnSave(datInsRegulation)" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnDel_1" img="delete" text="Delete"  onclick="OnDelete(2)" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnOpen_1" img="lock_open" text="Open" onclick="OnOpen_Close_1('OPEN')" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="idBtnClose_1" img="lock" text="Close"  onclick="OnOpen_Close_1('CLOSE')" />
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
				<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
					<tr style="height:100%">
						<td id="Td1" width="100%">
							<gw:grid
								id="grdRegulation"
								header="_Company_PK|Company Name|Month|From|To|Close Y/N|Close DT"
								format="0|0|0|4|4|0|0"
								aligns="1|1|1|1|1|1|1"
								defaults="||||||"
								editcol="0|0|0|1|1|0|0"
								widths="0|4000|2000|2000|2000|2000|2000"
								styles="width:100%;height:100%"
								sorting="F"
								onafteredit=""
								oncellclick = "OnCheckStatus()"
								acceptNullDate="T"
								/>
						</td>
					</tr>	
				</table>
			</div>
	</td>
</tr>
</table>
</gw:tab>
    <gw:textbox id="txtWork_mon" styles="display:none"/>
    <gw:textbox id="txtflag" styles="display:none"/>
    <gw:textbox id="txtresult" styles="display:none"/>
    <gw:textbox id="txtUse_for" styles="display:none"/>
    <gw:textbox id="txtTmp" styles="display:none"/>
    <gw:textbox id="txtWork_mon_1" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none" text="ALL"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</body>
</html>
