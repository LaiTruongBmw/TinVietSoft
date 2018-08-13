<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Lost & Found</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
var G_COL_PK=0,
    G_COL_LOST_DATE=1,
    G_COL_LOST_ITEM=2,
    G_COL_LOST_LOC=3,
	G_LOT_QTY=4,
    G_COL_LOST_BY=5,
    G_COL_PHONE=6,
    G_COL_RTN_ADDR=7,
    G_COL_FOUND_DATE=8,
    G_COL_FOUND_ITEM=9,
	G_COL_FOUND_LOT_QTY=10,//lot qty found
    G_COL_FOUND_BY=11,
    G_COL_FOUND_LOC=12,
    G_COL_RTN_DATE=13,
    G_COL_RTN_TYPE=14,
	G_COL_RTN_LOT_QTY=15,//lot qty rtn
    G_COL_RTN_TO=16,
    G_COL_RTN_PNONE=17,
    G_COL_RTN_ADDR2=18;
function BodyInit()
{
    FormatDepositAccountSum();
    dso_LostFound.Call("SELECT");
}
function OnDelete(obj)
{
  if(grdLostFound.row != -1)
    {
       switch(obj)
        {  
             case 'DeleteAll':
             {
                if (confirm('Are you sure delete data ?'))
                {
                    grdLostFound.DeleteRow(); 
                    dso_LostFound.Call();
                }
             }
             break;
             case 'DeleteFound'://delete found
             {
                if (confirm('Are you sure delete data ?'))
                {
	               // grdLostFound.SetRowStatus(1, 0x00); 
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_FOUND_DATE,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_FOUND_ITEM,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_FOUND_BY,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_FOUND_LOC,'');
					grdLostFound.SetGridText(grdLostFound.row,G_COL_FOUND_LOT_QTY,'');
                    dso_LostFound.Call();
                }
             }
             break;
             case 'DeleteReturn': //delete return
             {
                if (confirm('Are you sure delete data ?'))
                {
                    //grdLostFound.SetRowStatus(1, 0x00); 
                    grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_DATE,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_TYPE,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_TO,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_PNONE,'');
	                grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_ADDR2,'');
					grdLostFound.SetGridText(grdLostFound.row,G_COL_RTN_LOT_QTY,'');
                    dso_LostFound.Call();
                }
             }
             break;
         }
     }
     else
     {
        alert("Please,choose item to delete.");
     }   
}
function OnNew()
{
    var data="";
    grdLostFound.AddRow();
}
function CheckValidateDetail()
{
    for(var i=1;i<grdLostFound.rows;i++)
          {
            if(grdLostFound.GetGridData(i,G_COL_LOST_DATE) == "")
             {
                alert("Please input Lost Date at row "+ (i-1));
                return false;
             }
             if(grdLostFound.GetGridData(i,G_COL_LOST_ITEM) == "")
             {
                alert("Please input Lost Item  at row "+ (i-1));
                return false;
             }
             if(grdLostFound.GetGridData(i,G_COL_LOST_LOC) == "")
             {
                alert("Please input Location at row "+ (i-1));
                return false;
             }
             if(grdLostFound.GetGridData(i,G_COL_LOST_BY) == "")
             {
                alert("Please input Lost By at row "+ (i-1));
                return false;
             }
          }
          return true;
}
function OnSave()
{
    grdLostFound.SetRowStatus(1, 0x00);
    if(CheckValidateDetail())
    {
        dso_LostFound.Call();  
    } 
}
function FormatDepositAccountSum()
{
	if(grdLostFound.rows < 2)
	{
		grdLostFound.AddRow();
	}
	
	var fg=grdLostFound.GetGridControl();
	fg.FixedRows = 2;
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;
			
	fg.Cell(0, 0, 1, 0, 7) = "LOST";

	fg.Cell(0, 0, 8, 0, 12) = "FOUND";

	fg.Cell(0, 0, 13, 0, 18) = "RETURN";

	//fg.Cell(0, 1, 1, 1) 	= "Date"
	fg.Cell(0, 1, 1, 1) 	= "Date"
	fg.Cell(0, 1, 2, 1) 	= "Article"
	fg.Cell(0, 1, 3, 1) 	= "Lot Qty"
	fg.Cell(0, 1, 4, 1) 	= "Lost By"
	fg.Cell(0, 1, 5, 1) 	= "Room"
	fg.Cell(0, 1, 6, 1) 	= "Phone"
	fg.Cell(0, 1, 7, 1) 	= "Return Address"

	fg.Cell(0, 1, 8, 1) 	= "Date"
	fg.Cell(0, 1, 9, 1) 	= "Article"
	fg.Cell(0, 1, 10, 1) 	= "Lot Qty"
	fg.Cell(0, 1, 11, 1) 	= "Found By"
	fg.Cell(0, 1, 12, 1) 	= "Location"

	fg.Cell(0, 1, 13, 1) 	= "Date"
	fg.Cell(0, 1, 14, 1) 	= "Type"
	fg.Cell(0, 1, 15, 1) 	= "Lot Qty"
	fg.Cell(0, 1, 16, 1) 	= "Return To"
	fg.Cell(0, 1, 17, 1) 	= "Return Phone"
	fg.Cell(0, 1, 18, 1) 	= "Address"

	fg.MergeCol(0) = true
	fg.Cell(0, 0, 0, 1, 0)  = "PK"
	
    fg.ColWidth(0)=1200;
    fg.ColWidth(1)=1100;
    fg.ColWidth(2)=2300;
    fg.ColWidth(3)=1200; 
    fg.ColWidth(4)=1500;
    fg.ColWidth(5)=1300;
    fg.ColWidth(6)=2300;
    fg.ColWidth(7)=1500;
    fg.ColWidth(8)=2300;
    fg.ColWidth(9)=1500;
    fg.ColWidth(10)=1500;
    fg.ColWidth(11)=1200; 
    fg.ColWidth(12)=1500;
    fg.ColWidth(13)=1500;
    fg.ColWidth(14)=1500;
    fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	fg.ColWidth(17)=1500;
	fg.ColWidth(18)=1500;

    fg.Cell(1, 0, 0, 1, fg.Cols -1)=4;
	fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 
}
function OnDataReceive(obj)
{
    if(obj.id == 'dso_LostFound')
    {
       // FormatDepositAccountSum();
        //grdLostFound.GetGridControl().FrozenCols = 4;
        if(grdLostFound.rows > 1)
        {
           for(var i=2;i<grdLostFound.rows;i++)
           {
                grdLostFound.SetCellBgColor(i, 0, i, 7, 0x00FFCE);
                grdLostFound.SetCellBgColor(i, 13, i, 18, 0x3366FF);
           }
        }
		FormatDepositAccountSum();
    }
}
function OnSearch()
{
    dso_LostFound.Call("SELECT");
}
function OnReport()
 {
    //alert("not...yet!")
	var url = '/standard/reports/ho/26/rpt_60260050.aspx?p_dt_from='+ dtFrom.value+'&p_dt_to='+dtTo.value+'&p_lost_by='+txtLostBy.text;
	    System.OpenTargetPage( System.RootURL+url , "newform" );  
 }

