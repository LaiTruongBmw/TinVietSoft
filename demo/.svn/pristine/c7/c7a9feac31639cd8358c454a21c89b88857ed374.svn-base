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
  var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name = "<%=Session("USER_NAME")%>" ;
  
  var     clIMP_DT	            = 0 ,
          clIMP_FILE_NAME	    = 1 ,
          clSlip_No             = 2 ,
          clOrder_Dt            = 3 ,
          clPo_No               = 4 ,
          clCus_Id              = 5 ,
          clCus_Name            = 6 ,
          clDeli_To             = 7 ,
          clDeli_Loc            = 8 ,
          clDes_Nation          = 9 ,
          clDes_Port	        = 10,
          clCcy_Unit	        = 11,
          clItem_Seq	        = 12, 
          clItem_Code	        = 13,
          clItem_Name	        = 14,
          clOrd_Qty	            = 15,
          clItem_Unit	        = 16,
          clUnit_Price	        = 17,
          clAmount	            = 18,
          clETD	                = 19,
          clETA	                = 20,
          clRemark	            = 21,
          clTSA_SALEORDER_PK	= 22,
          clTSA_SALEORDERD_PK	= 23,
          clPK 	                = 24,
          clProcessYN           = 25,
          totalCols             = 26 ;
          
//----------------------------------------------------- 
 
function BodyInit()
{
    System.Translate(document); 
    //---------------------------------
    idGridByItem.GetGridControl().FrozenCols = 4 ;
    //---------------------------------
    BindingDataList();
    //---------------------------------
    MergeCell();
    //---------------------------------
    onDateChange();
    //---------------------------------
    dtImportFrom.SetDataText(System.AddDate(dtImportTo.GetData(),-7));
    //---------------------------------
    OnChangeTab();
}

//----------------------------------------------------- 

function BindingDataList()
{
    var data = "" ;
    //---------------------------------

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='COAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    idGridByItem.SetComboFormat( clDes_Nation, data );
    //---------------------------------
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0020' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    idGridByItem.SetComboFormat( clDes_Port, data );
    //---------------------------------
    OnFormatGrid();
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
    //-------------------------
    var strRad = radTab.GetData();
    
	switch (strRad)
	{ 
		case '1':
		    idGridBySpec.ClearData();
		    
            var fl = document.getElementById("idtext").value;  
            
            if ( CheckFilesExist(fl) )
            {
                var excel = new ActiveXObject("Excel.Application");
                var excel_file  = excel.Workbooks.Open(fl);
                var excel_sheet = excel.Worksheets("Sheet1");
                
                var file_name = excel_file.Name
                var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                
               //if ( maxRow > 0 && maxRow <= 30 )
               //{
                     var lrow, lcol, data
                     
                     for(lrow = 2; lrow <= maxRow ; lrow++) 
                     {
                            idGridBySpec.AddRow();
                            
                            for ( lcol = 3; lcol < idGridBySpec.cols - 5; lcol++ )
                            {
                                data = excel_sheet.Cells( lrow, lcol - 2 ).Value 
                                
                                idGridBySpec.SetGridText( idGridBySpec.rows-1, lcol, data);
                            }
                            
                            idGridBySpec.SetGridText( idGridBySpec.rows-1, 1, file_name);                    
                     }
               //}
               //else
               //{
               //     alert('The maximum row is 30. But row number of this file is : ' + maxRow);
               //}
               excel.Workbooks.Close  ;
              
               idGridBySpec.GetGridControl().AutoSize( 0, 28, false, 0);  
            }		    
		break;
		
		case '2':
            idGridByItem.ClearData();
            
            var fl = document.getElementById("idtext").value;  
            
            if ( CheckFilesExist(fl) )
            {
                var excel = new ActiveXObject("Excel.Application");
                var excel_file = excel.Workbooks.Open(fl);
                var excel_sheet = excel.Worksheets("Sheet1");
                
                var file_name = excel_file.Name
                var maxRow
                maxRow = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                
               if ( maxRow > 0 )
               {
                     var lrow, lcol, data
                     
                     for(lrow = 2; lrow <= maxRow ; lrow++) 
                     {
                            idGridByItem.AddRow();
                            
                            for(lcol = 1; lcol < totalCols - 5; lcol++ )
                            {
                                data = excel_sheet.Cells( lrow, lcol).Value 
                                
                                idGridByItem.SetGridText( idGridByItem.rows-1, lcol+1, data);
                            }
                            
                            idGridByItem.SetGridText( idGridByItem.rows-1, clIMP_FILE_NAME, file_name);                    

                     }
               }
               excel.Workbooks.Close  ;
            } 
		break;	    
    }
    //-----------------
    SetStatus('2');
}

 //----------------------------------------------------- 

