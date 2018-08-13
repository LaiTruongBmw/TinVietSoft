<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>MAINTENANCE BASIC INFO</title>
</head>

<script type="text/javascript" language="javascript">
var _flag_Action = '';
var G1_PK                 = 0,   
    G1_SEQ                = 1,   
    G1_PROCESS_TYPE       = 2,   
    G1_PROCESS_ID         = 3,
    G1_PROCESS_NAME       = 4,
    G1_DESCRIPTION        = 5,
    G1_ST_AMOUNT          = 6;        
   
var G2_PK                    = 0,
    G2_SEQ                   = 1,
    G2_MA_PROCESS_PK         = 2,
    G2_MA_TASK_TYPE          = 3,
    G2_MA_TASK_TYPE_NAME     = 4,
    G2_MA_TASK_PK            = 5,
    G2_MA_TASK_ID            = 6,
    G2_MA_TASK_NAME          = 7;
   
var G3_PK                    = 0,
    G3_SEQ                   = 1,
    G3_PARK_PK               = 2,
    G3_ITEM_CODE             = 3,
    G3_ITEM_NAME             = 4,
    G3_QTY                   = 5,
    G3_MA_PROCESS_PK         = 6;

//=================================================================================

function BodyInit()
{
    System.Translate(document);
    txtProcessPK.SetEnable(false);
    txtProcessID.SetEnable(false);
    txtProcessName.SetEnable(false);
    grdProcessTask.SetEnable(false);
    BindingDataList(); 
    //----------------------------

    OnSearch(grdProcess);    
    
}
//=================================================================================
function BindingDataList()
{
    var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
    grdProcessTask.SetComboFormat(G2_MA_TASK_TYPE,data);
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1150' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
    grdProcess.SetComboFormat(G1_PROCESS_TYPE,data);
	
	data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1150') FROM DUAL")%>||"; //ma type
    lstProcessType.SetDataText(data);
    lstProcessType.value='';  
     
     
	var ctrl = grdProcessTask.GetGridControl();
    ctrl.ColFormat(G2_SEQ) = "###,###,###,###,###";
    ctrl = grdProcessCons.GetGridControl();
    ctrl.ColFormat(G3_SEQ) = "###,###,###,###,###";
    ctrl.ColFormat(G3_PARK_PK) = "###";
    ctrl.ColFormat(G3_QTY) = "###,###,###,###,###";
    ctrl = grdProcess.GetGridControl();
    ctrl.ColFormat(G1_SEQ) = "###,###,###,###,###";
	
}
//=================================================================================
function OnGridCellClick(objGrid)
{
    var row,col 
      row = event.row;
      col = event.col;
 
      if (grdProcess.id =='grdProcess')
      {
            if(objGrid.GetGridData(row,col)!='')
            {
                txtProcessPK.text = objGrid.GetGridData(row,G1_PK);
                txtProcessID.text = objGrid.GetGridData(row,G1_PROCESS_ID);
                txtProcessName.text = objGrid.GetGridData(row,G1_PROCESS_NAME);
                data_fpma00010_1.Call('SELECT');
            }
      }
}
     
