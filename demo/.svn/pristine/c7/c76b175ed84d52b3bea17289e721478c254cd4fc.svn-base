<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Monitoring</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var 
G_Point = 0,
G_01 = 1,
G_02 = 2,
G_03 = 3,
G_04 = 4,
G_05 = 5,
G_06 = 6,
G_07 = 7,
G_08 = 8,
G_09 = 9,
G_10 = 10,
G_TT = 11,
G_P_Seq = 12,
G_Seq = 13;    
//=====================================================================================
function BodyInit()
 {
    grd4.GetGridControl().MergeCells  = 2 ;	
    grd4.GetGridControl().MergeCol(0) = true ;
                                
    OnSearch();
 }      
//=====================================================================================
 function OnSearch()
 {                    
                prod_fpps00030_1.Call("SELECT");   
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
            case "prod_fpps00030_1" :
                prod_fpps00030_2.Call("SELECT");   
            break;               
           
            case "prod_fpps00030_2" :
                prod_fpps00030_3.Call("SELECT");    
            break;     
                      
            case "prod_fpps00030_3" :
                if ( grd4.rows > 1 )
                {
                    grd4.SetCellBold( 1, 0,  grd4.rows-1, 14,  true);
                    
                    for ( i=1; i<grd4.rows; i=i+2)
                    {
                        grd4.SetCellBgColor( i, 0 , i, G_P_Seq ,  0xCCFFFF );
                    }         	 
                }
            break;                                                   
      }  
 }

//=====================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="prod_fpps00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1"  type="grid"  parameter="0" function="<%=l_user%>lg_sel_fpps00030_1" > 
                <input>
                    <input bind="dtDate" />
                    <input bind="txtLineID" /> 
                </input> 
                <output bind="grd1" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="prod_fpps00030_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2"  type="grid"  parameter="0" function="<%=l_user%>lg_sel_fpps00030_2" > 
                <input>
                    <input bind="dtDate" />
                    <input bind="txtLineID" /> 
                </input> 
                    <output bind="grd2" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="prod_fpps00030_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="4"  type="grid"  parameter="0" function="<%=l_user%>lg_sel_fpps00030_3" > 
                <input>
                    <input bind="dtDate" />
                    <input bind="txtLineID" /> 
                </input> 
                    <output bind="grd4" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="width: 100%; height: 1%">
            <td>
                <table style="width: 100%">
                    <tr style="width: 100%">
                        <td style="width: 90%; height: 100%" rowspan="2">
                            <gw:grid id='grd1' header='Target|Ac_Plan|Prod(%)|M/P|B.Bal|Input|WIP|Prod|Def' format='0|0|0|0|0|0|0|0|0'
                                aligns='1|1|1|1|1|1|1|1|1' check='||||||||' editcol='0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height: 50' />
                        </td>
                        <td style="width: 10%; height: 100%" align="center">
                            <gw:datebox id="dtDate" lang="<%=Session("Lang")%>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%; height: 100%" align="center">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; height: 100%">
                <gw:grid id='grd2' header='POH|07:30~08:30|08:30~09:30|09:30~10:30|10:30~11:30|11:30~13:30|13:30~14:30|14:30~15:30|15:30~16:30|16:30~18:20|18:50~20:20'
                    format='1|1|1|1|1|1|1|1|1|1|1' aligns='1|1|1|1|1|1|1|1|1|1|1' check='||||||||||'
                    editcol='1|0|0|0|0|0|0|0|0|0|0' widths='1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height: 60' />
            </td>
        </tr>
        <tr style="width: 100%; height: 97%">
            <td style="width: 100%; height: 100%">
                <gw:grid id='grd4' header='Point|07:30~08:30|08:30~09:30|09:30~10:30|10:30~11:30|11:30~13:30|13:30~14:30|14:30~15:30|15:30~16:30|16:30~18:20|18:50~20:20|_Total|_point_seq|_seq'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|1|1|1|1|1|1|1|1|1|1|1|0|0' check='|||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|0|0'
                    sorting='T' styles='width:100%; height: 320' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtLineID" style="display: none" text="SEW01" />
</body>
</html>
