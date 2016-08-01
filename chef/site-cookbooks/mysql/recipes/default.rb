#MySQL5.7.13インストール準備
bash 'available' do
	user 'root'
	code <<-EOS
		rpm --import http://dev.mysql.com/doc/refman/5.7/en/checking-gpg-signature.html
		rpm -ihv http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
	EOS
end

#MySQLのインストール実行
yum_package 'mysql-community-server' do
	options "--enablerepo='mysql57-community*'"
	action :install
end

#MySQLを実行
service 'mysqld' do
	supports :status => true, :restart => true, :start => true, :stop => true
	action [ :enable, :start ]
end