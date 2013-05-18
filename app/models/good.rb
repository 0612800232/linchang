class Good < ActiveRecord::Base
  belongs_to :goods_type
  validates_presence_of :name,:message => "产品名称不为空"
   validates_presence_of :desc,:message => "产品描述不为空"
  validates_uniqueness_of :name,:message => "产品名称已经被使用"
  validates_presence_of :amount,:message => "产品金额不为空"
  validates_format_of :amount, :with => /^(([1-9](\d{0,12}))|([0]{1}))(\.(\d){1,2})?$/,
    :message => "请输入正确的金额"
end

