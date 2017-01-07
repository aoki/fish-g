function g -d "Move directory via ghq list"
  set cache "/tmp/ghq.cache"
  if [ $argv[1] = '--no-cache' ] ^ /dev/null
    echo "Remove Cache"
    rm $cache
  end
  if [ -e /tmp/ghq.cache ]
    set cmd "cat $cache"
  else
    set cmd "ghq list | tee $cache"
  end
  eval $cmd | fzf | read repo
  cd (ghq root)"/$repo"
end
