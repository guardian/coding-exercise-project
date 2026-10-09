RSpec.describe PairingTest do
  it "returnsFalse returns false" do
    expect(PairingTest::Main.new.returnsFalse).to eq(false)
  end
end
