class ShowSetList < ActiveRecord::Base
  belongs_to :show
  belongs_to :set_list
  acts_as_list :scope => :show
  before_validation_on_create :ensure_set_list
  validates_presence_of :set_list


  private

  def ensure_set_list
    self.set_list ||= SetList.new
  end

end
