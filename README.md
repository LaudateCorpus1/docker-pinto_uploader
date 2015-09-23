# Pinto uploader

## SYNOPSIS

### run pinto uploader
```
#manual
docker run -v /var/lib/pinto:/var/lib/pinto -p3000:3000 avastsoftware/pinto_uploader prefork
#or as service (only systemd linux)
cp pinto_uploader.service /etc/systemd/system/
systemctl start pinto_uploader.service
```

### send distribution to pinto uploader
```
curl -XPOST --data-binary @Perl-Module-1.0.0.tar.gz upload.pinto.server:3000/add?author=AUTHOR&dist=Perl-Module-1.0.0.tar.gz
#or
wget --post-file Perl-Module-1.0.0.tar.gz upload.pinto.server:3000/add?author=AUTHOR&dist=Perl-Module-1.0.0.tar.gz
#or
curl -F "dist=@Perl-Module-1.0.0.tar.gz" upload.pinto.server:3000/add?author=AUTHOR
```

## DESCRIPTION
[Pinto](https://metacpan.org/pod/pinto) is awesome tool for make internal repository.
[avastsoftware/pinto](https://hub.docker.com/r/avastsoftware/pinto/) is docker container with *pintod* on entrypoint (and pinto tool).
But *pintod* have 'only' same interface as cpan => distributions is possible only get.
This project ([avastsoftware/pinto_uploader](https://hub.docker.com/r/avastsoftware/pinto_uploader/) is solution of central (internal) pinto repositories.

Warning! 
Pushing in to *pinto uploader* doesn't authorized, everyone should push distribution to *pinto uploader*.
Easy solution is *Basic access authentication* on proxy http server before *pinto uploader*

## SEE ALSO
*pinto uploader* is a replacement of manual call pinto on some pinto server with *avastsoftware/pinto* service 
```
scp Perl-Module-1.0.0.tar.gz pinto.server:/tmp
ssh pinto.server docker run -v/var/lib/pinto:/var/lib/pinto avastsoftware/pinto pinto add /tmp/Perl-Module-1.0.0.tar.gz --author AUTHOR
```
