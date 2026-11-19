directory "/var/lib/grml.agent.profiles/mitamae-failure-test" do
  owner "root"
  group "root"
  mode "0755"
end

file "/var/lib/grml.agent.profiles/mitamae-failure-test/before-failure" do
  content "first recipe completed\n"
  owner "root"
  group "root"
  mode "0644"
end
