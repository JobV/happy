namespace :check_email_queries do

  desc "Checks whether there are any email queries to send out and sends them"
  task :check_all_queries do
    Organisation.where(sub: true).send :send_out_query
  end
end
