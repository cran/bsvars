% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary.PosteriorShocks}
\alias{summary.PosteriorShocks}
\title{Provides posterior summary of structural shocks}
\usage{
\method{summary}{PosteriorShocks}(object, ...)
}
\arguments{
\item{object}{an object of class PosteriorShocks obtained using the
\code{compute_structural_shocks()} function containing draws the posterior
distribution of the structural shocks.}

\item{...}{additional arguments affecting the summary produced.}
}
\value{
A list reporting the posterior mean, standard deviations, as well as 
5 and 95 percentiles of the structural shocks for each of the equations and periods.
}
\description{
Provides posterior summary of the structural shocks including their 
mean, standard deviations, as well as 5 and 95 percentiles.
}
\examples{
# upload data
data(us_fiscal_lsuw)

# specify the model and set seed
set.seed(123)
specification  = specify_bsvar$new(us_fiscal_lsuw)

# run the burn-in
burn_in        = estimate(specification, 10)

# estimate the model
posterior      = estimate(burn_in, 20)

# compute structural shocks
shocks         = compute_structural_shocks(posterior)
shocks_summary = summary(shocks)

# workflow with the pipe |>
############################################################
set.seed(123)
us_fiscal_lsuw |>
  specify_bsvar$new() |>
  estimate(S = 10) |> 
  estimate(S = 20) |> 
  compute_structural_shocks() |>
  summary() -> shocks_summary

}
\seealso{
\code{\link{compute_structural_shocks}}
}
\author{
Tomasz Woźniak \email{wozniak.tom@pm.me}
}
