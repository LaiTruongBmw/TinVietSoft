<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

    <script>
var COL_PK			= 0,
	COL_PRICE_TYPE	= 1,
	COL_ROOM_TYPE	= 2,
	COL_PRICE		= 3,
	COL_USE_YN		= 4,
	COL_DESCRIPTION = 5;

function BodyInit()
{
	Bingding();
	OnSearch();
}
function Bingding()
{
	var data ="#1;Nightly|#7;Weekly|#31;Monthly"; 
        grdRatePlans.SetComboFormat(5,data);//length of stay
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, code || '-' || NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE = 'RTYPE' order by ord")%>";
        grdRoomPrice.SetComboFormat(2, data);//room type
}

function OnSearch()
{
	grdRoomPrice.ClearData();
	txtMasterPK.text="";
	dso_htfo00160_M.Call("SELECT");
}

function OnNew(obj)
{
	switch(obj){
	    case "Master":
            grdRatePlans.AddRow();
            grdRoomPrice.ClearData();
            grdRatePlans.SetGridText(grdRatePlans.rows-1,9,-1);//use yn
        break;
	    case "Detail":
	        if(txtMasterPK.text !="")
	        {
	             grdRoomPrice.AddRow();
	             grdRoomPrice.SetGridText(grdRoomPrice.rows-1,1,txtMasterPK.text);
	             grdRoomPrice.SetGridText(grdRoomPrice.rows-1,13,-1);//use yn
	        }
	        else
	        {
	            alert("Please,choose item in master.");
	        }
        break;
	}
}
function CheckValidateMaster()
{
    for(var i=1;i<grdRatePlans.rows;i++)
          {
            if(grdRatePlans.GetGridData(i,1) == "")
             {
                alert("Please input rate code at row "+ i);
                return false;
             }
             if(grdRatePlans.GetGridData(i,2) == "")
             {
                alert("Please input rate name at row "+i);
                return false;
             }
             else if(grdRatePlans.GetGridData(i,10) == "")
             {
                alert("Please input valid from at row"+i);
                return false;
             }
          }
          return true;
}
function CheckValidateDetail()
{
    for(var i=1;i<grdRoomPrice.rows;i++)
          {
            if(grdRoomPrice.GetGridData(i,2) == "")
             {
                alert("Please,choose room type at row "+ i);
                return false;
             }
          }
          return true;
}
function OnDelete(obj)
{
	switch(obj){
	    case "Master":
	        if (confirm( "Do you want to delete ?" )) 
				{
                    grdRatePlans.DeleteRow();
                    dso_htfo00160_M.Call();
                }
        break;
	    case "Detail":
            if (confirm( "Do you want to delete ?" )) 
				{
                    grdRoomPrice.DeleteRow();
                    dso_htfo00160_D.Call();
                }
        break;
	}
}
function OnSave(obj)
{
	switch(obj){
	    case "Master":
	        if(CheckValidateMaster())
	        {
                dso_htfo00160_M.Call();
            }
        break;
	    case "Detail":
	        if(CheckValidateDetail())
	        {
                for(var i=1;i<grdRoomPrice.rows;i++)
				{
					if(grdRoomPrice.GetGridData(i,1) == "")
					{
						grdRoomPrice.SetGridText(i,1,txtMasterPK.text);
					}
				}
				dso_htfo00160_D.Call();
            }
        break;
	}
}
function OnShowDetail()
{
    txtMasterPK.text = grdRatePlans.GetGridData( event.row, 0); 
    if(txtMasterPK.text !="")
    {
        dso_htfo00160_D.Call("SELECT");
    }
}
</script>

</head>
<body>
    <gw:data id="dso_htfo00160_M"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="HT_sel_60250070_m" procedure="HT_upd_60250070_m">  
                <input bind="grdRatePlans"   >  
                    <input bind="txtRateCodeName" />
                </input>
               <output bind="grdRatePlans" />    
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_htfo00160_D"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="HT_sel_602500700_d" procedure="HT_upd_60250070_d">  
                <input bind="grdRoomPrice"   >  
                    <input bind="txtMasterPK" />
                </input>
                 <output bind="grdRoomPrice" />  
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%" border="0">
        <tr style="height: 2%">
            <td width="15%">
               Rate Code/Name</td>
            <td width="20%">
                <gw:textbox id="txtRateCodeName" onenterkey="OnSearch()" />
            </td>
            <td width="15%" align='right'>
                </td>
            <td width="10%">
            </td>
            <td with="40%" align="right">
                <table width="10%" style="height: 100%" border="0">
                    <tr width="100%">
                        <td with="95%">
                        </td>
                        <td with="1%">
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnSearchM" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnNewM" img="New" alt="New" onclick="OnNew('Master')" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnDeleteM" img="Delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnSaveM" img="Save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="5">
                <gw:grid id="grdRatePlans" header="_pk|*Rate Code|*Rate Name|_Group|_Comitsion(%)|_Length Of Stay|_Room_Ratio|_F_B_Ratio|_Golf_Ratio|Use YN|*Valid From|Valid To|Description"
                    format="0|0|0|0|-2|0|1|1|1|3|4|4|0" 
                    aligns="0|0|0|0|1|0|0|0|0|0|0|0|0" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1"
                    widths="0|1000|0|0|0|1000|1000|1000|1000" 
                    sorting='T' autosize="T" acceptNullDate="T"
                    styles="width:100%; height:100%" oncellclick="OnShowDetail()" />
            </td>
        </tr>
        <tr style="height: 2%">
            <td width="10%" align='right'>
               </td>
            <td width="20%">
                
            </td>
            <td width="10%" align='right'>
                </td>
            <td width="20%">
            </td>
            <td with="40%" align="right">
                <table width="10%" style="height: 100%" border="0">
                    <tr width="100%">
                        <td with="95%">
                        </td>
                        <td with="1%">
                        </td>
                        <td with="1%">
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnNewD" img="New" alt="New" onclick="OnNew('Detail')" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnDeleteD" img="Delete" alt="Delete" onclick="OnDelete('Detail')" />
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnSaveD" img="Save" alt="Save" onclick="OnSave('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="5">
                <gw:grid id="grdRoomPrice" header="_pk|_tht_rate_plans_pk|*Room Type|Max Adult|_CXL|_Single Amt|_Double Amt|_Triple Amt|Monthly Rate|_Extra Adult Amt|_Child Amt|_Extra Child Amt|Daily Rate(++)|Use YN|Description"
                    format="0|0|0|0|0|-2|-2|-2|-2|-2|-2|-2|-2|3|0" 
                    aligns="0|0|0|3|3|3|3|3|3|3|3|3|3|0|0" 
                    defaults="|||||0|0|0|0|0|0|0|0||" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    sorting='T' autosize="T" styles="width:100%; height:100%"/>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
</html>
