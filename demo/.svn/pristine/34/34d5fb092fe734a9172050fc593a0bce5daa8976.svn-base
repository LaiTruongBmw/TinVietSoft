<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>ALLOCATION INQUIRY</title>
</head>

<script type="text/javascript" language="javascript">

var G2_MON       = 0,
    G2_tac_costing_itemgrp_PK    = 1,
	G2_PROD_GROUP_ID  = 2, 
    G2_GROUP_NM    = 3, 
    G2_R1         = 4,
    G2_R2         = 5,
    G2_R3       = 6,
    G2_R4       = 7,
    G2_R5       = 8,
    G2_R6       = 9,
    G2_R7       = 10,
    G2_R8       = 11,
    G2_R9       = 12,
    G2_R10       = 13,
    G2_R11       = 14,
    G2_R12       = 15,
    G2_R13       = 16,
    G2_R14       = 17,
    G2_R15       = 18;
        
var GT_NM   = 0;
//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    //----------------------------
     var ctrl = grdRatio.GetGridControl();        
    ctrl.ColFormat(G2_R1)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R2)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R3)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R4)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R5)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R6)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R7)    = "###,###,###.####R" ;
   /* ctrl.ColFormat(G2_R8)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R9)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R10)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R11)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R12)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R13)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R14)    = "###,###,###.####R" ;
    ctrl.ColFormat(G2_R15)    = "###,###,###.####R" ;*/
    
    data_kbal00020_1.Call("SELECT");  
}

//--------------------------------------------------------------------------------------------------
function OnPopUp()
{

     var path = System.RootURL + '/standard/forms/60/17/60170330.aspx?p_month=' +dtMonth.value+'&group_id='+ grdRatio.GetGridData(grdRatio.row,2);// + '&p_item_cd='+grdRatio.GetGridData(grdRatio.row,G2_ITEM_CD);
     var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
         OnSearch();  
		
} 
//-------------------------------------------------------------------------------------
function OnSearch()
{
    data_kbal00020_1.Call("SELECT");   
           
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {   
         case "data_kbal00020_1":
		 
             for(var i =1; i<grdHead.rows; i++)	
             {
                grdRatio.GetGridControl().ColHidden(G2_GROUP_NM+i) = false;
                grdRatio.SetGridText(0,G2_GROUP_NM+i,grdHead.GetGridData(i,GT_NM));
             } 
             for (var j = grdHead.rows + 3 ; j <= grdRatio.cols - 1; j++)
             {
                grdRatio.GetGridControl().ColHidden(j) = true;
             }
             data_kbal00020.Call("SELECT");    
         break; 
		 case "data_kbal00020":
			lblRecord.text = (grdRatio.rows -1) + ' record(s).';
		 break;
        
    }
}

    function onReport() {
        var url;
        url = System.RootURL + '/standard/reports/60/17/rpt_60170340.aspx?p_Month=' + dtMonth.value;
        url += "&p_GroupID=" + txtGroupID.text;
        url += "&p_Biz=" + lstBiz.value;
        window.open(url);
    }
//=====================================================================================================================


//====================================================================================
    
</script>

<body>
     <!------------------------------------------------------------------>
    <gw:data id="data_kbal00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170340_ratio_1"  > 
                <input>
                    <input bind="dtMonth" /> 
                </input> 
                <output bind="grdHead" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------lg_sel_kbal00020------------>
    <gw:data id="data_kbal00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170340_ratio"  > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="txtGroupID" />   
					<input bind="lstBiz" />  					
                </input> 
                <output bind="grdRatio" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="0" style="width: 100%; height: 100%">
        <tr style="height: 5%">           
             <td style="width: 5%" align="right" >
                Month
            </td>
            <td style="width: 20%">
                <gw:datebox id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  type="month" onchange="OnSearch('grdRatio')"/>
            </td>
			 <td style="width: 5%; white-space: nowrap" align="right">
                Biz Center
            </td>
            <td style="width: 15%; white-space: nowrap">
                <gw:list id="lstBiz"  onchange="OnSearch('grdWipMaster')" maxlen = "100" styles='width:100%' >
					<data><%=CtlLib.SetListDataSQL("SELECT A.PK, A.plc_cd||'-'||A.PLC_NM FROM TAC_ABCENTER A WHERE A.DEL_IF = 0 AND A.PLC_TYPE = '01'" )%></data>
				</gw:list>
            </td>
             <td style="width: 10%" align="right">
                Prod
            </td>
             <td style="width: 30%" align="left">
                <gw:textbox id="txtGroupID" text="" styles="color:red"  onenterkey="OnSearch()" />
            </td>
            <td style="width: 30%">
               <gw:label id="lblRecord" text="" styles="color:red"  />
            </td>                       
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnExcel" img="Excel" alt="Excel" text="Export" onclick="onReport()" />
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="9">
                <gw:grid id='grdRatio'
                    header='_ALLOC_MONTH|_tac_costing_itemgrp_PK|PROD GROUP ID|Group Name|R1|R2|R3|R4|R5|R6|R7|R8|R9|R10|R11|R12|R3|R14|R15|R16|R17'
                    format='0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='||||||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000'
                    sorting='T'
                    autosize='F' 
                    styles='width:100%; height:100%'
                    oncelldblclick="OnPopUp()"
                    />
            </td>
			
			
        </tr>
    </table>
</body>
<gw:grid id='grdHead'
            header='GRD_NM'
            format='0'
            aligns='0'
            check='|'
            editcol='0'
            widths='0'
            sorting='T'
            autosize='T' 
           styles='width:100%; height:100%;display:none'
            />
			
<gw:textbox id="txtSTItemPK" text="" style="display: none" />
<!------------------- -------------------------------------------------------->
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
</html>
