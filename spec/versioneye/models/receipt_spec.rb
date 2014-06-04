require 'spec_helper'

describe Receipt do

  describe "save" do

    it 'does not save becaue receipt_nr is missing' do
      ba = create_billing_address
      receipt = described_class.new
      receipt.update_from_billing_address ba
      receipt.invoice_id = 'tx_1'
      receipt.save.should be_false
    end

    it 'does save becaue receipt_nr is there' do
      ba = create_billing_address
      receipt = described_class.new
      receipt.update_from_billing_address ba
      receipt.invoice_id = 'tx_1'
      receipt.receipt_nr = 1
      receipt.save.should be_true
    end

    it 'saves the first one and skips the 2nd because of same receipt_nr' do
      ba = create_billing_address

      receipt = described_class.new

      receipt.update_from_billing_address ba
      receipt.receipt_nr = 1
      receipt.invoice_id = 'tx_1'
      receipt.save.should be_true

      receipt_2 = described_class.new
      receipt_2.update_from_billing_address ba
      receipt_2.receipt_nr = 1
      receipt.invoice_id = 'tx_2'
      receipt_2.save.should be_false
    end

    it 'saves both' do
      ba = create_billing_address

      receipt = described_class.new

      receipt.update_from_billing_address ba
      receipt.receipt_nr = 1
      receipt.invoice_id = 'tx_1'
      receipt.save.should be_true

      receipt_2 = described_class.new
      receipt_2.update_from_billing_address ba
      receipt_2.receipt_nr = 2
      receipt_2.invoice_id = 'tx_2'
      receipt_2.save.should be_true
    end

  end

  describe "update_from_billing_address" do

    it "updates from billing address" do
      ba = create_billing_address

      receipt = described_class.new

      receipt.name.should be_nil
      receipt.street.should be_nil
      receipt.zip.should be_nil
      receipt.city.should be_nil
      receipt.company.should be_nil
      receipt.taxid.should be_nil

      receipt.update_from_billing_address ba

      receipt.name.should eq('Hans Meier')
      receipt.street.should eq('HanseStrasse 112')
      receipt.zip.should eq('12345')
      receipt.city.should eq('Hamburg')
      receipt.country.should eq('DE')
      receipt.company.should eq('HanseComp')
      receipt.taxid.should eq('DE12345')
    end

  end

  def create_billing_address
    BillingAddress.new({:name => 'Hans Meier',
      :street => 'HanseStrasse 112', :zip => '12345',
      :city => 'Hamburg', :country => 'DE', :company => 'HanseComp',
      :taxid => 'DE12345'})
  end

end
