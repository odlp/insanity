RSpec.describe "saving the output to a folder" do
  let(:session) { JetBlack::Session.new }

  it "creates a file per iteration" do
    session.run("insanity -i 2 'echo Hi' -o ./output")

    expect(ls("./output")).to match_array ["i0-exit0.txt", "i1-exit0.txt"]
  end

  it "saves the output for each iteration" do
    session.run("insanity -i 2 \"echo 'Hi'\" -o ./output")

    expect(session.run("cat ./output/i0-exit0.txt")).to have_stdout "Hi"
  end

  context "with a failing command" do
    it "includes the exit status in the filename" do
      session.run("insanity -i 2 'exit 66' -o ./output")

      expect(ls("./output")).to match_array ["i0-exit66.txt", "i1-exit66.txt"]
    end
  end

  private

  def ls(path)
    session.run("ls #{path}").stdout.split("\n")
  end
end
