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



<script>
function BodyInit()
{
 
	
	System.Translate(document);
	txtUser_PK.text = "<%=Request["t"]%>";
	lst_kbal00010_4.Call();
	//OnSearch();
}
function OnSearch()
{
    dsoAccountT.Call("SELECT");
}


//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        
         case "lst_kbal00010_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
			lst_600100140_5.Call();
			
          break; 
		  case "lst_600100140_5":
		        
				 cboGroupQuery.value ='';
				 break;
          
    }
}


//================================search==============================
function OnSearch()
{
     data_kbal00010.Call("SELECT");		
    
}
//========================================================================
function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	window.returnValue = code_data; 
	this.close();
}


function SelectM()
{
   // var code_data=new Array()
   
   var code_data ='';
	var ctrl = grdSTitem.GetGridControl();
	var index, rowNo
	index = 1;
	rowNo = 0;
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an account.");
        return ;
    }
    else
	{
	
	    for(i=0;i<ctrl.SelectedRows;i++)
		{
		    rowNo = ctrl.SelectedRow(i);
            
			
				 code_data += grdSTitem.GetGridData(rowNo, 0 ) +',';
				
			
        }
	}
	
	window.returnValue = code_data; 
	this.close(); 	
}

</script>
<body>

<!------------------------------------------------------------------>
    <gw:data id="lst_kbal00010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_kbal00010_4" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
	
	<!----------------------------------------------------------------->
	  
    <gw:data id="lst_600100140_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="lg_sel_600100140_5" > 
                <input> 
                    <input bind="cboCompanyList" />
                </input>
	           <output>
	                <output bind="cboGroupQuery" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    
	<!------------------------------------------------------------------>
    <gw:data id="data_kbal00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="lg_sel_600100140_1" > 
                <input>
                    <input bind="cboCompanyList" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" />                   
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>

<form id="form1" runat="server">
    <table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
    <tr> 
        <td width="100%" height="100%">
    	    <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
            <tr height="15%">
	            <td > 
                    <table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
						<tr style="height: 1%">
							<td style="width: 20%" align="right">
								Company
							</td>
							<td style="width: 80%" colspan="2">
								<gw:list id="cboCompanyList" styles="width:100%" onchange="lst_600100140_5.Call()"  />
							</td>
						</tr>
						<tr style="height: 1%">
							<td style="width: 20%" align="right">
								Group
							</td>
							<td style="width: 80%" colspan="2">
								<gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch()" />
							</td>
							<td style="width: 1%">
								<gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
							</td>
						</tr>
					        
				    </table>
		        </td>
	    	</tr>

	    	<tr height="80%"> 
	    		<td>
	    			<table CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" border="0">
                    <tr>  
                        <td colspan="4">
                            <gw:grid id="grdSTitem" 
									 header="_PK|Prod Group ID|Group Name" 
									 format="0|0|0" aligns="0|0|0" defaults="||"
									 editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
									 param="0,1,2"
									 />
                        </td>
		            </tr>
		            </table>
            	<td>
	    	</tr>

		    <tr height="5">
				<td>
					<table border="0" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td>
						    <table>
						    <tr>
							    <td><gw:icon id="btnSelect" img="in" text="OK"      styles="width:100"  onclick="SelectM()" /></td>
							    <td><gw:icon id="btnCancel" img="in" text="EXIT"    styles="width:100"  onclick="OnCancel()" /></td> 
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


<gw:textbox id="txtUser_PK" text="" style="display: none" />
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<gw:textbox id="txtSTitemQuery" text="" style="display: none" />

</body>
</html>