<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>LOADING DATA FROM EXCEL</title>
</head>

<script>
    /* Version 01
    # V1: Not allow user edit data on the grid
    # Manage data of each row, if one row already existed in database, A confirm message will be shown!
    */
  var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name = "<%=Session("USER_NAME")%>" ;
  
   var  totalCols             = 26 ;
          
    var g1_PO_no = 4;
//----------------------------------------------------- 
 var p_update = 0 ;
function BodyInit()
{
    System.Translate(document); 
     //---------------------------------
    dtImportFrom.SetDataText(System.AddDate(dtImportTo.GetData(),-7));
    //---------------------------------
    LoadList()
}
//-------------------------check file exist----------------

function CheckFilesExist(filepath)
{

        if (Trim(filepath)=='') 
        {
            alert("Please, select an excel source file!!")
            return false;
        }
	    //test file exist
	    var fso = new ActiveXObject("Scripting.FileSystemObject");		

        if (!fso.FileExists(filepath))    
        {
            alert(filepath+" doesn't exist.");        
            return false;
        }	
        return true;
    
}

//-------------------------read data form exel file ----------------

function ReadFiles()
{
    SetStatus('1');
	    idGridBySpec.ClearData();
	    
        var fl = document.getElementById("idtext").value;  
        
        if ( CheckFilesExist(fl) )
        {
            var excel = new ActiveXObject("Excel.Application");
            var excel_file  = excel.Workbooks.Open(fl);
            var excel_sheet = excel.Worksheets("Sheet1");
            
            /*var strDate = new Date();
            var year,month,day;

            year = strDate.getFullYear()+"";
            month =strDate.getMonth()+1 <10?'0'+(strDate.getMonth()+1):strDate.getMonth()+1
            day = strDate.getDate()>9?strDate.getDate():'0'+strDate.getDate()

            var file_name = year + month +day +"-"+excel_file.Name
            */		

            var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                  var lrow, lcol, data
                 
                 for(lrow = 2; lrow <= maxRow ; lrow++) 
                 {
                        idGridBySpec.AddRow();
                        
                        for ( lcol = 4; lcol < idGridBySpec.cols - 5; lcol++ )
                        {
                            data = excel_sheet.Cells( lrow, lcol - 3 ).Value 
                            
                            idGridBySpec.SetGridText( idGridBySpec.rows-1, lcol, data);
                        }
                        
                        idGridBySpec.SetGridText( idGridBySpec.rows-1, 2, excel_file.Name);                    
                 }
          
           excel.Workbooks.Close  ;
           idGridBySpec.GetGridControl().AutoSize( 0, 28, false, 0);  
           lblTotalRecord.text = (idGridBySpec.rows -1)+" record(s)."

        //-----------------
        SetStatus('2');
     }   
}

 //----------------------------------------------------- 

function OnSearch()
{    
        data_dsbs00011_2.Call("SELECT");           
}

//--------------save data into temp_table--------//

 
function OnSave()
{
    SetStatus('1');  
    p_update = 1 ;
    data_dsbs00011_2.Call();       
}
function LoadList()
{
        datFileName.Call();
}
//----------------------------------------------------- 

function OnDataReceive(obj)
{

    switch ( obj.id )
    {
        case "datFileName":
            lstOrderFile.SetDataText(txtFileName.text);
        break;
        
        case "data_dsbs00011_2":
             if ( p_update == 1 ) 
            { 
                p_update = 0
                LoadList()
            } 
            
            SetStatus('2');

        break; 
        
        case "pro_dsbs00011_2":
            if(txtReturnMessage.text == '1')
            {
                if(confirm("PO No ''"+txtPONo.text+"'' is already existed.Do you want to replace it?"))
                {
                    txtFlag.text = 'Y'
                }else
                {   
                    txtFlag.text = 'N'
                }
                pro_dsbs00011_2.Call();
            }
            else
            {
                pro_dsbs00011_3.Call();
            }
            
            SetStatus('2');   
        break; 
        
        case "pro_dsbs00011_3": 
            alert('Finish');
            SetStatus('2');
        break;
                                  
    }
}

 

 //----------------------------------------------------- 

function onEnterKey()
{
    if(event.keyCode==13)
    {
        ReadFiles();
    }
}

 //----------------------------------------------------- 

function OnDelete()
{
       
    if ( idGridBySpec.GetGridData( idGridBySpec.row, 32 ) == "" ) 
    {						
	
         idGridBySpec.RemoveRow();					
    }			
    else 
    {
          idGridBySpec.DeleteRow();
    }			    
                 	
}

 //----------------------------------------------------- 

