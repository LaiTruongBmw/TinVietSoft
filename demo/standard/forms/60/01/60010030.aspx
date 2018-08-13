<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

var vnt_Click = true;
var vnt_RefreshNode = null;
var vnt_Change = true;
var Insert      = 'F';

 function BodyInit()
 {   
    System.Translate(document);
    BindingDataList();
   txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
         
     
 }
function BindingDataList()
{   
    var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>"; 
    lst_TCO_COMPANY_PK.SetDataText(ls_data);
    lst_TCO_COMPANY_PK_L.SetDataText(ls_data);
    //OnSearch();
}
function OnSearch()    
{
    DSO_Sel_Tree_ABCenter.Call("SELECT");
}
function OnTreeClick()
{
	DSO_Grid_Plcenter_List.StatusInsert();
	var obj = event.srcElement.GetCurrentNode();
	txt_PLC_PK.SetDataText( obj.oid );	
	vnt_Click = true;	
	DSO_Grid_PL_Info.Call("SELECT");
}
function OnEnter()
{	
	vnt_Click = false;
	DSO_Grid_PL_Info.Call("SELECT");
}
function OnSelect()
{
    var ctrl = idGridInfo.GetGridControl();        
    if(idGridInfo.rows >1)
    {
        var i = 1;
        var lb_flag = false;
        while ((i < idGridInfo.rows) && (!lb_flag))
        {
            if (idGridInfo.GetGridData(i , 2) == -1)
            {
                lb_flag = true;
            }
            i = i + 1;
        }
        if (!lb_flag)
        {
            alert("Please Select PL Code Before Adding!!!")
            return;
        }
    }
    else
    {
        alert("Nothing To Add!!!")
        return; 
    }           
    if(idGridInfo.GetGridData(1,7)=="")
    {
        alert("Please select PL Center first ... " + '\n' + "Vui lòng chọn PL Center trước  ...");
        return;
    }    
    var lrow = idGridUse.rows - 1;
    for ( var i=1 ; i< idGridInfo.rows ; i++ )
	{   
        if (idGridInfo.GetGridData(i , 2) == -1)
        {		   
		    lrow = lrow + 1;
		    idGridUse.AddRow();
		    idGridUse.SetGridText(lrow, 1, idGridInfo.GetGridData(i , 1));      //TAC_ABPL_PK
		    idGridUse.SetGridText(lrow, 2, idGridInfo.GetGridData(i , 7));      //ABCENTER_PK
		    idGridUse.SetGridText(lrow, 3, idGridInfo.GetGridData(i , 3));      //PL_CD
		    idGridUse.SetGridText(lrow, 4, idGridInfo.GetGridData(i , 4));      //PL_NM
		    idGridUse.SetGridText(lrow, 5, '');      //REMARK
			idGridUse.SetGridText(lrow, 6, idGridInfo.GetGridData(i , 8));      //PLC_NM
			idGridUse.SetGridText(lrow, 7, idGridInfo.GetGridData(i , 9));      //PLC_NM
		    idGridInfo.RemoveRowAt(i);
		    i = i - 1;
		}
	}	
}
function OnSave()
{
    DSO_Grid_Plcenter_List.Call();
}
function OnDelete()
{
    if ( confirm( "Delete it?" ))
	{
		vnt_Click=false;
		idGridUse.DeleteRow();		
	}
}
function OnCheck()
{    
    if(idGridInfo.rows > 1)
    {
        if(chk_All.GetData()== "Y")
        {           
            for (i=1; i<idGridInfo.rows; i++)
            {
                idGridInfo.SetGridText(i, 2, -1);
            }
        }
        else if (chk_All.GetData() == "N")
        {
            for (i=1; i<idGridInfo.rows; i++)
            {
                idGridInfo.SetGridText(i, 2, 0);
            }
        }
    }
    else
    {
        alert("Nothing To Select All!!!");
        chk_All.SetDataText('N');
        return;
    } 
}
//-------------------------------------- Tab : PL Center List ----------------------------------------
function OnSearch_List()
{
    DSO_Grid_PLC_List.Call("SELECT");
}
function Numbers(e)
{
     
    var keynum;
    var keychar;
    var numcheck;
    keynum =event.keyCode;
  
    if(window.event) // IE
     {
     	keynum = e.keyCode;
     }
    else if(e.which) // Netscape/Firefox/Opera
    {
    	keynum = e.which;
    }
    keychar = String.fromCharCode(keynum);
    numcheck = /\d/;
    return numcheck.test(keychar);
}
function OnChangeTab()
{   
    var icurpage=tabMain.GetCurrentPageNo();
    
    switch(icurpage)
    {               
        case 0:
            vnt_Change==true;
        break;
        case 1:
            if(vnt_Change==true)
            {     
                vnt_Change=false
                OnSearch_List();
            }
        break;
    }
}

