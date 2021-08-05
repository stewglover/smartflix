require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject {instance_double(CreateMovie.new)}
end
