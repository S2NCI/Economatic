class AiTable < ApplicationRecord
  def calculated_expenditure
    gross_val = gross || 0
    trade_val = trade || 0

    (gross_val+trade_val)*0.2
  end
end
