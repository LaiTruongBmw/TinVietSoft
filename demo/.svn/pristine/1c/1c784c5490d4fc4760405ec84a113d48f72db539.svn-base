<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Daily Report</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	OnAddNew();
	MergeHeaderQuantity();
	MergeHeaderManpower();
	OnSearch();
}
//============================================================================================

//============================================================================================
function MergeHeaderQuantity()
{
        var fg=Grid_Quantity.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Quantity.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 9, 0, 11)  = "Quantity of Completed Work"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 9, 1, 9) = "Cumulation To Last Day"
	    fg.Cell(0, 1, 10, 1, 10) = "Today" 
		fg.Cell(0, 1, 11, 1, 11) = "Cummulation" 
		
		fg.Cell(0, 0, 12, 0, 14)  = "Percentage Of Completed Work"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 12, 1, 12) = "Cumulation To Last Day"
	    fg.Cell(0, 1, 13, 1, 13) = "Today" 
		fg.Cell(0, 1, 14, 1, 14) = "Cummulation" 
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Level 1"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Level 2"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Level 3"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Level 4"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Level 5"	
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "UOM"	
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Weight"	
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Total Plan Quantity"	
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Result"	
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Cumulative Progress Rate"	
		
}
//============================================================================================
function MergeHeaderManpower()
{
        var fg=Grid_Manpower.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Manpower.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 2, 0, 5)  = "Korea"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 2, 1, 2) = "Last Day"
	    fg.Cell(0, 1, 3, 1, 3) = "Today" 
		fg.Cell(0, 1, 4, 1, 4) = "Cummulation" 
		fg.Cell(0, 1, 5, 1, 5) = "Tomorrow" 
		
		fg.Cell(0, 0, 6, 0, 9)  = "Vietnam"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 6, 1, 6) = "Last Day"
	    fg.Cell(0, 1, 7, 1, 7) = "Today" 
		fg.Cell(0, 1, 8, 1, 8) = "Cummulation" 
		fg.Cell(0, 1, 9, 1, 9) = "Tomorrow" 
		
		fg.Cell(0, 0, 10, 0, 13)  = "Other"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 10, 1, 10) = "Last Day"
	    fg.Cell(0, 1, 11, 1, 11) = "Today" 
		fg.Cell(0, 1, 12, 1, 12) = "Cummulation" 
		fg.Cell(0, 1, 13, 1, 13) = "Tomorrow" 
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Job"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Unit"	
}
//============================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case'List':
            dso_61080010.Call("SELECT");
        break;
        case'Master':
            txtMasterPK.text=Grid_Mst.GetGridData(Grid_Mst.row,0)
            dso_61080010_1.Call("SELECT");
        break;
    }
}
//============================================================================================
function OnAddNew()
{
    dso_61080010_1.StatusInsert();
    dso_61080010_2.StatusInsert();
    Grid_Equipment.ClearData();
    Grid_Material.ClearData();
    Grid_Attached.ClearData();
}
//============================================================================================
var flag="";
function OnSave ()
{
    if(txtProject_Pk.text!="")
    {
        flag="save";
        dso_61080010_1.Call();
    }
}
//============================================================================================
function OnSaveFile()
{
	DSO_ATTACH_FILE.Call();
}
//============================================================================================
function DeleteAtt()
{
    if(confirm('Do you want to delete selected file ?'))
			{
			     Grid_Attached.DeleteRow();
			     DSO_ATTACH_FILE.Call();
			}
}
//============================================================================================
function OnDelete()
{
    if(txtMasterPK.text!="")
    {
        if(confirm("Are you sure to Delete ? "))
        {
            dso_61080010_1.StatusDelete()
            dso_61080010_1.Call();
        }
    }
}

