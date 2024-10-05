# 自动补全函数
_autocomplete_lastf() {
    # 获取最后一个参数
    local last_arg=$(echo $BUFFER | awk '{print $NF}')

    if [[ $last_arg =~ ^lastf([0-9]*)$ ]]; then
        # match是上面字符串匹配的结果
        # match[0]保存完整字符,match[1]报错上面的第一组,即数字的部分
        # :- 是设置默认值的语法
        local num_files=${match[1]:-1}

        # 获取最近修改的num_files个文件名,并用空格分隔
        # local last_file=$(\ls -1th -b | head -n1)
        local last_files=$(eza -1 -f --sort=modified --reverse | head -n $num_files | paste -sd ' ')

        # 替换'lastfN'为最近修改的文件名列表
        BUFFER="${BUFFER%$last_arg}${last_files}"
        # 光标移动到行尾
        CURSOR=${#BUFFER}

        # 提前返回,不再调用expand-or-complete
        return 0

    elif [[ $last_arg =~ ^lastd([0-9]*)$ ]]; then
        local num_dirs=${match[1]:-1}

        # 获取最近修改的num_dirs个文件夹名,并用空格分隔
        local last_dirs=$(eza -1 -D --sort=modified --reverse | head -n $num_dirs | paste -sd ' ')

        # 替换'lastdN'为最近修改的文件夹名列表
        BUFFER="${BUFFER%$last_arg}${last_dirs}"
        CURSOR=${#BUFFER}

        return 0
    fi

    # 调用另一个小部件以执行默认的补全行为
    zle expand-or-complete
}

# 绑定该函数到 zle
zle -N _autocomplete_lastf

# 绑定 Tab 键到自定义的自动补全函数
bindkey '^I' _autocomplete_lastf
