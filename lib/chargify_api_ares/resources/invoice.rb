module Chargify
  class Invoice < Base
    self.collection_parser = ::InvoiceCollection

    def self.find_by_invoice_id(id)
      find(:first, { params: { id: } })
    end

    def self.find_by_subscription_id(subscription_id, extra_params = {})
      find(:all, { params: { subscription_id: }.merge(extra_params) })
    end

    def self.find_by_customer_id(customer_id, extra_params = {})
      find(:all, { params: { customer_ids: customer_id }.merge(extra_params) })
    end

    def self.find_by_subscription_and_date_period(subscription_id, start_date, end_date, extra_params = {})
      find(
        :all,
        { params: { subscription_id:, start_date:, end_date:, date_field: 'issue_date' }.merge(extra_params) },
      )
    end

    def self.find_by_customer_and_date_period(customer_id, start_date, end_date, extra_params = {})
      find(
        :all,
        { params: { customer_ids: customer_id, start_date:, end_date:, date_field: 'issue_date' }.merge(extra_params) },
      )
    end

    def self.unpaid_from_subscription(subscription_id)
      status_from_subscription(subscription_id, "unpaid")
    end

    def self.status_from_subscription(subscription_id, status)
      find(:all, { params: { subscription_id:, status: } })
    end

    def self.unpaid
      find_by_status("unpaid")
    end

    def self.find_by_status(status)
      find(:all, { params: { status: } })
    end

    # Returns raw PDF data. Usage example:
    # File.open(file_path, 'wb+'){ |f| f.write Chargify::Invoice.find_pdf(invoice.id) }
    def self.find_pdf(scope, options = {})
      prefix_options, query_options = split_options(options[:params])
      path = element_path(scope, prefix_options, query_options).gsub(/\.\w+$/, ".pdf")
      connection.get(path, headers).body
    end
  end
end
