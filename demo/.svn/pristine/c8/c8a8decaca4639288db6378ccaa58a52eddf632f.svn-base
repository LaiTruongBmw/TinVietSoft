<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Student</title>
    <%  ESysLib.SetUser("mafg")%>

<script>
var _emp_id = "<%=session("EMP_ID") %>";
function BodyInit()
{
    System.Translate(document);
    OnSearch();
    Binding();
}
function Binding()
{
    var data,data1,data2,ctrl;
     data   = "<%=ESysLib.SetGridColumnDataSQL("select   s_code, s_code || '   ' || s_dscr from sale.s_gen where l_code = '12' and s_code not in ('000') order by 1")%>";
     lstPrintType.SetDataText(data);
     //lstPrintType.value='002';
     data1   = "<%=ESysLib.SetGridColumnDataSQL("select  S_CODE, s_code || '   ' || s_dscr from mafg.p_gen where L_CODE ='65' and s_code not in ('0000') order by 1")%>";
     lstMachineType.SetDataText(data1);
     data2   = "<%=ESysLib.SetGridColumnDataSQL("select  S_CODE, s_code || '   ' || s_dscr from mafg.p_gen where L_CODE ='10' and s_code not in ('0000') order by 1")%>";
     lstMachNo.SetDataText(data2);
     
     grdPrinting.SetComboFormat(3,data2);
     grdPrinting.SetComboFormat(16,data);
     grdPrinting.SetComboFormat(17,data1);
     
     ctrl = grdPrinting.GetGridControl();
     ctrl.ColEditMask(4) = "00:00";   
     ctrl.ColEditMask(5) = "00:00";
     ctrl.ColEditMask(6) = "00:00";
}
function OnSearch(){
    dsoPrinting.Call("SELECT");
    //alert(grdPrinting.GetGridData(1,14));
}
function sum()
 {
    var dValueSum=0;
     
    for(i=1; i<grdPrinting.rows; i++ ){
       if (grdPrinting.GetGridData(i,14)!="")
       {        
            dValueSum += Number(grdPrinting.GetGridData(i,14));
       }
    }
    txtSumPrintQty.text = dValueSum;
}
function OnNew()
{
    var path = System.RootURL + '/form/fp/ep/fpep00070_1.aspx';
         var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
         if ( object != null )
         {
            for( var i=0; i < object.length; i++)	  
               {	
               
                  arrTemp = object[i];
                  grdPrinting.AddRow();   
                  
                  grdPrinting.SetGridText(grdPrinting.rows-1,7,arrTemp[2]);//lot no
                  grdPrinting.SetGridText(grdPrinting.rows-1,2,dtFrom.GetData());//operation date
                  grdPrinting.SetGridText(grdPrinting.rows-1,8,arrTemp[4]);//vendo
                  grdPrinting.SetGridText(grdPrinting.rows-1,9,arrTemp[5]);//vendo name
                  grdPrinting.SetGridText(grdPrinting.rows-1,10,arrTemp[6]);//matno
                  grdPrinting.SetGridText(grdPrinting.rows-1,11,arrTemp[7]);//mato name
                  grdPrinting.SetGridText(grdPrinting.rows-1,13,arrTemp[8]);//iqty
                  grdPrinting.SetGridText(grdPrinting.rows-1,14,arrTemp[9]);//remainqty
                  //grdPrinting.SetGridText(grdPrinting.rows-1,16,_emp_id);
                  
                }
         
          }
             
}
function CheckStartTimeLessThanEndTime()
{   
	var hh1,mm1,hh2,mm2;   
	var nWorkTime;   
	var s = grdPrinting.GetGridData(grdPrinting.row,4);   
	if(s == ""){
        return;
    }
	a = s.split(":");   
	hh1 = Number(a[0]);  
 	mm1 = Number(a[1]);  
 	if(hh1 > 24){
        alert("Hour must be smaller or equal to 24.");
        return;
    }	
    if( mm1 > 59){
        alert("Minute must be smaller or equal to 59.");
        return;
    }      
	s = grdPrinting.GetGridData(grdPrinting.row,5); 
	if(s == ""){
        return;
    }  
	a = s.split(":");   
	hh2 = Number(a[0]);  
 	mm2 = Number(a[1]);  
   
   if(hh2 > 24){
        alert("Hour must be smaller or equal to 24.");
        return;
   }	
   if(mm2 > 59){
        alert("Minute must be smaller or equal to 59.");
        return;
   }    
   if((hh2 == hh1)&&(mm2 < mm1)){      
		alert("Start time must be smaller than end time.");     
 		return false;   
	}
	else if((hh2 < hh1)){      
		alert("Start time must be smaller than end time.");        
 		return false;   
	}
	//calulate duration
	var hh = hh2 - hh1;
	var mm;
	if(mm2 < mm1){
	    hh -= 1;
	    mm = 60 - (mm1 - mm2);
	}
	else{
	    mm = mm2 - mm1;
	}
	
	if(hh < 10) hh="0"+hh;
	if(mm < 10) mm="0"+mm;
	
	grdPrinting.SetGridText(grdPrinting.row,6,hh+":"+mm );
	
	return true;
}   

