# frozen_string_literal: true

require 'pry'
require 'mechanize'

RSpec.describe Mechanize do
  describe 'Version' do
    it 'responds' do
      expect(Mechanize::VERSION).to eq '2.8.3'
    end
  end

  describe 'GET generic URL' do
    agent = Mechanize.new
    response = agent.get('https://github.com/sparklemotion/mechanize')

    it 'returns page contents' do
      expect(response.title).to eq 'GitHub - sparklemotion/mechanize: Mechanize is a ruby library that makes automated web interaction easy.'
    end
  end

  describe 'GET https://engineerteam.note.jp/' do
    context 'when simple mechanize' do
      agent = Mechanize.new

      it 'raises error' do
        expect { agent.get('https://engineerteam.note.jp') }.to raise_error(Mechanize::RedirectLimitReachedError)
      end
    end

    context 'when User-Agent is set' do
      agent = Mechanize.new { |a| a.user_agent = 'My User Agent' }
      response = agent.get('https://engineerteam.note.jp')

      it 'returns page contents' do
        expect(response.title).to eq 'note社エンジニアの開発note'
      end
    end
  end
end
