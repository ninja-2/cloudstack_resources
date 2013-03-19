require File.join(File.dirname(__FILE__), '..', 'cloudstack.rb')
Puppet::Type.type(:cloudstack_security_group).provide(
    :default,
    :parent => Puppet::Provider::CloudStack
) do

  #commands :example => :example

  mk_resource_methods

  def self.instances
    connection.security_groups.collect do |sg|
      new(
        :name          => sg.name,
        :id            => sg.id,
        :ingress_rules => sg.ingress_rules,
        :egress_rules  => sg.egress_rules,
        :ensure        => :present
      )
    end
  end

  def create
    sg=connection.security_groups.create(
     :name      => resource[:name],
     :description => resource[:name]
    )

    if ! resource[:ingress_rules].nil? 
      resource[:ingress_rules].each do |rule| 
        sgr_param={ "security_group_id" => sg.id,  "direction" => "ingress" }.merge(rule)
        connection.security_group_rules.create(sgr_param)
      end
    end

    if ! resource[:egress_rules].nil?
      resource[:egress_rules].each do |rule| 
        sgr_param={ "security_group_id" => sg.id,  "direction" => "egress" }.merge(rule)
        connection.security_group_rules.create(sgr_param)
      end
    end

    return sg

  end

  def destroy
    # TODO need to block until delete is completed
    connection.security_groups.destroy(@property_hash[:id])
  end

  def id=(id)
    fail_read_only
  end

end
