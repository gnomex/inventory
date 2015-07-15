module ApplicationHelper
  # Display a inline error message for that attribute.
  #
  #   <%= error_for @user, :name %>
  #
  def error_for(record, attribute)
    message = record.errors[attribute].first
    content_tag :span, message, :class => "error" if message
  end
end
