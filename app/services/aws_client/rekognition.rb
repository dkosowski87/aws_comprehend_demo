module AwsClient
  class Rekognition
    def initialize(client: Aws::Rekognition::Client.new)
      @client = client
    end

    def recognize_faces(file_name:, bucket: ENV['AWS_S3_BUCKET'])
      response = client.detect_faces(
        image: {
          s3_object: {
            bucket: bucket,
            name: file_name
          }
        },
        attributes: ['ALL']
      )

      success_reponse(response)
    end

    private

    attr_reader :client

    def success_reponse(value)
      OpenStruct.new(success?: true, value: value)
    end
  end
end
