<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var iPK                  =	1
    ,iPartner            =  2
    ,iPL_Code            =	3
    ,iContract_Date      =  4
    ,iContract_No        =	5
    ,iContract_Amount    =  6
    ,iPartner_Code       =  7
    ,iPL                 =  8
    ,Company            =	9
    ,iIssued_Date        =  10
    ,iEmp_PK             =	11
    ,iEmp_ID             =  12
    ,iEmp_Full_Nm        =  13
    ,iBooking_Ccy        =  14
    ,iB_EX_RATE          =  15    
    ,iAP_TR_AMT          =	16
    ,iAP_B_AMT           =	17
    ,iADV_TR_AMT         =  18
    ,iADV_B_AMT          =	19
    ,iPAID_TR_AMT         =	20
    ,iPAID_B_AMT		     =  21

function BodyInit()
{
    SetFormatCol();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}

function SetFormatCol()
{
    
    var ctrl1 = grdContract.GetGridControl();
    ctrl1.ColFormat(6) = "###,###R";  
    
    
    var sContractDt_Fr,sContractDt; 
    sContractDt=dtContractDt_To.value
    sContractDt_Fr=sContractDt.substr(0,6)+'01';    
    dtContractDt_Fr.SetDataText(sContractDt_Fr);
    
    var data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstBookingCcy.SetDataText(data);
   
    txt_row.text    = 1;
}
function OnShowPopup(index)
{
    switch (index)
    {
        case 0:
             var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    //txtPartnerID.SetDataText(object[1]);//customer id
                    txtPartner.SetDataText(object[2]);//customer name
                    txtPartner_PK.SetDataText(object[0]);//customer pk
      	        }
		     }       
                break;
        case 1:
            fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                
                if ( oValue != null )
                {
                   // txtPL_PK.text = oValue[2]; 
                    txtPL.text   = oValue[1];
                  //  txtPL_Code.text   = oValue[0];
                }                   
            break;   
        case 2:        
            var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx" ;
            var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
            if (obj!=null)
            {          
                txtCharger_PK.text=obj[0];            
                txtCharger_Code.text=obj[1];
                txtChargerNm.text=obj[2];                
            }   
            break; 
                   
    }
}

function onSearch()
{  
    dat_search.Call("SELECT");
}
function onSave()
{
    
    dat_update.Call();
}
function onCellClickToGrid()
{    
    
    txt_PK.SetDataText(grdContract.GetGridData(grdContract.row,1));
    
    dat_update.Call('SELECT');
}
function OnDataReceive(obj)
{
    var strdata = txtCodeTemp.text;
    if(obj.id == 'datGetNewCode')
    {
        switch(indexCode)
                {
                    case 1:
                        lstBookingCcy.SetDataText(strdata);
                        lstBookingCcy.value=strcodereturn; //loai tien   
                        OnChangeCurrent();  
                                
                    break;
                   
                }
    }
    if(obj.id == 'dat_update')
    {
        //onSearch();
        FormatGrid();     
    }
    else if(obj.id == 'dat_search')
    {
        FormatGrid();
    }
}

function onPrint()
{
    
    var p_tim_contr_mst;
    if (grdContract.rows>1)
    {
        p_tim_contr_mst_pk=grdContract.GetGridData(grdContract.row,PK); 
        p_tco_company_pk=grdContract.GetGridData(grdContract.row,Company);      
        var url = '/standard/reports/gf/qc/gfqc00020_contractprogress.aspx?p_tim_contr_mst_pk='+p_tim_contr_mst_pk+ '&p_tco_company_pk='+p_tco_company_pk;
        System.OpenTargetPage( System.RootURL+url , "newform" );
    }
    else 
    {
        alert("Please select a data row");
        return;
    } 
}
//------------------------------------------------------
function GetDataListbox(index)
{
    var scode;
        switch(index)
        {           
            case 1:
                scode='ACAB0110'; //loai tien
            break;
           
        }
        txtComCodeID.text = scode;
        var fpath = System.RootURL + "/standard/forms/60/02/60020050_popup_1.aspx?code=" + scode ;
       
        var obj = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes');
        if (obj!=null)
        {
            strcodereturn=obj[1];
            indexCode=index;
            
            if (obj[0]==1 ) //modify common code
                OnLoadNew(scode);
                //datGetNewControl.Call();
            else
            {               
                switch(index)
                {                        
                    case 1:
                        lstBookingCcy.value=strcodereturn; //loai tien
                        OnChangeCurrent();
                    break;
                   
                }            
            }
        }	     
               

}
//------------------------------------------------
function OnLoadNew(scode)
 {	
        datGetNewCode.Call('SELECT');
 }
 //-----------------------------------------------------
function OnChangeCurrent()
{
    
    dso_get_rate.Call();
} 
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
  function FormatGrid()
 {
    var fg=grdContract.GetGridControl();
    if(lstBookingCcy.GetData() == "VND")
        {
            fg.ColFormat(6) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(15) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(16) = "#,###,###,###,###,###,###R";
            
        }
        else
        {
            fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(15) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(16) = "#,###,###,###,###,###,###.##R";
           
        }
 }
