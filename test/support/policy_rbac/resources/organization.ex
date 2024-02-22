defmodule Ash.Test.Support.PolicyRbac.Organization do
  @moduledoc false
  use Ash.Resource,
    api: Ash.Test.Support.PolicyRbac.Api,
    data_layer: Ash.DataLayer.Ets

  ets do
    private?(true)
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key(:id)
  end

  relationships do
    has_many :memberships, Ash.Test.Support.PolicyRbac.Membership do
      destination_attribute(:organization_id)
    end

    has_many :files, Ash.Test.Support.PolicyRbac.File
  end
end