function OnAfterEdit1()
{
   if(event.col == 4 || event.col == 5)
   {
        CheckStartTimeLessThanEndTime();
   }
    
}      
function OnDelete()
{
    grdPrinting.DeleteRow();
}
function UnDelete()
{
    grdPrinting.UnDeleteRow();
}
function OnSave()
{
    if(CheckDataIsValid() == true)
    {
       dsoPrinting.Call();
    }
}
function CheckDataIsValid() 
{
  for(var i=1;i<grdPrinting.rows;i++)
  {
     if(grdPrinting.GetGridData(i,3) == ""){
        alert("Please select Machine number at row "+ i);
        return false;
     }
     if(grdPrinting.GetGridData(i,4) == ""){
        alert("Please input start time at row "+ i);
        return false;
     }
     if(grdPrinting.GetGridData(i,5) == ""){
        alert("Please input end time at row "+ i);
        return false;
     }
     if(grdPrinting.GetGridData(i,12) == ""){
        alert("Please input drum quantity at row "+ i);
        return false;
     }
     if(grdPrinting.GetGridData(i,14) == ""){
        alert("Please input printing qty at row "+ i);
        return false;
     }
     if(Number(grdPrinting.GetGridData(i,14)) > Number(grdPrinting.GetGridData(i,13)))
     {
        alert("Printing Qty must be smaller or equal to Instructed Qty. Please check at row "+i);
        return false;
     }
  }
  return true;
}
function TotalTimes()
{
    var dValueSum=0,i;
    var Totaltime; 
    Totaltime=  Number(grdPrinting.GetGridData(i,7));
    for(i=1; i<grdPrinting.rows; i++ )
    {
        Totaltime =Totaltime+(Number(grdPrinting.GetGridData(i,4)) + Number(grdPrinting.GetGridData(i,5)));
    }
    
}
function OnDataReceive(obj)
{
    if(obj.id == "dsoPrinting"){
        if(grdPrinting.rows > 1)
        {
            TotalTimes();
            sum();
        }
        sum();
     }
  }
function OnGridCellDoubleClick()
{
    if(event.col == 18 || event.col == 19 || event.col == 20 || event.col == 21)
    {
        var path = System.RootURL + '/form/fp/ep/fpep00070_2.aspx';
         var oValue = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
          if ( oValue != null )
            {
                grdPrinting.SetGridText(grdPrinting.row,18,oValue[1]);//Emp_id
                grdPrinting.SetGridText(grdPrinting.row,19,oValue[2]);//Full Name
                grdPrinting.SetGridText(grdPrinting.row,20,oValue[4]);//Dept ID
                grdPrinting.SetGridText(grdPrinting.row,21,oValue[5]);//Dept Name
            }
    }
    
}
</script>
</head>
<body>
    <gw:data id="dsoPrinting" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="mafg.sp_sel_fpep00070" procedure="mafg.sp_upd_fpep00070">  
                <input bind="grdPrinting"   > 
                    <input bind="dtFrom" /> 
                    <input bind="txtLotNo" /> 
                    <input bind="txtVendoNo" /> 	 															
                </input> 
                <output bind="grdPrinting" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td colspan="16">
            <fieldset>
                <table width="100%" style="height: 100%">
                    <tr style="height: 100%">
                        <td width="16%">
                            Operation Date</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" onchange="OnSearch()"/>
                        </td>
                        <td width="9%" align="right">
                            Lot No</td>
                        <td width="19%">
                            <gw:textbox id="txtLotNo" />
                        </td>
                        <td width="13%" align="right">
                            Vendo No</td>
                        <td width="15%">
                            <gw:textbox id="txtVendoNo" />
                        </td>
                        <td width="1%">
                        </td>
                        <td with="2%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td with="2%">
                            <gw:imgbtn id="btnNew" img="New" alt="New" onclick="OnNew()" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnDelete" img="Delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td with="2%">
                            <gw:imgbtn id="btnUnDelete" img="UDelete" alt="UnDelete" onclick="UnDelete()" />
                        </td>
                        <td with="2%">
                            <gw:imgbtn id="btnSave" img="Save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 2%">
        <td>
            <td width="50%" align=right>Sum of Printing Qty:</td>
            <td width="25%" align=left><gw:textbox id="txtSumPrintQty" type="number" format="###,###,###,###,###,###" readonly="true"/></td>
        </td>
        </tr>
        <tr style="height: 96%">
            <td colspan="16">
                <gw:grid id="grdPrinting" 
                    header="_pk|_vg_gu|Operation Date|Machine No|Start Time|End Time|Total Time|Lot No
                    |Vendor No|Vendor Name|Mat No|Material Name|Drum Qty|Instruted Qty|Printing QTY|_Loss Qty|Printing Type|Machine Type|Operator ID|Operator Name|Dept ID|Dept Name"
                    format="0|0|4|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|1|1|1|0|0|0|0|0|3|3|3|3|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||" 
                    editcolcolor="true"
                    autosize="true"
                    editcol="1|1|1|1|1|1|1|0|0|0|0|0|1|0|1|1|1|1|0|0|0|0" 
                    widths="1000|1500|1500|1200|1300|1300|1300|2000|1200|1500|1200|1500|1700|1500|1500|1500|1500|1500|1000|1000|1000|1000"
                    sorting='T' styles="width:100%; height:100%" oncelldblclick="OnGridCellDoubleClick()" onafteredit="OnAfterEdit1()"/>
            </td>
        </tr>
    </table>
    <gw:list id="lstPrintType" styles='display:none;'></gw:list>
    <gw:list id="lstMachineType" styles='display:none;'></gw:list>
    <gw:list id="lstMachNo" styles='display:none;'></gw:list>
</body>
</html>
