class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email
  
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
  
  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end