//=================================================================================
function OnPopUp(pos)
{
    var fpath = '';
    switch(pos)
    {
        case 'ProcessTask':
        {
            if(txtProcessPK.text == '')
            {
                alert('Please Select Process!');   
                return;
            }       
            var tmpVal = '';
            for(var i =1; i < grdProcessTask.rows; i ++)
            {
                tmpVal = tmpVal + grdProcessTask.GetGridData(i, G2_MA_TASK_PK) + '|';
            }     
            if(tmpVal!='')
            {
                tmpVal = tmpVal.substr(0, tmpVal.length-1);
            }
	        fpath = System.RootURL + "/form/fp/ma/fpma00011.aspx?tmpVal=" + tmpVal;
	        var aValue  = System.OpenModal(  fpath , 900 , 600 , 'scroll:no;resizable:yes;status:yes');
	        var objGrid = grdProcessTask;
	        if(aValue!=null)
	        {
	            for(var i = 0; i< aValue.length; i++)
	            {
	                objGrid.AddRow();
	                var arrTemp = aValue[i];
	                objGrid.SetGridText( objGrid.rows-1, G2_SEQ ,objGrid.rows-1);
	                objGrid.SetGridText( objGrid.rows-1, G2_MA_PROCESS_PK ,txtProcessPK.text );
                    objGrid.SetGridText( objGrid.rows-1, G2_MA_TASK_TYPE ,arrTemp[3]);                    
                    objGrid.SetGridText( objGrid.rows-1, G2_MA_TASK_PK ,arrTemp[0] );
                    objGrid.SetGridText( objGrid.rows-1, G2_MA_TASK_ID ,arrTemp[1] );
                    objGrid.SetGridText( objGrid.rows-1, G2_MA_TASK_NAME ,arrTemp[2] );
                    objGrid.SetCellBgColor(objGrid.rows-1,0, objGrid.rows-1, objGrid.cols-1,0xDAFFA6);
                }
	        }	    
	    }
	    break;
	    case 'ProcessCons':
	        if(txtProcessPK.text == '')
            {
                alert('Please Select Process!');   
                return;
            }
	        path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y||||';//+ txtStylePK.text;
	        var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	        if(object!=null)
	        {
	            var objGrid = grdProcessCons;
                for(var i = 0; i< object.length; i++)
                {
                    objGrid.AddRow();
                    var arrTemp = object[i];
                    objGrid.SetGridText( objGrid.rows-1, G3_MA_PROCESS_PK ,txtProcessPK.text);
                    objGrid.SetGridText( objGrid.rows-1, G3_SEQ ,objGrid.rows-1);
                    objGrid.SetGridText( objGrid.rows-1, G3_PARK_PK ,arrTemp[0] );
                    objGrid.SetGridText( objGrid.rows-1, G3_ITEM_CODE ,arrTemp[1] );
                    objGrid.SetGridText( objGrid.rows-1, G3_ITEM_NAME ,arrTemp[2] );
                    objGrid.SetGridText( objGrid.rows-1, G3_QTY ,arrTemp[6] );
                    objGrid.SetCellBgColor(objGrid.rows-1,0, objGrid.rows-1, objGrid.cols-1,0xDAFFA6);
                }
	        }
	    break;
	    case 'Pro_Type':
	        path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC1150";
	        var obj = System.OpenModal( path ,800 ,600 ,'scroll:no;resizable:yes;status:yes');
	        if ( obj != null )
            {
                var data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1120') FROM DUAL")%>||";  //payment term
                lstProcessType.SetDataText(data);
                lstProcessType.value = obj[1];  
                data = "<%=ESysLib.SetGridColumnDataSQL("SELECT   a.code, a.code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE b.GROUP_ID = 'LGPC1150' AND a.tlg_lg_code_group_pk = b.pk AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.code, a.code_nm " ) %> ";
                grdProcess.SetComboFormat(G1_PROCESS_TYPE,data);
            }
	    break;
	    default:
	    break;
	}
}

