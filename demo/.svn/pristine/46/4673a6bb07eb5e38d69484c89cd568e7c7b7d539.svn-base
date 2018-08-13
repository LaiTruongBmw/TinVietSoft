<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser("SALE")
    Dim l_user As String
    l_user = "sale."
%>
<head>
    <title>CHECK LIST SUMMARY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;
      
    
var G2_MEMBER_PK	= 0,	 
	G2_ZONE         = 1,	
    G2_TEAM         = 2,	     
    G2_MEMBER_NO    = 3,
	G2_MEMBER_SIZE	= 4,
	G2_LENGTH		= 5,
    G2_QTY          = 6,
    G2_WT           = 7,
    G2_DWG_NO       = 8,
	G2_PROCESS		= 9,
	G2_RE_DATE		= 10,
    G2_DAY00        = 11,
    G2_DAY01        = 12,      
    G2_DAY02        = 13,
    G2_DAY03        = 14,
	G2_DAY04		= 15,
	G2_DAY05		= 16,
	G2_DAY06		= 17,
	G2_DAY07		= 18,
	G2_DAY08		= 19,
	G2_DAY09		= 20,
    G2_DAY10        = 21,
    G2_DAY11        = 22,
	G2_DAY12		= 23,	
	G2_DAY13		= 24,
    G2_DAY14        = 25,
    G2_DAY15        = 26;
	
var arr_FormatNumber = new Array();   	
  //------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	OnFormatGrid();	
    //---------------------------- 
	txtProjectPK.text   = "<%=Request.querystring("p_project_pk")%>";
	txtProjectName.text = "<%=Request.querystring("p_project_name")%>";
	
	pro_fpfa00535_1.Call();
 	
}

 //==================================================================================
 function OnFormatGrid()
 {
	var data = "data|10|FABRICATION";	
	lstProcess.SetDataText(data); 
	
	var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G2_DAY00) = "#,###,###,###.##";
    ctr.ColFormat(G2_DAY01) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY02) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY03) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY04) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY05) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY06) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY07) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY08) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY09) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY10) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY11) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY12) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY13) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY14) = "#,###,###,###.##";
	ctr.ColFormat(G2_DAY15) = "#,###,###,###.##";
	
	arr_FormatNumber[G2_DAY00] = 2;
    arr_FormatNumber[G2_DAY01] = 2;
	arr_FormatNumber[G2_DAY02] = 2;
	arr_FormatNumber[G2_DAY03] = 2;
	arr_FormatNumber[G2_DAY04] = 2;
	arr_FormatNumber[G2_DAY05] = 2;
	arr_FormatNumber[G2_DAY06] = 2;
	arr_FormatNumber[G2_DAY07] = 2;
	arr_FormatNumber[G2_DAY08] = 2;
	arr_FormatNumber[G2_DAY09] = 2;
	arr_FormatNumber[G2_DAY10] = 2;
	arr_FormatNumber[G2_DAY11] = 2;
	arr_FormatNumber[G2_DAY12] = 2;
	arr_FormatNumber[G2_DAY13] = 2;
	arr_FormatNumber[G2_DAY14] = 2;	
	arr_FormatNumber[G2_DAY15] = 2;	
 }
  
 //==================================================================================
 function OnPopUp(obj)
 {
    switch(obj)
        { 
			case 'DAILY_RESULT':
                var fpath  = System.RootURL + "/form/fp/fa/fpfa00535.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
				
                if ( oValue != null )
                {
                    txtProjectPK.text   = oValue[0];
                    txtProjectCode.text = oValue[1];
                    txtProjectName.text = oValue[2];
					
					pro_fpfa00535_1.Call();
                }
            break; 			
       }
 }
 