function OnDataReceive(p_oData)
{     
    if(p_oData.id == "dso_getCompany")
    {
        dso_getCompany_2.Call();
        
    }
    if(p_oData.id == "dso_getCompany_2")
    {   
        OnSearch();
    }
    if(p_oData.id == "DSO_Sel_Tree_ABCenter")
    {     
       
    }    
    if(p_oData.id == "DSO_Grid_PL_Info")
    {               
        if(vnt_Click==true)
        {
            DSO_Grid_Plcenter_List.Call("SELECT");
        }        
    }
    if(p_oData.id == "DSO_Grid_Plcenter_List")
    {   
        if(vnt_Click==false)
        {            
            DSO_Grid_PL_Info.Call("SELECT");
        }
    }
    if(p_oData.id == "DSO_Grid_PLC_List")
    {
        lblRecord.text=idGridList.rows-1 + " record(s).";
    } 
    
}    

</script>
 
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_all" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lst_TCO_COMPANY_PK"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="dso_getCompany_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_all" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lst_TCO_COMPANY_PK_L"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="DSO_Sel_Tree_ABCenter" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="tree" parameter="0,1,2" function="AC_SEL_60010020_ABCENTER_TREE">
                <input bind="oTreePLC" >
                    <input bind="lst_TCO_COMPANY_PK"/>
                    <input bind="txt_SPLC_CD"/>
                    <input bind="txt_SPLC_NM"/>
                </input>
                <output bind="oTreePLC" />
            </dso>
        </xml>
</gw:data>      

<gw:data id="DSO_Grid_PL_Info"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_SEL_60010030_ABPLC_INFO">
            <input bind="idGridInfo" >                    
                <input bind="lst_TCO_COMPANY_PK" />
                <input bind="txt_PLC_PK" />
                <input bind="txt_PL_CD" />
                <input bind="txt_PL_NM" />
            </input>
            <output bind="idGridInfo" />
        </dso>                    
    </xml>
</gw:data>         


<gw:data id="DSO_Grid_Plcenter_List"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_SEL_60010030_PLCL_INFO" procedure="ac_upd_60010030_plcl_info">
            <input bind="idGridUse" >  
                <input bind="txt_PLC_PK" />              
            </input>
            <output bind="idGridUse" />
        </dso>                    
    </xml>
</gw:data>

<gw:data id="DSO_Grid_PLC_List"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_SEL_60010030_PLCL_LIST">
            <input bind="idGridList" >  
                <input bind="lst_TCO_COMPANY_PK_L" />
                <input bind="txt_PL_CD_L" />
                <input bind="txt_PL_NM_L" />              
                <input bind="txt_PLC_CD_L" />
                <input bind="txt_PLC_NM_L" />
            </input>
            <output bind="idGridList" />
        </dso>                    
    </xml>
</gw:data>
    
<!------------------------ Main Table -------------------------->    

<gw:tab id="tabMain"  border=1 style="width:100%;height:100%" onpageactivate="" onclick ="OnChangeTab()"> 	
<form name="Change Cost Center" id="form1" >
<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
<tr valign="top" style="height:100%">    
    <td style="width:25%" align ="top">
        <table width="100%" align="top">
            <tr>
                <td width="10%" align="right">Company</td>
	            <td width="10%" align="left"  valign="top">
	                <gw:list id="lst_TCO_COMPANY_PK" value="" styles="width:100%" onchange="OnSearch()" ></gw:list></td>
            </tr>
            <tr>
                <td width="10%" align="right">Biz. Center Code</td>
	            <td width="10%" align="left"  valign="top">
	                <gw:textbox id="txt_SPLC_CD"  text=""  styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" /></td>
            </tr>
            <tr>
                <td width="10%" align="right">Biz. Center Name</td>
	            <td width="10%" align="left"  valign="top"><gw:textbox id="txt_SPLC_NM"  text=""  styles="width:100%" csstype="mandatory" onenterkey="OnSearch()"/></td>
            </tr>
            <tr>
                <td colspan=2><gw:tree  id="oTreePLC" style="width:100%;height:400;overflow:auto;" onclicknode="OnTreeClick()" ></gw:tree></td>
            </tr>
        </table>
    </td>
    
    <td style="width:75%;height=100%" align ="top" >
        <table style="width:100%;height:50%"  align="top" border=0>
            <tr valign="top" style="width:100%;height:10%">
                <td>
                    <table width="100%">
                        <tr>
                            <td width="15%" align="right">Cost Center Code </td>
	                        <td width="15%" align="left"><gw:textbox id="txt_PL_CD"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
	                        <td width="15%" align="right">Cost Center Name </td>
	                        <td width="15%" align="left"><gw:textbox id="txt_PL_NM"  text=""  styles="width:100%" onenterkey="OnEnter()"/></td>
	                        <td width="15%" align="center">Check All<gw:checkbox id="chk_All"  value="N" defaultvalue="Y|N" onclick="OnCheck()"/></td>
                        </tr>                                             
                    </table>
                </td>
            </tr>
            <tr>
                <td align = top >		            
		            <gw:grid   
			            id="idGridInfo"  
			            header   = "_P_PK|_PK|Check|Cost Center Code|Cost Center Name|Cost Center LName|Cost Center KName|_PK|_Code|_Name"
			            format   = "0|0|3|0|0|0|0|0|0|0"
			            aligns   = "0|0|1|0|0|0|0|0|0|0"
			            defaults = "||||||||||" 
			            editcol  = "0|0|1|0|0|0|0|0|0|0"   
			            widths   = "0|0|1000|2000|2000|2000|2000|0|0|0"
			            styles   = "width:100%; height:100%"   
			            sorting  = "T"
			            param    = "0,1,2,3,4,5,6,7,8,9"/> 
	            </td>
            </tr>            
        </table>
        <table style="width:100%;height:50%"  align="top" border=0>
            <tr valign="top" style="width:100%;height:10%">
                <td>
                    <table width="100%">
                        <tr>
                            <td width="35%" align="right"><b>&nbsp;</b></td>
                            <td width="2%"><gw:imgBtn img="selectall"  alt="Save"    id="idBtnSelect" 	styles="width:100%" onclick="OnSelect()" /></td>
	                        <td width="2%"><gw:imgBtn img="save"       alt="Save"    id="idBtnUpdate" 	styles="width:100%" onclick="OnSave()" /></td>
			                <td width="2%"><gw:imgBtn img="delete"     alt="Delete"  id="idBtnDelete" 	styles="width:100%" onclick="OnDelete()" /></td> 
			                <td width="35%" align="right"><b>&nbsp;</b></td>
                        </tr>                                             
                    </table>
                </td>
            </tr>
            <tr>
                <td align = top >		            
		            <gw:grid   
			            id="idGridUse"  
			            header   = "_PK|_ABPL_PK|_ABCENTER_PK|Cost Center Code|Cost Center Name|Remark|Biz. Center Code|Biz. Center Name"
			            format   = "0|0|0|0|0|0|0|0"
			            aligns   = "0|0|0|0|0|0|0|0"
			            defaults = "|||||||"
			            editcol  = "0|0|0|0|0|1|0|0"   
			            widths   = "0|0|0|2000|2000|2500|1500|2500"
			            styles   = "width:100%; height:100%"   
			            sorting  = "T"
			            param    = "0,1,2,3,4,5,6,7"  /> 
	            </td>
            </tr>            
        </table>
    </td>
