class User < ActiveRecord::Base
  before_save :compute_fullname

private
  def compute_fullname
    self.full_name = self.first_name + " " + self.last_name
  end
end
