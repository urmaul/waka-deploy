#sh $appdir/init.sh

yiic="php $appdir/yiic"
$yiic migrate up --interactive=0
