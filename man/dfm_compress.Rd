% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dfm_compress.R, R/fcm-methods.R
\name{dfm_compress}
\alias{dfm_compress}
\alias{fcm_compress}
\title{compress a dfm or fcm by combining identical dimension elements}
\usage{
dfm_compress(x, margin = c("both", "documents", "features"))

fcm_compress(x)
}
\arguments{
\item{x}{input object, a \link{dfm} or \link{fcm}}

\item{margin}{character indicating on which margin to compress a dfm, either 
\code{"documents"}, \code{"features"}, or \code{"both"} (default).  For fcm
objects, \code{"documents"} has an effect.}

\item{...}{additional arguments passed from generic to specific methods}
}
\description{
"Compresses" a dfm (or fcm) whose dimension names are the same, for either
documents or features.  This may happen, for instance, if features are made
equivalent through application of a thesaurus.  It may also occur after
lower-casing or stemming the features of a dfm, but this should only be done
in very rare cases (approaching never: it's better to do this \emph{before}
constructing the dfm.)  It could also be needed after a
\code{\link{cbind.dfm}} or \code{\link{rbind.dfm}} operation.
}
\note{
\code{fcm_compress} works only when the \link{fcm} was created with a document
context.
}
\examples{
mat <- rbind(dfm(c("b A A", "C C a b B"), toLower = FALSE, verbose = FALSE),
             dfm("A C C C C C", toLower = FALSE, verbose = FALSE))
colnames(mat) <- toLower(features(mat))
mat
dfm_compress(mat, margin = "documents")
dfm_compress(mat, margin = "features")
dfm_compress(mat)

# no effect if no compression needed
compactdfm <- dfm(data_char_inaugural[1:5], verbose = FALSE)
dim(compactdfm)
dim(dfm_compress(compactdfm))

# compress an fcm
myfcm <- fcm(tokens("A D a C E a d F e B A C E D"), 
             context = "window", window = 3)
## this will produce an error:
# fcm_compress(myfcm)

txt <- c("The fox JUMPED over the dog.",
         "The dog jumped over the fox.")
toks <- tokens(txt, removePunct = TRUE)
myfcm <- fcm(toks, context = "document")
colnames(myfcm) <- rownames(myfcm) <- tolower(colnames(myfcm))
colnames(myfcm)[5] <- rownames(myfcm)[5] <- "fox"
myfcm
fcm_compress(myfcm)
}

