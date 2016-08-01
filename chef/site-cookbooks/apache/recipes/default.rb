#既存のhttpdをアンインストールし、Apache2.4をインストール
bash 'available' do
	user 'root'
	code <<-EOS
		yum remove httpd
		yum install epel-release
		rpm -Uvh 'https://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-14.ius.centos6.noarch.rpm'
		yum -y install httpd24u mod24u_ssl
	EOS
end

#サービスを起動
service 'httpd' do
	supports :status => true, :restart => true, :start => true, :stop => true
	action [ :enable, :start ]
end