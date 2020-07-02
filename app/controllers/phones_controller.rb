class PhonesController < ApplicationController
    def index
        begin
            @phones = AllotedPhoneNumber.all
            render json: { success: true, message: "The following phone number are allocated.", phones: @phones.pluck(:alloted_number)}, status: 200
        rescue => exception
            render json: { success: false, errors: exception.message }, status: 400
        end
    end

    def create
        random_phone_number = AllotedPhoneNumber.get_random_phone_number

        record = AllotedPhoneNumber.create({alloted_number: random_phone_number})
        render json: { success: true, message: "The following phone number is allocated.", phone: record.alloted_number }, status: 200
    end

    def specific_number
        phone_number = params[:phone]
        if phone_number.present?
            existing_number = AllotedPhoneNumber.where(alloted_number: phone_number)

            if existing_number.present?
                begin
                    random_phone_number = rand(1111111111..9999999999)
                    existing_number = AllotedPhoneNumber.where(alloted_number: random_phone_number)
                end while existing_number.present?

                record = AllotedPhoneNumber.create({alloted_number: random_phone_number})
                render json: { success: true, message: "The number you requested is already allocated. So the following random number is allocated to you.", phone: record.alloted_number }, status: 200
            else
                record = AllotedPhoneNumber.new({alloted_number: phone_number})
                if record.save
                    render json: { success: true, message: "The following phone number is allocated.", phone: record.alloted_number }, status: 200
                else
                    render json: { success: false, errors: record.errors }, status: 400
                end
            end
        else
            render json: { success: false, errors: "Please provide a number." }, status: 400
        end
    end
end
