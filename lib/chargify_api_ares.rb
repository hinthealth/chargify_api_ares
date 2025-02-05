require 'active_resource'
require 'chargify_api_ares/config'
require 'chargify_api_ares/behaviors/inspectable'
require 'chargify_api_ares/behaviors/metadata'
require 'chargify_api_ares/behaviors/metafield'
require 'chargify_api_ares/collections/base_collection'
require 'chargify_api_ares/collections/invoice_collection'
require 'chargify_api_ares/collections/component_price_point_collection'
require 'chargify_api_ares/response_helper'
require 'chargify_api_ares/resources/base'
require 'chargify_api_ares/resources/charge'
require 'chargify_api_ares/resources/component'
require 'chargify_api_ares/resources/component_price_point'
require 'chargify_api_ares/resources/coupon'
require 'chargify_api_ares/resources/customer_metadata'
require 'chargify_api_ares/resources/customer'
require 'chargify_api_ares/resources/event'
require 'chargify_api_ares/resources/management_link'
require 'chargify_api_ares/resources/migration'
require 'chargify_api_ares/resources/payment'
require 'chargify_api_ares/resources/payment_profile'
require 'chargify_api_ares/resources/product'
require 'chargify_api_ares/resources/product_family'
require 'chargify_api_ares/resources/reason_code'
require 'chargify_api_ares/resources/renewal_preview'
require 'chargify_api_ares/resources/site'
require 'chargify_api_ares/resources/statement'
require 'chargify_api_ares/resources/subscription_metadata'
require 'chargify_api_ares/resources/subscription'
require 'chargify_api_ares/resources/transaction'
require 'chargify_api_ares/resources/usage'
require 'chargify_api_ares/resources/webhook'
require 'chargify_api_ares/resources/invoice'
require 'chargify_api_ares/resources/invoice_payment'
require 'chargify_api_ares/resources/customer_metafield'
require 'chargify_api_ares/resources/subscription_metafield'
require 'chargify_api_ares/resources/allocation'

require 'active_resource/version'
if defined?(::ActiveResource::VERSION::MAJOR) &&
  ::ActiveResource::VERSION::MAJOR == 3 &&
  ::ActiveResource::VERSION::MINOR == 0 &&
  ::ActiveResource::VERSION::TINY < 20
  require 'patches/activemodel_3_0_patch.rb'
end
