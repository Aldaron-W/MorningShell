# /bin/sh

cd /Users/mafengwo/Documents/Aldaron/Project/AWAudioKitDemo/AudioKit

echo '缓存当前的代码' | terminal-notifier -sound default
git fetch

git stash save "Morning !!!"

echo '合并远端代码' | terminal-notifier -sound default
git checkout master

git pull origin master

git push

echo '更新内容' | terminal-notifier -sound default
pod install --no-repo-update
