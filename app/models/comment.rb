class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  
  RATINGS = {
    'one shrug'     => '1_shrug',
    'two shrugs'    => '2_shrugs',
    'three shrugs'  => '3_shrugs',
    'four shrugs'   => '4_shrugs',
    'five shrugs'   => '5_shrugs'
  }
  
  def humanized_rating
    RATINGS.invert[self.rating]
  end
end