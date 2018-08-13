<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Costing Process</title>
</head>

<script>

var G_MASTER_PK		= 0,
	G_PROCESS_DATE	= 1,
	G_PROCESS_BY    = 2;
	
//===========================================================
 function BodyInit()
 {
    System.Translate(document); 
	
 } 
//===========================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'REPORT':
			
			var path = System.RootURL + '/form/bi/co/bico00022.aspx';
            var obj = System.OpenModal( path ,550 , 300, 'resizable:yes;status:yes', this);		
			
		break;
		
		case 'CONFIG' :             
			
			var path = System.RootURL + '/form/bi/co/bico00021.aspx';
            var obj = System.OpenModal( path ,550 , 300, 'resizable:yes;status:yes');			
			
		break;		
    }
}

//===================================================================================
function OnReport(pos)
{ 
	switch(pos)
	{
		case 'ST01':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST01.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;	
		
		case 'ST02':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST02.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST03':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST03.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST04':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST04.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST05':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST05.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST06':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST06.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		
		case 'ST07':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST07.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST08':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST08.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST09':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST09.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;
		
		case 'ST10':
            if ( dtProcessDate.value != "" )
            { 
                 var url =System.RootURL + '/reports/bi/co/rpt_bico00020_ST10.aspx?p_process_date=' + dtProcessDate.value;
                 window.open(url, "_blank");
            }         
        break;		
    }
} 

//==========================================================================
function OnProcess()
{      
        if ( confirm("Do you want to process cost ?"))
        { 
            pro_bico00020.Call();
        }    
} 
//==========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_bico00020':
            alert(txtReturnValue.text)
            data_bico00020.Call('SELECT');
        break;
		
        case 'data_bico00020':
             
			 
        break;
    }
}
//=============================================================================== 
function OnSearch()
{
    data_bico00020.Call('SELECT');
} 
 
//==========================================================================

function OnDelete()
{
	grdDetail.DeleteRow();
}

//==========================================================================

function OnSave()
{
	if ( confirm("Do you want to delete data ?") )
	{
		data_bico00020.Call();
	}
}

//==========================================================================

</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="pro_bico00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico00020" > 
                <input>
                     <input bind="dtProcessDate" />                     
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2" function="<%=l_user%>lg_sel_bico00020" procedure="<%=l_user%>lg_upd_bico00020" > 
                <input bind="grdDetail" >
                    <input bind="dtFromDate" />
                    <input bind="dtToDate" />
                </input>
                <output  bind="grdDetail" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%"  >
        <tr style="height: 30%">
			 <td colspan="7">
				<table  style="width: 100%; height: 100%; border: 2px solid #034D72; background-color:#ccffff" >	
						<tr style="height: 25%">
							<td colspan=2 align="center" >
								<a title="INV closing config" onclick="OnPopUp('CONFIG')" href="#tips" style="color: #0000ff;color: purple; cursor: hand; font:15">
                                <b>INV CLOSING CONFIG</b></a>								
							</td>
						</tr>				 
						<tr style="height: 50%">
				            <td align="right" style="width: 50%; white-space: nowrap">
				                Process Date
				            </td>			 
				            <td style="width: 50%" align="left" >
							    <gw:datebox id="dtProcessDate" styles='width:100%' lang="<%=Application("Lang")%>" mode="01"  /> 				                 
				            </td>									 						           
				        </tr>
						<tr style="height: 50%">
							<td align='right' style="width: 45%; white-space: nowrap"   >
				                 <gw:icon id="btnEx" img="2" text="Execute" onclick="OnProcess()" /> 										 
				            </td>
							<td style="width: 1%" align="left">
								<gw:imgbtn id="ibtnExcel" alt="Search" img="excel" onclick="OnPopUp('REPORT')" />
							</td>							
						</tr>						     							 										 							
				</table>
			 </td>
                   
        </tr>		 
        <tr style="height: 10%">            
			<td align="right" style="width: 5%;" >
				Date
			</td>
			<td style="width: 30%" align="left" >                
				<gw:datebox id="dtFromDate" styles='width:100%' lang="<%=Application("Lang")%>" mode="01"  /> 
				~
				<gw:datebox id="dtToDate" styles='width:100%' lang="<%=Application("Lang")%>" mode="01"  /> 
			</td>			 
			<td style="width: 1%" align="right">
				<gw:imgbtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />
			</td>						  						  
			<td style="width: 1%" align="right">
				<gw:imgbtn id="ibtnDelete" alt="Search" img="delete" onclick="OnDelete()" />
			</td>                          
			<td style="width: 1%" align="right">
				<gw:imgbtn id="ibtnSave" alt="Search" img="save" onclick="OnSave()" />
			</td>
			
			
			
            <td align="right" style="width: 62%">			
			</td>        
        </tr>
        <tr style="height: 60%">
            <td colspan="7">
               <gw:grid id='grdDetail'
                header='_PK|Process Date|Process By'
                format='0|4|0'
                aligns='0|1|1'
                check='||'
                editcol='0|0|0'
                widths='0|1500|2500'
                sorting='T'         
                styles='width:100%; height:100%'			 
                />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
