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
    G1_Group_PK              = 7 ,
    G1_Description           = 8 ,
    G1_picture_pk            = 9 ;
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
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select pk, a.GRP_CD || ' - ' || a.GRP_NM from comm.TCO_ITEMGRP a where del_if = 0 and group_type = '50'  order by GRP_CD" ) %>|| ";       
    grdComponent.SetComboFormat( G1_Group_PK, data );
    
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
    }
}

//========================================================================

function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
			data_fpdp00111.Call('SELECT');
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
		    
			data_fpdp00111.Call();			
		break;			    
	}
}

//========================================================================

function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_fpdp00111':
	        if ( grdComponent.rows>1 )
	        {
	            lblRecord.text = grdComponent.rows - 1 + ' row(s)';
	        }
	    break;
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
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00111" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpdp00111" procedure="<%=l_user%>lg_upd_fpdp00111"  > 
			    <input bind="grdComponent" > 
			        <input bind="txtComponent" />			
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
                        <td style="width: 10%" align="right">
                            Component
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtComponent" text="" styles="width:100%" onenterkey="OnSearch('grdComponent')" />
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 30%">
                            <gw:label id="lblRecord" styles="color: blue">row(s)</gw:label>
                        </td>
                        <td style="width: 4%">
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
                <gw:grid id='grdComponent' header='_PK|Comp ID|Comp Name|K Name|V Name|UOM|Qty|_Group|Description|_picture_pk'
                    format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|3|0|0|0' editcol='0|1|1|0|1|1|1|1'
                    widths='0|1200|2500|1500|1500|800|1200|2000|1000|0' sorting='T' styles='width:100%; height:100%'
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
