#PHP7のインストールを実行
%w[
	php70
	php70-php-mcrypt
	php70-php-devel
	php70-php-pdo
	php70-php-mbstring
	php70-php-fpm
	php70-php-mysqlnd
	php70-php-gd
].each do |pkg|
	package "#{pkg}" do
		options '--enablerepo=epel,remi,remi-php70'
		action :install
	end
end

#パス(環境変数)を設定
bash 'dir_pass_add' do
	code <<-EOS
		echo "export PATH=/opt/remi/php70/root/usr/bin:/opt/remi/php70/root/usr/sbin\${PATH:+:\${PATH}}" >> /etc/profile
		echo "export LD_LIBRARY_PATH=/opt/remi/php70/root/usr/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> /etc/profile
		echo "export MANPATH=/opt/remi/php70/root/usr/share/man:\${MANPATH}" >> /etc/profile
		ln -s /etc/opt/remi/php70/php.ini /etc/php.ini
	EOS
end