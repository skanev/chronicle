require 'rails_helper'

describe Recipe do
  describe '(extracting source domain)' do
    def extract_domain(source_url)
      build(:recipe, source_url:).source_domain
    end

    it 'can extract the domain from the source url' do
      extract_domain('http://example.com/recipe').should eq 'example.com'
    end

    it 'returns nil if the source url is nil' do
      extract_domain(nil).should eq nil
    end

    it 'strips www. from the domain name' do
      extract_domain('http://www.example.com/recipe').should eq 'example.com'
    end

    it 'returns nil when the URL is invalid' do
      extract_domain('badly/formed/domain/').should eq nil
      extract_domain('💥').should eq nil
    end
  end
end
