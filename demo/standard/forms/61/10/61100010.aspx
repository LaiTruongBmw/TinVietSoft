<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Project profit and loss status</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
      System.Translate(document);
      BindingDataList();

}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
       
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_period.Call();
                            } 
                break;
               
        } 
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
        		dso_search.Call('SELECT');
		}
		else
		{
				alert('Please select Project !!');	
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPrint()
{
	if(Grid_Detail.rows > 1)                                                 
	 {
		 var url = '/reports/61/10/rpt_61100010.aspx?p_tecps_projectsumm_pk='+ txtProject_Pk.text+'&p_dtfrm='+dtPeriod_Fr.value +'&p_dtto='+dtPeriod_To.value;
		     url = url + '&from_text=' +  dtPeriod_Fr.text + '&to_text=' + dtPeriod_To.text ; 
			 System.OpenTargetPage( System.RootURL+url , "newform" );  
	}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
</script>

<body>
    <gw:data id="dso_search" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"  function="pm_sel_61100010"  > 
            <input bind="Grid_Detail">                    
                <input bind="txtProject_Pk" /> 
				<input bind="dtPeriod_Fr" /> 
				<input bind="dtPeriod_To" /> 
            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_period" onreceive="">
  <xml>
    <dso type="process"  procedure="pm_sel_61100010_period"  >
      <input>
		  <input bind="txtProject_Pk"/>
     </input>
	 <output>
     	  <input bind="dtPeriod_Fr" /> 
		  <input bind="dtPeriod_To" /> 
	  </output>
    </dso>
  </xml>
</gw:data>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="10%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                    Project&nbsp;</a></td>
                            <td width="60%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="25%">
                                Working Period&nbsp;</td>
                            <td>
                                <gw:datebox id="dtPeriod_Fr" nullaccept lang="1" />
                            </td>
                            <td>
                                ~</td>
                            <td width="">
                                <gw:datebox id="dtPeriod_To" nullaccept lang="1" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td>
                <gw:button id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                <gw:button img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <gw:grid id="Grid_Detail" header="S/No|Bdgt Statement No.|_Descrip.|_Appr. Date|Cont. Amt(A)|BCWS(B)|Sales Gross Prft(A-B)|Sales Gross Prft Rate(%)"
                    format="0|0|0|0|1|1|1|1" aligns="1|1|3|1|3|3|3|3" defaults="|||||||" editcol="1|1|1|1|1|1|1|1"
                    widths="1000|2000|1000|1200|2000|2000|2000|2000" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="" />
            </td>
        </tr>
    </table>
</body>
</html>
