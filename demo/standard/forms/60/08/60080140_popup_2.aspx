<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var systemdate;
function BodyInit()
{  
    System.Translate(document);
    grdRate.SetHeaderBold(true);
		
	grdRate.GetGridControl().WordWrap = true;
	grdRate.GetGridControl().RowHeight(0) = 800 ;
	
	sysdateP();
	BindingDataList();
    OnChangePeriod();  
}
function BindingDataList()
{ 
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All";
    var ls_data1    = "<%=CtlLib.SetListDataSQL("SELECT E.CODE , E.CODE_LNM FROM TCO_ABCODE E , TCO_ABCODEGRP F WHERE E.DEL_IF=0 AND F.DEL_IF =0 AND E.TCO_ABCODEGRP_PK = F.PK AND F.ID='ACAB0110' ORDER BY E.CODE_LNM")%>|ALL|Select All";
    
    lstCompany.SetDataText(ls_data);
    lstCurrency.SetDataText(ls_data1);
    
	lstCompany.SetDataText("<%=Request.querystring("lstCompany")%>");
    lstCurrency.value = "ALL";
}
function OnChangePeriod()
 {  
    txtTemp.text = systemdate;
    grdRate.ClearData();
    lblRecord.text = "0 record(s).";
    if (lstPeriod.GetData()==1) //date
    {   
        dtMonth_Fr.value = "";
        dtMonth_To.value = "";
        dtMonth_Fr.style.display = "none";
        dtMonth_To.style.display = "none";
        dtDate_Fr.style.display = "";
        dtDate_To.style.display = "";
        if(dtDate_Fr.GetData()=="" && dtDate_To.GetData()=="")
        {
            dtDate_Fr.text = txtTemp.text;
            dtDate_To.text = txtTemp.text;
        }
    }
    if (lstPeriod.GetData()==2)  //month
    {   
        dtDate_Fr.value = "";
        dtDate_To.value = "";        
        dtMonth_Fr.style.display = "";
        dtMonth_To.style.display = "";
        dtDate_Fr.style.display ="none";
        dtDate_To.style.display ="none";
        if(dtMonth_Fr.GetData()=="" && dtMonth_To.GetData()=="")
        {
            dtMonth_Fr.text = (txtTemp.text).substr(4,6);
            dtMonth_To.text = (txtTemp.text).substr(4,6);
        }
    }
    
}

function OnSearch()
{       
    OnChangePeriod();
    Dso_Bank_Rate_Popup.Call("SELECT");
}
function OnPrint()
{    
    switch (lstPeriod.GetData())
    {
        case "1":            
            txtDate_Fr.text = dtDate_Fr.GetData();
            txtDate_To.text = dtDate_To.GetData();
        break ;
        case "2":
            txtDate_Fr.text = dtMonth_Fr.GetData();
            txtDate_To.text = dtMonth_To.GetData();
        break;
    }
    
    var url =System.RootURL + '/standard/reports/ag/ga/agga00010.xls?lstPeriod=' + lstPeriod.GetData() 
    + "&dtDate_Fr=" + txtDate_Fr.text + "&dtDate_To=" + txtDate_To.text + "&lstCompany=" + lstCompany.GetData()+ "&lstCurrency=" + lstCurrency.GetData() ;
	window.open(url); 
}

function OnClose()
{
    this.close();
}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {               
        case "Dso_Bank_Rate_Popup":  
            OnFormatData();          
        break;
    }
}

function OnFormatData()
{   
    var ctrl 	    = grdRate.GetGridControl(); 
    var vntRate_Percent;
    var vntRate_Tmp = 0;
    var vntRate_Get = 0;
	for(var i=1;i<ctrl.Rows;i++)
	{	   
		vntRate_Tmp = grdRate.GetGridData(i, 4)- grdRate.GetGridData(i, 6);
		vntRate_Get = '' + Number(vntRate_Tmp);
		grdRate.SetGridText( i, 7, vntRate_Get);
		
	    if (grdRate.GetGridData(i, 7)!=0 && grdRate.GetGridData(i, 6)!=0)
	    {
	        vntRate_Percent = (grdRate.GetGridData(i, 7) * 100)/grdRate.GetGridData(i, 6);
	        grdRate.SetGridText( i, 8, Number(Math.round(vntRate_Percent*100)/100) + '%');
	    }
	    else grdRate.SetGridText( i, 8, '0%');
	}
	
}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {               
        case "Dso_Bank_Rate_Popup":
            lblRecord.text=grdRate.rows-1 + " record(s).";
            OnFormatData();
        break;
    }
}
function sysdateP()
{
 	sysDate = new Date()
    newDate1 = sysDate.getMonth()+1 
    if (Number(newDate1) < 10)    
        newDate1="0"+ String(newDate1) 
    newDate2 = sysDate.getDate() 
    if (Number(newDate2) < 10 )
        newdate2="0" +String(newDate2) 
    newDate3 = sysDate.getFullYear()
    systemdate = newDate2 +"/" + newDate1 + "/"+ newDate3
}

