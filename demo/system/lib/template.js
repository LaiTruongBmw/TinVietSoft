//Trim the input string
function Trim(sent){
	var S=new String(sent);
	S=S.replace(/^\s+/,"");
	return S.replace(/\s+$/,"")
};
//Check the input is empty string or not
function isEmpty(input) {
	if (Trim(input) == "") 
		return true; 
	else 
		return false;
};

//check dateStr meet the input Date format or not
function isDate(dateStr, fmtNo) {
		
	// Checks for meet one of the following valid date formats:
	// 1 : MM/DD/YYYY   
	// 2 : DD/MM/YYYY
	// 3 : YYYY/MM/DD

	var datePat;
	var mInd = 1;
	var dInd = 3;
	var yInd = 4;
	
	if (fmtNo == 1) {
		datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
		mInd = 1;
		dInd = 3;
		yInd = 4;
	}else if (fmtNo == 2) {
		datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;	
		mInd = 3;
		dInd = 1;
		yInd = 4;		
	}else if (fmtNo == 3) {
		datePat = /^(\d{4})(\/|-)(\d{1,2})\2(\d{1,2})$/;		
		mInd = 3;
		dInd = 4;
		yInd = 1;				
	} else {
		return -7; // Not support this format index
	}
	
	var matchArray = dateStr.match(datePat); // is the format ok?
	if (matchArray == null) {
		//alert("Date is not in a valid format. \n Day must be between 1 and 31, years must be 4 digit");
		return -1;
	}
	
	month = matchArray[mInd]; // parse date into variables
	day = matchArray[dInd];
	year = matchArray[yInd];

	if (day < 1 || day > 31) {
		//alert("Day must be between 1 and 31.");
		return -2;
	}
	if (month < 1 || month > 12) { // check month range
		//alert("Month must be between 1 and 12.");
		return -3;
	}

	if ( year<= 1940 || year >= 1990 ) {
		//alert("Year must be greater than 1900.");
		return -4;
	}
	if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		//alert("Month "+month+" doesn't have 31 days!")	
		return -5;
	}
	if (month == 2) { // check for february 29th
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day==29 && !isleap)) {
			//alert("February " + year + " doesn't have " + day + " days!");
			return -6;
   		}
	}
	return 0;  // date is valid

};

//check dateStr meet the input Month format or not
function isMonth(dateStr, fmtNo) {
		
	// Checks for meet one of the following valid date formats:
	// 1 : MM/YYYY   
	// 2 : YYYY/MM

	var datePat;
	var mInd = 1;
	var yInd = 3;
	
	if (fmtNo == 1) {
		datePat = /^(\d{1,2})(\/|-)(\d{4})$/;
		mInd = 1;
		yInd = 3;
	}else if (fmtNo == 2) {
		datePat = /^(\d{4})(\/|-)(\d{1,2})$/;	
		mInd = 3;
		yInd = 1;		
	}else {
		return -4; // Not support this format index
	}
	
	var matchArray = dateStr.match(datePat); // is the format ok?
	if (matchArray == null) {
		//alert("Date is not in a valid format. \n Day must be between 1 and 31, years must be 4 digit");
		return -1;
	}
	
	month = matchArray[mInd]; // parse date into variables
	year = matchArray[yInd];

	if (month < 1 || month > 12) { // check month range
		//alert("Month must be between 1 and 12.");
		return -2;
	}

	if ( year<= 1940 || year >= 1990 ) {
		//alert("Year must be greater than 1900.");
		return -3;
	}

	return 0;  // date is valid

};

