<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    var lst_Search = "<%=CtlLib.SetListDataFUNC("SELECT ac_a_get_commoncode('EACBK034') FROM DUAL")%>";
    
    lstSearch.SetDataText(lst_Search);
    var ls_company =  "<%=Request.querystring("company_pk")%>"; 
   
    txt_company.text = ls_company;
    
    
    var l_acc = "<%=Request.querystring("accd_arr")%>";
    txt_acc.SetDataText(l_acc);
    
    
    var TAC_LOCALCODE_PK = "<%=Request.querystring("TAC_LOCALCODE")%>";
    _TAC_LOCALCODE_PK.SetDataText(TAC_LOCALCODE_PK);
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
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
}


function OnSelect()
{
   var code_data=new Array();
   //alert(code_data[1]);
	var ctrl = idGrid.GetGridControl();
	
	if(ctrl.SelectedRows == 0)
    {
        alert("Please select an account.");
        return ;
    }
    else
	{
	    
        //code
        code_data[1] = idGrid.GetGridData( ctrl.row , 1 );
        //code nm
        
        code_data[2] = idGrid.GetGridData( ctrl.row , 2 );
		//pk
    	code_data[3] = idGrid.GetGridData( ctrl.row , 3 );
		window.returnValue = code_data; 
	   	this.close(); 	
	 }
}	  

</script>

<body>

    <gw:data id="dsoAccountT"  > 
        <xml> 
           <dso type="grid" function="ac_sel_60080020_popup_4" > 
                  <input bind="idGrid" > 
                    <input bind="txtCode"/> 
                    <input bind="txt_company"/>
                    <input bind="lstSearch"/>
                    <input bind="_TAC_LOCALCODE_PK"/>
					<input bind="dtYear"/> 
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
                
                 <td width="15%" align="right">Search by</td>
	            <td width="15%"><gw:list id="lstSearch"  styles='width:98%'></gw:list></td>
                <td width="10%" align="right">Account:</td>
	            <td width="55%"><gw:textbox id="txtCode" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
	            <td width="5%"><gw:datebox type='year' id="dtYear" onchange="OnSearch()" styles="width:100%"/></td>
	           
	            
                <td ><gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
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
							    header="_Chk|Account Code|Account Name|_PK"
							    format="3|0|0|0"
							    aligns="1|0|0|0"  
							    defaults="|||"  
							    editcol="0|0|0|0"  
							    widths="500|1300|2500|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3"
							    oncelldblclick="OnSelect()" />
	</td>
  </tr>
 
</table>
<gw:textbox id="txt_company"   text="" style="display: none" />
<gw:textbox  id="_TAC_LOCALCODE_PK" styles='display:none'/>
<gw:textbox  id="txt_acc" styles='display:none'/>

</body>
</html>
