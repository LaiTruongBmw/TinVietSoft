<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var arr_pk_char    =new Array();
var arr_len_char    =new Array();
var arr_Temp    =new Array();
var sCharacters;
var sExa_Characters;
var sTemplates;
var sExa_Templates;
var bend;
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
var idcode="<%=Request.querystring("idcode")%>";
function BodyInit()
{
    ////if (v_language!="ENG")
        System.Translate(document);
        
    txtIDCode.text=idcode;
    var maxid;
    if (txtIDCode.text=="Emp")
    {
        maxid="<%=CtlLib.SetDataSQL("select 1 from thr_employee where del_if=0 and rownum=1")%>";
        <%=CtlLib.SetGridColumnComboFormatString2( "grdCharacters" , 5 , "SYSDATE|SYSDATE|BYHAND|BY HAND|CHAR|CHAR|CARDINAL|CARDIAL") %>;  
    }
    if (txtIDCode.text=="IdCard")
    {
        maxid="<%=CtlLib.SetDataSQL("select 1 from THR_ID_CARD where del_if=0 and rownum=1")%>";
        <%=CtlLib.SetGridColumnComboFormatString2( "grdCharacters" , 5 , "SYSDATE|SYSDATE|BYHAND|BY HAND|CHAR|CHAR|CARDINAL|CARDIAL") %>;  
    }
    if (maxid!="1") 
        btnSave.SetEnable(true);
    else
        btnSave.SetEnable(false);
    txtEmpID_Code.SetEnable(false);
    txtEmpID_Sample.SetEnable(false);
    sCharacters="";
    sExa_Characters="";
    sTemplates="";
    sExa_Templates="";
    datTemplates.Call("SELECT");
    
   
}
function SelectCharacters()
{
    if (bend=="Y" )
    {
        alert("Emp id finished by Cardinal Number!");
        return;
    }    
    if (grdCharacters.row==0)
        alert("Please select character!");
    else
    {    
        if (grdCharacters.GetGridData(grdCharacters.row,3) > grdCharacters.GetGridData(grdCharacters.row,2))
        {
            alert("Length of this Character have to be less than " + grdCharacters.GetGridData(grdCharacters.row,2) + "!");
            return;
        }
        var sPk,sCharacter,sChar_Len,sExa;
        
        sPk=grdCharacters.GetGridData(grdCharacters.row,0); 
        
        sChar=grdCharacters.GetGridData(grdCharacters.row,1);
        
        sChar_Len=grdCharacters.GetGridData(grdCharacters.row,3);
        
        sChar=sChar.substr(sChar.length - sChar_Len, sChar_Len);
        
        sExa=grdCharacters.GetGridData(grdCharacters.row,4);
        
        sExa=sExa.substr(sExa.length - sChar_Len, sChar_Len);
        
        arr_pk_char[arr_pk_char.length]=sPk;
       
        arr_len_char[arr_len_char.length]=sChar_Len ;
       
        sCharacters=sCharacters + String(sChar);
       
        sExa_Characters=sExa_Characters + String(sExa);
        txtEmpID_Code.text=sCharacters;
        txtEmpID_Sample.text=sExa_Characters;
        //update length for character
        grdCharacters.SetGridText(grdCharacters.row,3,grdCharacters.GetGridData(grdCharacters.row,2));
        bend=grdCharacters.GetGridData(grdCharacters.row,5);
    }    
}
function SelectTemplates()
{
     txtIDCode.text=idcode;
     txtEmpID_Code.text=grdTemplates.GetGridData(grdTemplates.row,1);
     txtEmpID_Sample.text=grdTemplates.GetGridData(grdTemplates.row,4);
     txtEmp_ID_PK.text=grdTemplates.GetGridData(grdTemplates.row,2);
     txtEmp_ID_Len.text=grdTemplates.GetGridData(grdTemplates.row,3);
     arr_pk_char=txtEmp_ID_PK.text.split(",");
     arr_len_char=txtEmp_ID_Len.text.split(",");
     sCharacters=txtEmpID_Code.text;
     sExa_Characters=txtEmpID_Sample.text;
     bend="Y";
     
}

