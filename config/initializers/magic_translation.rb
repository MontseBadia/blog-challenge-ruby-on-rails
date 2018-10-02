module MagicTranslation
  def self.apply
    # api_credentials = Rails.application.credentials[:development][:translator][:access_key]
    api_credentials = Rails.application.credentials.dig(:development, :translator, :access_key)
    translator ||= Yandex::Translator.new(api_credentials)
  end
end