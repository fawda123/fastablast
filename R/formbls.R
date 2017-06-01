#' Get BLAST data
#'
#' Get relevant BLAST data from output file
#'
#' @param flin chr string of path for Fasta file
#' @param flout chr string of file to save for BLAST, output returned to console if \code{NULL}
#' 
#' @export
#' 
#' @import dplyr
#' 
#' @examples
#' flin <- 'inst/bls_ex.txt'
#' formbls(flin)
formbls <- function(flin, flout = NULL){
  
  # read flin
  dat <- readLines(flin)
 
  # get index of unique otus
  unis <- grep('Otu[0-9]+', dat)
  
  # otus
  otus <- gsub('^.*(Otu[0-9]+).*$', '\\1', dat[unis])
  
  # indices for each otu
  ids <- seq(unis[1], length(dat)) %>% 
    data.frame(ind = .) %>% 
    left_join(., data.frame(ind = unis, indf = unis), by = 'ind') %>% 
    mutate(
      ind = !is.na(indf), 
      indf = c(NA, indf[ind])[cumsum(ind) + 1]
    ) %>% 
    .$indf
  
  # split readlines by otu groups
  byotu <- dat[unis[1]:length(dat)] %>% 
    split(., ids)
  
  # map getmtch to otus
  dat <-  purrr::map(byotu, getmtch)
  names(dat) <- otus
  
  # combine for output
  out <- do.call('rbind', dat) %>% 
    tibble::rownames_to_column('otu') %>% 
    mutate(otu = gsub('\\.[0-9]+$', '', otu))
  
  # to console if NULL
  if(is.null(flout))
    return(out)
  
  write.table(out, flout, sep = '\t', quote = FALSE, row.names = FALSE)
   
}