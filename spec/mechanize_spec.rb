require 'mechanize'

RSpec.describe Mechanize do
  describe '2.8.3' do
    it 'responds' do
      expect(Mechanize::VERSION).to eq '2.8.3'
    end
  end
end
