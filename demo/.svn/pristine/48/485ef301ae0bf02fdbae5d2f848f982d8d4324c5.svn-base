<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Point Scan Summary</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var G_Line_ID   = 0,
    G_Style     = 1,
    G_Size      = 2,
    G_Color     = 3,
    G_Part      = 4, 
    G_Numbering = 5,
    G_Scan_Date = 6,
    G_Round     = 7,
    G_Tag_No    = 8,
    G_Point_ID  = 9,
    G_Scan_Fr_Time = 10,
    G_Scan_To_Time = 11,
    G_AC_TT     = 12,
    G_ST_TT     = 13,
    G_TT_Gap    = 14;
    
//=====================================================================================
function BodyInit()
 {
      //---------------------- 
      //dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));      
      //----------------------
      OnFormatGrid();      
      //----------------------
      OnChangePage();
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
     
    var trl ;
    
    trl = grdDetail.GetGridControl();

    trl.ColFormat(G_AC_TT)  = "###,###,###,###,###";
    trl.ColFormat(G_ST_TT)  = "###,###,###,###,###";
    trl.ColFormat(G_TT_Gap) = "###,###,###,###,###";
        
    grdDetail.GetGridControl().Cell( 7, 0, G_AC_TT,  0, G_AC_TT  ) = 0x3300cc;
    grdDetail.GetGridControl().Cell( 7, 0, G_TT_Gap, 0, G_TT_Gap ) = 0x3300cc;
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                if ( radPage.GetData() == '1' )
                {
                    data_fpps00010.Call("SELECT");   
                }    
                else if ( radPage.GetData() == '2' )
                {
                    data_fpps00010_1.Call("SELECT");
                }  
                else if ( radPage.GetData() == '3' )
                {
                    data_fpps00010_2.Call("SELECT");
                }  
            break;  
            
            case 'Line':
                pro_fpps00010.Call(); 
            break; 
            
            case 'Point':
                pro_fpps00010_1.Call(); 
            break;                       
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fpps00010" :
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G_Line_ID,  grdDetail.rows - 1, G_Line_ID,  true);
                    grdDetail.SetCellBold( 1, G_Point_ID, grdDetail.rows - 1, G_Point_ID, true);
                    
		            grdDetail.SetCellBgColor( 1, G_Style, grdDetail.rows-1, G_Part, 0xCCFFFF ); 
		            grdDetail.SetCellBgColor( 1, G_AC_TT, grdDetail.rows-1, G_AC_TT,  0xCCFFFF );
		            grdDetail.SetCellBgColor( 1, G_TT_Gap, grdDetail.rows-1, G_TT_Gap,  0xCCFFFF );
		            
                                        
                    for ( var i = 1 ; i < grdDetail.rows ; i++)
                    {
                        if ( Number(grdDetail.GetGridData( i, G_TT_Gap)) < 0 )
                        {
                            grdDetail.GetGridControl().Cell( 7, i, G_TT_Gap, i, G_TT_Gap ) = 0x3300cc;
                        }                        
                    }                      
                }

		        lblCount.text = grdDetail.rows-1 + ' s';
            break;  

            case "data_fpps00010_1" :
                if ( grdPointScan.rows > 1 )
                {
                    grdPointScan.SetCellBold( 1, 0,  grdPointScan.rows - 1, 0,  true);
		        }
            break; 
            
            case "pro_fpps00010_3" :
                alert(txtReturnValue.text);
                
                OnSearch('Detail');
            break;                              
      }  
 }
//========================================================================
function OnChangePage()
{
    var strRad = radPage.GetData();
             
	switch (strRad)
	{
		case '1':
		    page1.style.color = "cc0000"; 
		    page2.style.color = "";
		    page3.style.color = "";  
		    
		    grdDetail.style.display    = "";		     
		    grdPointScan.style.display = "none";
		    grdScanlog.style.display   = "none";
        break;
        
        case '2':
		    page1.style.color = ""; 
		    page2.style.color = "cc0000";
		    page3.style.color = "";
		    		    		    
		    grdDetail.style.display    = "none";
		    grdPointScan.style.display = ""; 
		    grdScanlog.style.display   = "none";	    		    		    
        break;	
        
        case '3':
		    page1.style.color = ""; 
		    page2.style.color = "";
		    page3.style.color = "cc0000";
		    		    		    
		    grdDetail.style.display    = "none";
		    grdPointScan.style.display = "none"; 
		    grdScanlog.style.display   = "";	    		    		    
        break;	        
    } 
}

//=====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'RESET':
            if ( confirm("Do you want to reset data ? "))
            {
                pro_fpps00010_3.Call();
            }    
        break;
    }
}
//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00010" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpps00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpps00010_1" > 
                <input>
                    <input bind="lstLine" /> 
                </input> 
                <output>
                    <output bind="lstPoint" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpps00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpps00010_3" > 
                <input>
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpps00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="" function="<%=l_user%>lg_sel_fpps00010"   > 
                <input> 
                    <input bind="lstFactory" /> 
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="txtTagNo" />
                    <input bind="txtNumbering" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpps00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="" function="<%=l_user%>lg_sel_fpps00010_1"   > 
                <input> 
                    <input bind="lstFactory" /> 
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="txtTagNo" />
                    <input bind="txtNumbering" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdPointScan" /> 
            </dso> 
        </xml> 
    </gw:data>
   <!------------------------------------------------------------------>
    <gw:data id="data_fpps00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="" function="<%=l_user%>lg_sel_fpps00010_2"   > 
                <input>  
                    <input bind="lstLine" />
                    <input bind="lstPoint" />
                    <input bind="txtTagNo" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdScanlog" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%; background-color: CCFFFF">
                    <tr>
                        <td style="width: 5%" align="left">
                            Fac
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch('Line')" />
                        </td>
                        <td style="width: 5%" align="left">
                            Line
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstLine" styles='width:100%' onchange="OnSearch('Point')" />
                        </td>
                        <td style="width: 5%" align="left">
                            Point
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstPoint" styles='width:100%' />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 19%" align="center">
                            <gw:icon id="btnLoadData" img="1" text="Load Data" onclick="OnProcess('RESET')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Tag No
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:textbox id="txtTagNo" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Numbering
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:textbox id="txtNumbering" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="left">
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 5%" align="left">
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                        </td>
                        <td style="width: 19%; white-space: nowrap" align="left" colspan="2">
                            <gw:radio id="radPage" value="1" styles="width:100%" onchange="OnChangePage()">                      
                                <span value="1" id="page1">Tact Time</span>                       
                                <span value="2" id="page2">Point Scan</span>
                                <span value="3" id="page3">Scan Log</span>		                                
                            </gw:radio>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='Line ID|Style|Size|Color|_Part|_Numbering|Scan Date|Round|Tag No|Point ID|Fr Time|To Time|AC TT|ST TT|Gap'
                    format='0|0|0|0|0|0|4|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|1|1|1|1|1|1|3|3|3'
                    check='||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1200|2500|1200|1200|1200|1200|1200|1000|1200|1000|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
                <gw:grid id='grdPointScan' header='Tag|PIN|P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|PQC'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    check='|||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
                <gw:grid id='grdScanlog' 
                    header='Line ID|Style|Size|Color|Scan Date|Tag No|Point ID|Fr Time|To Time|Tact Time'
                    format='0|0|0|0|4|0|0|0|0|0' 
                    aligns='0|0|0|0|1|1|1|1|1|3'
                    editcol='0|0|0|0|0|0|0|0|0|0' widths='1200|2500|1200|1200|1200|1200|1200|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
