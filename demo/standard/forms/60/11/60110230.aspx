<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Information POST</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    idDBUSR.text= "<%=Session("APP_DBUSER")%>" ;
	System.Translate(document);
	var ls_BizPlace      = "<%=CtlLib.SetListDataSQL("select pk, loc_nm from tco_busplace where del_if = 0")%>";
	lstBizPlace.SetDataText(ls_BizPlace);
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";
	
   txtPLCD.SetEnable(false);
   txtPLNM.SetEnable(false);
   dso_getCompany.Call();
}

function OnSearch()
{
	dso_search.Call("SELECT");
}

function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case 'dso_checkimport':
		    if(txtRtn.text=='0')
		    {
		        OnImport();
		    }else
		    {
		        alert("trans date confirmed, can''t import");
		    }
		break ;
		case 'dso_search':
		{
		    lblRecord.text = (idGrid.rows -1) + " record(s)."
		}
		break;
	}
}
function OnCheckTransDAte()
{
    dso_checkimport.Call();
}
function OnImport()
{
    if (lstBizPlace.value=="" || lstBizPlace.value =="ALL")
    {
        alert("Please, select Biz. Place to import!")
        return;
    }
   if(txtPLPK.text =="")
    {
         alert("Please, select PL to import!")
        return;
    }
    var currentTime = new Date();		
	txtSequence.text = currentTime.getTime();
	// argument fixed table_name, procedure, procedure_file
	// dynamic arg p_1,p_2,p_3,p_4,p_5
	var url =System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text +  '&table_name=TES_FILEOBJECT'+  '&procedure=gasp.SP_INSERT_IMAGE' + '&p_err_cont=Y' + '&procedure_file='+ idDBUSR.text +'.ac_pro_60110230_import' + '&p_start=3'+ '&p_1='+dtTransDate.value+'&p_2='+lstBizPlace.value+ '&p_3=' +lstCompany.value+ '&p_4=' +txtPLCD.text+ '&p_5=';
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
		
	if (txtRecord.text != 'undefined')
	{
		alert("Imported : " + txtRecord.text + " record(s)");
	}	

}
function OnProcess()
{
	dso_process.Call();
}

function OnCancel()
{
	dso_cancel.Call();
}

  function OnShowPL()
{
    if(lstCompany.value=='')
        {
            alert('Must select Company!!!');
            return ;
        }              
       var path = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?dsqlid=ac_sel_pl_popup_plpk&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name" ;
        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
        if(object != null)
        {
            txtPLPK.text = object[2];
            txtPLCD.text = object[0];
            txtPLNM.text = object[1];
        }

}
function OnReset()
{
    txtPLPK.text = "";
    txtPLCD.text = "";
    txtPLNM.text = "";
}
</script>
<!------------------------------------------------>
<body style="margin:0; padding:0;">
   
  <gw:data id="dso_getCompany" onreceive="dso_getBizPlace.Call();"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
 <gw:data id="dso_checkimport" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60110230_checkimport" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtTransDate"/>
					 <input bind="lstBizPlace"/>
                </input>
                <output>
                     <output bind="txtRtn"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60110230">
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="dtTransDate"/>
					<input bind="lstBizPlace"/>
					<input bind="txtPLCD"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

	<gw:data id="dso_process" onreceive="">
        <xml> 
            <dso type="process" procedure="ac_pro_60110230" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtTransDate"/>
                </input>
                <output>
                     <output bind="txtRtn"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
	
<gw:data id="dso_cancel" onreceive="">
        <xml> 
            <dso type="process" procedure="ac_pro_60110230_cancel" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtTransDate"/>
					 <input bind="lstBizPlace"/>
                </input>
                <output>
                     <output bind="txtRtn"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>	
	
<gw:data id="dso_getBizPlace" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_BizPlace" > 
                <input> 
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="lstBizPlace"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
<table  cellpadding="1" cellspacing="1" border="0" style="height:100%;width:100%" >
	<tr style="height:2%">
		<td align='right' width='8%'>Company</td>
		<td width='22%'><gw:list id="lstCompany" onchange="dso_getBizPlace.Call();" styles='width:100%' /></td>
		<td align='right' width='10%'>Biz.Place</td>
		<td width='25%'><gw:list id="lstBizPlace" onchange="" styles='width:100%' /></td>	
		<td align='right' width='10%'>Trans Date</td>
		<td><gw:datebox id="dtTransDate"  lang="1" styles="" onchange="" /></td>	
		<td><gw:button id="ibtnS" img="search" alt="search" onclick="OnSearch()" /></td>
		<td><gw:button id="ibtnImport" img="import" alt="Import" onclick="OnCheckTransDAte()" /></td>
		<td><gw:button id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td>
		<td><gw:button id="ibtnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>		
	</tr>
	<tr>	
	    <td></td>   
	    <td></td>
		<td align="right"><a title="Click here to select PL" onclick="OnShowPL()" href="#tips">PL</a></td>							
        <td align="left" >
        <gw:textbox id="txtPLPK" styles="width:100%; display:none"  />
        <gw:textbox id="txtPLCD" styles="width:100%" /></td>
        <td align="left"  colspan=2 ><gw:textbox id="txtPLNM" styles="width:100%"  /></td>		
        <td align="left"><gw:imgBtn id="btnResetConsignor" img="reset" alt="Reset" onclick="OnReset()" /></td>		
		<td align="right" colspan="2"><gw:label id="lblRecord" text=""  styles="color : red"/></td>							
	</tr>
	<tr style="height:98%">
		<td colspan="15">
			<gw:grid
				id="idGrid"
				header  ="No|MClass|Item Code|Item Name|Unit Price|Cash Qty|Cash Amt|Credit Qty|Credit Amt|HDTM Qty|HDTM Amt|HDTM Qty|HDTM Amt|Bank ID|ACC Code|AR Desc|Local AR Desc|PL Code|Trans Date|Partner Code|Partner Name|Tax Code|Address|Item_seq"
				format  ="0|0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0"
				aligns  ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				defaults="||||||||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				styles  ="width:100%; height:100%"
				autosize="true"
				oncelldblclick=""
				sorting ="T" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtRtn"  styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
<gw:textbox id="idDBUSR"    styles='width:100%;display:none' />
<gw:textbox id="txtSequence"  styles='display:none' />
<gw:textbox id="txtRecord"  styles='display:none' />
</body>
</html>