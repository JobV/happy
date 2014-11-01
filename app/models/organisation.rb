# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organisation < ActiveRecord::Base
end
