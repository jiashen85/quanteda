% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dfm-methods.R
\docType{methods}
\name{trim}
\alias{trim}
\alias{trim,dfm-method}
\alias{trimdfm}
\title{Trim a dfm using threshold-based or random feature selection}
\usage{
trim(x, minCount = 1, minDoc = 1, sparsity = NULL, nsample = NULL,
  verbose = TRUE)

\S4method{trim}{dfm}(x, minCount = 1, minDoc = 1, sparsity = NULL,
  nsample = NULL, verbose = TRUE)

trimdfm(x, ...)
}
\arguments{
\item{x}{document-feature matrix of \link{dfm-class}}

\item{minCount}{minimum count or fraction of features in across all documents}

\item{minDoc}{minimum number or fraction of documents in which a feature appears}

\item{sparsity}{equivalent to 1 - minDoc, included for comparison with tm}

\item{nsample}{how many features to retain (based on random selection)}

\item{verbose}{print messages}

\item{...}{only included to allow legacy \code{trimdfm} to pass arguments to \code{trim}}
}
\value{
A \link{dfm-class} object reduced in features (with the same number 
  of documents)
}
\description{
Returns a document by feature matrix reduced in size based on document and 
term frequency, and/or subsampling.
}
\note{
Trimming a \link{dfm-class} object is an operation based on the values 
  in the document-feature \emph{matrix}.  To select subsets of a dfm based on
  attributes of the features themselves -- such as selecting features 
  matching a regular expression, or removing features matching a stopword 
  list, use \link{selectFeatures}.
}
\examples{
(myDfm <- dfm(data_corpus_inaugural, verbose = FALSE))
# only words occuring >=10 times and in >=2 docs
trim(myDfm, minCount = 10, minDoc = 2) 
# only words occuring >=10 times and in at least 0.4 of the documents
trim(myDfm, minCount = 10, minDoc = 0.4)
# only words occuring at least 0.01 times and in >=2 documents
trim(myDfm, minCount = .01, minDoc = 2)
# only words occuring 5 times in 1000
trim(myDfm, minDoc = 0.2, minCount = 0.005)
# sample 50 words occurring at least 20 times each
(myDfmSampled <- trim(myDfm, minCount = 20, nsample = 50))  
topfeatures(myDfmSampled)
\dontrun{
if (require(tm)) {
    (tmdtm <- convert(myDfm, "tm"))
    removeSparseTerms(tmdtm, 0.7)
    trim(td, minDoc = 0.3)
    trim(td, sparsity = 0.7)
}
}
}
\author{
Paul Nulty and Ken Benoit, some inspiration from Will Lowe's (see \code{trim} from the 
  \code{austin} package)
}
\seealso{
\code{\link{selectFeatures}}
}