//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {      
        case "data_fpma00010" :
             lblRecord_M.text=grdProcess.rows-1 + " record(s).";
			 
             if ( grdProcess.rows>0 )
             {
                txtProcessPK.text 	= grdProcess.GetGridData(1, G1_PK           );
                txtProcessID.text 	= grdProcess.GetGridData(1, G1_PROCESS_ID   );
                txtProcessName.text = grdProcess.GetGridData(1, G1_PROCESS_NAME );
				if(_flag_Action=='SAVE')
				{
                    data_fpma00010_1.Call();
                }
                else
                {
                    data_fpma00010_1.Call('SELECT');
                }
             }            
        break;
        
        case "data_fpma00010_1" :
             lblRecord_M1.text=grdProcessTask.rows-1 + " record(s).";   
			          
             if ( grdProcessTask.rows > 0 )
             {
                if(_flag_Action=='SAVE')
                {
                    data_fpma00010_2.Call();
                }
                else
                {
                    data_fpma00010_2.Call('SELECT');
                }
             }
        break;
		
        case 'data_fpma00010_2':
            lblRecord_M2.text=grdProcessCons.rows-1 + " record(s).";            
            _flag_Action = '';
        break;
    }    
}
//=================================================================================
function OnAddNew(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdProcess':
            objGrid.AddRow();
        break;
		
        case 'grdProcessTask':
            if(txtProcessPK.text!='')
            {
                objGrid.AddRow();
            }
            else
			{
            	alert('Please Select Process !');   
            }
        break;
        
        
    }
}
//=================================================================================
function OnDelete(objGrid)
{
    switch (objGrid.id)
    {
        
	        //-----------------------------------------------------
	        case 'grdProcessTask' :	         	        
	            if ( objGrid.GetGridData( objGrid.row, G2_PK ) == "" ) 
	            {						        		
				    objGrid.RemoveRow();					
		        }			
		        else 
		        {
			        objGrid.DeleteRow();
                }	   
		    break;
		   //-------------------------------------------------------- 
		    case 'grdProcess' :
	            if ( objGrid.GetGridData( objGrid.row, G1_PK ) == "" ) 
	            {						        		
				    objGrid.RemoveRow();					
		        }			
		        else 
		        {
			        objGrid.DeleteRow();
                }	   
		    break;
			
		    case 'grdProcessCons':
		        if ( objGrid.GetGridData( objGrid.row, G3_PK ) == "" ) 
	            {						        		
				    objGrid.RemoveRow();					
		        }			
		        else 
		        {
			        objGrid.DeleteRow();
                }	   
           break;
        }
 }
