class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_lockup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_d8a32b32a82843b09d52fd5fb31c753d',
      secret_token: 'Tsk_95064763378f44b79196f4bc1a922e56',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end
  
end
