# bash aliases

jsleeio_containers_root=gcr.io/jsleeio-containers

alias aws="docker run --interactive --tty --rm --volume=$HOME/.aws:/home/user/.aws $jsleeio_containers_root/awscli:latest"
alias man-linux="docker run --interactive --tty --rm $jsleeio_containers_root/man:latest"
