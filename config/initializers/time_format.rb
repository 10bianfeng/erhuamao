# -*- encoding : utf-8 -*-
# Use: <%=h deal.start_date.to_s(:ymdh) %>
Time::DATE_FORMATS[:default_long] = "%Y年%m月%d日 %H时%M分%S秒"
Time::DATE_FORMATS[:ymdh] = "%Y年%m月%d日 %H时"
Time::DATE_FORMATS[:sort] = "%Y/%m/%d-%H:%M"