//============================================================================================
function OnDeleteGrid(obj)
{
    switch(obj)
    {
        case'Grid_Equipment':
            if(Grid_Equipment.row>0)
            {
                if(Grid_Equipment.GetGridData(Grid_Equipment.row,0)!="")
                {
                    Grid_Equipment.DeleteRow();
                }
                else
                {
                    Grid_Equipment.RemoveRow();
                }
            }
        break;
        case'Grid_Material':
            if(Grid_Material.row>0)
            {
                if(Grid_Material.GetGridData(Grid_Material.row,0)!="")
                {
                    Grid_Material.DeleteRow();
                }
                else
                {
                    Grid_Material.RemoveRow();
                }
            }
        break;
    }
}
//============================================================================================
function OnUnDeleteGrid(pos)
{
    switch(pos)
    {
        case'Grid_Equipment':
            Grid_Equipment.UnDeleteRow();
        break;
        case'Grid_Material':
            Grid_Material.UnDeleteRow();
        break;
    }
}
//============================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                            } 
                break;

                case 'Item' :
        
                             var path = System.RootURL + "/form/61/08/61080011.aspx";
                             var object = System.OpenModal( path , 500 , 400 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	                         if ( object != null )
	                         {
                                var arrTemp
                                for( var i=0; i < object.length; i++)	  
                                {	
                                    arrTemp = object[i];
                                    Grid_Equipment.AddRow();
                                    Grid_Equipment.SetGridText( Grid_Equipment.rows-1,10,txtMasterPK.text) ;//master_pk	    	                   
                                    Grid_Equipment.SetGridText( Grid_Equipment.rows-1, 1,arrTemp[0]);//item_pk	    
                                    Grid_Equipment.SetGridText( Grid_Equipment.rows-1, 2,arrTemp[1]);//item_code	    
                                    Grid_Equipment.SetGridText( Grid_Equipment.rows-1, 3,arrTemp[2]);//item_name	    
                                    Grid_Equipment.SetGridText( Grid_Equipment.rows-1, 4,arrTemp[3]);//uom
                               }  	            
	                         }	 	           
                break;
                
                case 'Item2' :
        
                             var path = System.RootURL + "/form/61/08/61080011.aspx";
                             var object = System.OpenModal( path , 500 , 400 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	                         if ( object != null )
	                         {
                                var arrTemp
                                for( var i=0; i < object.length; i++)	  
                                {	
                                    arrTemp = object[i];
                                    Grid_Material.AddRow();
                                    Grid_Material.SetGridText( Grid_Material.rows-1,9,txtMasterPK.text) ;//master_pk	    	                   
                                    Grid_Material.SetGridText( Grid_Material.rows-1, 3,arrTemp[0]);//item_pk	    
                                    Grid_Material.SetGridText( Grid_Material.rows-1, 4,arrTemp[1]);//item_code	    
                                    Grid_Material.SetGridText( Grid_Material.rows-1, 5,arrTemp[2]);//item_name	    
                                    Grid_Material.SetGridText( Grid_Material.rows-1, 6,arrTemp[3]);//uom
                               }  	            
	                         }	 	           
                break;
		}
}
//============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'dso_61080010_1':
            if(flag=="save")
            {
                dso_61080010_2.Call();
            }
            else
            {
                dso_61080010_2.Call("SELECT");
            }
            
        break;
        case'dso_61080010_2':
            if(flag=="save")
            {
                for(var i=1;i<Grid_Equipment.rows;i++)
                {
                    Grid_Equipment.SetGridText(i,10,txtMasterPK.text);
                }
                dso_61080010_5.Call();
            }
            else
            {
                dso_61080010_5.Call("SELECT");
            } 
        break;
        case'dso_61080010_5':
            if(flag=="save")
            {
                
                dso_61080010_6.Call();
            }
            else
            {
                dso_61080010_6.Call("SELECT");
            } 
        break;
        case'dso_61080010_6':
            if(flag=="save")
            {
                DSO_ATTACH_FILE.Call();
            }
            else
            {
                DSO_ATTACH_FILE.Call("SELECT");
            } 
            flag="";
        break;
        
    }
}
//============================================================================================
function AttachFiles()
    {
            if(txtMasterPK.text != '')
           { 
		
                    imgFile.MasterPK=txtMasterPK.text;
                    imgFile.ChangeImage();
		   
                    if( imgFile.oid == 0 )
                    {
                        return false;
                    }
                    else
                    {
						Grid_Attached.SetGridText( Grid_Attached.rows - 1, 4, txtMasterPK.text);   		
                        DSO_ATTACH_FILE.Call();
                    }
                    imgFile.oid= "";     
            } 
        else
        {
                alert('Please save data first!!');
        }     
}
//============================================================================================
function OnOpenFile()
{
        var img_pk = Grid_Attached.GetGridData(Grid_Attached.GetGridControl().row,4)	;
        var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=tecps_subcontappdfile";	
        window.open(url);
}
//============================================================================================
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");   
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/right1.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/left1.gif";
    }
 }