function OnSearch()
{    
    var strRad = radTab.GetData();             
	switch (strRad)
	{
		case '1':
		    data_dsbs00011_2.Call("SELECT");
        break;
        
        case '2':
            data_dsbs00011.Call("SELECT");
        break;
    } 
               
}

//--------------save data into temp_table--------//
var p_update = 0 ;
 
function OnSave()
{
    SetStatus('1');
    
    p_update = 1 ;

    var strRad = radTab.GetData();             
	switch (strRad)
	{
		case '1':
		    data_dsbs00011_2.Call();
        break;
        
        case '2':
            data_dsbs00011.Call();
        break;
    }        
}

//----------------------------------------------------- 

function OnDataReceive(obj)
{

    switch ( obj.id )
    {
        case "datFileName":
            lstOrderFile.SetDataText(txtFileName.text);
            OnSearch();         
        break;
        
        case "data_dsbs00011_1":
            alert(txtReturnMessage.text);
            data_dsbs00011.Call("SELECT");
            
            SetStatus('2');
        break; 
        
        case "data_dsbs00011":
            if ( p_update == 1 ) 
            { 
                p_update = 0 ;
                datFileName.Call();
            } 
            
            SetStatus('2');   
        break;   
        
        case "data_dsbs00011_2":

            if ( p_update == 1 ) 
            { 
                p_update = 0 ;
                datFileName.Call();
            } 
            
            SetStatus('2');

        break; 
        
        case "pro_dsbs00011_2":
            alert('Finish!');
            
            SetStatus('2');   
        break;                             
    }
}

 //----------------------------------------------------- 

function onDateChange()
{
    datFileName.Call();
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
        var strRad = radTab.GetData();
             
	    switch (strRad)
	    {
		    case '1':
                if ( idGridBySpec.GetGridData( idGridBySpec.row, 32 ) == "" ) 
                {						
            	
		             idGridBySpec.RemoveRow();					
	            }			
	            else 
	            {
	                  idGridBySpec.DeleteRow();
	            }			    
		    break;
		    
		    case '2':
                if ( idGridByItem.GetGridData( idGridByItem.row, 0 ) == "" ) 
                {						
            	
		             idGridByItem.RemoveRow();					
	            }			
	            else 
	            {
	                  idGridByItem.DeleteRow();
	            }	
		    break;		    
		}                  	
}

 //----------------------------------------------------- 

function onInsertSO()
{
    SetStatus('1');
    
    if ( lstOrderFile.value != '' )
    {
        var strRad = radTab.GetData();
             
	    switch (strRad)
	    {
		    case '1':
		        pro_dsbs00011_2.Call();
		    break;
		    
		    case '2':
		        data_dsbs00011_1.Call();
		    break;		    
		}                
    }    
}

 //----------------------------------------------------- 

function MergeCell()
{
    var ctrl = idGridByItem.GetGridControl();
    
    ctrl.MergeCells  = 2 ;
    
    ctrl.MergeCol(0) = true ;	
    ctrl.MergeCol(1) = true ;	
    ctrl.MergeCol(2) = true ;	
    ctrl.MergeCol(3) = true ;	
    ctrl.MergeCol(4) = true ;	
    ctrl.MergeCol(5) = true ;	
    ctrl.MergeCol(6) = true ;
    ctrl.MergeCol(7) = true ;
    ctrl.MergeCol(8) = true ;
    ctrl.MergeCol(9) = true ;
    ctrl.MergeCol(10) = true ;
    ctrl.MergeCol(11) = true ;
}

