<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Component Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//---------grdComponent------
var G1_Component_PK          = 0 ,
    G1_Component_ID          = 1 ,
    G1_Component_Name        = 2 ,
    G1_K_Name                = 3 ,
    G1_V_Name                = 4 ,
    G1_UOM                   = 5 ,
    G1_Component_Qty         = 6 ,
	G1_Process_PK			 = 7 ,
    G1_Group_ID              = 8 ,
    G1_Comp_type             = 9 ,
    G1_picture_pk            = 10 ,
	G1_Seq                   = 11,
	G1_USE_YN				 = 12,
    G1_Description           = 13;
//========================================================================

function BodyInit()
{
    System.Translate(document);
    //------------------
    BindingDataList();
    
    //------------------
    OnSearch('grdComponent');
}

//========================================================================

function BindingDataList()
{
    var data="" ;  
	
    data = "<%=ESysLib.SetListDataSQL("select pk, process_name from tlg_pb_process where del_if = 0 and use_yn='Y' order by process_NAME")%>||";
    lstProcess.SetDataText( data);
    lstProcess.value = '' ;	 	
	
    data = "<%=ESysLib.SetGridColumnDataSQL("  SELECT pk, process_id || ' - ' || process_name  FROM tlg_pb_process  WHERE del_if = 0 ORDER BY 2 " ) %>|| ";       
	grdComponent.SetComboFormat(G1_Process_PK, data); 
	    
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a,TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0101' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %>|| ";       
    grdComponent.SetComboFormat(G1_Group_ID, data); 	
    
    data ="#10;MAIN PART|#20;SUB PART|#30;HANDLE|#;"
    grdComponent.SetComboFormat(G1_Comp_type, data);  
    
    var trl = grdComponent.GetGridControl();
    trl.ColFormat(G1_Component_Qty) = "###,###,###,###,###";    
}

//========================================================================

function OnPopUp(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
		
	        var row  = event.row;
	        var col  = event.col;
	        
	        if ( col == G1_UOM )
	        { 		
                var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
                var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
                
                if ( obj != null )
                {
                    grdComponent.SetGridText( row, col, obj[1] );
                }	
            }
		break;	
		
        case 'Group_Type':

             var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0101";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
           
        break; 
    }
}

//========================================================================

function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
			data_fpdp00020.Call('SELECT');
		break;
						    	    
	}
}
//========================================================================
function LoadImage()
{
    txtPicture_pk.SetDataText(grdComponent.GetGridData(grdComponent.row,G1_picture_pk));
    imgPic.SetDataText(txtPicture_pk.text );
    //--------------     
}
//========================================================================

function OnAddNew(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
			grdComponent.AddRow();
			
			grdComponent.SetGridText( grdComponent.rows-1, G1_UOM,           'PCS');	
			grdComponent.SetGridText( grdComponent.rows-1, G1_Component_Qty, 1    );		
		break;			    
	}
}

//========================================================================

function OnDelete(ogrid)
{
     if ( ogrid.row > 0 )
     {
        if ( ogrid.GetGridData( ogrid.row, G1_Component_PK) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	 }   
}

//========================================================================

function OnUnDelete(ogrid)
{
    
    ogrid.UnDeleteRow()
}

//========================================================================

function OnSave(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
		    var row = grdComponent.row ;
		    
		    grdComponent.SetGridText( row, G1_picture_pk, imgPic.oid)
		    
		    if ( grdComponent.GetRowStatus(grdComponent.row) == 0 )
		    {
		        grdComponent.SetRowStatus(grdComponent.row,16)      //To save picture
		    }
		    
			data_fpdp00020.Call();			
		break;			    
	}
}

//========================================================================

function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_fpdp00020':
	        if ( grdComponent.rows>1 )
	        {
	            lblRecord.text = grdComponent.rows - 1 + ' row(s)';
	        }
	    break;
    }
}


//========================================================================
function CheckInput()
{
    var col = event.col ;
    var row = event.row ;
    
    if ( col == G1_Component_Qty )
    {
        var dQuantiy ;
        
        dQuantiy = grdComponent.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdComponent.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));                
            }
            else
            {
                grdComponent.SetGridText(row,col,"")
            }
        }
        else
        {
            grdComponent.SetGridText(row,col,"")
        }             
    } 
}
//========================================================================
function OnSelect()
{
   var arr_data = new Array();
   control = grdComponent.GetGridControl();
   var rows = control.Rows;
	
	if ( control.SelectedRows > 0 )
	{
		for (i=0; i<control.SelectedRows ; i++)
		{
			var row = control.SelectedRow(i);
			
			var arrTemp=new Array();
         
             for(var j=0; j<grdComponent.cols; j++)
             {
                arrTemp[arrTemp.length]= grdComponent.GetGridData(row,j);
             }
             
             arr_data[arr_data.length]= arrTemp;
		}
		
		window.returnValue =  arr_data;
		window.close();
    }
    else
    {
        alert("You have not selected data yet.");
    }

} 
//========================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00020" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fpdp00020" procedure="<%=l_user%>lg_upd_fpdp00020"  > 
			    <input bind="grdComponent" > 
					<input bind="lstProcess" />
			        <input bind="txtComponent" />	
					<input bind="chkActive" />		
			    </input> 
			    <output bind="grdComponent" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table name="Component" class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td colspan="2">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
					 	<td style="width: 5%" align="right">
                            Process
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch('grdComponent')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Component
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtComponent" text="" styles="width:100%" onenterkey="OnSearch('grdComponent')" />
                        </td>
                        <td style="width: 10%;white-space:nowrap" align="right">   
							<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Group_Type')">Group Type</b>                          
                        </td>
                        <td style="width: 10%;white-space:nowrap" align="center">
                            <gw:label id="lblRecord" styles="color: red">row(s)</gw:label>
                        </td>
                        <td style="width: 14%;white-space:nowrap">						 
                			Active
                			<gw:checkbox id="chkActive" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdComponent')"></gw:checkbox>							
           				</td>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdComponent')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdComponent')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDlete1" img="delete" alt="Delete" onclick="OnDelete(grdComponent)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnUnDelete1" img="udelete" alt="UnDelete" onclick="OnUnDelete(grdComponent)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSave1" img="save" alt="Save" onclick="OnSave('grdComponent')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td style="width: 80%">
                <gw:grid id='grdComponent' header='_PK|Comp ID|Comp Name|K Name|V Name|UOM|Qty|Process|Group|Comp Type|_picture_pk|Seq|Use|Description'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|3|0' 
					aligns='0|0|0|0|0|1|3|0|0|0|0|0|0|0' 
					editcol='0|1|1|1|1|1|1|1|1|1|1|1'
                    widths='0|1200|2500|1500|1500|800|1000|2000|2000|1200|0|800|800|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnPopUp('grdComponent')" onafteredit="CheckInput()" oncellclick="LoadImage()" />
            </td>
            <td valign="top" style="width: 20%">
                <gw:image id="imgPic" table_name="TES_LGPICTURE" oid="0" view="/binary/ViewFile.aspx"
                    post="/binary/PostFile.aspx" styles="width:100%;height:150" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtPicture_pk" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
