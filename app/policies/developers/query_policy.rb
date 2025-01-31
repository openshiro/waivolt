module Developers
  class QueryPolicy < ApplicationPolicy
    def permitted_attributes
      if user&.permissions&.active_subscription?
        default_attributes + paywalled_attributes
      else
        default_attributes
      end
    end

    private

    def default_attributes
      [
        :page,
        :include_not_interested,
        :sort,
        role_levels: [],
        role_types: [],
        badges: [],
        utc_offsets: [],
        states: [],
        specialty_ids: []
      ]
    end

    def paywalled_attributes
      [
        :search_query\
      ]
    end
  end
end
