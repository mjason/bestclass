class Handout
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  mount_uploader :accessory, HandoutUploader

  belongs_to :course


  field :accessory_pdf, type: String
  field :accessory_swf, type: String

  

  def pdf
    accessory_pdf
  end

  def swf
    accessory_swf
  end

  def to_pdf
    tmp_path = "#{Rails.root}/file/pdf/#{self.class.to_s.underscore}/#{title}.pdf"
    rt = `python /opt/pyodconverter/DocumentConverter.py #{accessory.path} #{tmp_path}`
    if rt == ""
      self.accessory_pdf = tmp_path
    else
      rt
    end
  end

  def to_swf
    tmp_path = "#{Rails.root}/file/swf/#{self.class.to_s.underscore}/#{title}.swf"
    `mkdir -p #{Rails.root}/file/swf/#{self.class.to_s.underscore}`
    rt = `pdf2swf #{ self.accessory_pdf } -o #{ tmp_path } -f -T 9 -t -s storeallcharacters`
    self.accessory_swf = tmp_path
    puts rt
    if self.accessory_swf != nil
      "is ok"
    else
      "is not ok"
    end
  end

end
