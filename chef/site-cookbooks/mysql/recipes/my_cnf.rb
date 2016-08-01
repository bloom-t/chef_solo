#用意したTemplate（my.cnf.erb）と差し替える
template '/etc/my.cnf' do
	source 'my.cnf.erb'
end

#設定を反映
service 'mysqld' do
	supports :status => true, :restart => true, :start => true, :stop => true
	action [ :enable, :restart ]
end