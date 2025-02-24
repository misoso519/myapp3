require 'aws-sdk-s3'

s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')

# バケット名を指定（事前に作成したS3バケット名を設定）
bucket = s3.bucket('myapp3-bucket2')  # バケット名を設定

# アップロードするディレクトリを指定
directories = ['answer', 'question', 'tmp']

directories.each do |dir|
  Dir.glob("public/uploads/#{dir}/**/*").each do |file_path|
    if File.file?(file_path)
      file = File.open(file_path, 'rb')
      file_name = File.basename(file_path)
      s3_object = bucket.object("#{dir}/#{file_name}")

      # ファイルをS3にアップロード
      s3_object.put(body: file)

      # 成功メッセージ
      puts "Uploaded #{file_name} from #{dir} to S3!"

      # ファイルを閉じる
      file.close
    end
  end
end
