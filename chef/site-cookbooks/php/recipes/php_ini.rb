#php.iniの設定ファイルを配置
template '/etc/opt/remi/php70/php.ini' do
	source 'php.ini.erb'
end
