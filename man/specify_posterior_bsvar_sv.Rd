% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/specify_bsvar_sv.R
\name{specify_posterior_bsvar_sv}
\alias{specify_posterior_bsvar_sv}
\title{R6 Class Representing PosteriorBSVAR-SV}
\description{
The class PosteriorBSVAR-SV contains posterior output and the specification including 
the last MCMC draw for the bsvar model with Stochastic Volatility heteroskedasticity.
Note that due to the thinning of the MCMC output the starting value in element \code{last_draw}
might not be equal to the last draw provided in element \code{posterior}.
}
\examples{
# This is a function that is used within estimate_bsvar()
data(us_fiscal_lsuw)
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)
set.seed(123)
estimate       = estimate_bsvar_sv(10, specification)
class(estimate)


## ------------------------------------------------
## Method `specify_posterior_bsvar_sv$get_posterior`
## ------------------------------------------------

data(us_fiscal_lsuw)
specification  = specify_bsvar_sv$new(us_fiscal_lsuw)
set.seed(123)
estimate       = estimate_bsvar_sv(10, specification)
estimate$get_posterior()


## ------------------------------------------------
## Method `specify_posterior_bsvar_sv$get_last_draw`
## ------------------------------------------------

data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)
set.seed(123)

# run the burn-in
burn_in        = estimate_bsvar_sv(10, specification)

# get the last draw
last_draw      = burn_in$get_last_draw()

# estimate the model
posterior      = estimate_bsvar_sv(10, last_draw)


## ------------------------------------------------
## Method `specify_posterior_bsvar_sv$is_normalised`
## ------------------------------------------------

# upload data
data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)

# estimate the model
set.seed(123)
posterior      = estimate_bsvar_sv(10, specification, thin = 1)

# check normalisation status beforehand
posterior$is_normalised()

# normalise the posterior
BB            = posterior$last_draw$starting_values$B      # get the last draw of B
B_hat         = diag(sign(diag(BB))) \%*\% BB                # set positive diagonal elements
bsvars::normalise_posterior(posterior, B_hat)              # draws in posterior are normalised

# check normalisation status afterwards
posterior$is_normalised()


## ------------------------------------------------
## Method `specify_posterior_bsvar_sv$set_normalised`
## ------------------------------------------------

# This is an internal function that is run while executing normalise_posterior()
# Observe its working by analysing the workflow:

# upload data
data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)

# estimate the model
set.seed(123)
posterior      = estimate_bsvar_sv(10, specification, thin = 1)

# check normalisation status beforehand
posterior$is_normalised()

# normalise the posterior
BB            = posterior$last_draw$starting_values$B      # get the last draw of B
B_hat         = diag(sign(diag(BB))) \%*\% BB                # set positive diagonal elements
bsvars::normalise_posterior(posterior, B_hat)              # draws in posterior are normalised

# check normalisation status afterwards
posterior$is_normalised()

}
\seealso{
\code{\link{estimate_bsvar_sv}}, \code{\link{specify_bsvar_sv}}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{last_draw}}{an object of class BSVAR-SV with the last draw of the current MCMC run as the starting value to be passed to the continuation of the MCMC estimation using \code{bsvar_sv()}.}

\item{\code{posterior}}{a list containing Bayesian estimation output.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-PosteriorBSVAR-SV-new}{\code{specify_posterior_bsvar_sv$new()}}
\item \href{#method-PosteriorBSVAR-SV-get_posterior}{\code{specify_posterior_bsvar_sv$get_posterior()}}
\item \href{#method-PosteriorBSVAR-SV-get_last_draw}{\code{specify_posterior_bsvar_sv$get_last_draw()}}
\item \href{#method-PosteriorBSVAR-SV-is_normalised}{\code{specify_posterior_bsvar_sv$is_normalised()}}
\item \href{#method-PosteriorBSVAR-SV-set_normalised}{\code{specify_posterior_bsvar_sv$set_normalised()}}
\item \href{#method-PosteriorBSVAR-SV-clone}{\code{specify_posterior_bsvar_sv$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-new"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-new}{}}}
\subsection{Method \code{new()}}{
Create a new posterior output PosteriorBSVAR-SV.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$new(specification_bsvar, posterior_bsvar)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{specification_bsvar}}{an object of class BSVAR-SV with the last draw of the current MCMC run as the starting value.}

\item{\code{posterior_bsvar}}{a list containing Bayesian estimation output.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A posterior output PosteriorBSVAR-SV.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-get_posterior"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-get_posterior}{}}}
\subsection{Method \code{get_posterior()}}{
Returns a list containing Bayesian estimation.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$get_posterior()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{data(us_fiscal_lsuw)
specification  = specify_bsvar_sv$new(us_fiscal_lsuw)
set.seed(123)
estimate       = estimate_bsvar_sv(10, specification)
estimate$get_posterior()

}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-get_last_draw"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-get_last_draw}{}}}
\subsection{Method \code{get_last_draw()}}{
Returns an object of class BSVAR-SV with the last draw of the current MCMC run as the starting value to be passed to the continuation of the MCMC estimation using \code{bsvar_sv()}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$get_last_draw()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)
set.seed(123)

# run the burn-in
burn_in        = estimate_bsvar_sv(10, specification)

# get the last draw
last_draw      = burn_in$get_last_draw()

# estimate the model
posterior      = estimate_bsvar_sv(10, last_draw)

}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-is_normalised"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-is_normalised}{}}}
\subsection{Method \code{is_normalised()}}{
Returns \code{TRUE} if the posterior has been normalised using \code{normalise_posterior()} and \code{FALSE} otherwise.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$is_normalised()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{# upload data
data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)

# estimate the model
set.seed(123)
posterior      = estimate_bsvar_sv(10, specification, thin = 1)

# check normalisation status beforehand
posterior$is_normalised()

# normalise the posterior
BB            = posterior$last_draw$starting_values$B      # get the last draw of B
B_hat         = diag(sign(diag(BB))) \%*\% BB                # set positive diagonal elements
bsvars::normalise_posterior(posterior, B_hat)              # draws in posterior are normalised

# check normalisation status afterwards
posterior$is_normalised()

}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-set_normalised"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-set_normalised}{}}}
\subsection{Method \code{set_normalised()}}{
Sets the private indicator \code{normalised} to TRUE.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$set_normalised(value)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{value}}{(optional) a logical value to be passed to indicator \code{normalised}.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{# This is an internal function that is run while executing normalise_posterior()
# Observe its working by analysing the workflow:

# upload data
data(us_fiscal_lsuw)

# specify the model and set seed
specification  = specify_bsvar_sv$new(us_fiscal_lsuw, p = 4)

# estimate the model
set.seed(123)
posterior      = estimate_bsvar_sv(10, specification, thin = 1)

# check normalisation status beforehand
posterior$is_normalised()

# normalise the posterior
BB            = posterior$last_draw$starting_values$B      # get the last draw of B
B_hat         = diag(sign(diag(BB))) \%*\% BB                # set positive diagonal elements
bsvars::normalise_posterior(posterior, B_hat)              # draws in posterior are normalised

# check normalisation status afterwards
posterior$is_normalised()

}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PosteriorBSVAR-SV-clone"></a>}}
\if{latex}{\out{\hypertarget{method-PosteriorBSVAR-SV-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_posterior_bsvar_sv$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
