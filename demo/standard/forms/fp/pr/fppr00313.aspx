<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Non Working Time</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript"> 
       
var G3_PK             	= 0,         
	G3_DATE				= 1,
	G3_SHIFT 			= 2,
	G3_LINE_PK 		  	= 3,
	G3_W_PROCESS_PK		= 4,
	G3_ITEM_PK	   		= 5,
	G3_SEQ				= 6,
	G3_CHARGER_PK		= 7,
	G3_CHARGER_ID		= 8,  	
	G3_CHARGER_NAME		= 9,	
    G3_REMARK         	= 10; 
          
var arr_FormatNumber = new Array();
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    
    FormatGrid(); 
    //-----------     
	OnSearch('grdDetail');
}
//====================================================================================
function FormatGrid()
{
	txtDate.text    	= "<%=Request.querystring("prod_date")%>";
	txtShift.text   	= "<%=Request.querystring("prod_shift")%>";
	txtLinePK.text 		= "<%=Request.querystring("line_pk")%>";
	txtWProcessPK.text  = "<%=Request.querystring("work_process_pk")%>";
	txtItemPK.text 		= "<%=Request.querystring("item_pk")%>"	 	  
}
   
//====================================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {        
        case 'grdDetail' :            		         
				data_fppr00313.Call('SELECT');	
	        break;              
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {                       
        case 'NONE_WORK':
			 
			var path = System.RootURL + '/form/fp/ab/fpab00760.aspx';
			var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
						 
			if ( obj != null )
			{							 
				var arrTemp;

				for( var i=0; i < obj.length; i++)	  
				{	
					arrTemp = obj[i];
					
					grdDetail.AddRow();	
					
					grdDetail.SetGridText( grdDetail.rows-1, G3_SEQ, 	 		grdDetail.rows-1	); 		
					
					grdDetail.SetGridText( grdDetail.rows-1, G3_DATE, 	 		txtDate.text   		); 
					grdDetail.SetGridText( grdDetail.rows-1, G3_SHIFT,   		txtShift.text 		);			
					grdDetail.SetGridText( grdDetail.rows-1, G3_LINE_PK, 		txtLinePK.text  	);
					grdDetail.SetGridText( grdDetail.rows-1, G3_W_PROCESS_PK, 	txtWProcessPK.text  );
					grdDetail.SetGridText( grdDetail.rows-1, G3_ITEM_PK, 		txtItemPK.text 		);
			
					grdDetail.SetGridText( grdDetail.rows-1, G3_CHARGER_PK, 	arrTemp[0] ); 
					grdDetail.SetGridText( grdDetail.rows-1, G3_CHARGER_ID,    	arrTemp[3] ); 
					grdDetail.SetGridText( grdDetail.rows-1, G3_CHARGER_NAME,  	arrTemp[5] );													
				}         	                          
			}
						       
        break;		
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdDetail' :
            data_fppr00313.Call();
        break; 
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fppr00313' :
            
        break;
        
        
    }    
}
//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}
 
 
//==============================================================================
 

</script>

<body>     	 
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00313" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fppr00313"  procedure="<%=l_user%>lg_upd_fppr00313"  > 
			    <input bind="grdDetail" > 		 
			        <input bind="txtDate" />	
					<input bind="txtShift" />
					<input bind="txtLinePK" />
					<input bind="txtWProcessPK" />
					<input bind="txtItemPK" />	
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>		
    <!-------------------------------------------------------------------> 
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                             
                        </td>
                        <td style="width: 30%" align="right">
                             
                        </td>                         
                        <td style="width: 45%">
                            
                        </td>
						<td style="width: 15%" >
						</td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('NONE_WORK')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdDetail')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">                             
							<gw:grid id='grdDetail'
								header='_PK|Prod Date|_SHIFT|_LINE_PK|_W_PROCESS_PK|_ITEM_PK|Seq|_Charger_PK|Emp ID|Emp Name|Remark'
								format='0|4|0|0|0|0|0|0|0|0|0'
								aligns='0|0|0|0|0|0|1|0|0|0|0'
								editcol='0|1|0|0|0|0|1|1|0|0|1'
								widths='0|1200|0|0|0|0|800|0|1500|3000|1000'
								sorting='T'								 
								styles='width:100%; height:100%'							 
							/>
                        </td>
                    </tr>
                </table>
<!----------------------------------------------------------->
<gw:textbox id="txtDate"		styles="width: 100%;display: none" />
<gw:textbox id="txtShift" 		styles="width: 100%;display: none" />
<gw:textbox id="txtLinePK" 		styles="width: 100%;display: none" />	
<gw:textbox id="txtWProcessPK" 	styles="width: 100%;display: none" />	
<gw:textbox id="txtItemPK" 		styles="width: 100%;display: none" />	
<!----------------------------------------------------------->
</body>
</html>