//-----------------------------------------------------
function OnFormatGrid()
{
        var ctrl = idGridByItem.GetGridControl();
        ctrl.ColFormat(clOrd_Qty) = "###,###,###.##" ;
        ctrl.ColFormat(clUnit_Price) = "###,###,###.##" ;
        ctrl.ColFormat(clAmount) = "###,###,###.##" ;
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
            ibtnDelete.SetEnable(false);
            //idtext.SetEnable(false);

        break;
        
        case '2' : 
            lstOrderFile.SetEnable(true);
            ibtnSearch.SetEnable(true);
            idBtnImportSO.SetEnable(true);
            
            ibtnSave.SetEnable(true);
            ibtnDelete.SetEnable(true);
            //idtext.SetEnable(true);               
        break;
    }   
}
//====================================================================

 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_BySpec = document.all("Tab-BySpec");    
    var tab_ByItem = document.all("Tab-ByItem");    
         
	switch (strRad)
	{
		case '1':
		    tab_BySpec.style.display = "";
		    tab_ByItem.style.display = "none";
		    
		    document.all("Item-Spec").style.color      = "red"; 
		    document.all("Item-Code").style.color      = "";
        break;
        
        case '2':
		    tab_BySpec.style.display = "none";
		    tab_ByItem.style.display = "";
		    
		    document.all("Item-Spec").style.color      = ""; 
		    document.all("Item-Code").style.color      = "red";       
        break;	
    } 
 }
 //====================================================================

</script>

<body>
    <!-------------------------------------->
    <gw:data id="data_dsbs00011" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" function="st_lg_sel_dsbs00011" procedure="st_lg_upd_dsbs00011"> 
                <input> 
                    <input bind="lstOrderFile" /> 
                    <input bind="dtImportFrom" />  
                    <input bind="dtImportTo" />
                </input> 
                <output bind="idGridByItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------->
    <gw:data id="data_dsbs00011_2" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32" function="sale.sp_sel_dsbs00011_2" procedure="st_lg_upd_dsbs00011_2"> 
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
    <gw:data id="data_dsbs00011_1" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00011_1" > 
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
    <gw:data id="pro_dsbs00011_2" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);SetStatus('2')"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00011_2" > 
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
            <dso type="process" procedure="st_lg_pro_dsbs00011" > 
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
                            <gw:button id="ibtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
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
                        <td align="right" style="width: 10%">
                            <b>Files</b>
                        </td>
                        <td style="width: 49%">
                            <gw:list id="lstOrderFile" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
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
                        <td align="left" style="width: 50%; white-space: nowrap">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="Item-Spec">by Item Spec</span> 
                                <span value="2" id="Item-Code">by Item Code</span> 
                            </gw:radio>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 97%">
            <td id="Tab-BySpec">
                <gw:grid id='idGridBySpec' 
                    header='Import DT|File Name|SO No|PO #|Style #|Description|S.C|School|Color|License|ADJ|S|M|L|XL|2XL|3XL|4XL|Total|Price|Amount|PO Date|Ship Date|Cancel Date|Special Comment|Size Scale 1|Size Scale 2|PO Status|REMARK|_TSA_SALEORDER_PK|_TSA_SALEORDERD_PK|_PK|Process'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' />
                <!-- 
                    <gw:grid id='idGridBySpec' 
                    header='Import DT|File Name|SO No|PO #|Style #|
                            Description|S.C|School|Color|License|
                            ADJ|S|M|L|XL|
                            2XL|3XL|4XL|Total|Price|
                            Amount|PO Date|Ship Date|Cancel Date|Special Comment|
                            Size Scale 1|Size Scale 2|PO Status|REMARK|_TSA_SALEORDER_PK|
                            _TSA_SALEORDERD_PK|_PK|Process'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
                    -->
            </td>
            <td id="Tab-ByItem">
                <gw:grid id='idGridByItem' header='Import Dt|File Name|Slip No|Order Dt|Po No|Cus Id|Cus Name|Deli To|Deli Loc|Des Nation|Des Port|Ccy Unit|Item Seq|Item Code|Item Name|Ord Qty|Item Unit|Unit Price|Amount|ETD|ETA|Remark|_TSA_SALEORDER_PK|_TSA_SALEORDERD_PK|_PK|Process'
                    format='4|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0' aligns='1|0|0|1|0|0|0|0|0|0|0|1|1|0|0|3|1|3|3|1|1|0|0|0|0|1'
                    editcol='0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0' widths='1200|1000|1500|1200|1500|1500|2000|1500|1500|1500|1500|1000|1500|1500|2000|1000|1000|1000|1000|1200|1200|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25"
                    acceptnulldate="true" />
            </td>
        </tr>
    </table>
    <!-------------------------------------->
    <gw:textbox id="txtFileName" styles="display:none" />
    <gw:textbox id="txtReturnMessage" styles="display:none" />
    <!-------------------------------------->
</body>
</html>
