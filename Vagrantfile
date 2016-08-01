#最新の2を指定
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	#起動した際のボックス名
	config.vm.box = 'vagrant_default'

	#バーチャルボックスに利用するCentOS
	config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box'

	#ポートフォワーディングの設定
	config.vm.network 'forwarded_port', guest: 80, host: 8000, id: 'http'
	config.vm.network 'forwarded_port', guest: 20, host: 2000, id: 'ftp(データ転送ポート)'
	config.vm.network 'forwarded_port', guest: 21, host: 2100, id: 'ftp(コントロールポート)'
	config.vm.network 'forwarded_port', guest: 22, host: 2200, id: 'ssh'

	#VirtualBoxのMemoryを指定
	config.vm.provider 'virtualbox' do |vbox|
		vbox.memory = 1024
	end

	#利用するレシピを指定
	#※Apacheインストール時に設定がデフォルトに戻されてしまうので、
	#  Apacheインストール後にデフォルト設定(「default_conf」のレシピを読み込むようにしている)
	config.vm.provision 'chef_solo' do |chef|
		chef.cookbooks_path = 'chef/site-cookbooks/'
		chef.run_list = %w[
			recipe[remi]
			recipe[localedef]
			recipe[php]
			recipe[php::php_ini]
			recipe[mysql]
			recipe[mysql::my_cnf]
			recipe[apache]
			recipe[apache::httpd_conf]
			recipe[default_conf]
		]
	end

	#Chefが入っているか確認し、入っていない場合はインストール
	config.omnibus.chef_version = :latest
end
