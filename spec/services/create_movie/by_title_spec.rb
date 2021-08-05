require 'rails_helper'

RSpec.describe CreateMovie::ByTitle do
  describe '#call' do
    subject { described_class.new(title: title).call }

    context 'when a movie exists' do
      let(:title) { "Mary Poppins" }

      it 'returns the movie hash' do
        expect(subject.size).to eq(23)
      end
    end
  end
end
