module Entries
  class Analyse
    def self.call(entry:, client: ::AwsClient::Comprehend.new)
      new(client: client).call(entry: entry)
    end

    def initialize(client:)
      @client = client
    end

    def call(entry:)
      ActiveRecord::Base.transaction do
        report = create_report(entry)
        analyse_sentiment(entry, report)
        analyse_keywords(entry, report)
      end
      success_reponse
    rescue ActiveRecord::RecordInvalid
      failed_reponse
    end

    private

    attr_reader :client

    def create_report(entry)
      TextAnalysisReport.create!(
        start_date: entry.created_at,
        end_date: entry.created_at,
        analysable: entry
      )
    end

    def analyse_sentiment(entry, report)
      response = client.analyse_sentiment(entry.text)
      create_sentiment_report(response.value, report) if response.success?
    end

    def create_sentiment_report(data, report)
      SentimentReport.create!(
        text_analysis_report: report,
        sentiment: data.sentiment,
        mixed_score: data.sentiment_score.mixed,
        positive_score: data.sentiment_score.positive,
        neutral_score: data.sentiment_score.neutral,
        negative_score: data.sentiment_score.negative
      )
    end

    def analyse_keywords(entry, report)
      response = client.analyse_keywords(entry.text)
      create_keywords_report(response.value, report) if response.success?
    end

    def create_keywords_report(data, report)
      KeywordsReport.create!(
        text_analysis_report: report,
        keywords: data.key_phrases.map(&:text)
      )
    end

    def success_reponse
      OpenStruct.new(success?: true)
    end

    def failed_reponse
      OpenStruct.new(success?: false)
    end
  end
end
