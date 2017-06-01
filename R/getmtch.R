#' Get OTU matches
#'
#' Get sequence mathces for an individual OTU from BLAST file
#' 
#' @param lnsin chr string of text to parse for an individual OTU
#'
#' @export
#' 
#' @details Used within \code{\link{formbls}}
#' 
#' @return A \code{\link[base]{data.frame}} of sequence info extracted from the OTU
#' 
#' @import dplyr
getmtch <- function(lnsin){
  
 # beginning and end of matches
 beg <- grep('^Sequences producing significant alignments', lnsin) + 2
 end <- grep('^ALIGNMENTS', lnsin) - 2
 
 # get matches
 mtch <- lnsin[beg:end] %>% 
   strsplit(., '\\s\\s+') %>% 
   do.call('rbind', .) %>% 
   data.frame
 
 names(mtch) <- c('sequence', 'descrip', 'score_bits', 'e_value')
 
 # get identities and gaps
 vals <- grep('Identities', lnsin) 
 vals <- gsub('.* = ([0-9]+/[0-9]+).* = ([0-9]+/[0-9]+).*', '\\1 \\2', lnsin[vals]) %>% 
   strsplit(., '\\s') %>% 
   do.call('rbind', .)
 
 # combine
 out <- data.frame(mtch, identities = vals[, 1], gaps = vals[, 2])
 
 return(out)
  
}