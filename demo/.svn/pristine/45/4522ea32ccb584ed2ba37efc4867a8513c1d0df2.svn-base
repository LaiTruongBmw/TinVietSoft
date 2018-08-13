<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var vnt_Row=0;
 function BodyInit()
 {
    System.Translate(document);
    grdRate.SetHeaderBold(true);		
	grdRate.GetGridControl().WordWrap = true;
	grdRate.GetGridControl().RowHeight(0) = 800 ;
	
	BindingDataList();
	OnSearch();
 }
function BindingDataList()
{ 
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All";
    
    <%=CtlLib.SetGridColumnComboFormat( "grdRate" , 3 , "SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0") %>;    
    <%=CtlLib.SetGridColumnComboFormat( "grdRate" , 4 , "SELECT E.CODE , E.CODE_LNM FROM TCO_ABCODE E , TCO_ABCODEGRP F WHERE E.DEL_IF=0 AND F.DEL_IF =0 AND E.TCO_ABCODEGRP_PK = F.PK AND F.ID='ACAB0110' ORDER BY E.CODE_LNM") %>; 
     
    
    lstCompany.SetDataText(ls_data);
    
    lstCompany.value = "ALL";
}
 
function OnSearch()
 {
    OnChangePeriod();
    idData_Dsql_Bank_Rate.Call("SELECT");
 }
 
function OnChangePeriod()
 {
    if (lstPeriod.GetData()==1)
    {   
        txtPeriod.SetDataText(dtDate.GetData());
        dtMonth.style.display = "none";
        //aaaaaaaaaaaaaaaaaaa
        dtDate.style.display = "";
    }
    if (lstPeriod.GetData()==2)
    { 
        txtPeriod.SetDataText(dtMonth.GetData());
        dtMonth.style.display = "";
        dtDate.style.display ="none";
    }
    
}
function OnAdd()
{
	grdRate.AddRow();
	var ctrl 	    = grdRate.GetGridControl();
	var rownum  	= ctrl.Rows - 1;
	if(lstPeriod.GetData() == 1)
	{
		grdRate.SetGridText( rownum, 1, dtDate.GetData() );		
	}
	if(lstPeriod.GetData() == 2)
	{
		grdRate.SetGridText( rownum, 2, dtMonth.GetData() );
	}
	grdRate.SetGridText( rownum, 4, '<Select One>' );
	grdRate.SetGridText( rownum, 3, '<Select One>' );
}

function OnSave()
{   
   idData_Dsql_Bank_Rate.Call();
}

function OnDelete()
{
    if ( confirm( "Delete it?" ))
	{
		grdRate.DeleteRow();		
	}
}
function OnPopup()
{
    if(lstPeriod.GetData()==1) txtPeriod.text = dtDate.GetData()
    else txtPeriod.text = dtMonth.GetData()
    
    var fpath = System.RootURL + "/standard/forms/ag/ga/agga00010_popup.aspx?dtPeriod=" +  txtPeriod.GetData() + "&lstPeriod=" + lstPeriod.GetData()+ "&lstCompany=" + lstCompany.GetData();
    var obj  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
}

function OnChangeData()
{
    var ctrl = grdRate.GetGridControl();
	var i    = ctrl.Row;
	if (ctrl.col==5)
	{		
		var rtn,n;
	    rtn=OnCheckData(5);
	    if (rtn==true)
	    {	
		    var tmp = grdRate.GetGridData(i, 5);
		    if(grdRate.GetGridData(i, 6)=="" )	grdRate.SetGridText(i,6,tmp);	
		    if(grdRate.GetGridData(i, 7)=="" )	grdRate.SetGridText(i,7,tmp);
		    if(grdRate.GetGridData(i, 8)=="" )	grdRate.SetGridText(i,8,tmp);
		    if(grdRate.GetGridData(i, 9)=="" )	grdRate.SetGridText(i,9,tmp);
		    OnFormatData(1);
	    }
	    else grdRate.SetGridText(i,5,0);	    
	}	
	if (ctrl.col==6)
	{		
		var rtn,n;
	    rtn=OnCheckData(6);
	    if (rtn !=true)
	        grdRate.SetGridText(i,6,0);	    
	}
	if (ctrl.col==7)
	{		
		var rtn,n;
	    rtn=OnCheckData(7);
	    if (rtn !=true)
	        grdRate.SetGridText(i,7,0);	    
	}
	
	if(ctrl.Rows>1)
	{	  	
		if(  (ctrl.col == 3 || ctrl.col == 4) && grdRate.GetGridData(i,4)!='<Select One>' && grdRate.GetGridData(i,3)!= '<Select One>' )
		{	
			txtCompany.SetDataText(grdRate.GetGridData(i,3));
			txtCurrency.SetDataText(grdRate.GetGridData(i,4));
			if(lstPeriod.GetData()==1) txtPeriod.text = dtDate.GetData()
                else txtPeriod.text = dtMonth.GetData();                
            vnt_Row = i;            
			Dso_Bank_Rate_Previous.Call();
		}
	}	
}
function OnFormatData(obj)
{   
    var ctrl 	    = grdRate.GetGridControl(); 
    var vntRate_Percent;
    var vntRate_Tmp = 0;
    var vntRate_Get = 0;
    if (obj==2)
    {     
	    grdRate.SetGridText( vnt_Row,5,'');
	    grdRate.SetGridText( vnt_Row,6,'');
	    grdRate.SetGridText( vnt_Row,7,'');
	    grdRate.SetGridText( vnt_Row,8,txtTmtRate.text);
	    
    }  
      
	for(var i=1;i<ctrl.Rows;i++)
	{
	    vntRate_Tmp = grdRate.GetGridData(i, 9)- grdRate.GetGridData(i, 11);
		vntRate_Get = '' + Number(vntRate_Tmp);
		grdRate.SetGridText( i, 11, vntRate_Get);
		
	    if (grdRate.GetGridData(i, 11)!=0 && grdRate.GetGridData(i, 10)!=0)
	    {
	        vntRate_Percent = (grdRate.GetGridData(i, 11) * 100)/grdRate.GetGridData(i, 10);
	        grdRate.SetGridText( i, 12, Number(Math.round(vntRate_Percent*100)/100) + '%');
	    }
	    else grdRate.SetGridText( i, 12, '0%');
	}
	vnt_Row = 0;
}
function OnCheckData(obj)
{
	var ctrl = grdRate.GetGridControl();
	var n; 
	var vntRate_1,vntRate_2;
	
	for(var i=1;i<ctrl.Rows;i++)
	{
	    n=grdRate.GetRowStatus(i);
	    if( (n == 16) || (n==48) )
	    {
	        vntRate_1 = '' +grdRate.GetGridData(i,obj); 
			vntRate_2 = vntRate_1.replace(/,/gi,'');
	    }
	    if (isNaN(vntRate_2)) 
	    {
			alert('This column must be a number.');
			return false;
		}	
		else
		{
			grdRate.SetGridText(i,obj,Number(vntRate_2));
		}
	}
	return true;
}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {               
        case "idData_Dsql_Bank_Rate": 
            lblRecord.text=grdRate.rows-1 + " record(s).";
            OnFormatData(1);          
        break;
        case "Dso_Bank_Rate_Previous": 
            if(txtTmtRate.text==-1)
            {
                alert("This case already have !!!");                
                OnSearch();                 
                return;
            }
            else  OnFormatData(2);            
        break;
    }
}
</script>
 
