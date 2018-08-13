<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
//-------------------------------------------------------------------------
function BodyInit()
{
    txtLang.text="<%=Session("SESSION_LANG") %>"; 
    BindingData(); 
    txtOrderwork_pk.text= "<%=Request.querystring("order_pk")%>";
    txtPLPK.text = "<%=Request.querystring("p_tac_plpk")%>";
    txtyear.text      = "<%=Request.querystring("p_year")%>";
	txtproject_pk.text      = "<%=Request.querystring("project_pk")%>";
	
    System.Translate(document); 
    dat_gfka00300_info.Call();
   
}
//------------------------------------------------------------------------
function BindingData()
{
        
    var ls_data  = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    var ls_data2 = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=ESysLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_ccy   = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_bookccy = "<%=ESysLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstCcy.SetDataText(ls_ccy);
    lstCcy.value="";
    lstBookCcy.SetDataText(ls_bookccy);
    lstCompany.SetDataText(ls_data);
    
   
}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
    {
        var fpath = System.RootURL + "/form/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ACNT.SP_SEL_ACCD_PL";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
		{
			txtACPK.SetDataText(object[3]);
			txtACCD.SetDataText(object[0]);
			txtACNM.SetDataText(object[1]);
		}
   }
   if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/form/gf/ka/gfka00220_plcenter.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_gfka00220_1.Call();
                }            
            }        
   }
    if (pname=='PL')
   {
          
          var fpath   = System.RootURL + "/form/gf/ka/gfka00220_plunit.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLPK.text=object;     // Center PK
                    dat_gfka00220_2.Call();
                }            
            }    
   }
    
}


function OnSearch()
{
   dso_sel_pl.Call("SELECT");
}

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dso_sel_pl":
             grdDetail.Subtotal(1   ,2                ,-1       ,"4",""          ,true        ,0        ," Grand total %s ",0X00ffff,0x000000,true);
        break; 
       
        
    }
}
//--------------------------------------------------
function MergeHeader()
{

       
}
//----------------------------------------------------------
function MergeSum()
{
    
}
function OnPrint()
{
    var url ='/reports/kp/bp/rpt_kpcs613_p1.aspx?p_project_pk='+txtproject_pk.GetData()+'&p_orderwork_pk='+txtOrderwork_pk.GetData()+ '&p_year='+txtyear.GetData();
    System.OpenTargetPage( System.RootURL+url , 'newform' );
      
}
</script>

<body>
    <gw:data id="dat_gfka00300_info" onreceive=" OnSearch()"> 
        <xml>
            <dso  type="process"   procedure="ec111.sp_sel_kpbp613_info"  > 
                <input>
                    <input bind="txtPLPK" />
				    <input bind="txtOrderwork_pk" />
					<input bind="txtyear" />
					
                </input> 
                <output>
					<output bind="txtPLCD" />
                    <output bind="txtPLNM" />
                    <output bind="txtACCD" />
                    <output bind="txtACNM" />
					<output bind="txtFROM_DATE" />
                    <output bind="txtTO_DATE" />
                </output>
            </dso> 

        </xml> 
   </gw:data>
    <!------------------------------------------------------------------------>
    <gw:data id="dat_gfka00220_1" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="process"   procedure="acnt.sp_sel_gfka00220_1"  > 
                <input>
                    <input bind="txtPLC_PK" />
                </input> 
                <output>
                    <output bind="txtPLC_CD" />
                    <output bind="txtPLC_NM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
    <!------------------------------------------------------------------------>
    <gw:data id="dat_gfka00220_2" onreceive=""> 
        <xml>
            <dso  type="process"   procedure="acnt.sp_sel_gfka00220_2"  > 
                <input>
                    <input bind="txtPLPK" />
                </input> 
                <output>
                    <output bind="txtPLCD" />
                    <output bind="txtPLNM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_sel_pl" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ec111.sp_sel_kpbp613_p1_1">
                <input bind="grdDetail">
  			        <input bind="txtproject_pk"/>
                    <input bind="txtOrderwork_pk"/>
                    <input bind="txtyear"/>
                    </input>
                <output bind="grdDetail"/>
        </dso>
        </xml>
    </gw:data>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100; height: 10%">
            <td>
                <fieldset>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr>
                            <td align="right" width="10%">
                                Company&nbsp;</td>
                            <td colspan="3" width="15%">
                                <gw:list id="lstCompany" styles="width:100%" />
                            </td>
                            <td align="right">
                                Order work</td>
                            <td width="10%">
                                <gw:textbox id="txtACCD" text="" styles="width:100%" />
                            </td>
                            <td colspan="5" width="50%">
                                <gw:textbox id="txtACNM" text="" styles="width:100%" />
                            </td>
                            <td align="right">
                                <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Date&nbsp;</td>
                            <td align="left">
                                <gw:datebox id="txtFROM_DATE" styles='width:100%;height:22' lang="<%=Session("Lang")%>" />
                            </td>
                            <td align="center">
                                ~</td>
                            <td align="right">
                                <gw:datebox id="txtTO_DATE" styles='width:100%;height:22' lang="<%=Session("Lang")%>" />
                            </td>
                            <td align="right" styles="width: 100%">
                                PL Center</td>
                            <td>
                                <gw:textbox id="txtPLC_CD" readonly="true" styles="width:100%" />
                            </td>
                            <td colspan="6">
                                <gw:textbox id="txtPLC_NM" readonly="true" styles="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Status &nbsp;</td>
                            <td colspan="3">
                                <gw:radio id="rdoSlipStatus" value="2"> 
                                    <span value="2" >Confirmed</span>
                                 
                                </gw:radio>
                            </td>
                            <td align="right">
                                Project</td>
                            <td>
                                <gw:textbox id="txtPLCD" readonly="true" styles="width:100%" />
                            </td>
                            <td colspan="6">
                                <gw:textbox id="txtPLNM" readonly="true" styles="width:100%" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%; height: 70%">
            <td>
                <!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
                <gw:grid id='grdDetail' header='_Seq|Voucher No|Trans Date|Trans Amount|Books Amount|Cust ID|Customer Name|_PL Code|_PL Name|_Remark|_Remark2'
                    format='0|0|4|-2|-2|0|0|0|0|0|0' aligns='0|0|0|3|3|0|0|0|0|0|0' defaults='||||||||||'
                    editcol='0|0|0|0|0|0|0||0|0|0|0' widths='1000|1500|1500|2000|2000|2500|4000|2000|2000|2000|2000|2500|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtLang" styles="display:none; " text="<%=Session("SESSION_LANG") %>" />
    <gw:textbox id="txtOrderwork_pk" styles="display:none; " />
    <gw:textbox id="txtPLC_PK" styles="display:none; " />
    <gw:textbox id="txtPLPK" styles="display:none; " />
    <gw:textbox id="txtyear" styles="display:; " />
    <gw:list id="lstBookCcy" styles="display:none;"></gw:list>
    <gw:textbox id="txtproject_pk" styles="display:; " />
    <gw:list id="lstCcy" styles="width:100%;display:none" onchange="OnSearch()" />
</body>
</html>
