RSpec.describe "running the provided command" do
  let(:session) { JetBlack::Session.new }

  it "summarises how many iterations were run and the exit status" do
    result = session.run("insanity -i 5 'exit 0'")

    expect(result).to be_a_success
    expect(result.stdout).to eq <<~OUT
      .....

      5 iterations complete.

      Status 0\t| 5 times
    OUT
  end

  context "with a failing command" do
    it "shows the non-zero exit status" do
      result = session.run("insanity -i 5 'exit 2'")

      expect(result).to be_a_success
      expect(result.stdout).to eq <<~OUT
        .....

        5 iterations complete.

        Status 2\t| 5 times
      OUT
    end
  end
end
