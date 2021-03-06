% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webservice-aks.R
\name{aks_webservice_deployment_config}
\alias{aks_webservice_deployment_config}
\title{Create a deployment config for deploying an AKS web service}
\usage{
aks_webservice_deployment_config(autoscale_enabled = NULL,
  autoscale_min_replicas = NULL, autoscale_max_replicas = NULL,
  autoscale_refresh_seconds = NULL,
  autoscale_target_utilization = NULL, auth_enabled = NULL,
  cpu_cores = NULL, memory_gb = NULL, enable_app_insights = NULL,
  scoring_timeout_ms = NULL, replica_max_concurrent_requests = NULL,
  max_request_wait_time = NULL, num_replicas = NULL,
  primary_key = NULL, secondary_key = NULL, tags = NULL,
  properties = NULL, description = NULL, gpu_cores = NULL,
  period_seconds = NULL, initial_delay_seconds = NULL,
  timeout_seconds = NULL, success_threshold = NULL,
  failure_threshold = NULL, namespace = NULL,
  token_auth_enabled = NULL)
}
\arguments{
\item{autoscale_enabled}{If \code{TRUE} enable autoscaling for the web service.
Defaults to \code{TRUE} if \code{num_replicas = NULL}.}

\item{autoscale_min_replicas}{An int of the minimum number of containers
to use when autoscaling the web service. Defaults to \code{1}.}

\item{autoscale_max_replicas}{An int of the maximum number of containers
to use when autoscaling the web service. Defaults to \code{10}.}

\item{autoscale_refresh_seconds}{An int of how often in seconds the
autoscaler should attempt to scale the web service. Defaults to \code{1}.}

\item{autoscale_target_utilization}{An int of the target utilization
(in percent out of 100) the autoscaler should attempt to maintain for
the web service. Defaults to \code{70}.}

\item{auth_enabled}{If \code{TRUE} enable key-based authentication for the
web service. Defaults to \code{TRUE}.}

\item{cpu_cores}{The number of cpu cores to allocate for
the web service. Can be a decimal. Defaults to \code{0.1}.}

\item{memory_gb}{The amount of memory (in GB) to allocate for
the web service. Can be a decimal. Defaults to \code{0.5}.}

\item{enable_app_insights}{If \code{TRUE} enable AppInsights for the web service.
Defaults to \code{FALSE}.}

\item{scoring_timeout_ms}{An int of the timeout (in milliseconds) to
enforce for scoring calls to the web service. Defaults to \code{60000}.}

\item{replica_max_concurrent_requests}{An int of the number of maximum
concurrent requests per node to allow for the web service. Defaults to \code{1}.}

\item{max_request_wait_time}{An int of the maximum amount of time a request
will stay in the queue (in milliseconds) before returning a 503 error.
Defaults to \code{500}.}

\item{num_replicas}{An int of the number of containers to allocate for the
web service. If this parameter is not set then the autoscaler is enabled by
default.}

\item{primary_key}{A string of the primary auth key to use for the web service.}

\item{secondary_key}{A string of the secondary auth key to use for the web
service.}

\item{tags}{A named list of key-value tags for the web service,
e.g. \code{list("key" = "value")}.}

\item{properties}{A named list of key-value properties for the web
service, e.g. \code{list("key" = "value")}. These properties cannot
be changed after deployment, but new key-value pairs can be added.}

\item{description}{A string of the description to give the web service}

\item{gpu_cores}{An int of the number of gpu cores to allocate for the
web service. Defaults to \code{1}.}

\item{period_seconds}{An int of how often in seconds to perform the
liveness probe. Default to \code{10}. Minimum value is \code{1}.}

\item{initial_delay_seconds}{An int of the number of seconds after
the container has started before liveness probes are initiated.
Defaults to \code{310}.}

\item{timeout_seconds}{An int of the number of seconds after which the
liveness probe times out. Defaults to \code{2}. Minimum value is \code{1}.}

\item{success_threshold}{An int of the minimum consecutive successes
for the liveness probe to be considered successful after having failed.
Defaults to \code{1}. Minimum value is \code{1}.}

\item{failure_threshold}{An int of the number of times Kubernetes will try
the liveness probe when a Pod starts and the probe fails, before giving up.
Defaults to \code{3}. Minimum value is \code{1}.}

\item{namespace}{A string of the Kubernetes namespace in which to deploy the web service:
up to 63 lowercase alphanumeric ('a'-'z', '0'-'9') and hyphen ('-') characters. The first
last characters cannot be hyphens.}

\item{token_auth_enabled}{If \code{TRUE}, enable token-based authentication for the web service.
If enabled, users can access the web service by fetching an access token using their Azure
Active Directory credentials. Defaults to \code{FALSE}. Both \code{token_auth_enabled} and
\code{auth_enabled} cannot be set to \code{TRUE}.}
}
\value{
The \code{AksServiceDeploymentConfiguration} object.
}
\description{
Deploy a web service to Azure Kubernetes Service for high-scale
prodution deployments. Provides fast response time and autoscaling
of the deployed service. Using GPU for inference when deployed as a
web service is only supported on AKS.

Deploy to AKS if you need one or more of the following capabilities:
\itemize{
\item Fast response time
\item Autoscaling of the deployed service
\item Hardware acceleration options
}
}
\details{
\subsection{AKS compute target}{
When deploying to AKS, you deploy to an AKS cluster that is connected to your workspace.
There are two ways to connect an AKS cluster to your workspace:
\itemize{
\item Create the AKS cluster using Azure ML (see \code{create_aks_compute()}).
\item Attach an existing AKS cluster to your workspace (see \code{attach_aks_compute()}).
}

Pass the \code{AksCompute} object to the \code{deployment_target} parameter of \code{deploy_model()}.
}
\subsection{Token-based authentication}{
We strongly recommend that you create your Azure ML workspace in the same region as your
AKS cluster. To authenticate with a token, the web service will make a call to the region
in which your workspace is created. If your workspace's region is unavailable, then you will
not be able to fetch a token for your web service, even if your cluster is in a different region
than your workspace. This effectively results in token-based auth being unavailable until your
workspace's region is available again. In addition, the greater the distance between your
cluster's region and your workspace's region, the longer it will take to fetch a token.
}
}
\examples{
\dontrun{
deployment_config <- aks_webservice_deployment_config(cpu_cores = 1, memory_gb = 1)
}
}
\seealso{
\code{deploy_model()}
}
