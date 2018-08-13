<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Message Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var message_row;

var G_Line_PK       = 0,
    G_Line_Name     = 1,
    G_PK            = 2,
    G_Date          = 3,
    G_Mess_ID       = 4,
    G_Mess_Level    = 5,
    G_SEND_EMP_PK   = 6,
    G_Send_Emp      = 7,
    G_Send_Name     = 8,
	G_TLG_SA_SALEORDER_M_PK = 9,
	G_TLG_SA_SALEORDER_M = 10,
    G_RECEIVE_EMP_PK= 11,
    G_Receive_Emp   = 12,
    G_Receive_Name  = 13,
    G_Mess_Content  = 14,
    G_Close_YN      = 15,  
    G_Description   = 16,
    G_Att01         = 17,
    G_Att02         = 18,
    G_Att03         = 19,
    G_Att04         = 20,
    G_Att05         = 21;
    
//====================================================================

function BodyInit()
{
    System.Translate(document);
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
    //-------------------
    BindingDataList(); 
    //-------------------  
}
//====================================================================
function BindingDataList()
{   
	//SELECT   pk, line_id || ' ' || line_name FROM tlg_pb_line WHERE del_if = 0 ORDER BY line_id 
    var data = "<%=ESysLib.SetListDataSQL("select pk, wp_id || ' - ' || wp_name from tlg_pb_work_process where del_if =0 and wi_yn = 'Y' ")%>|0||ALL|Select all";
    lstLine.SetDataText(data);
    lstLine.value = 'ALL'; 
    
    data = "<%=ESysLib.SetGridColumnDataSQL(" select 1, 'Red' from dual  union all  select 2, 'Yellow' from dual  union all select 3, 'White' from dual  " ) %> ";       
    grdMessage.SetComboFormat( G_Mess_Level,data);        
}
//====================================================================
 
function OnSearch()
{
    data_fpgm00050.Call('SELECT');
}
//====================================================================
function OnAddNew()
{  
    if ( lstLine.value == 'ALL')   
    { 
        alert("Please select one Line !");   
    }
    else
    {
        grdMessage.AddRow();
        
        grdMessage.SetGridText( grdMessage.rows -1, G_Line_PK,   lstLine.value    );
        grdMessage.SetGridText( grdMessage.rows -1, G_Line_Name, lstLine.GetText());
        
        grdMessage.SetGridText( grdMessage.rows -1, G_SEND_EMP_PK, "<%=Session("EMPLOYEE_PK")%>" );
        grdMessage.SetGridText( grdMessage.rows -1, G_Send_Name,   "<%=Session("USER_NAME")%>"   );
        
        message_row = grdMessage.rows -1;
        
        txtMessageContent.SetDataText('');
    }   
}
//====================================================================
 
function OnSave()
{   
        data_fpgm00050.Call();
}
//====================================================================

function OnDataReceive(obj)
{
        txtMessageContent.SetDataText('');
        message_row = 0 ;
}
//====================================================================

function OnDelete()
{
    if ( grdMessage.row > 0 )
    {
        if ( grdMessage.GetGridData( grdMessage.row, G_PK) == '' )
        {
            grdMessage.RemoveRow();                 
        }   
        else
        {
            grdMessage.DeleteRow();  
        } 
    }
}

//====================================================================

function OnUndelete()
{
    grdMessage.UnDeleteRow();
}
//====================================================================