</script>

<body>
    <!------------------------------------------------------------------------------------------------------------------>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="DSO_ATTACH_FILE" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5"  function="PM_SEL_61080010_FILE"  procedure="PM_UPD_61080010_FILE">
          <input bind="Grid_Attached" >
          <input bind="txtMasterPK" />
          </input>
          <output bind="Grid_Attached" />
        </dso>
      </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_61080010_6" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="PM_SEL_61080010_MATERIAL" parameter="0,1,2,3,4,5,6,7,8,9" procedure="PM_UPD_61080010_MATERIAL" > 
            <input bind="Grid_Material">    
                <input bind="txtMasterPK" />      
            </input> 
            <output bind="Grid_Material" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_61080010_5" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="PM_SEL_61080010_EQUIPMENT" parameter="0,1,2,3,4,5,6,7,8,9,10" procedure="PM_UPD_61080010_EQUIPMENT"> 
            <input bind="Grid_Equipment">    
                <input bind="txtMasterPK" />      
            </input> 
            <output bind="Grid_Equipment" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_61080010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="PM_SEL_61080010_2" parameter="0,1,2,3,4,5" procedure="PM_UPD_61080010_2"> 
                <inout> 
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtTab1PK" />
                     <inout  bind="lstWeather" />
                     <inout  bind="txtTodayResult" />
                     <inout  bind="txtTomorrowPlan" />
                     <inout  bind="txtRemark" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_61080010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="PM_SEL_61080010_1" parameter="0,1,2,3,4" procedure="PM_UPD_61080010_1" > 
                <inout> 
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtProject_Pk" />
                     <inout  bind="txtProject_Cd" />
                     <inout  bind="txtProject_Nm" />
                     <inout  bind="dtDateOfResult" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_61080010" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="PM_SEL_61080010" > 
            <input bind="Grid_Mst">    
                <input bind="txtProject" />      
                <input bind="dtFrom" />  
                <input bind="dtTo" />           
            </input> 
            <output bind="Grid_Mst" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 30%;" id="idLEFT" valign="top">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 1%; width: 100%">
                        <td>
                            <fieldset style="width: 100%; padding: 0">
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35%" align="right">
                                            Project&nbsp;</td>
                                        <td width="65%">
                                            <gw:textbox id="txtProject" onenterkey="OnSearch('List')" styles='width:100%' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btSve2" img="search" alt="Search" onclick="OnSearch('List')" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Date&nbsp;</td>
                                        <td>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="49%" align="left">
                                                        <gw:datebox id="dtFrom" lang="1" />
                                                    </td>
                                                    <td width="2%" align="center">
                                                        ~</td>
                                                    <td width="49%" align="right">
                                                        <gw:datebox id="dtTo" lang="1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%; width: 100%">
                        <td width="100%">
                            <gw:grid id="Grid_Mst" header="_PK|Project Code|Project Name|Project Date" format="0|0|0|4"
                                aligns="0|0|0|0" defaults="|||" editcol="0|0|0|0" widths="0|1500|2000|1500" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 70%" id="idRIGHT">
                <table style="width: 100%; height: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 4%">
                        <td>
                            <fieldset style="padding: 0; background-color: #CCFFFF">
                                <table width="100%" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td width="15%" align="right">
                                            <a href="#" title="Click here to show Project" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                Project&nbsp;</a></td>
                                        <td width="85%">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="60%">
                                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td>
                                                        <gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <gw:imgbtn id="bve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibtnNew" img="new" alt="Add New" onclick="OnAddNew()" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibConfirm" img="confirm" alt="Confim" onclick="OnConfim()" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibCancelConfirm" img="cancel" alt="Cancel Confim" onclick="OnCancel()" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibtnUpdate" img="save" alt="save" onclick="OnSave()" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Date of Result&nbsp;</td>
                                        <td>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%">
                                                        <gw:datebox id="dtDateOfResult" lang="1" />
                                                    </td>
                                                    <td align="right" width="58%">
                                                        Percentage of completed work (Result / Plan)&nbsp;</td>
                                                    <td width="30%">
                                                        <gw:textbox id="txtPercentage" styles='width:100%' />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td colspan="5">
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td width="100%">
                            <gw:tab id="idTab">
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Daily Report" id="Tab1"
                                cellpadding="0" cellspacing="0">
                                <tr height="2%">
                                    <td>
                                        <fieldset style="width: 100%; padding: 0">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="right" width="10%">
                                                        <a href="#" title="Click here to show Weather" style="text-decoration: none" onClick="OnPopUp('Weather')">
                                                            Weather&nbsp;</a></td>
                                                    <td width="25%">
                                                        <gw:list id="lstWeather" styles='width:100%' />
                                                    </td>
                                                    <td width="65%">
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr height="98%">
                                    <td>
                                        <table border="1" style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                            <tr height="2%" bgcolor="#CCFFFF">
                                                <td align="center" width="50%" height="25">
                                                    Today's Result</td>
                                                <td align="center" width="50%" height="25">
                                                    Plan for Tomorrow</td>
                                            </tr>
                                            <tr height="68%">
                                                <td width="50%">
                                                    <gw:textarea id="txtTodayResult" styles='width:100%;height:100%' />
                                                </td>
                                                <td width="50%">
                                                    <gw:textarea id="txtTomorrowPlan" styles='width:100%;height:100%' />
                                                </td>
                                            </tr>
                                            <tr height="2%" bgcolor="#CCFFFF" bordercolor="#0099FF">
                                                <td align="center" width="50%" height="25" colspan="2">
                                                    Remark</td>
                                            </tr>
                                            <tr height="28%">
                                                <td width="100%" colspan="2">
                                                    <gw:textarea id="txtRemark" styles='width:100%;height:100%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Quantity" id="Tab2"
                                cellpadding="0" cellspacing="0">
                                <tr height="100%">
                                    <td>
                                        <!--header="0.Level 1|1.Level 2|2.Level 3|3.Level 4|4.Level 5|5.UOM|6.Weight|7.Total Plan Quantity|8.Result|9.Cumulation to Last Day|10.Today|11.Cummulation|12.Cumulation to Last Day|13.Today|14.Cummulation|15.Cumulative Progress Rate" -->
                                        <gw:grid id="Grid_Quantity" header="Level 1|Level 2|Level 3|Level 4|Level 5|UOM|Weight|Total Plan Quantity|Result|Cumulation to Last Day|Today|Cummulation|Cumulation to Last Day|Today|Cummulation|Cumulative Progress Rate"
                                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="1|1|0|0|1|1|1|0|0|1|0|0|0|0|0|0"
                                            defaults="|||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" widths="2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"
                                            styles="width:100%; height:100%" sorting="T" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Manpower" id="Tab3"
                                cellpadding="0" cellspacing="0">
                                <tr height="100%">
                                    <td width="100%">
                                        <!--header="0.Job|1.Unit|2.Last Day|3.Today|4.Cummulation|5.Tomorrow|6.Last Day|7.Today|8.Cummulation|9.Tomorrow|10.Last Day|11.Today|12.Cummulation|13.Tomorrow"   -->
                                        <gw:grid id="Grid_Manpower" header="Job|Unit|Last Day|Today|Cummulation|Tomorrow|Last Day|Today|Cummulation|Tomorrow|Last Day|Today|Cummulation|Tomorrow"
                                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="1|1|0|0|1|1|1|0|0|1|0|0|0|0" defaults="|||||||||||||"
                                            editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1" widths="2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"
                                            styles="width:100%; height:100%" sorting="T" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Equipment" id="Tab4"
                                cellpadding="0" cellspacing="0">
                                <tr height="2%">
                                    <td>
                                        <fieldset style="width: 100%; padding: 0">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="100%">
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibPopup1" img="popup" alt="Select Item" onclick="OnPopUp('Item')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibDelete1" img="delete" alt="Delete" onclick="OnDeleteGrid('Grid_Equipment')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibUnDelete1" img="udelete" alt="Undelete" onclick="OnUnDeteleGrid('Grid_Equipment')" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr height="98%">
                                    <td>
                                        <gw:grid id='Grid_Equipment' header='_PK|_TCO_ITEM_PK|Equipment Item Code|Equipment Item Name|UOM|Last Day|Today|Cummulation|Tomorrow|Remark|_master_pk'
                                            format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0' check='||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1'
                                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                            styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Material" id="Tab5"
                                cellpadding="0" cellspacing="0">
                                <tr height="2%">
                                    <td>
                                        <fieldset style="width: 100%; padding: 0">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="100%">
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibPopUp2" img="popup" alt="Select Incoming Material" onclick="OnPopUp('Item2')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibDelete2" img="delete" alt="Delete" onclick="OnDeleteGrid('Grid_Material')" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibUnDelete2" img="udelete" alt="Undelete" onclick="OnUnDeteleGrid('Grid_Material')" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr height="98%">
                                    <td>
                                        <gw:grid id='Grid_Material' header='_PK|Voucher No|PO No|_TCO_ITEM_PK|Item Code|Item Name|UOM|Incoming Q`ty|Description|_master_pk'
                                            format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' check='|||||||||' editcol='1|1|1|1|1|1|1|1|1|1'
                                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                            styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%; height: 100%; overflow: scroll" name="Attached File" id="Tab6"
                                cellpadding="0" cellspacing="0">
                                <tr height="2%">
                                    <td>
                                        <fieldset style="width: 100%; padding: 0">
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="100%">
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibAttFile" img="attach" alt="Attach" onclick="AttachFiles()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibDeleteFile" img="delete" alt="Delete" onclick="DeleteAtt()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="Save" img="save" alt="Update" onclick="OnSaveFile()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr height="98%">
                                    <td>
                                        <gw:grid id="Grid_Attached" header="_No|Entry Date|File Name|Description|_pk|_master_pk" format="0|4|0|0|0|0"
                                            aligns="1|0|0|0|0|0" defaults="|||||" editcol="1|1|1|1|1|1" widths="600|1500|5000|2000|1000|1000"
                                            styles="width:100%; height:100%" sorting="T" oncelldblclick="OnOpenFile()"/>
                                    </td>
                                </tr>
                            </table>
                            </gw:tab>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <img status="expand" id="imgArrow" src="../../../system/images/left1.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
</body>
<gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
<gw:textbox id="txtTab1PK" styles='width:100%;display:none' />
<gw:image id="imgFile" table_name="tecps_subcontappdfile" view="/binary/ViewFile.aspx"
    post="/binary/PostFile.aspx" styles="width:100;height:100;display:none" />
</html>