</script>

<body>
    <gw:data id="dso_LostFound" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="ht_sel_60260050" procedure="ht_upd_60260050">  
                <input  bind="grdLostFound">
                    <input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtLostBy" />
                </input> 
                <output bind="grdLostFound" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="height: 100%; width: 100%;">
        <tr style="height: 2%;" valign="top">
            <td style="width:10%;">
                Date</td>
            <td style="width: 28%;">
                <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch()" />
                ~<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 17%;">
                Lost By</td>
            <td style="width: 25%;">
                <gw:textbox id="txtLostBy" styles="width: 70%; text-align: left" onenterkey='OnSearch()' />
            </td>
            <td style="width: 2%">
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 3%">
                <gw:icon id="idDeleteAll" img="2" text="Delete All" styles='width:100%' onclick="OnDelete('DeleteAll')" />
            </td>
            <td style="width: 3%">
                <gw:icon id="idDeleteFound" img="2" text="Delete Found" styles='width:100%' onclick="OnDelete('DeleteFound')" />
            </td>
            <td style="width: 3%">
                <gw:icon id="idDeleteReturn" img="2" text="Delete Return" styles='width:100%' onclick="OnDelete('DeleteReturn')" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
			  <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>

        </tr>
        <tr style="height: 98%;" valign="top">
            <td colspan="12">
                <gw:grid id='grdLostFound' header='_0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18'
                    format='0|4|0|0|0|0|0|0|4|0|0|0|0|4|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' 
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' acceptnulldate="T" />
            </td>
        </tr>
    </table>
</body>
</html>
