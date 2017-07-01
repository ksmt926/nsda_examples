services<-c("http","bittorrent","smtp","http","http","bittorrent")

service.factors<-factor(services)

service.factors
#[1] http       bittorrent smtp       http       http       bittorrent
#Levels: bittorrent http smtp
services
#[1] "http"       "bittorrent" "smtp"       "http"       "http"
#[6] "bittorrent"