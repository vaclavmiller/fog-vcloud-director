require 'fog/vcloud_director/parsers/compute/vm_parser_helper'

module Fog
  module Parsers
    module Compute
      module VcloudDirector
        class Vapp < VcloudDirectorParser
          include VmParserHelper

          def reset
            @response = @vapp = {
              :description     => '',
              :owner           => nil,
              :lease_settings  => nil,
              :network_section => nil,
              :network_config  => nil,
              :vms             => []
            }
            @in_sections = false
            @parsing_vm  = false
          end

          def start_element(name, attributes)
            super
            return vm_start_element(name, attributes) if @parsing_vm
            vapp_start_element(name, attributes)
          end

          def end_element(name)
            return vm_end_element(name) if @parsing_vm && name != 'Vm'
            vapp_end_element(name)
          end

          private

          def vapp_start_element(name, attributes)
            case name
            when 'VApp'
              vapp_attrs = extract_attributes(attributes)
              @vapp.merge!(vapp_attrs.reject { |key, _| ![:href, :name, :status, :type, :deployed].include?(key) })
              @vapp[:id] = @vapp[:href].split('/').last
              @vapp[:status] = human_status(@vapp[:status])
              @vapp[:deployed] = @vapp[:deployed] == 'true'
            when 'LeaseSettingsSection' # this is the first of the sections
              @in_sections = true
            when 'User'
              @vapp[:owner] = attr_value('href', attributes).to_s.split('/').last
            when 'Vm'
              @parsing_vm = true
              vm_reset
              vm_start_element(name, attributes)
            end
          end

          def vapp_end_element(name)
            case name
            when 'Description'
              @vapp[:description] = value unless @in_sections
            when 'InMaintenanceMode'
              @vapp[:maintenance] = value == 'true'
            when 'Vm'
              @parsing_vm = false
              @vapp[:vms] << @curr_vm
            end
          end

          #
          # Nested VMs
          #

          def vm_start_element(name, attributes)
            return parse_vm_attributes(attributes, @curr_vm) if name == 'Vm'
            parse_start_element(name, attributes, @curr_vm)
          end

          def vm_end_element(name)
            parse_end_element(name, @curr_vm)
          end

          def vm_reset
            @curr_vm             = initialize_vm
            @in_operating_system = false
            @in_children         = false
            @resource_type       = nil
            @links               = []
          end
        end
      end
    end
  end
end