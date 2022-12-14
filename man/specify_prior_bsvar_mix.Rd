% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/specify_bsvar_mix.R
\name{specify_prior_bsvar_mix}
\alias{specify_prior_bsvar_mix}
\title{R6 Class Representing PriorBSVAR-MIX}
\description{
The class PriorBSVAR-MIX presents a prior specification for the bsvar model with a zero-mean mixture of normals model for structural shocks.
}
\examples{
prior = specify_prior_bsvar_mix$new(N = 3, p = 1, M = 2)  # specify the prior
prior$A                                        # show autoregressive prior mean

}
\section{Super classes}{
\code{bsvars::PriorBSVAR} -> \code{bsvars::PriorBSVAR-MSH} -> \code{PriorBSVAR-MIX}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{A}}{an \code{NxK} matrix, the mean of the normal prior distribution for the parameter matrix \eqn{A}.}

\item{\code{A_V_inv}}{a \code{KxK} precision matrix of the normal prior distribution for each of the row of the parameter matrix \eqn{A}. This precision matrix is equation invariant.}

\item{\code{B_V_inv}}{an \code{NxN} precision matrix of the generalised-normal prior distribution for the structural matrix \eqn{B}. This precision matrix is equation invariant.}

\item{\code{B_nu}}{a positive integer greater of equal than \code{N}, a shape parameter of the generalised-normal prior distribution for the structural matrix \eqn{B}.}

\item{\code{hyper_nu}}{a positive scalar, the shape parameter of the inverted-gamma 2 prior distribution for the two overall shrinkage parameters for matrices \eqn{B} and \eqn{A}.}

\item{\code{hyper_a}}{a positive scalar, the shape parameter of the gamma prior for the two overall shrinkage parameters.}

\item{\code{hyper_V}}{a positive scalar,  the shape parameter of the inverted-gamma 2 for the level 3 hierarchy of shrinkage parameters.}

\item{\code{hyper_S}}{a positive scalar,  the scale parameter of the inverted-gamma 2 for the level 3 hierarchy of shrinkage parameters.}

\item{\code{sigma_nu}}{a positive scalar,  the shape parameter of the inverted-gamma 2 for mixture component-dependent variances of the structural shocks, \eqn{\sigma^2_{n.s_t}}.}

\item{\code{sigma_s}}{a positive scalar,  the scale parameter of the inverted-gamma 2 for mixture component-dependent variances of the structural shocks, \eqn{\sigma^2_{n.s_t}}.}

\item{\code{PR_TR}}{an \code{MxM} matrix, the matrix of hyper-parameters of the row-specific Dirichlet prior distribution for the state probabilities the Markov process \eqn{s_t}. Its rows must be identical.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-PriorBSVAR-MIX-clone}{\code{specify_prior_bsvar_mix$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="bsvars" data-topic="PriorBSVAR-MSH" data-id="get_prior"><a href='../../bsvars/html/PriorBSVAR-MSH.html#method-PriorBSVAR-MSH-get_prior'><code>bsvars::PriorBSVAR-MSH$get_prior()</code></a></span></li>
<li><span class="pkg-link" data-pkg="bsvars" data-topic="PriorBSVAR-MSH" data-id="initialize"><a href='../../bsvars/html/PriorBSVAR-MSH.html#method-PriorBSVAR-MSH-initialize'><code>bsvars::PriorBSVAR-MSH$initialize()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-PriorBSVAR-MIX-clone"></a>}}
\if{latex}{\out{\hypertarget{method-PriorBSVAR-MIX-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{specify_prior_bsvar_mix$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
