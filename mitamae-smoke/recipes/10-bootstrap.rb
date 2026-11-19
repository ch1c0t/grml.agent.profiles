directory "/var/lib/grml.agent.profiles/mitamae-smoke" do
  owner "root"
  group "root"
  mode "0755"
end

file "/var/lib/grml.agent.profiles/mitamae-smoke/direct-recipe" do
  content "direct recipe executed\n"
  owner "root"
  group "root"
  mode "0644"
end
