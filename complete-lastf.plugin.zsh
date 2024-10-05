# 自动补全函数
_autocomplete_lastf() {
  # 获取最后一个参数
  local last_arg=$(echo $BUFFER | awk '{print $NF}')

  case $last_arg in
    'lastf')
      # 获取最近修改的文件名
      # local last_file=$(\ls -1th -b | head -n1)
      local last_file=$(eza -1 -f --sort=modified --reverse | head -n1)
      # 替换 'lastf' 为最近修改的文件名
      BUFFER=${BUFFER%lastf}$last_file
      CURSOR=$#BUFFER
      ;;
    'lastd')
      # 获取最近修改的文件夹名
      local last_dir=$(eza -1 -D --sort=modified --reverse | head -n1)
      # 替换 'lastd' 为最近修改的文件夹名
      BUFFER=${BUFFER%lastd}$last_dir
      CURSOR=$#BUFFER
      ;;
  esac

  # 调用另一个小部件以执行默认的补全行为
  zle expand-or-complete
}

# 绑定该函数到 zle
zle -N _autocomplete_lastf

# 绑定 Tab 键到自定义的自动补全函数
bindkey '^I' _autocomplete_lastf
