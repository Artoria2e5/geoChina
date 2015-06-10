#' IP address lookup
#'
#' geocodes an IP address using either freegeoip.net \url{http://freegeoip.net} or 
#' ipinfo.io \url{http://ipinfo.io/developers} IP lookup API.
#' 
#' @param ip a character vector specifying an IP (e.g., "12.215.42.19"). 
#' The default value is no IP is specified and the host IP is used.
#' @param api use freegeoip.net or ipinfo.io IP lookup API. By default 
#' freegeoip.net is used.
#' @return a vector with information of ip, country_code, country_name, region_code, 
#' city, zip_code, time_zone, latitude, longitude and metro_code for freegeoip.net API, 
#' of ip, hostname, city, region, country, loc, org, postal and phone for ipinfo.io 
#' IP lookup API. If numerous IPs are inputted, a data.frame is returned. 
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD student from 
#' Center for Earth System Science, Tsinghua University
#' @details note that freegeoip.net API is allowed up to 10,000 queries per hour 
#' by default, ipinfo API is limited to 1,000 requests per day.
#' @seealso \code{\link{geocode}}, \code{\link{revgeocode}}.
#' 
#' freegeoip.net IP lookup API at \url{http://freegeoip.net}
#' 
#' ipinfo.io IP lookup API at \url{http://ipinfo.io/developers}
#' @export
#' @examples
#' \dontrun{
#' # geocode host IP
#' geohost()
#' geohost(api = "ipinfo.io")
#' # specify an IP for geocoding
#' geohost(ip = "12.215.42.19")
#' geohost(ip = "12.215.42.19", api = "ipinfo.io")
#' # geocode multiple IPs
#' geohost(ip = c("61.135.169.81", "12.215.42.19"))
#' geohost(ip = c("61.135.169.81", "12.215.42.19"), api = "ipinfo.io")
#' }

geohost <- function(ip = '', api = c("freegeoip.net", "ipinfo.io")) {
  # check parameters
  stopifnot(is.character(ip))
  api <- match.arg(api)
  
  # vectorize for many IPs
  if (length(ip) > 1) {
    return(ldply(ip, geohost, api = api))
  }
  
  if (api == "freegeoip.net") {
    url_string <- "http://freegeoip.net/json/"
    if (nchar(ip) > 0) {
      url_string <- paste0(url_string, ip)
    }
    con <- curl(url_string)
    x <- readLines(con, warn = F)
    close(con)
    as.data.frame(fromJSON(x))
  } else {
    url_string <- "http://ipinfo.io/json"
    if (nchar(ip) > 0) {
      url_string <- paste0("http://ipinfo.io/", ip, "/json")
    }
    con <- curl(url_string)
    x <- paste(readLines(con, warn = F), collapse = "")
    close(con)
    as.data.frame(as.list(fromJSON(x)))
  }
}