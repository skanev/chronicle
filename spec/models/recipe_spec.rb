require 'rails_helper'

describe Recipe do
  describe '(extracting source domain)' do
    it 'can extract the domain from the source url' do
      build(:recipe, source_url: 'http://example.com/recipe').source_domain.should eq 'example.com'
    end

    it 'returns nil if the source url is nil' do
      build(:recipe, source_url: nil).source_domain.should eq nil
    end

    it 'stripts www. from the domain name' do
      build(:recipe, source_url: 'http://www.example.com/recipe').source_domain.should eq 'example.com'
    end
  end
end
