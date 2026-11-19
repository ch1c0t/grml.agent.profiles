file "/var/lib/grml.agent.profiles/mitamae-failure-test/after-failure" do
  content "this recipe must not run\n"
  owner "root"
  group "root"
  mode "0644"
end
