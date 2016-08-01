#既存のhttpd.confをテンプレートで書き換え
template '/etc/httpd/conf/httpd.conf' do
	source 'httpd.conf.erb'
end
