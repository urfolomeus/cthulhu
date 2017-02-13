#!/usr/bin/env sh

cd `dirname $0`/..
version=`head VERSION`
project="cthulhu"
ssh_to="cthulhu@178.62.35.171"

remote_ex(){
  ssh -A $ssh_to $1
}

docker build -t build-cthulhu -f docker/Dockerfile.build.elixir .
docker run -v $PWD/releases:/app/releases build-cthulhu mix release --env=prod

scp "releases/$project/releases/$version/$project.tar.gz" "$ssh_to:"

remote_ex "rm -rf ${project}_release.old"
remote_ex "mv ${project}_release ${project}_release.old"
remote_ex "mkdir -p ${project}_release"
remote_ex "cd ${project}_release && tar zxvf ../${project}.tar.gz"

remote_ex "${project}_release.old/bin/$project stop"
remote_ex "${project}_release/bin/$project start"
