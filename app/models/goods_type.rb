class GoodsType < ActiveRecord::Base
  has_many :goods , :dependent => :destroy,:order=>"id desc"
  validates_presence_of :name,:message => "种类名称不为空"
validates_uniqueness_of :name,:message => "种类名称已经被使用"
end
