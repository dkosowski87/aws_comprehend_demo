module AwsClient
  class Comprehend
    DEFAULT_LANGUAGE = 'en'.freeze

    def initialize(client: Aws::Comprehend::Client.new)
      @client = client
    end

    def analyse_sentiment(text)
      response = client.detect_sentiment(
        text: text,
        language_code: DEFAULT_LANGUAGE,
      )
      success_reponse(response)
    end

    def analyse_keywords(text)
      response = client.detect_key_phrases(
        text: text,
        language_code: DEFAULT_LANGUAGE,
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
