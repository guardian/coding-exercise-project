RSpec.describe PairingTest do
  it "the passes instance method returns true" do
    expect(PairingTest::Main.new.passes).to eq(true)
  end
end
