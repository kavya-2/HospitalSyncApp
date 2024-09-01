module Api
  module V1
    class SyncController < ApplicationController
      before_action :authenticate_doctor!

      def create
        patient_data = params[:patients]
        sync_results = []

        patient_data.each do |data|
          patient = Patient.find_or_initialize_by(id: data[:id])
          if patient.new_record? || patient.updated_at < data[:updated_at]
            if patient.update(data.permit(:name, :medical_history))
              log_sync(patient, 'synced')
              sync_results << { patient_id: patient.id, status: 'synced' }
            else
              sync_results << { patient_id: patient.id, status: 'error', errors: patient.errors.full_messages }
            end
          else
            log_sync(patient, 'conflict')
            sync_results << { patient_id: patient.id, status: 'conflict' }
          end
        end

        render json: sync_results, status: :ok
      end

      private

      def log_sync(patient, status)
        SyncLog.create(doctor: current_doctor, patient: patient, last_sync_time: Time.now, sync_status: status)
      end
    end
  end
end
