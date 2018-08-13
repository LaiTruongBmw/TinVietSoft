<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Report Design Daily Entry C.F</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
	System.Translate(document);
	var tmp = "<%=Request.querystring("com_pk")%>";
	txtCompany.text = tmp;
	tmp= "<%= Session("SESSION_LANG") %>";
	txtLang.text = tmp;
	tmp ="<%=Request.querystring("row_pk")%>";
	txtMasterPK.text = tmp;
	
	tmp ="<%=Request.querystring("cf_type")%>";
	txtCF_TYPE.text = tmp;
	txtCF_TYPE.SetEnable(false);
	txtMasterCode.SetEnable(false);
	txtMasterRemark.SetEnable(false);
	txtMasterFormula.SetEnable(false);
	//onSearch();
	datCFMasterDetail.Call();
	
}



function onDelete()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	
	if ((rownums > 1) && (rownum > 0))
	{
		if (confirm("Are you sure you want to delete?"))
		{
			for(i=1; i<rownums; i++)
			{
				if (ctrl.isSelected(i) == true)
                {
				    grGrid.DeleteRow();
				}
			}
		}
	}
	else
	{
		alert("Please select row for delete.");
	}
}

function onNew()
{
    grGrid.DeselectRow(grGrid.selrow);
	grGrid.AddRow();
	grGrid.SelectRow(grGrid.rows - 1);
	grGrid.SetGridText( grGrid.rows - 1 ,10, txtCompany.text);
}

function onSearch()
{
    datCFMasterDetail.Call();
}

function OnDataReceive(obj)
{
    if (obj.id=="datCFMasterDetail")
   {
        datCFDetail.Call("SELECT");
   } 
}
function OnDataError(obj)
{
    alert("Error at " + obj.id); 
}
function onNew()
{
    grdCFData.DeselectRow(grdCFData.selrow);
	grdCFData.AddRow();
	grdCFData.SelectRow(grdCFData.rows - 1);
	grdCFData.SetGridText( grdCFData.rows - 1 ,3, txtMasterPK.text);
	grdCFData.SetGridText(grdCFData.rows - 1 ,1, txtMasterCode.text); 
	grdCFData.SetGridText( grdCFData.rows - 1 ,2,grdCFData.rows-1) ;
	
}

function onDelete()
{
    var ctrl 	= grdCFData.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	
	if ((rownums > 1) && (rownum > 0))
	{
		if (confirm("Are you sure you want to delete?"))
		{
			for(i=1; i<rownums; i++)
			{
				if (ctrl.isSelected(i) == true)
                {
				    grdCFData.DeleteRow();
				}
			}
		}
	}
	else
	{
		alert("Please select row for delete.");
	}
}

function onSave()
{
    var ctrl 	= grdCFData.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	var valid =1;
    for(i=1; i<rownums; i++)
	{
	    if(grdCFData.GetRowStatus(i)!=112) //DELETE
	    {
		    if(grdCFData.GetGridData(i,4)=="")
		    {
		        alert("Debit Account at row "+grdCFData.GetGridData(i,2) +"is empty "+'\n'+ "Nhập tài khoản NỢ ở dòng "+grdCFData.GetGridData(i,2));
		        valid =0;
		        break;
		    }
		    if(grdCFData.GetGridData(i,7)=="")
		    {
		        alert("Credit Account at row "+ grdCFData.GetGridData(i,2) +"is empty"+'\n'+"Nhập tài khoản CÓ ở dòng "+grdCFData.GetGridData(i,2));
		        valid =0;
		        break;
		    }
		}
		
	}
    if (valid==1)
   {
        datCFDetail.Call();
   } 
}
function RowClick()
{
        var curRow = grdCFData.row;
        var runRow=curRow;
        if ((event.col==5) ||(event.col==6))//Debit
        {
            var fpath   = System.RootURL + "/standard/forms/60/08/60080010_popup_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + txtCompany.text + "&dsqlid=ac_sel_60080010_all_account";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text); 
	                        grdCFData.SetGridText(runRow ,1, txtMasterCode.text);
	                        grdCFData.SetGridText(runRow ,13, txtCF_TYPE.text);  
						}
						else
						{
						    grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                        grdCFData.SetGridText(runRow ,1, txtMasterCode.text);
	                        grdCFData.SetGridText(runRow ,13, txtCF_TYPE.text);   
						} 
						runRow++;
	                }
	            }
	        }
	    }
        }
        if ((event.col==8) ||(event.col==9))//Credit
        {
            var fpath   = System.RootURL + "/standard/forms/60/08/60080010_popup_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + txtCompany.text + "&dsqlid=ac_sel_60080010_all_account";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow , 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                        grdCFData.SetGridText(runRow ,1, txtMasterCode.text);  
	                        grdCFData.SetGridText(runRow ,13, txtCF_TYPE.text);  
						}
						else
						{
						    grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                        grdCFData.SetGridText(runRow ,1, txtMasterCode.text);   
	                        grdCFData.SetGridText(runRow ,13, txtCF_TYPE.text);  
						} 
						runRow++;
	                }
	            }
	        }
	    }
        }
        setRowNo();
}
function setRowNo()
{
    for(i=1;i<grdCFData.rows;i++)
   {
        grdCFData.SetGridText(i,2,i);
   } 
}
</script>
<body style="margin:0; padding:0;">

