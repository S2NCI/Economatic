class EconTable < ApplicationRecord
  def calculated_deficit
    divisor = status == "Thrifty" ? 4.0 : 5.0
    gross_val = gross || 0
    trade_val = trade || 0
    expenditure_val = expenditure || 0
    reserve_val = reserve || 0

    -(((reserve_val + (gross_val / divisor) + trade_val) - (expenditure_val.abs**1.01 + reserve_val)) / 2.0)
  end
end
