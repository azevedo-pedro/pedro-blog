module ApplicationHelper
  MONTHS_PT = %w[
    janeiro fevereiro março abril maio junho
    julho agosto setembro outubro novembro dezembro
  ].freeze

  def format_date_pt(date)
    "#{date.day} de #{MONTHS_PT[date.month - 1]} de #{date.year}"
  end
end