</tr>    
</table>
</form>

<form name="Cost Center List" id="form3" >
<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
    <tr valign="top">
        <td>
            <table width="100%">
                <tr>
                    <td width="10%" align="right">Company</td>
	                <td width="10%" align="left"  valign="top">
	                    <gw:list id="lst_TCO_COMPANY_PK_L" value="" styles="width:100%" onchange="OnSearch_List()" ></gw:list></td>
                    <td width="8%" align="right">Cost Center Code</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PL_CD_L"  text=""  styles="width:100%" onenterkey="OnSearch_List()"/></td>
                    <td width="8%" align="right">Cost Center Name</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PL_NM_L"  text=""  styles="width:100%"onenterkey="OnSearch_List()" /></td>
                    <td width="8%" align="right">Biz. Center Code</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PLC_CD_L"  text=""  styles="width:100%" onenterkey="OnSearch_List()"/></td>
                    <td width="8%" align="right">Biz. Center Name</td>
                    <td width="8%" align="left"><gw:textbox id="txt_PLC_NM_L"  text=""  styles="width:100%"onenterkey="OnSearch_List()" /></td>
                    <td width="10%" align="center" ><gw:label id="lblRecord"   text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight:bold" /></td>
                </tr>
            </table>
        </td> 
    </tr>
    
    <tr>
        <td align = top  height="100%" border="1">
		    <gw:grid   
			    id="idGridList"  
			    header   = "Cost Center Code|Cost Center Name|Biz. Center Code|Biz. Center Name"
			    format   = "0|0|0|0"
			    aligns   = "0|0|0|0"
			    defaults = "|||||" 
			    editcol  = "0|0|0|0"   
			    widths   = "2000|2000|2000|0"
			    styles   = "width:100%; height:100%"   
			    sorting  = "T"
			    param    = "0,1,2,3"  /> 
	    </td>
    </tr>    
</table>
</form>
</gw:tab>
    <gw:textbox id="txt_PLC_PK"                 style="display:none"/>
    <gw:textbox id="txt_PLC_P_PK"               style="display:none"/>
    <gw:textbox id="txt_Temp_PLC_P_PK"          style="display:none"/>
    <gw:textbox id="txt_Temp_Dept_PK"           style="display:none"/>  
    <gw:textbox id="txt_Temp_PLC_P_CD"          style="display:none"/>  
    
    <gw:textbox id="txt_CheckCode"                  style="display:none"/> 
    <gw:textbox id="txt_CheckName"                  style="display:none"/> 
    <gw:textbox id="txt_CheckChild"                 style="display:none"/>  
  <gw:textbox id="txtAc_level" styles='display:none' />
         <gw:textbox id="txtSesion_company" styles='display:none' />
         <gw:textbox id="txtUser_Pk"  styles='display:none' />
</body>

</html>