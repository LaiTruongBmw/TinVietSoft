<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
var user_id = "<%=Session("LOGIN_ID")%>"; 
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
	txt_userid.SetDataText(user_id);
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
		if(idGrid.GetGridData(i,2)== "-1")
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
        if(idGrid.GetGridData(i,2)== "-1")
        {
            idGrid.SetGridText(i,2,0);
            btnCheck.text = "Chk All";
        }
        else
        {
            idGrid.SetGridText(i,2,-1);
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
                    <input bind="txt_userid"/>
                    <input bind="dtYear"/> 
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>

<form id="form1" runat="server">
    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr> 
        <td width="100%" height="100%">
            
    	        <table width="100%" height="100%" cellpadding=0 cellspacing=0 border=0>
                    <tr height="15%">
	                    <td > 
	                     <fieldset style="width: 100%; height: 100%; padding: 2">
			                <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
						    <tr>
						        <!--td width="1%"><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll()" /> </td>
                                <td width="10%" align=left> Select All</td>
                                <td width="10%" align=left>Search by</td-->
							    <td width="25%" align="right"><b><gw:label id="idcode1" styles="width:100%;height:" text =""/></b></td>
							    <td width="70%"><gw:textbox id="txtCode" styles="width:65%;" onenterkey="OnSearch()"/><gw:datebox type='year' id="dtYear" onchange="OnSearch()" styles="width:35%"/></td>
							    <td width="5%"></td>
    							
		                    </tr>
		                    <tr>
							    <td width="25%" align="right"><b><gw:label id="idname1" styles="width:100%;height:" text =""/></b></td>
							    <td width="70%"><gw:textbox id="txtName" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
							    <td width="5%" align="left"><gw:icon id="btnCheck" img="in" text="Tick All" onclick="OnCheck()"/></td>
						    </tr>  
				            </table>
			       </fieldset>
		            </td>
	    	    </tr>
	    	    <tr height="80%"> 
	    		    <td>
	    			    <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
	    				<tr>
	    				    <!--0_Pk|1_Acc_pk|2.CHK|3._REF|4.Account Code|5.Account Name|6._ccy|7._rate|8._Amt_trans|9._Amt_book
	    				    |10._Decription|11._LDecription|12._Expense Type|13._m_pk|14._ODR|15._DRCR-->
					    	<td height="80%">   
							<gw:grid   
							    id="idGrid"  
							    header  ="_Pk|_Acc_pk|CHK|_REF|Account Code|Account Name|_ccy|_rate|_Amt_trans|_Amt_book|_Decription|_LDecription|_Expense Type|_m_pk|_ODR|_DRCR|Local account| Local name"
                                format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0"
                                aligns  ="0|0|1|1|0|0|1|1|3|3|0|0|0|0|0|0|0|0"
                                defaults="||||||VND|||||||||||"
                                editcol ="0|0|1|1|0|0|0|1|1|1|1|1|1|0|0|0|0|0"
                                widths  ="0|0|500|0|1500|3500|1000|1000|2000|2000|3000|3000|1000|1000|1000|800|1500|2000"
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
<gw:textbox id="txt_userid"   text="" styles="display:none" />

</body>
</html>
