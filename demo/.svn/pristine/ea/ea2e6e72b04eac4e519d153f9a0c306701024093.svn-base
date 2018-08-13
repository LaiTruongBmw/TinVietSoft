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
	G3_NONE_TYPE		= 7,
	G3_NONE_TIME		= 8,  	 
    G3_REMARK         	= 9; 
          
var arr_FormatNumber = new Array();
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    
    FormatGrid(); 
    //-----------     
	OnSearch('grdNoneWork');
}
//====================================================================================
function FormatGrid()
{
	txtDate.text    	= "<%=Request.querystring("prod_date")%>";
	txtShift.text   	= "<%=Request.querystring("prod_shift")%>";
	txtLinePK.text 		= "<%=Request.querystring("line_pk")%>";
	txtWProcessPK.text  = "<%=Request.querystring("work_process_pk")%>";
	txtItemPK.text 		= "<%=Request.querystring("item_pk")%>"
	
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0301' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";             
    grdNoneWork.SetComboFormat(G3_NONE_TYPE,data); 
	
    var ctrl = grdNoneWork.GetGridControl();
    ctrl.ColFormat(G3_NONE_TIME) = "###,###,###,###.##";
	
	arr_FormatNumber[G3_NONE_TIME] = 2;
	 	  
}
   
//====================================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {        
        case 'grdNoneWork' :            		         
				data_fppr00312_3.Call('SELECT');	
	        break;              
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {                       
        case 'NONE_WORK':
			     				
	        grdNoneWork.AddRow();
			
    		grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_SEQ, 	 		grdNoneWork.rows-1	); 			 
			
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_DATE, 	 		txtDate.text   		); 
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_SHIFT,   		txtShift.text 		);			
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_LINE_PK, 		txtLinePK.text  	);
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_W_PROCESS_PK, 	txtWProcessPK.text  );
			grdNoneWork.SetGridText( grdNoneWork.rows-1, G3_ITEM_PK, 		txtItemPK.text 		);
						        
        break;		
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdNoneWork' :
            data_fppr00312_3.Call();
        break; 
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'pro_fppr00312_line' :
            OnSearch('grdNoneWork');
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
 
//========================================================================
 
 function CheckInput(obj)
 {   
    switch(obj.id)
    {         
        case 'grdNoneWork':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G3_NONE_TIME )
            {
                var dQuantiy;
                
                dQuantiy =  grdNoneWork.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdNoneWork.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ) );
												 	 
                    }
                    else
                    {                         
                        grdNoneWork.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdNoneWork.SetGridText(row,col,"")
                }         
            }           
                              
        break;
    }
 }
  
//==============================================================================
 

</script>

<body>     	 
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00312_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fppr00312"  procedure="<%=l_user%>lg_upd_fppr00312"  > 
			    <input bind="grdNoneWork" > 		 
			        <input bind="txtDate" />	
					<input bind="txtShift" />
					<input bind="txtLinePK" />
					<input bind="txtWProcessPK" />
					<input bind="txtItemPK" />	
			    </input> 
			    <output bind="grdNoneWork" /> 
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
                            <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdNoneWork')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('NONE_WORK')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdNoneWork)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdNoneWork')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">                             
							<gw:grid id='grdNoneWork'
								header='_PK|_DATE|_SHIFT|_LINE_PK|_W_PROCESS_PK|_ITEM_PK|Seq|None Type|None Time|Remark'
								format='0|0|0|0|0|0|0|0|0|0'
								aligns='0|0|0|0|0|0|1|0|3|0'
								editcol='0|0|0|0|0|0|1|1|1|1'
								widths='0|0|0|0|0|0|800|2500|1500|1000'
								sorting='T'								 
								styles='width:100%; height:100%' onafteredit="CheckInput(this)" 								 
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
