class User < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract do
      property :email
      property :password

      validates :email, length: { in: 6..30 }
      validates :password, length: { in: 6..30 }
    end

    def process(params)
      validate(params[:user], &:save)
    end
  end
end
