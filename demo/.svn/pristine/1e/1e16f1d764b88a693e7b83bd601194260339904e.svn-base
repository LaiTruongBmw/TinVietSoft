<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var check_init=0;
var p_ProbationSalary = 45;
var p_AllowAmt1 = 48;
var p_TotalSalary = 80;
//"V|No|Title|Tiêu Đề|_Field_E|_Field_V|_Col_num|_pk|_Status"   
var G1_V = 0;
function BodyInit()
{ 	
	System.Translate(document);
    grdSelect.GetGridControl().ScrollTrack=true;
    //txtLang.text = v_language;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}
    
    datAllowance.Call();
    
}


function OnDataReceive(obj)
{
    if (obj.id=="datAllowance")
    {
        datSelectTitle.Call();
    }
    else if (obj.id=="datSelectTitle")
    {
        var icol=p_AllowAmt1; //value of allowance col
        grdSelect.SetGridText(icol,2,grdAllowance.GetGridData(1,0));
        grdSelect.SetGridText(icol+1,2,grdAllowance.GetGridData(1,1));
        grdSelect.SetGridText(icol+2,2,grdAllowance.GetGridData(1,2));
        grdSelect.SetGridText(icol+3,2,grdAllowance.GetGridData(1,3));
        grdSelect.SetGridText(icol+4,2,grdAllowance.GetGridData(1,4));
        grdSelect.SetGridText(icol+5,2,grdAllowance.GetGridData(1,5));
        grdSelect.SetGridText(icol+6,2,grdAllowance.GetGridData(1,6));
        grdSelect.SetGridText(icol+7,2,grdAllowance.GetGridData(1,7));

        grdSelect.SetGridText(icol,3,grdAllowance.GetGridData(1,16));
        grdSelect.SetGridText(icol+1,3,grdAllowance.GetGridData(1,17));
        grdSelect.SetGridText(icol+2,3,grdAllowance.GetGridData(1,18));
        grdSelect.SetGridText(icol+3,3,grdAllowance.GetGridData(1,19));
        grdSelect.SetGridText(icol+4,3,grdAllowance.GetGridData(1,20));
        grdSelect.SetGridText(icol+5,3,grdAllowance.GetGridData(1,21));
        grdSelect.SetGridText(icol+6,3,grdAllowance.GetGridData(1,22));
        grdSelect.SetGridText(icol+7,3,grdAllowance.GetGridData(1,23));

        for(var i = 0; i < 8; i++)
        {
            var b = !(Number(grdAllowance.GetGridData(1,8 + i)));
            if (b == true)
            {
                grdSelect.GetGridControl().RemoveItem(icol + i);
                icol = icol - 1;
            }
        }
        datSal_security.Call();
    }
    else if (obj.id=="datSal_security")
    {
        if(txt_sal_security.text=='N') 
        {
            var icol = p_ProbationSalary; //value of probation salary
            
            for (var i=0;i<=9;i++)
                grdSelect.GetGridControl().RowHidden(icol + i) = 1;

            grdSelect.GetGridControl().RowHidden(p_TotalSalary) = 1;

        }
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
	    else
		    check_init=1;
    }   
}  


function OnChangeLang()
{
    
}

function OnSelect()
{
	OnSetGrid(chkCheckAll, grdSelect, G1_V)
}
function OnSetGrid(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
				if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
			    
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}

function OnRemove(n)
{
    
}

function OnReport()
{
    
    var aData =new Array();
    var j,tmp;
    j = 0;
    var bSelect=false;

    for(var i = 1; i < grdSelect.rows; i++)
    {
        if (grdSelect.GetGridData(i, 0) == "-1")
		{
            var aRow=new Array();
            bSelect=true;
            aRow[0]= grdSelect.GetGridData(i, 6); //column num
            aData[j]=aRow;
            j++;
		}
    }

    if (j == 0){
        alert("Please select title.");
	    return;
    }
    
    if (bSelect == true)
    {
        var RowSel = new Array();
        RowSel[0] = lstLang.value;
        aData[j] = RowSel;
        j=j+1;
    }
    
    window.returnValue = aData; 			
	this.close();
}
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-- MainTable -->
<!-------------------data control----------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HREM00201_0" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datSal_security" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_SEL_HREM00201_2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txt_sal_security" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datSelectTitle" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" function="ST_HR_SEL_HREM00201_1" > 
                <input bind="grdSelect" >
                </input>
                <output  bind="grdSelect" />
            </dso> 
        </xml> 
</gw:data>

<table cellpadding="0" cellspacing="0" style="width:100%;height:100%;" class="eco_line">
    <tr> 
	    <td  width="40%" valign ="top" >
		    <table align = top  width="100%" style="height:100%">
                <tr style="border:1;width:100%;height:5%" valign="top">                    
                    <td width="100%" align="center"><gw:label id="lbltitle"  text="Chọn cột để xuât báo cáo" maxlen = "100" styles="color:red;width:90%;font-weight: blod;font-size:14" /></td>
                </tr>   
                <tr width="3%" style="border:0;height:5%">
                    <td width="100%" align="left">
                        <table cellpadding="2" cellspacing="1">
                            <tr>
                                <td><gw:checkbox id="chkCheckAll" style="width: 100%"  value="F" onclick="OnSelect()"></gw:checkbox></td>
                                <td>Tất cả</td>
                                <td align="right" style="padding-left:50px">Ngôn ngữ</td>
                                <td align="left" style="width:100px">
                                    <gw:list  id="lstLang" value="VIE" styles='width:100%' onchange="OnChangeLang()"> 
						                <data>LIST|ENG|English|VIE|Việt Nam</data> 
					                </gw:list>
                                </td>
                                <td>
                                    <gw:button id="ibtnPrint" alt="Print employee information" img="excel" text="Report" onclick="OnReport()"/>	
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="border:1;width:100%;height:90%" valign="top">
                    <td style="width:100%;height:100%;">  
                        <gw:grid   
                            id="grdSelect"  
			                header="V|No|_Title|Tiêu Đề|_Field_E|_Field_V|_Col_num|_pk|_Status"   
			                format="3|0|0|0|0|0|0|0|0"  
			                aligns="0|0|0|0|0|0|0|0|0"  
			                defaults="|||||||||"  
			                editcol="0|0|0|0|0|0|0|0|0"  
			                widths="300|100|1500|1500|0|0|0|0|0"  
			                styles="width:100%; height:100%"   
                            sorting="F"
			                autosize="true"
                        /> 
                    </td>
                </tr>
           </table>
	    </td> 
	</tr>
</table>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>
    <gw:textbox id="txt_sal_security" styles="display:none"/>
	<gw:textbox id="txt_pos_allow1" styles="display:none"/>

    <gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8|Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    defaults="||||||||||||||||||||||"  
    editcol="0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200|0|0|0|0|0|0|0|0"  
    styles="display:none" 
    sorting="T"    
    />

</body>
</html>
