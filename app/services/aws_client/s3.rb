module AwsClient
  class S3
    ACL = 'public-read'.freeze

    def initialize(resource: Aws::S3::Resource.new)
      @s3_resource = resource
    end

    def upload_image(file_name:, file_path:, bucket_name: ENV['AWS_S3_BUCKET'])
      obj = s3_resource.bucket(bucket_name).object(file_name)
      obj.upload_file(file_path, { acl: ACL })
      obj.public_url
    end

    private

    attr_reader :s3_resource
  end
end
