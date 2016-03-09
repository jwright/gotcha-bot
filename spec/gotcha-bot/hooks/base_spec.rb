RSpec.describe GotchaBot::Hooks::Base do
  let(:foo_module) do
    Module.new do
      extend GotchaBot::Hooks::Base
    end
  end

  let(:bar_module) do
    Module.new do
      extend GotchaBot::Hooks::Base
    end
  end

  let(:dummy_class) { Class.new }

  before do
    allow(foo_module).to receive(:name).and_return :Foo
    allow(bar_module).to receive(:name).and_return :Bar
    dummy_class.include(foo_module)
    dummy_class.include(bar_module)
  end

  it "defines a hooks class method" do
    expect(dummy_class).to respond_to :hooks
  end

  it "defines a hooks instance method" do
    expect(dummy_class.new).to respond_to :hooks
  end

  it "installs the hooks when included" do
    expect(dummy_class.hooks).to eq [:foo, :bar]
  end
end