</script>
<body>

<gw:data id="Dso_Bank_Rate_Popup"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ac_SEL_60080140_popup_2">
            <input bind="grdRate" >                    
                <input bind="dtMonth_Fr" />
                <input bind="dtMonth_To" />
                <input bind="dtDate_Fr" />                                            
                <input bind="dtDate_To" />                
                <input bind="lstCurrency" />
                <input bind="lstCompany" />
            </input>
            <output bind="grdRate" />
        </dso>                    
    </xml>
</gw:data>

<table align ="center" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;border-color:#6B9EB8">
    <tr>
        <td width="100%">
            <table width="100%">
                <tr>
                    <td width="100%" align="center"><b><font size=4.0 color=#0000cc>LIST OF RATE IN THIS PERIOD</font></b></td>
                </tr>
            </table>            
            <table><tr><td>&nbsp; &nbsp;</td></tr></table>
            <table width="100%">
                <tr>
                    <td width="8%" align="right">Company </td>
                    <td width="15%"><gw:list  id="lstCompany" styles="width:100%"></gw:list></td>
                    <td width="8%" align="right" valign="middle">Period </td>
		            <td width="10%" align="left"  valign="top">
		                <gw:list id="lstPeriod"  styles="width:100%" value="<%=Request.querystring("lstPeriod")%>" onchange="OnChangePeriod()" ><data> DATA|1|Date|2|Month</data></gw:list></td>
		            <td width="10%" align="right" valign="middle">Date/Month</td>
		            <td width="8%"align="center">
		                <gw:datebox id="dtMonth_Fr" styles="width:100%" lang="<%=Session("Lang")%>"  nullaccept  onchange="" type="month" />
			            <gw:datebox id="dtDate_Fr"  styles="width:100%" lang="<%=Session("Lang")%>"  nullaccept  onchange=""/>
		            </td>
		            <td width="3%" align="center">&nbsp; ~ </td>
		            <td width="8%"align="center">
		                <gw:datebox id="dtMonth_To"  styles="width:100%" lang="<%=Session("Lang")%>"  nullaccept  onchange="" type="month"/>
		                <gw:datebox id="dtDate_To"   styles="width:100%" lang="<%=Session("Lang")%>"  nullaccept  onchange=""/>
		            </td>
		            <td width="2%"> &nbsp; </td>		           
		            <td width="2%"><gw:imgBtn id="ibtnSea" img="search"   alt="Search"        onclick="OnSearch()" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnPri" img="printer"  alt="Report"   	  onclick="OnPrint()" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnCan" img="cancel"   alt="Close" 	  	  onclick="OnClose()" /></td> 
                </tr>
                <tr>
                    <td width="8%" align="right">Currency</td>
		            <td width="15%"><gw:list  id="lstCurrency" value="ALL" styles="width:100%"></gw:list></td>
                    <td width="8%" align="right" valign="middle"> </td>
		            <td width="10%" align="left"  valign="top">&nbsp;</td>
		            <td width="10%" align="right" valign="middle"></td>
		            <td width="8%"align="center"> &nbsp; </td>
		            <td width="3%" align="center">&nbsp;  </td>
		            <td width="8%"align="center">&nbsp;</td>		            
		            <td colspan = 4 width="2%" align="center" ><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /></td>
                </tr>
            </table>
        </td>
    </tr>
    
    
    <tr>
        <td align = top  width="100%"  height="100%" border="1">
		    <gw:grid   
			    id="grdRate"  
			    header   = "Company|Month/Date|Currency|Buying Rate|Selling Rate|Middle Rate|Middle Rate (Previous)|Middle Rate Change On Previous|Middle Rate Change As %"
			    format   = "0|0|2|1|1|1|1|1|0"
			    aligns   = "0|0|0|0|0|0|0|0|1"   
			    defaults = "||||||||" 
			    editcol  = "0|0|0|0|0|0|0|0|1"   
			    widths   = "1500|1200|1200|1200|1200|1500|1500|1500"
			    styles   = "width:100%; height:100%"   
			    sorting  = "T"   
			    param    = "0,1,2,3,4,5,6,7,8"  /> 
	    </td>
    </tr>
</table>
    <gw:textbox id="txtTemp"  		    text="" 	styles="Display:None" />
    <gw:textbox id="txtDate_Fr"  		text="" 	styles="Display:None" />
    <gw:textbox id="txtDate_To"  		text="" 	styles="Display:None" />
</body>