//Check the input is stand for an email address or not
function isEmail(emailStr) {
	var emailPat=/^(.+)@(.+)$/
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
	var validChars="\[^\\s" + specialChars + "\]"
	var firstChars=validChars
	var quotedUser="(\"[^\"]*\")"
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
	var atom="(" + firstChars + validChars + "*" + ")"
	var word="(" + atom + "|" + quotedUser + ")"
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
	var matchArray=emailStr.match(emailPat)
	if (matchArray==null) {
		alert("Email address seems incorrect (check @ and .'s)")
		return false
	}
	var user=matchArray[1]
	var domain=matchArray[2]

	// See if "user" is valid 
	if (user.match(userPat)==null) {
    // user is not valid
    alert("The username doesn't seem to be valid.")
    return false
	}
	/* if the e-mail address is at an IP address (as opposed to a symbolic
   host name) make sure the IP address is valid. */
	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
    // this is an IP address
	  for (var i=1;i<=4;i++) {
	    if (IPArray[i]>255) {
	      alert("Destination IP address is invalid!")
				return false
	    }
    }
    return true
	}
	// Domain is symbolic name
	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		alert("The domain name doesn't seem to be valid.")
    return false
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 || domArr[domArr.length-1].length>3) {
   // the address must end in a two letter or three letter word.
   alert("The address must end in a three-letter domain, or two letter country.")
   return false
	}
	if (domArr[domArr.length-1].length==2 && len<3) {
   var errStr="This address ends in two characters, which is a country"
   errStr+=" code.  Country codes must be preceded by "
   errStr+="a hostname and category (like com, co, pub, pu, etc.)"
   alert(errStr)
   return false
	}
	if (domArr[domArr.length-1].length==3 && len<2) {
  	var errStr="This address is missing a hostname!"
   	alert(errStr)
   	return false
	}
	// If we've gotten this far, everything's valid!
	return true;
};

// Checks for the following valid date formats:
// MM/DD/YYYY  MM-DD-YYYY
// Also separates date into month, day, and year variables
function isDate(dateStr) {
	//var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{2}|\d{4})$/;

	// To require a 4 digit year entry, use this line instead:
	var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;

	var matchArray = dateStr.match(datePat); // is the format ok?
	if (matchArray == null) {
		//alert("Date is not in a valid format. \n Day must be between 1 and 31, years must be 4 digit");
		return -1;
	}
	month = matchArray[1]; // parse date into variables
	day = matchArray[3];
	year = matchArray[4];

	if (day < 1 || day > 31) {
		//alert("Day must be between 1 and 31.");
		return -2;
	}
	if (month < 1 || month > 12) { // check month range
		//alert("Month must be between 1 and 12.");
		return -3;
	}

	if ( year<= 1940 || year >= 1990 ) {
		//alert("Year must be greater than 1900.");
		return -4;
	}
	if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		//alert("Month "+month+" doesn't have 31 days!")	
		return -5;
	}
	if (month == 2) { // check for february 29th
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day==29 && !isleap)) {
			//alert("February " + year + " doesn't have " + day + " days!");
			return -6;
   		}
	}
	return 0;  // date is valid

};

function makeFourDigitYear(sent){
	if(sent.length>2) return sent;
	if(sent<50)return "20"+sent;
	else return "19"+sent
};
	
function getMonthLength(month,year){
	year=makeFourDigitYear(year);
	var monthlength = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	if(month==1 && (year/4==Math.floor(year/4) || year/400==Math.floor(year/400)))
		return 29;
	else return monthlength[month];
};

// format the input str to ###,###,###
function FormatNumber(str){
	var arr = new Array(20);
	var i,j,k;
	var s = '';
	str = str.replace(/,/gi,'');

	var n = str.length;
	//alert(str.indexOf("."));
	
	if (str.indexOf(".")>0) {
		n = str.indexOf(".") 
	}
	
	if (n>3) {
		for (i=0;i<20;i++) {
			arr[i] = ' ';
		}
		i = n-1;
		j = 0;
		k = 0;
		while (i>=0) {
			if (k == 3) {
				arr[j] = ',';
				j++;
				k = 0;
			}
			arr[j] = str.charAt(i);
			j++;
			k++;
			
			i--;
		}
		for (i=19;i>=0;i--) {
			if (arr[i] != ' ') {
				s = s + arr[i];
			}
		}
		//s = Trim(s);
		if (s.charAt(0) == ',') { 
			s = s.substr(1, s.length-2);
		}
		
		if (str.indexOf(".")>0) {
			s = s + str.substring(str.indexOf("."), str.length)
		}
	} else {
		s = str;
	}
	return s;
};

