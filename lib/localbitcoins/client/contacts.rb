module LocalBitcoins
  module Contacts
    # Contact interaction endpoints
    # contact_id - id number associated with the contact

    def mark_contact_as_paid(contact_id)
      request(:post, "/api/contact_mark_as_paid/#{contact_id}/")
    end

    def messages_from_contact(contact_id)
      request(:get, "/api/contact_messages/#{contact_id}/").data
    end

    def message_contact(contact_id, msg)
      request(:post, "/api/contact_message_post/#{contact_id}/", {:msg=>msg}).data
    end

    def release_contact(contact_id)
      request(:post, "/api/contact_release/#{contact_id}/").data
    end

    def dispute_contact(contact_id)
      request(:post, "/api/contact_dispute/#{contact_id}/")
    end

    def cancel_contact(contact_id)
      request(:post, "/api/contact_cancel/#{contact_id}/").data
    end

    def fund_contact(contact_id)
      request(:post, "/api/contact_fund/#{contact_id}/")
    end

    def create_contact(ad_id, amount, message=nil)
      request(:post, "/api/contact_create/#{ad_id}/", {:amount=>amount, :message=>message})
    end

    def contact_info(contact_id)
      request(:get, "/api/contact_info/#{contact_id}/")
    end

    # contacts - comma separated list of contact ids [string]
    def contacts_info(contacts)
      request(:get, '/api/contact_info/', {:contacts=>contacts}).data
    end

    # Dashboard contact endpoints
    # contact_type - optional filter 'buyer' or 'seller' [string]
    #
    def active_contacts(contact_type = nil)
      contact_type<<'/' unless contact_type.nil?
      request(:get, "/api/dashboard/#{contact_type}").data
    end

    def released_contacts(contact_type = nil)
      contact_type<<'/' unless contact_type.nil?
      request(:get, "/api/dashboard/released/#{contact_type}").data
    end

    def canceled_contacts(contact_type = nil)
      contact_type<<'/' unless contact_type.nil?
      request(:get, "/api/dashboard/canceled/#{contact_type}").data
    end

    def closed_contacts(contact_type = nil)
      contact_type<<'/' unless contact_type.nil?
      request(:get, "/api/dashboard/closed/#{contact_type}").data
    end
  end
end