# -*- coding: utf-8 -*-
class Emerge < ActiveRecord::Base
  belongs_to :package
  belongs_to :user
  has_many :comments, :as => :commentable

  def fullname
    self.package.fullname
  end
  def page
    "/emerges/" + self.id.to_s
  end

  def pretty_duration
    dur = self.duration
    days = dur.divmod(24*60*60)
    hours = days[1].divmod(60*60)
    mins = hours[1].divmod(60)
    
    if days[0] > 0
      days[0].to_s + "日" + hours[0].to_s + "時間" + mins[0].to_s + "分"
    elsif hours[0] > 0
      hours[0].to_s + "時間" + mins[0].to_s + "分"
    elsif mins[0] > 0
      mins[0].to_s + "分" + mins[1].to_s + "秒"
    else
      mins[1].to_s + "秒"
    end      
  end
end
