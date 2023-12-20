#!/bin/bash

# コマンドリストファイルのパス
command_list_file="cmd-list.txt"

# インストールするコマンドのリストが書かれたファイルが存在するか確認
if [ ! -f "$command_list_file" ]; then
    echo "Error: コマンドリストファイルが見つかりません。"
    exit 1
fi

# コマンドリストファイルからコマンドを1行ずつ読み込んで実行
while IFS= read -r command; do
    # コマンドが空行でないか確認
    if [ -n "$command" ]; then
        # コマンドをインストールしようとする
        sudo apt-get install -y "$command"
        # インストール結果を確認
        if [ $? -ne 0 ]; then
            echo "Error: $command のインストール中にエラーが発生しました。"
        fi
    fi
done < "$command_list_file"

echo "インストールが完了しました。"