</script>
<body >
<gw:data id="dat_search"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"  function="AC_sel_60020050_Search"> 
            <input bind="grdContract">                    
                <input bind="txtContractNo" /> 
                <input bind="dtContractDt_Fr" /> 
                <input bind="dtContractDt_To" />
                <input bind="txtPartner_PK" />
                <input bind="txtPL_PK" />
            </input> 
            <output bind="grdContract" /> 
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------------------------------->
<gw:data id="dat_update"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="AC_sel_60020050_control"   procedure="AC_upd_60020050_control"> 
            <inout> 
                <inout bind="txt_PK"/>
                <inout bind="dt_Issued" />
                <inout bind="dtContract" />
                <inout bind="txtContractNo_D" />
                <inout bind="lstBookingCcy" />
                
                <inout bind="txtBookingRate" />
                <inout bind="txtTransRate" />
                <inout bind="txtAPTransAmt" />
                <inout bind="txtAPBooksAmt" />
                <inout bind="txtAdvTransAmt" />
                
                <inout bind="txtAdvBooksAmt" />
                <inout bind="txtPaidTransAmt" />
                <inout bind="txtPaidBooksAmt" />
                <inout bind="txtDeductBooksAmt" />
                <inout bind="txtDeductTransAmt" />
            </inout>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------->
<gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="AC_PRO_60020050_GET_RATE"> 
                <input> 
                     <input bind="dtContract"/>
                     <input bind="lstCompany"/>
                     <input bind="lstBookingCcy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtTransRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data> 
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60020050_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
   <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 40%" id="idLEFT">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%;width:100%">
                        <td>
                            <fieldset style="width:100%">
                                <table  style="width: 100%">
                                    <tr>
                                        <td align="right" width="35%">Contract No</td>
                                        <td width="65%"><gw:textbox id="txtContractNo" onenterkey="onSearch()"  styles="width:100%"/></td>
                                        <td ><gw:imgbtn id="btnSearch" img="search" alt="Search"  onclick="onSearch()" /></td>
                                    </tr>
                                    <tr>
                                        <td align="right">Contract Date</td>
                                        <td colspan="2">
                                            <table style="width:100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="45%"><gw:datebox id="dtContractDt_Fr" lang=1  lang="<%=Session("Lang")%>"   /></td>
                                                        <td width="10%" align="center">~</td>
                                                        <td width="45%"><gw:datebox id="dtContractDt_To" lang=1  lang="<%=Session("Lang")%>"  /></td>
                                                    </tr>
                                            </table>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="right"><a onclick="OnShowPopup(0)" title="Click here to select partner" href="#tips" >Partner</a> </td>
                                        <td colspan="2">
                                                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                                                    <tr>
                                                        <td width="96%" >
                                                            <gw:textbox id="txtPartner" style="width:100%" readonly="true"/>
                                                            <gw:textbox id="txtPartner_PK" style="width:100%;display:none" />
                                                        </td>
                                                        <td width="4%">
                                                            <gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPartner.text='';txtPartner_PK.text=''" />
                                                        </td>
                                                    </tr>
                                                </table>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td align="right"><a onclick="OnShowPopup(1)" title="Click here to select P/L" href="#tips">PL</a></td>
                                        <td colspan="2">
                                                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                                                    <tr>
                                                        <td width="96%" >
                                                            <gw:textbox id="txtPL" style="width:100%" readonly="true"/>
                                                            <gw:textbox id="txtPL_PK" style="width:100%;display:none"  />
                                                        </td>
                                                        <td width="4%">
                                                            <gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPL.text='';txtPL_PK.text=''" />
                                                        </td>
                                                    </tr>
                                                </table>
                                       </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%;width:100%">
                         <!--        header='0.No|1._PK|2.Partner|3.P/L|4.Contract Date|5.Contract No|6.Contract Amount|7._Paner_Code|8._PL_Code|9.Issued Date|10.Booking Ccy|11.A/P Trans Amount|12.A/P Books Amount|13.Adv.Trans Amount|14.Adv.Books Amount|15.Coll.Trans Amount|16.Coll.Books Amount'-->
                                            <td>
                                                <gw:grid id='grdContract' 
                                                    header='No|_PK|Partner|P/L|Contract Date|Contract No|Contract Amount|_Paner_Code|_PL_Code|Issued Date|Booking Ccy|A/P Trans Amount|A/P Books Amount|Adv.Trans Amount|Adv.Books Amount|Coll.Trans Amount|Coll.Books Amount'
                                                    format='0|0|0|0|4|0|0|0|0|4|0|0|0|0|0|0|0'
                                                    aligns='1|0|0|0|1|0|3|0|0|1|1|3|3|3|3|3|3'
                                                    defaults='||||||||||||||||'
                                                   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                    widths='500|0|2000|1000|1300|1500|1700|0|0|1200|1200|2000|2000|2000|2000|2000|2000'
                                                    sorting='T'
                                                    acceptnulldate="T"                              
                                                    styles='width:100%; height:100%'
                                                    oncellclick="onCellClickToGrid()"
                                                  />
                                            </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 60%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="width: 100%;height:100%" border="0">
                   <tr style="width:100%;height:100%" valign="top">
                        <td width="100%">
                            <table style="width:100%" cellpadding="1" cellspacing="9" border="0">
                                <tr>
                                        <td width="35%" align="right">Company </td>
                                        <td width="65%" colspan="3">
                                            <gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All</data>
                                            </gw:list>
                                        </td>
                                        
                                        <td ><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                                        <td ><gw:button id="btnPrint" img="excel"  text="Print" alt="Print Out Report" onclick="onPrint()" /></td>
                                    </tr>
                                    <tr>
                                            <td  width="30%" align="right">Issued Date </td>
                                            <td width="70%" colspan="5">
                                                <table width="100%">
                                                    <tr>
                                                        <td width="30%"><gw:datebox id="dt_Issued"  lang="<%=Session("Lang")%>"  /></td>
                                                        <td style="width:60%" align="right">Contract Date </td>
                                                        <td style="width:30%"><gw:datebox id="dtContract"  lang="<%=Session("Lang")%>" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width:30%">Contract No</td>
                                            <td width="70%" colspan="5"><gw:textbox id="txtContractNo_D" text="" styles="width:100%" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right" width="30%"><a title="Click here to select Booking Currency" onclick="GetDataListbox(1)" href="#tips" style="text-decoration : none; color:#0000FF"><b>Booking Ccy</b></a> </td>
                                            <td width="70%" colspan="5">
                                                <table style="width:100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="50%"><gw:list id="lstBookingCcy" style="width:100%" value="0"  onchange="OnChangeCurrent()"></gw:list></td>
                                                        <td width="25%"><gw:textbox id="txtBookingRate" type="number" text="1" format="#,###,###,###,###R" readonly="true" style="width:100%"/></td>
                                                        <td width="25%"><gw:textbox id="txtTransRate" text="1" type="number" format="#,###,###,###,###R" style="width:100%"/></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>                    
                                        <tr>
                                            <td  align="right" width="30%">A/P Trans Amount </td>
                                            <td colspan="5" width="70%">
                                                <gw:textbox id="txtAPTransAmt" type="number" format="#,###,###,###,###R" style="width:100%"  />
                                            </td> 
                                        </tr>
                                        <tr>
                                            <td  align="right" width="30%">A/P Books Amount </td>
                                            <td  colspan="5"  width="70%"><gw:textbox id="txtAPBooksAmt" type="number" format="#,###,###,###,###R" style="width:100%" /></td>
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="30%">Adv. Trans Amount </td>
                                            <td width="70%" colspan="5">
                                                <gw:textbox id="txtAdvTransAmt" type="number" format="#,###,###,###,###R" style="width:100%" />
                                            </td>                        
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="30%">Adv. Books Amount</td>
                                            <td colspan="5"><gw:textbox type="number" format="#,###,###,###,###R" id="txtAdvBooksAmt" style="width:100%" /></td>
                                           
                                        </tr>
                                        <tr>
                                            <td  align="right" width="30%">Pay Trans Amount</td>
                                            <td width="70%" colspan="5">
                                                <gw:textbox id="txtPaidTransAmt" type="number" format="#,###,###,###,###R" style="width:100%" />
                                            </td>                        
                                            
                                        </tr>
                                        <tr>
                                            <td  align="right" width="30%">Pay Books Amount</td>
                                            <td  width="70%" colspan="5"><gw:textbox id="txtPaidBooksAmt" type="number" format="#,###,###,###,###R" style="width:100%" /></td>
                                            
                                        </tr>
                                        <tr>
                                             <td  align="right" width="30%">Deduct. Books Amount</td>
                                            <td  width="70%" colspan="5"><gw:textbox id="txtDeductBooksAmt" type="number" format="#,###,###,###,###R" style="width:100%" /></td>
                                            
                                        </tr>
                                         <tr>
                                             <td  align="right" width="30%">Deduct. Trans Amount</td>
                                            <td  width="70%" colspan="5"><gw:textbox id="txtDeductTransAmt" type="number" format="#,###,###,###,###R" style="width:100%" /></td>
                                            
                                        </tr>
                            </table>
                        </td>
                   </tr>
                  
                                    
                </table>
                            
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    
  <gw:textbox id="txtComCodeID" styles='width:100%;display:none' />   
<gw:textbox id="txtCodeTemp" styles='width:100%;display:none' />  
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_PK"        styles='display:none'/>
<gw:textbox id="txtProposedByUserPk"        styles='display:none'/>


</body>
</html>