//=================================================================================
function OnUnDelete(objGrid)
{
     switch (objGrid.id)
     {  
             case 'grdProcessTask' :  
                    objGrid.UnDeleteRow();
             break;            
             
             case 'grdProcess' :                     
                    objGrid.UnDeleteRow();                  
             break;
			 
             case 'grdProcessCons' :                      
                    objGrid.UnDeleteRow();                  
             break;
     }      
} 
//=================================================================================
function OnSave(objGrid)
{  	
    _flag_Action = 'SAVE';
    data_fpma00010.Call();
}
//=================================================================================
function OnSearch(objGrid)
{
    switch (objGrid.id)
    {
        case 'grdProcess' :
		
            txtProcessPK.text = '';
            txtProcessID.text = '';
            txtProcessName.text = '';
			             
            data_fpma00010.Call("SELECT");
        break;
        
        case 'grdProcessCons' :
            data_fpma00010_2.Call("SELECT");
        break;                             
    }
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00010" parameter="0,1,2,3,4,5,6" procedure="<%=l_user%>lg_upd_fpma00010" > 
                <input bind="grdProcess" >
                    <input bind="txtProcess" />
                    <input bind="lstProcessType" />
                </input>
                <output  bind="grdProcess" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter ="0,1,2,5" function="<%=l_user%>lg_sel_fpma00010_1" procedure="<%=l_user%>lg_upd_fpma00010_1" > 
                <input bind="grdProcessTask" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpma00010_2" parameter="0,1,2,5,6" procedure="<%=l_user%>lg_upd_fpma00010_2" > 
                <input bind="grdProcessCons" >
                    <input bind="txtProcessPK" />
                </input>
                <output  bind="grdProcessCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr style="width: 100%; height: 100%">
            <td style="height: 100%; width: 50%">
                <fieldset style="height: 100%; width: 100%; padding: 0 0 0 0; margin: 0 0 0 0;">
                    <legend>Setup Process Info:</legend>
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td>
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td style="width: 5%; white-space: nowrap" align="right">
                                            Process
                                        </td>
                                        <td style="width: 30%">
                                            <gw:textbox id="txtProcess" csstype="mandatory" text="" styles='width:100%' onenterkey="OnSearch(grdProcess)" />
                                        </td>
                                        <td style="width: 5%">
                                            <a title="Pro.Type" onclick="OnPopUp('Pro_Type')" href="#tips" style="color: #0000ff">
                                                <b>Pro.Type</b></a>
                                        </td>
                                        <td style="width: 30%">
                                            <gw:list id="lstProcessType" styles="width:100%;" onchange="OnSearch(grdProcess)" />
                                        </td>
                                        <td style="width: 25%" align="center">
                                            <gw:label img="new" id="lblRecord_M" styles="color:red; font-size: 12" text="0 record(s)." />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(grdProcess)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnNew" img="new" alt="Add New" onclick="OnAddNew(grdProcess)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdProcess)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnUnDelete" img="udelete" alt="Un Delete" onclick="OnUnDelete(grdProcess)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave(grdProcess)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 49%">
                            <td>
                                <gw:grid id='grdProcess' header='_PK|Seq|Pro.Type|Pro.Id|Pro.Name|Description|Amount'
                                    format='1|1|2|0|0|0|1' aligns='3|1|0|0|0|0|3' check='||||||' editcol='1|1|1|1|1|1|1'
                                    widths='10|500|1000|1000|2000|2000|1000' styles='width:100%; height:100%' sorting='F'
                                    oncellclick='OnGridCellClick(this)' />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td style="height: 100%; width: 50%">
                <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 50%; width: 100%">
                        <td>
                            <fieldset style="height: 100%; width: 100%; padding: 0 0 0 0; margin: 0 0 0 2;">
                                <legend>Mapping Process With Task:</legend>
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr style="height: 1%">
                                        <td>
                                            <table style="width: 100%; height: 100%">
                                                <tr>
                                                    <td style="width: 5%" align="left">
                                                        Process
                                                    </td>
                                                    <td style="width: 61%; white-space: nowrap;" align="center">
                                                        <gw:textbox id="txtProcessPK" maxlen="100" styles='width:100%;display:none' />
                                                        <gw:textbox id="txtProcessID" csstype="mandatory" styles='width:30%' />
                                                        <gw:textbox id="txtProcessName" csstype="mandatory" styles='width:70%' />
                                                    </td>
                                                    <td style="width: 30%" align="center">
                                                        <gw:label img="new" id="lblRecord_M1" styles="color:red; font-size: 12" text="0 record(s)." />
                                                    </td>
                                                    <td style="width: 1%" align="right">
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnNew1" img="new" alt="Select Task" onclick="OnPopUp('ProcessTask')" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnDelete1" img="delete" alt="Delete" onclick="OnDelete(grdProcessTask)" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnUnDelete1" img="udelete" alt="Un Delete" onclick="OnUnDelete(grdProcessTask)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 99%">
                                        <td>
                                            <gw:grid id='grdProcessTask' header='_PK|Seq|_MA_PROCESS_PK|_TaskTypePK|Task Type|_MA_TASK_PK|Task ID|Task Name'
                                                format='1|1|1|0|0|1|0|0' aligns='2|1|0|0|0|3|0|0' check='||||||' editcol='0|0|0|0|0|0|0|0'
                                                widths='1000|1000|1000|1000|2000|1000|1000|2000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 50%; width: 100%">
                        <td>
                            <fieldset style="height: 100%; width: 100%; padding: 0 0 0 0; margin: 0 0 0 2;">
                                <legend>Maintenance tools:</legend>
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr style="height: 1%">
                                        <td>
                                            <table style="width: 100%; height: 100%">
                                                <tr>
                                                    <td style="width: 5%" align="left">
                                                    </td>
                                                    <td style="width: 50%" align="center">
                                                    </td>
                                                    <td style="width: 42%" align="center">
                                                        <gw:label img="new" id="lblRecord_M2" styles="color:red; font-size: 12" text="0 record(s)." />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnNew2" img="new" alt="Select Item" onclick="OnPopUp('ProcessCons')" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnDelete2" alt="Delete" img="delete" onclick="OnDelete(grdProcessCons)" />
                                                    </td>
                                                    <td style="width: 1%">
                                                        <gw:imgbtn id="btnUnDelete2" alt="Un Delete" img="udelete" onclick="OnUnDelete(grdProcessCons)" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="height: 99%">
                                        <td>
                                            <gw:grid id='grdProcessCons' header='_PK|Seq|_Part Pk|Item Code|Item Name|Qty|_MA_PROCESS_PK'
                                                format='1|1|1|0|0|1|1' aligns='3|1|3|0|0|3|1' check='||||||' editcol='0|0|0|0|0|1|0'
                                                widths='1000|1000|1000|1500|4000|1000|10' styles='width:100%; height:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtGroupPK" text="" style="display: none" />
    <!--------------------------------------------------------->
    <!--------------------------------------------------------->
</body>
</html>
