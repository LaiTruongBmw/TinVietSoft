/*!
 * MonthYearPicker JavaScript Library v1.0.1
 * http://www.encodeinfotech.com/
 * http://www.malappuraminfo.com/info/javascript-month-year-picker
 * Copyright 2010, Haris PP (ppharis@gmail.com)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * Released under the MIT, BSD, and GPL Licenses.
 * Date: September 15 10:30:48 2010 -0500
 */

function positionInfo(object) {
    var p_elm = object;
    this.getElementLeft = getElementLeft;

    function getElementLeft() {
        var x = 0;
        var elm;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        while (elm != null) {
            x += elm.offsetLeft;
            elm = elm.offsetParent;
        }
        return parseInt(x);
    }
    this.getElementWidth = getElementWidth;

    function getElementWidth() {
        var elm;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        return parseInt(elm.offsetWidth);
    }
    this.getElementRight = getElementRight;

    function getElementRight() {
        return getElementLeft(p_elm) + getElementWidth(p_elm);
    }
    this.getElementTop = getElementTop;

    function getElementTop() {
        var y = 0;
        var elm;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        while (elm != null) {
            y += elm.offsetTop;
            elm = elm.offsetParent;
        }
        return parseInt(y);
    }
    this.getElementHeight = getElementHeight;

    function getElementHeight() {
        var elm;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        return parseInt(elm.offsetHeight);
    }
    this.getElementBottom = getElementBottom;

    function getElementBottom() {
        return getElementTop(p_elm) + getElementHeight(p_elm);
    }
}
function CalendarControl() {
    var calendarId = 'CalendarControl';
    var currentYear = 0;
    var currentMonth = 0;
    var currentDay = 0;
    var selectedYear = 0;
    var selectedMonth = 0;
    var selectedDay = 0;
    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var dateField = null;

    function getProperty(p_property) {
        var p_elm = calendarId;
        var elm = null;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        if (elm != null) {
            if (elm.style) {
                elm = elm.style;
                if (elm[p_property]) {
                    return elm[p_property];
                } else {
                    return null;
                }
            } else {
                return null;
            }
        }
    }
    function setElementProperty(p_property, p_value, p_elmId) {
        var p_elm = p_elmId;
        var elm = null;
        if (typeof (p_elm) == "object") {
            elm = p_elm;
        } else {
            elm = document.getElementById(p_elm);
        }
        if ((elm != null) && (elm.style != null)) {
            elm = elm.style;
            elm[p_property] = p_value;
        }
    }
    function setProperty(p_property, p_value) {
        setElementProperty(p_property, p_value, calendarId);
    }
    function getDaysInMonth(year, month) {
        return [31, ((!(year % 4) && ((year % 100) || !(year % 400))) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
    }
    this.clearDate = clearDate;

    function clearDate() {
        dateField.value = '';
        dateField.focus();
        hide();
    }
    this.setDate = setDate;
	
    function setDate(year, month, day) {
        if (day < 10) {
            day = "0" + day;
        }
        if (month < 10) {
            month = "0" + month;
        }
        
        var dateString = year + "" + month ;
        parent.window.eval(_parentID).SetGridText(_row, _col, dateString);
        parent.window.eval(_parentID).PopupClose();
        hide();
        
        return;
    }
    this.changeMonth = changeMonth;

    function changeMonth(change) {
        currentMonth += change;
        currentDay = 0;
        if (currentMonth > 12) {
            currentMonth = 1;
            currentYear++;
        } else if (currentMonth < 1) {
            currentMonth = 12;
            currentYear--;
        }
        calendar = document.getElementById(calendarId);
        calendar.innerHTML = calendarDrawTable();
    }
    this.changeYear = changeYear;

    function changeYear(change) {
        currentYear += change;
        currentDay = 0;
        calendar = document.getElementById(calendarId);
        calendar.innerHTML = calendarDrawTable();
    }
    function getCurrentYear() {
        var year = new Date().getYear();
        if (year < 1900) year += 1900;
        return year;
    }
	this.getCurrentYear = getCurrentYear;
	
    function getCurrentMonth() {
        return new Date().getMonth() + 1;
    }
	this.getCurrentMonth = getCurrentMonth;
	
    function getCurrentDay() {
        return new Date().getDate();
    }
    function calendarDrawTable() {
        var css_class = null;
        var table = "<table cellspacing='0' cellpadding='0' border='0'>";
        table = table + "<tr class='cal_header'>";
        table = table + "  <td colspan='1' class='previous'><a href='javascript:changeCalendarControlYear(-1);'>&lt;</a></td>";
        table = table + "  <td colspan='1' class='title'>" + currentYear + "</td>";
        table = table + "  <td colspan='1' class='next'><a href='javascript:changeCalendarControlYear(1);'>&gt;</a></td>";
        table = table + "</tr>";
        var incm = 0;
        for (var mon = 0; mon < 4; mon++) {
            table += "<tr>";
            for (var mon1 = 0; mon1 < 3; mon1++) {
                if (currentMonth == incm + 1) css_class = 'current';
                else css_class = 'weekday';
                table += "<td><a href='javascript:;' onclick=\"javascript:setCalendarControlDate(" + currentYear + "," + (incm + 1) + ",1)\" class='" + css_class + "'>" + months[incm] + "</a></td>";
                incm++;
            }
            table += "</tr>";
        }
        table = table + "<tr class='cl_header'><th colspan='3' style='padding: 3px;'><a href='javascript:;' onclick='javascript:setCurrentDate();'>Current Month</a> | <a href='javascript:;' onclick='javascript:clearCalendarControl();'>Clear</a> | <a href='javascript:;' onclick='javascript:hideCalendarControl();'>Close</a></td></tr>";
        table = table + "</table>";
        return table;
    }
    this.show = show;

    function show(field, xp, yp) {
        can_hide = 0;
        if (field != "" ) {
            try {
                var dateParts = field.split("/");
                selectedDay = 1;
                selectedMonth = parseInt(dateParts[0], 10);
                selectedYear = parseInt(dateParts[1], 10);
            } catch (e) {}
        }
        if (!(selectedYear && selectedMonth && selectedDay)) {
            selectedDay = getCurrentDay();
            selectedMonth = getCurrentMonth();
            selectedYear = getCurrentYear();
        }
        currentDay = selectedDay;
        currentMonth = selectedMonth;
        currentYear = selectedYear;
        if (document.getElementById) {
            calendar = document.getElementById(calendarId);
            calendar.innerHTML = calendarDrawTable(currentYear, currentMonth);
            setProperty('display', 'block');
            var fieldPos = new positionInfo(calendarId);
            var calendarPos = new positionInfo(calendarId);
            if (xp == 0) {
                var x = fieldPos.getElementLeft();
            } else var x = xp;
            if (yp == 0) var y = fieldPos.getElementBottom();
            else var y = yp;
            setProperty('left', x + "px");
            setProperty('top', y + "px");
        }
    }
    this.hide = hide;

    function hide() {
        if (calendarId) {
            setProperty('display', 'none');
        }
    }
    this.visible = visible;

    function visible() {
        return dateField
    }
    this.can_hide = can_hide;
    var can_hide = 0;
}
var calendarControl = new CalendarControl();

function showCalendarControl(curVal, x, y) {
    if (!x) {
        x = 0
    }
    if (!y) {
        y = 0
    }
    //var field = document.getElementById(textField);
    calendarControl.show(curVal, x, y);
}
function clearCalendarControl() {
    //calendarControl.clearDate();
    parent.window.eval(_parentID).SetGridText(_row, _col, "");
    parent.window.eval(_parentID).PopupClose();
}
function hideCalendarControl() {
    //if (calendarControl.visible()) {
    //    calendarControl.hide();
    //}
    parent.window.eval(_parentID).PopupClose();
}

function setCurrentDate() {
	var dateString = calendarControl.getCurrentYear() + "" + calendarControl.getCurrentMonth();
	parent.window.eval(_parentID).SetGridText(_row, _col, dateString);
	parent.window.eval(_parentID).PopupClose();
}

function setCalendarControlDate(year, month, day) {
    calendarControl.setDate(year, month, day);
}
function changeCalendarControlYear(change) {
    calendarControl.changeYear(change);
}
function changeCalendarControlMonth(change) {
    calendarControl.changeMonth(change);
}
calendarControl.show(curVal, 0, 0);
//document.write("<div id='CalendarControl'></div>");