<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>NON OPERATION</title>
</head>

<script >
var G1_pk           = 0,   
    G1_type_pk      = 1,  
    G1_Process      = 2,  
    G1_id           = 3,   
    G1_name         = 4,
    G1_from_dt      = 5,  
    G1_dtst         = 6,
    G1_to_dt        = 7,   
    G1_dtet         = 8,  
    G1_duration     = 9,   
    G1_description  = 10;
//------------------------------------------------------------------------------------------------
function BodyInit()
{
    var type  = "<%=request.QueryString("type")%>";
                 
    data = "data|1|Mill Roll|2|MA Cutting|3|MI Cutting";
    lstProcess.SetDataText(data); 
    lstProcess.value = type;
    
    lstProcess.SetEnable(false);   
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select 1,'Mill Roll' from dual union all select 2, 'MA Cutting' from dual union all select 3, 'MI Cutting' from dual " )  %> " ; 
    grdOperation.SetComboFormat(G1_Process,data);      
    
    grdOperation.GetGridControl().ColEditMask(G1_dtst)="99:99";
    grdOperation.GetGridControl().ColEditMask(G1_dtet)="99:99";
    
    System.Translate(document);  // Translate to language session
    onSearch();
}
//------------------------------------------------------------------------------------------------------
function onOpenPopup()
{  
    if ( event.col == G1_id || event.col == G1_name ) 
    {
        var desc;
        var fpath = System.RootURL + "/form/fp/ep/fpep00045_1.aspx?type=1"; 
        var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:900px;dialogHeight:500px');	        
        
        if ( aValue != null )
        {         
            grdOperation.SetGridText(grdOperation.row, G1_type_pk, aValue[0]);  
            grdOperation.SetGridText(grdOperation.row, G1_id,      aValue[2]);  
            grdOperation.SetGridText(grdOperation.row, G1_name,    aValue[3]);
            
            grdOperation.SetGridText(grdOperation.row, G1_Process, lstProcess.value );
        }	
     }   	
}    
//------------------------------------------------------------------------------------------------------
function onSave() 
{
    dat_fpep00045_1.Call('');
}    
//------------------------------------------------------------------------------------------------------
function onDelete()
{
    if(confirm('Do you want to delete this row?'))
	{
	    grdOperation.DeleteRow();
	}
}
//------------------------------------------------------------------------------------------------------
function onNew()
{
    grdOperation.AddRow();
    grdOperation.SetGridText(grdOperation.rows-1, G1_duration,1 )
    grdOperation.SetGridText(grdOperation.rows-1,G1_from_dt ,dtNoneOperationDate.value)
    grdOperation.SetGridText(grdOperation.rows-1,G1_to_dt ,dtNoneOperationDate.value)
}
//------------------------------------------------------------------------------------------------------
function onSearch()
{
    dat_fpep00045_1.Call('SELECT');
}
//------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
   
}   
//------------------------------------------------------------------------------------------------------
function onAfterEditng()
{
    col = event.col ;
    
    if(( col == G1_dtst) ||( col == G1_dtet) )
    {
       var tmpIN,ws,temp;
    var	cIdx=event.col;
	var row = event.row
	
		tmpIN=grdOperation.GetGridData(row,cIdx)
		if(tmpIN.length==0)
		{
			grdOperation.SetGridText(row,cIdx,"")
			return;
		}
		if((tmpIN.length!=4)&&(tmpIN.length!=""))
		{
			alert("Incorrect time type.(type: hh:mm)!")
			grdOperation.SetGridText(row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>23)||(Number(tmpIN.substr(0,2))<0))
		{
			alert("Hour is out of range.(00<= hh <= 23)")
			grdOperation.SetGridText(row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>59)||(Number(tmpIN.substr(2,2))<0))
		{
			alert("Minute is out of range.(00<= hh < 59)")
			grdOperation.SetGridText(row,cIdx,'')
			return;
		}
		tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		grdOperation.SetGridText(row,cIdx,tmpIN)
		//call duration
		var grd_from = grdOperation.GetGridData(row,G1_dtst)
		var grd_to = grdOperation.GetGridData(row,G1_dtet)
		if(grd_from!='' && grd_to !='')
		{
		    /*lam tam thoi vi se khong dung neu start time va end time khong cung mot ngay*/
		    var hour,minute
		    hour = Number(grd_to.substr(0,2)) -Number(grd_from.substr(0,2))
		    minute = Number(grd_to.substr(3,2)) -Number(grd_from.substr(3,2))
		    grdOperation.SetGridText(row,G1_duration,hour*60+minute)
		}
	     
       
        //grdOperation.SetGridText(grdOperation.row, G1_duration, 1 + Number(grdOperation.GetGridData(grdOperation.row, G1_dtet)) -  Number(grdOperation.GetGridData(grdOperation.row, G1_dtst)));
    }
}
//------------------------------------------------------------------------------------------------------
function onBeforeEditing()
{
    if ( event.col == G1_Process ) 
    {
        grdOperation.GetGridControl().Col = G1_id;
    }
}
//------------------------------------------------------------------------------------------------------

</script>

<body>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="dat_fpep00045_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="prod.sp_sel_fpep00045_1"   procedure="prod.sp_upd_fpep00045_1"> 
                <input bind="grdOperation">   
                    <input bind="lstProcess" />                 
                    <input bind="dtNoneOperationDate" />                     
                </input> 
                <output bind="grdOperation" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
            <tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td style="width: 15%;">
                                Process
                            </td>
                            <td style="width: 35%;">
                                <gw:list id="lstProcess" styles='width:100%;' onchange="onSearch()" />
                            </td>
                            <td style="width: 15%; white-space: nowrap" align="right">
                                Date</td>
                            <td style="width: 30%;">
                                <gw:datebox id="dtNoneOperationDate" lang="1" styles='width:80%' />
                            </td>
                            <td style="width: 4%;">
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" />
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="onNew()" />
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" />
                            </td>
                            <td style="width: 1%;">
                                <gw:imgbtn id="btnDel" img="delete" alt="Delete" text="Delete" onclick="onDelete()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 2%">
                </td>
            </tr>
            <tr style="height: 97%">
                <td>
                    <gw:grid id='grdOperation' 
                        header='_Pk|_Type_PK|Process|Code|Name|From Date|Time|To Date|Time|Duration(Minute)|Description'
                        format='0|0|0|0|0|4|0|4|0|0|0' 
                        aligns='0|0|0|0|0|0|1|0|1|3|0' editcol='0|1|1|1|1|1|1|1|1|1|1'
                        widths='0|2000|1500|1500|2500|1200|1200|1200|1200|2000|2000' sorting='T' oncelldblclick="onOpenPopup()"
                        onafteredit="onAfterEditng()" styles='width:100%; height:100%' onbeforeedit="onBeforeEditing()" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
