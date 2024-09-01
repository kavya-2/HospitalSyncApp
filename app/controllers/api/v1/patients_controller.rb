module Api
  module V1
    class PatientsController < ApplicationController
      before_action :authenticate_doctor!

      def index
        @patients = Patient
              .joins(:sync_logs)
              .where(sync_logs: { doctor_id: 1, sync_status: 'completed' })
              .distinct
        render json: @patients
      end

      def update
        @patient = Patient.find(params[:id])
        if @patient.update(patient_params)
          log_sync(@patient, 'synced')
          render json: @patient
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
      end

      private

      def patient_params
        params.require(:patient).permit(:name, :medical_history)
      end

      def log_sync(patient, status)
        SyncLog.create(doctor: current_doctor, patient: patient, last_sync_time: Time.now, sync_status: status)
      end
    end
  end
end
