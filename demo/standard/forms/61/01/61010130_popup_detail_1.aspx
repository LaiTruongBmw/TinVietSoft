<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
    var lst_Search = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK034') FROM DUAL")%>";
    
    lstSearch.SetDataText(lst_Search);
    var ls_company =  "<%=Request.QueryString("company_pk")%>"; 
    txt_company.text = ls_company;
    
    var l_Master_pk = "<%=Request.QueryString("Master_pk")%>"; 
    txt_Master.text = l_Master_pk;
    
    var l_type = "<%=Request.QueryString("type")%>";
    txt_type.SetDataText(l_type);
	OnSearch();
}
function OnSearch()
{
    dso_search.Call("SELECT");
}

function OnCancel()
{
	var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0;
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
}


function OnSelect()
{
   var code_data=new Array();
	var ctrl = idGrid.GetGridControl();
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an level code.");
        return ;
    }
    else
	{
        //code
        code_data[1] = idGrid.GetGridData( ctrl.row , 1 );
        //code nm
        code_data[2] = idGrid.GetGridData( ctrl.row , 2 );
		//pk
    	code_data[3] = idGrid.GetGridData( ctrl.row , 5 );
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
}	  

</script>

<body>

    <gw:data id="dso_search"  > 
        <xml> 
           <dso type="grid" function="sp_sel_kpac1013_formula" > 
                  <input bind="idGrid" > 
                    <input bind="txtCode"/> 
                    <input bind="txt_company"/>
                    <input bind="txt_type"/>
                    <input bind="txt_Master"/>
                    <input bind="lstSearch"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
<table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:3%">
    <td width="100%" colspan="7">
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
			<tr>
               
                 <td width="10%" align="right">Search by</td>
	            <td width="15%"><gw:list id="lstSearch"  styles='width:98%'></gw:list></td>
                <td width="10%" align="right">Account:</td>
	            <td width="60%"><gw:textbox id="txtCode" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
	            <td width="5%"></td>
	           
	            
                <td  ><gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
                <td >
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
                        </td>
                <td ><gw:imgBtn id="idCancel" img="cancel" alt="Exit" text="Exit" onclick="OnCancel()" /></td>
             </tr>
		 </table>  
     </fieldset>
    </td>
  </tr>
  
  <tr style="height:97%">
      <!--0.Chk|1.User ID|2.Emp ID|3.Employee Name|4.Department|5.tco_bsuser_pk|TAC_ABTRTYPE_pk-->
	  <td colspan = "9">
		<gw:grid   
							    id="idGrid"  
							    header="_Chk|Account Code|Account Name|Local Account Name|Korean Account Name|_PK"
							    format="3|0|0|0|0|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="|||||"  
							    editcol="0|0|0|0|0|0"  
							    widths="500|1300|2500|2500|2500|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3,4,5"
							    oncelldblclick="OnSelect()" />
	</td>
  </tr>
 
</table>
<gw:textbox id="txt_company"   text="" style="display: none" />
<gw:textbox  id="_TAC_LOCALCODE_PK" styles='display:none'/>
<gw:textbox  id="txt_acc" styles='display:none'/>
<gw:textbox  id="txt_type" styles='display:none'/>

<gw:textbox  id="txt_Master" styles='display:none'/>

</body>
</html>
