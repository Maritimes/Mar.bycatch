#' @title fleet_snowcrab
#' @description This is a wrapper function that facilitates extracting information for the snowcrab fleet.
#' All of the information used to identify fleets is stored in the package's associated data files -
#' LIC_CORE, LIC_AREAS, and LIC_GEAR_SPEC.  The various wrappers can have different options (e.g.
#' MOBILE vs FIXED, WESTERN vs EASTERN, 4XY vs 5ZJM, small mesh vs large mesh, diamond vs square
#' mesh, etc), and depending on which options are selected, different fleets are identified, and
#' their data is extracted.
#' @param marfGear default is \code{c(62)}. This is a vector of MARFIS gear codes known to have caught
#' this species. The default values can be replaced with a smaller selection to only return information
#' for a gear-specific subset of fishing activity.
#' @inherit set_defaults params
#' @inheritDotParams set_defaults -lics -gearSpecs -area
#' @examples \dontrun{
#' db <- fleet_snowcrab(year = 2018,
#'                     useLocal = F,
#'                     oracle.username = "<name>",
#'                     oracle.password="<password>",
#'                     oracle.dsn="PTRAN",
#'                     usepkg = "roracle"
#'                     )
#' local <- fleet_snowcrab(year = 2018,
#'                        useLocal = T,
#'                        data.dir = "c:/data_folder"
#'                       )
#'                        }
#' @family fleets
#' @inherit fleet_ return
#' @author  Mike McMahon, \email{Mike.McMahon@@dfo-mpo.gc.ca}
#' @note Hardcoded parameters for this fleet are as follows:
#' \itemize{
#'   \item \code{marfSpp} = 705
#'   \item \code{isdbSpp} = 2526
#'   \item \code{tripcd_id} = c(2509, 7061,7064)
#'   \item \code{fleet} = "SNOWCRAB"
#'   \item \code{areaFile} = "Areas_Snowcrab_sf"
#' }
#' @inherit fleet_ details
#' @export
fleet_snowcrab<- function(marfGear = c(62), useLocal = NULL, ...){

  message("This wrapper has never been QC'd")
  if(!paramOK(useLocal = useLocal, p=list(...))) stop("Please provide additional parameters as directed above")
  data <- fleet_(fleet = "SNOWCRAB", marfSpp = 705, marfGear = marfGear, isdbSpp = 2526, tripcd_id = c(2509, 7061,7064), areaFile = "Areas_Snowcrab_sf", useLocal = useLocal,...)
  return(data)
}
