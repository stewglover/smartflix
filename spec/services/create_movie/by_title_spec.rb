require 'rails_helper'

RSpec.describe ByTitle do
  subject { described_class.new(title:title) }

  context 'when a movie exists' do
    let(:title) { "Mary Poppins" }


  end
end
