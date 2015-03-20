class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  #after_create :send_admin_mail

  #def active_for_authentication?
  #  super && approved?
  #end

  #def inactive_message
  #  if !approved?
  #    :not_approved
  #  else
  #    super :admin_approved
  #  end
  #end

  #def self.send_reset_password_instructions(attributes={})
  #  recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
  #  if !recoverable.approved?
  #    recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
  #  elsif recoverable.persisted?
  #    recoverable.send_reset_password_instructions
  #  end
  #  recoverable
  #end

  #def send_admin_mail
  #  AdminMailer.new_user_waiting_for_approval(self).deliver
  #end
end
