$(function () {

    //加底線為全域變數
    var _weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    //1 產生出 二維陣列
    //2 二維陣列 是月份內的每天 資訊（日期）
    //3 產生出 html 元素，加到 month

    function monthDayCount(year, month) {
        return (--month == 1) ?
            ((year % 4) === 0) && ((year % 100) !== 0) || ((year % 400) === 0) ?
                29 : 28 : [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
    }

    function prevMonth(year, month) {
        return {
            year: month == 1 ?
                year - 1 : year, month: month == 1 ?
                    12 : (month - 1)
        }
    }

    function nextMonth(year, month) {
        return {
            year: month == 12 ?
                year + 1 : year, month: month == 12 ?
                    1 : (month + 1)
        };
    }

    function createMonthArr(year, month) {
        // 一號在星期幾
        // 本月 有幾天
        // 本月 有幾周
        var firstDayWeek = new Date(year, month - 1, 1).getDay();
        var monthCount = monthDayCount(year, month);
        var weekCount = parseInt((firstDayWeek + monthCount) / 7, 10) +
            (((firstDayWeek + monthCount) % 7) ? 1 : 0);
        //取得上個月份
        var p = prevMonth(year, month);
        //取得上個月份的天數
        var prevMonthCount = monthDayCount(p.year, p.month);
        // console.error(monthCount, prevMonthCount);
        //取得下個月份的天數
        var n = nextMonth(year, month);


        //                       7天 
        //                  0 1 2 3 4 5 6 
        //
        //              0   1,2,3,4,5,6,7
        //              1   1,2,3,4,5,6,7
        // weekCount    2   1,2,3,4,5,6,7
        //              3   1,2,3,4,5,6,7
        //              4   1,2,3,4,5,6,7

        //                       7天 
        //           j       0  1  2  3  4  5  6 
        //
        //              0    0, 1, 2, 3, 4, 5, 6 
        //              1    7, 8, 9,10,11,12,13
        // weekCount    2   14,15,16,17,18,19,20
        //              3   21,22,23,24,25,26,27
        //              4   28,29,30,31


        var date = new Date();

        //產生幾個元素的陣列
        return Array.apply(null, Array(weekCount)).map(function (_, i) {
            return Array.apply(null, Array(7)).map(function (_, j) {
                var day = i * 7 + j - firstDayWeek + 1;
                //month會變取代 所以要宣告新的變數 month2
                var month2 = month;
                var year2 = year;
                var thisMonth = true; //是否為本月份 

                //每月最後一天之後
                if (day > monthCount) {
                    day = day - monthCount;
                    month2 = n.month;
                    year2 = n.year;
                    thisMonth = false;
                }

                //每月第一天之前
                if (day <= 0) {
                    day = day + prevMonthCount;
                    month2 = p.month;
                    year2 = p.year;
                    thisMonth = false;
                }

                var today = year2 == date.getFullYear() && month2 == date.getMonth() + 1 && day == date.getDay(); 

                return {
                    year: year2,
                    month: month2,
                    day: day,
                    thisMonth: thisMonth,
                    today: today
                };

            })
        });

        // console.error(firstDayWeek);
        // console.error(monthCount);
        // console.error(weekCount);
        // console.error(t);
        // console.error(prevMonth(2017, 1));
    }

    var $month = $('.month');
    var $title = $('.calendar .top .title');

    function renderMonth(year, month) {
        //該月份的二維陣列
        var monthArr = createMonthArr(year, month);

        var week = $('<div />').addClass('weeks').append(
            _weeks.map(function (t) {
                // console.error(t);
                return $('<div />').text(t);
            }));

        var days = monthArr.map(function (week) {
            // console.error(week); 
            return $("<div />").addClass("days").append(
                week.map(function (day) {
                    return $("<div />")
                        .addClass(day.thisMonth ? null : 'next-prev-month')
                        .addClass(day.today ? 'today' : null)
                        .attr("data-year", day.year)
                        .attr("data-month", day.month)
                        .attr("data-day", day.day);
                }));
        });

        //把之前的清空 再加入week
        $month.empty().append(week).append(days);

        $title.attr("data-year", year).attr("data-month", month);
    }

    //本月 按鈕
    $(' .top .btns .today').click(function () {
        var date = new Date();
        // console.error(date.getFullYear() , date.getMonth() + 1 );
        renderMonth(date.getFullYear(), date.getMonth() + 1)
    }).click();

    //前一個月 按鈕
    $('.top .btns .prev').click(function () {
        // console.error("prev");
        // 本月是幾月
        var year = parseInt($title.attr("data-year"), 10);
        var month = parseInt($title.attr("data-month"), 10);
        // console.error(year ,month);
        // 知道本月後要取上個月 prevMonth
        var p = prevMonth(year, month);
        // console.error(p);
        renderMonth(p.year, p.month);

    });

    //下一個月 按鈕
    $('.top .btns .next').click(function () {
        // console.error("next");
        // 本月是幾月
        var year = parseInt($title.attr("data-year"), 10);
        var month = parseInt($title.attr("data-month"), 10);
        // console.error(year ,month);
        // 知道本月後要取下個月 nextMonth
        var n = nextMonth(year, month);
        renderMonth(n.year, n.month);
    });

});