<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Inquiry Dimension</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{       
        System.Translate(document);
        BindingDataList(); 
}   
function BindingDataList()
{
        var ls_Dimension = "<%=ESysLib.SetListDataSQL("select 0, '[ Non ]' from dual union all select pk, SIZEITEMNAME from TECPS_CONTSIZEITEM where del_if = 0")%>";
        lstDimension_item_1.SetDataText(ls_Dimension);
        lstDimension_item_2.SetDataText(ls_Dimension);
        lstDimension_item_3.SetDataText(ls_Dimension);   
        var ls_Condition = "DATA|||OR|OR|AND|AND";
        lstCond_1.SetDataText(ls_Condition); 
        lstCond_2.SetDataText(ls_Condition); 
        
        var df = 3;
        var cur_grid = df + lstDimension_item_1.childNodes(0).length;
        var gird = Grid_Detail.childNodes(0);
        
        for(var idx = cur_grid; idx < Grid_Detail.cols; idx ++){
            gird.ColHidden(idx) = true;
        }
        
        for(var idx = 1; idx < lstDimension_item_1.childNodes(0).length; idx ++){
            gird.TextMatrix(0, idx + df) = lstDimension_item_1.childNodes(0).childNodes(idx).innerText;
        }
}
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Facilities':
                            var path = System.RootURL + '/form/61/02/61020030_popup.aspx';
		                    var object = System.OpenModal( path ,600 , 500 , 'resizable:yes;status:yes');
		                    if ( object != null )
		                    {
                                        txFa_Class_Pk.text = object[1];
                                        txFa_Class_Cd.text = object[2];
                                        txFa_Class_Nm.text = object[3]; 
                            }
                break;
        }
}     
function OnSearch()
{
        if(lstDimension_item_1.value != '0'  || txtItem1_L.text != '' || txtItem2_L.text != ''){
            if(lstDimension_item_1.value == '0'){alert('Please select Dimension item!'); return false;}
            if(isNaN(txtItem1_L.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem1_L.text == ''){alert('Please input Quantity Item!'); return false;}
            
            if(isNaN(txtItem1_R.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem1_R.text == ''){alert('Please input Quantity Item!'); return false;}
        }
        
        if (lstCond_1.value != ''){
            if(lstDimension_item_1.value == '0'){alert('Please select Dimension item!'); return false;}
            if(isNaN(txtItem1_L.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem1_L.text == ''){alert('Please input Quantity Item!'); return false;}
            
            if(isNaN(txtItem1_R.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem1_R.text == ''){alert('Please input Quantity Item!'); return false;}
        
            if(lstDimension_item_2.value == '0'){alert('Please select Dimension item!'); return false;}
            if(isNaN(txtItem2_L.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem2_L.text == ''){alert('Please input Quantity Item!'); return false;}
            
            if(isNaN(txtItem2_R.text))
                {alert('Please input Quantity Item!'); return false;}
            else if (txtItem2_R.text == ''){alert('Please input Quantity Item!'); return false;}
            
            if (lstCond_2.value != ''){
                if(lstDimension_item_3.value == '0'){alert('Please select Dimension item!'); return false;}
                if(isNaN(txtItem3_L.text))
                    {alert('Please input Quantity Item!'); return false;}
                else if (txtItem3_L.text == ''){alert('Please input Quantity Item!'); return false;}
                
                if(isNaN(txtItem3_R.text))
                    {alert('Please input Quantity Item!'); return false;}
                else if (txtItem3_R.text == ''){alert('Please input Quantity Item!'); return false;}
            }
        }
        dso_search.Call("SELECT");
}   
</script>
<body>
<gw:data id="dso_search" onreceive="">
        <xml>
            <dso type="grid"  function="pm_sel_61020030">
                <input bind="Grid_Detail">
                    <input bind="txFa_Class_Pk"/>
                    <input bind="dtPeriodDt_Fr"/>
                    <input bind="dtPeriodDt_To"/>
                    <input bind="lstDimension_item_1"/>
                    <input bind="txtItem1_L"/>
                    <input bind="txtItem1_R"/>
                    <input bind="lstCond_1"/>
                    <input bind="lstDimension_item_2"/>
                    <input bind="txtItem2_L"/>
                    <input bind="txtItem2_R"/> 
                    <input bind="lstCond_2"/> 
                    <input bind="lstDimension_item_3"/>
                    <input bind="txtItem3_L"/>
                    <input bind="txtItem3_R"/> 
                </input>
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr style="height:10%">
    <td>
        <fieldset> 
            <table cellpadding="1" cellspacing="1" width="100%" border='0'>
                <tr>
                    <td align="right" width="15%">
                        <a title="Click here to show Facilities Classification" href="#" style="text-decoration:none" onClick="OnPopUp('Facilities')">          Facility Class&nbsp;</a>
                    </td> 
                    <td width="45%">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="30%"><gw:textbox id="txFa_Class_Cd" readonly="true" styles='width:100%' /></td>
                                <td width="70%">
                                    <gw:textbox id="txFa_Class_Nm" readonly="true" styles='width:100%' />
                                    <gw:textbox id="txFa_Class_Pk" styles='width:100%;display:none' />
                                </td> 
                            </tr> 
                        </table>
                    </td> 
                    <td width="2%"></td>
                    <td colspan='3' align='left'>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width='2%'><gw:imgbtn id="btjv2" img="reset" alt="Reset"  onclick="txFa_Class_Cd.text='';txFa_Class_Nm.text='';txFa_Class_Pk.text='';" /></td>
                                <td align='left' style='padding-left:5px'><gw:imgbtn id="btve" img="search" alt="Search"  onclick="OnSearch()" /></td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td align="right" width="15%">Scale Item&nbsp;</td>
                    <td width="45%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>
                    <td width="2%"></td>
                    <td width="26%">
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="49%"><gw:textbox id="txtItem1_L" styles='width:100%' /></td>
                                <td  align="center" width="2%">~</td> 
                                <td width="49%"><gw:textbox id="txtItem1_R" styles='width:100%' /></td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="10%"><gw:list id="lstCond_1" styles='width:100%' /></td>
                </tr>
                <tr>
                    <td align="right" width="15%">Scale Item&nbsp;</td>
                    <td width="45%"><gw:list id="lstDimension_item_2" styles='width:100%' /></td>
                    <td width="2%"></td>
                    <td width="21%">
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="49%"><gw:textbox id="txtItem2_L" styles='width:100%' /></td>
                                <td  align="center" width="2%">~</td> 
                                <td width="49%"><gw:textbox id="txtItem2_R" styles='width:100%' /></td>                                                                               
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="15%"><gw:list id="lstCond_2" styles='width:100%' /></td>
                </tr>
                <tr>
                    <td align="right" width="15%">Scale Item&nbsp;</td>
                    <td width="45%"><gw:list id="lstDimension_item_3" styles='width:100%' /></td>
                    <td width="2%"></td>
                    <td width="21%">
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="49%"><gw:textbox id="txtItem3_L" styles='width:100%' /></td>
                                <td align="center" width="2%">~</td> 
                                <td width="49%"><gw:textbox id="txtItem3_R" styles='width:100%' /></td> 
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="15%"></td>
                </tr>
                <tr>
                    <td align="right">Project Period&nbsp;</td>
                    <td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width='10%'><gw:datebox id="dtPeriodDt_Fr" lang="1"  styles="width:100%" /></td>
                                <td width='1%' style='padding-left:2px;padding-right:2px'>~</td> 
                                <td align='left'><gw:datebox id="dtPeriodDt_To" lang="1"  styles="width:100%" /></td> 
                            </tr> 
                        </table>
                    </td>
                </tr>
            </table> 
        </fieldset>
    </td>  
</tr>
<tr style="height:90%">
    <td style='padding-top:5px'>
        <gw:grid   
            id      ="Grid_Detail"  
            header  ="Project code|Project Name|Period|Major Facility|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30"   
            format  ="0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
            aligns  ="1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            defaults="|||||||||||||||||||||||||||||||||"
            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            widths  ="1500|3000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
            styles  ="width:100%; height:100%"   
            sorting ="T"  
            /> 
    </td>
</tr> 
</table>  
</body>
</html>