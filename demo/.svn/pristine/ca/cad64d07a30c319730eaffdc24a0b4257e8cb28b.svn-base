<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>

<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
    var idDsql   = "<%=Request["dsqlid"]%>";
    var idCommCd = "<%=Request["comm_code"]%>";
    var idCommNm = "<%=Request["comm_nm"]%>";
    var idCompany= "<%=Request["company"]%>";
    var idvalue1 = "<%=Request["val1"]%>";
    var idvalue2 = "<%=Request["val2"]%>";
    var idvalue3 = "<%=Request["val3"]%>";

    var col_code = "<%=Request["col_code"]%>";
    var col_nm   = "<%=Request["col_nm"]%>";
	 
	idcode1.SetDataText(col_code + "&nbsp;");
	idname1.SetDataText(col_nm + "&nbsp;");
	txtCompany.SetDataText(idCompany);
    if (idcode1.text == "")  {
    	idcode1.SetDataText("Code");
    }
    if (idname1.text == "")  {
    	idname1.SetDataText("Code Name");
    }    
    	
	idGrid.SetGridText( 0, 1 , col_code  );
	idGrid.SetGridText( 0, 2 , col_nm  );
    //idcode.text = idCommCd ;
	//idname.text = idCommNm ;
	txtItem.text = idCommNm;
	txtVal.text  = idvalue1;
	OnSearch();
}

function DSOReceive( dsoinfo  )
{
	if ( dsoinfo.errno > 0 )
	{
		alert(dsoinfo.errmsg);
		return;
	}
}

function OnSearch()
{
	idData_Dsql.Call("SELECT");
}

function Select()
{
	var aValue = new Array();
	var ctrl = idGrid.GetGridControl();
	tmp= new Array();
	for(j=0;j<idGrid.cols;j++)
	{
		tmp[tmp.length] = idGrid.GetGridData(ctrl.row,j);
	}
	aValue[aValue.length]=tmp; 

	window.returnValue = aValue;
	window.close(); 
}

function Selects()
{    
	var aValue = new Array();
	for(i=1;i<idGrid.rows;i++)
    {
		if(idGrid.GetGridData(i,0)== "-1")
		{
			var tmp= new Array();
			for(j=0;j<idGrid.cols;j++)
            {
				tmp[tmp.length] = idGrid.GetGridData(i,j);
			}
			aValue[aValue.length]=tmp;
		}
    }   
	window.returnValue = aValue; 
	window.close(); 
}
function OnCheck()
{
    for(i=1;i<idGrid.rows;i++)
    {
        if(idGrid.GetGridData(i,0)== "-1")
        {
            idGrid.SetGridText(i,0,0);
            btnCheck.text = "Chk All";
        }
        else
        {
            idGrid.SetGridText(i,0,-1);
            btnCheck.text = "Un Chk";
        }
    }
}

function OnCancel()
{
	var code_data=new Array()
	    code_data[0] = 0;
		window.returnValue = code_data; 
		this.close();
}
</script>
<body>

    <gw:data id="idData_Dsql" onreceive="" >
        <xml>
            <dso type="grid" parameter="0,1" function="<%=Request["dsqlid"]%>">
                <input bind="idGrid" >
                    <input bind="idcode"/>
                    <input bind="idname"/>
                    <input bind="txtItem"/>
					<input bind="txtCompany"/>
					<input bind="txtVal" />
                </input>
                <output bind="idGrid" />
            </dso>
        </xml>
    </gw:data>
    
<table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
  <tr> 
    <td width="100%" height="100%">
    	<table width="100%" height="100%" cellpadding=0 cellspacing=0 border=1>
            <tr height="15%">
	            <td>
			        <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
						<tr>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idcode1" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content" width="70%"><gw:textbox id="idcode" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>
		                </tr>
		                <tr>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idname1" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content" width="70%"><gw:textbox id="idname" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>
							<td width="5%" align="left"><gw:icon id="btnCheck" img="in" text="Chk All" onclick="OnCheck()"/></td>
						</tr>  
				    </table>
		        </td>
	    	</tr>
	    	
	    	<tr height="80%"> 
	    		<td>
	    			<table class="table" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
	    				<tr>
					    	<td class="itable_content" height="80%">   
							<gw:grid   
							    id="idGrid"  
							    header="CHK||_|_VALUE1|PL NAME|PL LOCAL NAME|_VALUE4|_VALUE5"
							    format="3|0|0|0|0|0|0|0"  
							    aligns="0|0|0|0|0|0|0|0"  
							    defaults="|||||||"  
							    editcol="1|0|0|0|0|0|0|0"
							    widths="500|1500|0|2500|2500|0|0|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3,4,5,6,7" 
							    oncelldblclick="Select()"/> 					    		    
				            </td>
		            	</tr>
		            </table>
            	<td>
	    	</tr>
	    	
		    <tr height="5">
				<td>
			    <table class="table" border=1 CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td>
					    	<table>
					    	    <tr>
									<td> 
									<gw:icon id="idBtnSelect" img="in" text="OK" styles="width:100"  onclick="Selects()" />  
									</td> 
									<td> 
									<gw:icon id="idBtnSelect" img="in" text="EXIT" styles="width:100"  onclick="OnCancel()" />  
									</td> 
								</tr>
							</table>	
						<td>	
					</tr>
				</table>
				</td>
			</tr>
	
		</table>  
		
    </td>
	</tr>
</table>
<gw:textbox id="txtCompany" styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtItem"    styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtVal"     styles="width:100%;height:25" style="display:none"/>
</body>

</html>