function TextOnBlur()
{
    if ( message_row > 0 )
    {
        grdMessage.SetGridText( message_row, G_Mess_Content, txtMessageContent.GetData()+"") ;
    }
}
//====================================================================
 function OnPopUp(pos)
 {
      switch (pos)         
      {		        
            case 'grdMessage' :
	             var row  = event.row;
	             var col  = event.col;
    	         
                 if ( col == G_Send_Emp || col == G_Send_Name )
                 {                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
	                 
	                 if ( obj != null )
	                 {
                         grdMessage.SetGridText(row, G_SEND_EMP_PK, obj[0] ); //emp_pk
                         grdMessage.SetGridText(row, G_Send_Emp,    obj[1] ); //emp_id
                         grdMessage.SetGridText(row, G_Send_Name,   obj[2] ); //emp_name           	                          
                     }	                
                 }
                 else if ( col == G_Receive_Emp || col == G_Receive_Name )
                 {                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');		                 
	                 
	                 if ( obj != null )
	                 {
                         grdMessage.SetGridText(row, G_RECEIVE_EMP_PK, obj[0] ); //emp_pk
                         grdMessage.SetGridText(row, G_Receive_Emp,    obj[1] ); //emp_id
                         grdMessage.SetGridText(row, G_Receive_Name,   obj[2] ); //emp_name           	                          
                     }	                
                 }
				else if (col == G_TLG_SA_SALEORDER_M)
				{
					var fpath = System.RootURL + '/form/fp/ab/fpab00460.aspx';
					var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes;scroll:no;');
					
					if ( aValue != null )
					{      
							grdMessage.SetGridText(row,G_TLG_SA_SALEORDER_M_PK, aValue[0]);
							grdMessage.SetGridText(row,G_TLG_SA_SALEORDER_M, aValue[1] +' -' +aValue[3]);                    
					}
				}
			break; 
	  }  
}	    
//====================================================================
function CellOnClick()
{
    if ( grdMessage.row > 0 )
    {
        message_row = grdMessage.row;
        txtMessageContent.SetDataText( grdMessage.GetGridData( grdMessage.row, G_Mess_Content ));
    }    
}
//====================================================================	    
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpgm00050" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00050" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" procedure="<%=l_user%>lg_upd_fpgm00050"> 
                <input bind="grdMessage" >
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>
                    <input bind="lstLine" /> 
                    <input bind="txtMessage" /> 
                </input> 
                <output bind="grdMessage" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%">
                            Date</td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 10%" align="right">
                            Work Process
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstLine" text="" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Message</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtMessage" styles="width:100%" csstype="mandatory" onenterkey="OnSearch('grdSTItem_3')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 59%">
            <td>
                <gw:grid id='grdMessage' header='_Line_PK|Line Name|_PK|Date|Mess ID|Level|_SEND_EMP_PK|Send Emp|Name|_Order_pk|S.Order|_RECEIVE_EMP_PK|Receive Emp|Name|_Mess Content|Close|Description|_Att01|_Att02|_Att03|_Att04|_Att05'
                    format='0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0' 
                    aligns='0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|1|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1' 
                    widths='0|2000|0|1200|1500|1000|0|1200|2000|1000|1000|0|1200|2000|2000|1000|1000|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' 
                    defaults='|||||||||||||||||' 
                    oncelldblclick="OnPopUp('grdMessage')"
                    onclick="CellOnClick()" />
                <!--
                <gw:grid id='grdMessage' 
                header='_Line_PK|Line Name|_PK|Date|Mess ID|
                    _SEND_EMP_PK|Send Emp|Name|_RECEIVE_EMP_PK|Receive Emp|
                    Name|Mess Content|Description|Att01|Att02|
                    Att03|Att04|Att05'
                    format='0|0|0|4|0|
                            0|0|0|0|0|
                            0|0|0|0|0|
                            0|0|0' 
                    aligns='0|0|0|1|0|
                            0|0|0|0|0|
                            0|0|0|0|0|
                            0|0|0'
                   editcol='0|0|0|1|0|
                            0|0|0|0|0|
                            0|1|1|1|1|
                            1|1|1' 
                   widths='1000|1000|1000|1000|1000|
                           1000|1000|1000|1000|1000|
                           1000|1000|1000|1000|1000|
                           1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />                                
                    -->
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="left">
                Message Content
            </td>
        </tr>
        <tr style="height: 39%">
            <td>
                <gw:textarea id="txtMessageContent" styles="width:100%;height:95%" onblur="TextOnBlur()" />
            </td>
        </tr>
    </table>
</body>
</html>
