require 'rubygems'
require 'yaml'
require 'authorizenet' 
require 'securerandom'

  include AuthorizeNet::API

  def get_an_accept_payment_page(api_login_id,api_transaction_key,customerId=nil,iframeCommunicatorUrl)
    config = YAML.load_file(File.dirname(__FILE__) + "/../credentials.yml")

    # transaction = Transaction.new(config['api_login_id'], config['api_transaction_key'], :gateway => :sandbox)

    transaction = Transaction.new(api_login_id, api_transaction_key, :gateway => :sandbox)

    custProfile = CustomerProfilePaymentType.new
    custProfile.customerProfileId = customerId

    transactionRequest = TransactionRequestType.new
    transactionRequest.amount = 99
    transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    transactionRequest.profile = custProfile

    
    
    setting1 = SettingType.new
    setting1.settingName = SettingNameEnum::HostedPaymentButtonOptions
    setting1.settingValue = "{\"text\": \"Pay\"}"

    setting2 = SettingType.new
    setting2.settingName = SettingNameEnum::HostedPaymentOrderOptions
    setting2.settingValue = "{\"show\": false}"

    setting4 = SettingType.new
    setting4.settingName = SettingNameEnum::HostedPaymentBillingAddressOptions
    setting4.settingValue = "{\"show\": false}"

    setting3 = SettingType.new
    setting3.settingName = SettingNameEnum::HostedPaymentIFrameCommunicatorUrl
    setting3.settingValue = "{\"url\": \"#{iframeCommunicatorUrl}\"}"

    setting5 = SettingType.new
    setting5.settingName = SettingNameEnum::HostedPaymentReturnOptions
    setting5.settingValue = "{\"showReceipt\": false,\"url\": \"#{iframeCommunicatorUrl}\",\"urlText\":\"Continue\",\"cancelUrlText\":\"Cancel\"}"

    

     
    settings = Settings.new([ setting1, setting2,setting3,setting4,setting5])

    request = GetHostedPaymentPageRequest.new
    request.transactionRequest = transactionRequest
    request.hostedPaymentSettings = settings
    
    response = transaction.get_hosted_payment_page(request)
    
    # if response.messages.resultCode == MessageTypeEnum::Ok
    #   puts "#{response.messages.messages[0].code}"
    #   puts "#{response.messages.messages[0].text}"
    #   puts "#{response.token}"
    # else
    #   puts "#{response.messages.messages[0].code}"
    #   puts "#{response.messages.messages[0].text}"
    #   raise "Failed to get hosted payment page"
    # end
    return response
  end
  
if __FILE__ == $0
  get_an_accept_payment_page()
end
