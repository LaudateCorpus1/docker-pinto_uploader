# Pinto uploader

## SYNOPSIS

### run pinto uploader
```
#manual
docker run -v /var/lib/pinto:/var/lib/pinto -p3000:3000 avastsoftware/pinto_uploader prefork
#or as a service (only systemd linux)
cp pinto_uploader.service /etc/systemd/system/
systemctl start pinto_uploader.service
```

### send a distribution to pinto uploader
```
curl -XPOST --data-binary @Perl-Module-1.0.0.tar.gz upload.pinto.server:3000/add?author=AUTHOR&dist=Perl-Module-1.0.0.tar.gz
#or
wget --post-file Perl-Module-1.0.0.tar.gz upload.pinto.server:3000/add?author=AUTHOR&dist=Perl-Module-1.0.0.tar.gz
#or
curl -F "dist=@Perl-Module-1.0.0.tar.gz" upload.pinto.server:3000/add?author=AUTHOR
```

## DESCRIPTION
[Pinto](https://metacpan.org/pod/pinto) is an awesome tool for managing
internal repository of Perl distributions.
[avastsoftware/pinto](https://hub.docker.com/r/avastsoftware/pinto/) is docker
container with *pintod* on entrypoint (and with pinto tool inside).
However, *pintod* 'only' has the same interface as CPAN, i.e. it only enables
distributions to be fetched from it. This project
[avastsoftware/pinto_uploader](https://hub.docker.com/r/avastsoftware/pinto_uploader/)
complements it. It enables to upload Perl distributions to the pinto
repository (e.g. a company-wide internal repository).

## CAVEATS AND LIMITATIONS
There is no authorization / authentication implemented: everyone who can access
the server is able to push a distribution into the repository. A possible
solution is to put *Basic access authentication* on proxy http server before
*pinto uploader*.

## SEE ALSO
*pinto uploader* is a replacement for manual call of pinto command on a pinto
server with *avastsoftware/pinto* service.
d
```
scp Perl-Module-1.0.0.tar.gz pinto.server:/tmp
ssh pinto.server docker run -v/var/lib/pinto:/var/lib/pinto avastsoftware/pinto pinto add /tmp/Perl-Module-1.0.0.tar.gz --author AUTHOR
```
