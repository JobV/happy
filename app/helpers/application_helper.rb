module ApplicationHelper
  def navlinkclass(page_name)
    if instance_variable_get("@#{page_name}")
      'active item'
    else
      'item'
    end
  end

  def grade_label(grade)
    color = case grade
            when 0..5 then 'red'
            when 6..7 then 'blue'
            when 8..10 then 'green'
            else 'black'
    end
    haml_tag :div, class: "ui #{color} horizontal label grade-label" do
      yield
    end
  end

  def current_org
    current_user.organisation
  end

  def header
    haml_tag :h2, class: 'ui header inverted teal tophead' do
      yield
    end
  end

  def debug?
    Rails.env == 'development' && params.key?(:d)
  end
end
