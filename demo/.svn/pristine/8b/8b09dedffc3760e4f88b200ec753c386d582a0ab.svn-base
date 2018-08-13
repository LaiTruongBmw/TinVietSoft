<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>W/H Closing History</title>
</head>

<script type="text/javascript">
 
var strHTML = "";
var G1_LEVEL        = 0,
    G1_WH_PK        = 1,
    G1_PARENT_PK    = 2,
    G1_STORAGE_PK   = 3,
    G1_NUM_ROW      = 4,
    G1_NUM_COL      = 5,
    G1_ROW          = 6,
    G1_COL          = 7,
    G1_WH_ID        = 8,
    G1_WH_NM        = 9;
	
  var G2_WH_PK      = 0,
      G2_QTY        = 1;
 //===============================================================
 function BodyInit()
 { 
     System.Translate(document);  // Translate to language session
    //----------------	
     FormatGrid()
     OnSearch('1')  
 }
 //===============================================================

 function FormatGrid()
 {
    var  data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>||";    
    lstWarehouse.SetDataText(data);
    lstWarehouse.value = '';
  
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case '1':
              data_bisc00120.Call("SELECT");
        break;
        case '2':
              data_bisc00120_1.Call("SELECT");
        break;
    }
 }
  //===============================================================
 function OnDrawStock()
 {
    var maxlevel = 5 ; //get max level sau
    var strHTML ="";
    var l_count = 0;
    var l_parent_id = "";
    var l_id = "";
    var l_text = "";
    var obj ;
    for (var level = 1; level <= maxlevel; level++)
    {
         if(level ==1)
        {
         strHTML= '<table border="1" cellpadding="0" cellspacing="0" width="100%"  >';
              for(var i =1 ; i<grdTemp.rows ; i++  )
             {        
                 if(grdTemp.GetGridData(i,G1_LEVEL) == level)
                    { 
                        l_count++ ;               
                        if(l_count%2 ==1)
                        {
                         strHTML += "<tr style='height:23px'>";                   
                         strHTML += "<td width='48%' align='top'  height='70'>";
                         // ve wh
                             strHTML += '<table border="1" cellpadding="0" cellspacing="0" width="100%" style="background-color:#E0FFFF" id="'+grdTemp.GetGridData(i,G1_WH_PK)+'">';     
                                 strHTML += "<caption align='top' style='background-color:FFFFcc' ><b style='color: #1b2ff2; cursor: hand' onclick='ViewStock("+grdTemp.GetGridData(i,G1_WH_PK)+")'>"+grdTemp.GetGridData(i,G1_WH_NM )+"</b></caption>"
                                    for(var r = 1; r<=grdTemp.GetGridData(i, G1_NUM_ROW); r++ )
                                      {
                                         strHTML += "<tr style='height:23px'>";                   
                                          for(var c = 1; c<=grdTemp.GetGridData(i, G1_NUM_ROW); c++)
                                          {
                                            l_id = grdTemp.GetGridData(i,G1_WH_PK)+"."+r+"."+c ;
                                            l_text = grdTemp.GetGridData(i,G1_WH_ID)+" [ C"+r+"."+c +" ]";
                                            strHTML += "<td width='45%' align='center'  height='70' id=" +l_id+" ><b style='color: #1b2ff2; cursor: hand' onclick='ViewStock("+grdTemp.GetGridData(i,G1_WH_PK)+")'>"+ l_text +"</b></td>";                         
                                          }
                                          strHTML += " </tr>"   ; 
                                       }
                                     strHTML += '</table>';
                          // ve wh
                         strHTML += "</td>";
                         strHTML += "<td width='1%' align='center'  height='70'></td>";
                        }else
                        { 
                         strHTML += "<td width='48%' align='top'  height='70'>  ";
                         // ve wh
                          strHTML += '<table border="1" cellpadding="0" cellspacing="0" width="100%" style="background-color:#E0FFFF" id="'+grdTemp.GetGridData(i,G1_WH_PK)+'">';     
                                 strHTML += "<caption align='top' style='background-color:FFFFcc'><b style='color: #1b2ff2; cursor: hand' onclick='ViewStock("+grdTemp.GetGridData(i,G1_WH_PK)+")'>"+grdTemp.GetGridData(i,G1_WH_NM )+"</b></caption>"
                                    for(var r = 1; r<=grdTemp.GetGridData(i, G1_NUM_ROW); r++ )
                                      {
                                         strHTML += "<tr style='height:23px'>";                   
                                          for(var c = 1; c<=grdTemp.GetGridData(i, G1_NUM_ROW); c++)
                                          {
                                             l_id = grdTemp.GetGridData(i,G1_WH_PK)+"."+r+"."+c ;
                                             l_text = grdTemp.GetGridData(i,G1_WH_ID)+" [ C"+r+"."+c +" ]";
                                             strHTML += "<td width='45%' align='center'  height='70' id=" +l_id+" ><b style='color: #1b2ff2; cursor: hand' onclick='ViewStock("+grdTemp.GetGridData(i,G1_WH_PK)+")'>"+ l_text +"</b> </td>"; 
                                          }
                                          strHTML += " </tr>"   ; 
                                       }
                                     strHTML += '</table>';
                         // ve wh
                         strHTML += "</td>";                
                         strHTML += " </tr>"   ; 
                        }             
                    }
            }
         if(l_count%2 ==1)
        {
           strHTML += "</tr>" ;
        }  
         strHTML += '</table>';
         obj = document.getElementById('drawContent');
         obj.innerHTML = strHTML;   
       }else// level >1
       {
         var l_cols =1, l_rows =1;         
           for(var i =1 ; i<grdTemp.rows ; i++  )
             {   
              if(grdTemp.GetGridData(i,G1_LEVEL) == level)
                {  
                
                 strHTML= '<table border="1" cellpadding="0" cellspacing="0" width="100%" style="background-color:#E0FFFF" id="'+grdTemp.GetGridData(i,G1_WH_PK)+'">';     
                // strHTML += "<caption style='background-color:FFFFcc'><b style='color:blue'>"+grdTemp.GetGridData(i,G1_WH_NM )+"</b></caption>"
                    for(var r = 1; r<=grdTemp.GetGridData(i, G1_NUM_ROW); r++ )
                      {
                         strHTML += "<tr style='height:23px'>";                   
                          for(var c = 1; c<=grdTemp.GetGridData(i, G1_NUM_ROW); c++)
                          {
                              l_id = grdTemp.GetGridData(i,G1_WH_PK)+"."+r+"."+c ;
                              l_text = grdTemp.GetGridData(i,G1_WH_ID)+" [ C"+r+"."+c +" ]";
                              strHTML += "<td width='45%' align='center'  height='70' id=" +l_id+" ><b style='color: #1b2ff2; cursor: hand' onclick='ViewStock("+grdTemp.GetGridData(i,G1_WH_PK)+")'>"+ l_text +"</b></td>";                                                    
                          }
                          strHTML += " </tr>"   ; 
                       }
                     strHTML += '</table>';                
                 
               l_parent_pk = grdTemp.GetGridData(i,G1_PARENT_PK)+"."+grdTemp.GetGridData(i,G1_ROW)+"."+grdTemp.GetGridData(i,G1_COL)
               obj = document.getElementById(l_parent_pk);
               obj.innerHTML = strHTML; 
               }
            }
           
       }
        
    }
   
 }
 //===============================================================
 function OnMarkStock()
 {
    /*
        #98AFC7 : null
        #F75D59 : co item can tim
        #E0FFFF : khong co item can tim        
    */
    var l_id;
    var  obj;   
    for(var i =1; i<grdTemp.rows; i++ )
    {
        l_id = grdTemp.GetGridData(i,G1_WH_PK)//+"."+grdTemp.GetGridData(i,G1_ROW)+"."+grdTemp.GetGridData(i,G1_COL);
        obj = document.getElementById(l_id);
        obj.style.backgroundColor ="#E0FFFF"  ;
    }
    for(var i =1; i<grdTemp.rows; i++ )
    {
        l_id = grdTemp.GetGridData(i,G1_WH_PK)//+"."+grdTemp.GetGridData(i,G1_ROW)+"."+grdTemp.GetGridData(i,G1_COL);
        obj = document.getElementById(l_id);
        for(var j = 1 ; j<grdItem.rows ; j++)
        {
            if ( l_id  == grdItem.GetGridData(j,G2_WH_PK))
                {                    
                    obj.style.backgroundColor ="#F75D59"  ;
                    break;
                }   
        }        
        
    }
 }
 //===============================================================
 function OnDataReceive(obj)
 {
    
      switch (obj.id)         
      {
            case 'data_bisc00120' :                       		
			    OnDrawStock();
            break;  
            case 'data_bisc00120_1' :                       		
			    OnMarkStock();
            break;  
			
			default:
			break;   	            
      }	 
 }
 //=======================================================================
 function OnPopUp(obj)
 {
    switch(obj)
    {
        case 'item':
            var path = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx?group_type=|||||";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	         
	            txtItem.text   = object[1];    
	         }
        break;     
        
    }
 }
  //=======================================================================
 function ViewStock(p_wh_pk)
 {
             var path = System.RootURL + "/standard/forms/bi/sc/bisc00121.aspx?wh_pk="+p_wh_pk;
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes',this);
	         if ( object != null )
	         {	         
	            txtItem.text   = object[1];                                                          
	         }    
 }
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bisc00120" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00120" > 
                <input bind="grdTemp" >
				     <input bind="lstWarehouse" />                                                   
                </input>
                <output bind="grdTemp" />
            </dso>
        </xml>
    </gw:data>
      <!-------------------------------------------------------------------------->
    <gw:data id="data_bisc00120_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00120_1" > 
                <input bind="grdItem" >
				     <input bind="txtItem" />                                                   
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%; " id="tt1">
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap; display:'none'" align="right" >
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap; display:'none'">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('2')" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('2')" />
                        </td>
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstWarehouse" styles='width:100%' onchange="OnSearch('1')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                          <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('item')">Item</b>
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:textbox id="txtItem" styles='width:100%;' onenterkey="OnSearch('2')" />
                        </td>
                        <td align="center" style="white-space: nowrap; width: 24%">
                           
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('2')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%">
                <div id="drawContent">
                </div>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:grid id='grdTemp' header=' LEVEL|wh_pk|parent_pk|tin_storage_pk|num_of_row|num_of_col|row_loc|col_loc|wh_id|wh_name'
                    format='0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0' 
					check='|||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='800|0|0|1500|3000|1200|1500|1000|0|0' sorting='T' 
                    defaults='|||||||||' styles='width:100%; height:100%; display:none ' />
      <gw:grid id='grdItem' header='wh_pk|stock_qty'
                    format='0|0' 
					aligns='0|0' 
					check='|' 
					editcol='0|0'
                    widths='800|0' sorting='T' 
                    defaults='|' styles='width:100%; height:100%; display:none ' />
</body>
</html>
