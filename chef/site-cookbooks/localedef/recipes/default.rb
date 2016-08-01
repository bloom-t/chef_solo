#言語の設定(Apacheインストール時に必要な設定)
bash 'localedef' do
	code 'localedef -f UTF-8 -i ja_JP ja_JP.UTF-8'
end
