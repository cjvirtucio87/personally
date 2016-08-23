require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:business) { create(:business) }

  
  describe "#compare" do

    context "when the data in the API has not changed" do

      it "should return true" do

        other_business_attrs = create(:business).attributes

        expect(business.compare(other_business_attrs)).to eq(true)

      end 

    end

    context "when the attributes in the API has changed" do

      it "should return false" do

        other_business_attrs = create(:business,:changed_attrs).attributes

        expect(business.compare(other_business_attrs)).to eq(false)

      end

    end

  end

end
