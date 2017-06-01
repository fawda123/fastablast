#' Format fasta
#' 
#' Format fasta file for use with Blast
#'
#' @param flin chr string of path for Fasta file
#' @param flout chr string of file to save for BLAST, output returned to console if \code{NULL}
#' 
#' @export
#' 
#' @import dplyr
#' 
#' @examples
#' flin <- system.file("extdata", "fst_ex.fasta", package = "fastablast")
#' formfst(flin)
formfst <- function(flin, flout = NULL){
    
  # read flin
  dat <- readLines(flin)
  
  # get index of unique otus
  unis <- grep('^>', dat)
  
  # get otu identifiers
  otus <- dat[unis] %>% 
    gsub('^.*(Otu[0-9]+).*$', '>\\1', .)
  
  # get sequence data for each otu
  seqs <- dat[unis + 1]
  
  # combine otu and sequence data
  out <- cbind(otus, seqs) %>% 
    t %>% 
    c
  
  # output file name if not provided
  if(is.null(flout))
    return(out)
  
  # write output  
  writeLines(out,  flout)
  
}
