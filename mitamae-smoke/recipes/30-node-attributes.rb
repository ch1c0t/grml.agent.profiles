file "/var/lib/grml.agent.profiles/mitamae-smoke/node-attributes" do
  content "#{node['smoke']['value']}\n"
  owner "root"
  group "root"
  mode "0644"
end
