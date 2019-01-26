# Switch PHP versions in Laravel Valet+
A simple shell script to switch the PHP version for Laravel Valet+ using ZSH.

Create a hidden file in your users folder:
```
touch ~/.switch-valet-php-version.sh
```
Then copy and paste this function. It takes a string specifying the valet-php version that we want to run as a parameter.
```
#!/bin/zsh

# switches php version
phpv() {
    string="$1" # i.e: valet-php@7.3, valet-php@5.6, etc... 
    a=("${(@s/@/)string}") # @ modifier, split string by delimiter /@/
    echo "Switching to php version => $a[2] ..."
    valet use $a[2] # get the numeric version after "@"
    valet install
}
```
Perfect. Now we need to add some aliases to run the command from the terminal.
Add these lines to the bottom of your `~/.zshrc` file:
```
alias php56="phpv valet-php@5.6"
# add here whichever version you want to run
alias php73="phpv valet-php@7.3"

source ~/.switch-valet-php-version.sh
```
Close your terminal and open a new one. You should be able to change your PHP version using one of the aliases we've just created.
```
php73
```
That's it! Feel free to contribute. A bash version would be cool too!

References:
https://murze.be/easily-switch-php-versions-in-laravel-valet