//==================================================================================
function OnReport(para01,para02)
{
	 	
    switch(para01)
    {								
        case '0':
            var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00470.aspx?master_pk=' + txtMasterPK.text ;
	        System.OpenTargetPage(url);  
        break;
 
    }
}
//==================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        
        case 'grdDetail':  
			 
			//--------------          
            data_fpfa00535_2.Call("SELECT");
        break;
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {            
        case "data_fpfa00535_2":
            if ( grdDetail.rows > 1 )
            {
				 /*grdDetail.SetCellBgColor( 1, G2_AC_DWG_NO,grdDetail.rows-1, G2_AC_DWG_NO,0x99FFFF );
                 grdDetail.SetCellBgColor( 1, G2_AC_WELD,  grdDetail.rows-1, G2_AC_WELD,  0x99FFFF );  
                 grdDetail.SetCellBgColor( 1, G2_AC_INSP,  grdDetail.rows-1, G2_AC_INSP,  0x99FFFF );  
                 
                 grdDetail.SetCellBgColor( 1, G2_AC_PACK,  grdDetail.rows-1, G2_AC_PACK,  0x99FFFF );  
                 grdDetail.SetCellBgColor( 1, G2_AC_DELI,  grdDetail.rows-1, G2_AC_DELI,  0x99FFFF );
				 
				 grdDetail.SetCellBgColor( 1, G2_ASSEMBLY,          grdDetail.rows-1, G2_ASSEMBLY,          0xCCFFFF );
				 grdDetail.SetCellBgColor( 1, G2_OUTSOURCE_DELI,    grdDetail.rows-1, G2_OUTSOURCE_DELI,    0xCCFFFF ); 
                 grdDetail.SetCellBgColor( 1, G2_OUTSOURCE_RECEIVE, grdDetail.rows-1, G2_OUTSOURCE_RECEIVE, 0xCCFFFF ); 
				 
				 grdDetail.SetCellBgColor( 1, G2_TRANS_PAINT, grdDetail.rows-1, G2_TRANS_PAINT, 0xFFFF99 ); 
                 grdDetail.SetCellBgColor( 1, G2_FINAL_INSP,  grdDetail.rows-1, G2_FINAL_INSP,  0xFFFF99 );	*/			 				         				                 
            }
                       
        break;       
    }
}
   
  //======================================================================
  
  function OnSave()
  {
  		if ( confirm ("Do you want to save ?") )
		{			
			data_fpfa00535_2.Call();
		}
  }   
  
 //======================================================================   

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row; 		
    
    if ( col >= G2_DAY00 && col <= G2_DAY15 )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {                
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }          
    }
}	
 //======================================================================     
</script>

<body>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpfa00535_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="<%=l_user%>lg_sel_fpfa00535_2" procedure="<%=l_user%>lg_upd_fpfa00535_2">
				<input	bind="grdDetail">					
					<input	bind="txtProjectPK"	/>	
					<input	bind="lstItemName"	/>	
					<input	bind="lstProcess"	/>	
					<input	bind="txtFabTeam"	/>						
					<input	bind="txtMember"	/>
					<input  bind="dtReDate" />	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>	 
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfa00535_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpfa00535_1" >
                <input>
                    <input bind="txtProjectPK" />
                </input>
                <output>
                    <output bind="lstItemName" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="white-space: nowrap; width: 5%" align="right">
                Project
            </td>
            <td style="white-space: nowrap; width: 40%">
                <gw:textbox id="txtProjectPK" styles="display:none" />                
                <gw:textbox id="txtProjectName" styles="width:100%" />
            </td>
            
            <td style="white-space: nowrap; width: 5%" align="right">
                Fab. Team
            </td>
            <td style="white-space: nowrap; width: 20%" >
                <gw:textbox id="txtFabTeam" styles="width:100%" />
            </td>
            
            <td style="white-space: nowrap; width: 5%" align="right">
                Member
            </td>
            <td style="white-space: nowrap; width: 20%" >
                <gw:textbox id="txtMember" styles="width:100%" />
            </td>
            <td style="white-space: nowrap; width: 3%">                
            </td>                
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="white-space: nowrap; width: 1%" align="right">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>                      
        </tr>
        <tr>
			<td style="white-space: nowrap; width: 5%" align="right">
                Item
            </td>
            <td style="white-space: nowrap; width: 40%"  >
                <gw:list id="lstItemName" styles="width: 100%" />
            </td>
			
			<td style="white-space: nowrap; width: 5%" align="right">
                Process 
            </td>
            <td style="white-space: nowrap; width: 10%" colspan=3 >
                <gw:list id="lstProcess" styles="width: 100%" /> 
            </td>
			
			<td style="white-space: nowrap;width: 5%">
                Date 
            </td>
			 
			<td style="white-space: nowrap; width: 1%" align="right" colspan=6 > 
				<gw:datebox id="dtReDate" lang="1" width="10%" />     
            </td>             
        </tr>
        <tr style="height: 97%">
            <td colspan="21">
                <gw:grid id='grdDetail' 
					acceptnulldate='T' 
				    header='_PK|Zone|Fab. Team|Member No.|Member Size|Length|Qty|Weight(Kg)|DWG No.|_PROCESS|_RE_DATE|Day 0|Day 1|Day 2|Day 3|Day 4|Day 5|Day 6|Day 7|Day 8|Day 9|Day 10|Day 11|Day 12|Day 13|Day 14|Day 15'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 										         		
					aligns='0|0|0|1|1|3|3|3|1|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    check='||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='0|1000|1500|1500|1500|1200|1000|1500|1500|0|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' onafteredit='CheckInput()' />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<!--------------------------------------------------------->
</html>
