#' IP address lookup
#'
#' geocodes an IP address using HostIP.info API \url{http://www.hostip.info}.
#' 
#' @param ip a character vector specifying an IP (e.g., "12.215.42.19"). 
#' The default value is no IP is specified and the host IP is used.
#' @param position whether or not output lat/lng infomation. The default value is TRUE.
#' @return a vector with information of contry_name, country_code, city, and ip. 
#' If numerous IPs are inputted, a data.frame is returned. 
#' @author Jun Cai (\email{cai-j12@@mails.tsinghua.edu.cn}), PhD student from 
#' Center for Earth System Science, Tsinghua University
#' @seealso \code{\link{geocode}}, \code{\link{revgeocode}}.
#' 
#' HostIP.info IP Address Lookup API at \url{http://www.hostip.info/use.html}
#' @export
#' @examples
#' \dontrun{
#' # geocode host IP
#' geohost()
#' # no lat/lng infomation
#' geohost(position = F)
#' # specify an IP for geocoding
#' geohost(ip = "12.215.42.19")
#' geohost(ip = "12.215.42.19", position = F)
#' # geocode multiple IPs
#' geohost(ip = c("61.135.169.81", "12.215.42.19"))
#' geohost(ip = c("61.135.169.81", "12.215.42.19"), position = F)
#' }

geohost <- function(ip = '', position = TRUE) {
  # check parameters
  stopifnot(is.character(ip))
  stopifnot(is.logical(position))
  
  # vectorize for many IPs
  if (length(ip) > 1) {
    return(ldply(ip, geohost, position = position))
  }
  
  url_string <- "http://api.hostip.info/get_json.php"
  if (nchar(ip) > 0) {
    url_string <- paste(url_string, "?ip=", ip, sep = "")
  }
  if (position) {
    hyphen <- ifelse(nchar(ip) == 0, "?", "&")
    url_string <- paste(url_string, hyphen, "position=", position, sep = "")
  }
  fromJSON(readLines(url_string, warn = F))
}
