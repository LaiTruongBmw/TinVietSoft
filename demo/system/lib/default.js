
var System = null;
if ( typeof(top.CheckSystem) == "undefined" ) 
{	
	if ( typeof(dialogArguments) != "undefined" ) 
	{
		if ( typeof(dialogArguments.System) != "undefined" ) 
		{
			System = dialogArguments.System;
		}
		else
		{
			alert( "Exit Program, Because System is not.(for detail check default.js file)" );
			self.close();
		}
	} 
	else
	{   var host= document.location.host;
	    var sys_url = "http://" + host + "/demo/system/system.aspx";
		document.write( '<form id="idForm" action=' + sys_url + ' method="post"  target="_top" >'  );
		document.write( ' <input type="hidden" name="systemurl" value="' +   document.location.href  + '">' );
		document.write( '</form>' );
		idForm.submit();
	}
}		
else
{
  System = top;
}


function AddList( list , obj )
{
	var i = list.length;
	list[i] = obj ;
}

function DSOElement( type , object , row, col )
{
    this.type = type;
    this.object = object;     
    this.row = row;
    this.col = col;
    this.toString = DSOElementString;
        
}

function DSOElementString()
{
	return this.page.type;	
}

function DSOInfo( page , dsoid , type ,  url ,  element , grid , sqlparam  )
{
    this.page = page;
    this.dsoid = dsoid;     
    this.element = element;     
    this.type = type;
    this.url = url;
    
    this.grid = grid;
    this.sqlparam = sqlparam;

    this.errno = 0;
    this.errmsg = "" ;    
   
    this.toString = DSOString;
}

function DSOString()
{
	return this.page.document.location.href + "[" + this.dsoid +","+ this.url + "," + this.element.length +"]";	
}
