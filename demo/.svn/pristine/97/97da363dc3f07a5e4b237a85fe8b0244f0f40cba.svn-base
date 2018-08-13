<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);	
   txtUser_PK.text= "<%=session("USER_PK")%>";
   txtClientDB.text = "<%=Session("APP_DBUSER")%>";
   datHR_LEVEL.Call("SELECT");
}

function OnDataReceive(obj)
{
    if(obj.id=="datHR_LEVEL2")
    {
        for(var i=1;i<idGrid2.rows;i++)
        {
            idGrid2.SetGridData(i,8,txtUser_PK);
            idGrid2.SetRowStatus(i,0);
        }
    }
    if(obj.id=="datHR_LEVEL")
        datSalary_security.Call("SELECT");
}
function onClick_M()
{
    txtUser_PK.text=idGrid1.GetGridData(event.row,4);
    datHR_LEVEL2.Call("SELECT");
}
function OnSave(n)
{
    if(confirm("Do you want to save?\nBạn muốn save?"))
        if(n==1)
            datHR_LEVEL2.Call();
        else    
            datSalary_security.Call();
}
</script>

<body>
<!------------main control---------------------->
<gw:data id="datHR_LEVEL" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" parameter="0" function="ST_HR_SEL_GSHR00200_0"> 
                <input bind="idGrid1">
                    <input bind="txtUser_PK" /> 
					<input bind="txtClientDB" /> 
                </input> 
                <output bind="idGrid1" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datHR_LEVEL2" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" parameter="0,7,8" function="ST_HR_SEL_GSHR00200_1" procedure="ST_HR_UPD_GSHR00200_1"> 
                <input bind="idGrid2">
                    <input bind="txtUser_PK" /> 
                </input> 
                <output bind="idGrid2" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datSalary_security" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" parameter="4,5,6" function="ST_HR_SEL_GSHR00200_2" procedure="ST_HR_UPD_GSHR00200_2"> 
                <input bind="idGrid3">
                    <input bind="txtUser_PK" /> 
					<input bind="txtClientDB" /> 
                </input> 
                <output bind="idGrid3" />
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table--------------------------------->
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
	    <td width=50%>
	    <table id="tblMain" style="width:100%;height:100%" border=1 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:30%">
	                <td id="tdMaster" style="width:100%">
	                    <gw:grid   
				        id="idGrid1"  
				        header="User ID|Full Name|Emp ID|Department|_PK"   
				        format="0|0|0|0|0"  
				        aligns="0|0|0|0|0"  
				        defaults="||||"  
				        editcol="0|0|0|0|0"  
				        widths="1000|3000|1000|2000|0"  
				        styles="width:100%; height:100% "   
				        sorting="T"   
				        oncellclick     = "onClick_M()"/>
	                </td>
	            </tr>
	            <tr style="width:100%;height:5%">
					<td  width="100%" align="center" ><gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave(1)" /></td>
				</tr>	
				<tr style="width:100%;height:65%">
	                <td id="td2" style="width:100%">
	                 <gw:grid   
                        id="idGrid2"  
                        header="Select|Department ID|Department Name|Type|Start Date|End Date|Remark|_dept_pk|_emp_pk"   
                        format="3|0|0|0|0|0|0|0|0"  
                        aligns="0|0|0|0|0|0|0|0|0"  
                        defaults="||||||||"  
                        editcol="0|0|0|0|0|0|0|0|0"  
                        widths="1000|1500|3000|1500|1200|1200|1200|1000|0"  
                        styles="width:100%; height:100%"   
                        sorting="T"   
                        param="0,1,2,3,4,5,6,7,8" />
	                </td>
	              </tr>  
	       </table>
	    </td>
	    <td width=50%>
	    <table id="Table1" style="width:100%;height:100%" border=1 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:5%">
					<td  width="100%" align="center" ><gw:button id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnSave(2)" /></td>
				</tr>
	            <tr style="width:100%;height:95%">
	                <td id="td1" style="width:100%">
	                    <gw:grid   
				        id="idGrid3"  
				        header="User ID|Full Name|Emp ID|Department|Salary Control|_PK"   
				        format="0|0|0|0|3|0"  
				        aligns="0|0|0|0|0|0"  
				        defaults="|||||0"  
				        editcol="0|0|0|0|1|0"  
				        widths="1000|2000|1000|3000|1500|0"  
				        styles="width:100%; height:100% "   
				        sorting="T"   
				        oncellclick     = ""/>
	                </td>
	            </tr>
	       </table>
	      </td>
	</tr>
</table>
<gw:textbox id="txtUser_PK" styles="display:none"/>
<gw:textbox id="txtClientDB" text="" style="display: none" />
</body>
</html>

