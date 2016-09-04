class Cal
  attr_reader :count

  def initialize
    @count = 0
  end

  def days_in_month year, month
    case month
    when 1 then return 31
    when 2 then return is_leap_year(year) ? 29 : 28
    when 3 then return 31
    when 4 then return 30
    when 5 then return 31
    when 6 then return 30
    when 7 then return 31
    when 8 then return 31
    when 9 then return 30
    when 10 then return 31
    when 11 then return 30
    when 12 then return 31
    else raise 'error'
    end
  end

  def is_leap_year year
    (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0)
  end

  def next_date year, month, day, dow
    @count += 1 if day == 1 && dow == 0
    return next_year(year,month,day), next_month(year,month,day), next_day(year,month,day), next_dow(dow)
  end

  def next_year year, month, day
    year + ((month == 12 && day == 31) ? 1 : 0)
  end

  def next_month year, month, day
    return 1 if month == 12 && day == 31
    return month + 1 if day + 1 > days_in_month(year, month)
    return month
  end

  def next_day year, month, day
    return 1 if day + 1 > days_in_month(year, month)
    return day + 1
  end

  def next_dow dow
    (dow + 1) % 7
  end
end

year = 1901
month = 1
day = 1
dow = 0

c = Cal.new
i = 0
while year != 2000 || month != 12 || day != 31
  i += 1
  year, month, day, dow = c.next_date year, month, day, dow
end
puts i
puts c.count
