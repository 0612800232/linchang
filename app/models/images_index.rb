class ImagesIndex  < ActiveRecord::Base

validates_presence_of :title,:message => "标题不为空"
validates_presence_of :img,:message => "图片不为空"
validates_presence_of :link,:message => "链接不为空"



	
	

end
