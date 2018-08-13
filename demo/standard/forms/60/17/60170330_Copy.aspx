<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
%>
<head>
    <title>ALLOCATION RATIO</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK = 0,
    G1_CD = 1,
    G1_NM = 2 ; 

var G2_ALLOC_RATIO_PK       = 0,
    G2_SEQ                  = 1,
    G2_TAC_ABTRACGRP_PK     = 2, 
    G2_GRP_NM               = 3,
    G2_RATIO                = 4,
    G2_TCO_STITEM_PK        = 5,
    G2_MONTH                = 6,
    G2_REMARK               = 7;
//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    
    var ctrl = grdRatio.GetGridControl();        
    ctrl.ColFormat(G2_RATIO)    = "###,###,###.####R" ;
    //----------------------------
    lst_60170330_4.Call();
}

function OnClickItem()
{
    if(grdSTitem.row >0)
    {
     txtSTItemPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
     txtSTCode.text = grdSTitem.GetGridData( grdSTitem.row, G1_CD );
     txtSTName.text = grdSTitem.GetGridData( grdSTitem.row, G1_NM );
    }
    OnSearch('grdRatio');
                 
}
//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSTitem':
            data_60170330.Call("SELECT");
        break;
        
        case 'grdRatio': 
             
              if(txtSTItemPK.text == "")
            {     
                alert("Please, Select an Item! ")                                          
            }else
            {
                data_60170330_1.Call("SELECT");   
            }
              
        break;        
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_60170330_1":
         
        break; 
            
         case "lst_60170330_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
           // cboCompanyList.value = "<%=session("COMPANY_PK")%>";
            lst_60170330_5.Call();
          break; 
          case "pro_60170330":
            alert(txtReturnValue.text);
            OnSearch('grdRatio');
          break;
        
    }
}

function Validate()
{   
   return true;
}

//====================================================================================

function OnSave()
{ 
    for(var i =0 ; i<grdRatio.rows; i++)
    {
        if(grdRatio.GetGridData(i,G2_ALLOC_RATIO_PK) =="")
        {
            grdRatio.SetRowStatus(i,32);
        }
    }             
    flag='save';
    data_60170330_1.Call();                

}

//====================================================================================
function OnProcess()
{
    if(txtSTItemPK.text != "")
    {     
         pro_60170330.Call()
    }
}

//====================================================================================
 function OnDelete(index)
 {     
    if(confirm("Do you want to delete this data?"))  
    { 
        grdRatio.DeleteRow();
        OnSave();
    }
 }
//====================================================================================
 
function OnUnDelete()
{              
    
}

//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      
}
//====================================================================================
    
</script>

<body>
  
     <!------------------------------------------------------------------>
    <gw:data id="lst_60170330_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60170330_4" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="lst_60170330_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60170330_5" > 
                <input> 
                    <input bind="cboCompanyList" />
                </input>
	           <output>
	                <output bind="cboGroupQuery" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_60170330" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="ac_sel_60170330" > 
                <input>
                    <input bind="cboCompanyList" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" />                   
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!----------------------------auto-insert---------------------------------------->
    <gw:data id="pro_60170330" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170330" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="txtSTItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_60170330_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7" function="ac_sel_60170330_1"  procedure="ac_upd_60170330_1"  > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="txtSTItemPK" />                  
                </input> 
                <output bind="grdRatio" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="lst_60170330_5.Call()"  />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Prod
                        </td>
                        <td style="width: 79%" >
                            <gw:textbox id="txtSTitemQuery" styles="width:100%" onenterkey="OnSearch('grdSTitem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
                    </tr>                   
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSTitem" header="_PK|Prod Group ID|Group Name" format="0|0|0" aligns="0|0|0" defaults="||"
                                editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
                                param="0,1,2" oncellclick="OnClickItem()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                         <td style="width: 10%">
                            Month
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
                        </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="btnProcess" img="process" alt="Auto Get Ratio" text="Process" onclick="OnProcess()" />
                        </td>
                         <td style="width: 28%" align="right">
                            <gw:label id="txtSTCode" text="" styles="color:red" readonly="true" />
                        </td>
                        <td style="width: 30%">
                            <gw:label id="txtSTName" text="" styles="color:red" readonly="true" />
                        </td>                       
                        <td style="width:9%"> 
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="8">
                            <gw:grid id='grdRatio'
                                header='_ALLOC_RATIO_PK|Seq|_TAC_ABTRACGRP_PK|Manufacturing Cost Type|Index|_P_TLG_IT_STITEM_PK|_P_MONTH|Remark'
                                format='0|0|0|0|1|0|0|0'
                                aligns='0|0|0|0|0|0|0|0'
                                check='|||||||'
                                editcol='1|1|1|1|1|1|1|1'
                                widths='0|1000|0|2500|1500|0|0|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtSTItemPK" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
</html>
