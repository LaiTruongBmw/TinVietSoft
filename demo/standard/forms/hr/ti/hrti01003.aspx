<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    System.Translate_V2(document, System.Menu.GetMenuPS());
    grdDetail.GetGridControl().FrozenCols =7;
    grdDetail.GetGridControl().ScrollTrack=true;
    Ctrl=grdDetail.GetGridControl();	
    Ctrl.ColEditMask(10)="999%";
    Ctrl.ColEditMask(12)="999%";
    <%=CtlLib.SetGridColumnComboFormat( "grdDetail" , 5 , "select code,code_nm from vhr_hr_code where id='HR0003' order by code_nm ") %>; 
    OnSearch();

}

//-------------------------------------------------
function OnDataReceive(obj)
{
   
       if (obj.id=="datAbsShowDetail")
       {
           lblRecord.text = grdDetail.rows - 1;
            
       }
       
}   
//------------------------------------------------------------  
function OnSearch()
{
    datAbsShowDetail.Call("SELECT");
}

//----------------------------------
function OnSave()
{
    if (confirm("Do you want to save?"))
    {
            datAbsShowDetail.Call();
    }
}

//---------------------------
function CheckData()
{   
    var ivalue;
    var irow=grdDetail.row;
    var icol=grdDetail.col;
    if (((icol==10)|| (icol==12)) && (irow !=0))
    {
        ivalue=grdDetail.GetGridData(irow,icol);
        if (ivalue > 100)
        {
            alert("Have to input value from 1 to 100!");
            grdDetail.SetGridText(irow,icol,0 + "%");
        }
        else
            grdDetail.SetGridText(irow,icol,ivalue + "%");
    }
}
//---------------------------
function CheckDataYN()
{   
    var ivalue;
    var irow=grdDetail.row;
    var icol=grdDetail.col;
    
    if (((icol==9)|| (icol==11)) && (irow !=0))
    {
        if (grdDetail.GetGridData(irow,icol)==-1)
            grdDetail.SetGridText(irow,icol+1,"100" + "%");
        else
            grdDetail.SetGridText(irow,icol+1,"0" + "%");    
            
    }
}
//---------------------------
function OnExit()
{
    window.returnValue =null; 			
	this.close();
}
//---------------------------------------------------
function EXITOnClick()
{
	OnExit();
}
</script>

<body>

<!--------------------------------------------------------------->
<gw:data id="datAbsShowDetail" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI01003_0" procedure="ST_HR_UPD_HRTI01000_0" parameter="2,5,6,7,8,9,10,11,12,14,15,16,18,19"> 
                <input bind="grdDetail">
                    <input bind="txtAbs_Reg_PK" />
                </input> 
                <output bind="grdDetail"/>
            </dso> 
        </xml> 
</gw:data>

<!----------------------main table------------------------------->

<table name="Short Term" id="Absence" class="itable" width="100%" cellpadding="0"  cellspacing="0" border=1 style="height:100%;">
        <tr  style="width:100%;height:100%" valign="top">
            <td  style="width:100%;height:100%">
                <table width="100%" id="tblexp" style="height:5%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%" valign="middle"  >
                        <td  width="85%" style="border:0" align="center"> <gw:label id="lblRecord"  text="0 record(s)" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /> </td>
			            <td width="5%"  align="right" >
                         <gw:imgBtn img="search" id="ibtnSearch_S"   alt="Search"  onclick="OnSearch()"/>
                        </td>
                        <td width="5%" style="border:0" align="right">
                         <gw:imgBtn img="save" id="ibtnSave_S"    alt="Save"  onclick="OnSave()"/>
                        </td>
                         <td width="5%"  align="right" >
                         <gw:imgBtn img="cancel" id="ibtnExit"   alt="Exit"  onclick="OnExit()"/>
                        </td>
                    </tr>
			    </table>
                 <table cellspacing=0 cellpadding=0 style="height:95%" width=100% border=1>
                    <tr style="border:1;width:100%;height:100%" valign="top">
                        <td  style="width:100%;height:100%;"> 
                            <gw:grid   
						        id="grdDetail"  
						       header="Organization|Work Group|Emp ID|Full Name|Work Shift|Absence Type|Absent Date|Description|Absence Time|Company Pay Flag|Company Pay Rate|Insurance Pay Flag|Insurance Pay Rate|Remain Annual Leave|_PK|_EMP_PK|_WG PK|_absence_reg_pk|_thr_ws_pk|Company Allow"   
					            format="0|0|0|0|0|2|0|0|0|3|0|3|0|0|0|0|0|0|0|3"  
					            aligns="0|0|1|0|0|0|0|0|1|1|1|0|1|0|0|0|0|0|0|0"  
					            defaults="||||||||||||||||||||"  
					            editcol="0|0|0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|0|0|1"  
					            widths="1300|1500|900|2300|1500|1400|1200|2000|1400|1800|1800|1800|1800|1500|1300|0|1000|0|0|0|800"  
					            styles="width:100%; height:100%"   
					            sorting="T"  onafteredit="CheckData()"   oncellclick="CheckDataYN()" 
					             /> 

                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
<gw:textbox id="txtAbs_Reg_PK" text="<%=Request.QueryString("abs_reg_pk")%>" styles="display:none"/>	
</body>
</html>