function onInsertSO()
{
      
    if ( lstOrderFile.value != '' )
    {   
	   
		        txtPONo.text = '';
		        txtFlag.text = 'Y';
		        pro_dsbs00011_2.Call();
		                  
    }    
}


//====================================================================
function SetStatus(pos)
{
    switch (pos)
    {
        case '1' :
            lstOrderFile.SetEnable(false);
            ibtnSearch.SetEnable(false);
            idBtnImportSO.SetEnable(false);
            
            ibtnSave.SetEnable(false);
            //ibtnDelete.SetEnable(false);
            //idtext.SetEnable(false);

        break;
        
        case '2' : 
            lstOrderFile.SetEnable(true);
            ibtnSearch.SetEnable(true);
            idBtnImportSO.SetEnable(true);
            
            ibtnSave.SetEnable(true);
            //ibtnDelete.SetEnable(true);
            //idtext.SetEnable(true);               
        break;
    }   
}

 //====================================================================

</script>

<body>
    <!-------------------------------------->
    <gw:data id="data_dsbs00011_2" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33" function="sale.sp_sel_dsbs00011_2_v01" procedure="SALE.sp_upd_dsbs00011_2_v01"> 
                <input> 
                    <input bind="lstOrderFile" /> 
                    <input bind="dtImportFrom" />  
                    <input bind="dtImportTo" />
                </input> 
                <output bind="idGridBySpec" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------->
    <gw:data id="pro_dsbs00011_2" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso type="process" procedure="sale.sp_pro_dsbs00011_2_v01" > 
                <input>
                    <input bind="lstOrderFile" />
                     <input bind="txtFlag" />  
                     <input bind="txtPONo" />               
                </input> 
                <output>
                    <output bind="txtReturnMessage" />
                    <output bind="txtPONo" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------->
    <gw:data id="pro_dsbs00011_3" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso type="process" procedure="sale.sp_pro_dsbs00011_3_v01" > 
                <input>
                     <input bind="lstOrderFile" />              
                </input> 
                <output>
                    <output bind="txtReturnMessage" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------->
    <gw:data id="datFileName" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso type="list" procedure="sale.sp_pro_dsbs00011_v01" > 
                <input>
                    <input bind="dtImportFrom" /> 
                    <input bind="dtImportTo" />
                </input> 
                <output>
                    <output bind="txtFileName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%; background-color: Gray">
                    <!--#BDE9FF -->
                    <tr>
                        <td align="right" style="width: 10%">
                            <b>File Path</b>
                        </td>
                        <td style="width: 80%" colspan="4">
                            <input type="file" id="idtext" style="" size="100%" onchange="ReadFiles()">
                        </td>
                        <td align="left" style="width: 5%">
                            <gw:button id="ibtnDelete" img="delete" text="Delete" styles='display:none' onclick="OnDelete()" />
                        </td>
                        <td align="left" style="width: 5%">
                            <gw:button id="ibtnSave" img="save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%">
                            <b>Import Date</b>
                        </td>
                        <td align="left" style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtImportFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtImportTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:button id="ibtnRefresh" img="refresh" alt="Refresh File List" onclick="LoadList()" />
                        </td>
                        <td align="right" style="width: 10%">
                            <b>Files</b>
                        </td>
                        <td style="width: 49%">
                            <gw:list id="lstOrderFile" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 10%" colspan="2">
                            <gw:button id="idBtnImportSO" img="Insert SO" text="Insert SO" onclick="onInsertSO()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right"> 
                            <gw:label id="lblTotalRecord" styles='width:100%;color:cc0000;font:9pt' text='item' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 97%">
            <td id="Tab-BySpec">
                <gw:grid id='idGridBySpec' 
                    header='Desc|Import DT|File Name|SO No|PO #|Style #|Description|S.C|School|Color|License|ADJ|S|M|L|XL|2XL|3XL|4XL|Total|Price|Amount|PO Date(mm-dd-yyyy)|Ship Date(mm-dd-yyyy)|Cancel Date(mm-dd-yyyy)|Special Comment|Size Scale 1|Size Scale 2|PO Status|REMARK|_TSA_SALEORDER_PK|_TSA_SALEORDERD_PK|_PK|Process'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' />
                
            </td>
            
        </tr>
    </table>
    <!-------------------------------------->
    <gw:textbox id="txtFileName" styles="display:none" />
    <gw:textbox id="txtReturnMessage" styles="display:none" />
    <!-------------------------------------->
    <gw:textbox id="txtState" styles="display:none" />
    <gw:textbox id="txtFlag" styles="display:none" />
    <gw:textbox id="txtPONo" styles="display:none" />
</body>
</html>
