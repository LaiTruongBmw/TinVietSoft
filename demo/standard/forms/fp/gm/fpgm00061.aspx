<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Monitoring Display</title>
    <style>
        .t-header1{
            text-align:center;background-color:#C5D6FC; color: #660033 ; font-size: 22
        }
        .t-header2{
            text-align:left;background-color:#3B6EA5; color: #EE0D00 ; font-size: 26
        }
        .t-header3{
            text-align:left;background-color:#3B6EA5; color: white ; font-size: 26
        }        
        .t-header4{
            text-align:left;background-color:#3B6EA5; color: #12CD1F ; font-size: 26
        } 
        .t-header5{
            text-align:left;background-color:#3B6EA5; color: #ff3efd ; font-size: 26
        } 
        .t-header6{
            text-align:left;background-color:#3B6EA5; color: #fff838 ; font-size: 26
        } 
        .t-header7{
            text-align:left;background-color:#3B6EA5; color: #fff838 ; font-size: 26
        } 
        .t-data1{
            text-align:center;background-color:#C5D6FC; color: #660033 ; font-size: 22
        } 
        .t-data2{
            text-align:right;background-color:black; color: #EE0D00 ; font-size: 26
        } 
        .t-data3{
            text-align:right;background-color:black; color: white ; font-size: 26
        } 
        .t-data4{
            text-align:right;background-color:black; color: #12CD1F ; font-size: 26
        } 
        .t-data5{
            text-align:right;background-color:black; color: #ff3efd ; font-size: 26
        } 
        .t-data6{
            text-align:right;background-color:black; color: #fff838 ; font-size: 26
        } 
        .t-data7{
            text-align:right;background-color:black; color: #fff838 ; font-size: 26
        }                                                                
        .t-line{
            height:1%;font-size:15;background-color: #999966
        }
        
        .t-left{
            font-size:14;background-color: #CCCC99
        }
        .t-right{
            width:60%;font-size:16
        }
    </style>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var gID;
var gBlnFlag = true;

var offset       = 1;

var rows_Next    = 2;
var rows_Display = 6;
   
var grade_codearr   = new Array();    
var pkarr           = new Array();    

//------------------------------------------------------------------------------ 
    
function BodyInit()
{   
    System.Translate(document);
    BindingDataList();   
    SetStatusTable();
    
    data_fpgm00061.Call('SELECT'); 
}
//------------------------------------------------------------------------------ 

function BodyClose()
{
    window.clearInterval(timer);
    window.clearInterval(timer_message);
}
//------------------------------------------------------------------------------ 

function BindingDataList()
{
    var data="";    
        
    data = "<%=ESysLib.SetListDataSQL("select grade_code, grade_code || ' * ' || grade_name from prod.mo_grade where del_if = 0 and parent_pk = 0 order by grade_code")%>||";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;
}

