#' Format fasta
#' 
#' Format fasta file for use with Blast
#'
#' @param flin chr string of path for Fasta file
#' @param flout chr string of file to save for BLAST
#' 
#' @details 
#' 
#' @export
#' 
#' @import dplyr
#' 
#' @examples
#' \dontrun{
#' flin <- 'inst/ex.fasta'
#' formfst(flin)
#' }
formfst <- function(flin, flout = NULL){

  # output file name if not provided
  if(is.null(flout))
    flout <- 'flout.txt'
    
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
  
  # write output  
  writeLines(out,  flout)
  
}
