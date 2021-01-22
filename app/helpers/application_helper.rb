module ApplicationHelper
    def page_title
        title = "Attend App"
        title = @page_title + " - " + title if @page_title
        title
    end
end
