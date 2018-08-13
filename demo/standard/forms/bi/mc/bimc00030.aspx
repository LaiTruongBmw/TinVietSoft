<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>W/H Closing History</title>
</head>

<script type="text/javascript">
 
var G1_SEQ	   = 0,
    G1_PK	   = 1,
    G1_WH_PK   = 2,
    G1_WH_ID   = 3,
    G1_WH_NAME = 4,
    G1_STATUS  = 5,    
    G1_REMARK  = 6;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------
	
    FormatGrid();
	
    OnSearch('1');
 }
 //===============================================================

 function FormatGrid()
 {
    var  data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_id  ASC" )%>||";    
    lstWarehouse.SetDataText(data);
    lstWarehouse.value = '';
    
    data = "DATA|1|APPROVED|2|CANCEL|3|LOAD ENDING|4|RELEASE||"; //status type
    lstStatus.SetDataText(data);
    lstStatus.value = '';
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case '1':
            data_bimc00040.Call("SELECT");
        break;
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bimc00040' :
            
            	lbStatus.text = (grdClosingHist.rows -1) + ' record(s)';
				
			    if ( grdClosingHist.rows > 1 )
		        { 
                    grdClosingHist.SetCellBold( 1, G1_WH_ID, grdClosingHist.rows - 1, G1_WH_ID, true);			                                        
		        }    
            break;  
			
			default:
			break;   	            
      }	 
 }
 
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bimc00040" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bimc00030" > 
                <input bind="grdClosingHist" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />   
                    <input bind="lstWarehouse" />                                 
                    <input bind="lstStatus" />
                </input>
                <output bind="grdClosingHist" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('1')" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('1')" />
                        </td>
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstWarehouse" styles='width:100%' onchange="OnSearch('1')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Status
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:list id="lstStatus" styles='width:100%;' />
                        </td>
                        <td align="center" style="white-space: nowrap; width: 24%">
                            <gw:label id="lbStatus" styles='width:100%;color:#cc0000;font:9pt;align:center' text='0 record(s)' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('1')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%">
                <gw:grid id='grdClosingHist' header='Seq|_PK|_WH_PK|W/H ID|W/H Name|Stock Date|Status|Remark'
                    format='0|0|0|0|0|4|0|0' 
					aligns='1|0|0|1|0|1|1|0' 
					check='|||||||' 
					editcol='0|0|0|0|0|0|0|0'
                    widths='800|0|0|1500|3000|1200|1500|1000' sorting='T' 
                    defaults='|||||||' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
