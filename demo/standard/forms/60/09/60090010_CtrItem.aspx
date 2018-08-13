<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";

function BodyInit()
{
    System.Translate(document);
    var idCommNm  = "<%=Request.querystring("comm_nm")%>";
    var idCommCd  = "<%=Request.querystring("comm_code")%>";
    var idDsqlid  = "<%=Request.querystring("dsqlid")%>";
    var idCommNm2 = "<%=Request.querystring("comm_nm2")%>";
    var idval1    = "<%=Request.querystring("val1")%>";
    var idval2    = "<%=Request.querystring("val2")%>";
    var idval3    = "<%=Request.querystring("val3")%>";
  	txtCode.text  = idCommCd ;
	txtName.text  = idCommNm ;
	txtName2.text = idCommNm2;
	txt_val1.text = idval1;
	txt_val2.text = idval2;
	txt_val3.text = idval3;
	txt_val4.text = v_language;
	
	var col_code = "<%=Request.querystring("col_code")%>";
    var col_nm   = "<%=Request.querystring("col_nm")%>";
    
	idcode1.SetDataText(col_code);
	idname1.SetDataText(col_nm);
	
	if (idcode1.text == "") 
	{
    	idcode1.SetDataText("Account Code&nbsp;&nbsp;");
    }
    if (idname1.text == "")  
    {
    	idname1.SetDataText("Account Name&nbsp;&nbsp;");
    }
	OnSearch();
}
function OnSearch()
{
    dsoAccountT.Call("SELECT");
}

function OnCancel()
{
	var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0;
	tmp[1]       = 0;
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
	
}

function Selects()
{
	var aValue = new Array();
	for(i=1;i<idGrid.rows;i++)
    {
		if(idGrid.GetGridData(i,1)== "-1")
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

function OnCheck()
{
    for(i=1;i<idGrid.rows;i++)
    {
        if(idGrid.GetGridData(i,1)== "-1")
        {
            idGrid.SetGridText(i,1,0);
            btnCheck.text = "Chk All";
        }
        else
        {
            idGrid.SetGridText(i,1,-1);
            btnCheck.text = "Un Chk";
        }
    }
}

</script>

<body>

    <gw:data id="dsoAccountT"  onreceive="" > 
        <xml> 
           <dso type="grid" function="<%=Request.querystring("dsqlid")%>"> 
                  <input bind="idGrid" > 
                    <input bind="txtCode"/> 
                    <input bind="txtName"/> 
                    <input bind="txtName2"/>
                    <input bind="txt_val1"/>
                    <input bind="txt_val2"/>
                    <input bind="txt_val3"/>
                    <input bind="txt_val4"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>

<form id="form1" runat="server">
    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr> 
        <td width="100%" height="100%">
    	    <table width="100%" height="100%" cellpadding=0 cellspacing=0 border=1>
                <tr height="15%">
	                <td > 
			            <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
						<tr>
							<td width="25%" align="right"><gw:label id="idcode1" styles="width:100%;height:" text =""/></td>
							<td width="70%"><gw:textbox id="txtCode" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
							<td width="5%"></td>
							
		                </tr>
		                <tr>
							<td width="25%" align="right"><gw:label id="idname1" styles="width:100%;height:" text =""/></td>
							<td width="70%"><gw:textbox id="txtName" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
							<td width="5%" align="left"><gw:icon id="btnCheck" img="in" text="Chk All" onclick="OnCheck()"/></td>
						</tr>  
				        </table>
		            </td>
	    	    </tr>
	    	    <tr height="80%"> 
	    		    <td>
	    			    <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
	    				<tr>
					    	<td height="80%">   
							<gw:grid   
							    id="idGrid"  
							    header  ="_Pk|CHK|Item Code|Item Name|_tmp1|_tmp2|_tmp3"
                                format  ="0|3|0|0|0|0|0"
                                aligns  ="0|0|0|0|0|0|0"
                                defaults="||||||"
                                editcol ="0|0|0|0|0|0|0"
                                widths  ="0|500|2000|2000|0|0|0"
                                styles  ="width:100%; height:100%"
                                sorting ="F"   
                                oncelldblclick="Select()" />
				            </td>
		            	</tr>
		                </table>
            	    <td>
	    	    </tr>

		        <tr height="5">
				    <td>
					    <table border=0 CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
						    <tr align="center"> 
							<td>
								<table>
									<tr>
										<td><gw:icon id="btnSelect" img="in" text="OK" styles="width:100"  onclick="Selects()" /></td>
										<td><gw:icon id="btnCancel" img="in" text="EXIT" styles="width:100"  onclick="OnCancel()" /></td> 
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
</form>

<gw:textbox id="txt_val1"   text="" styles="display:none" />
<gw:textbox id="txt_val2"   text="" styles="display:none" />
<gw:textbox id="txt_val3"   text="" styles="display:none" />
<gw:textbox id="txt_val4"   text="" styles="display:none" />
<gw:textbox id="txtName2"   text="" styles="display:none" />

</body>
</html>