//------------------------------------------------------------------------------
function SetStatusTable()
{
    var totalRows = grdGrade.rows -1;
    
    var previous  = document.all("idprevious");
    var next      = document.all("idnext"); 
    
    var tbname;
    var tbid ;
    
    // grdGrade.rows <=6 ->> an nut previous, next    
    if ( totalRows <= rows_Display )
    {
        previous.style.display ="none";
        next.style.display     ="none";
    }
    else
    {    
        // Set an nut previous hay an nut next
        if ( offset == 1 )
        {
            previous.style.display="none";
        }    
        else
        { 
            previous.style.display="";
        }    
        //------------    
        if ( Number(totalRows) - Number(offset) >= rows_Display ) 
        {   
            next.style.display="";
        }    
        else
        {
            next.style.display="none";
        }           
    }    
}
//------------------------------------------------------------------------------ 
function onOpenDetail(index)
{          
    var fpath = System.RootURL + "/form/fp/gm/fpgm00063.aspx?grade_pk=" + grdGrade.GetGridData( index + offset - 1 , 8) ; 
    var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1000px;dialogHeight:500px');	
}
//------------------------------------------------------------------------------ 
function OnSearch()
{
    txtMasterID.text='';
    data_fpgm00061_1.Call('SELECT');  
}
//------------------------------------------------------------------------------ 
var timer ;
var timer_message ;
var first_time_yn = 0 ;

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpgm00061_1" :
                    
            data_fpgm00061_2.Call('SELECT');
            //---------------------------------
        break;    
        
        case 'data_fpgm00061_2':

            data_fpgm00061_3.Call("SELECT");            
            //---------------------------------
        break;

        case 'data_fpgm00061':
            SetMessage(); 
            
            if ( first_time_yn == 0 )
            {
                first_time_yn = 1 ;
                OnSearch();
            }
            //--------- SET TIME --------------
            window.clearInterval(timer_message) ;

            timer_message = self.setInterval("data_fpgm00061.Call('SELECT')",100000);                
            //---------------------------------            
        break;        
        
        case 'data_fpgm00061_3':
            offset=1;
            BindingDataTable();
            SetStatusTable();
 
            //--------- SET TIME --------------
            window.clearInterval(timer) ;

            timer = self.setInterval("data_fpgm00061_1.Call('SELECT')",30000);                           
        break;        
    }
}
//==================================================
function SetMessage()
{
        //---------------------------------------
        var l_value;
         
        if ( grdMessage.rows-1 > 0 )         
        {
            l_value = "" ;
        }         
        else
        {
            l_value = " <a style='color: RED; font-size: 25; cursor: hand' onclick='OnOpenMessage()' > Line Monitoring </a> ";
        }    
        //-------------------------
        for ( var i=1; i<= grdMessage.rows-1; i++)
        {
            if ( grdMessage.GetGridData( i, 2) == 1 )           
            {
                l_value = l_value + " <a style='color: white; font-size: 15; cursor: hand' onclick='OnOpenMessage()' > "  ;
                l_value = l_value + grdMessage.GetGridData( i, 0);
                l_value = l_value + " : </a>" ;
                l_value = l_value + " <a style='color: red; font-size: 25; cursor: hand' onclick='OnOpenMessage()' > " ;
                l_value = l_value + grdMessage.GetGridData( i, 1);
                l_value = l_value + " *** </a>" ;
            }
            else if ( grdMessage.GetGridData( i, 2) == 2) 
            {
                l_value = l_value + " <a style='color: white; font-size: 15; cursor: hand' onclick='OnOpenMessage()' > "  ;
                l_value = l_value + grdMessage.GetGridData( i, 0);
                l_value = l_value + " : </a>" ;
                l_value = l_value + " <a style='color: Yellow; font-size: 25; cursor: hand' onclick='OnOpenMessage()' > " ;
                l_value = l_value + grdMessage.GetGridData( i, 1);
                l_value = l_value + " *** </a>" ;                
            }
            else
            {
                l_value = l_value + " <a style='color: white; font-size: 15; cursor: hand' onclick='OnOpenMessage()' > "  ;
                l_value = l_value + grdMessage.GetGridData( i, 0);
                l_value = l_value + " : </a>" ;
                l_value = l_value + " <a style='color: white; font-size: 25; cursor: hand' onclick='OnOpenMessage()' > " ;
                l_value = l_value + grdMessage.GetGridData( i, 1);
                l_value = l_value + " *** </a>" ;                 
            }   
        }
        //---------------------------------------
        var p_marquee = document.all("p_marquee");
        
        var l_data = " <marquee direction='left' scrollamount='5' behavior='scroll' scrolldelay='0' style='font-size: 30;color: red' " 
            l_data = l_data + "  onmouseover='this.stop();' onmouseout='this.start();' width='100%'> " + l_value +" </marquee> " 
            
        p_marquee.innerHTML = l_data ;             
        //---------------------------------------
}
//------------------------------------------------------------------------------
function treeItemOnclick()
{
    var obj = event.srcElement.GetCurrentNode(); 
    txtMasterID.text = obj.oid;
    
    data_fpgm00061_2.Call('SELECT');
}
//------------------------------------------------------------------------------ 
function BindingDataTable()
{    
    //---------------------------------------
    var l_data_table; 
    
    if ( grdHeader.rows - 1 > 0 )
    {
        var l_header_row = grdHeader.GetGridData( 1, 0) ;

        if ( l_header_row < 2 )
        {
            l_header_row = 5 ;
        }
        //----
        l_data_table = " <table style='width: 100%; height: 100%; white-space:nowrap' cellpadding='0' cellspacing='0' > <tr> " ;
        
        //---------- Header ------------------
        l_data_table = l_data_table + " <td style='width: 10%; white-space:nowrap'> <table style='width: 100%; height: 100%' border=1 > "  ;
              
        var t = 1 ;        
        while ( t <= l_header_row )
        {
            l_data_table = l_data_table + "  <tr><td style='width: 10%; white-space:nowrap' class='t-header"+t+"'> " + grdHeader.GetGridData( 1, t) + " </td> </tr> " 
            //-----------       
            t = t + 1 ;
        }
        
        l_data_table = l_data_table + " </table> </td> " ;
        //------------------------------------
        //---------- Data Column ------------------        
        var totalRows = grdGrade.rows -1;
        var lastViewRow = Number(offset) + rows_Display - 1  <= totalRows ? Number(offset) + rows_Display - 1 : totalRows;

        for ( var i = offset; i < offset + rows_Display ; i++ )
        {
            if ( i <= lastViewRow )
            {
                l_data_table = l_data_table + " <td style='width: 15%' > <table style='width: 100%; height: 100%' border=1  > "  ;
                //----------------------
                t = 1 ;        
                while ( t <= l_header_row )
                {
                    if ( t == 1 )
                    {
                        //--- Header have OnClick event
                        l_data_table = l_data_table + "  <tr><td align='right' class='t-data"+t+"' onclick='onOpenDetail("+i+")' > " + grdGrade.GetGridData( i, t-1) + " </td> </tr> " 
                    }
                    else
                    {
                        //--- Data have no OnClick event
                        l_data_table = l_data_table + "  <tr><td align='right' class='t-data"+t+"' > " + grdGrade.GetGridData( i, t-1) + " </td> </tr> "                     
                    }    
                    //-----------       
                    t = t + 1 ;
                }             
                //----------------------
                l_data_table = l_data_table + " </table> </td> " ;
            }
            else
            {
                l_data_table = l_data_table + " <td  style='width: 15%; white-space:nowrap' > <table style='width: 100%; height: 100%' border=1  > "  ;
                //----------------------
                t = 1 ;        
                while ( t <= l_header_row )
                {
                    l_data_table = l_data_table + "  <tr><td align='right' class='t-data"+t+"'></td> </tr> " 
                    //-----------       
                    t = t + 1 ;
                }             
                //----------------------
                l_data_table = l_data_table + " </table> </td> " ;            
            }    
        }
        //------------------------------------
        l_data_table = l_data_table + "</tr> </table>";
        document.getElementById('p_data_table').innerHTML = l_data_table  ;             
        //--------------------------------------- 
        
        ShowChart(); 
    }
}
//------------------------------------------------------------------------------
function OnFactoryChange()
{
    data_fpgm00061_1.Call("SELECT");
}
//------------------------------------------------------------------------------
function onBackNextClick(index)
{
    switch ( Number(index) )
    {
        case -1:
            if ( offset > rows_Next )
            {
                offset = Number(offset) - rows_Next ;
            }    
        break;
        
        case 1:
            if ( offset < grdGrade.rows - rows_Next )
            {
                offset = Number(offset) + rows_Next ;
            }    
        break;
    }
    BindingDataTable();
    SetStatusTable();
}
//----------------------------------------------------------------------------

