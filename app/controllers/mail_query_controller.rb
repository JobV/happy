class MailQueryController < ApplicationController
  def settings
    @organisation = current_user.organisation
    @query_freqs = Organisation.query_frequencies
  end

  def happiness
    current_user.organisation.send_out_query

    # if dev, immediately everyone respond
    dev_behavior

    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end

  private

  def people
    current_user.organisation.people
  end

  def dev_behavior
    return unless Rails.env == 'development'
    people.each do |p|
      Response.create(
        body: "it's alright",
        raw_html: "it's alright",
        email: p.email,
        grade: Random.rand(10),
        person: p)
    end
  end
end
