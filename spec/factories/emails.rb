FactoryGirl.define do
  factory :email, class: OpenStruct do
    # Assumes Griddler.configure.to is :hash (default)
    to [{ full: 'to_user@email.com', email: 'to_user@email.com', token: 'to_user', host: 'email.com', name: nil }]
     from({ token: 'from_user', host: 'email.com', email: 'user@email.com', full: 'From User <user@email.com>', name: 'From User' })
    subject 'email subject'
    body 'Hello! Here is some random content'
    attachments {[]}

    trait :with_attachment do
      attachments {[
        ActionDispatch::Http::UploadedFile.new({
          filename: 'img.png',
          type: 'image/png',
          tempfile: File.new("#{File.expand_path(File.dirname(__FILE__))}/fixtures/img.png")
        })
      ]}
    end
  end
end
