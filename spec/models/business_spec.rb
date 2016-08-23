require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:business) { create(:business) }

  
  describe "#compare" do

    context "when the attributes in the API have changed" do

      it "should return true if all the values are equal" do

        other_business_attrs = create(:business).attributes

        expect(business.compare(other_business_attrs)).to eq(true)

      end 

    end

  end

end
