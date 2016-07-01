# /bin/sh

projectDir='/Users/aldaron/Documents/Aldaron/iOS-Porjects/IndepTravel-iOS-Cocoapods/'
innerPath='IndepTravel/IndepTravel-iPhone'

if [ ! -d ${projectDir} ]; then
  #statements
  echo "${projectDir} 目录找不到!!"
  exit
fi

cd ${projectDir}

clear
echo '缓存当前的代码'
git fetch

git stash save "Morning !!!"
echo ${saveInfo}

echo '合并远端代码'
git checkout develop_im

git pull origin develop

git push

clean
echo '更新内容'
cd ${innerPath}
pod install --no-repo-update

clean
echo '打开工程'
open /Applications/SourceTree.app/
open /Applications/Xcode.app/ TravelGuideMdd.xcworkspace

exit

//====================================
//    TODO:自动构建App
//====================================

clean
echo '构建工程'
xcodebuild -scheme TravelGuideMdd -destination 'platform=iphonesimulator,name=iPhone 6 Plus' -derivedDataPath build

echo '打开模拟器'
xcrun instruments -w 'iPhone 6 Plus'

echo '安装打包之后的app文件'
xcrun simctl install booted build/Release-iphoneos/TravelGuideMdd.app
# /Users/mafengwo/Library/Developer/Xcode/DerivedData/TravelGuideMdd-fyhxfdbljcpoqndyyrqvvrdsrfyk/Build/Products/Debug-iphoneos/TravelGuideMdd.app
#xcrun simctl install booted /Users/mafengwo/Library/Developer/Xcode/DerivedData/TravelGuideMdd-fyhxfdbljcpoqndyyrqvvrdsrfyk/Build/Products/Debug-iphoneos/TravelGuideMdd.app
echo '打开自由行App'
xcrun simctl launch booted cn.mafengwo.www
