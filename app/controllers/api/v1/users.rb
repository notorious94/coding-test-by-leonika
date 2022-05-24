# frozen_string_literal: true

module Api
  module V1
    class Users < Grape::API
      resource :users do
        desc 'Create a passenger'

        params do
          requires :name, type: String
          requires :gender, type: Integer
          requires :email, type: String
        end

        post :create do
          user = User.new(name: params[:name],
                          gender: params[:gender],
                          email: params[:email])
          if user.save
            render json: { results: {message: 'Passenger created successfully.'} }.to_json, status: :ok
          else
            render json: { results: {message: user.errors.full_messages.join(',') } }.to_json, status: :ok
          end
        end

        desc 'return data of passengers onboarded in a particular day'
        params do
          requires :gender, type: Integer, default: 0
          requires :date, type: Date
          requires :page_no, type: Integer
        end
        get :per_day_passenger_count do
          total_passengers = User.where(created_at: params[:date],
                                        gender: params[:gender])
                                 .paginate(page: params[:page_no])

          render json: { results: total_passengers }.to_json, status: :ok
        end

        desc 'return data of passengers onboarded in a particular time'
        params do
          requires :gender, type: Integer, default: 0
          requires :date_time, type: DateTime
          requires :page_no, type: Integer
        end
        get :passenger_count_on_time do
          total_passengers = User.where(created_at: params[:date_time],
                                        gender: params[:gender])
                                 .paginate(page: params[:page_no])

          total_passengers

          render json: { results: total_passengers }.to_json, status: :ok
        end

      end
    end
  end
end
