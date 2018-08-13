<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <title>Depr Schedule</title>
</head>

<script type="text/javascript">

var
    G_PK        = 0,
    G_DATE      = 1,
	G_DEPR_ID	= 2,
    G_USE_YN    = 3,
    G_DESC      = 4;
	
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------
	dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -700));
	dtTo.SetDataText(System.AddDate(dtTo.GetData(), + 3000));
	
    OnBindingList();    
    OnSearch();
 }
//===============================================================
function OnBindingList()
{
}
//===============================================================
function OnSearch()
{
    data_fpma00160.Call("SELECT");
}
//===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_fpma00160' :
                lblRecord.text = (grdDetail.rows - 1) + ' record(s)';			   
            break;   
			
            case 'pro_fpma00160':
                data_fpma00160.Call("SELECT");
            break;         	            
      }	 
 }
  //===============================================================
 function OnProcess()
 {
    pro_fpma00160.Call();
 }
  //=============================================================== 
 function OnAddNew()
 {
    grdDetail.AddRow();
 }
  //===============================================================  
  function OnSave()
  {
    data_fpma00160.Call();
  }
  //===============================================================    
  function OnDelete()
  {
                if ( grdDetail.GetGridData( grdDetail.row, G_PK ) == "" ) 
	            {						        		
				    grdDetail.RemoveRow();					
		        }			
		        else 
		        {
			        grdDetail.DeleteRow();
                }	   
  }
  //===============================================================    
  function OnUnDelete()
  {
    grdDetail.UnDeleteRow();
  }
  //===============================================================
</script>

<body>
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_fpma00160" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpma00160"> 
                <input> 
			        <input	bind="dtFrom"	/>	
					<input	bind="dtTo"	/>		
			    </input> 
                <output>
                    <output bind="txtComp" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fpma00160" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter ="0,1,2,3,4" function="<%=l_user%>lg_sel_fpma00160" procedure="<%=l_user%>lg_upd_fpma00160"> 
                <input bind="grdDetail" >
                    <input	bind="dtFrom"	/>	
					<input	bind="dtTo"	/>
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>  
	<!-------------------------------------------------------------------------->   
     <table border="1"  style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width:1%">Date</td>
                        <td style="width:45%"><gw:datebox id="dtFrom" lang="1" width="10%" /> ~ <gw:datebox id="dtTo" lang="1" width="10%" /></td>
                        <td style="width:100%"></td>
                        <td><gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch()" /></td>
                        <td><gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew()" /></td>
                        <td><gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" /></td>
                        <td><gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete1" onclick="OnUnDelete()" /></td>
                        <td><gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" /></td>
                        <td><gw:icon id="idBtnProcess" img="2" text="Process" styles='width:100%' onclick="OnProcess()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdDetail'
                header='_PK|Date|Depr ID|Use|Remark'
                format='0|4|0|3|0'
                aligns='0|0|1|0|0'
                check='||||'
                editcol='0|1|1|1|1'
                widths='0|1200|1500|800|1500'
                sorting='T'
                styles='width:100%; height:100%'
                />
            </td>
        </tr>
    </table>    
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtComp" styles='width:100%;display:none' />
</body>
</html>
