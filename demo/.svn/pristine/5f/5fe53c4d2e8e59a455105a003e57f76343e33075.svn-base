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
//================================================================================
    
function BodyInit()
{   
    System.Translate(document);
    BindingDataList();   
    
    data_fpgm00140.Call('SELECT'); 
}
//================================================================================

function BodyClose()
{
    window.clearInterval(timer);
    window.clearInterval(timer_message);
}
//================================================================================

function BindingDataList()
{
    var data="";    
                    
    data = "<%=ESysLib.SetListDataSQL("SELECT group_id, group_id || ' - ' || GROUP_NAME FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY group_id ") %>||Select ALL" ;    
    lstLineGroup.SetDataText(data);
    lstLineGroup.value = ''; 
}

//================================================================================

function onOpenDetail(index)
{          
    var fpath = System.RootURL + "/form/fp/gm/fpgm00141.aspx?grade_pk=" + grdGrade.GetGridData( index , 8) ; 
    var aValue  = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:1000px;dialogHeight:500px');	
}
//================================================================================
function OnSearch()
{
    txtMasterID.text='';
    data_fpgm00140_1.Call('SELECT');  
}
//================================================================================
var timer ;
var timer_message ;
var first_time_yn = 0 ;

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpgm00140_1" :
                    
            data_fpgm00140_2.Call('SELECT');
            //---------------------------------
        break;    
        
        case 'data_fpgm00140_2':

            data_fpgm00140_3.Call("SELECT");            
            //---------------------------------
        break;

        case 'data_fpgm00140':
            SetMessage(); 
            
            if ( first_time_yn == 0 )
            {
                first_time_yn = 1 ;
                OnSearch();
            }
            //--------- SET TIME --------------
            window.clearInterval(timer_message) ;

            timer_message = self.setInterval("data_fpgm00140.Call('SELECT')",100000);                
            //---------------------------------            
        break;        
        
        case 'data_fpgm00140_3':
            BindingDataTable();
 
            //--------- SET TIME --------------
            window.clearInterval(timer) ;

            timer = self.setInterval("data_fpgm00140_1.Call('SELECT')",30000);                           
        break;        
    }
}
//================================================================================
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
//================================================================================
function treeItemOnclick()
{
    var obj = event.srcElement.GetCurrentNode(); 
    txtMasterID.text = obj.oid;
    
    data_fpgm00140_2.Call('SELECT');
}
//================================================================================
function BindingDataTable()
{    
    //---------------------------------------
    var l_data_table; 
    
    var totalRows = grdGrade.rows-1;
    var viewcols  = Math.ceil((grdGrade.rows-1)/2);
    var lastviewrow = 1 ;    
            
    if ( grdHeader.rows - 1 > 0 )
    {
        var l_header_row = grdHeader.GetGridData( 1, 0) ;

        if ( l_header_row < 2 )
        {
            l_header_row = 5 ;
        }
        //----
        l_data_table = " <table style='width: 100%; height: 100%; white-space:nowrap' cellpadding='0' cellspacing='0' >  " ;
        
        for(var j=0; j<2 ; j++)
        {
            l_data_table= l_data_table + "<tr>"
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

            for ( var i = lastviewrow; i < lastviewrow + viewcols; i++ )
            {
                if ( i <= lastviewrow + viewcols && i <= totalRows )
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
            lastviewrow = i ;
            
            l_data_table= l_data_table + "</tr>"
        }
        //------------------------------------
        l_data_table = l_data_table + " </table>";
        document.getElementById('p_data_table').innerHTML = l_data_table  ;             
        //--------------------------------------- 
    }
}
//================================================================================
function OnFactoryChange()
{
    data_fpgm00140_1.Call("SELECT");
}

//================================================================================
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

    data_fpgm00140.Call("SELECT");
    
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
    <gw:data id="data_fpgm00140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="<%=l_user%>lg_sel_fpgm00140_1" > 
                <input>
                    <input bind="dtDocDate" />
                    <input bind="lstLineGroup" />                     
                </input> 
                <output bind="treeDept" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00140_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,3,9" function="<%=l_user%>lg_sel_fpgm00140_2" > 
                <input bind="grdGrade"> 
                    <input bind="txtMasterID" /> 
                    
                </input> 
                <output bind="grdGrade" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00140_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="<%=l_user%>lg_sel_fpgm00140_3" > 
                <input bind="grdHeader">        
                    <input bind="txtMasterID" /> 
                </input> 
                <output bind="grdHeader" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00140" > 
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
                            Line Group</td>
                        <td style="width: 80%" colspan="3">
                            <gw:list id="lstLineGroup" styles='width:100%' onchange="OnSearch()" />
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
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td id="p_data_table">
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
