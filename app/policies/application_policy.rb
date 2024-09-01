class PatientPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  def edit?
    user.present?
  end
end