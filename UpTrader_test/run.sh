#!/bin/bash



install() {
    echo "Updating pip..."
    pip install --upgrade pip


    echo "Installing virtual environment"
    python3 -m pip install virtualenv

    echo "Creating venv..."
    python3 -m venv venv

    sleep 1

    echo "Entering venv..."
    source venv/bin/activate



    echo "Installing requirements..."
    pip install -r requirements.txt

    echo "Preparing database..."
    python3 ./manage.py migrate
}

run() {

    ./manage.py runserver
}

print_help() {
    echo "Command script. Supported commands:"
    echo " source run.sh install - install server on local computer"
    echo "   $0 run - start server"
}

if [ ! $1 ]
then
   print_help
   exit 0
fi
case $1 in
    help)
	    print_help
	;;
    install)
	    install
	;;
    run)
	    echo "Starting server"
	    run
	;;
esac
