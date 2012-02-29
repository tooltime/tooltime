module ApplicationHelper
  def sortable_col(col)
    ("#{col.to_s.titleize.downcase} " +
    "<span class=\"arrows\" style=\"float: right;\">#{link_to('<i class="icon-chevron-up"></i>'.html_safe, :sort => col.to_sym, :order => 'asc')} " +
    "#{link_to('<i class="icon-chevron-down"></i>'.html_safe, :sort => col.to_sym, :order => 'desc')}</span>").html_safe
  end
end
