sudo apt update
sudo apt install fish
fish
sudo apt update
sudo apt install vim
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
echo -e "if status is-interactive\n\toh-my-posh init fish | source\noh-my-posh init fish --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json' | source\nend" > ~/.config/fish/config.fish
exec fish
. ~/.config/fish/config.fish