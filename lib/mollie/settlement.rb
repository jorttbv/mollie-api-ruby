module Mollie
  class Settlement < Base
    attr_accessor :id,
                  :reference,
                  :created_at,
                  :settled_at,
                  :status,
                  :amount,
                  :periods,
                  :_links

    alias_method :links, :_links

    def self.open(options = {})
      get("open", options)
    end

    def self.next(options = {})
      get("next", options)
    end

    def created_at=(created_at)
      @created_at = Time.parse(created_at.to_s) rescue nil
    end

    def settled_at=(settled_at)
      @settled_at = Time.parse(settled_at.to_s) rescue nil
    end

    def amount=(amount)
      @amount = Mollie::Amount.new(amount)
    end

    def periods=(periods)
      @periods = Util.nested_openstruct(periods) if periods.is_a?(Hash)
    end

    def payments
      Util.extract_url(links, 'payments')
    end

    def refunds
      Util.extract_url(links, 'refunds')
    end

    def chargebacks
      Util.extract_url(links, 'chargebacks')
    end
  end
end
