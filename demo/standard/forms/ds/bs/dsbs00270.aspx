<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <title>Depr Schedule</title>
</head>

<script type="text/javascript">
var G_CUST_ID       = 0,
    G_CUST_NAME     = 1,
	G_COL_01_AMT	= 2,
    G_COL_02_AMT    = 3,
    G_COL_03_AMT    = 4,
    G_COL_04_AMT    = 5,
    G_COL_05_AMT    = 6,        
    G_CCY           = 7;
    
var G_HEADER_FROM_DATE_01       = 0,
    G_HEADER_TO_DATE_01         = 1,
    G_HEADER_FROM_DATE_02       = 2,
    G_HEADER_TO_DATE_02         = 3,
    G_HEADER_FROM_DATE_03       = 4,
    G_HEADER_TO_DATE_03         = 5,
    G_HEADER_COL01              = 6,
    G_HEADER_COL02              = 7,
    G_HEADER_COL03              = 8,
    G_HEADER_COL04              = 9,
    G_HEADER_COL05              = 10;    
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------
    OnSearch();
 }
 
//===============================================================
function OnSearch()
{
    data_dsbs00270.Call("SELECT");
}
//===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_dsbs00270' :
                txt_from_date_01.text   = grdHeader.GetGridData( 1, G_HEADER_FROM_DATE_01);
                txt_to_date_01.text     = grdHeader.GetGridData( 1, G_HEADER_TO_DATE_01);
                
                txt_from_date_02.text   = grdHeader.GetGridData( 1, G_HEADER_FROM_DATE_02);
                txt_to_date_02.text     = grdHeader.GetGridData( 1, G_HEADER_TO_DATE_02);
                
                txt_from_date_03.text   = grdHeader.GetGridData( 1, G_HEADER_FROM_DATE_03);
                txt_to_date_03.text     = grdHeader.GetGridData( 1, G_HEADER_TO_DATE_03);
                
                grdDetail.SetGridText( 0, G_COL_01_AMT, grdHeader.GetGridData( 1, G_HEADER_COL01));
                grdDetail.SetGridText( 0, G_COL_02_AMT, grdHeader.GetGridData( 1, G_HEADER_COL02));
                grdDetail.SetGridText( 0, G_COL_03_AMT, grdHeader.GetGridData( 1, G_HEADER_COL03));
                grdDetail.SetGridText( 0, G_COL_04_AMT, grdHeader.GetGridData( 1, G_HEADER_COL04));
                grdDetail.SetGridText( 0, G_COL_05_AMT, grdHeader.GetGridData( 1, G_HEADER_COL05));                
                //-------
                data_dsbs00270_1.Call('SELECT');   
            break;
			
			case "data_dsbs00270_1" :
				if ( grdDetail.rows>1 )
				{
					grdDetail.SetCellBold( 1, G_CUST_ID, grdDetail.rows-1, G_CUST_ID, true);	
					
					grdDetail.SetCellBgColor( 1, G_COL_05_AMT, grdDetail.rows-1, G_COL_05_AMT,  0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_COL_04_AMT, grdDetail.rows-1, G_COL_04_AMT,  0xFFFFCC );
					
					grdDetail.Subtotal( 0, 2,-1, '2!3!4!5!6');
				}
				
			break;        	            
      }	 
 } 
  //=============================================================== 
  function OnPopUp(para)
  {
        if ( para == 'Cust' )
        {
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	             
                txtCusName.text = object[2];                   
	         }
        }
  }
  //===============================================================
</script>

<body>
	<!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00270" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="grid" parameter="0" function="st_lg_SEL_DSBS00270"> 
                <input> 
			        <input	bind="dtFrom"	/>	
			    </input> 
			    <output	bind="grdHeader"	/>      
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00270_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid" parameter ="0,1,2,3,4" function="st_lg_SEL_DSBS00270_1"> 
                <input bind="grdDetail" >
                    <input	bind="txt_from_date_01"	/>	
                    <input	bind="txt_to_date_01"	/>	
                    <input	bind="txt_from_date_02"	/>	
                    <input	bind="txt_to_date_02"	/>	
                    <input	bind="txt_from_date_03"	/>	
                    <input	bind="txt_to_date_03"	/>	
                    <input	bind="txtCusName"	/>	
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 1%">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                        </td>
                        <td style="width: 5%">
                            <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('Cust')">Customer</b>
                        </td>
                        <td style="width: 25%">
                             
                            <gw:textbox id="txtCusName" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 100%">
                        </td>
                        <td>
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdDetail' header='Cust ID|Cust Name|col_01_amt|col_02_amt|col_03_amt|col_04_amt|col_05_amt|CCY'
                    format='0|0|1|1|1|1|1|0' aligns='0|0|0|0|0|0|0|1' check='|||||||' editcol='1|1|1|1|1|1|1|1'
                    widths='1500|3000|2000|2000|2000|2000|2000|800' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtComp" styles='width:100%;display:none' />
    
   <gw:grid id='grdHeader'
header='L_FROM_DATE_01|L_TO_DATE_01|L_FROM_DATE_02|L_TO_DATE_02|L_FROM_DATE_03|L_TO_DATE_03|COL01|COL02|COL03|COL04|COL05'
format='0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0'
check='||||||||||'
editcol='1|1|1|1|1|1|1|1|1|1|1'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
styles='width:100%; height:100%; display:none'
/>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txt_from_date_01" styles='width:100%;display:none' />
    <gw:textbox id="txt_to_date_01" styles='width:100%;display:none' />
    <gw:textbox id="txt_from_date_02" styles='width:100%;display:none' />
    <gw:textbox id="txt_to_date_02" styles='width:100%;display:none' />
    <gw:textbox id="txt_from_date_03" styles='width:100%;display:none' />
    <gw:textbox id="txt_to_date_03" styles='width:100%;display:none' />
    <gw:textbox id="txtCol01" styles='width:100%;display:none' />
    <gw:textbox id="txtCol02" styles='width:100%;display:none' />
    <gw:textbox id="txtCol03" styles='width:100%;display:none' />
</body>
</html>
