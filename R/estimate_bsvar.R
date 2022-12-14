
#' @title Bayesian estimation of a homoskedastic Structural Vector Autoregression via Gibbs sampler
#'
#' @description Estimates the homoskedastic SVAR using the Gibbs sampler proposed by Waggoner & Zha (2003)
#' for the structural matrix \eqn{B} and the equation-by-equation sampler by Chan, Koop, & Yu (2021)
#' for the autoregressive slope parameters \eqn{A}. Additionally, the parameter matrices \eqn{A} and \eqn{B}
#' follow a Minnesota prior and generalised-normal prior distributions respectively with the matrix-specific
#' overall shrinkage parameters estimated using a 3-level hierarchical prior distribution. 
#' See section \bold{Details} for the model equations.
#' 
#' @details 
#' The homoskedastic SVAR model is given by the reduced form equation:
#' \deqn{Y = AX + E}
#' where \eqn{Y} is an \code{NxT} matrix of dependent variables, \eqn{X} is a \code{KxT} matrix of explanatory variables, 
#' \eqn{E} is an \code{NxT} matrix of reduced form error terms, and \eqn{A} is an \code{NxK} matrix of autoregressive slope coefficients and parameters on deterministic terms in \eqn{X}.
#' 
#' The structural equation is given by
#' \deqn{BE = U}
#' where \eqn{U} is an \code{NxT} matrix of structural form error terms, and
#' \eqn{B} is an \code{NxN} matrix of contemporaneous relationships.
#' 
#' Finally, the structural shocks, \code{U}, are temporally and contemporaneously independent and jointly normally distributed with zero mean and unit variances.
#' 
#' @param S a positive integer, the number of posterior draws to be generated
#' @param specification an object of class BSVAR generated using the \code{specify_bsvar$new()} function.
#' @param thin a positive integer, specifying the frequency of MCMC output thinning
#' @param show_progress a logical value, if \code{TRUE} the estimation progress bar is visible
#' 
#' @return An object of class PosteriorBSVAR containing the Bayesian estimation output and containing two elements:
#' 
#'  \code{posterior} a list with a collection of \code{S} draws from the posterior distribution generated via Gibbs sampler containing:
#'  \describe{
#'  \item{A}{an \code{NxKxS} array with the posterior draws for matrix \eqn{A}}
#'  \item{B}{an \code{NxNxS} array with the posterior draws for matrix \eqn{B}}
#'  \item{hyper}{a \code{5xS} matrix with the posterior draws for the hyper-parameters of the hierarchical prior distribution}
#' }
#' 
#' \code{last_draw} an object of class BSVAR with the last draw of the current MCMC run as the starting value to be passed to the continuation of the MCMC estimation using \code{bsvar()}. 
#'
#' @seealso \code{\link{specify_bsvar}}, \code{\link{specify_posterior_bsvar}}, \code{\link{normalise_posterior}}
#'
#' @author Tomasz Wo??niak \email{wozniak.tom@pm.me}
#' 
#' @references Sampling from the generalised-normal full conditional posterior distribution of matrix \eqn{B} is implemented using the Gibbs sampler by:
#' 
#' Waggoner, D.F., and Zha, T., (2003) A Gibbs sampler for structural vector autoregressions. \emph{Journal of Economic Dynamics and Control}, \bold{28}, 349--366, \doi{https://doi.org/10.1016/S0165-1889(02)00168-9}.
#'
#' Sampling from the multivariate normal full conditional posterior distribution of each of the \eqn{A} matrix row is implemented using the sampler by:
#' 
#' Chan, J.C.C., Koop, G, and Yu, X. (2021) Large Order-Invariant Bayesian VARs with Stochastic Volatility.
#' 
#' @examples
#' # upload data
#' data(us_fiscal_lsuw)
#' 
#' # specify the model and set seed
#' specification  = specify_bsvar$new(us_fiscal_lsuw, p = 4)
#' set.seed(123)
#' 
#' # run the burn-in
#' burn_in        = estimate_bsvar(50, specification)
#' 
#' # estimate the model
#' posterior      = estimate_bsvar(100, burn_in$get_last_draw())
#' 
#' @export
estimate_bsvar <- function(S, specification, thin = 10, show_progress = TRUE) {
  
  stopifnot("Argument S must be a positive integer number." = S > 1 & S %% 1 == 0)
  stopifnot("Argument specification must be of class BSVAR generated using the specify_bsvar$new() function." = any(class(specification) == "BSVAR"))
  stopifnot("Argument thin must be a positive integer number." = thin > 0 & thin %% 1 == 0)
  
  prior               = specification$prior$get_prior()
  starting_values     = specification$starting_values$get_starting_values()
  VB                  = specification$identification$get_identification()
  data_matrices       = specification$data_matrices$get_data_matrices()

  qqq                 = .Call(`_bsvars_bsvar_cpp`, S, data_matrices$Y, data_matrices$X, VB, prior, starting_values, thin, show_progress)
 
  specification$starting_values$set_starting_values(qqq$last_draw)
  output              = specify_posterior_bsvar$new(specification, qqq$posterior)
   
  return(output)
}