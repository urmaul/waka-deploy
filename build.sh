#sh $appdir/init.sh

# Composer install
#if [ $env = "prod" ] ; then
#    php ./composer.phar install --no-dev --optimize-autoloader
#else
#    php ./composer.phar install --dev
#fi

yiic="php $appdir/yiic"
$yiic migrate up --interactive=0