function ShowChart()        
{   
    this.Height        
    window.frames["ifrContent"].document.location.href = "fpgm00062.aspx?parent_code="+ txtMasterID.text + "&offset=" + offset + "&rows_Display=" + rows_Display ;          
}

//----------------------------------------------------------------------------
function OnToggle()
 {
        var left  = document.all("left");    
        var right = document.all("right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left.style.display="none";       
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../system/images/button/icons_button/next.gif";
        }
        else
        {
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="80%";
            imgArrow.src = "../../../system/images/button/icons_button/back.gif";
        }
 }
//================================================================================

function OnOpenMessage()
{
    var fpath = System.RootURL + "/form/fp/gm/fpgm00050.aspx";
    var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1000px;dialogHeight:500px');	

    data_fpgm00061.Call("SELECT");
    
}
//================================================================================
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'LineTarget' :
            var fpath = System.RootURL + "/form/fp/pw/fppw00020.aspx";
            var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1100px;dialogHeight:600px');	
        break;
    }    
}
//================================================================================
</script>

<body onunload="window.clearInterval(timer);window.clearInterval(timer_message)">
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="<%=l_user%>lg_sel_fpgm00061_1" > 
                <input>
                    <input bind="dtDocDate" />
                    <input bind="lstFactory" />                     
                </input> 
                <output bind="treeDept" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00061_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,3,9" function="<%=l_user%>lg_sel_fpgm00061_2" > 
                <input bind="grdGrade"> 
                    <input bind="txtMasterID" /> 
                    
                </input> 
                <output bind="grdGrade" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00061_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="<%=l_user%>lg_sel_fpgm00061_3" > 
                <input bind="grdHeader">        
                    <input bind="txtMasterID" /> 
                </input> 
                <output bind="grdHeader" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00061" > 
                <input bind="grdMessage">      
                </input> 
                <output bind="grdMessage" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 20%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Date</td>
                        <td style="width: 78%">
                            <gw:datebox id="dtDocDate" lang="1" styles='width:100%' />
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Fac</td>
                        <td style="width: 80%" colspan="3">
                            <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch()" />
                        </td>
                    </tr>                  
                    <tr style="height: 98%">
                        <td colspan="4" style="height: 100%">
                            <gw:tree id="treeDept" onclicknode="treeItemOnclick()" style="width: 100%; height: 100%;
                                overflow: auto;" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 80%" id="right">
                <table style="width: 100%; height: 100%; background-color: Black">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%; white-space: nowrap">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/icons_button/back.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 88%; color: red; font-size: large" id="idtext" align="center">
                                        MONITORING
                                    </td>
                                    <td style="width: 1%; white-space: nowrap">
                                        <gw:icon id="idBtnLineTarget" img="in" text="Line Target" styles='width:100%' onclick="OnPopUp('LineTarget')" />
                                    </td>
                                    <td id="idprevious" style="width: 5%; white-space: nowrap" align="center">
                                        <a title="Click here to previous infomation" onclick="onBackNextClick(-1)" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Previous</b></a></td>
                                    <td id="idnext" style="width: 5%; white-space: nowrap" align="center">
                                        <a title="Click here to next infomation" onclick="onBackNextClick(1)" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Next</b></a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td id="p_data_table">
                        </td>
                    </tr>
                    <tr style="height: 97%; background-color: Black">
                        <td align="center" style="height: 100%">
                            <iframe id="ifrContent" style="width: 100%; height: 100%; background-color: Black"
                                frameborder="0"></iframe>
                        </td>
                    </tr>
                    <tr style="height: 1%; border-color: #999966;">
                        <td id="p_marquee">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:grid id='grdGrade' header='grade_name|value01|value02|value03|value04|value05|value06|message|pk|grade_code'
    format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' defaults='|||||||||'
    editcol='0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|0|0'
    sorting='T' styles='width:100%; height:460;display:none' />
<!------------------------------------------------------->
<gw:grid id='grdHeader' header='Column Num|Column Nm|VALUE01_NM|VALUE02_NM|VALUE03_NM|VALUE04_NM|VALUE05_NM|VALUE06_NM'
    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol='1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:460;display:none' />
<!------------------------------------------------------->
<gw:grid id='grdMessage' header='ID|Mess|Level' format='0|0|0' aligns='0|0|0' editcol='0|0|0'
    widths='1000|1000|1000' sorting='T' styles='width:100%; height:460;display:none' />
<!------------------------------------------------------->
<gw:textbox id="txtMasterID" text="" styles='display:none' />
<gw:textbox id="txtReturnValue" text="" styles='display:none' />
<!------------------------------------------------------->
</html>
