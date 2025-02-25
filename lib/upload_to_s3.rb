require 'aws-sdk-s3'

class UploadToS3
  def initialize(region: 'ap-northeast-1', bucket_name: 'myapp3-bucket2')
    @s3 = Aws::S3::Resource.new(region: region)
    @bucket = @s3.bucket(bucket_name)
  end

  def upload_directory(directories)
    directories.each do |dir|
      Dir.glob("public/uploads/#{dir}/**/*").each do |file_path|
        if File.file?(file_path)
          upload_file(file_path, dir)
        end
      end
    end
  end

  private

  def upload_file(file_path, dir)
    file_name = File.basename(file_path)
    s3_object = @bucket.object("#{dir}/#{file_name}")

    # ファイルを開き、S3にアップロード
    File.open(file_path, 'rb') do |file|
      s3_object.put(body: file)

      # 成功メッセージ
      puts "Uploaded #{file_name} from #{dir} to S3!"
    end
  end
end
