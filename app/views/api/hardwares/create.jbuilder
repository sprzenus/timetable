# frozen_string_literal: true

json.id @hardware.id
json.type @hardware.type
json.manufacturer @hardware.manufacturer
json.model @hardware.model
json.serial_number @hardware.serial_number
json.user_name @hardware.user.name if current_user.admin? || current_user.hardware_manager?
