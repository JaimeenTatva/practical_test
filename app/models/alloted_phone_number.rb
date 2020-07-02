class AllotedPhoneNumber < ApplicationRecord
    validates :alloted_number, presence: true
    # validates_format_of :alloted_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"

    # def self.get_random_phone_number
    #     rand(1111111111..9999999999)
    # end
end
