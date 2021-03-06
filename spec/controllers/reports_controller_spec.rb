require 'spec_helper'

module Plutus
  describe ReportsController do
    routes { Plutus::Engine.routes }

    def mock_entry(stubs={})
      @mock_entry ||= FactoryGirl.create(:entry_with_credit_and_debit)
    end

    describe "GET balance_sheet" do
      it "renders when one entry exists" do
        Entry.stub_chain(:order).and_return([mock_entry])
        get :balance_sheet
        response.should be_success
      end
      it "renders when no entries exist" do
        Entry.stub_chain(:order).and_return([])
        get :balance_sheet
        response.should be_success
      end
    end
  end
end