<gw:data id="datCFMasterDetail" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
    <xml> 
        <dso id="1" type="process" user="acnt" parameter="0"   procedure = "ac_sel_60080010_design_cf_mt"> 
            <input >
                <input bind="txtMasterPK" /> 
            </input>
            <output>
                <output bind="txtMasterCode" />
                <output bind="txtMasterRemark" /> 
                <output bind="txtMasterFormula" /> 
            </output>
		</dso> 
    </xml> 
</gw:data> 

<gw:data id="datCFDetail" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,7,10,11,12,13" function="ac_sel_60080010_design_cf" procedure="ac_upd_60080010_design_cf">
                <input bind="grdCFData">
                    <input bind="txtCompany"/>
                    <input bind="txtMasterPK"/>
                    <input bind="txtLang"/>
                    <input bind="txtCF_TYPE"/>
                    
                </input>
                <output bind="grdCFData"/>
            </dso>
        </xml>
    </gw:data>
<table border="1" cellpadding="0" cellspacing="0" width="100%">
    <tr>
            <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="14%" align="right">Code &nbsp;</td>
                                <td width="7%"><gw:textbox id="txtMasterCode" styles='width:100%;'/></td>
                                <td width="57%"><gw:textbox id="txtMasterRemark" styles='width:100%;'/></td>
                                <td width="10%"></td>
                                <td width="3%"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"           onclick="onNew()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDelete()"/></td>
                            </tr>
                           <tr>
                                <td align="right">Formular &nbsp;</td>
                                <td colspan="5"><gw:textbox id="txtMasterFormula" styles='width:100%;'/></td>
                                <td></td>
                                <td></td>
                           </tr>
                           <tr>
                                <td align="right">Cash Type &nbsp;</td>
                                <td colspan="5"><gw:textbox id="txtCF_TYPE" styles='width:100%;'/></td>
                                <td></td>
                                <td></td>
                           </tr> 
                    </table>
            </td> 
    </tr>
   <tr>
        <td>
                <gw:grid id='grdCFData'
                header='_PK|Code|No|_TAC_KAFINANCEFORM_PK|_TAC_ABACCTCODE_PK_DR|Account Code|Account Name|_TAC_ABACCTCODE_PK_CR|Account Code|Account Name|_FORMULAR|_REMARK|_REMARK2|_CF_TYPE'
                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|2|2|0|0|0|0|0|0|0|0|0|0|0'
                defaults='|||||||||||||'
                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                widths='1000|700|500|0|0|1500|2500|0|1500|2000|1000|1000|1000|500'
                sorting='T'
                oncelldblclick ="RowClick()"
                styles='width:100%; height:300'
                />
        </td>
   </tr> 
</table>

<gw:textbox id="txtMasterPK" styles='width:100%;display:none'/>
<gw:textbox id="txtLang" styles='width:100%;display:none'/>
<gw:textbox id="txtCompany" styles='width:100%;display:none'/>
</body>
</html>