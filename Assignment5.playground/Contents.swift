
func isLeap(year: Int) -> Bool
{ return (year % 400 == 0 || ((year % 100 != 0) && year % 4 == 0)) }

var leapdays = 0
func julianDate(year: Int, month: Int, day: Int) -> Int
{
    leapdays += isLeap(year) || isLeap(year - 1) ? 1 : 0
    var y = year + 4800 - ((14-month)/12), m = month + 12*((14-month)/12) - 3
    return (1900,1,1) == (year, month, day) ? 1 : ((day + ((153 * m + 2) / 5) + 365 * y + ((y/4) - (y/100)) + (y/400) - 32045) - 2415022) + leapdays
}



julianDate(1960, month:  9, day: 28)

julianDate(1900, month:  1, day: 1)

julianDate(1900, month: 12, day: 31)

julianDate(1901, month: 1, day: 1)

julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)

julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)

isLeap(1960)

isLeap(1900)

isLeap(2000)






 