function DeleteCharacters()
{
    bend="N";
    if (sCharacters.length!=0)
    { 
        sCharacters=sCharacters.substr(0,sCharacters.length - arr_len_char[arr_len_char.length-1]);
      
        sExa_Characters=sExa_Characters.substr(0,sExa_Characters.length - arr_len_char[arr_len_char.length-1]);
        
        arr_pk_char.length=arr_pk_char.length-1;
        arr_len_char.length=arr_len_char.length-1;
        
        txtEmpID_Code.text=sCharacters;
        txtEmpID_Sample.text=sExa_Characters;
    }
}
function CheckMouse(e)
{
    
}


function OnSave()
{
    if (bend=="N" )
    {
        alert("Emp id have to finished by Cardinal Number!");
        return;
    } 
    if (confirm("Do you want to save?"))
    {
        
        txtEmp_ID_PK.text=arr_pk_char.join(",");
        txtEmp_ID_Len.text=arr_len_char.join(",");
        
        //datEmp_ID_Code.StatusUpdate();
        txtIDCode.text=idcode;
        datEmp_ID_Code.Call();
    }    
}
function OnDataReceive(objData)
{
    
    
    if(objData.id=="datEmp_ID_Code")
    {
        var status = datEmp_ID_Code.GetStatus();
       if (binit==true)
            binit=false;
       if (txtEmpID_Code.text.length==0)
       {
            
            datEmp_ID_Code.StatusInsert();
            bend="N";
       }
       else
       {
            arr_pk_char=txtEmp_ID_PK.text.split(",");
            arr_len_char=txtEmp_ID_Len.text.split(",");
            sCharacters=txtEmpID_Code.text;
            sExa_Characters=txtEmpID_Sample.text;
            bend="Y";
            
       }
       if (status==10 && txtIDCode.text==idcode)
            alert("Save succesful!!!");
        
    }
    if (objData.id=="datTemplates")
    {
        datCharacters.Call("SELECT");
        
    }
    if (objData.id=="datCharacters" && binit==true)
    {
        
        datEmp_ID_Code.Call("SELECT");
    }
    if (objData.id=="datEmp_ID_Code" )
        txtIDCode.text=idcode;
}
function OnAdd_C()
{
    grdCharacters.AddRow();
    grdCharacters.SetGridText(grdCharacters.rows-1,7,txtIDCode.text);
}
function OnSave_C()
{
    if (confirm("Do you want to save?"))
        datCharacters.Call();
}

</script>
<body bgcolor='#F5F8FF'>
<!--data-->
<gw:data id="datCharacters" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso type="grid" parameter="0,1,3,4,5,7" function="ST_HR_SEL_HRCO00300_1" procedure="ST_HR_UPD_HRCO00300_1" > 
            <input bind="grdCharacters"> 
                <input bind="txtIDCode" />
             </input>
           <output  bind="grdCharacters"/>
        </dso> 
    </xml> 
</gw:data> 
<gw:data id="datEmp_ID_Code"   onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4"  function="ST_HR_SEL_HRCO00300_2" procedure="ST_HR_UPD_HRCO00300_2"> 
            <input> 
               <inout bind="txtIDCode" />
               <inout bind="txtEmpID_Code" />
               <inout bind="txtEmpID_Sample" />
               <inout bind="txtEmp_ID_PK" />
               <inout bind="txtEmp_ID_Len" />
            </input>
        </dso> 
    </xml> 
</gw:data> 
<gw:data id="datTemplates" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso type="grid" parameter="0,1,3,4" function="ST_HR_SEL_HRCO00300_3"  > 
            <input bind="grdTemplates"> 
                <input bind="txtIDCode" />
             </input>
           <output  bind="grdTemplates"/>
        </dso> 
    </xml> 
