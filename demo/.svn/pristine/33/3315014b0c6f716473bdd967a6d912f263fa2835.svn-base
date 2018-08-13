<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>LOADING DATA FROM EXCEL</title>
</head>

<script>
  var  user_pk = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name = "<%=Session("USER_NAME")%>" ;
  var valid = 0;
 //------------------------Excel col--------------------
  var ex_prod_date = 1
  var totalCols    = 11;
  
  var ex_ord        =1 ,
      ex_line       =2,
      ex_task       =3,
      ex_emp_id     =4,
      ex_emp_nm     =5,
      ex_item_id    =6,
      ex_size       =7,
      ex_color      = 8,
      ex_qty        = 9,
      ex_unit       = 10;
      ex_wh         = 11;
      
  var G1_pk    = 0,
      G1_valid = 18;
          
//----------------------------------------------------- 
 
function BodyInit()
{
    System.Translate(document); 
    ibtnSave.SetEnable(false)
  
}

//----------------------------------------------------- 

function BindingDataList()
{
    var data = "" ;
    //---------------------------------

    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='COAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    idGrid.SetComboFormat( clDes_Nation, data );
    //---------------------------------
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0020' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    idGrid.SetComboFormat( clDes_Port, data );
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
        if(filepath.substring(filepath.length - 3 , filepath.length)!="xls")
        {
            alert("This file is not excel file. Pls choose excel file!");
            return false ;
        }
        return true;
    
}

//-------------------------read data from exel file ----------------

function ReadFiles()
{
    idGrid.ClearData();
    
    var fl = document.getElementById("idtext").value;  
    
    if ( CheckFilesExist(fl) )
    {
        var excel = new ActiveXObject("Excel.Application");
        var excel_file = excel.Workbooks.Open(fl);
        var excel_sheet = excel.Worksheets("Sheet1");
        
        var file_name = excel_file.Name
        var maxRow
        maxRow = excel.Worksheets("Sheet1").UsedRange.Rows.Count
       if ( maxRow > 3)
       {
              var lrow, lcol, data
             
             for(lrow = 4; lrow <= maxRow ; lrow++) 
             {
                    idGrid.AddRow();
                   for(lcol = 1; lcol <= totalCols ; lcol++ )
                    {
                        data = excel_sheet.Cells( lrow, lcol).Value 
                        
                        idGrid.SetGridText( idGrid.rows-1, lcol+1, data);
                    }
                    
                    idGrid.SetGridText( idGrid.rows-1, 1, excel_sheet.Cells( 2, 1).Value);   
                              
             }
       }
       excel.Workbooks.Close  ;
    } 
    
}

//--------------save data into temp_table--------//
var p_update = 0 ;
 
function OnSave()
{
   pro_fpep00012_1.Call()
}
//---------------------------------------------------
function OnTest()
{
    p_update = 1 ;
    fpep00012.Call();
}
//----------------------------------------------------- 

function OnDataReceive(obj)
{
   switch(obj.id)
   {
        case 'fpep00012':
          valid = 0;
          for(var i = 1 ; i< idGrid.rows ; i++)
            {
                
                var data = idGrid.GetGridData(i,G1_valid)
                if (data !="")
                {
                    var word = data.split(",");
                    for(var j =0 ; j<word.length; j++)
                    {
                        idGrid.GetGridControl().Cell( 6 , i , Number(word[j]) ,i, Number(word[j]) ) = 0x0099ff;      
                         valid = valid + 1;
                    }
                }       
            }
           if (valid==0)
           {
                ibtnSave.SetEnable(true)
           }else
           {
                ibtnSave.SetEnable(false)
           }

        break;
        case "pro_fpep00012_1":
        alert(txtReturnMessage.text)
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
    if ( idGrid.GetGridData( idGrid.row, 0 ) == "" ) 
    {						
	
		 idGrid.RemoveRow();					
	}			
	else 
	{
	      idGrid.DeleteRow();
	}
}

//-----------------------------------------------------
function OnFormatGrid()
{
//        var ctrl = idGrid.GetGridControl();
//        ctrl.ColFormat(clOrd_Qty) = "###,###,###.##" ;
//        ctrl.ColFormat(clUnit_Price) = "###,###,###.##" ;
//        ctrl.ColFormat(clAmount) = "###,###,###.##" ;
} 
//-----------------------------------------------------
</script>

<body>
    <!-------------------------check data------------->
    <gw:data id="fpep00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpep00012" procedure="<%=l_user%>lg_upd_fpep00012"> 
                <input> 
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------input product result-------------->
    <gw:data id="pro_fpep00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpep00012_1" > 
                <input>
                    <input bind="dtDate" />
               </input> 
                <output>
                    <output bind="txtReturnMessage" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td align="right" style="width: 10%">
                            <b>File Path</b>
                        </td>
                        <td style="width: 60%">
                            <input type="file" id="idtext" style="width: 100%" onchange="ReadFiles()" onkeypress="onEnterKey()">
                        </td>
                        <td style="width: 27%">
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:imgbtn id="ibtnTest" img="test" alt="Test Data" onclick="OnTest()" />
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td align="left" style="width: 1%">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id="idGrid" header="_PK|_Prod Dt|Order|Line id|Task Id|Emp Id|Emp Name|Item Code|Size|Color|Quantity|Unit|Ware House|_Line_pk|_Task_pk|_Emp_pk|_Item_pk|_WH_pk|_valid"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0"
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|1|1" acceptnulldate="T" sorting="T"
                    widths="0|0|1000|1500|1500|1500|2500|2000|1000|1500|1500|1000|0|0|0|0|0|0" styles="width:100%; height:100%"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!-------------------------------------->
    <gw:datebox id="dtDate" lang="1" style="display: none" />
    <gw:textbox id="txtReturnMessage" styles="display:none" />
    <!-------------------------------------->
</body>
</html>
