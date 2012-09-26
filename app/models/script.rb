class Script < ActiveRecord::Base
  attr_accessible :e_content, :script_number, :v_content

  scope :not_translate, where(:v_content => "") 
end