</gw:data> 
<!--table-->
<table width="100%" style='margin-left:10px'  height ="100%"  border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td width="40%" valign ="top" >
	        <table width = "100%"  cellspacing="0" cellpadding="0">
                <tr>                    
                    <td width="100%" colspan=2 align="center"><b>Some special characters</b></td>
                </tr>   
                <tr>                    
                    
                    <td width="50%" align="center"><gw:imgBtn id="btnAdd_C" img="new" alt="Add Characters"  onclick="OnAdd_C()"/></td>
                    <td width="50%" align="center"><gw:imgBtn id="btnSave_C" img="save" alt="Save Characters"  onclick="OnSave_C()"/></td>
                    
                </tr>   
                <tr >
                    <td colspan=2 >  
                        <table width=100% border=1 cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <gw:grid   
                                    id="grdCharacters"  
                                    header="_PK|Characters|_Char_Len|Len|Examples|Type|Cardinal Number|_ID"   
                                    format="0|0|0|0|0|2|0|0"  
                                    aligns="0|0|0|0|0|0|0|0"  
                                    defaults="|||||||"  
                                    editcol="1|1|1|1|1|1|0|0"  
                                    widths="1000|1000|1000|500|900|0|0"  
                                    styles="width:100%; height:330"   
                                    sorting="T"   
                                    param="0,1,2,3,4,5,6" /> 
                                </td>
                            </tr>
                        </table>  
                        
                    </td>
                </tr>
            </table>
        </td>
		
		
		
        <td width="2%" valign ="top"> 
            <table width = "100%" height="30%" valign ="top">
                <tr style="width:100%;height:20%">                    
                    <td align="center"></td>
                </tr>  
                <tr style="width:100%;height:40%">                    
                    <td align="center"><gw:imgBtn id="btnChar_next" img="next" alt="Select Character"  onclick="SelectCharacters()"/></td>
                </tr>  
                <tr style="width:100%;height:40%">                    
                    <td align="center"><gw:imgBtn id="btnChar_back" img="back" alt="Delete Character"  onclick="DeleteCharacters()"/></td>
                </tr>    
           </table>
        </td>
         <td width="34%" valign ="top" heigth="100%"> 
            <table width = "100%" heigth="100%" valign ="top"  cellspacing="0" cellpadding="0">
                <tr width = "100%">
                    <td></td>
                </tr >
                 <tr width = "100%">
                    <td></td>
                </tr>
                 <tr width = "100%">
                    <td></td>
                </tr>
                <tr width = "100%">                    
                    <td width="40%" align="left"><b>ID Code</b>:</td>
                    <td width="60%" ><gw:textbox id="txtEmpID_Code"  styles="width:100%" /></td>
                </tr>   
                <tr>                    
                    <td width="40%" align="left"><b>ID Code Sample</b>:</td>
                    <td width="60%"><gw:textbox id="txtEmpID_Sample" styles="width:100%" /></td>
                </tr>
                <tr>                    
                    <td colspan=2 align="center"><gw:imgBtn id="btnSave" img="save" alt="Save"  onclick="OnSave()"/></td>
                </tr>
            </table>
        </td>
		 <td width="2%" valign ="top"> 
            <table width = "100%" height="30%" valign ="top">
                <tr style="width:100%;height:20%">                    
                    <td align="center"></td>
                </tr>  
                <tr style="width:100%;height:40%">                    
                    <td align="center"><gw:imgBtn id="btnTemp_back" img="back" alt="Select Template"  onclick="SelectTemplates()"/></td>
                </tr>    
                <tr style="width:100%;height:40%">                    
                   
                </tr> 
                
           </table>
        </td>
        <td width="22%" valign ="top" > 
            <table width = "100%" valign ="top"  cellspacing="0" cellpadding="0">
                <tr>                    
                    <td align="center"><b>Some Templates</b></td>
                </tr>   
                 <tr>                    
                    <td></td>
                </tr>   
                <tr>
                    <td > 
                        <table width=100% border=1 cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <gw:grid   
                                    id="grdTemplates"  
                                    header="_PK|Templates|_PK_Templates|_Len_Templates|Example"   
                                    format="0|0|0|0|0"  
                                    aligns="0|0|0|0|0"  
                                    defaults="||||"  
                                    editcol="0|0|0|0|0"  
                                    widths="1000|1300|1000|1500|0"  
                                    styles="width:100%; height:330"   
                                    sorting="T"   
                                    param="0,1,2,3,4" /> 
                                </td>
                            </tr>
                        
                         </table>   
                    </td>
                </tr>
            </table>
        </td>
	</tr>		
</table>
<gw:textbox id="txtIDCode"  text="BIZ" style="display:none" /> 
<gw:textbox id="txtEmp_ID_PK"  text="" style="display:none" /> 
<gw:textbox id="txtEmp_ID_Len"  text="" style="display:none" /> 
<gw:textbox id="txtResult"  text="0" style="display:none"/>

</body>
</html>
