RSpec.describe PairingTest do
  it "the passes instance method returns true" do
    expect(PairingTest::Main.new.returnsFalse).to eq(false)
  end
end
