<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>6.1.3 Order work cost</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript">

function BodyInit()
{
  System.Translate(document);
  Grid_Mst.GetGridControl().WordWrap = true;
  Grid_Mst.GetGridControl().RowHeight(0) = 600;
  Grid_Mst.GetGridControl().FrozenCols = 4;
}

function OnPopUp(obj)
{
	switch(obj)
	{
		case 'Project':
			var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
					txtProject_Pk.text = aValue[0];
					txtProject_Cd.text = aValue[1];
					txtProject_Nm.text = aValue[2];  
					txttac_abplcenter_pk.text 		= aValue[8];
					txttac_abpl_pk.text 		= aValue[7];
					dso_date.Call();
			} 
		break;
	}
}
function OnSearch()
{
	if(txtProject_Pk.text=="")
	{
		alert("Please,choose project to search!!!");
		return;
	}
	dso_61090030.Call("SELECT");
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_date':
			dso_year.Call();
		break;
		case 'dso_year':
			onChangeyear();
		break;
		case 'dso_61090030':
		    //Subtotal       (iPos,iSubtotalSettings, iGroupOn, iTotalOn                                , sFormatString, bFontBold,iMatchFrom, sCaption,  bBkgColor, //bForeColor, bTotalOnly)
		    Grid_Mst.Subtotal(1   ,2                ,-1       ,"3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18",""          ,true        ,0        ," Grand total %s ",0X00ffff,0x000000,true);
			Grid_Mst.Subtotal(1,2,0,"3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18","",true,0,"    Total %s ");
		break;
	}
}	
//----------------------------------------------------------------
function onChangeyear()
{
	
	var _header = "Content|Work code|Work name|Budget (A)|Accu. cost(B)|Balance(A-B)|" ; 
	    _header =  _header + "This year("  +  lstYear.GetData() + ")|" ;
	    _header =  _header + "01/" +  lstYear.GetData() ;
		_header =  _header + "|02/" +  lstYear.GetData() ;
		_header =  _header + "|03/" +  lstYear.GetData() ;
		_header =  _header + "|04/" +  lstYear.GetData() ;
		_header =  _header + "|05/" +  lstYear.GetData() ;
		_header =  _header + "|06/" +  lstYear.GetData() ;
		_header =  _header + "|07/" +  lstYear.GetData() ;
		_header =  _header + "|08/" +  lstYear.GetData() ;
		_header =  _header + "|09/" +  lstYear.GetData() ;
		_header =  _header + "|10/" +  lstYear.GetData() ;
		_header =  _header + "|11/" +  lstYear.GetData() ;
		_header =  _header + "|12/" +  lstYear.GetData() ;
        _header =  _header + "|acc_pk"
	Grid_Mst.setHeader(_header);
}

//----------------------------------------------------------------
function OnPrint() {
    if (txtProject_Pk.text != '') {
        var url = System.RootURL + "/reports/61/09/rpt_61090030.aspx?Project_pk=" + txtProject_Pk.GetData() + "&Year=" + lstYear.GetData() ;
        System.OpenTargetPage(url);
    }
    else {
        alert('Please select Project !!');
    }
}
//---------------------------------------------------------------------------
function DBPopupClick(){
	 var fpath   = System.RootURL + "/form/61/09/61090031.aspx?p_year=" + lstYear.GetData() + '&order_pk=' + Grid_Mst.GetGridData(Grid_Mst.row,19) + '&p_tac_abplcenter_pk=' + txttac_abplcenter_pk.GetData() + '&p_tac_plpk=' + txttac_abpl_pk.GetData() + '&project_pk=' + txtProject_Pk.GetData();
	
	 var aValue = System.OpenModal(  fpath , 1000 , 700 , 'resizable:yes;status:yes');
}
//---------------------------------------------------------------------------

</script>

<body>
    <gw:data id="dso_date" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61090030"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                </input>
                <output>
                     <output bind="dtBudFromDate"/>
                     <output bind="dtBudToDate"/>
					 <output bind="dtFromDate"/>
                     <output bind="dtToDate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_year" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="pm_pro_61090030_year1"> 
                <input> 
                     <output bind="txtProject_Pk"/>
               </input>
                <output>
                     <output bind="lstYear"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------->
    <gw:data id="dso_61090030" onreceive="OnDataReceive(this)">    
	<xml> 
		<dso type="grid"  function="pm_sel_61090030" > 
			<input bind="Grid_Mst">
				<input bind="txtProject_Pk" />
				<input bind="lstYear" />
			
				
			</input> 
			<output bind="Grid_Mst" /> 
		</dso> 
	</xml> 
</gw:data>
    <!-------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 4%">
            <td>
                <fieldset style="padding: 0">
                    <table style="width: 100%; height: " border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td align="right" width="12%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                    Project&nbsp;</a></td>
                            <td width="50%">
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
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                            </td>
                            <td style="width: 18%;" align="right">
                                <a title="Contract Period" style="color: #333">Cont. Per.</a></td>
                            <td style="width: 20%" align="left">
                                <gw:datebox id="dtFromDate" lang="1" nullaccept styles="width:100%" />
                                ~<gw:datebox id="dtToDate" nullaccept lang="1" styles="width:100%" /></td>
                            <td>
                                <gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: " align="right">
                                <a title="Base Year" style="color: #333">Basis Yr.</a></td>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 20%">
                                            <gw:list id="lstYear" onchange="onChangeyear();OnSearch()" styles="width:100%" />
                                        </td>
                                        <td style="width: 20%">
                                            Unit: USD</td>
                                        <!--td style="width:55% " align="right"><a title="Final Account Closing Month / Year" style="color:#333">Fin. Acct. Close. Month/Year&nbsp;</a></td>
									<td style="width:25%" ><gw:textbox id="txtYearMonth" lang="1"  styles="width:100%"   /></td-->
                                    </tr>
                                </table>
                            </td>
                            <td>
                            </td>
                            <td style="width: " align="right">
                                <a title="Working Period" style="color: #333">Wkng Per.</a></td>
                            <td style="width: ">
                                <gw:datebox id="dtBudFromDate" lang="1" nullaccept styles="width:100%" />
                                ~<gw:datebox id="dtBudToDate" nullaccept lang="1" styles="width:100%" /></td>
                            <td>
                                <gw:button id="ibtnSearch2" img="excel" text="Print" alt="Print Report" onclick="OnPrint()" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 96%">
            <td>
                <gw:grid id="Grid_Mst" header="Content|Work code|Work name|Budget (A)|Accu. cost(B)|Balance(A-B)|This year|01/2011|02/2011|03/2011|04/2011|05/2011|06/2011|07/2011|08/2011|09/2011|10/2011|11/2011|12/2011|_order_pk"
                    format="0|0|0|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="2000|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="DBPopupClick()"
                    oncellclick="" />
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtbudget_pk" lang="1" styles="width:100%;display:none" />
<gw:textbox id="txttac_abplcenter_pk" lang="1" styles="width:100%;display:none" />
<gw:textbox id="txttac_abpl_pk" lang="1" styles="width:100%;display:none" />
</html>
</body>