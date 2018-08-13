<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
//Select|Organization|Work Group|ID Num|Emp ID|Full Name|Sex|Join Date|_thr_emp_pk"
var g_emp_id=4;

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);	
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";   
     grdEmployee.GetGridControl().ScrollTrack=true;          
}

//------------------------------------------------------------------------------------
function OnSearch()
{    
    var temp=Trim(txtEmpID.text);
    var arr= new Array();
    var str;        
    if(temp!="")
    {  
            
        arr=temp.split(',');                             
        str=Trim(arr[0]);            
        for(var k=1;k<a class="eco_link"rr.length;k++)
        {
            str=str + ':' + Trim(arr[k]);
        }
        txtlstEmpID.text=str.toUpperCase();          
    }      
    datEmployee.Call("SELECT");
}

//--------------------------------------------------------------------------

function OnDataReceive(obj_data)
{
           
       if (obj_data.id=="datEmployee")
       {
           lblRecord.text = grdEmployee.rows - 1;
	   }	   
} 

function OnCheckAll()
{	
    var tmp;
    if( chkSelectAll.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
	for(var i=1;i<grdEmployee.rows;i++)
		grdEmployee.SetGridText( i , 0,tmp );
} 

function OnSelect()
{
    
    var str ="";
    var j;
    j=0;
    var bSelect=false;
    var first=0;
    for (var i=1;i<grdEmployee.rows;i++)
    {
        if (grdEmployee.GetGridData(i,0)=='-1')
        {   
            var aRow="";
            bSelect=true;            
            aRow=grdEmployee.GetGridData(i,g_emp_id) //get emp pk   
            if(first==0 && aRow!="")  
            {
                str=aRow;
                first=1;
            } 
            else
            {   
                if(first==1 && aRow!="")
                {   
                    str=str + ','+ aRow;
                }
            }            
        }
        
    }
    if (bSelect==false)
    {
        alert("Not employee have choiced.");
        return;
    }
    window.returnValue = str; 			
	this.close();
}

function OnExit()
{
    window.returnValue = null; 		
	this.close();
}

</script>

<body>

<!--------------------------------------------------------------->
<gw:data id="datEmployee" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI01301_0" > 
                <input bind="grdEmployee">
                    <input bind="txtlstEmpID" />  
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="txtTemp" />                                      
                </input> 
                <output bind="grdEmployee"/>
            </dso> 
        </xml> 
</gw:data>
<!----------------------main table------------------------------->
<table name="Employee"  style='margin-left:10px' id="Employee" class="itable" width="100%" cellpadding="0"  cellspacing="0" border=1 style="height:100%;">
        <tr  style="width:100%;height:100%" valign="top">
            <td  style="width:100%;height:100%">
                <table width="100%" id="tblexp" style="height:10%" border=0 cellpadding="0" cellspacing="0">
               
                    <tr style="border:0;width:100%" valign="middle"  >
                        <td align="center" width="4%" ></td>
                        <td align="center" width="6%" ></td>						                                                 
                        <td width="12%"  align="right" >Input Employee ID:   </td>
                        <td width="40%" colspan=3 align="left" > <gw:textbox id="txtEmpID" styles='width:95%' /> </td>                                               
                        </td>                                               				       
			           
			            <td width="3%"  align="right" >
                         <gw:imgBtn img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch()"/>
                        </td>
                        <td width="3%" style="border:0" align="right">
                         <gw:imgBtn img="select" id="ibtnSelect"    alt="Select"  onclick="OnSelect()"/>
                        </td>                        
                        <td width="3%"  align="right" >
                         <gw:imgBtn img="cancel" id="ibtnExit"   alt="Exit"  onclick="OnExit()"/>
                        </td>
                       <td width="8%" align=right ><gw:label id="lblRecord"  text="0 record(s)" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12" /></td>
                    </tr>		

                    <tr style="border:0;width:100%" valign="middle"  >
                        <td align="center" width="4%" ><gw:checkbox id="chkSelectAll" value="F" onclick="OnCheckAll()" ></gw:checkbox ></td>
						<td align=left width="6%"  ><font color="black">Select All</td>                        
                        <td width="8%"  align="right" >Organization   </td>
                        <td width="12%"  align="left" > <gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
                            <data>
                                <%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') and nvl(a.p_pk,0)=0 order by a.pk ")%>|ALL|Select All
                            </data>
                        </gw:list> </td>
                       
                        
                         <td width="10%"  align="right" >Group</td>
                        <td width="12%" align="left" >
                         <gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0" )%>|ALL|Select All
                            </data>
                            </gw:list>
                        </td>
                       
                        
                       <td width="8%" style="border:0" align="right" valign="middle">Employee</td>
				       <td  width="22%" colspan=3 style="border:0"> 
				            <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
			            </td>
                        
                    </tr>				   
			    </table>
                 <table cellspacing=0 cellpadding=0 style="height:90%" width=100% border=1>
                    <tr style="border:1;width:100%;height:100%" valign="top">
                        <td  style="width:100%;height:100%;"> 
                            <gw:grid   
						        id="grdEmployee"  
						        header="Select|Organization|Group|ID Num|Emp ID|Full Name|Sex|Join Date|_thr_emp_pk"   
					            format="3|0|0|0|0|0|0|4|0"  
					            aligns="0|0|0|1|1|0|1|1|0"  
					            defaults="||||||||"  
					            editcol="0|0|0|0|0|0|0|0|0"  
					            widths="1000|1500|1500|1000|1000|2000|1000|1400|0"  
					            styles="width:100%; height:100%"   
					            sorting="T"   
					             /> 

                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>	
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtEmpIDUpper"  styles="display:none"/>
<gw:textbox id="txtlstEmpID" styles="display:none"/>
</body>
</html>