<body>

<gw:data id="idData_Dsql_Bank_Rate"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="AC_sel_60200010_abi_rate" procedure="AC_upd_60200010_abi_rate">
            <input bind="grdRate" >                            
                <input bind="txtPeriod" />
                <input bind="lstCompany" />
            </input>
            <output bind="grdRate" />
        </dso>                    
    </xml>
</gw:data>

<gw:data id="Dso_Bank_Rate_Previous" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="process" procedure="AC_pro_60200010_rate" > 
            <input> 
                 <input bind="txtCurrency"/>
                 <input bind="txtPeriod"/>
                 <input bind="txtCompany"/>
            </input>  
            <output>  
                 <output bind="txtTmtRate"/>
           </output> 
        </dso> 
    </xml> 
</gw:data>

   

    
<!------------------------ Main Table -------------------------->    
    
    <table>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
    </table>
    
<table align ="center" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:70%;border-color:#6B9EB8">
    <tr>
        <td>
            <table><tr><td>&nbsp; &nbsp;</td></tr></table>
            <table>
                <tr>
                    <td width="10%" align="right" valign="middle">Company</td>
		            <td width="10%" align="left"  valign="top">
		                <gw:list id="lstCompany" value="" styles="width:100%" onchange="OnSearch()" ></gw:list></td>
                    <td width="10%" align="right" valign="middle">Period</td>
		            <td width="10%" align="left"  valign="top">
		                <gw:list id="lstPeriod" value="1" styles="width:100%" onchange="OnSearch()" ><data> DATA|1|Date|2|Month</data></gw:list></td>
		            <td width="10%" align="right">Date/Month</td>
		            <td width="10%">
		                <gw:datebox id="dtMonth" styles="width:100%"  lang="<%=Session("Lang")%>" onchange="OnSearch()" type="month"/>
			            <gw:datebox id="dtDate"  styles="width:100%"  lang="<%=Session("Lang")%>" onchange="OnSearch()"/>
		            </td>
		            <td width="10%"><gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnAdd" img="new"    alt="new"       	 onclick="OnAdd()" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnSav" img="save"   alt="Save"   	  	 onclick="OnSave()" /></td>
		            <td width="2%"><gw:imgBtn id="ibtnDel" img="delete" alt="Delete" 	  	 onclick="OnDelete()" /></td> 
		            <td width="2%"><gw:imgBtn id="ibtnPop" img="popup"  alt="Display Rate"   onclick="OnPopup()"/></td>
		            <td width="10%"></td>
                </tr>
            </table>
            <table><tr><td>&nbsp; &nbsp;</td></tr></table>
        </td>
    </tr>
    
    
    <tr>
        <td align = top  width="100%"  height="100%" border="1">
		    <gw:grid   
			    id="grdRate"  
			    header   = "_Rate_Pk|_STD_YMD|_STD_YM|Company|Currency|Internal Sell|Internal Buy|Buying Rate|Selling Rate|Middle Rate|Middle Rate (Previous)|Middle Rate Change On Previous|Middle Rate Change As %"
			    format   = "0|0|0|2|2|1|1|1|1|1|1|1|0"
			    aligns   = "0|0|0|0|0|0|0|0|0|0|0|0|1"   
			    defaults = "||||||||||||" 
			    editcol  = "0|0|0|1|1|1|1|1|1|1|0|0|0"
			    widths   = "0|0|0|2000|2000|2000|2000|1500|1500|1500|0|0"
			    styles   = "width:100%; height:100%"   
			    sorting  = "T"   
				autosize="T"
			    onafteredit="OnChangeData()"
			    /> 
	    </td>
    </tr>
</table>
    
    <gw:textbox id="txtPeriod"  		text="" 	styles="Display:None" />
    <gw:textbox id="txtCurrency"  		text="" 	styles="Display:None" />
    <gw:textbox id="txtCompany"  		text="" 	styles="Display:None" />
    <gw:textbox id="txtTmtRate"  		text="" 	styles="Display:None" />
             
</body>
