NVM_VERSION := 22
ANGULAR_VERSION := 18.0.0

help:
	@echo
	@echo "Voir la doc Angular : https://angular.dev/tutorials/first-app"
	@echo

open:
	open MyMovies-Frontend.code-workspace

setup: install-angular install-node-js version

install-angular:
	brew install angular-cli

install-node-js: mymovies-rc
	echo based on https://nodejs.org/en/download/
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	@source ~/.mymoviesrc && nvm install ${NVM_VERSION}
	@source ~/.mymoviesrc && source ~/.nvm/nvm.sh && nvm use ${NVM_VERSION}
	@source ~/.mymoviesrc && source ~/.nvm/nvm.sh && npm install -g @angular/cli@${ANGULAR_VERSION}

version:
	source ~/.mymoviesrc && ng version

nvm-ls-remote:
	nvm ls-remote 

mymovies-rc:
	echo '[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh' > ~/.mymoviesrc

init-project:
	[ -d "MyMovies" ] || ng new MyMovies --style=css
	[ -d "MyMovies" ] && echo "Project already exist"

s: serve
serve:
	cd MyMovies && ng serve

build:
	cd MyMovies && ng build

clean:
	rm -rf MyMovies/node_modules
