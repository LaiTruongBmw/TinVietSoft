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
    /* Version 01
    # V1: Not allow user edit data on the grid
    # Manage data of each row, if one row already existed in database, A confirm message will be shown!
    */
    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var  totalCols             = 26 ;
       
var _st_prod_pk   = 0, 
    e_ST_itemcode = 1,
    e_ST_itemname = 2,
    e_Dimension   = 3,
    e_color_id    = 4, 
    e_color_nm    = 5, 
    e_unit_price  = 6, 
    e_currency    = 7, 
    e_uom         = 8, 
    e_gross_qty   = 9, 
    e_type        = 10,
    e_lossrate    = 11;
//----------------------------------------------------- 
 var p_update = 0 ;
function BodyInit()
{
    
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
//    SetStatus('1');
	    grdMatCons.ClearData();
	    
        var fl = document.getElementById("idtext").value;  
        
        if ( CheckFilesExist(fl) )
        {
            var excel = new ActiveXObject("Excel.Application");
            var excel_file  = excel.Workbooks.Open(fl);
            var excel_sheet = excel.Worksheets("import");
            
            /*var strDate = new Date();
            var year,month,day;

            year = strDate.getFullYear()+"";
            month =strDate.getMonth()+1 <10?'0'+(strDate.getMonth()+1):strDate.getMonth()+1
            day = strDate.getDate()>9?strDate.getDate():'0'+strDate.getDate()

            var file_name = year + month +day +"-"+excel_file.Name
            */		
            var maxRow    = excel.Worksheets("import").UsedRange.Rows.Count
                  var lrow, lcol, data
                 
                 if(excel_sheet.Cells( 1, 2 ).Value !=null)
                    txtItemCode.text = excel_sheet.Cells( 1, 2 ).Value; 
                 
                 if(excel_sheet.Cells( 2, 2 ).Value!= null)
                    txtItemName.text = excel_sheet.Cells( 2, 2 ).Value ;
                 for(lrow = 4; lrow <= maxRow ; lrow++) 
                 {
                        grdMatCons.AddRow();
                        
                        for ( lcol = 1; lcol < grdMatCons.cols ; lcol++ )
                        {
                            data = excel_sheet.Cells( lrow, lcol ).Value 
                            
                            grdMatCons.SetGridText( grdMatCons.rows-1, lcol, data);
                        }
                 }
          
           excel.Workbooks.Close  ;
           grdMatCons.GetGridControl().AutoSize( 0, 11, false, 0);  
           lblTotalRecord.text = (grdMatCons.rows -1)+" record(s)."

        //-----------------
       // SetStatus('2');
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
    pro_fpdp00061_1.Call();       
}
//----------------------------------------------------- 
function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case "pro_fpdp00061_1":
//            if ( Number(txtCountCons.text) ==0)
//            {
                if(txtItemPK.text !="")
                {
                    for(i=0; i<grdMatCons.rows; i++)
                    {
                        grdMatCons.SetGridText(i, _st_prod_pk, txtItemPK.text)
                    }
                    data_fpdp00061_2.Call('');
                }    
                else
                {    
                    alert("Please input Style information first!!!");
                    return;
                }  
//            } 
//            else
//            {
//                alert("This Style already has Style consumption information. Please delete Style consumption first!!!");
//                return;
//            }         
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
    grdMatCons.RemoveRow();		
    lblTotalRecord.text = grdMatCons.rows + ' rows';			
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
    <gw:data id="pro_fpdp00061_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpdp00061_1"> 
                <input> 
			        <input bind="txtItemCode" />  		
			    </input> 
                <output>
                    <output bind="txtItemPK" />
                    <input bind="txtCountCons" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------->
    <gw:data id="data_fpdp00061_2" onreceive="OnDataReceive(this)" onerror="alert(this.errmsg);"> 
        <xml> 
            <dso id="1" type="grid" user="PROD" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpdp00061_2" procedure="<%=l_user%>lg_upd_fpdp00061_2"> 
                <input>   
                    <input bind="txtItemPK" />
                </input> 
                <output bind="grdMatCons" /> 
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
                            
                        </td>
                        <td align="left" style="width: 5%">
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
                            <b>Style</b>
                        </td>
                        <td  align="left" style="width: 70%; white-space: nowrap">
                            <gw:textbox id="txtItemPK" text="" styles="display:none" />
                            <gw:textbox id="txtItemCode" text="" styles='width:30%'  />
                            <gw:textbox id="txtItemName" text="" styles='width:70%' />
                        </td>
                        <td align="right" style="width: 17%">
                            <gw:icon id="ibtnDelete" img="2" text="Delete" styles='width:100%;' onclick="OnDelete()" />
                        </td>
                        <td style="width: 10%" >
                            <gw:icon id="idBtnImportStyleCons" img="1" text="Insert Cons" styles='width:100%' onclick="OnSave()" />
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
                <gw:grid id='grdMatCons' header='_st_prod_pk|St Item Code|St Item Name|Dimension|Color Spec ID|Color Spec Name|Unit Price|Currency|Uom|Gross Qty|Type|Loss Rate'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|2000|3000|1000|1000|1000|1000|1000|1000|1000|600|600'
                    styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' onafteredit="CheckEdit()" />
            </td>
        </tr>
    </table>
    <!-------------------------------------->
    <gw:textbox id="txtCountCons" styles="display:none" />
    <!-------------------------------------->
   
</body>
</html>