/* Open dialog */
function openDialog (filePath, wHeight, wWidth)
{
	var fpath = System.RootURL + filePath; 	
	
	var a = new Array();
	aValue  = System.OpenModal(  filePath , wWidth , wHeight , 'resizable:yes;status:yes');	
	return aValue;
}

/*Open new window as a dialog (no menu, no toolbar ...)*/
function openTarget (form, wHeight, wWidth, windowName) {

 	var x = Math.round((screen.availWidth - wWidth) / 2);
 	var y = Math.round((screen.availHeight - wHeight) / 2);
 
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			   
 	if (!windowName)
 		windowName = '_blank'; // (new Date().getTime());

	form.target = windowName;
	clientWin = open (form, windowName, features);
	clientWin.focus();
};

function getCurrentDateStr( type, lang ) {
	var today;
	today = new Date();
	var s;
  var y = "000" + (today.getFullYear());
	var m = "0" + (today.getMonth()+1);
	var d =  "0" + (today.getDate()) ;

	if ( type==0 )
	{
		if(lang != "1")
	 	   s =  y.substr( y.length - 4 )   +  m.substr( m.length - 2 )   + d.substr( d.length - 2 )  ;
		else
		   s =  d.substr( d.length - 2 )   + m.substr( m.length - 2 )   + y.substr( y.length - 4 );
	}
	else if ( type==1 )
	        if(lang != "1")
		   s =  y.substr( y.length - 4 )   + m.substr( m.length - 2 );
		else
		   s =  m.substr( m.length - 2 )   + y.substr( y.length - 4 );
		
	else
		s =  y.substr( y.length - 4 )    ;
	
	return s;	
	
};

function getOneMonthDateStr( type, lang ) {
	var today;
	today = new Date();
	var s;
  var y = "000" + (today.getFullYear());
	var m = "0" + (today.getMonth()+ 2);
	var d =  "0" + (today.getDate()) ;

	if ( type==0 )
	{
		if(lang != "1")
	 	   s =  y.substr( y.length - 4 )   +  m.substr( m.length - 2 )   + d.substr( d.length - 2 )  ;
		else
		   s =  d.substr( d.length - 2 )   + m.substr( m.length - 2 )   + y.substr( y.length - 4 );
	}
	else if ( type==1 )
	        if(lang != "1")
		   s =  y.substr( y.length - 4 )   + m.substr( m.length - 2 );
		else
		   s =  m.substr( m.length - 2 )   + y.substr( y.length - 4 );
		
	else
		s =  y.substr( y.length - 4 )    ;
	
	return s;	
	
};

function showMessage ( type , contain )
{
	var url = System.SystemURL + "/lib/showMessage.asp?ErrorMsg=" + contain + "&MsgType=" + type;
	var s = "";
	var width, height;
	width = contain.length * 8;
	if (width > 400) {
		width = 400;
	}
	height = contain.length * 1.2; //120;
	s += "dialogWidth:" + width +" px";
	s += ";dialogHeight:" + height + " px" ;
	
  s += "; resizable:no;status:no;scroll:no;";
	
	return window.showModalDialog(  url , top, "title:no; unadorned:on ; center:yes; edge:sunken ; " + s );		 
	
};

// input format YYYYMMDD
function AddDateSeparator( s, lang )
{
	switch (lang) {
		case 0 : { // DD/MM/YYYY
			return s.substring( 0, 4 ) +"/"+ s.substring( 4, 6 ) +"/" +  s.substring( 6, 8  ) ;		
			break;
		}
		case 1 : { // YYYY/MM/DD
			return  s.substring( 6, 8  ) +"/"+ s.substring( 4, 6 ) +"/" + s.substring( 0, 4 );		
			break;
		}		
	}

}

function RemoveComma( str) {
	return 	str.replace(/,/gi,'')
}

function MyRound(num) {
	var a;
	a = Math.round(num);
	if (num > a) a = a+1;
	return a;
}