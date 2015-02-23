namespace :check_email_queries do
  desc 'Checks whether there are any email queries to send out and sends them'
  task :all do
    Organisation.where("subscription_until > #{Time.now}").each(&:send_out_query)
  end
end
