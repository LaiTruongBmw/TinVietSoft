<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Spec</title>
</head>

<script type="text/javascript" language="javascript">
 
var G_No			= 0,
	G_SPEC_PK		= 1,
	G_SPEC_ID		= 2,
	G_SPEC_NM		= 3,
	G_SPEC_NM_01	= 4,
	G_SPEC_NM_02	= 5,
	G_REMARK		= 6;
 
//--------------------------------------------------------

function BodyInit()
{
	System.Translate(document);
    //--------------------------------
    var spec_id  = "<%=Request.QueryString("spec_id")%>";
    txtSpec.text = spec_id;    
    //--------------------------------
    
    var data;
    data = "<%=CtlLib.SetListDataSQL("select PK, SPECGRP_NM from TLG_IT_SPECGRP where DEL_IF=0 order by SPECGRP_NM")%>";   
    lstSpecGroup.SetDataText(data);
    lstSpecGroup.SetEnable(false);
	
    var pk="<%=request.QueryString("pk")%>";
    lstSpecGroup.SetDataText(pk);          
     
     data_fpab00540.Call('SELECT');  
}
//--------------------------------------------------------

function DSOReceive( dsoinfo  )
{

	if ( dsoinfo.errno > 0 )
	{
		alert( dsoinfo.errmsg );
		return ;
	}
} 
//------------------------------------------------------------
function RowDbClick(oGrid)
{    
	    var code_data = new Array();       
	    
		if ( oGrid.col == 0 )
		{
		    if ( oGrid.row > 0 )
		    {
	            for( j=0 ; j<oGrid.cols ; j++ )
	            {
	                code_data[j] = oGrid.GetGridData(oGrid.row , j );
	            } 
		    }
		    else 
		    {
	            for( j=0 ; j<oGrid.cols ; j++ )
	            {
	                code_data[j] = '';
	            } 	    
		    }
		    //----------------------------
		    window.returnValue = code_data; 
		    this.close(); 
		}	
}
//--------------------------------------------------------
function OnNew()
{
 //    Modify: 20080606
     idGrid.AddRow();
     idGrid.SetGridText(idGrid.rows-1,2,Trim(txtSpec.text));
     idGrid.SetGridText(idGrid.rows-1,8,lstSpecGroup.GetData());
}
//--------------------------------------------------------

function OnRemove()
{ 
	if ( idGrid.row > 0 )
	{
	    if (idGrid.GetGridData(idGrid.row, 0) == '')
	    {
	        idGrid.RemoveRowAt(idGrid.row);
	    }
	    else
	    {
	        idGrid.DeleteRow();
	    }
	}	
}
//--------------------------------------------------------

function OnSave()
{
  if(CheckDataIsvalid())
  {
    data_fpab00540.Call();
  }
   
}
//-------------------------------------------------------- 
function CheckDataIsvalid()
{
  for (var i=1;i<idGrid.rows;i++)
  {
     if(Trim(idGrid.GetData(i,2))=="")
     {
        alert("Please input ID of spec.");
        return false;
     }
     
     if(Trim(idGrid.GetData(i,3))=="")
     {
        alert("Please input Name of spec.");
        return false;
     }
  }
  return true;
}
//--------------------------------------------------------
function OnSearch()
{
  data_fpab00540.Call('SELECT');
}
 
 
//--------------------------------------------------------

function OnDataReceive(obj)
{
    if (idGrid.rows>1)
    {
         lbRecord.text = (idGrid.rows -1 ) +" record(s)";
         idGrid.SetCellBgColor(1,0,idGrid.rows -1 ,0,0xd4d3ff);
    }
}
//--------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00540" onreceive="OnDataReceive(this)"> 
        <xml>                                   
             <dso id="1" type="grid" user="comm"  parameter="1,2,3,4,5,8,9,10,12,13,14" function="st_lg_sel_fpab00540"  procedure="st_lg_upd_fpab00540"> 
              <input  bind="idGrid">
                    <input bind="lstSpecGroup" />                   
                    <input bind="txtSpec" />
                </input>
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td colspan=2 >
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            Type</td>
                        <td style="width: 45%">
                            <gw:list id="lstSpecGroup" styles="width:100%"></gw:list>
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <b>Spec(ID/Name)</b></td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtSpec" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>           
                        <td style="width: 1%">                           
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnNew" img="new" alt="Add new" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnCancel" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">            
            <td style="width: 80%" align="left">
                <b style="color: Red; text-overflow: ellipsis">* Double click column 'No' to select</b></td>
            <td style="width: 20%" align="right">
                <b style="color: Blue">
                    <gw:label id="lbRecord" />
                </b>
            </td>                    
        </tr>
        <tr style="height: 98%">          
           <td  colspan=2 >
               <gw:grid id="idGrid" header="No|_PK|Spec ID|Spec Name|F. Name 01|F. Name 02|_remark|_grpname|_grpspec_pk|_Group|_Partner_PK|_Partner Name|_Product S.Code|_ST Item|_ST Mapping"
                   format="0|0|0|0|0|0|0|0|0|2|0|0|0|0|0" aligns="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                   defaults="||||||||||||||" editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1" widths="500|0|1500|2000|2000|2000|0|0|0|2000|0|2000|2000|1500|200"
                   styles="width:100%; height:100%" sorting="T" oncelldblclick="RowDbClick(idGrid)" oncellclick=""
                   param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" />
           </td>                    
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
 
    <!------------------------------------------------------------------------------>
</body>
</html>
