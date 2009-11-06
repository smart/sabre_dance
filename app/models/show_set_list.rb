class ShowSetList < ActiveRecord::Base
  belongs_to :show
  belongs_to :set_list
  acts_as_list :scope => :show
end
