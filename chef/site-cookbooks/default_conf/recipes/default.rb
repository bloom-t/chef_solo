#CentOSの「ロケーション」「言語」を再設定
bash 'reload' do
	user 'root'
	code <<-EOS
		echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock
		localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
		echo -e 'LANG="ja_JP.UTF-8"' > /etc/sysconfig/i18n
		ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
	EOS
end