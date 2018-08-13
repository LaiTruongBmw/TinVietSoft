<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>User Setting</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var _bLoad = false;

 var G2_t2_line_pk  =0,
    G2_t2_line_id   =1,
    G2_t2_line_nm   =2,
    G2_t2_use_yn    =3,
    G2_t2_remark    =4;

 var G3_t2_pk      =0,
    G3_t2_line_pk    =1,
    G3_t2_line_id    =2,
    G3_t2_line_nm    =3,
    G3_t2_use_yn   =4,
    G3_t2_desc     =5,
    G3_t2_user_pk  =6;    
//=========================================================================================
function BodyInit()
{
   System.Translate(document); 
}
//=========================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case'LINE':
            agds00090_list_line.Call("SELECT");
        break;
    }
}
//=========================================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   var grdControl = oGrid.GetGridControl();
   if(grdControl.SelectedRows >0 )
   {   
     for(var i=1;i<grdControl.Rows;i++)
      {
         if(grdControl.IsSelected(i))
        {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
         }
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
</script>

<body>
    
     <!-------------------------------------TAB 2------------------------------------------------->
    <gw:data id="agds00090_list_line" > 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_line"  > 
			<input bind="grdLine_t2" >	
			    <input bind="txtLineFilter" />	
                <input bind="txtUserPk" />				    							
			</input> 
			<output bind="grdLine_t2" /> 
		</dso> 
	</xml> 
    </gw:data>
  
     <!-------------------------------------------------------------------------------------->
      
     <table name="User Line Mapping" class="table" width="100%"  style="height:100%" border="1">        
        <tr style="height:100%">
           <td>
                  <table width="100%" style="height:100%">
                    <tr style="height:5%">
                        <td width="10%">
                            <b>Line</b></td>
                        <td width="50%">
                            <gw:textbox id="txtLineFilter" styles="width:100%" onenterkey="OnSearch('LINE')" />
                        </td>
                        
                        <td align="right">
                            <gw:imgbtn id="btnSearch2_t2" img="search" alt="Search" onclick="OnSearch('LINE')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect_t2" img="Select" alt="Search" onclick="OnSelect(grdLine_t2)" />
                        </td>
                    </tr>
                    <tr style="height:95%">
                        <td colspan="4">
                           <gw:grid id='grdLine_t2' header='_PK|Line ID|Line Name|Use Y/N|Remark'
                            format='0|0|0|3|0' aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0'
                            widths='0|1000|1500|1000|1000' sorting='T' 
                            styles='width:100%; height:100%' 
                            oncelldblclick="OnSelect(this)"/>
                        </td>
                    </tr>
                </table>
           </td>
        </tr>
    </table>   

    <!----------------------------------------------------------------------->
    <gw:textbox id="txtUserPk" text="" styles="display:none" />
</body>
</html>
