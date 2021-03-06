# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # 包含RMagick和MiniMagick支持:
  # 包含CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # 选择上传存储类型
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :large do
    process :resize_to_fill => [200,200]
  end

  version :thumb do
    process :resize_to_fill => [100,100]
  end

  version :small, :from_version => :thumb do
    process resize_to_fill: [50, 50]
  end

  def default_url
    #设置默认用户头像
    "missing.jpg"
  end

end
