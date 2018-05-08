require './spec/spec_helper.rb'

describe Fog::Compute::VcloudDirector::Real do
  describe 'Requests exist' do
    let(:service) do
      response =  Object.new
      response.stubs(:body).returns(
        {
          :Link          => {},
          :Configuration => {
            :EdgeGatewayServiceConfiguration => {},
            :IpScopes                        => {}
          }
        })
      connection = Object.new
      connection.stubs(:request).returns(response)
      service = Fog::Compute::VcloudDirector::Real.new
      service.instance_variable_set(:@connection, connection)
      service.stubs(:request).returns(response)
      service.stubs(:ensure_list!).returns(true)
      service
    end

    [
      { :req => :delete_catalog_item, :args => %w(id) },
      { :req => :delete_catalog_item_metadata_item_metadata, :args => %w(id key) },
      { :req => :delete_disk, :args => %w(id) },
      { :req => :delete_disk_metadata_item_metadata, :args => %w(id key) },
      { :req => :delete_logout, :args => %w() },
      { :req => :delete_media, :args => %w(id) },
      { :req => :delete_media_metadata_item_metadata, :args => %w(id key) },
      { :req => :delete_network, :args => %w(id) },
      { :req => :delete_shadow_vm, :args => %w(id) },
      { :req => :delete_vapp, :args => %w(id) },
      { :req => :delete_vapp_metadata_item_metadata, :args => %w(id key) },
      { :req => :delete_vapp_template, :args => %w(id) },
      { :req => :delete_vapp_template_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_allocated_ip_addresses, :args => %w(id) },
      { :req => :get_catalog, :args => %w(id) },
      { :req => :get_catalog_item, :args => %w(id) },
      { :req => :get_catalog_item_metadata, :args => %w(id) },
      { :req => :get_catalog_item_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_catalog_metadata, :args => %w(id) },
      { :req => :get_catalog_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_catalogs_from_query, :args => %w() },
      { :req => :get_control_access_params_catalog, :args => %w(id, id) },
      { :req => :get_control_access_params_vapp, :args => %w(id) },
      { :req => :get_cpu_rasd_item, :args => %w(id) },
      { :req => :get_current_session, :args => %w() },
      { :req => :get_disk, :args => %w(id) },
      { :req => :get_disk_metadata, :args => %w(id) },
      { :req => :get_disk_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_disk_owner, :args => %w(id) },
      { :req => :get_disks_from_query, :args => %w() },
      { :req => :get_disks_rasd_items_list, :args => %w(id) },
      { :req => :get_edge_gateway, :args => %w(id) },
      { :req => :get_entity, :args => %w(id) },
      { :req => :get_execute_query, :args => %w() },
      { :req => :get_groups_from_query, :args => %w() },
      { :req => :get_guest_customization_system_section_vapp, :args => %w(id) },
      { :req => :get_guest_customization_system_section_vapp_template, :args => %w(id) },
      { :req => :get_href, :args => %w(href) },
      { :req => :get_lease_settings_section_vapp, :args => %w(id) },
      { :req => :get_lease_settings_section_vapp_template, :args => %w(id) },
      { :req => :get_media, :args => %w(id) },
      { :req => :get_media_drives_rasd_items_list, :args => %w(id) },
      { :req => :get_media_metadata, :args => %w(id) },
      { :req => :get_media_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_media_owner, :args => %w(id) },
      { :req => :get_medias_from_query, :args => %w() },
      { :req => :get_memory_rasd_item, :args => %w(id) },
      { :req => :get_metadata, :args => %w(id) },
      { :req => :get_network, :args => %w(id) },
      { :req => :get_network_cards_items_list, :args => %w(id) },
      { :req => :get_network_complete, :args => %w(id) },
      { :req => :get_network_config_section_vapp, :args => %w(id) },
      { :req => :get_network_config_section_vapp_template, :args => %w(id) },
      { :req => :get_network_connection_system_section_vapp, :args => %w(id) },
      { :req => :get_network_connection_system_section_vapp_template, :args => %w(id) },
      { :req => :get_network_metadata, :args => %w(id) },
      { :req => :get_network_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_network_section_vapp, :args => %w(id) },
      { :req => :get_network_section_vapp_template, :args => %w(id) },
      { :req => :get_operating_system_section, :args => %w(id) },
      { :req => :get_org_settings, :args => %w(id) },
      { :req => :get_org_vdc_gateways, :args => %w(id) },
      { :req => :get_organization, :args => %w(id) },
      { :req => :get_organization_metadata, :args => %w(id) },
      { :req => :get_organization_metadata_item_metadata, :args => %w(id domain key) },
      { :req => :get_organizations, :args => %w() },
      { :req => :get_organizations_from_query, :args => %w() },
      { :req => :get_product_sections_vapp, :args => %w(id) },
      { :req => :get_product_sections_vapp_template, :args => %w(id) },
      { :req => :get_request, :args => %w(url) },
      { :req => :get_runtime_info_section_type, :args => %w(id) },
      { :req => :get_serial_ports_items_list, :args => %w(id) },
      { :req => :get_shadow_vm, :args => %w(id) },
      { :req => :get_snapshot_section, :args => %w(id) },
      { :req => :get_startup_section, :args => %w(id) },
      { :req => :get_supported_systems_info, :args => %w() },
      { :req => :get_supported_versions, :args => %w() },
      { :req => :get_task, :args => %w(id) },
      { :req => :get_task_list, :args => %w(id) },
      { :req => :get_template_vm, :args => %w(id) },
      { :req => :get_template_vms, :args => %w(id) },
      { :req => :get_thumbnail, :args => %w(id) },
      { :req => :get_users_from_query, :args => %w() },
      { :req => :get_vapp, :args => %w(id) },
      { :req => :get_vapp_metadata, :args => %w(id) },
      { :req => :get_vapp_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_vapp_ovf_descriptor, :args => %w(id) },
      { :req => :get_vapp_owner, :args => %w(id) },
      { :req => :get_vapp_template, :args => %w(id) },
      { :req => :get_vapp_template_customization_system_section, :args => %w(id) },
      { :req => :get_vapp_template_metadata, :args => %w(id) },
      { :req => :get_vapp_template_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_vapp_template_ovf_descriptor, :args => %w(id) },
      { :req => :get_vapp_template_owner, :args => %w(id) },
      { :req => :get_vapp_templates_from_query, :args => %w() },
      { :req => :get_vapps_in_lease_from_query, :args => %w() },
      { :req => :get_vcloud, :args => %w() },
      { :req => :get_vdc, :args => %w(id) },
      { :req => :get_vdc_metadata, :args => %w(id) },
      { :req => :get_vdc_metadata_item_metadata, :args => %w(id domain key) },
      { :req => :get_vdc_storage_class, :args => %w(id) },
      { :req => :get_vdc_storage_class_metadata, :args => %w(id) },
      { :req => :get_vdc_storage_class_metadata_item_metadata, :args => %w(id key) },
      { :req => :get_vdcs_from_query, :args => %w() },
      { :req => :get_virtual_hardware_section, :args => %w(id) },
      { :req => :get_vm, :args => %w(id) },
      { :req => :get_vm_capabilities, :args => %w(id) },
      { :req => :get_vm_compliance_results, :args => %w(id) },
      { :req => :get_vm_customization, :args => %w(id) },
      { :req => :get_vm_disks, :args => %w(id) },
      { :req => :get_vm_network, :args => %w(id) },
      { :req => :get_vm_pending_question, :args => %w(id) },
      { :req => :get_vms, :args => %w(id) },
      { :req => :get_vms_by_metadata, :args => %w(key value) },
      { :req => :get_vms_disk_attached_to, :args => %w(id) },
      { :req => :get_vms_in_lease_from_query, :args => %w() },
      { :req => :instantiate_vapp_template, :args => ['name', 'id', { :vdc_id => 'vid', :source_vms => [] }] },
      { :req => :post_acquire_ticket, :args => %w(id) },
      { :req => :post_answer_pending_vm_question, :args => %w(id cid qid) },
      { :req => :post_attach_disk, :args => %w(id did) },
      { :req => :post_cancel_task, :args => %w(id) },
      { :req => :post_capture_vapp, :args => %w(id name sid) },
      { :req => :post_check_vm_compliance, :args => %w(id) },
      { :req => :post_clone_media, :args => %w(id sid) },
      { :req => :post_clone_vapp, :args => %w(id name sid) },
      { :req => :post_clone_vapp_template, :args => %w(id name sid) },
      { :req => :post_compose_vapp, :args => %w(id) },
      { :req => :post_configure_edge_gateway_services, :args => ['id', {}] },
      { :req => :post_consolidate_vm_vapp, :args => %w(id) },
      { :req => :post_consolidate_vm_vapp_template, :args => %w(id) },
      { :req => :post_create_catalog_item, :args => %w(id name entity) },
      { :req => :post_create_org_vdc_network, :args => %w(id name) },
      { :req => :post_create_snapshot, :args => %w(id) },
      { :req => :post_deploy_vapp, :args => %w(id) },
      { :req => :post_detach_disk, :args => %w(id did) },
      { :req => :post_disable_nested_hv, :args => %w(id) },
      { :req => :post_disable_vapp_template_download, :args => %w(id) },
      { :req => :post_discard_vapp_state, :args => %w(id) },
      { :req => :post_eject_cd_rom, :args => %w(id mid) },
      { :req => :post_enable_nested_hv, :args => %w(id) },
      { :req => :post_enable_vapp_template_download, :args => %w(id) },
      { :req => :post_enter_maintenance_mode, :args => %w(id) },
      { :req => :post_exit_maintenance_mode, :args => %w(id) },
      { :req => :post_insert_cd_rom, :args => %w(id mid) },
      { :req => :post_install_vmware_tools, :args => %w(id) },
      { :req => :post_instantiate_vapp_template, :args => %w(id tid name) },
      { :req => :post_login_session, :args => %w() },
      { :req => :post_power_off_vapp, :args => %w(id) },
      { :req => :post_power_on_vapp, :args => %w(id) },
      { :req => :post_reboot_vapp, :args => %w(id) },
      { :req => :post_recompose_vapp, :args => ['id', { :vms_to_delete => [] }] },
      { :req => :post_remove_all_snapshots, :args => %w(id) },
      { :req => :post_reset_vapp, :args => %w(id) },
      { :req => :post_revert_snapshot, :args => %w(id) },
      { :req => :post_shutdown_vapp, :args => %w(id) },
      { :req => :post_suspend_vapp, :args => %w(id) },
      { :req => :post_undeploy_vapp, :args => %w(id) },
      { :req => :post_update_catalog_item_metadata, :args => %w(id) },
      { :req => :post_update_disk_metadata, :args => %w(id) },
      { :req => :post_update_media_metadata, :args => %w(id) },
      { :req => :post_update_vapp_metadata, :args => %w(id) },
      { :req => :post_update_vapp_template_metadata, :args => %w(id) },
      { :req => :post_upgrade_hw_version, :args => %w(id) },
      { :req => :post_upload_disk, :args => %w(id name size) },
      { :req => :post_upload_media, :args => %w(id name type size) },
      { :req => :post_upload_vapp_template, :args => %w(id name) },
      { :req => :put_catalog_item_metadata_item_metadata, :args => %w(id key value) },
      { :req => :put_cpu, :args => %w(id num) },
      { :req => :put_disk_metadata_item_metadata, :args => %w(id key value) },
      { :req => :put_disks, :args => ['id', { :disks => [] }] },
      { :req => :put_guest_customization_section_vapp, :args => %w(id) },
      { :req => :put_media_metadata_item_metadata, :args => %w(id key value) },
      { :req => :put_memory, :args => %w(id memory) },
      { :req => :put_metadata_value, :args => %w(id key value) },
      { :req => :put_network, :args => %w(id name) },
      { :req => :put_network_connection_system_section_vapp, :args => %w(id) },
      { :req => :put_product_sections, :args => ['id', []] },
      { :req => :put_vapp_metadata_item_metadata, :args => %w(id key value) },
      { :req => :put_vapp_name_and_description, :args => %w(id name) },
      { :req => :put_vapp_template_metadata_item_metadata, :args => %w(id key value) },
      { :req => :put_vm, :args => ['id', 'name', {}] },
      { :req => :put_vm_capabilities, :args => %w(id) },
    ].each do |data|
      it "Invoking #{data[:req]}" do
        service.send(data[:req], *data[:args])
      end
    end
  end
end
